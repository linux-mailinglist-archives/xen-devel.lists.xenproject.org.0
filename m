Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF79A6E97
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823739.1237836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc5-0008Rj-6t; Mon, 21 Oct 2024 15:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823739.1237836; Mon, 21 Oct 2024 15:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc4-0008KR-P0; Mon, 21 Oct 2024 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 823739;
 Mon, 21 Oct 2024 15:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc2-00072f-L2
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:30 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a329ebb5-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:29 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so5935511e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:29 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:27 -0700 (PDT)
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
X-Inumbo-ID: a329ebb5-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525588; x=1730130388; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt6+5jEr1Vb36dNDj6FYHrZnMI7Ec+TK6iPRKwqkLa8=;
        b=dYWfdIqie9JvNXBWGcz9yHXzD4Btc/2WwTI1L2GNS2H0PGsJ9qpmSb0xm+Jlgi30i6
         XDs/Kmb5AeNyJ+GH8u1JYMsAJO/qWMBOxOMVUsqgghWJmFx1GlC97p4Lzu/7TqO5byGz
         EuKMI7qlj0MPt5Amx8vcmtuA9AxYPLMox2tP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525588; x=1730130388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kt6+5jEr1Vb36dNDj6FYHrZnMI7Ec+TK6iPRKwqkLa8=;
        b=l7XGlkpLjPJLcCLCiIyGyd9zIl8NUOIKVSrxuP4WiPtH6S4r1Cc/HD2wzLBKYxd7N+
         oAraV0aAqm1N9bl+ulfFXCRMlwTbw0iFJ0VE6rWUvMpj9nH0lciIkz+ZViD3cEMj92mA
         2H2ywZlkrzJW2vi4ZkOBOVsdR1RgLVFHp2s2jJSQQ6KIND2OhCQjr8k8HAwFnYFUw9tR
         u10NH573h7odvkYaBIOcKA4rxxRf4VR1FEhTEzhNGinnUErJZlyORq5mAn9shEdA1WeI
         Wul+BMZfvWBvdT18MzT9eR6FvBYHTmrLQbSX7BDVjrXDCKk334Nv330QT7ShTzDiH4Bk
         8Nmg==
X-Gm-Message-State: AOJu0YyzoFEZ23cjvM/GxFKCtCoL5sjEKnYfeQb/ecmjYXpELfKv7PWY
	YmA1uhcqHl6NTrSrkgsN9XYsW1gQNBoNQI8av/CI00U0MDHtIbCmy//naRZ2hjkeUrv5NAUi5cP
	G
X-Google-Smtp-Source: AGHT+IEVrJLMBoJ/8SaBB8jA+N4KaLZEj3RQfn5qwUH4alpb3yPxMwBg2zaGlHFDoRArLQYZjKNmAw==
X-Received: by 2002:a05:6512:b19:b0:539:d2e2:41ff with SMTP id 2adb3069b0e04-53a15493465mr5426897e87.23.1729525588191;
        Mon, 21 Oct 2024 08:46:28 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 05/10] tools/libacpi: Use LUT of APIC IDs rather than function pointer
Date: Mon, 21 Oct 2024 16:45:55 +0100
Message-ID: <20241021154600.11745-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactors libacpi so that a single LUT is the authoritative source of
truth for the CPU to APIC ID mappings. This has a know-on effect in
reducing complexity on future patches, as the same LUT can be used for
configuring the APICs and configuring the ACPI tables for PVH.

Not functional change intended, because the same mappings are preserved.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * NOTE: didn't add assert to libacpi as initially accepted in order to
    protect libvirt from an assert failure.
  * s/uint32_t/unsigned int/ in for loop of libxl.
  * turned Xen-style loop in libxl to libxl-style.
---
 tools/firmware/hvmloader/util.c   | 7 +------
 tools/include/xenguest.h          | 5 +++++
 tools/libacpi/build.c             | 6 +++---
 tools/libacpi/libacpi.h           | 2 +-
 tools/libs/light/libxl_dom.c      | 5 +++++
 tools/libs/light/libxl_x86_acpi.c | 7 +------
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 821b3086a87d..afa3eb9d5775 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -825,11 +825,6 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
     /* ACPI builder currently doesn't free memory so this is just a stub */
 }
 
