Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E3C1E5C64
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeFB7-0006ZP-NZ; Thu, 28 May 2020 09:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeFB5-0006ZF-UH
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:50:19 +0000
X-Inumbo-ID: a398dfde-a0c8-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a398dfde-a0c8-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 09:50:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A87A7AD3A;
 Thu, 28 May 2020 09:50:17 +0000 (UTC)
Subject: Re: [PATCH v2 02/14] x86/traps: Factor out extable_fixup() and make
 printing consistent
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9cb12ae3-ef09-3b81-caef-0b1d61426a42@suse.com>
Date: Thu, 28 May 2020 11:50:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-3-andrew.cooper3@citrix.com>
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

On 27.05.2020 21:18, Andrew Cooper wrote:
> UD faults never had any diagnostics printed, and the others were inconsistent.
> 
> Don't use dprintk() because identifying traps.c is actively unhelpful in the
> message, as it is the location of the fixup, not the fault.  Use the new
> vec_name() infrastructure, rather than leaving raw numbers for the log.
> 
>   (XEN) Running stub recovery selftests...
>   (XEN) Fixup #UD[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
>   (XEN) Fixup #GP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6
>   (XEN) Fixup #SS[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
>   (XEN) Fixup #BP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

As before
Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I realize I have one more suggestion:

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -772,10 +772,31 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>            trapnr, vec_name(trapnr), regs->error_code);
>  }
>  
> +static bool extable_fixup(struct cpu_user_regs *regs, bool print)
> +{
> +    unsigned long fixup = search_exception_table(regs);
> +
> +    if ( unlikely(fixup == 0) )
> +        return false;
> +
> +    /*
> +     * Don't use dprintk() because the __FILE__ reference is unhelpful.
> +     * Can currently be triggered by guests.  Make sure we ratelimit.
> +     */
> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )

How about pulling the IS_ENABLED(CONFIG_DEBUG) into the call sites
currently passing "true"?

Jan

