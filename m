Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4567C85C3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 14:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616524.958616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG7-0004Sn-Hf; Fri, 13 Oct 2023 12:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616524.958616; Fri, 13 Oct 2023 12:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrHG7-0004QF-Eo; Fri, 13 Oct 2023 12:27:15 +0000
Received: by outflank-mailman (input) for mailman id 616524;
 Fri, 13 Oct 2023 12:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrHG6-0003w8-RR
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 12:27:14 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67de420-69c3-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 14:27:14 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so15504605ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 05:27:14 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b001c452f827casm3768599plg.257.2023.10.13.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:27:12 -0700 (PDT)
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
X-Inumbo-ID: d67de420-69c3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697200033; x=1697804833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j80SOex9mExMTkObsMSQYMPmo2OqpvRyqD3vJdtHLVY=;
        b=yyOLlg4McAmcWypYnTkatcCY646rJRuxBptB9kpJ0Fc+u1DrDSrtYlZy25QbUNOSVk
         bnRYK63qgl5+Zd+jYc6oqVdt1leO841HgiR+aBVEYTX2zNITX5wu9iFaElcxMgGWn1dn
         /Odksm8n4JLPjdpSU/4ZpkGS9yG8SOtN9PyLcKyOEdmUnvfHhyx9pjzInFxNwKA8AQwL
         LjNwBtunHp7ZOvgt2obh00muEFuw0J5i2EGzq0+GqfFHdEVSKVCfA8mXyOFqdIEySNik
         Mtb02n0tPnPXvIc1CbYuVe44j84wmwP0Nl1aLvN3xi74H+S1Bm9MnOEmEX/h4M+vWIN0
         diEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697200033; x=1697804833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j80SOex9mExMTkObsMSQYMPmo2OqpvRyqD3vJdtHLVY=;
        b=tplX6MaF+aySt+y7kgbutmjCgZ5yai3vyl0/nFsQmWktm5SdUFOVq+OGR/kPDPkFHn
         IWbSgcRSoYyFak1HtAOik0rpkasvkP9f88F+7RLwzHAAxxKUVBC1kKUOxEwMdz32Gy+P
         DvsujUke12k9cWgq6IlYigbN8b9Vo0L+xpepdv+s2iPm2w9GyYoxo8gO24hRUKv60rYg
         5bdIHOjMQSofN2SQ/byATrziEMuqf5aQVVckpCG1OgKViaxNPMVa5V+9BFyw3xrB7ZjM
         PWqb4zjeP9VnMrSUzj+YAdsOrkg5gLOmYf+ouNBGLlylp/OXYNWJSDnyu7a03uehviHW
         ZVEg==
X-Gm-Message-State: AOJu0YyHA6twDQHbxOedLGieYq0nzGA006h4i5vSaHooyk9bqJnpucq2
	09tajA+6N17TTW9KH+6s6NfLlSMitr2CMLZoS418HA==
X-Google-Smtp-Source: AGHT+IE6VFmvCcR0rgfXzM0/7CqJQ6Sq7Q5QXSvgv3E2SF5Jd1fHe9R21VmKsdLrn/x6Eao/81iFtA==
X-Received: by 2002:a17:902:c40a:b0:1c7:5a63:43bb with SMTP id k10-20020a170902c40a00b001c75a6343bbmr33461164plk.8.1697200032760;
        Fri, 13 Oct 2023 05:27:12 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Date: Fri, 13 Oct 2023 20:26:58 +0800
Message-Id: <20231013122658.1270506-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013122658.1270506-1-leo.yan@linaro.org>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
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

This patch enlarges identity map space to 10TB, allowing module loading
within the range of [0x0 .. 0x000009ff_ffff_ffff].

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
index 2cb2382fbf..eac7eef885 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -19,11 +19,11 @@
  *   2G -   4G   Domheap: on-demand-mapped
  *
  * ARM64 layout:
- * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ * 0x0000000000000000 - 0x000009ffffffffff (10TB, L0 slots [0..19])
  *
  *  Reserved to identity map Xen
  *
- * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
+ * 0x00000a0000000000 - 0x00000a7fffffffff (512GB, L0 slot [20])
  *  (Relative offsets)
  *   0  -   2M   Unmapped
  *   2M -  10M   Xen text, data, bss
@@ -35,7 +35,7 @@
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
+ * 0x00000a8000000000 - 0x00007fffffffffff (512GB+117TB, L0 slots [21..255])
  *  Unused
  *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
@@ -49,7 +49,7 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
-#define IDENTITY_MAPPING_AREA_NR_L0     4
+#define IDENTITY_MAPPING_AREA_NR_L0     20
 #define XEN_VM_MAPPING                  SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
 
 #define SLOT0_ENTRY_BITS  39
-- 
2.39.2


