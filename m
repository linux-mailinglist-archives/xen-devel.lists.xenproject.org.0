Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1D6EE719
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526270.817917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlp-0004DB-Eu; Tue, 25 Apr 2023 17:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526270.817917; Tue, 25 Apr 2023 17:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlp-0004BT-Bw; Tue, 25 Apr 2023 17:48:05 +0000
Received: by outflank-mailman (input) for mailman id 526270;
 Tue, 25 Apr 2023 17:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnGU=AQ=citrix.com=prvs=4724fc120=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1prMlo-0004BN-5n
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:48:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511b254e-e391-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 19:48:01 +0200 (CEST)
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
X-Inumbo-ID: 511b254e-e391-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682444881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rAcd38lHfyxjyo5VODfhs5oaQerCPZKZ+8xu0A03MtA=;
  b=htfzPCyROck2+J4gqUtnSgU+rgFJmXaJ5fttxrFBHkx2cemxrgOON64T
   kxX7Lt5zzKwvNmIjOYJflDQ4mKwJzxMM6zxkpDWINCXbVKEXRJwbqKc7s
   FxNzZN3Sa9RYMol5BA7SwUTQDkKgtyrAXz5Q9TG3hZ9PUoOT0WrWiiiwr
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106160674
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FMuS3KCjaBGeqhVW/yfjw5YqxClBgxIJ4kV8jS/XYbTApDIkhTQHx
 2BJWj3TMv3fM2P8etF+aojgpBwOvJKBndJlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9C4wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8+lNP0dC6
 eQjNBtQTRTborO4y4iFY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJAzmuGpiHTlNT1VsliYv7Yf6GnP1g1hlrPqNbI5f/TTHZsMwB7G+
 T6uE2LRDxZFNoOV9Qe++GPy2/XJmWDHZb4YG+jtnhJtqALKnTFCYPEMbnO5rP+/i0CzQZRfJ
 lYe9zAyhaMz6Fa7CNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tphvAdOhFHLKttcHeRBL0m
 xXboiMEuZxG2KbnyJ6HEUD7byOE/8aZFFVku12KDgpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJxslcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIoUOcYoLl/Won0/DaJ144wKuBlErE3CE
 c3DLZbE4YgyUsyLMwZat89CiOR2l0jSNEvYRIzhzgTP7IdykEW9EO9fWHPXN7BR0U9xiFmNm
 zqpH5fQmko3vSyXSnW/zLP/2nhRfCRqXsCm+50OHgNBSyI/cFwc5zbq6etJU+RYc259zY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:H0ew0awlmu5nMriXeLKOKrPwE71zdoMgy1knxilNoNJuA7Wlfq
 GV7YwmPHrP4gr5N0tQ/OxoVJPwI080sKQFgrX5Xo3CYOCFghrNEGgK1+KLqAEIWRefygc379
 YGT0ERMqyXMbG4t6rHCcuDfurIDOPpzElgv4nj80s=
X-Talos-CUID: 9a23:al8FO2+pWIopg9AaYPCVv0cbIP4DfmHF92v7fmy8UUM4Rravd3bFrQ==
X-Talos-MUID: 9a23:UB2oWglFB6sviIPeLERFdnpvM5hqvK6SNXsHgMtboc+AdhBNBz2S2WE=
X-IronPort-AV: E=Sophos;i="5.99,226,1677560400"; 
   d="scan'208";a="106160674"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrx.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jennifer Herbert <jennifer.herbert@citrix.com>
Subject: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
Date: Tue, 25 Apr 2023 17:47:33 +0000
Message-ID: <20230425174733.795961-3-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230425174733.795961-1-jennifer.herbert@citrix.com>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch introduces an optional TPM 2 interface definition to the ACPI table,
which is to be used as part of a vTPM 2 implementation.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 docs/misc/xenstore-paths.pandoc |  3 ++-
 tools/firmware/hvmloader/util.c |  9 ++++++++
 tools/libacpi/Makefile          |  3 ++-
 tools/libacpi/acpi2_0.h         | 32 +++++++++++++++++++++++++++
 tools/libacpi/build.c           | 39 +++++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h         |  1 +
 tools/libacpi/ssdt_tpm2.asl     | 36 ++++++++++++++++++++++++++++++
 7 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index e67e164855..bffb8ea544 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -274,7 +274,8 @@ circumstances where the generation ID needs to be changed.
 
 The TPM version to be probed for.
 
