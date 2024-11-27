Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589B9DA638
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844670.1260158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFhY-0003W8-UU; Wed, 27 Nov 2024 10:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844670.1260158; Wed, 27 Nov 2024 10:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFhY-0003TE-Rx; Wed, 27 Nov 2024 10:55:20 +0000
Received: by outflank-mailman (input) for mailman id 844670;
 Wed, 27 Nov 2024 10:55:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGFhX-0003T8-CZ
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:55:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGFhW-008Fr9-24;
 Wed, 27 Nov 2024 10:55:18 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGFhW-007nOR-26;
 Wed, 27 Nov 2024 10:55:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=Fa5x1UMLBesQpAwc0wH76erW8DMFqpBeaUOxSYzJg7s=; b=mhroyS
	kg4wI9uUi692AdstHlNZcCqmrVhG7V8tWL7HtXi68Z1D+VwmnWN+MIwMfs7ISru3FarZayDUHu8Zq
	CKdsnIivs/yIw8teCua1DROwVes+UvVXeyh2FxewVffAiTI96o6CSm6YritMWadVhPYivbp4Uomp1
	vCjrwNBJAiU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm32: Get rid of __memzero()
Date: Wed, 27 Nov 2024 10:55:12 +0000
Message-Id: <20241127105512.88703-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

All the code in arch/arm32/lib/ where copied from Linux 3.16
and never re-synced since then.

A few years ago, Linux got rid of __memzero() because the implementation
is very similar to memset(p,0,n) and the current use of __memzero()
interferes with optimization. See full commit message from Linux below.

So it makes sense to get rid of __memzero in Xen as well.

    From ff5fdafc9e9702846480e0cea55ba861f72140a2 Mon Sep 17 00:00:00 2001
    From: Nicolas Pitre <nicolas.pitre@linaro.org>
    Date: Fri, 19 Jan 2018 18:17:46 +0100
    Subject: [PATCH] ARM: 8745/1: get rid of __memzero()

    The __memzero assembly code is almost identical to memset's except for
    two orr instructions. The runtime performance of __memset(p, n) and
    memset(p, 0, n) is accordingly almost identical.

    However, the memset() macro used to guard against a zero length and to
    call __memzero at compile time when the fill value is a constant zero
    interferes with compiler optimizations.

    Arnd found tha the test against a zero length brings up some new
    warnings with gcc v8:

      https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82103

    And successively rremoving the test against a zero length and the call
    to __memzero optimization produces the following kernel sizes for
    defconfig with gcc 6:

        text     data     bss       dec       hex  filename
    12248142  6278960  413588  18940690   1210312  vmlinux.orig
    12244474  6278960  413588  18937022   120f4be  vmlinux.no_zero_test
    12239160  6278960  413588  18931708   120dffc  vmlinux.no_memzero

    So it is probably not worth keeping __memzero around given that the
    compiler can do a better job at inlining trivial memset(p,0,n) on its
    own. And the memset code already handles a zero length just fine.

    Suggested-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Nicolas Pitre <nico@linaro.org>
    Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ff5fdafc9e97
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/README.LinuxPrimitives |   3 +-
 xen/arch/arm/arm32/lib/Makefile     |   2 +-
 xen/arch/arm/arm32/lib/memzero.S    | 124 ----------------------------
 xen/arch/arm/include/asm/string.h   |  18 ----
 4 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 xen/arch/arm/arm32/lib/memzero.S

diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.LinuxPrimitives
index 301c0271bbe4..107a01aab743 100644
--- a/xen/arch/arm/README.LinuxPrimitives
+++ b/xen/arch/arm/README.LinuxPrimitives
@@ -108,10 +108,9 @@ linux/arch/arm/lib/memchr.S             xen/arch/arm/arm32/lib/memchr.S
 linux/arch/arm/lib/memcpy.S             xen/arch/arm/arm32/lib/memcpy.S
 linux/arch/arm/lib/memmove.S            xen/arch/arm/arm32/lib/memmove.S
 linux/arch/arm/lib/memset.S             xen/arch/arm/arm32/lib/memset.S
-linux/arch/arm/lib/memzero.S            xen/arch/arm/arm32/lib/memzero.S
 
 for i in copy_template.S memchr.S memcpy.S memmove.S memset.S \
-         memzero.S ; do
+        ; do
     diff -u linux/arch/arm/lib/$i xen/arch/arm/arm32/lib/$i
 done
 
diff --git a/xen/arch/arm/arm32/lib/Makefile b/xen/arch/arm/arm32/lib/Makefile
index b1457c89dc66..18326b284e3b 100644
--- a/xen/arch/arm/arm32/lib/Makefile
+++ b/xen/arch/arm/arm32/lib/Makefile
@@ -1,4 +1,4 @@
-obj-y += memcpy.o memmove.o memset.o memchr.o memzero.o
+obj-y += memcpy.o memmove.o memset.o memchr.o
 obj-y += findbit.o
 obj-y += bitops.o
 obj-y += strchr.o strrchr.o
