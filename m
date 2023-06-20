Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD2737296
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551997.861880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyz-0008Ay-GC; Tue, 20 Jun 2023 17:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551997.861880; Tue, 20 Jun 2023 17:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyz-00086u-9W; Tue, 20 Jun 2023 17:17:33 +0000
Received: by outflank-mailman (input) for mailman id 551997;
 Tue, 20 Jun 2023 17:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyw-0005iB-OT
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:30 +0000
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [2607:f8b0:4864:20::e2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55e2d089-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:30 +0200 (CEST)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-440b66adc81so854514137.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:30 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:28 -0700 (PDT)
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
X-Inumbo-ID: 55e2d089-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281448; x=1689873448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fjtno19HlqIKZlbtqkAAG6ggnFUVfYA4lZq6D4RFmU=;
        b=iIdMeU4y0VdO4JnA0H+pJgryhUUU5Hs0JZa7LVogJRMtTMQ3KmFElVEGGxaUU7IOOL
         Si11cySxP2h8+a7v7oOnB0qStxH1lyRyRm5JQEhHovVwbdGRRMrOM/mJ7uV9bBf1I0nv
         VFKFCLu1wCnO2l1Z0KfX5sKKkUyLZrfWCgn9Bcy0/CrrU8JJuJRL+jbHQSQNTk6+lvPe
         28jKgvTsAO2VtaMVdH7CvUOyIyEE7g4fmVDYufhk5C3Kzi/j9sra83o5gMMUORNnwkm/
         MW7GaMu/SDakwBIkSiwPwe8gOdLijkkxo0jf8L9tlsa57XPzBiILu53p56LiJNijm88i
         qdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281448; x=1689873448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fjtno19HlqIKZlbtqkAAG6ggnFUVfYA4lZq6D4RFmU=;
        b=ZFkdBLoeaqOgnCAE+W39Hs+pTl5G9V+JhJo00X5Ce2YmY+MA8jJFnnLUqTcy+sxd32
         pXU++1UzRq7KiF//7iBqZc2uK7GoXvSKAysnTwUBvInMLrzZNuyomfqCz9JjOAgxR4OD
         jYjXPKHd5fCSkE7poD+d9HzxjbJmdpZS0VVjqPO7Sjk8C2Phs4c8ZPNxWv4uuCMfrrO2
         q5Y9hbYTuATGe/WgNGr9lAAMuVXwymZ4rItoOsmYjYShjC55gBUrHq8QZpcaP/6cCS1A
         lCvDu1c8HjPmg2avRnl70xPVUUBqcc4hf1kOTDOLmadhPBQeW61klZsT3imMVInOkLO4
         6h4g==
X-Gm-Message-State: AC+VfDwyE22d1YtTn2ON9pOigDfsQguvN7J2Di88ffrKA/L/naKDxks/
	3bJlbmlyrZCkQqe2ZSfQTmtmobhz4D+KMA==
X-Google-Smtp-Source: ACHHUZ7dPxqtN7XNpJ+cQlQ2aT5wsLr5A17J5Y7tAF+5tcvPlSCLK2UFAuZAbT0eu3bkNE00SJhJCQ==
X-Received: by 2002:a67:d087:0:b0:438:d4bd:f1f2 with SMTP id s7-20020a67d087000000b00438d4bdf1f2mr4795848vsi.22.1687281448728;
        Tue, 20 Jun 2023 10:17:28 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 10/12] hvmloader: use libacpi to build MCFG table
Date: Tue, 20 Jun 2023 13:15:50 -0400
Message-Id: <d6dcd86eed99dc42aee8693fc855daedd0e2aeed.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch extends hvmloader_acpi_build_tables() with code which detects
if MMCONFIG is available -- i.e. initialized and enabled (+we're running
on Q35), obtains its base address and size and asks libacpi to build MCFG
table for it via setting the flag ACPI_HAS_MCFG in a manner similar
to other optional ACPI tables building.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/util.c | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index ea416ebe10..7a75c07467 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -782,6 +782,69 @@ int get_pc_machine_type(void)
     return machine_type;
 }
 
+#define PCIEXBAR_ADDR_MASK_64MB     (~((1ULL << 26) - 1))
+#define PCIEXBAR_ADDR_MASK_128MB    (~((1ULL << 27) - 1))
+#define PCIEXBAR_ADDR_MASK_256MB    (~((1ULL << 28) - 1))
+#define PCIEXBAR_LENGTH_BITS(reg)   (((reg) >> 1) & 3)
+#define PCIEXBAREN                  1
+
+static uint64_t mmconfig_get_base(void)
+{
+    uint64_t base;
+    uint32_t reg = pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR);
+
+    base = reg | (uint64_t) pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR+4) << 32;
+
+    switch (PCIEXBAR_LENGTH_BITS(reg))
+    {
+    case 0:
+        base &= PCIEXBAR_ADDR_MASK_256MB;
+        break;
+    case 1:
+        base &= PCIEXBAR_ADDR_MASK_128MB;
+        break;
+    case 2:
+        base &= PCIEXBAR_ADDR_MASK_64MB;
+        break;
+    case 3:
+        BUG();  /* a reserved value encountered */
+    }
+
+    return base;
+}
+
+static uint32_t mmconfig_get_size(void)
+{
+    uint32_t reg = pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR);
+
+    switch (PCIEXBAR_LENGTH_BITS(reg))
+    {
+    case 0: return MB(256);
+    case 1: return MB(128);
+    case 2: return MB(64);
+    case 3:
+        BUG();  /* a reserved value encountered */
+    }
+
+    return 0;
+}
+
+static uint32_t mmconfig_is_enabled(void)
+{
+    return pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR) & PCIEXBAREN;
+}
+
+static int is_mmconfig_used(void)
+{
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+    {
+        if (mmconfig_is_enabled() && mmconfig_get_base())
+            return 1;
+    }
+
+    return 0;
+}
+
 static void validate_hvm_info(struct hvm_info_table *t)
 {
     uint8_t *ptr = (uint8_t *)t;
@@ -1022,6 +1085,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->pci_hi_len = pci_hi_mem_end - pci_hi_mem_start;
     }
 
+    if ( is_mmconfig_used() )
+    {
+        config->table_flags |= ACPI_HAS_MCFG;
+        config->mmconfig_addr = mmconfig_get_base();
+        config->mmconfig_len  = mmconfig_get_size();
+    }
+
     s = xenstore_read("platform/generation-id", "0:0");
     if ( s )
     {
-- 
2.34.1


