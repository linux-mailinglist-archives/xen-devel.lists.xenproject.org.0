Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC564DF66
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463629.721864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rm9-0007yU-PD; Thu, 15 Dec 2022 17:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463629.721864; Thu, 15 Dec 2022 17:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rm9-0007ux-M9; Thu, 15 Dec 2022 17:12:05 +0000
Received: by outflank-mailman (input) for mailman id 463629;
 Thu, 15 Dec 2022 17:12:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vu2t=4N=citrix.com=prvs=3415489ca=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1p5rm8-0007rI-7f
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:12:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95efed3e-7c9b-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 18:12:01 +0100 (CET)
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
X-Inumbo-ID: 95efed3e-7c9b-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671124322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QpNE7L2uaNTmHw5dmmRErah9AeqgxX3aSlOHFvQjjvM=;
  b=Y3sdtpQxYFMryRTbOWXVZvfDA8Y6IX6FPtzz9vxV9qZ1CnJpgZgte0aA
   LT9DYXNFoeWAvfsuOiZy22rroMA9h+fnuWMfhDSDiQdS+GpX4u/8zJ9Ku
   vL2/Yx5n4a65W36rEYU4vzeqZBsN144TNKtRytivTcdsREPysstYBKiiQ
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87563912
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TAL14KJBxQIuwu1sFE+Rw5UlxSXFcZb7ZxGr2PjKsXjdYENS1DJRy
 mcaDWiAPK3cZTGketolPoS/9E0PusOAzNdrTABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AVjPa0jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tJGxj8
 +ZFEwkERTaajv6xw+ikSdVV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo8keGuh3fyaXtYpUifqLAry2PS0BZwwP7mN9+9ltmiFZoIwB3J/
 ziuE2LRU0w4aPDY8Ti++yyCvdWe2iihXthDG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4qje7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwBPCGIvYzVZdjIMyP/6qZ00jUjQTepaRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcoLFPdonw/PxDKt4wIrKTKuftnU
 Xt8WZ/8ZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI5Qjh7U6SNmu9Jlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:7oB8v6F6v+YGFEsNpLqEyseALOsnbusQ8zAXPiFKOHlom6mj/a
 2TdZsguSMc5Ax/ZJhYo6HmBEDiewK/yXcW2+ks1N6ZNWHbUQ2TQr2KhrGSoAEIdReeygdr79
 YFT0EvMrbN5IBB/LzHCdODYq4dKQS8gcaVbDvlvgxQpN9RGtxdB2gQMHfjLnFL
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="87563912"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/2] acpi: Make TPM version configurable.
Date: Thu, 15 Dec 2022 17:09:33 +0000
Message-ID: <20221215170934.123889-2-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221215170934.123889-1-jennifer.herbert@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20221215170934.123889-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch makes the TPM version, for which the ACPI library probes, configurable.
If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
I have also added to hvmloader an option to allow setting this new config, which can
be triggered by setting the platform/tpm_verion xenstore key.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 docs/misc/xenstore-paths.pandoc |  8 ++++
 tools/firmware/hvmloader/util.c | 13 ++++++-
 tools/libacpi/build.c           | 68 ++++++++++++++++++---------------
 tools/libacpi/libacpi.h         |  4 +-
 4 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 5cd5c8a3b9..7270b46721 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -269,6 +269,14 @@ at the guest physical address in HVM_PARAM_VM_GENERATION_ID_ADDR.
 See Microsoft's "Virtual Machine Generation ID" specification for the
 circumstances where the generation ID needs to be changed.
 
+
+#### ~/platform/tpm_version = INTEGER [HVM,INTERNAL]
+
+The TPM version to be probed for.
+
+A value of 1 indicates to probe for TPM 1.2. If unset, or an
+invalid version, then no TPM is probed.
+
 ### Frontend device paths
 
 Paravirtual device frontends are generally specified by their own
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cf..87bc2d677f 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
         config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
 
-    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
+    config->table_flags |= (ACPI_HAS_TPM | ACPI_HAS_IOAPIC |
                             ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
                             ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
                             ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
     config->acpi_revision = 4;
 
-    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+    s = xenstore_read("platform/tpm_version", "0");
+    config->tpm_version = strtoll(s, NULL, 0);
+
+    switch( config->tpm_version )
+    {
+    case 1:
+        config->table_flags |= ACPI_HAS_TPM;
+        config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+        break;
+    }
 
     config->numa.nr_vmemranges = nr_vmemranges;
     config->numa.nr_vnodes = nr_vnodes;
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62..d313ccd8cf 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -409,38 +409,46 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
-
-    /* TPM TCPA and SSDT. */
-    if ( (config->table_flags & ACPI_HAS_TCPA) &&
-         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
-         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
+    /* TPM and SSDT. */
+    if (config->table_flags & ACPI_HAS_TPM)
     {
-        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
-        if (!ssdt) return -1;
-        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
-        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
-
-        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
-        if (!tcpa) return -1;
-        memset(tcpa, 0, sizeof(*tcpa));
-        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
-
-        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
-        tcpa->header.length    = sizeof(*tcpa);
-        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
-        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
-        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
-        tcpa->header.oem_revision = ACPI_OEM_REVISION;
-        tcpa->header.creator_id   = ACPI_CREATOR_ID;
-        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
-        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
+        switch (config->tpm_version)
         {
-            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
-            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
-            memset(lasa, 0, tcpa->laml);
-            set_checksum(tcpa,
-                         offsetof(struct acpi_header, checksum),
-                         tcpa->header.length);
+        case 1:
+            if (!config->tis_hdr ||
+                config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
+                config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff)
+                break;
+
+            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
+            if (!ssdt) return -1;
+            memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+            tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
+            if (!tcpa) return -1;
+            memset(tcpa, 0, sizeof(*tcpa));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
+
+            tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
+            tcpa->header.length    = sizeof(*tcpa);
+            tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
+            fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
+            fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
+            tcpa->header.oem_revision = ACPI_OEM_REVISION;
+            tcpa->header.creator_id   = ACPI_CREATOR_ID;
+            tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
+
+            if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
+            {
+                tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
+                tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
+                memset(lasa, 0, tcpa->laml);
+                set_checksum(tcpa,
+                             offsetof(struct acpi_header, checksum),
+                             tcpa->header.length);
+            }
+            break;
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index a2efd23b0b..9143616130 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -27,7 +27,7 @@
 #define ACPI_HAS_SSDT_PM           (1<<4)
 #define ACPI_HAS_SSDT_S3           (1<<5)
 #define ACPI_HAS_SSDT_S4           (1<<6)
-#define ACPI_HAS_TCPA              (1<<7)
+#define ACPI_HAS_TPM               (1<<7)
 #define ACPI_HAS_IOAPIC            (1<<8)
 #define ACPI_HAS_WAET              (1<<9)
 #define ACPI_HAS_PMTIMER           (1<<10)
@@ -78,8 +78,8 @@ struct acpi_config {
     struct acpi_numa numa;
     const struct hvm_info_table *hvminfo;
 
+    uint8_t tpm_version;
     const uint16_t *tis_hdr;
-
     /*
      * Address where acpi_info should be placed.
      * This must match the OperationRegion(BIOS, SystemMemory, ....)
-- 
2.31.1


