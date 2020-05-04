Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6091C3B1B
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 15:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVb0z-00054e-Jl; Mon, 04 May 2020 13:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVb0y-00054Z-FU
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 13:20:08 +0000
X-Inumbo-ID: f7bf6654-8e09-11ea-9d1f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7bf6654-8e09-11ea-9d1f-12813bfff9fa;
 Mon, 04 May 2020 13:20:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33593AEA1;
 Mon,  4 May 2020 13:20:06 +0000 (UTC)
Subject: Re: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
Date: Mon, 4 May 2020 15:20:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>            trapnr, vec_name(trapnr), regs->error_code);
>  }
>  
> +static bool exception_fixup(struct cpu_user_regs *regs, bool print)
> +{
> +    unsigned long fixup = search_exception_table(regs);
> +
> +    if ( unlikely(fixup == 0) )
> +        return false;
> +
> +    /* Can currently be triggered by guests.  Make sure we ratelimit. */
> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )

I didn't think we consider dprintk()-s a possible security issue.
Why would we consider so a printk() hidden behind
IS_ENABLED(CONFIG_DEBUG)? IOW I think one of XENLOG_GUEST and
IS_ENABLED(CONFIG_DEBUG) wants dropping.

> @@ -1466,12 +1468,11 @@ void do_page_fault(struct cpu_user_regs *regs)
>          if ( pf_type != real_fault )
>              return;
>  
> -        if ( likely((fixup = search_exception_table(regs)) != 0) )
> +        if ( likely(exception_fixup(regs, false)) )
>          {
>              perfc_incr(copy_user_faults);
>              if ( unlikely(regs->error_code & PFEC_reserved_bit) )
>                  reserved_bit_page_fault(addr, regs);
> -            regs->rip = fixup;

I'm afraid this modification can't validly be pulled ahead -
show_execution_state(), as called from reserved_bit_page_fault(),
wants to / should print the original RIP, not the fixed up one.

Jan