diff --git a/xen/arch/arm/arm32/lib/memzero.S b/xen/arch/arm/arm32/lib/memzero.S
deleted file mode 100644
index dca5867c24ae..000000000000
--- a/xen/arch/arm/arm32/lib/memzero.S
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- *  linux/arch/arm/lib/memzero.S
- *
- *  Copyright (C) 1995-2000 Russell King
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-#include "assembler.h"
-
-	.text
-	.align	5
-	.word	0
-/*
- * Align the pointer in r0.  r3 contains the number of bytes that we are
- * mis-aligned by, and r1 is the number of bytes.  If r1 < 4, then we
- * don't bother; we use byte stores instead.
- */
-1:	subs	r1, r1, #4		@ 1 do we have enough
-	blt	5f			@ 1 bytes to align with?
-	cmp	r3, #2			@ 1
-	strltb	r2, [r0], #1		@ 1
-	strleb	r2, [r0], #1		@ 1
-	strb	r2, [r0], #1		@ 1
-	add	r1, r1, r3		@ 1 (r1 = r1 - (4 - r3))
-/*
- * The pointer is now aligned and the length is adjusted.  Try doing the
- * memzero again.
- */
-
-ENTRY(__memzero)
-	mov	r2, #0			@ 1
-	ands	r3, r0, #3		@ 1 unaligned?
-	bne	1b			@ 1
-/*
- * r3 = 0, and we know that the pointer in r0 is aligned to a word boundary.
- */
-	cmp	r1, #16			@ 1 we can skip this chunk if we
-	blt	4f			@ 1 have < 16 bytes
-
-#if ! CALGN(1)+0
-
-/*
- * We need an extra register for this loop - save the return address and
- * use the LR
- */
-	str	lr, [sp, #-4]!		@ 1
-	mov	ip, r2			@ 1
-	mov	lr, r2			@ 1
-
-3:	subs	r1, r1, #64		@ 1 write 32 bytes out per loop
-	stmgeia	r0!, {r2, r3, ip, lr}	@ 4
-	stmgeia	r0!, {r2, r3, ip, lr}	@ 4
-	stmgeia	r0!, {r2, r3, ip, lr}	@ 4
-	stmgeia	r0!, {r2, r3, ip, lr}	@ 4
-	bgt	3b			@ 1
-	ldmeqfd	sp!, {pc}		@ 1/2 quick exit
-/*
- * No need to correct the count; we're only testing bits from now on
- */
-	tst	r1, #32			@ 1
-	stmneia	r0!, {r2, r3, ip, lr}	@ 4
-	stmneia	r0!, {r2, r3, ip, lr}	@ 4
-	tst	r1, #16			@ 1 16 bytes or more?
-	stmneia	r0!, {r2, r3, ip, lr}	@ 4
-	ldr	lr, [sp], #4		@ 1
-
-#else
-
-/*
- * This version aligns the destination pointer in order to write
- * whole cache lines at once.
- */
-
-	stmfd	sp!, {r4-r7, lr}
-	mov	r4, r2
-	mov	r5, r2
-	mov	r6, r2
-	mov	r7, r2
-	mov	ip, r2
-	mov	lr, r2
-
-	cmp	r1, #96
-	andgts	ip, r0, #31
-	ble	3f
-
-	rsb	ip, ip, #32
-	sub	r1, r1, ip
-	movs	ip, ip, lsl #(32 - 4)
-	stmcsia	r0!, {r4, r5, r6, r7}
-	stmmiia	r0!, {r4, r5}
-	movs	ip, ip, lsl #2
-	strcs	r2, [r0], #4
-
-3:	subs	r1, r1, #64
-	stmgeia	r0!, {r2-r7, ip, lr}
-	stmgeia	r0!, {r2-r7, ip, lr}
-	bgt	3b
-	ldmeqfd	sp!, {r4-r7, pc}
-
-	tst	r1, #32
-	stmneia	r0!, {r2-r7, ip, lr}
-	tst	r1, #16
-	stmneia	r0!, {r4-r7}
-	ldmfd	sp!, {r4-r7, lr}
-
-#endif
-
-4:	tst	r1, #8			@ 1 8 bytes or more?
-	stmneia	r0!, {r2, r3}		@ 2
-	tst	r1, #4			@ 1 4 bytes or more?
-	strne	r2, [r0], #4		@ 1
-/*
- * When we get here, we've got less than 4 bytes to zero.  We
- * may have an unaligned pointer as well.
- */
-5:	tst	r1, #2			@ 1 2 bytes or more?
-	strneb	r2, [r0], #1		@ 1
-	strneb	r2, [r0], #1		@ 1
-	tst	r1, #1			@ 1 a byte left over
-	strneb	r2, [r0], #1		@ 1
-	mov	pc, lr			@ 1
-ENDPROC(__memzero)
diff --git a/xen/arch/arm/include/asm/string.h b/xen/arch/arm/include/asm/string.h
index b485e4904419..7cbc8ecc7600 100644
--- a/xen/arch/arm/include/asm/string.h
+++ b/xen/arch/arm/include/asm/string.h
@@ -24,24 +24,6 @@
 #define __HAVE_ARCH_MEMSET
 #define __HAVE_ARCH_MEMCHR
 
-#if defined(CONFIG_ARM_32)
-
-void __memzero(void *ptr, size_t n);
-
-#define memset(p, v, n)                                                 \
-        ({                                                              \
-                void *__p = (p); size_t __n = n;                        \
-                if ((__n) != 0) {                                       \
-                        if (__builtin_constant_p((v)) && (v) == 0)      \
-                                __memzero((__p),(__n));                 \
-                        else                                            \
-                                memset((__p),(v),(__n));                \
-                }                                                       \
-                (__p);                                                  \
-        })
-
-#endif
-
 #endif /* __ARM_STRING_H__ */
 /*
  * Local variables:
-- 
2.40.1


