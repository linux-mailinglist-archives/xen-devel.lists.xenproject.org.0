Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D147A96A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 13:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249768.430167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHfM-0003AX-8x; Mon, 20 Dec 2021 12:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249768.430167; Mon, 20 Dec 2021 12:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHfM-00037L-4t; Mon, 20 Dec 2021 12:21:20 +0000
Received: by outflank-mailman (input) for mailman id 249768;
 Mon, 20 Dec 2021 12:21:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mzHfK-00036x-02
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 12:21:18 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5293f1de-618f-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 13:21:15 +0100 (CET)
Received: from [10.10.1.134] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1640002868271788.2233964185755;
 Mon, 20 Dec 2021 04:21:08 -0800 (PST)
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
X-Inumbo-ID: 5293f1de-618f-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1640002870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KvkKmzjlL7Nt+WuCxmL3a4Be4e7FiZU5lcjEUB2F76oCOc4AfI4NxAijwWakFTmva0pnDRx+D5aa4JrhXx+3hn09X30WzyMKjVMKvrB+L8p+t5t8MNyUANJ9QqxtRi4SKDHcDN0WcojQCNOkme7ZF5Fc/NSpvwYUnIUFtC0kNTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1640002870; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6z3zVB4je1tfOCA8ftObRRWDwBZuTez9TiDYMdMrmfQ=; 
	b=G+YjL3kY4mWu72g9wf0iGJcNS3VDV1BzoAYd5PX8n4PhvpJNy38E4ISy0wo60za5bJKGBpxgtaxUp6pVnmO8GYi6IyFpfghCSbiLbPmmd6fqQHTkzkPe0gux0Nfk0l2zR/FIJwy8iCcZPnkHEi8ThI/T759l9FHSIaz+r5e9FWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1640002870;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6z3zVB4je1tfOCA8ftObRRWDwBZuTez9TiDYMdMrmfQ=;
	b=t/j04sJ7nid5+iRTZ3O8Z8w+TDvlN/vgRjKzc81fZXI/BZb3xc5Qpk+u8DWSPLsA
	aSk1BdV3A5pDO8JygRJf3OKhK5nT/d1GM1/CdfiPoMwF8bdjBscWMVCUrFotqfAKiJb
	5bk2uu9N8ez10A9RCa7HlIxMb6J9j+bz5Hek7DVM=
Subject: Re: [PATCH V2] is_system_domain: replace open-coded instances
To: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211220155013.28896-1-dpsmith@apertussolutions.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <f8637ace-43df-ffa6-5d6b-e8b4d70b74c9@apertussolutions.com>
Date: Mon, 20 Dec 2021 07:20:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220155013.28896-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Please disregard, I inadvertant picked up a couple of build artifacts. 
My sincere apologies on that, I will be resending shortly without them.

v/r
dps

