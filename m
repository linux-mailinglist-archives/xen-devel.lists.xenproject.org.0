Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1E6EE71A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 19:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526272.817932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlu-0004ad-2v; Tue, 25 Apr 2023 17:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526272.817932; Tue, 25 Apr 2023 17:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prMlt-0004Va-Vn; Tue, 25 Apr 2023 17:48:09 +0000
Received: by outflank-mailman (input) for mailman id 526272;
 Tue, 25 Apr 2023 17:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnGU=AQ=citrix.com=prvs=4724fc120=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1prMls-0004QK-PX
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 17:48:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 565722ed-e391-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 19:48:07 +0200 (CEST)
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
X-Inumbo-ID: 565722ed-e391-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682444887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iJpmjT8+u6Su+cj0ubRBWk9TtvgNO4TNYN5OVbKekIY=;
  b=CDb6I9NCCHFbW6lkynZmkTbzed73zFGUKijFKsophjiBr5lkMbT6fLmW
   GTnkdFdRHhWNXAWybF1KMg6rixG+CrxpiRTTTfx7Nz/i8Tmurx/Nc76ae
   tvyZq8dEtL70sk/jAPvdtRGDgzEa4fPXxEjSrQoSRbszqj0rcXb7/gO3N
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107228331
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:s8ZtY6M134e3B4DvrR2sl8FynXyQoLVcMsEvi/4bfWQNrUoi0DxWy
 mIdWmHTMvbfN2v8eYp1bt6+8kgCscTRzdBgHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5AFmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sFWCntWq
 KNBERkuMzKG3sKK4pGyUfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo8keGuh3fyaXtYpUifqLAry2PS0BZwwP7mN9+9ltmiHJ0KxBzI/
 Tmfl4j/KgMiPYS1mR+ly3mphtfzxwPHCbojLLLto5aGh3XMnzdOWXX6T2CTo/S/jE+wVsgZK
 0EO8Cc0sYA59VCxXp/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf1y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDrob915CPPq1+TcOmzSx
 mmqkAodjq4M2JtjO7qAwbzXv969jsGXHlRut1iPAzLNAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxeEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QeOMMvLVXXrX8yNCZ8OlwBd2B9+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacidilnVMum+5wGL4Zu4GNOQQkcNhMY+pt5E6QNokifvr6Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:9cToN6rVnreKx2BQs2LYTuoaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrCMc6QxhI03I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdWSS5vyb3ODXKbgdKaG8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3ANYV+kWr6vCz21SQOK+7PduvmUecEeWfFkSiJGma?=
 =?us-ascii?q?bVERsEZ2pa3yZ47wxxg=3D=3D?=
X-Talos-MUID: 9a23:nnLlyASu02I8yS5URXT+vDg6HpdNw52lDUA1rc8mh5i8BBR/bmI=
X-IronPort-AV: E=Sophos;i="5.99,226,1677560400"; 
   d="scan'208";a="107228331"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrx.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jennifer Herbert <jennifer.herbert@citrix.com>
Subject: [PATCH v3 1/2] acpi: Make TPM version configurable.
Date: Tue, 25 Apr 2023 17:47:32 +0000
Message-ID: <20230425174733.795961-2-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230425174733.795961-1-jennifer.herbert@citrix.com>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch makes the TPM version, for which the ACPI libary probes, configurable.
If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
I have also added to hvmloader an option to allow setting this new config, which can
be triggered by setting the platform/tpm_version xenstore key.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 docs/misc/xenstore-paths.pandoc |  9 +++++
 tools/firmware/hvmloader/util.c | 19 ++++++---
 tools/libacpi/build.c           | 69 +++++++++++++++++++--------------
 tools/libacpi/libacpi.h         |  3 +-
 4 files changed, 64 insertions(+), 36 deletions(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 5cd5c8a3b9..e67e164855 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -269,6 +269,15 @@ at the guest physical address in HVM_PARAM_VM_GENERATION_ID_ADDR.
 See Microsoft's "Virtual Machine Generation ID" specification for the
 circumstances where the generation ID needs to be changed.
 
+
+#### ~/platform/tpm_version = INTEGER [HVM,INTERNAL]
+
+The TPM version to be probed for.
+
+A value of 1 indicates to probe for TPM 1.2.
+A value of 0 or an invalid value will result in no TPM being probed.
+If unset, a default of 1 is assumed.
+
 ### Frontend device paths
 
 Paravirtual device frontends are generally specified by their own
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cf..f39a8e584f 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
         config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
 
-    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
-                            ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
-                            ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
-                            ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
+    config->table_flags |= (ACPI_HAS_IOAPIC | ACPI_HAS_WAET |
+                            ACPI_HAS_PMTIMER | ACPI_HAS_BUTTONS |
+                            ACPI_HAS_VGA | ACPI_HAS_8042 |
+                            ACPI_HAS_CMOS_RTC);
     config->acpi_revision = 4;
 
-    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+    s = xenstore_read("platform/tpm_version", "1");
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
index fe2db66a62..716cb49624 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
-
-    /* TPM TCPA and SSDT. */
-    if ( (config->table_flags & ACPI_HAS_TCPA) &&
-         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
-         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
+    /* TPM and its SSDT. */
+    if ( config->table_flags & ACPI_HAS_TPM )
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
+        switch ( config->tpm_version )
         {
-            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
-            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
-            memset(lasa, 0, tcpa->laml);
-            set_checksum(tcpa,
-                         offsetof(struct acpi_header, checksum),
-                         tcpa->header.length);
+        case 0: /* Assume legacy code wanted tpm 1.2 */
+        case 1:
+            if ( config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
+                 config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff )
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
+            lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16);
+            if ( lasa )
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
index a2efd23b0b..f69452401f 100644
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
@@ -66,6 +66,7 @@ struct acpi_config {
 
     uint32_t table_flags;
     uint8_t acpi_revision;
+    uint8_t tpm_version;
 
     uint64_t vm_gid[2];
     unsigned long vm_gid_addr; /* OUT parameter */
-- 
2.39.1


