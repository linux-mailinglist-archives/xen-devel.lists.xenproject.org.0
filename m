Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7606F7192
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 19:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529861.824775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud80-0002ZV-DM; Thu, 04 May 2023 17:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529861.824775; Thu, 04 May 2023 17:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud80-0002W6-AB; Thu, 04 May 2023 17:52:28 +0000
Received: by outflank-mailman (input) for mailman id 529861;
 Thu, 04 May 2023 17:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rz6h=AZ=citrix.com=prvs=481809c50=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1pud7y-0002DN-1r
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 17:52:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c357424-eaa4-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 19:52:23 +0200 (CEST)
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
X-Inumbo-ID: 6c357424-eaa4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683222743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=klOQO+gsr7z/KUFFtFG4HRRQMfRqAfQQnRF3fO14M6U=;
  b=aGrciT4Iyq2pK/SSWBJiIddXNqz2gGnHXeGji9TGW6BhfvKSBP5Nwucf
   OySzCWHvmSSMq+hi3xlbOFtWXomidDQofRd3uvt3esu8MR5rMz5Nb0ix6
   BnwnrNDvLjPdvEKwq0qfoLB8Jr3Bnk5v4Gd62ZsDGturhtMXWz4uG6OOV
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107227938
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3MzBS6jCoJ3/JB+af6sWYyb2X161GxAKZh0ujC45NGQN5FlHY01je
 htvWWGFPfzZamXwc9FwbY63oE8P65CGzNNjSgBrpClgFHgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ/cQhVSy6codiag62Vc/tyr98oLsPkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XcTBerlObqLBx42XJxgFrzJDmMcbPe8zMTsJQ9qqdj
 jueoD6jXUBBZLRzzxKg1ViwnPSQkx/aG9o3TZe2sdwzrV2Mkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnM0/QzAwx
 0KKt9zsDD1r9raSTBqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpjWWdo5GLrGTtPG2Bh/J0
 S6jtyM8jbpG2KbnyJ6HEUD7byOE/8aZFVZsvFWIAQpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJxslcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIoVO8QpLVffo3AzDaJ1410BbWB2yf1vU
 XtlWZ/E4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa3GI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/qNdLfQxWdCVqXPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:nNu1qK+EDAiDNGvraoZuk+AQI+orL9Y04lQ7vn2ZKCYlD/Bw8v
 rEoB1173HJYVoqNU3I2urhBED4ewK7yXct2/hpAV7AZmjbUQmTXftfBOLZqlWLJ8SZzJ8n6U
 4KScdD4bPLYWSSwvyKgzWQIpIMzNyG76yylY7lvhJQpWYDUdAZ0+7VMHf+LqQzfnggObMpUJ
 6R/NBOqTaDdWR/VLXYOkU4
X-Talos-CUID: 9a23:kkGBPm/Zf6fBDyKU6VmVv2lNIpgATGL79luTPGGBG3hAU7aXQ1DFrQ==
X-Talos-MUID: 9a23:4n35UQrnAxRonG6SXn4ezxRFHtty+PugNGFOybBfkcfDF3VdOyjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107227938"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH v4 2/2] acpi: Add TPM2 interface definition.
Date: Thu, 4 May 2023 17:51:46 +0000
Message-ID: <20230504175146.208936-3-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230504175146.208936-1-jennifer.herbert@citrix.com>
References: <20230504175146.208936-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch introduces an optional TPM 2 interface definition to the ACPI table,
which is to be used as part of a vTPM 2 implementation.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>

v4:
* Convert copyright header to SPDX
* Continuation from patch 1 change of xenstore tpm_version field checking.
* Minor code style fixes.
v3:
* Renamed TPM_CRB constants to better match the TPM specification.
* Moved some ACPI register locations to acpi2_0.h to such that both
  TPM register offsets are defined together, with clearer relation.
* Added additional comments to explain new constants.
* Minor code style fixes.
v2:
* Patch split into two.
* Move TPM log to 0xFED50000
* Minor code style fixes.
---
 docs/misc/xenstore-paths.pandoc |  3 ++-
 tools/firmware/hvmloader/util.c | 10 +++++++++
 tools/libacpi/Makefile          |  3 ++-
 tools/libacpi/acpi2_0.h         | 33 +++++++++++++++++++++++++++
 tools/libacpi/build.c           | 40 +++++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h         |  1 +
 tools/libacpi/ssdt_tpm2.asl     | 27 ++++++++++++++++++++++
 7 files changed, 115 insertions(+), 2 deletions(-)
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
index 1b733a3091..b573a9c3cd 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -1013,6 +1013,16 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
             config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
             config->tpm_version = 1;
             break;
+
+        case 2:
+            config->table_flags |= ACPI_HAS_TPM;
+            config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
+
+            mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT,
+                                  TPM_LOG_SIZE >> PAGE_SHIFT);
+            memset((void *)TPM_LOG_AREA_ADDRESS, 0, TPM_LOG_SIZE);
+            config->tpm_version = 2;
+            break;
         }
     }
 
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
index 2619ba32db..3503eb3cfa 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,37 @@ struct acpi_20_tcpa {
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
+/*
+ * TPM register I/O Mapped region, location of which defined in the
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
@@ -431,6 +462,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_SIGNATURE ASCII32('R','S','D','T')
 #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','D','T')
 #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
@@ -444,6 +476,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_REVISION 0x01
 #define ACPI_2_0_XSDT_REVISION 0x01
 #define ACPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index bb0d0557d4..401113503c 100644
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
@@ -350,6 +351,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_hpet *hpet;
     struct acpi_20_waet *waet;
     struct acpi_20_tcpa *tcpa;
+    struct acpi_20_tpm2 *tpm2;
     unsigned char *ssdt;
     void *lasa;
 
@@ -449,6 +451,44 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
                              tcpa->header.length);
             }
             break;
+
+        case 2:
+            /*
+             * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
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
index 0000000000..3df9d70556
--- /dev/null
+++ b/tools/libacpi/ssdt_tpm2.asl
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
+/*
+ * ssdt_tpm2.asl
+ *
+ * Copyright (c) 2018-2022, Citrix Systems, Inc.
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


