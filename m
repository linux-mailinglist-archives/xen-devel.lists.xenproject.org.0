Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB35737293
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551995.861866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyw-0007Xv-Vi; Tue, 20 Jun 2023 17:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551995.861866; Tue, 20 Jun 2023 17:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyw-0007Td-Ma; Tue, 20 Jun 2023 17:17:30 +0000
Received: by outflank-mailman (input) for mailman id 551995;
 Tue, 20 Jun 2023 17:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyv-0005iB-98
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:29 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5507f960-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:28 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-be49e41a3d6so3677356276.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:28 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:26 -0700 (PDT)
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
X-Inumbo-ID: 5507f960-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281447; x=1689873447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euxQjj1nka42h3IgnfVDkR/WuQVbd1+OBbuouObQPZw=;
        b=ULINpF4cSUf3E0vswpH5QAioshxNpdrmsaQInoUb8RunfkwL889I8OvlIM6qjWZCk4
         uxiDLykMuYl0naI1OGQNjyxFVfeQp0u9H1iPwZtbnWD2pX3538vZsErT3Dk3Tp9pH+7L
         FAjy9doJWjWE9uzJVcS9FI5byrLrI0tVlqwr8Li+iM8t4S7aHz925xtqyz7Jx9ECpwtw
         FexVqL6CDjTeADqsEE2H4t00aYSyDfWyahSmsy+rbU939psvTHIqO1x4AZ3jM5nXfIPE
         uCq2I+i8KDo503efp04bp6AiiRaVXs7cvdJwZ5FBO3aTg3y77vtQfke+tj6WIhSUwOyi
         1ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281447; x=1689873447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euxQjj1nka42h3IgnfVDkR/WuQVbd1+OBbuouObQPZw=;
        b=lma+31c3vFuN7Hzuo5WA6bloFNnQRh8U41SjonSPx98vLoW2bgRlP1Kg7K3dbU2DSV
         h5cTIvVecn2eZsP/DS9AVVxcJ6XbamWZ6R7dDJP0dzAjfTR7R4cAGC0L5aLHo9cxS04T
         aqRkEU6LhdahCzn5clOqqFB1IjBPUHgziHn1gcg+92lBeUjdQJqA4bZ2e2n7U/BVPMz/
         UYaHaOihQuYOQPpuH9Zbwk+4Fri4Jsz45dQnLtjocjjNIaeWnOLzcbdMsXztsqGJhAUK
         3RLtWGT4ttskH5Fm0OIUS6U5j7df3ZPxxALYyITlqBII8yhSuGti6jEUjrJjJnufcRz7
         aZUA==
X-Gm-Message-State: AC+VfDwiTfdZ/x25PNRQQAKSEfrenjLgyM37uDcdaOy6u27RrVbBaYZr
	6WRuoD5wo3pEMvvuT0puuG2gzQ0508xrqg==
X-Google-Smtp-Source: ACHHUZ5EB8KP3P9ZxnevN/zJy70NatbVfjPaFOUdV6sEz7ptY4/9L8nrO3fKDKVEOiFJsfGBavnyxg==
X-Received: by 2002:a25:3620:0:b0:bc9:716d:19bf with SMTP id d32-20020a253620000000b00bc9716d19bfmr7782477yba.14.1687281447274;
        Tue, 20 Jun 2023 10:17:27 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 09/12] libacpi: build ACPI MCFG table if requested
Date: Tue, 20 Jun 2023 13:15:49 -0400
Message-Id: <906595ebdc789e88715289ce48d306ae72e69fe1.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds construct_mcfg() function to libacpi which allows to build MCFG
table for a given mmconfig_addr/mmconfig_len pair if the ACPI_HAS_MCFG
flag was specified in acpi_config struct.

The maximum bus number is calculated from mmconfig_len using
MCFG_SIZE_TO_NUM_BUSES macro (1MByte of MMIO space per bus).

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/libacpi/acpi2_0.h | 21 ++++++++++++++++++++
 tools/libacpi/build.c   | 43 +++++++++++++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h |  4 ++++
 3 files changed, 68 insertions(+)

diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 6dfa939a8c..02b0cf1098 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -442,6 +442,24 @@ struct acpi_20_slit {
     uint64_t localities;
     uint8_t entry[0];
 };