-static uint32_t acpi_lapic_id(unsigned cpu)
-{
-    return cpu_to_x2apic_id[cpu];
-}
-
 void hvmloader_acpi_build_tables(struct acpi_config *config,
                                  unsigned int physical)
 {
@@ -859,7 +854,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     }
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
-    config->lapic_id = acpi_lapic_id;
+    config->cpu_to_apicid = cpu_to_x2apicid;
     config->ioapic_base_address = IOAPIC_BASE_ADDRESS;
     config->ioapic_id = IOAPIC_ID;
     config->pci_isa_irq_mask = PCI_ISA_IRQ_MASK; 
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..aa50b78dfb89 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -22,6 +22,8 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
+#include "xen/hvm/hvm_info_table.h"
+
 #define XC_NUMA_NO_NODE   (~0U)
 
 #define XCFLAGS_LIVE      (1 << 0)
@@ -236,6 +238,9 @@ struct xc_dom_image {
 #if defined(__i386__) || defined(__x86_64__)
     struct e820entry *e820;
     unsigned int e820_entries;
+
+    /* LUT mapping cpu id to (x2)APIC ID */
+    uint32_t cpu_to_apicid[HVM_MAX_VCPUS];
 #endif
 
     xen_pfn_t vuart_gfn;
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db154..2ad1d461a2ec 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -74,7 +74,7 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
     const struct hvm_info_table   *hvminfo = config->hvminfo;
     int i, sz;
 
-    if ( config->lapic_id == NULL )
+    if ( config->cpu_to_apicid == NULL )
         return NULL;
 
     sz  = sizeof(struct acpi_20_madt);
@@ -148,7 +148,7 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
         lapic->length  = sizeof(*lapic);
         /* Processor ID must match processor-object IDs in the DSDT. */
         lapic->acpi_processor_id = i;
-        lapic->apic_id = config->lapic_id(i);
+        lapic->apic_id = config->cpu_to_apicid[i];
         lapic->flags = (test_bit(i, hvminfo->vcpu_online)
                         ? ACPI_LOCAL_APIC_ENABLED : 0);
         lapic++;
@@ -236,7 +236,7 @@ static struct acpi_20_srat *construct_srat(struct acpi_ctxt *ctxt,
         processor->type     = ACPI_PROCESSOR_AFFINITY;
         processor->length   = sizeof(*processor);
         processor->domain   = config->numa.vcpu_to_vnode[i];
-        processor->apic_id  = config->lapic_id(i);
+        processor->apic_id  = config->cpu_to_apicid[i];
         processor->flags    = ACPI_LOCAL_APIC_AFFIN_ENABLED;
         processor++;
     }
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5dbc4..e8f603ee18ee 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -84,7 +84,7 @@ struct acpi_config {
     unsigned long rsdp;
 
     /* x86-specific parameters */
-    uint32_t (*lapic_id)(unsigned cpu);
+    const uint32_t *cpu_to_apicid; /* LUT mapping cpu id to (x2)APIC ID */
     uint32_t lapic_base_address;
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef374014e..5f4f6830e850 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1082,6 +1082,11 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
 
     dom->container_type = XC_DOM_HVM_CONTAINER;
 
+#if defined(__i386__) || defined(__x86_64__)
+    for (unsigned int i = 0; i < info->max_vcpus; i++)
+        dom->cpu_to_apicid[i] = 2 * i; /* TODO: Replace by topo calculation */
+#endif
+
     /* The params from the configuration file are in Mb, which are then
      * multiplied by 1 Kb. This was then divided off when calling
      * the old xc_hvm_build_target_mem() which then turned them to bytes.
diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 5cf261bd6794..585d4c8755cb 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -75,11 +75,6 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
 {
 }
 
-static uint32_t acpi_lapic_id(unsigned cpu)
-{
-    return cpu * 2;
-}
-
 static int init_acpi_config(libxl__gc *gc, 
                             struct xc_dom_image *dom,
                             const libxl_domain_build_info *b_info,
@@ -144,7 +139,7 @@ static int init_acpi_config(libxl__gc *gc,
     config->hvminfo = hvminfo;
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
-    config->lapic_id = acpi_lapic_id;
+    config->cpu_to_apicid = dom->cpu_to_apicid;
     config->acpi_revision = 5;
 
     rc = 0;
-- 
2.47.0


