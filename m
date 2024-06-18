Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0690DB94
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 20:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743288.1150172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJdcE-0003Yf-O9; Tue, 18 Jun 2024 18:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743288.1150172; Tue, 18 Jun 2024 18:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJdcE-0003Wk-L1; Tue, 18 Jun 2024 18:31:34 +0000
Received: by outflank-mailman (input) for mailman id 743288;
 Tue, 18 Jun 2024 18:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJdcD-0003We-8S
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 18:31:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb93cb68-2da0-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 20:31:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso915433766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 11:31:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa41cbsm637414266b.225.2024.06.18.11.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 11:31:30 -0700 (PDT)
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
X-Inumbo-ID: fb93cb68-2da0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718735490; x=1719340290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVrqNbP8JDAWM4YAylBjML9Ao9iqvaZbmYG98FXKbU=;
        b=EjT9DoL8hlAWP+n/oAYkB0DebU9/52FqFDIgZHFBg9sz2ko5IaWgW+Ui0JDk6WNJBD
         vymMnEF4FxfKVV9BodDQx8f40QFVhZxbFz5d8WIP7tE+CM35gaZ/O5yJB5bwllEyLXRk
         1RJc7zA/6UImsca3+rLBAd1m+sSH1h4H/C2Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718735490; x=1719340290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjVrqNbP8JDAWM4YAylBjML9Ao9iqvaZbmYG98FXKbU=;
        b=NI3/VYVc2etY62ykfEnDNfyYxqbmGobm6Q8CVwtBq8EyV8TRLAlARjF8eDHm5G2WkZ
         TAV806O14ISvzC31aecqgy35KAGGUH+lU1SG0amNkTgBSJcKobuZ+O6wICR/RokUgfnL
         BLoCNi5my2iI9g3Q5QyB6WbaeHRVy3J37ZNpBM0XDU/NEMzyT9bHN3q9Hfu/onJqyfBx
         s4GvFs1HniYRkhCaEyIa879hqzjxE5EitO1cAunagGmF/54L0uqsMeZywj1/Lx3xGocq
         gJ+ApdNfq7s1vtm2YRbmop6Mh9/X0/PE+Q0IFJ1aaAKXEwoW91L6WA4tpK7fWULgwQRd
         Awzw==
X-Gm-Message-State: AOJu0YxoKtDUzpHZgD0lcQ+Y9cXZtdLD9FUKb5MksmTq6gE8sMuFREl5
	7YZdrDn8A0u5AUuTzsxD1Y6Ff2Kv5AqTIDtU7LdckMVYwORLP+jM7lT7Fdt8lOYDmj7ZvJqYzcW
	P3uA=
X-Google-Smtp-Source: AGHT+IEsnxVZ0LAM2ciHaE95xLl55lbzkuG+XsBpj3CGebNqe2SSGACfTWmgaGvnVe923BTR5NNDeA==
X-Received: by 2002:a17:907:dac:b0:a6e:fccb:7146 with SMTP id a640c23a62f3a-a6fab615b9dmr26720166b.23.1718735490379;
        Tue, 18 Jun 2024 11:31:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] AMD/IOMMU: Improve register_iommu_exclusion_range()
Date: Tue, 18 Jun 2024 19:31:28 +0100
Message-Id: <20240618183128.1981751-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Use 64bit accesses instead of 32bit accesses
 * Simplify the constant names
 * Pull base into a local variable to avoid it being reloaded because of the
   memory clobber in writeq().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

RFC.  This is my proposed way of cleaning up the whole IOMMU file.  The
diffstat speaks for itself.

I've finally found the bit in the AMD IOMMU spec which says 64bit accesses are
permitted:

  3.4 IOMMU MMIO Registers:

  Software access to IOMMU registers may not be larger than 64 bits. Accesses
  must be aligned to the size of the access and the size in bytes must be a
  power of two. Software may use accesses as small as one byte.

If we want to further simplify the logic, we could reject non-page-aligned
base/limits when parsing IVRS.

Also, these registers don't exist in newer AMD systems:

  When the system is SNP-enabled, the contents of the Exclusion range base
  address field are locked and re- purposed as the Completion store base
  address field. This contains bits [51:12] of the 4Kbyte-aligned base address
  that defines the starting address range that host COMPLETION_WAIT stores may
  target

I take this to mean the writes are discarded.
---
 xen/drivers/passthrough/amd/iommu-defs.h | 20 +++---------
 xen/drivers/passthrough/amd/iommu_init.c | 41 ++++++------------------
 2 files changed, 14 insertions(+), 47 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu-defs.h b/xen/drivers/passthrough/amd/iommu-defs.h
