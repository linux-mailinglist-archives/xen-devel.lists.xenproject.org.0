Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F87C7855
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616034.957715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2pj-0000Zq-2g; Thu, 12 Oct 2023 21:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616034.957715; Thu, 12 Oct 2023 21:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2pj-0000Xx-04; Thu, 12 Oct 2023 21:03:03 +0000
Received: by outflank-mailman (input) for mailman id 616034;
 Thu, 12 Oct 2023 21:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WWXW=F2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qr2ph-0000XL-40
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:03:01 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b838391b-6942-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 23:02:59 +0200 (CEST)
Received: from [127.0.0.1] ([98.35.210.218]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39CL2DY81845907
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 12 Oct 2023 14:02:14 -0700
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
X-Inumbo-ID: b838391b-6942-11ee-98d4-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39CL2DY81845907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1697144534;
	bh=q56mKPoe4hCxwoHF+UPZpSu/qOZ6GuzzYRQj/W6qKCs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=uoN1e+CWPrYLHNeCHmC78rmN/Tob+gntiRqFoOwTBRqEh9KrJdCjalO/kvA0QD+fN
	 wCl6Ge6HJhiPgP4DJj5Dk9FDZIPTpvRK8hTskB9YQYsnv5gxGAcqpwyxthjxQbaNcp
	 E6RGaifNOmFDqhxsmibHsRJ9ijNffFwZ1H1K87m+WHgy42c3fbwGI/pw3rEhtsfaCk
	 Ugvc1FujWuPyYTIlbr3/FaAGEgJAzsdOQ8bAu52hUVVdkB+xCyGHR8sr02hBTqLVOn
	 XGgTgAPBxf4axQuTOOEnl6sYQtcyR73+VRMKPk+1/bgBJfD08b8jJh6/PQy4EqeqGb
	 uINQxOccjTjoA==
Date: Thu, 12 Oct 2023 14:02:12 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/4=5D_x86/percpu=3A_Use_explicit_se?= =?US-ASCII?Q?gment_registers_in_lib/cmpxchg=7B8=2C16=7Db=5Femu=2ES?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231012161237.114733-2-ubizjak@gmail.com>
References: <20231012161237.114733-1-ubizjak@gmail.com> <20231012161237.114733-2-ubizjak@gmail.com>
Message-ID: <E2A4E3BD-10C1-43F7-AD6D-1037C7106F8B@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 12, 2023 9:10:36 AM PDT, Uros Bizjak <ubizjak@gmail=2Ecom> wrote=
:
>PER_CPU_VAR macro is intended to be applied to a symbol, it is not
>intended to be used as a selector between %fs and %gs segment
>registers for general operands=2E
>
>The address to these emulation functions is passed in a register, so
>use explicit segment registers to access percpu variable instead=2E
>
>Also add a missing function comment to this_cpu_cmpxchg8b_emu=2E
>
>No functional changes intended=2E
>
>Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>Cc: Ingo Molnar <mingo@redhat=2Ecom>
>Cc: Borislav Petkov <bp@alien8=2Ede>
>Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>Cc: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>Cc: Peter Zijlstra <peterz@infradead=2Eorg>
>Signed-off-by: Uros Bizjak <ubizjak@gmail=2Ecom>
>---
> arch/x86/lib/cmpxchg16b_emu=2ES | 12 ++++++------
> arch/x86/lib/cmpxchg8b_emu=2ES  | 30 +++++++++++++++++++++---------
> 2 files changed, 27 insertions(+), 15 deletions(-)
>
>diff --git a/arch/x86/lib/cmpxchg16b_emu=2ES b/arch/x86/lib/cmpxchg16b_em=
u=2ES
>index 6962df315793=2E=2E2bd8b89bce75 100644
>--- a/arch/x86/lib/cmpxchg16b_emu=2ES
>+++ b/arch/x86/lib/cmpxchg16b_emu=2ES
>@@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> 	cli
>=20
> 	/* if (*ptr =3D=3D old) */
>-	cmpq	PER_CPU_VAR(0(%rsi)), %rax
>+	cmpq	%gs:(%rsi), %rax
> 	jne	=2ELnot_same
>-	cmpq	PER_CPU_VAR(8(%rsi)), %rdx
>+	cmpq	%gs:8(%rsi), %rdx
> 	jne	=2ELnot_same
>=20
> 	/* *ptr =3D new */
>-	movq	%rbx, PER_CPU_VAR(0(%rsi))
>-	movq	%rcx, PER_CPU_VAR(8(%rsi))
>+	movq	%rbx, %gs:(%rsi)
>+	movq	%rcx, %gs:8(%rsi)
>=20
> 	/* set ZF in EFLAGS to indicate success */
> 	orl	$X86_EFLAGS_ZF, (%rsp)
>@@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> 	/* *ptr !=3D old */
>=20
> 	/* old =3D *ptr */
>-	movq	PER_CPU_VAR(0(%rsi)), %rax
>-	movq	PER_CPU_VAR(8(%rsi)), %rdx
>+	movq	%gs:(%rsi), %rax
>+	movq	%gs:8(%rsi), %rdx
>=20
> 	/* clear ZF in EFLAGS to indicate failure */
> 	andl	$(~X86_EFLAGS_ZF), (%rsp)
>diff --git a/arch/x86/lib/cmpxchg8b_emu=2ES b/arch/x86/lib/cmpxchg8b_emu=
=2ES
>index 49805257b125=2E=2Eb7d68d5e2d31 100644
>--- a/arch/x86/lib/cmpxchg8b_emu=2ES
>+++ b/arch/x86/lib/cmpxchg8b_emu=2ES
>@@ -24,12 +24,12 @@ SYM_FUNC_START(cmpxchg8b_emu)
> 	pushfl
> 	cli
>=20
>-	cmpl	0(%esi), %eax
>+	cmpl	(%esi), %eax
> 	jne	=2ELnot_same
> 	cmpl	4(%esi), %edx
> 	jne	=2ELnot_same
>=20
>-	movl	%ebx, 0(%esi)
>+	movl	%ebx, (%esi)
> 	movl	%ecx, 4(%esi)
>=20
> 	orl	$X86_EFLAGS_ZF, (%esp)
>@@ -38,7 +38,7 @@ SYM_FUNC_START(cmpxchg8b_emu)
> 	RET
>=20
> =2ELnot_same:
>-	movl	0(%esi), %eax
>+	movl	(%esi), %eax
> 	movl	4(%esi), %edx
>=20
> 	andl	$(~X86_EFLAGS_ZF), (%esp)
>@@ -53,18 +53,30 @@ EXPORT_SYMBOL(cmpxchg8b_emu)
>=20
> #ifndef CONFIG_UML
>=20
>+/*
>+ * Emulate 'cmpxchg8b %fs:(%esi)'
>+ *
>+ * Inputs:
>+ * %esi : memory location to compare
>+ * %eax : low 32 bits of old value
>+ * %edx : high 32 bits of old value
>+ * %ebx : low 32 bits of new value
>+ * %ecx : high 32 bits of new value
>+ *
>+ * Notably this is not LOCK prefixed and is not safe against NMIs
>+ */
> SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
>=20
> 	pushfl
> 	cli
>=20
>-	cmpl	PER_CPU_VAR(0(%esi)), %eax
>+	cmpl	%fs:(%esi), %eax
> 	jne	=2ELnot_same2
>-	cmpl	PER_CPU_VAR(4(%esi)), %edx
>+	cmpl	%fs:4(%esi), %edx
> 	jne	=2ELnot_same2
>=20
>-	movl	%ebx, PER_CPU_VAR(0(%esi))
>-	movl	%ecx, PER_CPU_VAR(4(%esi))
>+	movl	%ebx, %fs:(%esi)
>+	movl	%ecx, %fs:4(%esi)
>=20
> 	orl	$X86_EFLAGS_ZF, (%esp)
>=20
>@@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> 	RET
>=20
> =2ELnot_same2:
>-	movl	PER_CPU_VAR(0(%esi)), %eax
>-	movl	PER_CPU_VAR(4(%esi)), %edx
>+	movl	%fs:(%esi), %eax
>+	movl	%fs:4(%esi), %edx
>=20
> 	andl	$(~X86_EFLAGS_ZF), (%esp)
>=20

%fs??

