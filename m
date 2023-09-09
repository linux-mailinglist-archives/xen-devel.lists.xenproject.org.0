Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40157996E1
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598451.933279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQY-00047k-Sq; Sat, 09 Sep 2023 08:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598451.933279; Sat, 09 Sep 2023 08:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQY-00045e-Oq; Sat, 09 Sep 2023 08:34:50 +0000
Received: by outflank-mailman (input) for mailman id 598451;
 Sat, 09 Sep 2023 08:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetQW-0003Y6-Vs
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:34:48 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc17d2f7-4eeb-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:34:48 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a56401c12so2376239b3a.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:34:48 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bde65894d5sm2781080plo.109.2023.09.09.01.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:34:46 -0700 (PDT)
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
X-Inumbo-ID: bc17d2f7-4eeb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248487; x=1694853287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMjqniKvNz74jeLELNKkTBZ2YCjvVUjOwJ430ggknLM=;
        b=UQu1ORJHIGamqn9162vLF8HaeYvCR+Y91ouLe3wIY1VTdcoeXfl7KC8CTjv249RxeA
         mSJSyU2TZHnjI4NvxpDydz9RnebI+12N7zQfMso9FpimIa1xfaPXqdIhsG2nB4fLvsbS
         gSOCxJejdpjfZsrGNTYqeKXc0/Gt11Qwbc0ZampOn1oqalJoqY4QX+vuY8MUsyzCmCuL
         8qPjZ76ef8n0PlFGD/75/+GGej+Or6pLrOo7/P0zdP/5M7TBN52qaPeI3zZVfxWrojZW
         0k1kSTLQvyTjxNmlhDwrEYkHqNftWtzU/qbCx+ia9JkKajC1m8Z4lsNnci9wENwkRRHX
         E3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248487; x=1694853287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMjqniKvNz74jeLELNKkTBZ2YCjvVUjOwJ430ggknLM=;
        b=ty/vQq7Tr1NBKkKpGMKJNSAwGFNSdgFfUQmJZsXGyZufGdNNbsBIJGRQxHhL1yE22M
         TeAoP0lo/bXT/zMvHVERUhvBGqh2vfER0hRAkj360YNQf5ltZlh1XwU8aliItCnhdrpu
         x6y/TklYG0EzTYc1qHRk38u+EWZNq/I0+lbxI8uw81hK69GzszWt2kcFHb2V9KMINaTY
         Kc6hluDLOm/P/MutBp5G9TZiaSaAyb41X3TadtILAb+rnPGRR059COme9sKLHwWpLGSI
         XPby6JMzaqtlo+i9Ntv/+yDf3qcvmZT/qyc/tgl1eTJ+0pUBttbbl0ycz+M5i//qBr8b
         eaFw==
X-Gm-Message-State: AOJu0YzFQFxICI9L2FgVgIIwJMi3AsdpJJphIuxMGjgbqDf0AiVSNFbd
	eCrkkyKdop36yeW20pxqCqRmt3v0VVomU5Z0ptuVrtM6
X-Google-Smtp-Source: AGHT+IH0V/EfRR6ioSjE3+vNsgGPDLitgsRYco5+6aMmrfsn0dvtZZVGpXUI31FH/P9maTFxFTF8ag==
X-Received: by 2002:a05:6a20:564c:b0:148:4c5:9714 with SMTP id is12-20020a056a20564c00b0014804c59714mr4624930pzc.13.1694248487010;
        Sat, 09 Sep 2023 01:34:47 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to 127TiB
Date: Sat,  9 Sep 2023 16:34:10 +0800
Message-Id: <20230909083410.870726-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230909083410.870726-1-leo.yan@linaro.org>
References: <20230909083410.870726-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms, the memory regions could be:

  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

In this case, the Xen binary is loaded above 2TiB.  2TiB is the maximum
identity map space supported by Xen, thus it fails to boot up due to the
out of the range.

This patch introduces several macros to present the zeroth page table's
slot numbers for easier readable.  Based on the defined macros, it
enlarges identity map space to 127TiB, which can support the memory
space [0x0 .. 0x00007eff_ffff_ffff] so has flexibility for various
platforms.

Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/arm64/mm.c           | 12 ++++++++----
 xen/arch/arm/include/asm/config.h | 15 ++++++++-------
 xen/arch/arm/mm.c                 |  2 +-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
index 78b7c7eb00..802170cf29 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mm.c
@@ -40,8 +40,10 @@ static void __init prepare_boot_identity_mapping(void)
     clear_page(boot_second_id);
     clear_page(boot_third_id);
 
-    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
-        panic("Cannot handle ID mapping above 2TB\n");
+    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )
+        /* 1TiB occupies 2 slots in zeroeth table */
+        panic("Cannot handle ID mapping above %dTiB\n",
+              XEN_IDENTITY_MAP_L0_END>>1);
 
     /* Link first ID table */
     pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
@@ -73,8 +75,10 @@ static void __init prepare_runtime_identity_mapping(void)
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
 
-    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
-        panic("Cannot handle ID mapping above 2TB\n");
+    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )
+        /* 1TiB occupies 2 slots in zeroeth table */
+        panic("Cannot handle ID mapping above %dTiB\n",
+              XEN_IDENTITY_MAP_L0_END>>1);
 
     /* Link first ID table */
     pte = pte_of_xenaddr((vaddr_t)xen_first_id);
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 21f4e68a40..b772f1574d 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -87,11 +87,11 @@
  *   2G -   4G   Domheap: on-demand-mapped
  *
  * ARM64 layout:
- * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
  *
  *  Reserved to identity map Xen
  *
- * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
+ * 0x000007f000000000 - 0x00007fffffffffff (1TB, L0 slot [254..255])
  *  (Relative offsets)
  *   0  -   2M   Unmapped
  *   2M -  10M   Xen text, data, bss
@@ -103,9 +103,6 @@
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
- *  Unused
- *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
  *  1:1 mapping of RAM
  *
@@ -117,8 +114,12 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
-#define IDENTITY_MAPPING_AREA_NR_L0	4
-#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+#define XEN_IDENTITY_MAP_L0_START       0
+#define XEN_IDENTITY_MAP_L0_NUM         254
+#define XEN_IDENTITY_MAP_L0_END         (XEN_IDENTITY_MAP_L0_START + \
+                                         XEN_IDENTITY_MAP_L0_NUM)
+#define XEN_VM_MAP_L0_START             (XEN_IDENTITY_MAP_L0_END)
+#define XEN_VM_MAPPING                  SLOT0(XEN_VM_MAP_L0_START)
 
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c34cc94c90..218552783e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -156,7 +156,7 @@ static void __init __maybe_unused build_assertions(void)
      * with it.
      */
 #define CHECK_OVERLAP_WITH_IDMAP(virt) \
-    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
+    BUILD_BUG_ON(zeroeth_table_offset(virt) < XEN_IDENTITY_MAP_L0_END)
 
     CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
     CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
-- 
2.39.2


