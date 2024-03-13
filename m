Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737D87AAA6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:48:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692584.1079891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQon-0001QD-GX; Wed, 13 Mar 2024 15:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692584.1079891; Wed, 13 Mar 2024 15:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQon-0001Oc-Dt; Wed, 13 Mar 2024 15:47:01 +0000
Received: by outflank-mailman (input) for mailman id 692584;
 Wed, 13 Mar 2024 15:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xmzd=KT=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rkQdQ-0007MK-Ms
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:35:16 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49d8cea8-e14f-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:35:15 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a466a256726so11207066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:35:15 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 lt9-20020a170906fa8900b00a45c4d3ee11sm4930248ejb.123.2024.03.13.08.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:35:14 -0700 (PDT)
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
X-Inumbo-ID: 49d8cea8-e14f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710344114; x=1710948914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hRQqdzncpSGt6fbxgjyMV5po9/h6eRl9V9eIxuTQ6WM=;
        b=bl4Dt/huZinBzY2e1nMqXFh7DdwOewEBuT3hRQdi2P3QH/LxBQFO/Os6gyzcLtfZP7
         RTJ2k2f3D+KLb0lxPhBNE592gL7WDQGY+AjVyjaEcdNsvkOjZTSVRtlsLETJzcFSCcS2
         niGyuvdEHK3IthqumxO0IKJpGzLXmJJSWEUPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710344114; x=1710948914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRQqdzncpSGt6fbxgjyMV5po9/h6eRl9V9eIxuTQ6WM=;
        b=J18TOK0ThQhkE1F8AIpTlIi8md+PMPz/+KAIgfSqA2xqA0BuNTdoSOgbLWd2LpCJgZ
         haGxT0fi+unuNv2FVl4W8G0ss6lK1aIWeu60ffF3rn4s96OU+ybTsqqGHnFVJcGn5k6/
         7xN1vuwhiI7uR+2JN6qFlapVePvBlL8sHJ0tMvnbLKMRSQSX9BPBLisieCwBHUunh8oV
         eEXZ3PsPjscN3wkZt2irhwfRAVZv7GP9pbfTMlZKcfeZaUzWVoBR9G2TM3kH57Apw6Qv
         t+Mkpmyf/B10FAl5w2I+P3w2+6tj2yOHVhZQ9gGNBXHvUSBvp56FHOE0+N4hCnJFwEEI
         7F4A==
X-Gm-Message-State: AOJu0YymwlMxOyRp7tQ7jbm67OjQagGdHQO58kTDgWXhcci7Qx0M4G6R
	TLyCZKHQ1ndb/fyhaKDwuJneL/NA/gjONJ1snTtb6XyNiA3wxx28hK5fwetetx9c5oc3Jwdk1Fg
	LjSY=
X-Google-Smtp-Source: AGHT+IEwiuP76hhoS6jiTUnmlM0RhWgGzAerXqT9OvHGPPKxYJR3T319S28euVfQtzUbbgmooWxizQ==
X-Received: by 2002:a17:907:2da2:b0:a46:4bd4:df86 with SMTP id gt34-20020a1709072da200b00a464bd4df86mr3359956ejc.3.1710344114354;
        Wed, 13 Mar 2024 08:35:14 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Date: Wed, 13 Mar 2024 15:35:11 +0000
Message-Id: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libacpi is a tool that is used by libxl (for PVH guests) and hvmloader
(for HVM guests) to construct ACPI tables for guests.

Currently, libacpi only uses APIC entries to enumerate processors for
guests in the MADT.

The APIC ID field in APIC entries is an octet big, which is fine for
xAPIC IDs, but not so for sufficiently large x2APIC IDs.

This patch scans each APIC ID before constructing the MADT, and uses the
x2APIC entry for each vCPU whose APIC ID exceeds the size limit imposed
by regular APIC entries.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/libacpi/acpi2_0.h | 13 +++++++
 tools/libacpi/build.c   | 75 ++++++++++++++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 6dfa939a8c0c..10e567686fe6 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -344,6 +344,7 @@ struct acpi_20_waet {
 #define ACPI_IO_SAPIC                       0x06
 #define ACPI_PROCESSOR_LOCAL_SAPIC          0x07
 #define ACPI_PLATFORM_INTERRUPT_SOURCES     0x08
+#define ACPI_PROCESSOR_LOCAL_X2APIC         0x09
 
 /*
  * APIC Structure Definitions.
@@ -360,6 +361,18 @@ struct acpi_20_madt_lapic {
     uint32_t flags;
 };
 
+/*
+ * Processor Local x2APIC Structure Definition.
+ */
+struct acpi_20_madt_x2apic {
+    uint8_t  type;              /* Must refer to x2APIC type (0x09) */
+    uint8_t  length;            /* Must be length of x2APIC struct in bytes (0x10) */
+    uint16_t reserved;          /* Must be zero */
+    uint32_t apic_id;           /* Processor's local x2APIC ID */
+    uint32_t flags;             /* Same as Local APIC flags */
+    uint32_t acpi_processor_id; /* Refers to a processor device used to associate the X2APIC structure with */
+};
+
 /*
  * Local APIC Flags.  All other bits are reserved and must be 0.
  */
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db154..5b0fd6584b30 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -63,6 +63,27 @@ static void set_checksum(
     p[checksum_offset] = -sum;
 }
 
+static unsigned calculate_madt_size(const struct acpi_config *config)
+{
+    uint32_t apic_id;
+    unsigned i, size;
+
+    size  = sizeof(struct acpi_20_madt);
+    size += sizeof(struct acpi_20_madt_intsrcovr) * 16;
+    size += sizeof(struct acpi_20_madt_ioapic);
+
+    for ( i = 0; i < config->hvminfo->nr_vcpus; i++ )
+    {
+        apic_id = config->lapic_id(i);
+        if ( apic_id < 255 )
+            size += sizeof(struct acpi_20_madt_lapic);
+        else
+            size += sizeof(struct acpi_20_madt_x2apic);
+    }
+
+    return size;
+}
+
 static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
                                            const struct acpi_config *config,
                                            struct acpi_info *info)
