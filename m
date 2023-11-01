Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F057DE8C6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626660.977101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKMD-0007iH-RY; Wed, 01 Nov 2023 23:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626660.977101; Wed, 01 Nov 2023 23:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKMD-0007gb-N9; Wed, 01 Nov 2023 23:10:41 +0000
Received: by outflank-mailman (input) for mailman id 626660;
 Wed, 01 Nov 2023 23:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+92=GO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyKMC-0007gV-DU
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:10:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddcfb800-790b-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 00:10:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 298AB6121A;
 Wed,  1 Nov 2023 23:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2299C433C7;
 Wed,  1 Nov 2023 23:10:33 +0000 (UTC)
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
X-Inumbo-ID: ddcfb800-790b-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698880235;
	bh=CKfgrSCorUUu5HIq1LEXvdZDzHMfXWmulyih12KkFsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i8xNC+yul3uiH1i7GSfENZEOS1yjoplt+7GdZ+RU2k0dobQZ0CRbiq41d/eTPHbfv
	 2kzJP0TPq8jk9VrgNZZ+xwR7M4mx/NIDH1T84NbIahGcNowGBi2sOkilHFQucUe7CU
	 sEhaXnf2vt400lXDfO7/1QtycDQVR17LeA5rpCTkHVQrpY5CLppC+e3ponmWUBuGJk
	 YInESeuxxsDw3hgI+sozKkw55AqMtDyEBOoS0dHCzXhI9JyMxvag3k9aXAMXjY++he
	 HfBhmq4OradXXgSYgsdd4/uoeGKfeRZQbFzahIUEe9p21RgemqGPQMcy9a9otpQSgJ
	 wRk19uRJpmfSw==
