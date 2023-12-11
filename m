Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B080C09C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 06:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651474.1017144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCYca-0000Pz-6u; Mon, 11 Dec 2023 05:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651474.1017144; Mon, 11 Dec 2023 05:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCYca-0000Ns-3D; Mon, 11 Dec 2023 05:14:24 +0000
Received: by outflank-mailman (input) for mailman id 651474;
 Mon, 11 Dec 2023 05:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2mk9=HW=kernel.org=mhiramat@srs-se1.protection.inumbo.net>)
 id 1rCYcY-0000Nm-Gy
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 05:14:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2226f9ee-97e4-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 06:14:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 75C29CE0E2A;
 Mon, 11 Dec 2023 05:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0966C433C8;
 Mon, 11 Dec 2023 05:14:05 +0000 (UTC)
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
X-Inumbo-ID: 2226f9ee-97e4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702271651;
	bh=1RaacpWnTkL7X+JkkZCzrmMSUdmiLmbVja5/lwCyjQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j1k87/K7XA8EUz7Zf98AZPRZyBK3naglI6189/lN0rxULeWuXjMdwpoAWl6KaQDu7
	 3blzWA81dIIb5kC62NvxjL2YeGPGNpo134fVU1OIWCZ8wISzfCfIHLmlVGVMjdoPZG
	 ypL9U5OwRcNAf1U7n98XUq7ZJFwB4M6SkzSNXqE+3pRpe0S0TGnprKad8mHpY0EmG7
	 5em7IPy2y3vOan4UyOPX4/fva1R2mmdUqcqVGk1AiRcjfacx76VCU6M0WuYEAjcXh4
	 T6ORZDmE3uH9ZfnxzMcYRaWZ9lpYmUfPqCmUtVmz1kaPKNOxj7IfYhmyOtAPd0VHzM
	 xA7qcayxQqJ7Q==
Date: Mon, 11 Dec 2023 14:14:03 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com, nik.borisov@suse.com, shan.kang@intel.com
Subject: Re: [PATCH v13 01/35] x86/cpufeatures,opcode,msr: Add the WRMSRNS
 instruction support
Message-Id: <20231211141403.09e3f2d81eb499ba44035fef@kernel.org>
In-Reply-To: <20231205105030.8698-2-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
	<20231205105030.8698-2-xin3.li@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  5 Dec 2023 02:49:50 -0800
Xin Li <xin3.li@intel.com> wrote:

> WRMSRNS is an instruction that behaves exactly like WRMSR, with
> the only difference being that it is not a serializing instruction
> by default. Under certain conditions, WRMSRNS may replace WRMSR to
> improve performance.
> 
> Add its CPU feature bit, opcode to the x86 opcode map, and an
> always inline API __wrmsrns() to embed WRMSRNS into the code.
> 
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> ---
> 
> Changes since v12:
> * Merge the 3 WRMSRNS patches into one (Borislav Petkov).
> * s/cpu/CPU/g (Borislav Petkov).
> * Shorten the WRMSRNS description (Borislav Petkov).
> ---
>  arch/x86/include/asm/cpufeatures.h       |  1 +
>  arch/x86/include/asm/msr.h               | 18 ++++++++++++++++++
>  arch/x86/lib/x86-opcode-map.txt          |  2 +-
>  tools/arch/x86/include/asm/cpufeatures.h |  1 +
>  tools/arch/x86/lib/x86-opcode-map.txt    |  2 +-
>  5 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 149cc5d5c2ae..a903fc130e49 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -325,6 +325,7 @@
>  #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
>  #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB} */
>  #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS */
> +#define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-serializing WRMSR */
>  #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
>  #define X86_FEATURE_AVX_IFMA            (12*32+23) /* "" Support for VPMADD52[H,L]UQ */
>  #define X86_FEATURE_LAM			(12*32+26) /* Linear Address Masking */
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index 65ec1965cd28..c284ff9ebe67 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -97,6 +97,19 @@ static __always_inline void __wrmsr(unsigned int msr, u32 low, u32 high)
>  		     : : "c" (msr), "a"(low), "d" (high) : "memory");
>  }
>  
> +/*
> + * WRMSRNS behaves exactly like WRMSR with the only difference being
> + * that it is not a serializing instruction by default.
> + */
> +static __always_inline void __wrmsrns(u32 msr, u32 low, u32 high)
> +{
> +	/* Instruction opcode for WRMSRNS; supported in binutils >= 2.40. */
> +	asm volatile("1: .byte 0x0f,0x01,0xc6\n"
> +		     "2:\n"
> +		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
> +		     : : "c" (msr), "a"(low), "d" (high));
> +}
> +
>  #define native_rdmsr(msr, val1, val2)			\
>  do {							\
>  	u64 __val = __rdmsr((msr));			\
> @@ -297,6 +310,11 @@ do {							\
>  
>  #endif	/* !CONFIG_PARAVIRT_XXL */
>  
> +static __always_inline void wrmsrns(u32 msr, u64 val)
> +{
> +	__wrmsrns(msr, val, val >> 32);
> +}
> +
>  /*
>   * 64-bit version of wrmsr_safe():
>   */
> diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
> index 5168ee0360b2..1efe1d9bf5ce 100644
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -1051,7 +1051,7 @@ GrpTable: Grp6
>  EndTable
>  
>  GrpTable: Grp7
> -0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
> +0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
>  1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
>  3: LIDT Ms
> diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
> index 4af140cf5719..26a73ae18a86 100644
> --- a/tools/arch/x86/include/asm/cpufeatures.h
> +++ b/tools/arch/x86/include/asm/cpufeatures.h
> @@ -322,6 +322,7 @@
>  #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
>  #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB} */
>  #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS */
> +#define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-serializing WRMSR */
>  #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
>  #define X86_FEATURE_AVX_IFMA            (12*32+23) /* "" Support for VPMADD52[H,L]UQ */
>  #define X86_FEATURE_LAM			(12*32+26) /* Linear Address Masking */
> diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
> index 5168ee0360b2..1efe1d9bf5ce 100644
> --- a/tools/arch/x86/lib/x86-opcode-map.txt
> +++ b/tools/arch/x86/lib/x86-opcode-map.txt
> @@ -1051,7 +1051,7 @@ GrpTable: Grp6
>  EndTable
>  
>  GrpTable: Grp7
> -0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
> +0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B) | WRMSRNS (110),(11B)
>  1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
>  3: LIDT Ms
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