@@ -70,18 +91,14 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
     struct acpi_20_madt           *madt;
     struct acpi_20_madt_intsrcovr *intsrcovr;
     struct acpi_20_madt_ioapic    *io_apic;
-    struct acpi_20_madt_lapic     *lapic;
+    void                          *apicid_entry;
     const struct hvm_info_table   *hvminfo = config->hvminfo;
-    int i, sz;
+    unsigned i, sz;
 
     if ( config->lapic_id == NULL )
         return NULL;
 
-    sz  = sizeof(struct acpi_20_madt);
-    sz += sizeof(struct acpi_20_madt_intsrcovr) * 16;
-    sz += sizeof(struct acpi_20_madt_ioapic);
-    sz += sizeof(struct acpi_20_madt_lapic) * hvminfo->nr_vcpus;
-
+    sz = calculate_madt_size(config);
     madt = ctxt->mem_ops.alloc(ctxt, sz, 16);
     if (!madt) return NULL;
 
@@ -134,27 +151,45 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
         io_apic->ioapic_id   = config->ioapic_id;
         io_apic->ioapic_addr = config->ioapic_base_address;
 
-        lapic = (struct acpi_20_madt_lapic *)(io_apic + 1);
+        apicid_entry = io_apic + 1;
     }
     else
-        lapic = (struct acpi_20_madt_lapic *)(madt + 1);
+        apicid_entry = madt + 1;
 
     info->nr_cpus = hvminfo->nr_vcpus;
-    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, lapic);
+    info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, apicid_entry);
     for ( i = 0; i < hvminfo->nr_vcpus; i++ )
     {
-        memset(lapic, 0, sizeof(*lapic));
-        lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
-        lapic->length  = sizeof(*lapic);
-        /* Processor ID must match processor-object IDs in the DSDT. */
-        lapic->acpi_processor_id = i;
-        lapic->apic_id = config->lapic_id(i);
-        lapic->flags = (test_bit(i, hvminfo->vcpu_online)
-                        ? ACPI_LOCAL_APIC_ENABLED : 0);
-        lapic++;
+        uint32_t apic_id = config->lapic_id(i);
+        if ( apic_id < 255 )
+        {
+            struct acpi_20_madt_lapic *lapic = apicid_entry;
+            memset(lapic, 0, sizeof(*lapic));
+            lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
+            lapic->length  = sizeof(*lapic);
+            /* Processor ID must match processor-object IDs in the DSDT. */
+            lapic->acpi_processor_id = i;
+            lapic->apic_id = apic_id;
+            lapic->flags = (test_bit(i, hvminfo->vcpu_online)
+                            ? ACPI_LOCAL_APIC_ENABLED : 0);
+            apicid_entry = lapic + 1;
+        }
+        else
+        {
+            struct acpi_20_madt_x2apic *x2apic = apicid_entry;
+            memset(x2apic, 0, sizeof(*x2apic));
+            x2apic->type    = ACPI_PROCESSOR_LOCAL_X2APIC;
+            x2apic->length  = sizeof(*x2apic);
+            x2apic->apic_id = apic_id;
+            x2apic->flags   = (test_bit(i, hvminfo->vcpu_online)
+                                ? ACPI_LOCAL_APIC_ENABLED : 0);
+            /* Processor ID must match processor-object IDs in the DSDT. */
+            x2apic->acpi_processor_id = i;
+            apicid_entry = x2apic + 1;
+        }
     }
 
-    madt->header.length = (unsigned char *)lapic - (unsigned char *)madt;
+    madt->header.length = (unsigned char *)apicid_entry - (unsigned char *)madt;
     set_checksum(madt, offsetof(struct acpi_header, checksum),
                  madt->header.length);
     info->madt_csum_addr =
-- 
2.34.1


