Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD1A9334F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 09:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958744.1351412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fvx-0001ud-9V; Fri, 18 Apr 2025 07:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958744.1351412; Fri, 18 Apr 2025 07:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fvx-0001t7-50; Fri, 18 Apr 2025 07:14:45 +0000
Received: by outflank-mailman (input) for mailman id 958744;
 Fri, 18 Apr 2025 07:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iJE8=XE=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1u5fvv-0001sw-WE
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 07:14:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc5cd896-1c24-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 09:14:42 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso3177791a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 00:14:42 -0700 (PDT)
Received: from fedora.. ([193.77.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f625a5ec5bsm667619a12.81.2025.04.18.00.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:14:40 -0700 (PDT)
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
X-Inumbo-ID: cc5cd896-1c24-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744960482; x=1745565282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5woHMQeMVJnProeJ/6Cdzx+SnUrs7izAlab21WdVNXo=;
        b=nPHz7SB8ADW+bx8JJySu7MeKC9dBoZKdKFXJRIEMu8ji9icdwpVlMT8ivALwp/hqBf
         GXpiBwS00uczmmolezcWOlVviDjlEGs3ZUhKaoqYgfduVKJc6D3nyvbsoCqKqBiqBqXd
         VbFfXN+K2uyNs3cxOvd61NZ/E/T04Tthk/ga/BRIC9mgoNbTpa9Cg+HxzPMS/B8RSKnN
         OP08y6aZPsDlgdEPK2RaCDBlhiImxUpVZWcqKcCYHxNkxM0J0RmukNSd2WOlQWuY4oXq
         D72nqvJ+ZhdNLoXg1cTO5Z4FSY3/mWYG5fPGv10Yvjp2V6DzqTjOg+O52FETvgXz92bj
         mtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960482; x=1745565282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5woHMQeMVJnProeJ/6Cdzx+SnUrs7izAlab21WdVNXo=;
        b=tBtOjFE7z6XUzxmcr+5IYdt0mEqADG32GWvBNcT5Rpz65waGaHrxPhei92XsxH6SHB
         D2445H9Vkzdskd0uIYfz/mUSmACA5WMdyBtYDWx4VAe9QJPAIs7yrkt7N4OByPkRwalE
         pFS7uAveh0IpKzU5xgPyPD5y7KQzplitOgZ02gLuCY0NVDpP/dkbSZPp7kEJXIWjHmZt
         IOcBdZaGrNuwh6EV1G3KchmcG3QEVyjW/vjf7Vynqo5tAmzG2kJajUOrYQ28/oZQEtS/
         J/NnUwczPgU/h3UHn5c8u2G0OF7tzJ7NUjB1Sl5XQ4fsLkfnAz8VAZV4hQ2L9DyUxznt
         PNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqK0BVLhZVOyw29Vq3kIstEmZ3B6CjKWv0YlkBgxxa9S8Vw1vJtaRUAXh7X48dBPMGjZQT4kxqFWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxkT6pojfje5L1gWCWKiVcRcSq8M5VAY5SahDSDa5wxJkt2sIv
	XZw+t0H6cKZkvaqyFfycBrXytB13ivBq9dWmke/mYfe80IvCbbc+
X-Gm-Gg: ASbGncsSmXjxxapfT8/IHyNMVeV2UvOjaXZztDsUSXVND22qw3fIMNwe8krDeIVw6vL
	RmoPJoZkooRi+Qpo1yCZdGx66fF43ZIGU4yI/bUxli1q3ZxetBLXfpMfCSn5XXGD6Mh917gFb67
	KXlSBcmIN9ppUf4vYTeFuhPluIjuFwBXafXwDk/s+QVjaIaYjdy6+s/ozi89RNhUouW6G3mS3fr
	VM5qSVLICf1YyD4lUCB3L1t2ZwIMtUwsr+rcRC7d/+wWHrdqI2Gi+1eDAZCsSkvs0Qb4zJ6JiLN
	26kKQOJiQfk1vcYei1yV8cc4jMIQQeAOEPGXx7p850s=
X-Google-Smtp-Source: AGHT+IEMlcURDofq+umzsuPFLiss3QdLovTjMZcPPVHbY8ksiEyTxikdvtWBNS1fdkBA78M8BMMovw==
X-Received: by 2002:a05:6402:1e8e:b0:5f4:c2d0:fbb2 with SMTP id 4fb4d7f45d1cf-5f628597fbbmr1249814a12.18.1744960481435;
        Fri, 18 Apr 2025 00:14:41 -0700 (PDT)
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
	Martin Mares <mj@ucw.cz>
Subject: [PATCH -tip v2 1/2] x86/boot: Remove semicolon from "rep" prefixes
Date: Fri, 18 Apr 2025 09:13:50 +0200
Message-ID: <20250418071437.4144391-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
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
Cc: Martin Mares <mj@ucw.cz>
---
v2: Split the patch from the previous version.
---
 arch/x86/boot/bioscall.S          | 4 ++--
 arch/x86/boot/boot.h              | 4 ++--
 arch/x86/boot/compressed/string.c | 8 ++++----
 arch/x86/boot/copy.S              | 8 ++++----
 arch/x86/boot/header.S            | 2 +-
 arch/x86/boot/string.c            | 2 +-
 arch/x86/boot/video.c             | 2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/x86/boot/bioscall.S b/arch/x86/boot/bioscall.S
index aa9b96457584..cf4a6155714e 100644
--- a/arch/x86/boot/bioscall.S
+++ b/arch/x86/boot/bioscall.S
@@ -32,7 +32,7 @@ intcall:
 	movw	%dx, %si
 	movw	%sp, %di
 	movw	$11, %cx
-	rep; movsl
+	rep movsl
 
 	/* Pop full state from the stack */
 	popal
@@ -67,7 +67,7 @@ intcall:
 	jz	4f
 	movw	%sp, %si
 	movw	$11, %cx
-	rep; movsl
+	rep movsl
 4:	addw	$44, %sp
 
 	/* Restore state and return */
diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 38f17a1e1e36..f3771a6373c7 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -155,14 +155,14 @@ static inline void wrgs32(u32 v, addr_t addr)
 static inline bool memcmp_fs(const void *s1, addr_t s2, size_t len)
 {
 	bool diff;
-	asm volatile("fs; repe; cmpsb" CC_SET(nz)
+	asm volatile("fs repe cmpsb" CC_SET(nz)
 		     : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
 static inline bool memcmp_gs(const void *s1, addr_t s2, size_t len)
 {
 	bool diff;
-	asm volatile("gs; repe; cmpsb" CC_SET(nz)
+	asm volatile("gs repe cmpsb" CC_SET(nz)
 		     : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
diff --git a/arch/x86/boot/compressed/string.c b/arch/x86/boot/compressed/string.c
index 81fc1eaa3229..9af19d9614cb 100644
--- a/arch/x86/boot/compressed/string.c
+++ b/arch/x86/boot/compressed/string.c
@@ -15,9 +15,9 @@ static void *____memcpy(void *dest, const void *src, size_t n)
 {
 	int d0, d1, d2;
 	asm volatile(
-		"rep ; movsl\n\t"
+		"rep movsl\n\t"
 		"movl %4,%%ecx\n\t"
-		"rep ; movsb\n\t"
+		"rep movsb"
 		: "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		: "0" (n >> 2), "g" (n & 3), "1" (dest), "2" (src)
 		: "memory");
@@ -29,9 +29,9 @@ static void *____memcpy(void *dest, const void *src, size_t n)
 {
 	long d0, d1, d2;
 	asm volatile(
-		"rep ; movsq\n\t"
+		"rep movsq\n\t"
 		"movq %4,%%rcx\n\t"
-		"rep ; movsb\n\t"
+		"rep movsb"
 		: "=&c" (d0), "=&D" (d1), "=&S" (d2)
 		: "0" (n >> 3), "g" (n & 7), "1" (dest), "2" (src)
 		: "memory");
diff --git a/arch/x86/boot/copy.S b/arch/x86/boot/copy.S
index 6afd05e819d2..3973a67cd04e 100644
--- a/arch/x86/boot/copy.S
+++ b/arch/x86/boot/copy.S
@@ -22,10 +22,10 @@ SYM_FUNC_START_NOALIGN(memcpy)
 	movw	%dx, %si
 	pushw	%cx
 	shrw	$2, %cx
-	rep; movsl
+	rep movsl
 	popw	%cx
 	andw	$3, %cx
-	rep; movsb
+	rep movsb
 	popw	%di
 	popw	%si
 	retl
@@ -38,10 +38,10 @@ SYM_FUNC_START_NOALIGN(memset)
 	imull	$0x01010101,%eax
 	pushw	%cx
 	shrw	$2, %cx
-	rep; stosl
+	rep stosl
 	popw	%cx
 	andw	$3, %cx
-	rep; stosb
+	rep stosb
 	popw	%di
 	retl
 SYM_FUNC_END(memset)
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359b..9cb91421b4e4 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -585,7 +585,7 @@ start_of_setup:
 	xorl	%eax, %eax
 	subw	%di, %cx
 	shrw	$2, %cx
-	rep; stosl
+	rep stosl
 
 # Jump to C code (should not return)
 	calll	main
diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 84f7a883ce1e..f35369bb14c5 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -32,7 +32,7 @@
 int memcmp(const void *s1, const void *s2, size_t len)
 {
 	bool diff;
-	asm("repe; cmpsb" CC_SET(nz)
+	asm("repe cmpsb" CC_SET(nz)
 	    : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
 	return diff;
 }
diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
index f2e96905b3fe..0641c8c46aee 100644
--- a/arch/x86/boot/video.c
+++ b/arch/x86/boot/video.c
@@ -292,7 +292,7 @@ static void restore_screen(void)
 			     "shrw %%cx ; "
 			     "jnc 1f ; "
 			     "stosw \n\t"
-			     "1: rep;stosl ; "
+			     "1: rep stosl ; "
 			     "popw %%es"
 			     : "+D" (dst), "+c" (npad)
 			     : "bdS" (video_segment),
-- 
2.49.0


