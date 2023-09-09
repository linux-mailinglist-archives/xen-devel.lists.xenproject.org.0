Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD37996DE
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598436.933239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNR-0002EG-Df; Sat, 09 Sep 2023 08:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598436.933239; Sat, 09 Sep 2023 08:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNR-0002Az-Al; Sat, 09 Sep 2023 08:31:37 +0000
Received: by outflank-mailman (input) for mailman id 598436;
 Sat, 09 Sep 2023 08:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetNQ-0001vr-3e
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:31:36 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491a5098-4eeb-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:31:35 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-269304c135aso2172297a91.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:31:35 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a17090ab28e00b0026f3e396882sm4091663pjr.45.2023.09.09.01.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:31:33 -0700 (PDT)
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
X-Inumbo-ID: 491a5098-4eeb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248294; x=1694853094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMjqniKvNz74jeLELNKkTBZ2YCjvVUjOwJ430ggknLM=;
        b=uy1NOFjjRvme9BOUszvmjA+e6CTiPbDqHVXRIHfWtWdpK+jIljznwKdlB9OW/xqgPQ
         Y1D8uZ250eBntwsSxaRwwCl23ESqCaFZeAjCRvuVIfJ0DF6UAcaf4UxAc5o1LiEveDFR
         jEGU/LeceCu7m76+NHpg4Nnzpwk3qWfcmV4yongGbWQ4NTShP/JtQYm+l/IaNDvXKuNy
         ZfIINWCSLieU3Yd9lOIaPGEQ0KRBgLOX1CLtiAwErHuAS7WXn4dEe29RF1bX0NAqZE8l
         e+UbbQgk4Vh5V7Ap8YxewHU18rxNnGzCsXRYTz3UiNKOGjfjD71iGa0zLdQdmqJFXSUX
         2hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248294; x=1694853094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMjqniKvNz74jeLELNKkTBZ2YCjvVUjOwJ430ggknLM=;
        b=Wm8X88PF6GAR56s7U3fTm51qM8ykZLZ0MOI03fGUsBR0ivu7eFgXdOPzEPnNvRSxwP
         u9FGgyw9qftEQf/SjonXYRxwDdg6IMEQ7fA++11S5sk/yY6yU/wQCLfJGenQjiOutZS3
         tRUoTJH8jmQHvP90yqP43QaKuxTV/GWUlwDjXCs8juYGQScT4ffhBqZULwEmmpVJT6sK
         cQIsZE/ZU8YtvtQx3yUTa3cpe75JQi6cfaeFlKqqmF2t7/B4JRq+4vWy5cGYd7jNF38/
         cieKIaHF3zoO4R2vyJOz5USEw3IKQntpFwvcuFAPY2MCpAja8bCkK4LeekO9l+AtfDkj
         fi4Q==
X-Gm-Message-State: AOJu0YyGi7hhUNtYMO02zxglJzhu5ONPjkrDYHfhHvzftxi6/seAkRz+
	4fQ/pcAKpk4zWL5bOFj+F0qMyqGkZDVsRGGOiQPnqrc9
X-Google-Smtp-Source: AGHT+IFJbs9Jzi8VlE8c7jrv3+EDAZjHGFFulkckYsCgSOuhJcpLUXDUMxlG1kZoSX9QRTXzjSUa9w==
X-Received: by 2002:a17:90b:1e49:b0:268:71e4:ec2a with SMTP id pi9-20020a17090b1e4900b0026871e4ec2amr4096911pjb.48.1694248294019;
        Sat, 09 Sep 2023 01:31:34 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 2/2] xen/arm: Enlarge identity map space to 127TiB
Date: Sat,  9 Sep 2023 16:31:19 +0800
Message-Id: <20230909083119.870663-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230909083119.870663-1-leo.yan@linaro.org>
References: <20230909083119.870663-1-leo.yan@linaro.org>
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


