Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B45BA1ED
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 22:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407667.650239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYvfd-0005Yc-Dy; Thu, 15 Sep 2022 20:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407667.650239; Thu, 15 Sep 2022 20:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYvfd-0005Wo-As; Thu, 15 Sep 2022 20:41:13 +0000
Received: by outflank-mailman (input) for mailman id 407667;
 Thu, 15 Sep 2022 20:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaRG=ZS=citrix.com=prvs=250bec243=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1oYvfb-0005Wf-BT
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 20:41:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7c5d34b-3536-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 22:41:06 +0200 (CEST)
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
X-Inumbo-ID: b7c5d34b-3536-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663274466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iz134rqvwTvscS9CWxWtMb5PUbEKwnQkr/UCyWzFbGs=;
  b=beL7eLi1tIKmevNffmM2N5izb2P4SqCAFc370KXtCmjYYrwiYGxWU0eo
   +aVK8sXFhrII2xM5lCMIEqTEcPv4FDiVvaDDVVXYMVEUsBn0ewlXHmWvg
   cu4Vkh0Efg2wSH9PSY0b+TlibcjWkRVwkK/xDHYs8bvQHga4ByYINsq6C
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80632883
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AiasIg6y0w7c0oQPSk9N6t4n5zX0kqDA+Zkaqj?=
 =?us-ascii?q?vbM1gqbGSHpmQ7xaDEIGIziBwNmucJAR/E2mJKvnGiAAZiZk99MhMhh73mcn?=
 =?us-ascii?q?WFVNoP4hOpavdvxnnHGDB491RpDLt7iN+uwk4PNgtsu2SY2fjU706yP8RupN?=
 =?us-ascii?q?kF9VCgKMwBHr26FI97Z0QBCq9Lgk3bMzowxRC7BN+rfafEB5OidDcWht4TnH?=
 =?us-ascii?q?ZtYKZ6cRP2qSZ6jkqSmGTrKtZTzIMIn+Pg/fVZ705tS/k5BlFzesmScCTHvd?=
 =?us-ascii?q?C44kvaCynE/GaE9nWRC+kwUvAbBWExkoGQrDuy2ybcOtQQaU9lWZ72Jfrjih?=
 =?us-ascii?q?CMOChgfk6cJ8lxnLClKiTtkvSd6C1BsjXhDiwxsHlv057a0dd3SBZZ1bDek2?=
 =?us-ascii?q?fIWuz5ReqaT6kGi3E7HFDc9JaC9LQSQ3rGoy2VKJpXr1DIsSxEh4v7JaIpvP?=
 =?us-ascii?q?EhuiJwwtSf0xCM+cGMtLs1a7L67aIur3npssz8TeicsaQdmpkQpS19JmFJGa?=
 =?us-ascii?q?n0geYnS1c+A+xAbjAYiHKvyV3yfeor4Cg2cEelrLMp6d5d8P+3MleK75iUAj?=
 =?us-ascii?q?oDlL+9bIjot1zrst0IzZQjyXJLosXfzvhhK22OUBwNY/Uck3WRAka0NXrCZm?=
 =?us-ascii?q?xcuHp60jnCSuwI/r7CcNEW54c/tmt3ksqvJylnCcpw0h/anIRVlSXDRKzEzH?=
 =?us-ascii?q?J7/FnEOEE+8D4gLO/KeLF05OWpVwpITdT0MKxoO3hKS1bgC1Ns8lTUtl8pY3?=
 =?us-ascii?q?Ku3Cw/qNIU2QBn8/azqANPi/hf9G7ooygN3ftxO92vAOfMFo29kqUmDOekp+?=
 =?us-ascii?q?n1wllQSb1BVnDysgnufKbDLSqlPe9J0CoJMd84S8BE5S4uReSdA42rhBlaBT?=
 =?us-ascii?q?tS9NOEY5yrNdvwnb+i+nc7lPOC0vcT/uEW7NeLchcSedgotQzBQhphD3nRZW?=
 =?us-ascii?q?2SqzJzyAnPz4Ws+wm5HXyOhbsJSF5ooIvW5sQlnRWvwRPibJYbVyuAo+EgDI?=
 =?us-ascii?q?GMlvbh4YWGgOHqW225oG6KdqlBkKBJyieQ6PIjgmU947rmYkod048sOWyLTE?=
 =?us-ascii?q?kcmHEKw8sw8jYsItxIwLr13TjoLFoT0Yzd2BPo42P96rpGSEgT3wS2M9fC+/?=
 =?us-ascii?q?PXfEgiNWJu30YX98Op19vm6RIIAFyyFz8iMjA1iLCvfr+OHamow6TL+YTvpZ?=
 =?us-ascii?q?PXKbFfuJ5Pgu+83w22+6edTESTsOvDan61n5InVp5TQNzeVzBcD6m6Ketu/L?=
 =?us-ascii?q?dDj6eORp5IdAFl08o6zZwYysTouTc5IE5s+agDMkDoJkWstHmxepSpBkC1g1?=
 =?us-ascii?q?nLgbG48LhcDJFVP3GURpjFHM5NFT89PKqz7/6nMuebqPbEHfhAbXCnAQ62qc?=
 =?us-ascii?q?giaXb4+Z6tupamUwZHX3P1d1JT+k4fV9tki2hKN2NEOTPnQejTm6j48QsrEB?=
 =?us-ascii?q?kqG6tZNAVMhGmttySgFJ+ThM61nDZ1r0pkdSuyoV3z5YUYPN7PTnu5zdQ4QI?=
 =?us-ascii?q?XpVr8w6iYLXNl4YydffsXwJTzgCbVTgYZcH2EES5bzU9k7NHYZ15lOK8Y/dq?=
 =?us-ascii?q?bcyqeztItaxOpgTTZUWbeOykwZiUE6GAhiJOMNtE4HERwkmSQdAsh071qV3R?=
 =?us-ascii?q?NMzItsNq56L3t17zbF9j9aLrZexgYTY4y4jllL8giqCHGUmIIstcocC6+uTF?=
 =?us-ascii?q?T/zXXXlYxtpIXTfdQKdpL8+PYZjtUGdchbVYKypRGVzMAbJSvD1RLnkOOKv7?=
 =?us-ascii?q?+ATVslPx0NYY/I7tTJTVnrQfjpku7xgB9rRoK30WJhSf9rt9gEwzxjS4aPM7?=
 =?us-ascii?q?IANBz9y5cvWQEE9Qo1hW7mh9Mp03jftNOnyS6tlYhVhWTJktawEmoN62i5pc?=
 =?us-ascii?q?x7CKYREIBLH4HAb+TZwy1HibsK605GeeSTc9E7mYsaCdHcjKOpEdsSPqheMF?=
 =?us-ascii?q?qKeDfodUygTeMbfYptWGEvEBtm7nkXJsfBQNYDZgLXF7kdxkgsdCzm/C9kJ9?=
 =?us-ascii?q?oPS1OSvwfxBJIrZvPqIpmQcfuIvfbY+VQZ/ohMI+j7SIopNMZgT/iXYKlUHG?=
 =?us-ascii?q?EwWjFcquE8LGk/o9xJPpFv04f08U5zqTIWQVQjGsLE8ZWLJemaXlxJc+mw2d?=
 =?us-ascii?q?Aq/MYR8SO1G5ryafIdH0wZw8+2jXdQ57obhYqCIjPHbXARJMgXbNTysYAzZH?=
 =?us-ascii?q?zhg7Zrc+rohV7B7oaGp6fy3IbZfgczF1VKm3jDAp3i6LSYgV7vWnSJ55R6s6?=
 =?us-ascii?q?AbNorHwm3Ccna7fMt5TljK5j/I8fz0NXfq2AeFYm5x8seGXYlsMhEco1jsuI?=
 =?us-ascii?q?IOJCxa5wspbmSafxb8gUj05UVi33rndHvW9lLWvxhpEMABIhnrzZ54IHeWW1?=
 =?us-ascii?q?ip78krIVcsGxgDCJmofD5EkMJQptaqmg2AOH9lJUOczQlh0iaSLnrTeh2Xvr?=
 =?us-ascii?q?T8xJReuRY2pIiipZL75iDGUKIXajICYHsVTW93jr45BdNDiD55uVeTi+t2Zm?=
 =?us-ascii?q?28u66FIdZWQYjD3pktuKXePNomvoeFYjMz8qeKv4dFqa7tSf+SRykCrzbJlC?=
 =?us-ascii?q?HvVxPkomZnjoo83Hzj8FW0lnFzmPZJeaXgNIW0dZYc9DRblv3VoWVv8s15VB?=
 =?us-ascii?q?UfmjBJLJiq+ldijhdRS4YN5WH1urkOr9OlVaMRip4cFdlefV+xd95I3Hoaet?=
 =?us-ascii?q?XQ3NECbmLXJwXcpW7ZWEE9WtYCM4OAerV/v2ZfhULH8RRm96jIAddO2tnN8f?=
 =?us-ascii?q?iPGPpH/cVfKe40ngGtoutOD+UJn?=
