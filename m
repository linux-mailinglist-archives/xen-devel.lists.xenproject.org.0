Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918DCB2CA66
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 19:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086726.1444899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoPyo-0003ls-MV; Tue, 19 Aug 2025 17:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086726.1444899; Tue, 19 Aug 2025 17:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoPyo-0003kP-Js; Tue, 19 Aug 2025 17:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1086726;
 Tue, 19 Aug 2025 17:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9H+3=27=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uoPym-0003kJ-Vv
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 17:18:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878fc7db-7d20-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 19:18:31 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b097037so31571485e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 10:18:31 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c074879859sm4371615f8f.3.2025.08.19.10.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 10:18:30 -0700 (PDT)
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
X-Inumbo-ID: 878fc7db-7d20-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755623911; x=1756228711; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plhE2oARVW1biycRxwi0J8Qr/Qq0NXG+SsA73OEzfFI=;
        b=T4Gj7bsXshj2wm17nw+jLha/zzXflhzJ6hXnputn2YCXXWi2s9rjNMiwvwd7/SNbqb
         JJ8Yv6PCCWG0UXIRzMUmoOWWfaOgmLKHjbH2pK4whN7XfG7sDSLs2GKBZnFiAPcO7xet
         KdGljXQUxGaeoCd47CW60L4G7x2gH3n0tB80o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755623911; x=1756228711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plhE2oARVW1biycRxwi0J8Qr/Qq0NXG+SsA73OEzfFI=;
        b=rMSs0x6utFOFg/yHkPGKpUJlkSd2thT7QxaJvfxMUnoIa3mMF0lzNuOxa8MK4Q8PLF
         718atfnjPRGxS/PmePcQoMPezyNSecnsoCHMZDtmXzd81SmiIcVjkpRm0/xTzqZ7M/5p
         rUF4/6Lsn1VNTSRnhrtYIjHFLr/EYGDjVQDMYI529u7SaEFArIeLoSNs75V66AdsGj5e
         cyzBW/dbIW4YFayemmVBatQS10zSnr5yYwAd9UtmFuUTjqBCIMu6H7NEBm7IegxiJE72
         EyC4iqNjh82QT1ZSq9Ayxje/dvq/Vt8MGWMmfzdl0jM6HowIw77hcRB/zEtvnadli8ow
         /i8w==
X-Gm-Message-State: AOJu0YzVNhz+Q3gMRCjJ4JY9Eq9ONMjGRttA34ch5XDrCqUnXY5z2+Ts
	4Udg0KWKXBzYzHCQbhsDzSwNJ8t6gro+TW+g6v+92c0kKyMRA7T8t2jXIiP0XTiFVHJAd40M5Py
	Tnad3
X-Gm-Gg: ASbGnct1BbpCGBCoyX2s3UwPW9UVonsIVMzgkPs930ikUP99zWrcch85g/fPzLUvwI9
	ZK4rIbrAU+6EMdzGpYaDV3vGF1DPDG9wMnn2GetmmThhDbBTU9do0JEDiZ107l/5h3ANFCBL4iV
	QmfSjAamnmFRat64nWYCNVzoZm0mrtOQfNhnBpJ+KCe3RC6kacUVVzPqzr8UtpwJOZm/F4xxFK0
	4eX9Z9A3BsFpI81BpU2sfRx5bWK0zqloJDVG9FswgSSS4O10K8ORoaCrlVufnkzpERSh6wdXpHi
	UvOD9nn1rNxPM/zNohQpSbZoHppxJaZnQIcpf8fKY3q0dN7baoLGE0zqvazAx2JWH8GL83yB/cj
	PW7WiGFQ5CtAX3LK6jSD1qazdwHY/m1v7ddvRirIDzGY1PnedNNSnXx/tzZSV9eIhkxBZRtGYVF
	Ac
X-Google-Smtp-Source: AGHT+IG23CtaPSekZ6jsN8U8SwAfMunksdT8XIiiAGIEvzFpNKuM2q2b3dYxOQE3bINYqJioUWGrqA==
X-Received: by 2002:a05:600c:524b:b0:456:285b:db29 with SMTP id 5b1f17b1804b1-45b43e13947mr29878195e9.29.1755623910752;
        Tue, 19 Aug 2025 10:18:30 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/iommu: setup MMCFG ahead of IOMMU
Date: Tue, 19 Aug 2025 19:18:26 +0200
Message-ID: <20250819171826.60700-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise the PCI accesses to segments different than the first one done by
the IOMMU initialization code would silently fail by returning all ones.

Introduce a new helper, called pci_setup(), and move both the creation of
PCI segment 0 internal data structures, plus the parsing of ACPI MMCFG
table to it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/boot.c              |  2 --
 xen/arch/x86/include/asm/pci.h        |  2 ++
 xen/arch/x86/pci.c                    | 16 ++++++++++++++++
 xen/arch/x86/setup.c                  |  7 +++----
 xen/arch/x86/x86_64/mmconfig-shared.c |  3 +++
 5 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 3901f9d9825b..1ca2360e0065 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -748,8 +748,6 @@ int __init acpi_boot_init(void)
 
 	acpi_table_parse(ACPI_SIG_HPET, acpi_parse_hpet);
 
-	acpi_mmcfg_init();
-
 	erst_init();
 
 	acpi_hest_init();
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index 665b32116521..0b98081aeaa4 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -74,4 +74,6 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 struct rangeset;
 int pci_sanitize_bar_memory(struct rangeset *r);
 
+void pci_setup(void);
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 26bb7f6a3c3a..e75a29e851a7 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -6,7 +6,10 @@
 
 #include <xen/spinlock.h>
 #include <xen/pci.h>
+
+#include <asm/acpi.h>
 #include <asm/io.h>
+
 #include <xsm/xsm.h>
 
 static DEFINE_SPINLOCK(pci_config_lock);
@@ -139,6 +142,19 @@ int pci_sanitize_bar_memory(struct rangeset *r)
     return 0;
 }
 
+void __init pci_setup(void)
+{
+    /*
+     * Ahead of any ACPI table parsing make sure we have control structures
+     * for PCI segment 0.
+     */
+    if ( pci_add_segment(0) )
+        panic("Could not initialize PCI segment 0\n");
+
+    /* Parse ACPI MMCFG ahead of IOMMU, so accesses to segments > 0 is setup. */
+    acpi_mmcfg_init();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6fb42c5a5f95..bd648323bfed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1938,11 +1938,10 @@ void asmlinkage __init noreturn __start_xen(void)
     setup_system_domains();
 
     /*
-     * Ahead of any ACPI table parsing make sure we have control structures
-     * for PCI segment 0.
+     * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
+     * setup, as it requires access to the PCI config space.
      */
-    if ( pci_add_segment(0) )
-        panic("Could not initialize PCI segment 0\n");
+    pci_setup();
 
     /*
      * IOMMU-related ACPI table parsing has to happen before APIC probing, for
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index f1a3d42c5b21..fbe2676f8636 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
 {
     bool valid = true;
 
+    if ( acpi_disabled )
+        return;
+
     /* MMCONFIG disabled */
     if ((pci_probe & PCI_PROBE_MMCONF) == 0)
         return;
-- 
2.49.0


