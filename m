Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A442D3250
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 19:44:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47660.84347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhxP-0004K6-0z; Tue, 08 Dec 2020 18:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47660.84347; Tue, 08 Dec 2020 18:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhxO-0004Jk-TS; Tue, 08 Dec 2020 18:43:26 +0000
Received: by outflank-mailman (input) for mailman id 47660;
 Tue, 08 Dec 2020 18:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gyNq=FM=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kmhxM-0004Jf-BG
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 18:43:25 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e601ae3e-b817-461e-a9ed-0c1178269f73;
 Tue, 08 Dec 2020 18:43:21 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f08004da90e847a90bd48.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:800:4da9:e84:7a90:bd48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 515021EC04BF;
 Tue,  8 Dec 2020 19:43:20 +0100 (CET)
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
X-Inumbo-ID: e601ae3e-b817-461e-a9ed-0c1178269f73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1607453000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=/ZQYdyMntojjSpS0VNOBBCh2xJC9JCydUpM1Shp6nLw=;
	b=VKBSSiMMABTlg4e/gOqwPW/l0D5HODUGSc5er/ZHtC5DNYPpTLEXfdpuF8K9sFZgw4VBpc
	Xy4p+CvjCfeCNoPlVAz08QqPMi6ReE+AkmIi0VhKyamT4fs+09CAjHc/dRBZXGpRxIty6N
	isu5dUhGHYWMJdK2EHdjMgTj+Bz30CA=
Date: Tue, 8 Dec 2020 19:43:15 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
Message-ID: <20201208184315.GE27920@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-8-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:25PM +0100, Juergen Gross wrote:
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index dad350d42ecf..ffa23c655412 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -237,6 +237,9 @@
>  #define X86_FEATURE_VMCALL		( 8*32+18) /* "" Hypervisor supports the VMCALL instruction */
>  #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* "" VMware prefers VMMCALL hypercall instruction */
>  #define X86_FEATURE_SEV_ES		( 8*32+20) /* AMD Secure Encrypted Virtualization - Encrypted State */
> +#define X86_FEATURE_NOT_XENPV		( 8*32+21) /* "" Inverse of X86_FEATURE_XENPV */
> +#define X86_FEATURE_NO_PVUNLOCK		( 8*32+22) /* "" No PV unlock function */
> +#define X86_FEATURE_NO_VCPUPREEMPT	( 8*32+23) /* "" No PV vcpu_is_preempted function */

Ew, negative features. ;-\

/me goes forward and looks at usage sites:

+	ALTERNATIVE_2 "jmp *paravirt_iret(%rip);",			\
+		      "jmp native_iret;", X86_FEATURE_NOT_XENPV,	\
+		      "jmp xen_iret;", X86_FEATURE_XENPV

Can we make that:

	ALTERNATIVE_TERNARY "jmp *paravirt_iret(%rip);",
		      "jmp xen_iret;", X86_FEATURE_XENPV,
		      "jmp native_iret;", X86_FEATURE_XENPV,

where the last two lines are supposed to mean

			    X86_FEATURE_XENPV ? "jmp xen_iret;" : "jmp native_iret;"

Now, in order to convey that logic to apply_alternatives(), you can do:

struct alt_instr {
        s32 instr_offset;       /* original instruction */
        s32 repl_offset;        /* offset to replacement instruction */
        u16 cpuid;              /* cpuid bit set for replacement */
        u8  instrlen;           /* length of original instruction */
        u8  replacementlen;     /* length of new instruction */
        u8  padlen;             /* length of build-time padding */
	u8  flags;		/* patching flags */ 			<--- THIS
} __packed;

and yes, we have had the flags thing in a lot of WIP diffs over the
years but we've never come to actually needing it.

Anyway, then, apply_alternatives() will do:

	if (flags & ALT_NOT_FEATURE)

or something like that - I'm bad at naming stuff - then it should patch
only when the feature is NOT set and vice versa.

There in that

	if (!boot_cpu_has(a->cpuid)) {

branch.

Hmm?

>  /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
>  #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 2400ad62f330..f8f9700719cf 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -593,6 +593,18 @@ int alternatives_text_reserved(void *start, void *end)
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_PARAVIRT
> +static void __init paravirt_set_cap(void)
> +{
> +	if (!boot_cpu_has(X86_FEATURE_XENPV))
> +		setup_force_cpu_cap(X86_FEATURE_NOT_XENPV);
> +
> +	if (pv_is_native_spin_unlock())
> +		setup_force_cpu_cap(X86_FEATURE_NO_PVUNLOCK);
> +
> +	if (pv_is_native_vcpu_is_preempted())
> +		setup_force_cpu_cap(X86_FEATURE_NO_VCPUPREEMPT);
> +}
> +
>  void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
>  				     struct paravirt_patch_site *end)
>  {
> @@ -616,6 +628,8 @@ void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
>  }
>  extern struct paravirt_patch_site __start_parainstructions[],
>  	__stop_parainstructions[];
> +#else
> +static void __init paravirt_set_cap(void) { }
>  #endif	/* CONFIG_PARAVIRT */
>  
>  /*
> @@ -723,6 +737,18 @@ void __init alternative_instructions(void)
>  	 * patching.
>  	 */
>  
> +	paravirt_set_cap();

Can that be called from somewhere in the Xen init path and not from
here? Somewhere before check_bugs() gets called.

> +	/*
> +	 * First patch paravirt functions, such that we overwrite the indirect
> +	 * call with the direct call.
> +	 */
> +	apply_paravirt(__parainstructions, __parainstructions_end);
> +
> +	/*
> +	 * Then patch alternatives, such that those paravirt calls that are in
> +	 * alternatives can be overwritten by their immediate fragments.
> +	 */
>  	apply_alternatives(__alt_instructions, __alt_instructions_end);

Can you give an example here pls why the paravirt patching needs to run
first?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

