Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B415C1E5F8B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 14:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeHG7-0001Ls-F4; Thu, 28 May 2020 12:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeHG6-0001Lh-58
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 12:03:38 +0000
X-Inumbo-ID: 43070c50-a0db-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43070c50-a0db-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 12:03:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12E23ADCF;
 Thu, 28 May 2020 12:03:35 +0000 (UTC)
Subject: Re: [PATCH v2 04/14] x86/traps: Implement #CP handler and extend #PF
 for shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <424dc7f2-d999-19e1-42ad-226cf22783eb@suse.com>
Date: Thu, 28 May 2020 14:03:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-5-andrew.cooper3@citrix.com>
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
> For now, any #CP exception or shadow stack #PF indicate a bug in Xen, but
> attempt to recover from #CP if taken in guest context.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one more question and a suggestion:

> @@ -1445,8 +1447,10 @@ void do_page_fault(struct cpu_user_regs *regs)
>       *
>       * Anything remaining is an error, constituting corruption of the
>       * pagetables and probably an L1TF vulnerable gadget.
> +     *
> +     * Any shadow stack access fault is a bug in Xen.
>       */
> -    if ( error_code & PFEC_reserved_bit )
> +    if ( error_code & (PFEC_reserved_bit | PFEC_shstk) )
>          goto fatal;

Wouldn't you saying "any" imply putting this new check higher up, in
particular ahead of the call to fixup_page_fault()?

> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>          entrypoint 1b
>  
>          /* Reserved exceptions, heading towards do_reserved_trap(). */
> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
> +        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
> +                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)

Adding yet another || here adds to the fragility of the entire
construct. Wouldn't it be better to implement do_entry_VE at
this occasion, even its handling continues to end up in
do_reserved_trap()? This would have the benefit of avoiding the
pointless checking of %spl first thing in its handling. Feel
free to keep the R-b if you decide to go this route.

Jan

