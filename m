Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5D1DE84C
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:51:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc84p-0008GB-Mq; Fri, 22 May 2020 13:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc84o-0008G6-10
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:51:06 +0000
X-Inumbo-ID: 47bc7a0c-9c33-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47bc7a0c-9c33-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 13:51:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00F20B00E;
 Fri, 22 May 2020 13:51:06 +0000 (UTC)
Subject: Re: [PATCH v2] x86/traps: Rework #PF[Rsvd] bit handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <20200521154306.29019-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b99da362-202f-07f2-d3bb-fe2ca82a44ab@suse.com>
Date: Fri, 22 May 2020 15:51:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521154306.29019-1-andrew.cooper3@citrix.com>
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

On 21.05.2020 17:43, Andrew Cooper wrote:
> @@ -1439,6 +1418,21 @@ void do_page_fault(struct cpu_user_regs *regs)
>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>          return;
>  
> +    /*
> +     * Xen doesn't have reserved bits set in its pagetables, nor do we permit
> +     * PV guests to write any.  Such entries would generally be vulnerable to
> +     * the L1TF sidechannel.
> +     *
> +     * The shadow pagetable logic may use reserved bits as part of
> +     * SHOPT_FAST_FAULT_PATH.  Pagefaults arising from these will be resolved
> +     * via the fixup_page_fault() path.
> +     *
> +     * Anything remaining is an error, constituting corruption of the
> +     * pagetables and probably an L1TF vulnerable gadget.
> +     */
> +    if ( error_code & PFEC_reserved_bit )
> +        goto fatal;
> +
>      if ( unlikely(!guest_mode(regs)) )
>      {
>          enum pf_type pf_type = spurious_page_fault(addr, regs);
> @@ -1457,13 +1451,12 @@ void do_page_fault(struct cpu_user_regs *regs)
>          if ( likely((fixup = search_exception_table(regs)) != 0) )

While I continue to not fully agree with not trying to fix up such
faults if the fault location has recovery code attached, I realize
that we're not going to reach agreement here, so somewhat hesitantly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

