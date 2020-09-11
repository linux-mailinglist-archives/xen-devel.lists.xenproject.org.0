Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9C265CCF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 11:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGfgJ-00068n-8x; Fri, 11 Sep 2020 09:49:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGfgI-00068i-Kq
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 09:49:22 +0000
X-Inumbo-ID: 80ba6bac-ea88-4280-8390-b4a14ef219d7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ba6bac-ea88-4280-8390-b4a14ef219d7;
 Fri, 11 Sep 2020 09:49:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB890ADE0;
 Fri, 11 Sep 2020 09:49:35 +0000 (UTC)
Subject: Re: [PATCH 4/5] x86/pv: Optimise to the segment context switching
 paths
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34206c45-5dfb-a3de-716a-5365db3be1c5@suse.com>
Date: Fri, 11 Sep 2020 11:49:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909095920.25495-5-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.09.2020 11:59, Andrew Cooper wrote:
> Save the segment selectors with explicit asm, rather than with read_sreg().
> This permits the use of MOV's m16 encoding, which avoids indirecting the
> selector value through a register.

Instead of this, how about making read_sreg() look like

#define read_sreg(val, name) ({                                  \
    if ( sizeof(val) == 2 )                                      \
        asm volatile ( "mov %%" STR(name) ",%0" : "=m" (val) );  \
    else                                                         \
        asm volatile ( "mov %%" STR(name) ",%k0" : "=r" (val) ); \
})

which then also covers read_registers()? I have a full patch
ready to send, if you agree.

> For {save,load}_segments(), opencode the fs/gs helpers, as the optimiser is
> unable to rearrange the logic down to a single X86_CR4_FSGSBASE check.  This
> removes several jumps and creates bigger basic blocks.
> 
> In load_segments(), optimise GS base handling substantially.  The call to
> svm_load_segs() already needs gsb/gss the correct way around, so hoist the
> logic for the later path to use it as well.  Swapping the inputs in GPRs is
> far more efficient than using SWAPGS.
> 
> Previously, there was optionally one SWAPGS from the user/kernel mode check,
> two SWAPGS's in write_gs_shadow() and two WRGSBASE's.  Updates to GS (4 or 5
> here) in quick succession stall all contemporary pipelines repeatedly.  (Intel
> Core/Xeon pipelines have segment register renaming[1], so can continue to
> speculatively execute with one GS update in flight.  Other pipelines cannot
> have two updates in flight concurrently, and must stall dispatch of the second
> until the first has retired.)
> 
> Rewrite the logic to have exactly two WRGSBASEs and one SWAPGS, which removes
> two stalles all contemporary processors.
> 
> Although modest, the resulting delta is:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-106 (-106)
>   Function                                     old     new   delta
>   paravirt_ctxt_switch_from                    235     198     -37
>   context_switch                              3582    3513     -69
> 
> in a common path.
> 
> [1] https://software.intel.com/security-software-guidance/insights/deep-dive-intel-analysis-speculative-behavior-swapgs-and-segment-registers
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably re-based onto said change, and maybe with another adjustment
(see below)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -1556,18 +1557,24 @@ static void load_segments(struct vcpu *n)
>                     : [ok] "+r" (all_segs_okay)          \
>                     : [_val] "rm" (val) )
>  
> -#ifdef CONFIG_HVM
> -    if ( cpu_has_svm && !compat && (uregs->fs | uregs->gs) <= 3 )
> +    if ( !compat )
>      {
> -        unsigned long gsb = n->arch.flags & TF_kernel_mode
> -            ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
> -        unsigned long gss = n->arch.flags & TF_kernel_mode
> -            ? n->arch.pv.gs_base_user : n->arch.pv.gs_base_kernel;
> +        gsb = n->arch.pv.gs_base_kernel;
> +        gss = n->arch.pv.gs_base_user;
> +
> +        /*
> +         * Figure out which way around gsb/gss want to be.  gsb needs to be
> +         * the active context, and gss needs to be the inactive context.
> +         */
> +        if ( !(n->arch.flags & TF_kernel_mode) )
> +            SWAP(gsb, gss);
>  
> -        fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
> -                                   n->arch.pv.fs_base, gsb, gss);
> +        if ( IS_ENABLED(CONFIG_HVM) && cpu_has_svm &&

The change from #ifdef to IS_ENABLED() wants mirroring to the
prefetching site imo. I wonder though whether the adjustment is a
good idea: The declaration lives in svm.h, and I would view it as
quite reasonable for that header to not get included in !HVM builds
(there may be a lot of disentangling to do to get there, but still).

Jan

