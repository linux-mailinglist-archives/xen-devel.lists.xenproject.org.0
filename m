Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB88B6A0E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 07:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714513.1115787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1gPH-0007zs-DH; Tue, 30 Apr 2024 05:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714513.1115787; Tue, 30 Apr 2024 05:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1gPH-0007x3-9x; Tue, 30 Apr 2024 05:51:59 +0000
Received: by outflank-mailman (input) for mailman id 714513;
 Tue, 30 Apr 2024 05:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVqB=MD=bounce.vates.tech=bounce-md_30504962.663086f8.v1-ac1234db8c084a309a62252f90d85a1e@srs-se1.protection.inumbo.net>)
 id 1s1gPF-0007wx-Di
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 05:51:57 +0000
Received: from mail137-27.atl71.mandrillapp.com
 (mail137-27.atl71.mandrillapp.com [198.2.137.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1c69d6-06b5-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 07:51:54 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-27.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4VT8Th4mXWz4f3kCG
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:51:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ac1234db8c084a309a62252f90d85a1e; Tue, 30 Apr 2024 05:51:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bf1c69d6-06b5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1714456312; x=1714716812;
	bh=OWGfq9u/aSjVNXNNgZ3jX7JsCqTtJkaeXyykBEdxLJM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZISbQbJ0xvsYkj3Yk3EHDJNsZUzzr8RLtVcQgTytbKWxzemesUMVZhD4kDAY4c6Bj
	 U+TjgeeujrfqMpPmIFihk/yeY+B25IgIVL8Bp7bItZBysJ2e3DEUY/TUmFs/pug/oc
	 xYN+bc7iGNU004p9516uD3+o68yPzAIS9xxqlEdQ3/e/3mkY7LIdS6CowpxNf7ac0x
	 IfD2QtpPuh3yZGeNJyzvm/xOpRf2IANj67tX6Wwd9uKlMSI8n96B0vvMLIqYrkmllc
	 jHBpAua2WZ/K5517kmli14JnTZwcu2R/78Hy6nO20ue5dKYwVe1eRq5t7msGObhmIY
	 tNtCSbAfH/H7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1714456312; x=1714716812; i=vaishali.thakkar@vates.tech;
	bh=OWGfq9u/aSjVNXNNgZ3jX7JsCqTtJkaeXyykBEdxLJM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AhrQkwVDwQsUVTXSbda/bmVb2LZ1M9LxvUVEQ/CrLTkqIbw0rGjpPDkEepviYgGOn
	 uuwyK6IJCWHoisty43Rgn7tESRNmTcl0jPIvJCFHrbZESuO4JL3Cxlib7no0qzD45Z
	 qdkcYoPHnWSy2iJQcNJr2iLhr42b/aIlHnVOg8ZSQsm8YsNYMEX9WMujIXgkg9TrFS
	 iCA+iCtYe0tp1LQnq4MvT4gFgtRUxHV1+//mS0aHwupx5NuhldgUJ0gzvYPvQU4ZiM
	 pnbCsylFs8deFkbW+eVYImUmTsjQpRZ7w5RRv2BR48CcsssFXC1PQZ7v93iqV11lpf
	 iBVOlsuJVVZiA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/5]=20x86/svm:=20Switch=20SVM=20features=20over=20normal=20cpu=5Fhas=5F*?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1714456310662
Message-Id: <b0a5506f-401e-4f28-97f0-e32e08b6a962@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, George Dunlap <george.dunlap@citrix.com>, Andrei Semenov <andrei.semenov@vates.fr>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com> <20240429151625.977884-5-andrew.cooper3@citrix.com>
In-Reply-To: <20240429151625.977884-5-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ac1234db8c084a309a62252f90d85a1e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240430:md
Date: Tue, 30 Apr 2024 05:51:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/29/24 5:16 PM, Andrew Cooper wrote:
> Delete the boot time rendering of advanced features.  It's entirely ad-ho=
c and
> not even everything printed here is used by Xen.  It is available in
> `xen-cpuid` now.
> 
> With (only) svm_load_segs_{,prefetch}() declared now in svm.h, only svm.c=
 and
> domain.c which need the header.  Clean up all others.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Andrei Semenov <andrei.semenov@vates.fr>
> CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> ---
>   xen/arch/x86/hvm/svm/asid.c            |  5 ++-
>   xen/arch/x86/hvm/svm/emulate.c         |  3 +-
>   xen/arch/x86/hvm/svm/intr.c            |  1 -
>   xen/arch/x86/hvm/svm/nestedsvm.c       | 14 ++++----
>   xen/arch/x86/hvm/svm/svm.c             | 50 +++++++-------------------
>   xen/arch/x86/hvm/svm/vmcb.c            |  1 -
>   xen/arch/x86/include/asm/cpufeature.h  | 10 ++++++
>   xen/arch/x86/include/asm/hvm/svm/svm.h | 36 -------------------
>   8 files changed, 31 insertions(+), 89 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
> index 7977a8e86b53..6117a362d310 100644
> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -6,7 +6,6 @@
>   
>   #include <asm/amd.h>
>   #include <asm/hvm/nestedhvm.h>
> -#include <asm/hvm/svm/svm.h>
>   
>   #include "svm.h"
>   
> @@ -39,7 +38,7 @@ void svm_asid_handle_vmrun(void)
>       {
>           vmcb_set_asid(vmcb, true);
>           vmcb->tlb_control =3D
> -            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLU=
SH_ALL;
> +            cpu_has_flush_by_asid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH=
_ALL;
>           return;
>       }
>   
> @@ -48,7 +47,7 @@ void svm_asid_handle_vmrun(void)
>   
>       vmcb->tlb_control =3D
>           !need_flush ? TLB_CTRL_NO_FLUSH :
> -        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_A=
LL;
> +        cpu_has_flush_by_asid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL=
;
>   }
>   
>   /*
> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulat=
e.c
> index 93ac1d3435f9..da6e21b2e270 100644
> --- a/xen/arch/x86/hvm/svm/emulate.c
> +++ b/xen/arch/x86/hvm/svm/emulate.c
> @@ -11,7 +11,6 @@
>   #include <asm/msr.h>
>   #include <asm/hvm/emulate.h>
>   #include <asm/hvm/hvm.h>
> -#include <asm/hvm/svm/svm.h>
>   #include <asm/hvm/svm/vmcb.h>
>   
>   #include "svm.h"
> @@ -20,7 +19,7 @@ static unsigned long svm_nextrip_insn_length(struct vcp=
u *v)
>   {
>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>   
> -    if ( !cpu_has_svm_nrips )
> +    if ( !cpu_has_nrips )
>           return 0;
>   
>   #ifndef NDEBUG
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 4805c5567213..facd2894a2c6 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -17,7 +17,6 @@
>   #include <asm/hvm/hvm.h>
>   #include <asm/hvm/io.h>
>   #include <asm/hvm/vlapic.h>
> -#include <asm/hvm/svm/svm.h>
>   #include <asm/hvm/nestedhvm.h> /* for nestedhvm_vcpu_in_guestmode */
>   #include <asm/vm_event.h>
>   #include <xen/event.h>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nest=
edsvm.c
> index 35a2cbfd7d13..255af112661f 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -6,7 +6,6 @@
>    */
>   
>   #include <asm/hvm/support.h>
> -#include <asm/hvm/svm/svm.h>
>   #include <asm/hvm/svm/vmcb.h>
>   #include <asm/hvm/nestedhvm.h>
>   #include <asm/hvm/svm/svmdebug.h>
> @@ -1620,7 +1619,7 @@ void svm_nested_features_on_efer_update(struct vcpu=
 *v)