X-IronPort-AV: E=Sophos;i="5.93,319,1654574400"; 
   d="scan'208";a="80632883"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <wl@xen.org>,
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH 2/2] acpi: Add TPM2 interface definition.
Date: Thu, 15 Sep 2022 20:40:29 +0000
Message-ID: <20220915204029.1227112-2-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220915204029.1227112-1-jennifer.herbert@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20220915204029.1227112-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch introduces an optional TPM 2 interface definition to the ACPI table,
which is to be used as part of a vTPM 2 implementation.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 tools/firmware/hvmloader/config.h |  1 +
 tools/firmware/hvmloader/util.c   |  7 ++++++
 tools/libacpi/Makefile            |  2 +-
 tools/libacpi/acpi2_0.h           | 26 ++++++++++++++++++++++
 tools/libacpi/build.c             | 35 ++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h           |  1 +
 tools/libacpi/ssdt_tpm2.asl       | 36 +++++++++++++++++++++++++++++++
 7 files changed, 107 insertions(+), 1 deletion(-)
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
index 87bc2d677f..6e5d3609b9 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -1009,6 +1009,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->table_flags |= ACPI_HAS_TPM;
         config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
         break;
+    case 2:
+        config->table_flags |= ACPI_HAS_TPM;
+        config->crb_hdr = (uint16_t *)ACPI_CRB_HDR_ADDRESS;
+
+        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT, TPM_LOG_SIZE >> PAGE_SHIFT);
+        memset((void *)(TPM_LOG_AREA_ADDRESS), 0, TPM_LOG_SIZE);
+        break;
     }
 
     config->numa.nr_vmemranges = nr_vmemranges;
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
index 2619ba32db..f4eb4d715b 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,30 @@ struct acpi_20_tcpa {
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
+#define TPM_CRB_ADDR_BASE           0xFED40000
+#define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + 0x40)
+
+#define TPM_LOG_AREA_ADDRESS        0xFED50000
+
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
+#define TPM_LOG_SIZE                (64 << 10)
+
 /*
  * Fixed ACPI Description Table Structure (FADT) in ACPI 1.0.
  */
@@ -431,6 +455,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_SIGNATURE ASCII32('R','S','D','T')
 #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','D','T')
 #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
@@ -444,6 +469,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_REVISION 0x01
 #define ACPI_2_0_XSDT_REVISION 0x01
 #define ACPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index d313ccd8cf..d4f25a68d2 100644
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
@@ -449,6 +451,39 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
                              tcpa->header.length);
             }
             break;
+
+        case 2:
+            if (!config->crb_hdr ||
+                config->crb_hdr[0] == 0 || config->crb_hdr[0] == 0xffff)
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
+            tpm2->control_area_address = TPM_CRB_ADDR_CTRL;
+            tpm2->start_method = TPM2_START_METHOD_CRB;
+            tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
+            tpm2->log_area_start_address = TPM_LOG_AREA_ADDRESS;
+
+            set_checksum(tpm2,
+                         offsetof(struct acpi_header, checksum),
+                         tpm2->header.length);
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index 9143616130..b5d08ff09b 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -80,6 +80,7 @@ struct acpi_config {
 
     uint8_t tpm_version;
     const uint16_t *tis_hdr;
+    const uint16_t *crb_hdr;
     /*
      * Address where acpi_info should be placed.
      * This must match the OperationRegion(BIOS, SystemMemory, ....)
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


