Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB3798BC48
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808072.1219921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9J-0004Vc-9W; Tue, 01 Oct 2024 12:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808072.1219921; Tue, 01 Oct 2024 12:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9J-0004Sa-2M; Tue, 01 Oct 2024 12:38:41 +0000
Received: by outflank-mailman (input) for mailman id 808072;
 Tue, 01 Oct 2024 12:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9F-0002va-LL
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:37 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13ab85fd-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:36 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fad100dd9eso21654871fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:36 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:34 -0700 (PDT)
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
X-Inumbo-ID: 13ab85fd-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786315; x=1728391115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yI0HSpcntLJIYW3VaOO9aCgh2JBlz3FO3H/5MUH+To=;
        b=RV9+Jl1CwV5JzEnT1G2R8/wf0h5dCEfOrP23lrcAV/KD3/oWmImePzp6UBlaTXYd44
         6aHuIi6wSUqkzDCOOLQq0axEwsarPe3auS8mg96acvWo86dj6Z9A3fpeMICQG+S1Ycm9
         pVWa9NWHBExH7fPG51ub/+xUwEhe9pIEbAutA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786315; x=1728391115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yI0HSpcntLJIYW3VaOO9aCgh2JBlz3FO3H/5MUH+To=;
        b=BqGVgZlrzyhPROVAJqDsV1eX3YAHTb/iAvgqpMZicSGg8ZDMXOeEWH1dZxODDvF5Rv
         /POfoaoMDmx4pqqNO/H3VMNEx+kgCynHwiLmJfxaig09lKCsEEqTlL9553TW+LyHhPmf
         093EuwuUK8gh8UyPoc8t62kZgEzbk+H5uI1BycY50tbSXILcNH48HyRfYPNQ01ig8YyR
         NrKrjmuMgrvnMMnShRClXafG/KCqSwktGaOj7aD3uckytglaPpibUMDEDGdMaBFLOceB
         vTS+ZlqeBEe5tuENjNkUUDGnOZXYwlqjSiq8FtJqUE5oS9c+VJ+RZ3yBhcTh8u6C0ame
         hXYg==
X-Gm-Message-State: AOJu0YzUtWnGzJbPJ7u471q/8dpfzjlntU0AvxzWG2n73qDuyz2E37yx
	csnpjgPBkIzHxRl+mVKhTk/ZBkXwNMieIVif89JKiWX/NphSfDX0c/VQLNZCgvJrlG57ojnHPEl
	tvY4=
X-Google-Smtp-Source: AGHT+IGswhbqCcBlXpdoQJzmjI32zdk/Fk5jlyLkCAjcdzHhOpmY1QgcPMuevLyWV+yJ/44rfe98Vw==
X-Received: by 2002:a2e:be0d:0:b0:2fa:c49b:d14f with SMTP id 38308e7fff4ca-2fac49bd8f2mr50165401fa.2.1727786315182;
        Tue, 01 Oct 2024 05:38:35 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 06/11] tools/libacpi: Use LUT of APIC IDs rather than function pointer
Date: Tue,  1 Oct 2024 13:38:02 +0100
Message-ID: <20241001123807.605-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactors libacpi so that a single LUT is the authoritative source of
truth for the CPU to APIC ID mappings. This has a know-on effect in
reducing complexity on future patches, as the same LUT can be used for
configuring the APICs and configuring the ACPI tables for PVH.

Not functional change intended, because the same mappings are preserved.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/firmware/hvmloader/util.c   | 7 +------
 tools/include/xenguest.h          | 5 +++++
 tools/libacpi/build.c             | 6 +++---
 tools/libacpi/libacpi.h           | 2 +-
 tools/libs/light/libxl_dom.c      | 5 +++++
 tools/libs/light/libxl_x86_acpi.c | 7 +------
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 7e1e105d79dd..4a6303bbae8c 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -825,11 +825,6 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
     /* ACPI builder currently doesn't free memory so this is just a stub */
 }
 
-static uint32_t acpi_lapic_id(unsigned cpu)
-{
-    return CPU_TO_X2APIC_ID[cpu];
-}
-
 void hvmloader_acpi_build_tables(struct acpi_config *config,
                                  unsigned int physical)
 {
@@ -859,7 +854,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     }
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
-    config->lapic_id = acpi_lapic_id;
+    config->cpu_to_apicid = CPU_TO_X2APICID;
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
index deda39e5dbc4..8b010212448c 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -84,7 +84,7 @@ struct acpi_config {
     unsigned long rsdp;
 
     /* x86-specific parameters */
-    uint32_t (*lapic_id)(unsigned cpu);
+    uint32_t *cpu_to_apicid; /* LUT mapping cpu id to (x2)APIC ID */
     uint32_t lapic_base_address;
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef374014e..7f9c6eaa8b24 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1082,6 +1082,11 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
 
     dom->container_type = XC_DOM_HVM_CONTAINER;
 
+#if defined(__i386__) || defined(__x86_64__)
+    for ( uint32_t i = 0; i < info->max_vcpus; i++ )
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
2.46.0