+/*
+ * PCI Express Memory Mapped Configuration Description Table
+ */
+struct mcfg_range_entry {
+    uint64_t base_address;
+    uint16_t pci_segment;
+    uint8_t  start_pci_bus_num;
+    uint8_t  end_pci_bus_num;
+    uint32_t reserved;
+};
+
+struct acpi_mcfg {
+    struct acpi_header header;
+    uint8_t reserved[8];
+    struct mcfg_range_entry entries[1];
+};
+
+#define MCFG_SIZE_TO_NUM_BUSES(size)  ((size) >> 20)
 
 /*
  * Table Signatures.
@@ -458,6 +476,8 @@ struct acpi_20_slit {
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
 #define ACPI_2_0_SLIT_SIGNATURE ASCII32('S','L','I','T')
+#define ACPI_MCFG_SIGNATURE     ASCII32('M','C','F','G')
+
 
 /*
  * Table revision numbers.
@@ -473,6 +493,7 @@ struct acpi_20_slit {
 #define ACPI_1_0_FADT_REVISION 0x01
 #define ACPI_2_0_SRAT_REVISION 0x01
 #define ACPI_2_0_SLIT_REVISION 0x01
+#define ACPI_1_0_MCFG_REVISION 0x01
 
 #pragma pack ()
 
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db1..fc029d18bf 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -295,6 +295,37 @@ static struct acpi_20_slit *construct_slit(struct acpi_ctxt *ctxt,
     return slit;
 }
 
+static struct acpi_mcfg *construct_mcfg(struct acpi_ctxt *ctxt,
+                                        const struct acpi_config *config)
+{
+    struct acpi_mcfg *mcfg;
+
+    /* Warning: this code expects that we have only one PCI segment */
+    mcfg = ctxt->mem_ops.alloc(ctxt, sizeof(*mcfg), 16);
+    if (!mcfg)
+        return NULL;
+
+    memset(mcfg, 0, sizeof(*mcfg));
+    mcfg->header.signature    = ACPI_MCFG_SIGNATURE;
+    mcfg->header.revision     = ACPI_1_0_MCFG_REVISION;
+    fixed_strcpy(mcfg->header.oem_id, ACPI_OEM_ID);
+    fixed_strcpy(mcfg->header.oem_table_id, ACPI_OEM_TABLE_ID);
+    mcfg->header.oem_revision = ACPI_OEM_REVISION;
+    mcfg->header.creator_id   = ACPI_CREATOR_ID;
+    mcfg->header.creator_revision = ACPI_CREATOR_REVISION;
+    mcfg->header.length = sizeof(*mcfg);
+
+    mcfg->entries[0].base_address = config->mmconfig_addr;
+    mcfg->entries[0].pci_segment = 0;
+    mcfg->entries[0].start_pci_bus_num = 0;
+    mcfg->entries[0].end_pci_bus_num =
+        MCFG_SIZE_TO_NUM_BUSES(config->mmconfig_len) - 1;
+
+    set_checksum(mcfg, offsetof(struct acpi_header, checksum), sizeof(*mcfg));
+
+    return mcfg;;
+}
+
 static int construct_passthrough_tables(struct acpi_ctxt *ctxt,
                                         unsigned long *table_ptrs,
                                         int nr_tables,
@@ -342,6 +373,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_hpet *hpet;
     struct acpi_20_waet *waet;
     struct acpi_20_tcpa *tcpa;
+    struct acpi_mcfg *mcfg;
     struct acpi_20_tpm2 *tpm2;
     unsigned char *ssdt;
     void *lasa;
@@ -402,6 +434,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
+
+    /* MCFG */
+    if ( config->table_flags & ACPI_HAS_MCFG )
+    {
+        mcfg = construct_mcfg(ctxt, config);
+        if (!mcfg)
+            return -1;
+
+        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, mcfg);
+    }
+
     /* TPM and its SSDT. */
     if ( config->table_flags & ACPI_HAS_TPM )
     {
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5db..b4d3116ca5 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -27,6 +27,7 @@
 #define ACPI_HAS_8042              (1<<13)
 #define ACPI_HAS_CMOS_RTC          (1<<14)
 #define ACPI_HAS_SSDT_LAPTOP_SLATE (1<<15)
+#define ACPI_HAS_MCFG              (1<<16)
 
 struct xen_vmemrange;
 struct acpi_numa {
@@ -89,6 +90,9 @@ struct acpi_config {
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
     uint8_t ioapic_id;
+
+    uint64_t mmconfig_addr;
+    uint32_t mmconfig_len;
 };
 
 int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config);
-- 
2.34.1


