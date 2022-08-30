Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE35A6E77
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 22:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395141.634722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT7s2-0007uy-SI; Tue, 30 Aug 2022 20:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395141.634722; Tue, 30 Aug 2022 20:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT7s2-0007r1-NY; Tue, 30 Aug 2022 20:30:02 +0000
Received: by outflank-mailman (input) for mailman id 395141;
 Tue, 30 Aug 2022 20:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ0Y=ZC=citrix.com=prvs=2341253af=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1oT7s1-0007h0-CI
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 20:30:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82919616-28a2-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 22:29:57 +0200 (CEST)
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
X-Inumbo-ID: 82919616-28a2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661891398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5mkYBNGwh4mzf4E6YEfHyfXXu/ajh+l9evBUsjWx1kA=;
  b=JkZE+3U+K3gEwVx80DrzD3m8gm4khzLjLYJ1isGYHs3H5b/t5tnkqbnu
   i6hno4ScH4hDioEi3JtrANw7LfQS1qU/LSaWjDiNmrw4/clcFSx/4UPx4
   ERmAhzzEV0QkjKfuNIaZynBzBzFhXFwwya92qLd//DU6nKmsZswgu581z
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79131407
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VHt3xq8kHnQzbsKOW/x2DrUD7H6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GZNUWHUOa2OMGT9KNwkaoWy/BxVuZeHm4NrHAM4pX08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM05Kyp0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGK2Q8PooK1uJLAEJL5
 98AGBkPNRCHmLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoYRBJPFYZBYh4nOqyjHTlbxVTqU6PpLpx6G/WpOB0+Oe8aYGMJoTVLSlTtnnAj
 2fvrlzUOVZACoy9ijW460ihm+CayEsXX6pNTeblp5aGmma71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy10ZKerjSgFSwpLEwHdwwcfSIHuNnnv9Rm5v7QdeqPAJJZn/WsR2+pk
 2zQ9ndv71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7falUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPusYDbCf0NPMvONvZ5yEWIU/ITI2NaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuYLHMwhkmgs/s7inkEn8uVdfDVbJIYo43KymN7pks/vb/1qFq
 L6y9aKikn1ibQE3WQGPmaZ7ELzABSJT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:60k4pKvMZHeh9hae/qf1iCyd7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHvJYVcqKRcdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.93,276,1654574400"; 
   d="scan'208";a="79131407"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <wl@xen.org>,
	<roger.pau@citrix.com>, <ian.jackson@eu.citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH] acpi: Add TPM2 interface definition and make the TPM version configurable.
Date: Tue, 30 Aug 2022 20:27:06 +0000
Message-ID: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch introduces an optional TPM 2 interface definition to the ACPI table,
which is to be used as part of a vTPM 2 implementation.
To enable the new interface - I have made the TPM interface version
configurable in the acpi_config, with the default being the existing 1.2.(TCPA)
I have also added to hvmloader an option to utilise this new config, which can
be triggered by setting the platform/tpm_verion xenstore key.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 tools/firmware/hvmloader/config.h |   1 +
 tools/firmware/hvmloader/util.c   |  15 +++-
 tools/libacpi/Makefile            |   2 +-
 tools/libacpi/acpi2_0.h           |  24 +++++++
 tools/libacpi/build.c             | 111 ++++++++++++++++++++++--------
 tools/libacpi/libacpi.h           |   4 +-
 tools/libacpi/ssdt_tpm2.asl       |  36 ++++++++++
 7 files changed, 159 insertions(+), 34 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc5..4dec7195f0 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -56,6 +56,7 @@ extern uint8_t ioapic_version;
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
+#define ACPI_CRB_HDR_ADDRESS 0xFED40034UL
 
 extern uint32_t pci_mem_start;
 extern const uint32_t pci_mem_end;
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cf..e3af32581b 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -994,13 +994,24 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
         config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
 
-    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
+    config->table_flags |= (ACPI_HAS_TPM | ACPI_HAS_IOAPIC |
                             ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
                             ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
                             ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
     config->acpi_revision = 4;
 
-    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+    if ( !strncmp(xenstore_read("platform/tpm_version", "0"), "2", 1)  ) {
+
+        config->tpm_version = 2;
+        config->crb_hdr = (uint16_t *)ACPI_CRB_HDR_ADDRESS;
+        config->tis_hdr = NULL;
+    }
+    else
+    {
+        config->tpm_version = 1;
+        config->crb_hdr = NULL;
+        config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+    }
 
     config->numa.nr_vmemranges = nr_vmemranges;
     config->numa.nr_vnodes = nr_vnodes;
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index 60860eaa00..125f29fb54 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -25,7 +25,7 @@ C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
-H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_laptop_slate.h)
+H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
 
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 2619ba32db..5754daa985 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,28 @@ struct acpi_20_tcpa {
 };
 #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
 
+/*
+ * TPM2
+ */
+struct Acpi20TPM2 {
+    struct acpi_header header;
+    uint16_t platform_class;
+    uint16_t reserved;
+    uint64_t control_area_address;
+    uint32_t start_method;
+    uint8_t start_method_params[12];
+    uint32_t log_area_minimum_length;
+    uint64_t log_area_start_address;
+};
+#define TPM2_ACPI_CLASS_CLIENT      0
+#define TPM2_START_METHOD_CRB       7
+
+#define TPM_CRB_ADDR_BASE           0xFED40000
+#define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + 0x40)
+
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
+#define TPM_LOG_SIZE                (64 << 10)
+
 /*
  * Fixed ACPI Description Table Structure (FADT) in ACPI 1.0.
  */
