Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739F79F7DF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 04:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601720.937859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvX-0007vX-Hx; Thu, 14 Sep 2023 02:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601720.937859; Thu, 14 Sep 2023 02:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvX-0007tH-F2; Thu, 14 Sep 2023 02:17:55 +0000
Received: by outflank-mailman (input) for mailman id 601720;
 Thu, 14 Sep 2023 02:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUwO=E6=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qgbvW-0007cj-7I
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 02:17:54 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c42f7d-52a4-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 04:17:48 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3ab244f2c89so275233b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 19:17:48 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.115.199])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa78591000000b0068c5bd3c3b4sm212275pfn.206.2023.09.13.19.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 19:17:46 -0700 (PDT)
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
X-Inumbo-ID: e5c42f7d-52a4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694657867; x=1695262667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQzdKFAFpw1dsG/FwADri/Y+ip52cCaS+Mt5CUf5r0I=;
        b=OoViiB033eO+lvxzLCVfqUhNYnZuaLDhZC5pPiS7W2A27XR2uIXBA3VnY6zP3GJYJN
         UE6uyuHGekO2/LIwX4cjAL4BXLFUzkEdwQFLQqrddaaAEouN+ubZ0ZhMvQEGq6IJYskE
         FKEtvvz097yCC2fZYdtFtNI6vzx/Oie0CN8zNvkkzW4Nh/Q5FWrK9lBxcsMpB/ji0mus
         0r3/y8oqaFPTEnmLaob8aY4hz87iSRyNRkdSAOYPa2vt22TVVBTjpUHB/YoyCnbaxPzn
         MQZtNEqAXfcbPb5ZzDPUPQDChg6UVNSLpu1T7u9t6q1gxfFPHYWPqolmxOwDAtcntxHk
         f1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694657867; x=1695262667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQzdKFAFpw1dsG/FwADri/Y+ip52cCaS+Mt5CUf5r0I=;
        b=wMAmE5Nmk8kOO0TFb54EIFFZSjMe2Oe52rIIPF4VDdizksPttUqfrlx3G7rlNkjLKj
         B2WR7PdjGYlDLepnTzcWbLYy24WZGJbmGxe73gbdSYLZaorXOCrI8O1HdYKldibGKTNw
         dCqZ2OpgJn1BdhUVFZosROKwEG6erP56sEU36JiPUNPNThF5qSKyn5vgTpLeATIyaS3L
         D96owrrc7MoxNL3VpnWccxb3zVLggvSqUx9tQk+lqRtaLdzbxDwDR7bmRcoX9gsjuvoi
         uQdxiXWsNrBGlNNJzpxiowZEB/RAbA9rZd3YykBGGmqouf7L0BEJj0HHYkduaktVCe1w
         1qWA==
X-Gm-Message-State: AOJu0YxydR0lEeQ5ZXIu6bXVGNA1TtIVg/xg1hqAmQwxRKBKC3Ky0F/1
	Y4OoAbKyYtvUp0Zi7qRm17gqpkr99Np/FhfidYrcw2Rt
X-Google-Smtp-Source: AGHT+IH998mHGXgmUJqPe4iq3QUZeNo84jpuKN6GfiNbLQ76lCPEcSRLbo/lBW13KqkI1kaLtYglrA==
X-Received: by 2002:a05:6808:306:b0:3a6:fba6:d900 with SMTP id i6-20020a056808030600b003a6fba6d900mr4542700oie.22.1694657867311;
        Wed, 13 Sep 2023 19:17:47 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 2/2] xen/arm: Enlarge identity map space to 127TB
Date: Thu, 14 Sep 2023 10:17:34 +0800
Message-Id: <20230914021734.1395472-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914021734.1395472-1-leo.yan@linaro.org>
References: <20230914021734.1395472-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
the physical memory regions are:

  DRAM memory regions:
    Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
    Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
    Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff

The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
and ramdisk images are loaded into the low memory space:

  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

In this case, the Xen binary is loaded above 8TB, which exceeds the
maximum supported identity map space of 2TB in Xen. Consequently, the
system fails to boot.

This patch enlarges identity map space to 127TB, allowing module loading
within the range of [0x0 .. 0x00007eff_ffff_ffff].

Note, despite this expansion of the identity map to 127TB, the frame
table still only supports 2TB.  The reason is the frame table is data
structure for the page management, which does not require coverage of
the memory layout gaps (refer to pfn_pdx_hole_setup() for Xen removing
the biggest gap from memory regions).  Thus, 2TB of memory support
remains sufficient for most use cases.

Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/arm64/mm.c               | 6 ++++--
 xen/arch/arm/include/asm/mmu/layout.h | 8 ++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
index 78b7c7eb00..cb69df0661 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mm.c
@@ -41,7 +41,8 @@ static void __init prepare_boot_identity_mapping(void)
     clear_page(boot_third_id);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
-        panic("Cannot handle ID mapping above 2TB\n");
+        panic("Cannot handle ID mapping above %uTB\n",
+              IDENTITY_MAPPING_AREA_NR_L0 >> 1);
 
     /* Link first ID table */
     pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
@@ -74,7 +75,8 @@ static void __init prepare_runtime_identity_mapping(void)
     DECLARE_OFFSETS(id_offsets, id_addr);
 
     if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
-        panic("Cannot handle ID mapping above 2TB\n");
+        panic("Cannot handle ID mapping above %uTB\n",
+              IDENTITY_MAPPING_AREA_NR_L0 >> 1);
 
     /* Link first ID table */
     pte = pte_of_xenaddr((vaddr_t)xen_first_id);
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index 2cb2382fbf..fa16d07d0d 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -19,11 +19,11 @@
  *   2G -   4G   Domheap: on-demand-mapped
  *
  * ARM64 layout:
- * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
  *
  *  Reserved to identity map Xen
  *
- * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
+ * 0x00007f0000000000 - 0x00007f7fffffffff (512GB, L0 slot [254])
  *  (Relative offsets)
  *   0  -   2M   Unmapped
  *   2M -  10M   Xen text, data, bss
@@ -35,7 +35,7 @@
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
+ * 0x00007f8000000000 - 0x00007fffffffffff (512GB, L0 slots [255])
  *  Unused
  *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
@@ -49,7 +49,7 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
-#define IDENTITY_MAPPING_AREA_NR_L0     4
+#define IDENTITY_MAPPING_AREA_NR_L0     254
 #define XEN_VM_MAPPING                  SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
 
 #define SLOT0_ENTRY_BITS  39
-- 
2.34.1