-A value of 1 indicates to probe for TPM 1.2.
+A value of 1 indicates to probe for TPM 1.2, whereas a value of 2
+indicates that a TPM 2.0 using CRB should be probed.
 A value of 0 or an invalid value will result in no TPM being probed.
 If unset, a default of 1 is assumed.
 
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index f39a8e584f..51272530fe 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -1009,6 +1009,15 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->table_flags |= ACPI_HAS_TPM;
         config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
         break;
+
+    case 2:
+        config->table_flags |= ACPI_HAS_TPM;
+        config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
+
+        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT,
+                              TPM_LOG_SIZE >> PAGE_SHIFT);
+        memset((void *)TPM_LOG_AREA_ADDRESS, 0, TPM_LOG_SIZE);
+        break;
     }
 
     config->numa.nr_vmemranges = nr_vmemranges;
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index 60860eaa00..23278f6a61 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -25,7 +25,8 @@ C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
-H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_laptop_slate.h)
+H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h)
+H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
 
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 2619ba32db..19a43d4b2e 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,36 @@ struct acpi_20_tcpa {
 };
 #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
 
+/*
+ * TPM2
+ */
+struct acpi_20_tpm2 {
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
+/* TPM register I/O Mapped region, location of which defined in the
+ * TCG PC Client Platform TPM Profile Specification for TPM 2.0.
+ * See table 9 - Only Locality 0 is used here. This is emulated by QEMU.
+ * Definition of Register space is found in table 12.
+ */
+#define TPM_REGISTER_BASE           0xFED40000
+#define TPM_CRB_CTRL_REQ            (TPM_REGISTER_BASE  + 0x40)
+#define TPM_CRB_INTF_ID             (TPM_REGISTER_BASE  + 0x30)
+
+#define TPM_LOG_AREA_ADDRESS        0xFED50000
+
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
+#define TPM_LOG_SIZE                (64 << 10)
+
 /*
  * Fixed ACPI Description Table Structure (FADT) in ACPI 1.0.
  */
@@ -431,6 +461,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_SIGNATURE ASCII32('R','S','D','T')
 #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','D','T')
 #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
@@ -444,6 +475,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_REVISION 0x01
 #define ACPI_2_0_XSDT_REVISION 0x01
 #define ACPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 716cb49624..359a4dbba4 100644
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
@@ -352,6 +353,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_tcpa *tcpa;
     unsigned char *ssdt;
     void *lasa;
+    struct acpi_20_tpm2 *tpm2;
 
     /* MADT. */
     if ( (config->hvminfo->nr_vcpus > 1) || config->hvminfo->apic_mode )
@@ -450,6 +452,43 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
                              tcpa->header.length);
             }
             break;
+
+        case 2:
+            /* Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
+             * identifier register.  See table 16 of TCG PC client platform
+             * TPM profile specification for TPM 2.0.
+             */
+            if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
+                break;
+
+            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
+            if (!ssdt) return -1;
+            memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+            tpm2 = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tpm2), 16);
+            if (!tpm2) return -1;
+            memset(tpm2, 0, sizeof(*tpm2));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tpm2);
+
+            tpm2->header.signature = ACPI_2_0_TPM2_SIGNATURE;
+            tpm2->header.length    = sizeof(*tpm2);
+            tpm2->header.revision  = ACPI_2_0_TPM2_REVISION;
+            fixed_strcpy(tpm2->header.oem_id, ACPI_OEM_ID);
+            fixed_strcpy(tpm2->header.oem_table_id, ACPI_OEM_TABLE_ID);
+            tpm2->header.oem_revision = ACPI_OEM_REVISION;
+            tpm2->header.creator_id   = ACPI_CREATOR_ID;
+            tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
+            tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
+            tpm2->control_area_address = TPM_CRB_CTRL_REQ;
+            tpm2->start_method = TPM2_START_METHOD_CRB;
+            tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
+            tpm2->log_area_start_address = TPM_LOG_AREA_ADDRESS;
+
+            set_checksum(tpm2,
+                         offsetof(struct acpi_header, checksum),
+                         tpm2->header.length);
+            break;
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index f69452401f..0d19f9fc4d 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -80,6 +80,7 @@ struct acpi_config {
     const struct hvm_info_table *hvminfo;
 
     const uint16_t *tis_hdr;
+    const uint16_t *crb_id;
 
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
2.39.1