@@ -431,6 +453,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_SIGNATURE ASCII32('R','S','D','T')
 #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','D','T')
 #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
@@ -444,6 +467,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_REVISION 0x01
 #define ACPI_2_0_XSDT_REVISION 0x01
 #define ACPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62..478cbec5dd 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -19,6 +19,7 @@
 #include "ssdt_s3.h"
 #include "ssdt_s4.h"
 #include "ssdt_tpm.h"
+#include "ssdt_tpm2.h"
 #include "ssdt_pm.h"
 #include "ssdt_laptop_slate.h"
 #include <xen/hvm/hvm_info_table.h>
@@ -352,6 +353,8 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_tcpa *tcpa;
     unsigned char *ssdt;
     void *lasa;
+    struct Acpi20TPM2 *tpm2;
+    void *log;
 
     /* MADT. */
     if ( (config->hvminfo->nr_vcpus > 1) || config->hvminfo->apic_mode )
@@ -409,38 +412,86 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
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
+        if (config-> tpm_version == 2)
+        {
+            if ( (config->crb_hdr) &&
+                   (config->crb_hdr[0] != 0 && config->crb_hdr[0] != 0xffff))
+            {
+                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
+                if (!ssdt) return -1;
+                memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+                table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+                tpm2 = ctxt->mem_ops.alloc(ctxt, sizeof(struct Acpi20TPM2), 16);
+                if (!tpm2) return -1;
+                memset(tpm2, 0, sizeof(*tpm2));
+                table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tpm2);
+
+                tpm2->header.signature = ACPI_2_0_TPM2_SIGNATURE;
+                tpm2->header.length    = sizeof(*tpm2);
+                tpm2->header.revision  = ACPI_2_0_TPM2_REVISION;
+                fixed_strcpy(tpm2->header.oem_id, ACPI_OEM_ID);
+                fixed_strcpy(tpm2->header.oem_table_id, ACPI_OEM_TABLE_ID);
+                tpm2->header.oem_revision = ACPI_OEM_REVISION;
+                tpm2->header.creator_id   = ACPI_CREATOR_ID;
+                tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
+                tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
+                tpm2->control_area_address = TPM_CRB_ADDR_CTRL;
+                tpm2->start_method = TPM2_START_METHOD_CRB;
+                tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
+
+                log = ctxt->mem_ops.alloc(ctxt, TPM_LOG_SIZE, 4096);
+                if (!log) return -1;
+
+                memset(log, 0, TPM_LOG_SIZE);
+                tpm2->log_area_start_address = ctxt->mem_ops.v2p(ctxt, log);
+
+                set_checksum(tpm2,
+                             offsetof(struct acpi_header, checksum),
+                             tpm2->header.length);
+            }
+            else if (!config->crb_hdr)
+                printf("Error: TPM2 configuration requires CRB header!\n");
+        }
+        else
         {
-            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
-            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
-            memset(lasa, 0, tcpa->laml);
-            set_checksum(tcpa,
-                         offsetof(struct acpi_header, checksum),
-                         tcpa->header.length);
+            if ((config->tis_hdr) &&
+                (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
+                (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff))
+            {
+                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
+                if (!ssdt) return -1;
+                memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
+                table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+                tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
+                if (!tcpa) return -1;
+                memset(tcpa, 0, sizeof(*tcpa));
+                table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
+
+                tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
+                tcpa->header.length    = sizeof(*tcpa);
+                tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
+                fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
+                fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
+                tcpa->header.oem_revision = ACPI_OEM_REVISION;
+                tcpa->header.creator_id   = ACPI_CREATOR_ID;
+                tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
+
+                if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
+                {
+                    tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
+                    tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
+                    memset(lasa, 0, tcpa->laml);
+                    set_checksum(tcpa,
+                                 offsetof(struct acpi_header, checksum),
+                                 tcpa->header.length);
+                }
+            } else if (!config->tis_hdr)
+                printf("Error: TPM1.x requires TIS Header!\n");
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index a2efd23b0b..af8925a9ec 100644
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
@@ -78,7 +78,9 @@ struct acpi_config {
     struct acpi_numa numa;
     const struct hvm_info_table *hvminfo;
 
+    uint8_t tpm_version;
     const uint16_t *tis_hdr;
+    const uint16_t *crb_hdr;
 
     /*
      * Address where acpi_info should be placed.
diff --git a/tools/libacpi/ssdt_tpm2.asl b/tools/libacpi/ssdt_tpm2.asl
new file mode 100644
index 0000000000..1801c338df
--- /dev/null
+++ b/tools/libacpi/ssdt_tpm2.asl
@@ -0,0 +1,36 @@
+/*
+ * ssdt_tpm2.asl
+ *
+ * Copyright (c) 2018-2022, Citrix Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+/* SSDT for TPM CRB Interface for Xen with Qemu device model. */
+
+DefinitionBlock ("SSDT_TPM2.aml", "SSDT", 2, "Xen", "HVM", 0)
+{
+    Device (TPM)
+    {
+        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+        {
+            Memory32Fixed (ReadWrite,
+                0xFED40000,         // Address Base
+                0x00001000,         // Address Length
+                )
+        })
+        Method (_STA, 0, NotSerialized)  // _STA: Status
+        {
+            Return (0x0F)
+        }
+    }
+}
-- 
2.31.1