Date: Wed, 1 Nov 2023 16:10:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [XEN PATCH][for-4.19 v6 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311011609360.2125691@ubuntu-linux-20-04-desktop>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com> <a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Nov 2023, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm modules
> are allowed to have no prior declaration visible when being
> defined, hence these functions are marked with an
> 'asmlinkage' macro, which is then deviated for MISRA C:2012
> Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v3:
> - added SAF deviations for vmx counterparts to svm functions.
> Changes in v5:
> - drop SAF deviations in favour of the pseudo-attribute asmlinkage
> Changes in v6:
> - conditioned asmlinkage definition to make it overridable;
> - move the pseudo-attribute after the return type
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>  docs/misra/deviations.rst                        | 6 ++++++
>  xen/arch/x86/hvm/svm/intr.c                      | 2 +-
>  xen/arch/x86/hvm/svm/nestedsvm.c                 | 2 +-
>  xen/arch/x86/hvm/svm/svm.c                       | 4 ++--
>  xen/arch/x86/hvm/vmx/intr.c                      | 2 +-
>  xen/arch/x86/hvm/vmx/vmx.c                       | 4 ++--
>  xen/arch/x86/hvm/vmx/vvmx.c                      | 2 +-
>  xen/arch/x86/traps.c                             | 2 +-
>  xen/arch/x86/x86_64/traps.c                      | 2 +-
>  xen/include/xen/compiler.h                       | 5 +++++
>  11 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a27..06619ecf7e8d 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>  -doc_end
>  
> +-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
> +-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
> +-doc_end
> +
> +-doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
> +-doc_end
> +
>  -doc_begin="The following variables are compiled in multiple translation units
>  belonging to different executables and therefore are safe."
>  -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a189253b..d468da2f5ce9 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -133,6 +133,12 @@ Deviations related to MISRA C:2012 Rules:
>         configuration. Therefore, the absence of prior declarations is safe.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R8.4
> +     - Functions and variables used only by asm modules are either marked with
> +       the `asmlinkage` macro or with a SAF-1-safe textual deviation
> +       (see safe.json).
> +     - Tagged as `safe` for ECLAIR.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

If Julien prefers a different wording I could modify on commit as needed


>     * - R8.6
>       - The following variables are compiled in multiple translation units
>         belonging to different executables and therefore are safe.
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 192e17ebbfbb..4805c5567213 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>  }
>  
> -void svm_intr_assist(void)
> +void asmlinkage svm_intr_assist(void)
>  {
>      struct vcpu *v = current;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index a09b6abaaeaf..fc7658d67d4e 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1441,7 +1441,7 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
>  }
>  
>  /* VCPU switch */
> -void nsvm_vcpu_switch(void)
> +void asmlinkage nsvm_vcpu_switch(void)
>  {
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      struct vcpu *v = current;
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 24c417ca7199..cb8abe7a0066 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1056,7 +1056,7 @@ static void noreturn cf_check svm_do_resume(void)
>      reset_stack_and_jump(svm_asm_do_resume);
>  }
>  
> -void svm_vmenter_helper(void)
> +void asmlinkage svm_vmenter_helper(void)
>  {
>      const struct cpu_user_regs *regs = guest_cpu_user_regs();
>      struct vcpu *curr = current;
> @@ -2586,7 +2586,7 @@ const struct hvm_function_table * __init start_svm(void)
>      return &svm_function_table;
>  }
>  
> -void svm_vmexit_handler(void)
> +void asmlinkage svm_vmexit_handler(void)
>  {
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>      uint64_t exit_reason;
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index fd719c4c01d2..8beeaab1517b 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -224,7 +224,7 @@ void vmx_sync_exit_bitmap(struct vcpu *v)
>      }
>  }
>  
> -void vmx_intr_assist(void)
> +void asmlinkage vmx_intr_assist(void)
>  {
>      struct hvm_intack intack;
>      struct vcpu *v = current;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 1edc7f1e919f..f5739b3aa5a1 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4035,7 +4035,7 @@ static void undo_nmis_unblocked_by_iret(void)
>                guest_info | VMX_INTR_SHADOW_NMI);
>  }
>  
> -void vmx_vmexit_handler(struct cpu_user_regs *regs)
> +void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>  {
>      unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
>      unsigned int vector = 0;
> @@ -4787,7 +4787,7 @@ static void lbr_fixup(void)
>  }
>  
>  /* Returns false if the vmentry has to be restarted */
> -bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
> +bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>  {
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index 16b0ef82b6c8..a28803987af6 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -1490,7 +1490,7 @@ static void nvmx_eptp_update(void)
>      __vmwrite(EPT_POINTER, get_shadow_eptp(curr));
>  }
>  
> -void nvmx_switch_guest(void)
> +void asmlinkage nvmx_switch_guest(void)
>  {
>      struct vcpu *v = current;
>      struct nestedvcpu *nvcpu = &vcpu_nestedhvm(v);
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index e1356f696aba..6393467b06fd 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2265,7 +2265,7 @@ void asm_domain_crash_synchronous(unsigned long addr)
>  }
>  
>  #ifdef CONFIG_DEBUG
> -void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
> +void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  {
>      const unsigned int ist_mask =
>          (1U << X86_EXC_NMI) | (1U << X86_EXC_DB) |
> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
> index e03e80813e36..668605e5bc67 100644
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -266,7 +266,7 @@ void show_page_walk(unsigned long addr)
>             l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
>  }
>  
> -void do_double_fault(struct cpu_user_regs *regs)
> +void asmlinkage do_double_fault(struct cpu_user_regs *regs)
>  {
>      unsigned int cpu;
>      unsigned long crs[8];
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index dd99e573083f..94e2d6080d93 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -159,6 +159,11 @@
>  # define ASM_FLAG_OUT(yes, no) no
>  #endif
>  
> +/* Mark a function or variable as being used only to interface with asm */
> +#ifndef asmlinkage
> +#define asmlinkage
> +#endif
> +
>  /*
>   * NB: we need to disable the gcc-compat warnings for clang in some places or
>   * else it will complain with: "'break' is bound to loop, GCC binds it to
> -- 
> 2.34.1
> 