On 12/20/21 10:50 AM, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> This is a split out of the hyperlaunch dom0 series.
> 
> There were several instances of open-coded domid range checking. This commit
> replaces those with the is_system_domain or is_system_domid inline function.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Acked-by: Dario Faggioli <dfaggioli@suse.com>
> ---
>   xen/arch/x86/cpu/mcheck/mce.c     |   2 +-
>   xen/arch/x86/cpu/vpmu.c           |   2 +-
>   xen/common/domain.c               |   2 +-
>   xen/common/domctl.c               |   4 +-
>   xen/common/sched/core.c           |   4 +-
>   xen/include/asm-x86/asm-macros.h  |  86 ++++++++++++++++++++
>   xen/include/asm-x86/asm-offsets.h | 127 ++++++++++++++++++++++++++++++
>   xen/include/xen/sched.h           |   7 +-
>   8 files changed, 226 insertions(+), 8 deletions(-)
>   create mode 100644 xen/include/asm-x86/asm-macros.h
>   create mode 100644 xen/include/asm-x86/asm-offsets.h
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 7f433343bc..5c1df39075 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1518,7 +1518,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>               d = rcu_lock_domain_by_any_id(mc_msrinject->mcinj_domid);
>               if ( d == NULL )
>               {
> -                if ( mc_msrinject->mcinj_domid >= DOMID_FIRST_RESERVED )
> +                if ( is_system_domid(mc_msrinject->mcinj_domid) )
>                       return x86_mcerr("do_mca inject: incompatible flag "
>                                        "MC_MSRINJ_F_GPADDR with domain %d",
>                                        -EINVAL, domid);
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index 8ec4547bed..c6bfa5a00e 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -188,7 +188,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
>        * in XENPMU_MODE_ALL, for everyone.
>        */
>       if ( (vpmu_mode & XENPMU_MODE_ALL) ||
> -         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
> +         is_system_domain(sampled->domain) )
>       {
>           sampling = choose_hwdom_vcpu();
>           if ( !sampling )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 093bb4403f..347cc073aa 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -583,7 +583,7 @@ struct domain *domain_create(domid_t domid,
>       /* Sort out our idea of is_hardware_domain(). */
>       if ( domid == 0 || domid == hardware_domid )
>       {
> -        if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
> +        if ( hardware_domid < 0 || is_system_domid(hardware_domid) )
>               panic("The value of hardware_dom must be a valid domain ID\n");
>   
>           old_hwdom = hardware_domain;
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 879a2adcbe..a3ad1f62b6 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -52,7 +52,7 @@ static inline int is_free_domid(domid_t dom)
>   {
>       struct domain *d;
>   
> -    if ( dom >= DOMID_FIRST_RESERVED )
> +    if ( is_system_domid(dom) )
>           return 0;
>   
>       if ( (d = rcu_lock_domain_by_id(dom)) == NULL )
> @@ -536,7 +536,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           if ( !d )
>           {
>               ret = -EINVAL;
> -            if ( op->domain >= DOMID_FIRST_RESERVED )
> +            if ( is_system_domid(op->domain) )
>                   break;
>   
>               rcu_read_lock(&domlist_read_lock);
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f4b1ca10d..6ea8bcf62f 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -821,7 +821,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
>       int ret;
>   
>       ASSERT(d->cpupool == NULL);
> -    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
> +    ASSERT(!is_system_domain(d));
>   
>       if ( (ret = cpupool_add_domain(d, poolid)) )
>           return ret;
> @@ -845,7 +845,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
>   
>   void sched_destroy_domain(struct domain *d)
>   {
> -    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
> +    ASSERT(!is_system_domain(d));
>   
>       if ( d->cpupool )
>       {
> diff --git a/xen/include/asm-x86/asm-macros.h b/xen/include/asm-x86/asm-macros.h
> new file mode 100644
> index 0000000000..0c3d538b5c
> --- /dev/null
> +++ b/xen/include/asm-x86/asm-macros.h
> @@ -0,0 +1,86 @@
> +#if 0
> +.if 0
> +#endif
> +#ifndef __ASM_MACROS_H__
> +#define __ASM_MACROS_H__
> +asm ( ".include \"/home/build/projects/starlab/xen-private/xen/include/asm-x86/asm-macros.h\"" );
> +#endif /* __ASM_MACROS_H__ */
> +#if 0
> +.endif
> +.macro vmrun
> +    .byte 0x0f, 0x01, 0xd8
> +.endm
> +.macro stgi
> +    .byte 0x0f, 0x01, 0xdc
> +.endm
> +.macro clgi
> +    .byte 0x0f, 0x01, 0xdd
> +.endm
> +.macro INDIRECT_BRANCH insn:req arg:req
> +    .if 1 == 1
> +        $done = 0
> +        .irp reg, ax, cx, dx, bx, bp, si, di, 8, 9, 10, 11, 12, 13, 14, 15
> +        .ifeqs "\arg", "%r\reg"
> +            \insn __x86_indirect_thunk_r\reg
> +            $done = 1
> +           .exitm
> +        .endif
> +        .endr
> +        .if $done != 1
> +            .error "Bad register arg \arg"
> +        .endif
> +    .else
> +        \insn *\arg
> +    .endif
> +.endm
> +.macro INDIRECT_CALL arg:req
> +    INDIRECT_BRANCH call \arg
> +.endm
> +.macro INDIRECT_JMP arg:req
> +    INDIRECT_BRANCH jmp \arg
> +.endm
> +.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
> +    mov $((((((256 >> 8) * 0xffff000000000000) | (256 << 39))) + (1 << 39)*16) - 1), \scratch1
> +    mov $~0, \scratch2
> +    cmp \ptr, \scratch1
> +    rcr $1, \scratch2
> +    and \scratch2, \ptr
> +.endm
> +.macro altinstruction_entry orig repl feature orig_len repl_len pad_len
> +    .long \orig - .
> +    .long \repl - .
> +    .word \feature
> +    .byte \orig_len
> +    .byte \repl_len
> +    .byte \pad_len
> +    .byte 0
> +.endm
> +.macro mknops nr_bytes
> +    .nops \nr_bytes, 9
> +.endm
> +.macro ALTERNATIVE oldinstr, newinstr, feature
> +    .L\@_orig_s: \oldinstr; .L\@_orig_e: .L\@_diff = (.L\@_repl_e\()1 - .L\@_repl_s\()1) - (.L\@_orig_e - .L\@_orig_s); mknops ((-(.L\@_diff > 0)) * .L\@_diff); .L\@_orig_p:
> +    .pushsection .altinstructions, "a", @progbits
> +    altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature, (.L\@_orig_e - .L\@_orig_s), (.L\@_repl_e\()1 - .L\@_repl_s\()1), (.L\@_orig_p - .L\@_orig_e)
> +    .section .discard, "a", @progbits
> +    .byte (.L\@_orig_p - .L\@_orig_s)
> +    .byte 0xff + (.L\@_repl_e\()1 - .L\@_repl_s\()1) - (.L\@_orig_p - .L\@_orig_s)
> +    .section .altinstr_replacement, "ax", @progbits
> +    .L\@_repl_s\()1: \newinstr; .L\@_repl_e\()1:
> +    .popsection
> +.endm
> +.macro ALTERNATIVE_2 oldinstr, newinstr1, feature1, newinstr2, feature2
> +    .L\@_orig_s: \oldinstr; .L\@_orig_e: .L\@_diff = (((.L\@_repl_e\()1 - .L\@_repl_s\()1)) ^ ((((.L\@_repl_e\()1 - .L\@_repl_s\()1)) ^ ((.L\@_repl_e\()2 - .L\@_repl_s\()2))) & -(-(((.L\@_repl_e\()1 - .L\@_repl_s\()1)) < ((.L\@_repl_e\()2 - .L\@_repl_s\()2)))))) - (.L\@_orig_e - .L\@_orig_s); mknops ((-(.L\@_diff > 0)) * .L\@_diff); .L\@_orig_p:
> +    .pushsection .altinstructions, "a", @progbits
> +    altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature1, (.L\@_orig_e - .L\@_orig_s), (.L\@_repl_e\()1 - .L\@_repl_s\()1), (.L\@_orig_p - .L\@_orig_e)
> +    altinstruction_entry .L\@_orig_s, .L\@_repl_s2, \feature2, (.L\@_orig_e - .L\@_orig_s), (.L\@_repl_e\()2 - .L\@_repl_s\()2), (.L\@_orig_p - .L\@_orig_e)
> +    .section .discard, "a", @progbits
> +    .byte (.L\@_orig_p - .L\@_orig_s)
> +    .byte 0xff + (.L\@_repl_e\()1 - .L\@_repl_s\()1) - (.L\@_orig_p - .L\@_orig_s)
> +    .byte 0xff + (.L\@_repl_e\()2 - .L\@_repl_s\()2) - (.L\@_orig_p - .L\@_orig_s)
> +    .section .altinstr_replacement, "ax", @progbits
> +    .L\@_repl_s\()1: \newinstr1; .L\@_repl_e\()1:
> +    .L\@_repl_s\()2: \newinstr2; .L\@_repl_e\()2:
> +    .popsection
> +.endm
> +#endif
> diff --git a/xen/include/asm-x86/asm-offsets.h b/xen/include/asm-x86/asm-offsets.h
> new file mode 100644
> index 0000000000..5eeced15ec
> --- /dev/null
> +++ b/xen/include/asm-x86/asm-offsets.h
> @@ -0,0 +1,127 @@
> +/*
> + * DO NOT MODIFY.
> + *
> + * This file was auto-generated from asm-offsets.s
> + *
> + */
> +
> +#ifndef __ASM_OFFSETS_H__
> +#define __ASM_OFFSETS_H__
> +
> +#define UREGS_r15 0 /* offsetof(struct cpu_user_regs, r15) */
> +#define UREGS_r14 8 /* offsetof(struct cpu_user_regs, r14) */
> +#define UREGS_r13 16 /* offsetof(struct cpu_user_regs, r13) */
> +#define UREGS_r12 24 /* offsetof(struct cpu_user_regs, r12) */
> +#define UREGS_rbp 32 /* offsetof(struct cpu_user_regs, rbp) */
> +#define UREGS_rbx 40 /* offsetof(struct cpu_user_regs, rbx) */
> +#define UREGS_r11 48 /* offsetof(struct cpu_user_regs, r11) */
> +#define UREGS_r10 56 /* offsetof(struct cpu_user_regs, r10) */
> +#define UREGS_r9 64 /* offsetof(struct cpu_user_regs, r9) */
> +#define UREGS_r8 72 /* offsetof(struct cpu_user_regs, r8) */
> +#define UREGS_rax 80 /* offsetof(struct cpu_user_regs, rax) */
> +#define UREGS_rcx 88 /* offsetof(struct cpu_user_regs, rcx) */
> +#define UREGS_rdx 96 /* offsetof(struct cpu_user_regs, rdx) */
> +#define UREGS_rsi 104 /* offsetof(struct cpu_user_regs, rsi) */
> +#define UREGS_rdi 112 /* offsetof(struct cpu_user_regs, rdi) */
> +#define UREGS_error_code 120 /* offsetof(struct cpu_user_regs, error_code) */
> +#define UREGS_entry_vector 124 /* offsetof(struct cpu_user_regs, entry_vector) */
> +#define UREGS_rip 128 /* offsetof(struct cpu_user_regs, rip) */
> +#define UREGS_cs 136 /* offsetof(struct cpu_user_regs, cs) */
> +#define UREGS_eflags 144 /* offsetof(struct cpu_user_regs, rflags) */
> +#define UREGS_rsp 152 /* offsetof(struct cpu_user_regs, rsp) */
> +#define UREGS_ss 160 /* offsetof(struct cpu_user_regs, ss) */
> +#define UREGS_kernel_sizeof 168 /* offsetof(struct cpu_user_regs, es) */
> +
> +#define VCPU_processor 4 /* offsetof(struct vcpu, processor) */
> +#define VCPU_domain 16 /* offsetof(struct vcpu, domain) */
> +#define VCPU_vcpu_info 8 /* offsetof(struct vcpu, vcpu_info) */
> +#define VCPU_trap_bounce 1456 /* offsetof(struct vcpu, arch.pv.trap_bounce) */
> +#define VCPU_thread_flags 896 /* offsetof(struct vcpu, arch.flags) */
> +#define VCPU_event_addr 1384 /* offsetof(struct vcpu, arch.pv.event_callback_eip) */
> +#define VCPU_event_sel 1400 /* offsetof(struct vcpu, arch.pv.event_callback_cs) */
> +#define VCPU_syscall_addr 1400 /* offsetof(struct vcpu, arch.pv.syscall_callback_eip) */
> +#define VCPU_syscall32_addr 1408 /* offsetof(struct vcpu, arch.pv.syscall32_callback_eip) */
> +#define VCPU_syscall32_sel 1424 /* offsetof(struct vcpu, arch.pv.syscall32_callback_cs) */
> +#define VCPU_syscall32_disables_events 1428 /* offsetof(struct vcpu, arch.pv.syscall32_disables_events) */
> +#define VCPU_sysenter_addr 1416 /* offsetof(struct vcpu, arch.pv.sysenter_callback_eip) */
> +#define VCPU_sysenter_sel 1426 /* offsetof(struct vcpu, arch.pv.sysenter_callback_cs) */
> +#define VCPU_sysenter_disables_events 1429 /* offsetof(struct vcpu, arch.pv.sysenter_disables_events) */
> +#define VCPU_trap_ctxt 1168 /* offsetof(struct vcpu, arch.pv.trap_ctxt) */
> +#define VCPU_kernel_sp 1312 /* offsetof(struct vcpu, arch.pv.kernel_sp) */
> +#define VCPU_kernel_ss 1304 /* offsetof(struct vcpu, arch.pv.kernel_ss) */
> +#define VCPU_iopl 1484 /* offsetof(struct vcpu, arch.pv.iopl) */
> +#define VCPU_guest_context_flags 1160 /* offsetof(struct vcpu, arch.pv.vgc_flags) */
> +#define VCPU_cr3 2856 /* offsetof(struct vcpu, arch.cr3) */
> +#define VCPU_arch_msrs 3416 /* offsetof(struct vcpu, arch.msrs) */
> +#define VCPU_nmi_pending 960 /* offsetof(struct vcpu, arch.async_exception_state[(1)-1].pending) */
> +#define VCPU_mce_pending 962 /* offsetof(struct vcpu, arch.async_exception_state[(2)-1].pending) */
> +#define VCPU_nmi_old_mask 961 /* offsetof(struct vcpu, arch.async_exception_state[(1)-1].old_mask) */
> +#define VCPU_mce_old_mask 963 /* offsetof(struct vcpu, arch.async_exception_state[(2)-1].old_mask) */
> +#define VCPU_async_exception_mask 964 /* offsetof(struct vcpu, arch.async_exception_mask) */
> +#define VCPU_TRAP_NMI 1 /* VCPU_TRAP_NMI */
> +#define VCPU_TRAP_MCE 2 /* VCPU_TRAP_MCE */
> +#define _VGCF_syscall_disables_events 4 /* _VGCF_syscall_disables_events */
> +
> +#define VCPU_svm_vmcb_pa 1480 /* offsetof(struct vcpu, arch.hvm.svm.vmcb_pa) */
> +#define VCPU_svm_vmcb 1472 /* offsetof(struct vcpu, arch.hvm.svm.vmcb) */
> +
> +#define VCPU_vmx_launched 1516 /* offsetof(struct vcpu, arch.hvm.vmx.launched) */
> +#define VCPU_vmx_realmode 1738 /* offsetof(struct vcpu, arch.hvm.vmx.vmx_realmode) */
> +#define VCPU_vmx_emulate 1739 /* offsetof(struct vcpu, arch.hvm.vmx.vmx_emulate) */
> +#define VCPU_vm86_seg_mask 1742 /* offsetof(struct vcpu, arch.hvm.vmx.vm86_segment_mask) */
> +#define VCPU_hvm_guest_cr2 1040 /* offsetof(struct vcpu, arch.hvm.guest_cr[2]) */
> +
> +#define VCPU_nhvm_guestmode 1960 /* offsetof(struct vcpu, arch.hvm.nvcpu.nv_guestmode) */
> +#define VCPU_nhvm_p2m 2192 /* offsetof(struct vcpu, arch.hvm.nvcpu.nv_p2m) */
> +#define VCPU_nsvm_hap_enabled 2148 /* offsetof(struct vcpu, arch.hvm.nvcpu.u.nsvm.ns_hap_enabled) */
> +
> +#define VCPUINFO_upcall_pending 0 /* offsetof(struct vcpu_info, evtchn_upcall_pending) */
> +#define VCPUINFO_upcall_mask 1 /* offsetof(struct vcpu_info, evtchn_upcall_mask) */
> +
> +#define CPUINFO_guest_cpu_user_regs 0 /* offsetof(struct cpu_info, guest_cpu_user_regs) */
> +#define CPUINFO_verw_sel 204 /* offsetof(struct cpu_info, verw_sel) */
> +#define CPUINFO_current_vcpu 208 /* offsetof(struct cpu_info, current_vcpu) */
> +#define CPUINFO_per_cpu_offset 216 /* offsetof(struct cpu_info, per_cpu_offset) */
> +#define CPUINFO_cr4 224 /* offsetof(struct cpu_info, cr4) */
> +#define CPUINFO_xen_cr3 232 /* offsetof(struct cpu_info, xen_cr3) */
> +#define CPUINFO_pv_cr3 240 /* offsetof(struct cpu_info, pv_cr3) */
> +#define CPUINFO_shadow_spec_ctrl 248 /* offsetof(struct cpu_info, shadow_spec_ctrl) */
> +#define CPUINFO_xen_spec_ctrl 252 /* offsetof(struct cpu_info, xen_spec_ctrl) */
> +#define CPUINFO_spec_ctrl_flags 253 /* offsetof(struct cpu_info, spec_ctrl_flags) */
> +#define CPUINFO_root_pgt_changed 254 /* offsetof(struct cpu_info, root_pgt_changed) */
> +#define CPUINFO_use_pv_cr3 255 /* offsetof(struct cpu_info, use_pv_cr3) */
> +#define CPUINFO_sizeof 264 /* sizeof(struct cpu_info) */
> +
> +#define TRAPINFO_eip 8 /* offsetof(struct trap_info, address) */
> +#define TRAPINFO_cs 2 /* offsetof(struct trap_info, cs) */
> +#define TRAPINFO_flags 1 /* offsetof(struct trap_info, flags) */
> +#define TRAPINFO_sizeof 16 /* sizeof(struct trap_info) */
> +
> +#define TRAPBOUNCE_error_code 0 /* offsetof(struct trap_bounce, error_code) */
> +#define TRAPBOUNCE_flags 4 /* offsetof(struct trap_bounce, flags) */
> +#define TRAPBOUNCE_cs 6 /* offsetof(struct trap_bounce, cs) */
> +#define TRAPBOUNCE_eip 8 /* offsetof(struct trap_bounce, eip) */
> +
> +#define VCPUMSR_spec_ctrl_raw 0 /* offsetof(struct vcpu_msrs, spec_ctrl.raw) */
> +
> +#define IRQSTAT_shift 7 /* ilog2(sizeof(irq_cpustat_t)) */
> +#define IRQSTAT_softirq_pending 0 /* offsetof(irq_cpustat_t, __softirq_pending) */
> +
> +#define CPUINFO_features 12 /* offsetof(struct cpuinfo_x86, x86_capability) */
> +
> +#define MB_flags 0 /* offsetof(multiboot_info_t, flags) */
> +#define MB_cmdline 16 /* offsetof(multiboot_info_t, cmdline) */
> +#define MB_mem_lower 4 /* offsetof(multiboot_info_t, mem_lower) */
> +
> +#define MB2_fixed_sizeof 8 /* sizeof(multiboot2_fixed_t) */
> +#define MB2_fixed_total_size 0 /* offsetof(multiboot2_fixed_t, total_size) */
> +#define MB2_tag_type 0 /* offsetof(multiboot2_tag_t, type) */
> +#define MB2_tag_size 4 /* offsetof(multiboot2_tag_t, size) */
> +#define MB2_load_base_addr 8 /* offsetof(multiboot2_tag_load_base_addr_t, load_base_addr) */
> +#define MB2_mem_lower 8 /* offsetof(multiboot2_tag_basic_meminfo_t, mem_lower) */
> +#define MB2_efi64_st 8 /* offsetof(multiboot2_tag_efi64_t, pointer) */
> +#define MB2_efi64_ih 8 /* offsetof(multiboot2_tag_efi64_ih_t, pointer) */
> +
> +#define DOMAIN_vm_assist 544 /* offsetof(struct domain, vm_assist) */
> +
> +#endif
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 28146ee404..0df72baf2e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -613,9 +613,14 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
>   #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
>   #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
>   
> +static inline bool is_system_domid(domid_t id)
> +{
> +    return (id >= DOMID_FIRST_RESERVED);
> +}
> +
>   static inline bool is_system_domain(const struct domain *d)
>   {
> -    return d->domain_id >= DOMID_FIRST_RESERVED;
> +    return is_system_domid(d->domain_id);
>   }
>   
>   #define DOMAIN_DESTROYED (1u << 31) /* assumes atomic_t is >= 32 bits */
> 

