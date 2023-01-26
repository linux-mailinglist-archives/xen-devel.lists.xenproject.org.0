Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69067CD62
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 15:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485052.751996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL32T-0002WO-08; Thu, 26 Jan 2023 14:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485052.751996; Thu, 26 Jan 2023 14:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL32S-0002Uf-SG; Thu, 26 Jan 2023 14:15:40 +0000
Received: by outflank-mailman (input) for mailman id 485052;
 Thu, 26 Jan 2023 14:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onDU=5X=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pL32P-0002UZ-QS
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 14:15:39 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e318ca3a-9d83-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 15:15:32 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pL31L-002TOI-34; Thu, 26 Jan 2023 14:14:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 784893002BF;
 Thu, 26 Jan 2023 15:15:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2587D203C2B1E; Thu, 26 Jan 2023 15:15:00 +0100 (CET)
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
X-Inumbo-ID: e318ca3a-9d83-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iS3Z4P4S5Y5WqQAB/YRDv8NY/GBojbeqpUql4Ne3Mbs=; b=h/u1WI1OuFtZGHQY7znWc8oCl+
	RXuDaL+k7nzlzQ0mXBMm73He6KVpyLCbc0I1V7FqJjsZbdzbGyF0VPzI803s6cvfrUxNn7vZtftVS
	U1GnxKIoGxMd//et4YwQywjy3Jo/X4g8STKiP9cA9H13olFEjSaL48aMdG+OfWc+cAbIqtUE9XaAg
	OkoaF0QiKM+WLyV67D5P/VfojkNgwtMbdMkUuFomo3icyfSRKqgaHOvnn4rsXiHWlwmDr94hoXYfK
	4JvsEWHG1/Iu6uzuz4pMJJadoVJ24d0PZ0iP+cpZmpPXw3Vg00LKCtmo0an2vrna4+vVNcFOa+C2T
	UErXYD/A==;
Date: Thu, 26 Jan 2023 15:15:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, jroedel@suse.de,
	kirill.shutemov@linux.intel.com, dave.hansen@intel.com,
	kai.huang@intel.com
Subject: Re: [PATCH v2 1/7] x86/boot: Remove verify_cpu() from
 secondary_startup_64()
Message-ID: <Y9KK5IQbORNFUqqV@hirez.programming.kicks-ass.net>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.589522290@infradead.org>
 <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>
 <5718C98C-C07A-4BD1-9182-7F3A8BDBC605@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5718C98C-C07A-4BD1-9182-7F3A8BDBC605@zytor.com>

On Thu, Jan 19, 2023 at 11:35:06AM -0800, H. Peter Anvin wrote:
> On January 18, 2023 1:45:44 AM PST, Peter Zijlstra <peterz@infradead.org> wrote:
> >On Mon, Jan 16, 2023 at 03:25:34PM +0100, Peter Zijlstra wrote:
> >> The boot trampolines from trampoline_64.S have code flow like:
> >> 
> >>   16bit BIOS			SEV-ES				64bit EFI
> >> 
> >>   trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
> >>     verify_cpu()			  |				|
> >>   switch_to_protected:    <---------------'				v
> >>        |							pa_trampoline_compat()
> >>        v								|
> >>   startup_32()		<-----------------------------------------------'
> >>        |
> >>        v
> >>   startup_64()
> >>        |
> >>        v
> >>   tr_start() := head_64.S:secondary_startup_64()
> >> 
> >> Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
> >> touch the APs), there is already a verify_cpu() invocation.
> >
> >So supposedly TDX/ACPI-6.4 comes in on trampoline_startup64() for APs --
> >can any of the TDX capable folks tell me if we need verify_cpu() on
> >these?
> >
> >Aside from checking for LM, it seems to clear XD_DISABLE on Intel and
> >force enable SSE on AMD/K7. Surely none of that is needed for these
> >shiny new chips?
> >
> >I mean, I can hack up a patch that adds verify_cpu() to the 64bit entry
> >point, but it seems really sad to need that on modern systems.
> 
> Sad, perhaps, but really better for orthogonality – fewer special cases.

I'd argue more, but whatever. XD_DISABLE is an abomination and 64bit
entry points should care about it just as much as having LM. And this
way we have 2/3 instead of 1/3 entry points do 'special' nonsense.

I ended up with this trainwreck, it adds verify_cpu to
pa_trampoline_compat() because for some raisin it doesn't want to
assemble when placed in trampoline_start64().

Is this really what we want?

---

