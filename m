Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725087D341
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693992.1082746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBws-0007XC-CT; Fri, 15 Mar 2024 18:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693992.1082746; Fri, 15 Mar 2024 18:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBws-0007Rf-6N; Fri, 15 Mar 2024 18:06:30 +0000
Received: by outflank-mailman (input) for mailman id 693992;
 Fri, 15 Mar 2024 18:06:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwq-0005yW-Ji
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:28 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be734498-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:28 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso28803311fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:26 -0700 (PDT)
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
X-Inumbo-ID: be734498-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525987; x=1711130787; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHUhh6naISvb/QyLVfD3mSAYqmy1k+9yyg9dbj8PXL4=;
        b=bjvD0xnUNaaIG1n6/NWv6b50eIFufHWdZAmLILX5eNa30AxcN1bFgu0y1f3DUQkAUb
         zJIC1FfZgPZoo+sIRCIRASaRTiu+4Cvsu4IUH8DcMBfRAWfMGDUauzEUCIuTy5LTDC0q
         Xe4Vy+5MEct2Mf6P8FoVyqSiwn6VMFKMAIHHPdRGNJd0YLDHioXGHMP3tElJY8kessNM
         2HWqRjdf2swgHY6snYh7JyP6q5PnoWksKd6uCc4ZKFmr5VzGHj4KsXF0C6Z2Op7IomAu
         Smrh5tBg7gS2GJVUoIxbyZaCVpK8gcYUtiJ4BpqKfe/CiA0E0iVWoS04yykO5MibhCSJ
         bF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525987; x=1711130787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHUhh6naISvb/QyLVfD3mSAYqmy1k+9yyg9dbj8PXL4=;
        b=nGrEwoqzajUq3pHDviDriaZW+swCqetCi+QyFt08GJ3aFXfrMVvcbirUS5EmrVKM5R
         x6z8OutKj014jBtFAzRYPf+YngRzto7PstyLI0yUXjK5UDB1MmhmGeJdpqZItmvoz52B
         M2Jop3KiZtmT4l8psG+BzcCLSofILlHrid78s8+bhDEhvzoDB0tYHvlmbWdu+p9hsmKK
         kL2oSb2VZfNGt2praSxWNt06aS3Mp8P7FFVzxpSl7Bjwcbo3oITXAtqRUVEu6uo0bfAF
         iQwZX9Td/iOOVhF0rYxZEJvueQDAv2B+VPLmvaD5lxn0fXT/iiEspDW4UE4ra4fs1PHA
         ImVQ==
X-Gm-Message-State: AOJu0Yx3PJZgiqV8fZQccRIqkcy/8N5+Ie5l7Hkv3beTTLUhywT+AGXj
	3mWLIiigSELiQmxEYLqyvQ7Y4V1X+ziYrroJcEh7SNg7CtYjpKEkUWU50ZlG7DE=
X-Google-Smtp-Source: AGHT+IEwnlLHAuHLlfFWIVLSotj2xqJki8LDNKZtupckw1Hw046uDDkclaJtZGSbwoAiDHMfHPWPEg==
X-Received: by 2002:a2e:9b07:0:b0:2d3:8b2:6885 with SMTP id u7-20020a2e9b07000000b002d308b26885mr2522427lji.49.1710525986911;
        Fri, 15 Mar 2024 11:06:26 -0700 (PDT)
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
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v6 06/20] xen/bitops: put __ffs() and ffz() into linux compatible header
Date: Fri, 15 Mar 2024 19:06:02 +0100
Message-ID: <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mentioned macros exist only because of Linux compatible purpose.

The patch defines __ffs() in terms of Xen bitops and it is safe
to define in this way ( as __ffs() - 1 ) as considering that __ffs()
was defined as __builtin_ctzl(x), which has undefined behavior when x=0,
so it is assumed that such cases are not encountered in the current code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - new patch for the patch series.
---
 xen/arch/arm/include/asm/arm64/bitops.h | 21 ---------------------
 xen/arch/ppc/include/asm/bitops.h       | 21 ---------------------
 xen/drivers/passthrough/arm/smmu-v3.c   |  2 ++
 xen/include/xen/linux-compat.h          |  3 +++
 xen/lib/find-next-bit.c                 |  1 +
 5 files changed, 6 insertions(+), 42 deletions(-)

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
index 16447a4be6..fd157f3632 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -171,15 +171,6 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
     return (old & mask) != 0;
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
@@ -191,16 +182,4 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
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
index 62ba71485c..de059bdf12 100644
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -19,4 +19,7 @@ typedef int64_t __s64;
 
 typedef paddr_t phys_addr_t;
 
+#define __ffs(x) (ffsl(x) - 1)
+#define ffz(x) __ffs(~(x))
+
 #endif /* __XEN_LINUX_COMPAT_H__ */
diff --git a/xen/lib/find-next-bit.c b/xen/lib/find-next-bit.c
index ca6f82277e..b151f7f994 100644
--- a/xen/lib/find-next-bit.c
+++ b/xen/lib/find-next-bit.c
@@ -9,6 +9,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 #include <xen/bitops.h>
+#include <xen/linux-compat.h>
 
 #include <asm/byteorder.h>
 
-- 
2.43.0


