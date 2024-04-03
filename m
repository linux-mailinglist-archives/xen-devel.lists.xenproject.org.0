Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE3896C02
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700397.1093500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjH-0000K3-8w; Wed, 03 Apr 2024 10:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700397.1093500; Wed, 03 Apr 2024 10:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjH-0000FU-1C; Wed, 03 Apr 2024 10:20:27 +0000
Received: by outflank-mailman (input) for mailman id 700397;
 Wed, 03 Apr 2024 10:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjE-0007Ql-Mr
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:24 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c87868ec-f1a3-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:20:24 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5157af37806so6802972e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:22 -0700 (PDT)
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
X-Inumbo-ID: c87868ec-f1a3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139623; x=1712744423; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDOXSExHkWnsYA303APz88ZhYMfYFAPF7TMb2Gec4LM=;
        b=WeSkpRXjqRBdcufafyJvfKZoBYxUzgmtLYkOvGOPrrJtXOa7Hz+xNPUELl9KeZwZ6r
         8eEZenEpp+s65ouk7pzF+CNiGE6+d+MbImfWjyxvLhN+X5R/sLBW0EmTDYglq7T1U4Sa
         c6EhTkLjmQDFgf6LQwPJbM5u4GTu5aakbgLgm7411OG+7YRMovCjK9NoWZBQ624YwZoG
         UQiZfzb8dX+FyKt1p+wzY80N1KSY2z4WNhAjxB8DsIAdBkCx8/7n1bE72NyRDh/J+LgZ
         e3v2gHgoK6I1dAtgF2rccKVXmiYJ8jsyOUpwjW3TdrSg4bfc/GnUDiHNjdpfPi8tNlnC
         Cxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139623; x=1712744423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDOXSExHkWnsYA303APz88ZhYMfYFAPF7TMb2Gec4LM=;
        b=uB2FCZy0rWSyjO/S9dCJOD+blaxqmafG+NZ2aF5MlLnUSmIbutKLihO7YQXQjku972
         Sxp/fUsijc0q/0L5XfBqjiUAkTK55q/nUdbeEbKjGAWRit66z+ilOU9Dxc5tAKO6YeDR
         U4RfZnUP/LZKKXpOOFCaktdC3HhPyBQtOaBsZUINnn7M3RZmhBW2ChlzY+UqlRtWeXI0
         R5EAPvCiVg6pM6bblL1pObufns1o265+jrPjdkdV/tAaCNhvqr5DF/BivRffPVF10uyI
         Ip8PHMG28+Ash4VVinDmDEeqj+sHGt3seUDcBHMsyF4myTGT2wSsxEkjLzg+UHNRbqUD
         fi2A==
X-Gm-Message-State: AOJu0Yy8lQ0xbWkdy1qAJQKIP38bFjLZvWtal1XVHwGoZbZsAFFlBJL4
	iXpOOJjzEGYLLz7NjoiRy/fek+VtApbFkWl587SK3BK9SQA2/ruEyb+6EJWW
X-Google-Smtp-Source: AGHT+IEf0Ys4z4+MWjSdpX4epeGnXe3GDvKAFI0GYGQS1kzkI8THHaA256ABL4X7CPvTKA6W2kqCBg==
X-Received: by 2002:a05:6512:2118:b0:516:582:2348 with SMTP id q24-20020a056512211800b0051605822348mr7459594lfr.54.1712139623341;
        Wed, 03 Apr 2024 03:20:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v7 06/19] xen/bitops: put __ffs() into linux compatible header
Date: Wed,  3 Apr 2024 12:19:59 +0200
Message-ID: <854994adfdbaafb4d140fffb72ff5ade6b0aeb1e.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mentioned macros exist only because of Linux compatible purpose.

The patch defines __ffs() in terms of Xen bitops and it is safe
to define in this way ( as __ffs() - 1 ) as considering that __ffs()
was defined as __builtin_ctzl(x), which has undefined behavior when x=0,
so it is assumed that such cases are not encountered in the current code.

To not include <xen/linux-compat.h> to Xen library files __ffs() and __ffz()
were defined locally in find-next-bit.c.

Except __ffs() usage in find-next-bit.c only one usage of __ffs() leave
in smmu-v3.c. It seems that it __ffs can be changed to ffsl(x)-1 in
this file, but to keep smmu-v3.c looks close to linux it was deciced just
to define __ffs() in xen/linux-compat.h and include it in smmu-v3.c

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - introduce ffz(),__ffs() locally in find-next-bit.c
 - drop inclusion of <xen/linux-compat.h> in find-next-bit.c.
 - update the commit message.
---
Changes in V6:
 - new patch for the patch series.
---
 xen/arch/arm/include/asm/arm64/bitops.h | 21 ---------------------
 xen/arch/ppc/include/asm/bitops.h       | 12 ------------
 xen/drivers/passthrough/arm/smmu-v3.c   |  2 ++
 xen/include/xen/linux-compat.h          |  2 ++
 xen/lib/find-next-bit.c                 |  3 +++
 5 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index 5f5d97faa0..2deb134388 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -1,27 +1,6 @@
 #ifndef _ARM_ARM64_BITOPS_H
 #define _ARM_ARM64_BITOPS_H
 
-/* Based on linux/include/asm-generic/bitops/builtin-__ffs.h */
-/**
- * __ffs - find first bit in word.
- * @word: The word to search
- *
- * Undefined if no bit exists, so code should check against 0 first.
- */
-static /*__*/always_inline unsigned long __ffs(unsigned long word)
-{
-        return __builtin_ctzl(word);
-}
-
-/* Based on linux/include/asm-generic/bitops/ffz.h */
-/*
- * ffz - find first zero in word.
- * @word: The word to search
- *
- * Undefined if no zero exists, so code should check against ~0UL first.
- */
-#define ffz(x)  __ffs(~(x))
-
 static inline int arch_flsl(unsigned long x)
 {
         uint64_t ret;
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index a17060c7c2..2237b9f8f4 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -130,16 +130,4 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
 #define hweight16(x) __builtin_popcount((uint16_t)(x))
 #define hweight8(x)  __builtin_popcount((uint8_t)(x))
 
-/* Based on linux/include/asm-generic/bitops/builtin-__ffs.h */
-/**
- * __ffs - find first bit in word.
- * @word: The word to search
- *
- * Undefined if no bit exists, so code should check against 0 first.
- */
-static always_inline unsigned long __ffs(unsigned long word)
-{
-    return __builtin_ctzl(word);
-}
-
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index b1c40c2c0a..6904962467 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -72,12 +72,14 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/bitops.h>
 #include <xen/config.h>
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/err.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/linux-compat.h>
 #include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/rbtree.h>
diff --git a/xen/include/xen/linux-compat.h b/xen/include/xen/linux-compat.h
index 62ba71485c..10db80df57 100644
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -19,4 +19,6 @@ typedef int64_t __s64;
 
 typedef paddr_t phys_addr_t;
 
+#define __ffs(x) (ffsl(x) - 1)
+
 #endif /* __XEN_LINUX_COMPAT_H__ */
diff --git a/xen/lib/find-next-bit.c b/xen/lib/find-next-bit.c
index ca6f82277e..761b027398 100644
--- a/xen/lib/find-next-bit.c
+++ b/xen/lib/find-next-bit.c
@@ -12,6 +12,9 @@
 
 #include <asm/byteorder.h>
 
+#define __ffs(x) (ffsl(x) - 1)
+#define ffz(x) __ffs(~(x))
+
 #ifndef find_next_bit
 /*
  * Find the next set bit in a memory region.
-- 
2.43.0


