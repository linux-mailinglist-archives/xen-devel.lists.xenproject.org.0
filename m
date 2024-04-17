Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671058A804C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707303.1105109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AD-00006q-0n; Wed, 17 Apr 2024 10:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707303.1105109; Wed, 17 Apr 2024 10:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AC-0008VL-Sd; Wed, 17 Apr 2024 10:05:12 +0000
Received: by outflank-mailman (input) for mailman id 707303;
 Wed, 17 Apr 2024 10:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AB-0007lI-D0
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e3595f-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:10 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516db2214e6so6721059e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:09 -0700 (PDT)
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
X-Inumbo-ID: f9e3595f-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348310; x=1713953110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ29D9H9JMmfdu32zJ5hu2jEY5dp+g/85uLcvjzKeeQ=;
        b=lRt3HtWaHe7L/r9d4QUkPm0flbv5KyCtfipK3UX1Wk+BLAwBIf4sUBtHcouy972LKj
         1PP2dw2KCLbxaAspLgp48Xl9mZG/b2W4mU8zLvcaXVUEHz6nRyBx6ZxaeaWQc51lDBIE
         5rfJbeIoFCcZkqvIV705T2hD+E0En9ZaSbkp0tLNZm3azj7+t8KE34AE413g4yXAIa2X
         Teb8bNd1mhLmEvqlQSJKtJsB1AHc4DcpnuZWbTLui0ko7Q+eLKqHU/yH0ttA+qKSUagw
         y+Ipj1TEIoxVoOFDEbe+EBR/wlPJG5k+VBswAP5V+NtvROYRrK/yaIzJfzG4Fuljc/Wp
         ZFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348310; x=1713953110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ29D9H9JMmfdu32zJ5hu2jEY5dp+g/85uLcvjzKeeQ=;
        b=BUE4J07eTlEGTBldiJ38XfuCzGL7QfP19dQxtPcbYDVd21G063ak7Ot4dFU9JJsRyl
         FjQD56NPArE4RiHodDh3DXnB1uSDxY0q7rUryFBoWRXxNgMAkrgVz/tYkUgafzy4PwKu
         DEoBl3mXYVlLH/OolJOT+L1qs0W+70zXLP7vujURtXp/+Pgn34bOby1PLzeEowwiWXvx
         +LInCHNFHuQ35G8zSjt/qBqTiQeovw9RfYKbmvSFKVipy+gVsml7LS8je4UDBYyNE3g2
         eqClmGwig1+H4I9YMRV7x0wWLSQhPuC0tO7lcv1dBSuuxTrNhcsgM0IJeOuRJlTyoYvg
         uJZw==
X-Gm-Message-State: AOJu0Yys9ABwPsWPoijSK0OCoGS5+jTgHRRz9QYIPbjjdzzXFOzm4KeP
	SDvVFWt2O5WGS2UowveANDkk19BQ6auNILKlUZdAy1qwtzx+eS7qSfPT/g==
X-Google-Smtp-Source: AGHT+IFk3ss01QgPMVPrDGJj5xjEAP6QNC+R4zGtC7ztjhFawgFn2SdAqGdsq9uA1exC5L9A7YzkQQ==
X-Received: by 2002:a05:6512:21b2:b0:518:cb17:c50b with SMTP id c18-20020a05651221b200b00518cb17c50bmr5358792lft.65.1713348309351;
        Wed, 17 Apr 2024 03:05:09 -0700 (PDT)
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
Subject: [PATCH v8 04/17] xen/bitops: put __ffs() into linux compatible header
Date: Wed, 17 Apr 2024 12:04:47 +0200
Message-ID: <2ea76feebc5ffe543801b9b3935a82a64708a909.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
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
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V8:
 - drop ffz() for PPC as there is no any usage of it and it seems to me that it was
   introduced only because Arm has it, and Arm uses it only in find-next-bit.c where
   ffz() was moved to.
 - add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com> for PPC part.
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
 xen/arch/ppc/include/asm/bitops.h       | 21 ---------------------
 xen/drivers/passthrough/arm/smmu-v3.c   |  2 ++
 xen/include/xen/linux-compat.h          |  2 ++
 xen/lib/find-next-bit.c                 |  3 +++
 5 files changed, 7 insertions(+), 42 deletions(-)

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
index ca308fd62b..2237b9f8f4 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -119,15 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-/* Based on linux/include/asm-generic/bitops/ffz.h */
-/*
- * ffz - find first zero in word.
- * @word: The word to search
- *
- * Undefined if no zero exists, so code should check against ~0UL first.
- */
-#define ffz(x) __ffs(~(x))
-
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
@@ -139,16 +130,4 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
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
2.44.0


