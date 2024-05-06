Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5D8BCBBE
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717434.1119670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNg-0002Wx-6K; Mon, 06 May 2024 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717434.1119670; Mon, 06 May 2024 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNf-0002Qn-VK; Mon, 06 May 2024 10:15:35 +0000
Received: by outflank-mailman (input) for mailman id 717434;
 Mon, 06 May 2024 10:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNd-0001cU-PX
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:33 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a33655-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:33 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso318484966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:32 -0700 (PDT)
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
X-Inumbo-ID: 92a33655-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990532; x=1715595332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ4ONEZyJqQciNKYxaBQg/mppiyTg6XZa2ET+ksHj5Y=;
        b=dbZekPFR769FL1tAFtTjP0EW7I19ctISNgUPasRG3A75WbM+k7ud9WOahfQtifQjxy
         atnyXfZqr/WVUsOREhxc72VL0S2jany/TiFlr2lnZAo2BRspJd/Blo2PfQuHsyVtaKCo
         VOHDDoNLRBl+/km6ghRtLRQnCpRMNCP/C4Dt9lwrYeckCifi1xMs8F82VNy9m+P1SfWj
         tpT/4A4JyNO3hQ2oepxPm0ZDKcepxUxfjAEIT3pVFl4yBNNQgSmlI5xfVMDImQB2d1Jo
         afKHMLrTjqwYLkHsLr+MqeniEll7RDsT6MUITDLz/FS5T1yoJ6btWlpTpZmlCK421gB2
         iirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990532; x=1715595332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ4ONEZyJqQciNKYxaBQg/mppiyTg6XZa2ET+ksHj5Y=;
        b=XO/f5DrkyJGqEfcIG6CebQfnsvGRoMUDyxjpvla5EGHCgpPPEvg/kCzOlWF06pYE/i
         buRPgMqOc2WtYuZd6pMWzkQiFYMdOBQvL6JmGCa1R+QR/bSaWx+hg1LziJYsyfmuMWlZ
         CSGmMT3vZB9CiljBlz7M6GXkU8YGgC4DVovbPCJ/ktriq6ZVbAQaCQOkoXo37A4ZOOFX
         CCww0Z2xxl2vGo+xkpynOxeJzyDpMRR060Bc6GbIZKUym6ZSXMNBIU8SLfsYVE/bloiC
         tqoCs/TzvXXU/NphkyUBwvaiYb/fIWXVdLsrFy4nnhNmavp7wwrc/dtF8X7xKEzl1lRt
         D+cg==
X-Gm-Message-State: AOJu0YyWrFO7iaPRi4qp706HkemiC6D7MrgA6D+e+FKCB53em4+48RPf
	9G2Nhh3BXrAgVAXc6m2kkpYF6w7dG9cj7qk+5ZD/XcUVrAnxZ00t1VrDYA==
X-Google-Smtp-Source: AGHT+IEyiSX0ZrAYQlbQ+yXOPTKDOcWShyOAiEUWqGNjgpbNhCquuXTWMg5liaftvBSjkrVr5aOkOA==
X-Received: by 2002:a17:907:9493:b0:a59:bacc:b086 with SMTP id dm19-20020a170907949300b00a59baccb086mr3381844ejc.50.1714990532394;
        Mon, 06 May 2024 03:15:32 -0700 (PDT)
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
Subject: [PATCH v9 04/15] xen/bitops: put __ffs() into linux compatible header
Date: Mon,  6 May 2024 12:15:13 +0200
Message-ID: <4ef575389520479cee0a79fccfc20e6891594d61.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - update the defintion of __ffs in xen/linux-compat.h.
 - add Reviewed-by: Jan Beulich <jbeulich@suse.com>
 - add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com> for PPC part which
   I missed to add in the previous patch version.
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
index 62ba71485c..b289dfd894 100644
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -19,4 +19,6 @@ typedef int64_t __s64;
 
 typedef paddr_t phys_addr_t;
 
+#define __ffs(x) (ffsl(x) - 1UL)
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
2.45.0