--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -689,9 +689,14 @@ SYM_FUNC_START_LOCAL_NOALIGN(.Lno_longmo
 	jmp     1b
 SYM_FUNC_END(.Lno_longmode)
 
-	.globl	verify_cpu
 #include "../../kernel/verify_cpu.S"
 
+	.globl	verify_cpu
+SYM_FUNC_START_LOCAL(verify_cpu)
+	VERIFY_CPU
+	RET
+SYM_FUNC_END(verify_cpu)
+
 	.data
 SYM_DATA_START_LOCAL(gdt64)
 	.word	gdt_end - gdt - 1
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -321,6 +321,11 @@ SYM_FUNC_END(startup_32_smp)
 
 #include "verify_cpu.S"
 
+SYM_FUNC_START_LOCAL(verify_cpu)
+	VERIFY_CPU
+	RET
+SYM_FUNC_END(verify_cpu)
+
 __INIT
 SYM_FUNC_START(early_idt_handler_array)
 	# 36(%esp) %eflags
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -345,6 +345,12 @@ SYM_CODE_START(secondary_startup_64)
 SYM_CODE_END(secondary_startup_64)
 
 #include "verify_cpu.S"
+
+SYM_FUNC_START_LOCAL(verify_cpu)
+	VERIFY_CPU
+	RET
+SYM_FUNC_END(verify_cpu)
+
 #include "sev_verify_cbit.S"
 
 #ifdef CONFIG_HOTPLUG_CPU
--- a/arch/x86/kernel/verify_cpu.S
+++ b/arch/x86/kernel/verify_cpu.S
@@ -31,7 +31,7 @@
 #include <asm/cpufeatures.h>
 #include <asm/msr-index.h>
 
-SYM_FUNC_START_LOCAL(verify_cpu)
+.macro VERIFY_CPU
 	pushf				# Save caller passed flags
 	push	$0			# Kill any dangerous flags
 	popf
@@ -46,31 +46,31 @@ SYM_FUNC_START_LOCAL(verify_cpu)
 	pushfl
 	popl	%eax
 	cmpl	%eax,%ebx
-	jz	.Lverify_cpu_no_longmode	# cpu has no cpuid
+	jz	.Lverify_cpu_no_longmode_\@	# cpu has no cpuid
 #endif
 
 	movl	$0x0,%eax		# See if cpuid 1 is implemented
 	cpuid
 	cmpl	$0x1,%eax
-	jb	.Lverify_cpu_no_longmode	# no cpuid 1
+	jb	.Lverify_cpu_no_longmode_\@	# no cpuid 1
 
 	xor	%di,%di
 	cmpl	$0x68747541,%ebx	# AuthenticAMD
-	jnz	.Lverify_cpu_noamd
+	jnz	.Lverify_cpu_noamd_\@
 	cmpl	$0x69746e65,%edx
-	jnz	.Lverify_cpu_noamd
+	jnz	.Lverify_cpu_noamd_\@
 	cmpl	$0x444d4163,%ecx
-	jnz	.Lverify_cpu_noamd
+	jnz	.Lverify_cpu_noamd_\@
 	mov	$1,%di			# cpu is from AMD
-	jmp	.Lverify_cpu_check
+	jmp	.Lverify_cpu_check_\@
 
-.Lverify_cpu_noamd:
+.Lverify_cpu_noamd_\@:
 	cmpl	$0x756e6547,%ebx        # GenuineIntel?
-	jnz	.Lverify_cpu_check
+	jnz	.Lverify_cpu_check_\@
 	cmpl	$0x49656e69,%edx
-	jnz	.Lverify_cpu_check
+	jnz	.Lverify_cpu_check_\@
 	cmpl	$0x6c65746e,%ecx
-	jnz	.Lverify_cpu_check
+	jnz	.Lverify_cpu_check_\@
 
 	# only call IA32_MISC_ENABLE when:
 	# family > 6 || (family == 6 && model >= 0xd)
@@ -81,60 +81,62 @@ SYM_FUNC_START_LOCAL(verify_cpu)
 	andl	$0x0ff00f00, %eax	# mask family and extended family
 	shrl	$8, %eax
 	cmpl	$6, %eax
-	ja	.Lverify_cpu_clear_xd	# family > 6, ok
-	jb	.Lverify_cpu_check	# family < 6, skip
+	ja	.Lverify_cpu_clear_xd_\@	# family > 6, ok
+	jb	.Lverify_cpu_check_\@	# family < 6, skip
 
 	andl	$0x000f00f0, %ecx	# mask model and extended model
 	shrl	$4, %ecx
 	cmpl	$0xd, %ecx
-	jb	.Lverify_cpu_check	# family == 6, model < 0xd, skip
+	jb	.Lverify_cpu_check_\@	# family == 6, model < 0xd, skip
 
-.Lverify_cpu_clear_xd:
+.Lverify_cpu_clear_xd_\@:
 	movl	$MSR_IA32_MISC_ENABLE, %ecx
 	rdmsr
 	btrl	$2, %edx		# clear MSR_IA32_MISC_ENABLE_XD_DISABLE
-	jnc	.Lverify_cpu_check	# only write MSR if bit was changed
+	jnc	.Lverify_cpu_check_\@	# only write MSR if bit was changed
 	wrmsr
 
-.Lverify_cpu_check:
+.Lverify_cpu_check_\@:
 	movl    $0x1,%eax		# Does the cpu have what it takes
 	cpuid
 	andl	$REQUIRED_MASK0,%edx
 	xorl	$REQUIRED_MASK0,%edx
-	jnz	.Lverify_cpu_no_longmode
+	jnz	.Lverify_cpu_no_longmode_\@
 
 	movl    $0x80000000,%eax	# See if extended cpuid is implemented
 	cpuid
 	cmpl    $0x80000001,%eax
-	jb      .Lverify_cpu_no_longmode	# no extended cpuid
+	jb      .Lverify_cpu_no_longmode_\@	# no extended cpuid
 
 	movl    $0x80000001,%eax	# Does the cpu have what it takes
 	cpuid
 	andl    $REQUIRED_MASK1,%edx
 	xorl    $REQUIRED_MASK1,%edx
-	jnz     .Lverify_cpu_no_longmode
+	jnz     .Lverify_cpu_no_longmode_\@
 
-.Lverify_cpu_sse_test:
+.Lverify_cpu_sse_test_\@:
 	movl	$1,%eax
 	cpuid
 	andl	$SSE_MASK,%edx
 	cmpl	$SSE_MASK,%edx
-	je	.Lverify_cpu_sse_ok
+	je	.Lverify_cpu_sse_ok_\@
 	test	%di,%di
-	jz	.Lverify_cpu_no_longmode	# only try to force SSE on AMD
+	jz	.Lverify_cpu_no_longmode_\@	# only try to force SSE on AMD
 	movl	$MSR_K7_HWCR,%ecx
 	rdmsr
 	btr	$15,%eax		# enable SSE
 	wrmsr
 	xor	%di,%di			# don't loop
-	jmp	.Lverify_cpu_sse_test	# try again
+	jmp	.Lverify_cpu_sse_test_\@	# try again
 
-.Lverify_cpu_no_longmode:
+.Lverify_cpu_no_longmode_\@:
 	popf				# Restore caller passed flags
 	movl $1,%eax
-	RET
-.Lverify_cpu_sse_ok:
+	jmp	.Lverify_cpu_ret_\@
+
+.Lverify_cpu_sse_ok_\@:
 	popf				# Restore caller passed flags
 	xorl %eax, %eax
-	RET
-SYM_FUNC_END(verify_cpu)
+
+.Lverify_cpu_ret_\@:
+.endm
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -34,6 +34,8 @@
 #include <asm/realmode.h>
 #include "realmode.h"
 
+#include "../kernel/verify_cpu.S"
+
 	.text
 	.code16
 
@@ -52,7 +54,8 @@ SYM_CODE_START(trampoline_start)
 	# Setup stack
 	movl	$rm_stack_end, %esp
 
-	call	verify_cpu		# Verify the cpu supports long mode
+	VERIFY_CPU			# Verify the cpu supports long mode
+
 	testl   %eax, %eax		# Check for return code
 	jnz	no_longmode
 
@@ -100,8 +103,6 @@ SYM_CODE_START(sev_es_trampoline_start)
 SYM_CODE_END(sev_es_trampoline_start)
 #endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
-#include "../kernel/verify_cpu.S"
-
 	.section ".text32","ax"
 	.code32
 	.balign 4
@@ -180,6 +181,8 @@ SYM_CODE_START(pa_trampoline_compat)
 	movl	$rm_stack_end, %esp
 	movw	$__KERNEL_DS, %dx
 
+	VERIFY_CPU
+
 	movl	$(CR0_STATE & ~X86_CR0_PG), %eax
 	movl	%eax, %cr0
 	ljmpl   $__KERNEL32_CS, $pa_startup_32