index c145248f9af1..9cf509b1f78b 100644
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -338,22 +338,10 @@ union amd_iommu_control {
 };
 
 /* Exclusion Register */
-#define IOMMU_EXCLUSION_BASE_LOW_OFFSET		0x20
-#define IOMMU_EXCLUSION_BASE_HIGH_OFFSET	0x24
-#define IOMMU_EXCLUSION_LIMIT_LOW_OFFSET	0x28
-#define IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET	0x2C
-#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000U
-#define IOMMU_EXCLUSION_BASE_LOW_SHIFT		12
-#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFFU
-#define IOMMU_EXCLUSION_BASE_HIGH_SHIFT		0
-#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001U
-#define IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT	0
-#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002U
-#define IOMMU_EXCLUSION_ALLOW_ALL_SHIFT		1
-#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000U
-#define IOMMU_EXCLUSION_LIMIT_LOW_SHIFT		12
-#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFFU
-#define IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT	0
+#define IOMMU_MMIO_EXCLUSION_BASE           0x20
+#define   EXCLUSION_RANGE_ENABLE            (1 << 0)
+#define   EXCLUSION_ALLOW_ALL               (1 << 1)
+#define IOMMU_MMIO_EXCLUSION_LIMIT          0x28
 
 /* Extended Feature Register */
 #define IOMMU_EXT_FEATURE_MMIO_OFFSET                   0x30
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 6c0dc2d5cb69..bcf1903e716e 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -223,40 +223,19 @@ static void set_iommu_command_buffer_control(struct amd_iommu *iommu,
 
 static void register_iommu_exclusion_range(struct amd_iommu *iommu)
 {
-    u32 addr_lo, addr_hi;
-    u32 entry;
-
-    addr_lo = iommu->exclusion_limit;
-    addr_hi = iommu->exclusion_limit >> 32;
-
-    set_field_in_reg_u32((u32)addr_hi, 0,
-                         IOMMU_EXCLUSION_LIMIT_HIGH_MASK,
-                         IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT, &entry);
-    writel(entry, iommu->mmio_base+IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET);
-
-    set_field_in_reg_u32((u32)addr_lo >> PAGE_SHIFT, 0,
-                         IOMMU_EXCLUSION_LIMIT_LOW_MASK,
-                         IOMMU_EXCLUSION_LIMIT_LOW_SHIFT, &entry);
-    writel(entry, iommu->mmio_base+IOMMU_EXCLUSION_LIMIT_LOW_OFFSET);
-
-    addr_lo = iommu->exclusion_base & DMA_32BIT_MASK;
-    addr_hi = iommu->exclusion_base >> 32;
+    void *__iomem base = iommu->mmio_base;
+    uint64_t val;
 
-    entry = 0;
-    iommu_set_addr_hi_to_reg(&entry, addr_hi);
-    writel(entry, iommu->mmio_base+IOMMU_EXCLUSION_BASE_HIGH_OFFSET);
-
-    entry = 0;
-    iommu_set_addr_lo_to_reg(&entry, addr_lo >> PAGE_SHIFT);
+    /* Exclusion Limit */
+    val = iommu->exclusion_limit & PAGE_MASK;
+    writeq(val, base + IOMMU_MMIO_EXCLUSION_LIMIT);
 
-    set_field_in_reg_u32(iommu->exclusion_allow_all, entry,
-                         IOMMU_EXCLUSION_ALLOW_ALL_MASK,
-                         IOMMU_EXCLUSION_ALLOW_ALL_SHIFT, &entry);
+    /* Exclusion Base, inc control bits. */
+    val = ((iommu->exclusion_base & PAGE_MASK) |
+           (iommu->exclusion_allow_all ? EXCLUSION_ALLOW_ALL : 0) |
+           (iommu->exclusion_enable    ? EXCLUSION_RANGE_ENABLE : 0));
 
-    set_field_in_reg_u32(iommu->exclusion_enable, entry,
-                         IOMMU_EXCLUSION_RANGE_ENABLE_MASK,
-                         IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT, &entry);
-    writel(entry, iommu->mmio_base+IOMMU_EXCLUSION_BASE_LOW_OFFSET);
+    writeq(val, base + IOMMU_MMIO_EXCLUSION_BASE);
 }
 
 static void cf_check set_iommu_event_log_control(
-- 
2.39.2


