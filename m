Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F294A9334E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 09:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958745.1351417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fvx-0001zi-Gc; Fri, 18 Apr 2025 07:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958745.1351417; Fri, 18 Apr 2025 07:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fvx-0001uY-Cz; Fri, 18 Apr 2025 07:14:45 +0000
Received: by outflank-mailman (input) for mailman id 958745;
 Fri, 18 Apr 2025 07:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iJE8=XE=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1u5fvw-0001sw-H9
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 07:14:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd1fc49e-1c24-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 09:14:43 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5f435c9f2f9so2471548a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 00:14:43 -0700 (PDT)
Received: from fedora.. ([193.77.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f625a5ec5bsm667619a12.81.2025.04.18.00.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:14:42 -0700 (PDT)
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
X-Inumbo-ID: cd1fc49e-1c24-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744960483; x=1745565283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFx34+qBm/59SvTL7iTt7bIIp4e1pGYsUrJXj+WCcsk=;
        b=kHT6I4JoRo4n958mb35EE3b/ndY7hpxvHJXRmaqzJmS919YL2lF3659og2rdiYdC8m
         oxBnAxosk2554CFMi5nP45Tl/ajFbl7e3FAIDVpOj6ix6gd12P7/PdysNSg9LZIOAL0t
         HkRAEUD6mBoH7y/8bDuqb92aaYU4NtNO9Ku05hdz9rco1RT4/A81Ifm3XeBKkMxtYwOV
         tE7OgBjNzLscdgwr5NEyTlkTJ9mDf/pdFJRl4dUWOtVKmGuNUXQK3jHLeGG5MRbDtvMv
         AdE+1CpAcubhCB/to1SIwRBN/6/pJGhcxRfnjvCC/vfVIVh7FcrYx7jtiVVL0YTdpV4h
         UzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960483; x=1745565283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFx34+qBm/59SvTL7iTt7bIIp4e1pGYsUrJXj+WCcsk=;
        b=cGlST7KWXQXrk5z1oG7KMABHLxRXQKf7Oozmc96cCC9GKFi88e1kbrTPoWoFREnibk
         JgG6Bw61xPKLHtpo4it9aMh1eqxrqGW8UNlRojR8aiJQ5/jLujAbBjzwaNmGk521nCpu
         kUn1c5CnBv+sOhCZ9Oi8ppTFK+oPmC2PDzoR96Tf8dwufS/pe2MkutHX1LXdxeEKR7nc
         26V0bNgjeA+QblXT+K+b6xVSLu6vyB3wjiPX7tnZ82TyKX9N2kpAfJ1LezSyxWAEFAo3
         N6m52x+OzV9HdO4G+eeJGuEpNZnmLkTHqQJKIBupfmfmo9QKUcl0ExofVSLXiMdjolpE
         PDSw==
X-Forwarded-Encrypted: i=1; AJvYcCW7d7yE3ObqaPvthE/FU4G+zLhj8Ys2OhWPkXqOvLIvAdyA4c8DaWqktxRAS5UEBczfvTN0z5YLV/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYwWlrFhzeO6j2zOwk3urr1s4omIPdv5m8QU8YKlIWK5gdWjR9
	sVi0/L62/0xq9iT7bo4eV06jX9itpJCd0x3BDDt+2pBlG7VIiiET
X-Gm-Gg: ASbGncs2OYaLbIjWZhznjCV2YhaqRo0DhbLOPel188YL2SajDHO7z64AnUtlaJJNUTZ
	8DClPnwEsIepN37dLfu11fgfmE8Rxo3thEcXoGNWy6NVlDVclsT/qFUZVzTrRHvkmmy4ZI/6MO0
	aq1htlC1GhVRVMBTGkx4fjEGD9Fo5fe6Vv8RyJjhr23Uc2pjsgEmxMr+dpXJVcqFgNSs2iWmhDN
	jAwMbJxFCpjzZ5YJHqKw3moMcKpjrNu3H9engc9Ch/2dIFsdpVBIPxySlh3GVsTWhHJhfQRQevk
	zTVv+vYnfKbL9lta3g5oZNum/u3XZUBP
X-Google-Smtp-Source: AGHT+IHyAv8ZFczf4w8OHn4dFYovzMpxaqvgJ/r0oLf6fENeJLUuhc5Zqo8P/+9SL6uhW52HFgUZ7w==
X-Received: by 2002:a17:907:6e8a:b0:aca:d4f0:2b9f with SMTP id a640c23a62f3a-acb74ad8451mr124874066b.10.1744960482716;
        Fri, 18 Apr 2025 00:14:42 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-video@atrey.karlin.mff.cuni.cz,
	xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH -tip v2 2/2] x86/asm: Remove semicolon from "rep" prefixes
Date: Fri, 18 Apr 2025 09:13:51 +0200
Message-ID: <20250418071437.4144391-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418071437.4144391-1-ubizjak@gmail.com>
References: <20250418071437.4144391-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum version of binutils required to compile the kernel is 2.25.
This version correctly handles the "rep" prefixes, so it is possible
to remove the semicolon, which was used to support ancient versions
of GNU as.

Due to the semicolon, the compiler considers "rep; insn" (or its
alternate "rep\n\tinsn" form) as two separate instructions. Removing
the semicolon makes asm length calculations more accurate, consequently
making scheduling and inlining decisions of the compiler more accurate.

Removing the semicolon also enables assembler checks involving "rep"
prefixes. Trying to assemble e.g. "rep addl %eax, %ebx" results in:

  Error: invalid instruction `add' after `rep'

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
---
v2: Split the patch from the previous version.
---
 arch/x86/include/asm/io.h            |  6 +++---
 arch/x86/include/asm/string_32.h     | 15 ++++++---------
 arch/x86/kernel/head_32.S            |  8 +++-----
 arch/x86/kernel/relocate_kernel_32.S |  6 +++---
 arch/x86/kernel/relocate_kernel_64.S |  6 +++---
 arch/x86/lib/iomem.c                 |  2 +-
 arch/x86/lib/string_32.c             | 17 ++++++-----------
 arch/x86/lib/strstr_32.c             |  6 ++----
 arch/x86/lib/usercopy_32.c           | 18 +++++++++---------
 arch/x86/platform/pvh/head.S         |  3 +--
 arch/x86/power/hibernate_asm_32.S    |  3 +--
 arch/x86/power/hibernate_asm_64.S    |  3 +--
 12 files changed, 39 insertions(+), 54 deletions(-)

diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index e889c3bab5a2..ca309a3227c7 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -217,7 +217,7 @@ void memset_io(volatile void __iomem *, int, size_t);
 static inline void __iowrite32_copy(void __iomem *to, const void *from,
 				    size_t count)
 {
-	asm volatile("rep ; movsl"
+	asm volatile("rep movsl"
 		     : "=&c"(count), "=&D"(to), "=&S"(from)
 		     : "0"(count), "1"(to), "2"(from)
 		     : "memory");
@@ -282,7 +282,7 @@ static inline void outs##bwl(u16 port, const void *addr, unsigned long count) \
 			count--;					\
 		}							\
 	} else {							\
-		asm volatile("rep; outs" #bwl				\
+		asm volatile("rep outs" #bwl				\
 			     : "+S"(addr), "+c"(count)			\
 			     : "d"(port) : "memory");			\
 	}								\
@@ -298,7 +298,7 @@ static inline void ins##bwl(u16 port, void *addr, unsigned long count)	\
 			count--;					\
 		}							\
 	} else {							\
-		asm volatile("rep; ins" #bwl				\
+		asm volatile("rep ins" #bwl				\
 			     : "+D"(addr), "+c"(count)			\
 			     : "d"(port) : "memory");			\
 	}								\
diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index 32c0d981a82a..e9cce169bb4c 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -33,11 +33,11 @@ extern size_t strlen(const char *s);
 static __always_inline void *__memcpy(void *to, const void *from, size_t n)
 {
 	int d0, d1, d2;
-	asm volatile("rep ; movsl\n\t"
+	asm volatile("rep movsl\n\t"
 		     "movl %4,%%ecx\n\t"
 		     "andl $3,%%ecx\n\t"
 		     "jz 1f\n\t"
-		     "rep ; movsb\n\t"
+		     "rep movsb\n\t"
 		     "1:"
 		     : "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		     : "0" (n / 4), "g" (n), "1" ((long)to), "2" ((long)from)
@@ -89,7 +89,7 @@ static __always_inline void *__constant_memcpy(void *to, const void *from,
 	if (n >= 5 * 4) {
 		/* large block: use rep prefix */
 		int ecx;
-		asm volatile("rep ; movsl"
+		asm volatile("rep movsl"
 			     : "=&c" (ecx), "=&D" (edi), "=&S" (esi)
 			     : "0" (n / 4), "1" (edi), "2" (esi)
 			     : "memory"
@@ -165,8 +165,7 @@ extern void *memchr(const void *cs, int c, size_t count);
 static inline void *__memset_generic(void *s, char c, size_t count)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosb"
+	asm volatile("rep stosb"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (c), "1" (s), "0" (count)
 		     : "memory");
@@ -199,8 +198,7 @@ extern void *memset(void *, int, size_t);
 static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosw"
+	asm volatile("rep stosw"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (v), "1" (s), "0" (n)
 		     : "memory");
@@ -211,8 +209,7 @@ static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
 static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
 {
 	int d0, d1;
-	asm volatile("rep\n\t"
-		     "stosl"
+	asm volatile("rep stosl"
 		     : "=&c" (d0), "=&D" (d1)
 		     : "a" (v), "1" (s), "0" (n)
 		     : "memory");
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 2e42056d2306..76743dfad6ab 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -86,7 +86,7 @@ SYM_CODE_START(startup_32)
 	movl $pa(__bss_stop),%ecx
 	subl %edi,%ecx
 	shrl $2,%ecx
-	rep ; stosl
+	rep stosl
 /*
  * Copy bootup parameters out of the way.
  * Note: %esi still has the pointer to the real-mode data.
@@ -98,15 +98,13 @@ SYM_CODE_START(startup_32)
 	movl $pa(boot_params),%edi
 	movl $(PARAM_SIZE/4),%ecx
 	cld
-	rep
-	movsl
+	rep movsl
 	movl pa(boot_params) + NEW_CL_POINTER,%esi
 	andl %esi,%esi
 	jz 1f			# No command line
 	movl $pa(boot_command_line),%edi
 	movl $(COMMAND_LINE_SIZE/4),%ecx
-	rep
-	movsl
+	rep movsl
 1:
 
 #ifdef CONFIG_OLPC
diff --git a/arch/x86/kernel/relocate_kernel_32.S b/arch/x86/kernel/relocate_kernel_32.S
index c7c4b1917336..57276f134d12 100644
--- a/arch/x86/kernel/relocate_kernel_32.S
+++ b/arch/x86/kernel/relocate_kernel_32.S
@@ -263,17 +263,17 @@ SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
 
 	movl	%edx, %edi
 	movl    $1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	movl	%ebp, %edi
 	movl	%eax, %esi
 	movl	$1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	movl	%eax, %edi
 	movl	%edx, %esi
 	movl	$1024, %ecx
-	rep ; movsl
+	rep movsl
 
 	lea	PAGE_SIZE(%ebp), %esi
 	jmp     0b
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 3062cb3efc44..1d6355227bf6 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -363,20 +363,20 @@ SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
 	/* copy source page to swap page */
 	movq	kexec_pa_swap_page(%rip), %rdi
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	/* copy destination page to source page */
 	movq	%rax, %rdi
 	movq	%rdx, %rsi
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	/* copy swap page to destination page */
 	movq	%rdx, %rdi
 	movq	kexec_pa_swap_page(%rip), %rsi
 .Lnoswap:
 	movl	$512, %ecx
-	rep ; movsq
+	rep movsq
 
 	lea	PAGE_SIZE(%rax), %rsi
 	jmp	.Lloop
diff --git a/arch/x86/lib/iomem.c b/arch/x86/lib/iomem.c
index 5eecb45d05d5..c20e04764edc 100644
--- a/arch/x86/lib/iomem.c
+++ b/arch/x86/lib/iomem.c
@@ -10,7 +10,7 @@
 static __always_inline void rep_movs(void *to, const void *from, size_t n)
 {
 	unsigned long d0, d1, d2;
-	asm volatile("rep ; movsl\n\t"
+	asm volatile("rep movsl\n\t"
 		     "testb $2,%b4\n\t"
 		     "je 1f\n\t"
 		     "movsw\n"
diff --git a/arch/x86/lib/string_32.c b/arch/x86/lib/string_32.c
index 53b3f202267c..f87ec24fa579 100644
--- a/arch/x86/lib/string_32.c
+++ b/arch/x86/lib/string_32.c
@@ -40,8 +40,7 @@ char *strncpy(char *dest, const char *src, size_t count)
 		"stosb\n\t"
 		"testb %%al,%%al\n\t"
 		"jne 1b\n\t"
-		"rep\n\t"
-		"stosb\n"
+		"rep stosb\n"
 		"2:"
 		: "=&S" (d0), "=&D" (d1), "=&c" (d2), "=&a" (d3)
 		: "0" (src), "1" (dest), "2" (count) : "memory");
@@ -54,8 +53,7 @@ EXPORT_SYMBOL(strncpy);
 char *strcat(char *dest, const char *src)
 {
 	int d0, d1, d2, d3;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"decl %1\n"
 		"1:\tlodsb\n\t"
 		"stosb\n\t"
@@ -72,8 +70,7 @@ EXPORT_SYMBOL(strcat);
 char *strncat(char *dest, const char *src, size_t count)
 {
 	int d0, d1, d2, d3;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"decl %1\n\t"
 		"movl %8,%3\n"
 		"1:\tdecl %3\n\t"
@@ -167,8 +164,7 @@ size_t strlen(const char *s)
 {
 	int d0;
 	size_t res;
-	asm volatile("repne\n\t"
-		"scasb"
+	asm volatile("repne scasb"
 		: "=c" (res), "=&D" (d0)
 		: "1" (s), "a" (0), "0" (0xffffffffu)
 		: "memory");
@@ -184,8 +180,7 @@ void *memchr(const void *cs, int c, size_t count)
 	void *res;
 	if (!count)
 		return NULL;
-	asm volatile("repne\n\t"
-		"scasb\n\t"
+	asm volatile("repne scasb\n\t"
 		"je 1f\n\t"
 		"movl $1,%0\n"
 		"1:\tdecl %0"
@@ -202,7 +197,7 @@ void *memscan(void *addr, int c, size_t size)
 {
 	if (!size)
 		return addr;
-	asm volatile("repnz; scasb\n\t"
+	asm volatile("repnz scasb\n\t"
 	    "jnz 1f\n\t"
 	    "dec %%edi\n"
 	    "1:"
diff --git a/arch/x86/lib/strstr_32.c b/arch/x86/lib/strstr_32.c
index 38f37df056f7..28267985e85f 100644
--- a/arch/x86/lib/strstr_32.c
+++ b/arch/x86/lib/strstr_32.c
@@ -8,16 +8,14 @@ int	d0, d1;
 register char *__res;
 __asm__ __volatile__(
 	"movl %6,%%edi\n\t"
-	"repne\n\t"
-	"scasb\n\t"
+	"repne scasb\n\t"
 	"notl %%ecx\n\t"
 	"decl %%ecx\n\t"	/* NOTE! This also sets Z if searchstring='' */
 	"movl %%ecx,%%edx\n"
 	"1:\tmovl %6,%%edi\n\t"
 	"movl %%esi,%%eax\n\t"
 	"movl %%edx,%%ecx\n\t"
-	"repe\n\t"
-	"cmpsb\n\t"
+	"repe cmpsb\n\t"
 	"je 2f\n\t"		/* also works for empty string, see above */
 	"xchgl %%eax,%%esi\n\t"
 	"incl %%esi\n\t"
diff --git a/arch/x86/lib/usercopy_32.c b/arch/x86/lib/usercopy_32.c
index 422257c350c6..f6f436f1d573 100644
--- a/arch/x86/lib/usercopy_32.c
+++ b/arch/x86/lib/usercopy_32.c
@@ -38,9 +38,9 @@ do {									\
 	might_fault();							\
 	__asm__ __volatile__(						\
 		ASM_STAC "\n"						\
-		"0:	rep; stosl\n"					\
+		"0:	rep stosl\n"					\
 		"	movl %2,%0\n"					\
-		"1:	rep; stosb\n"					\
+		"1:	rep stosb\n"					\
 		"2: " ASM_CLAC "\n"					\
 		_ASM_EXTABLE_TYPE_REG(0b, 2b, EX_TYPE_UCOPY_LEN4, %2)	\
 		_ASM_EXTABLE_UA(1b, 2b)					\
@@ -140,9 +140,9 @@ __copy_user_intel(void __user *to, const void *from, unsigned long size)
 		       "       shrl  $2, %0\n"
 		       "       andl  $3, %%eax\n"
 		       "       cld\n"
-		       "99:    rep; movsl\n"
+		       "99:    rep movsl\n"
 		       "36:    movl %%eax, %0\n"
-		       "37:    rep; movsb\n"
+		       "37:    rep movsb\n"
 		       "100:\n"
 		       _ASM_EXTABLE_UA(1b, 100b)
 		       _ASM_EXTABLE_UA(2b, 100b)
@@ -242,9 +242,9 @@ static unsigned long __copy_user_intel_nocache(void *to,
 	       "        shrl  $2, %0\n"
 	       "        andl $3, %%eax\n"
 	       "        cld\n"
-	       "6:      rep; movsl\n"
+	       "6:      rep movsl\n"
 	       "        movl %%eax,%0\n"
-	       "7:      rep; movsb\n"
+	       "7:      rep movsb\n"
 	       "8:\n"
 	       _ASM_EXTABLE_UA(0b, 8b)
 	       _ASM_EXTABLE_UA(1b, 8b)
@@ -293,14 +293,14 @@ do {									\
 		"	negl %0\n"					\
 		"	andl $7,%0\n"					\
 		"	subl %0,%3\n"					\
-		"4:	rep; movsb\n"					\
+		"4:	rep movsb\n"					\
 		"	movl %3,%0\n"					\
 		"	shrl $2,%0\n"					\
 		"	andl $3,%3\n"					\
 		"	.align 2,0x90\n"				\
-		"0:	rep; movsl\n"					\
+		"0:	rep movsl\n"					\
 		"	movl %3,%0\n"					\
-		"1:	rep; movsb\n"					\
+		"1:	rep movsb\n"					\
 		"2:\n"							\
 		_ASM_EXTABLE_TYPE_REG(4b, 2b, EX_TYPE_UCOPY_LEN1, %3)	\
 		_ASM_EXTABLE_TYPE_REG(0b, 2b, EX_TYPE_UCOPY_LEN4, %3)	\
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index cfa18ec7d55f..1d78e5631bb8 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -87,8 +87,7 @@ SYM_CODE_START(pvh_start_xen)
 	mov %ebx, %esi
 	movl rva(pvh_start_info_sz)(%ebp), %ecx
 	shr $2,%ecx
-	rep
-	movsl
+	rep movsl
 
 	leal rva(early_stack_end)(%ebp), %esp
 
diff --git a/arch/x86/power/hibernate_asm_32.S b/arch/x86/power/hibernate_asm_32.S
index 5606a15cf9a1..fb910d9f8471 100644
--- a/arch/x86/power/hibernate_asm_32.S
+++ b/arch/x86/power/hibernate_asm_32.S
@@ -69,8 +69,7 @@ copy_loop:
 	movl	pbe_orig_address(%edx), %edi
 
 	movl	$(PAGE_SIZE >> 2), %ecx
-	rep
-	movsl
+	rep movsl
 
 	movl	pbe_next(%edx), %edx
 	jmp	copy_loop
diff --git a/arch/x86/power/hibernate_asm_64.S b/arch/x86/power/hibernate_asm_64.S
index 66f066b8feda..c73be0a02a6c 100644
--- a/arch/x86/power/hibernate_asm_64.S
+++ b/arch/x86/power/hibernate_asm_64.S
@@ -138,8 +138,7 @@ SYM_FUNC_START(core_restore_code)
 	movq	pbe_address(%rdx), %rsi
 	movq	pbe_orig_address(%rdx), %rdi
 	movq	$(PAGE_SIZE >> 3), %rcx
-	rep
-	movsq
+	rep movsq
 
 	/* progress to the next pbe */
 	movq	pbe_next(%rdx), %rdx
-- 
2.49.0