>       {
>           if ( !vmcb->virt_ext.fields.vloadsave_enable &&
>                paging_mode_hap(v->domain) &&
> -             cpu_has_svm_vloadsave )
> +             cpu_has_v_loadsave )
>           {
>               vmcb->virt_ext.fields.vloadsave_enable =3D 1;
>               general2_intercepts  =3D vmcb_get_general2_intercepts(vmcb)=
;
> @@ -1629,8 +1628,7 @@ void svm_nested_features_on_efer_update(struct vcpu=
 *v)
>               vmcb_set_general2_intercepts(vmcb, general2_intercepts);
>           }
>   
> -        if ( !vmcb->_vintr.fields.vgif_enable &&
> -             cpu_has_svm_vgif )
> +        if ( !vmcb->_vintr.fields.vgif_enable && cpu_has_v_gif )
>           {
>               vintr =3D vmcb_get_vintr(vmcb);
>               vintr.fields.vgif =3D svm->ns_gif;
> @@ -1675,8 +1673,8 @@ void __init start_nested_svm(struct hvm_function_ta=
ble *hvm_function_table)
>        */
>       hvm_function_table->caps.nested_virt =3D
>           hvm_function_table->caps.hap &&
> -        cpu_has_svm_lbrv &&
> -        cpu_has_svm_nrips &&
> -        cpu_has_svm_flushbyasid &&
> -        cpu_has_svm_decode;
> +        cpu_has_v_lbr &&
> +        cpu_has_nrips &&
> +        cpu_has_flush_by_asid &&
> +        cpu_has_decode_assist;
>   }
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 4719fffae589..16eb875aab94 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1287,7 +1287,7 @@ static void cf_check svm_inject_event(const struct =
x86_event *event)
>        * that hardware doesn't perform DPL checking on injection.
>        */
>       if ( event->type =3D=3D X86_EVENTTYPE_PRI_SW_EXCEPTION ||
> -         (!cpu_has_svm_nrips && (event->type >=3D X86_EVENTTYPE_SW_INTER=
RUPT)) )
> +         (!cpu_has_nrips && (event->type >=3D X86_EVENTTYPE_SW_INTERRUPT=
)) )
>           svm_emul_swint_injection(&_event);
>   
>       switch ( _event.vector | -(_event.type =3D=3D X86_EVENTTYPE_SW_INTE=
RRUPT) )
> @@ -1341,7 +1341,7 @@ static void cf_check svm_inject_event(const struct =
x86_event *event)
>       switch ( _event.type )
>       {
>       case X86_EVENTTYPE_SW_INTERRUPT: /* int $n */
> -        if ( cpu_has_svm_nrips )
> +        if ( cpu_has_nrips )
>               vmcb->nextrip =3D regs->rip + _event.insn_len;
>           else
>               regs->rip +=3D _event.insn_len;
> @@ -1355,7 +1355,7 @@ static void cf_check svm_inject_event(const struct =
x86_event *event)
>            * semantics.
>            */
>           regs->rip +=3D _event.insn_len;
> -        if ( cpu_has_svm_nrips )
> +        if ( cpu_has_nrips )
>               vmcb->nextrip =3D regs->rip;
>           eventinj.type =3D X86_EVENTTYPE_HW_EXCEPTION;
>           break;
> @@ -1365,7 +1365,7 @@ static void cf_check svm_inject_event(const struct =
x86_event *event)
>            * Hardware special cases HW_EXCEPTION with vectors 3 and 4 as =
having
>            * trap semantics, and will perform DPL checks.
>            */
> -        if ( cpu_has_svm_nrips )
> +        if ( cpu_has_nrips )
>               vmcb->nextrip =3D regs->rip + _event.insn_len;
>           else
>               regs->rip +=3D _event.insn_len;
> @@ -1982,7 +1982,7 @@ static int cf_check svm_msr_write_intercept(
>   
>       case MSR_IA32_DEBUGCTLMSR:
>           vmcb_set_debugctlmsr(vmcb, msr_content);
> -        if ( !msr_content || !cpu_has_svm_lbrv )
> +        if ( !msr_content || !cpu_has_v_lbr )
>               break;
>           vmcb->virt_ext.fields.lbr_enable =3D 1;
>           svm_disable_intercept_for_msr(v, MSR_IA32_DEBUGCTLMSR);
> @@ -2480,8 +2480,6 @@ static struct hvm_function_table __initdata_cf_clob=
ber svm_function_table =3D {
>   
>   const struct hvm_function_table * __init start_svm(void)
>   {
> -    bool printed =3D false;
> -
>       svm_host_osvw_reset();
>   
>       if ( _svm_cpu_up(true) )
> @@ -2493,38 +2491,14 @@ const struct hvm_function_table * __init start_sv=
m(void)
>   
>       setup_vmcb_dump();
>   
> -    if ( boot_cpu_data.extended_cpuid_level >=3D 0x8000000aU )
> -        svm_feature_flags =3D cpuid_edx(0x8000000aU);
> -
> -    printk("SVM: Supported advanced features:\n");
> -
>       /* DecodeAssists fast paths assume nextrip is valid for fast rIP up=
date. */
> -    if ( !cpu_has_svm_nrips )
> -        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
> +    if ( !cpu_has_nrips )
> +        setup_clear_cpu_cap(X86_FEATURE_DECODE_ASSIST);
>   
>       if ( cpu_has_tsc_ratio )
>           svm_function_table.tsc_scaling.ratio_frac_bits =3D 32;
>   
> -#define P(p,s) if ( p ) { printk(" - %s\n", s); printed =3D 1; }
> -    P(cpu_has_svm_npt, "Nested Page Tables (NPT)");
> -    P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
> -    P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
> -    P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
> -    P(cpu_has_svm_flushbyasid, "TLB flush by ASID");
> -    P(cpu_has_svm_decode, "DecodeAssists");
> -    P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
> -    P(cpu_has_svm_vgif, "Virtual GIF");
> -    P(cpu_has_pause_filter, "Pause-Intercept Filter");
> -    P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
> -    P(cpu_has_tsc_ratio, "TSC Rate MSR");
> -    P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
> -    P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> -#undef P
> -
> -    if ( !printed )
> -        printk(" - none\n");
> -
> -    svm_function_table.caps.hap =3D cpu_has_svm_npt;
> +    svm_function_table.caps.hap =3D cpu_has_npt;
>       svm_function_table.caps.hap_superpage_2mb =3D true;
>       svm_function_table.caps.hap_superpage_1gb =3D cpu_has_page1gb;
>   
> @@ -2761,7 +2735,7 @@ void asmlinkage svm_vmexit_handler(void)
>                       regs->rax, regs->rbx, regs->rcx,
>                       regs->rdx, regs->rsi, regs->rdi);
>   
> -        if ( cpu_has_svm_decode )
> +        if ( cpu_has_decode_assist )
>               v->arch.hvm.svm.cached_insn_len =3D vmcb->guest_ins_len & 0=
xf;
>           rc =3D paging_fault(va, regs);
>           v->arch.hvm.svm.cached_insn_len =3D 0;
> @@ -2906,14 +2880,14 @@ void asmlinkage svm_vmexit_handler(void)
>   
>       case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
>       case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
> -        if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
> +        if ( cpu_has_decode_assist && vmcb->ei.mov_cr.mov_insn )
>               svm_vmexit_do_cr_access(vmcb, regs);
>           else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR acce=
ss") )
>               hvm_inject_hw_exception(X86_EXC_GP, 0);
>           break;
>   
>       case VMEXIT_INVLPG:
> -        if ( cpu_has_svm_decode )
> +        if ( cpu_has_decode_assist )
>           {
>               svm_invlpg_intercept(vmcb->exitinfo1);
>               __update_guest_eip(regs, vmcb->nextrip - vmcb->rip);
> @@ -2994,7 +2968,7 @@ void asmlinkage svm_vmexit_handler(void)
>           break;
>   
>       case VMEXIT_NPF:
> -        if ( cpu_has_svm_decode )
> +        if ( cpu_has_decode_assist )
>               v->arch.hvm.svm.cached_insn_len =3D vmcb->guest_ins_len & 0=
xf;
>           rc =3D vmcb->ei.npf.ec & PFEC_page_present
>                ? p2m_pt_handle_deferred_changes(vmcb->ei.npf.gpa) : 0;
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 4e1f61dbe038..4452ab1263d4 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -15,7 +15,6 @@
>   #include <asm/hvm/svm/vmcb.h>
>   #include <asm/msr-index.h>
>   #include <asm/p2m.h>
> -#include <asm/hvm/svm/svm.h>
>   #include <asm/hvm/svm/svmdebug.h>
>   #include <asm/spec_ctrl.h>
>   
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include=
/asm/cpufeature.h
> index 77cfd900cb56..b6fb8c24423c 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -218,6 +218,16 @@ static inline bool boot_cpu_has(unsigned int feat)
>   #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
>   
>   /* CPUID level 0x8000000a.edx */
> +#define cpu_has_npt             boot_cpu_has(X86_FEATURE_NPT)
> +#define cpu_has_v_lbr           boot_cpu_has(X86_FEATURE_V_LBR)
> +#define cpu_has_nrips           boot_cpu_has(X86_FEATURE_NRIPS)
> +#define cpu_has_tsc_ratio       boot_cpu_has(X86_FEATURE_V_TSC_RATE)
> +#define cpu_has_flush_by_asid   boot_cpu_has(X86_FEATURE_FLUSH_BY_ASID)
> +#define cpu_has_decode_assist   boot_cpu_has(X86_FEATURE_DECODE_ASSIST)
> +#define cpu_has_pause_filter    boot_cpu_has(X86_FEATURE_PAUSE_FILTER)
> +#define cpu_has_pause_thresh    boot_cpu_has(X86_FEATURE_PAUSE_THRESH)
> +#define cpu_has_v_loadsave      boot_cpu_has(X86_FEATURE_V_LOADSAVE)
> +#define cpu_has_v_gif           boot_cpu_has(X86_FEATURE_V_GIF)
>   #define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)
>   
>   /* Synthesized. */
> diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/includ=
e/asm/hvm/svm/svm.h
> index 4eeeb25da90c..06a951225e64 100644
> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -21,40 +21,4 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned lon=
g ldt_base,
>                      unsigned long fs_base, unsigned long gs_base,
>                      unsigned long gs_shadow);
>   
> -extern u32 svm_feature_flags;
> -
> -#define SVM_FEATURE_NPT            0 /* Nested page table support */
> -#define SVM_FEATURE_LBRV           1 /* LBR virtualization support */
> -#define SVM_FEATURE_SVML           2 /* SVM locking MSR support */
> -#define SVM_FEATURE_NRIPS          3 /* Next RIP save on VMEXIT support =
*/
> -#define SVM_FEATURE_TSCRATEMSR     4 /* TSC ratio MSR support */
> -#define SVM_FEATURE_VMCBCLEAN      5 /* VMCB clean bits support */
> -#define SVM_FEATURE_FLUSHBYASID    6 /* TLB flush by ASID support */
> -#define SVM_FEATURE_DECODEASSISTS  7 /* Decode assists support */
> -#define SVM_FEATURE_PAUSEFILTER   10 /* Pause intercept filter support *=
/
> -#define SVM_FEATURE_PAUSETHRESH   12 /* Pause intercept filter support *=
/
> -#define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
> -#define SVM_FEATURE_VGIF          16 /* Virtual GIF */
> -#define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
> -#define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
> -
> -static inline bool cpu_has_svm_feature(unsigned int feat)
> -{
> -    return svm_feature_flags & (1u << feat);
> -}
> -#define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
> -#define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
> -#define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
> -#define cpu_has_svm_nrips     cpu_has_svm_feature(SVM_FEATURE_NRIPS)
> -#define cpu_has_svm_cleanbits cpu_has_svm_feature(SVM_FEATURE_VMCBCLEAN)
> -#define cpu_has_svm_flushbyasid cpu_has_svm_feature(SVM_FEATURE_FLUSHBYA=
SID)
> -#define cpu_has_svm_decode    cpu_has_svm_feature(SVM_FEATURE_DECODEASSI=
STS)
> -#define cpu_has_svm_vgif      cpu_has_svm_feature(SVM_FEATURE_VGIF)
> -#define cpu_has_pause_filter  cpu_has_svm_feature(SVM_FEATURE_PAUSEFILTE=
R)
> -#define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRES=
H)
> -#define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR=
)
> -#define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
> -#define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
> -#define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
> -
>   #endif /* __ASM_X86_HVM_SVM_H__ */


