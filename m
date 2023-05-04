Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527536F7194
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 19:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529860.824765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud7w-0002Gb-VS; Thu, 04 May 2023 17:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529860.824765; Thu, 04 May 2023 17:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud7w-0002Dk-SO; Thu, 04 May 2023 17:52:24 +0000
Received: by outflank-mailman (input) for mailman id 529860;
 Thu, 04 May 2023 17:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rz6h=AZ=citrix.com=prvs=481809c50=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1pud7v-0002DN-EY
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 17:52:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69803ca4-eaa4-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 19:52:20 +0200 (CEST)
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
X-Inumbo-ID: 69803ca4-eaa4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683222740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5qFBWRn+htczPnXVdTK5WICwefSMT3Q2LMY9OHfchM4=;
  b=di6sE8CNnl09xf4LGxLiO+Kzt+0Aus/H6DQs5PSKnFT+lfi/wK82A32s
   y537SKQsYts/4NF03aJ7KmYegZiknnTjCuaBD0Nc/8up1TKY/HiWaIU4E
   qGgSY8XZ8wNjJx/kZtrB6NH0GtRpLQo86GFKvf0+u0+9rq2Dbujb3FZkC
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107227937
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:geWnQaqe30qjIUNIurtNiu97iL1eBmJjZRIvgKrLsJaIsI4StFCzt
 garIBmPOKmOZGb0eYx2O9+0o0MC68ODn9FmQQpp/i8zEStGopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABdUVkimuf2Q+p74VcdVlNoKN8LpNoxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVapVSTpKQ6+S7TwRZ73aLxGNHUZsaLVYNemUPwS
 mfupjymWEtFZYfAodaD2kD1p+iMpyHEZLk9Gp622v56jEaK1mNGXXX6UnPk+KLk2yZSQel3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceRzUs2
 kWYgtDBCjlmsbnTQnWYnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznaY9bSIuLkfvPNXLv7
 QmYsgEljLcZgptev0mkxmwrkw5At7CQEF5uvlyNDj36hu9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 RDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0e5eI1cFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQMsMoKFfepHkxNBP4M4XRraTRuftnZ
 cfznTiEVB729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQvmUwzMxP/cyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZKdAhacSRiWMGvwyGVH8baSjdb9KgaI6e56dscl0ZNxcy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:TJyWZa2jJP94q5K3v9H7AgqjBHokLtp133Aq2lEZdPU1SL3kqy
 nKpp8mPHDP5gr5NEtMpTnCAsm9qArnhPhICNAqTM6ftWrd2VdATrsSl7cKqgeIc0fDH4hmpN
 xdmsNFZ+EYY2IXsS+02njaL/8QhPSK9aC2ifzPpk0dKD2DDMlbnn9E46ugYylLrU19dP0EPY
 vZ4sZcvTKvdVYafq2Adxs4Y9Q=
X-Talos-CUID: =?us-ascii?q?9a23=3AN3k39Wo/6zK/wCVBvO1ZGb3mUed8SiX48mj2GWP?=
 =?us-ascii?q?7FkhQWqO8UlSS8qwxxg=3D=3D?=
X-Talos-MUID: 9a23:1KeTzgWZMAshFj7q/A21pTYhDsVX35+BBmMDvZUWt9KdJSMlbg==
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107227937"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH v4 1/2] acpi: Make TPM version configurable.
Date: Thu, 4 May 2023 17:51:45 +0000
Message-ID: <20230504175146.208936-2-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230504175146.208936-1-jennifer.herbert@citrix.com>
References: <20230504175146.208936-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch makes the TPM version, for which the ACPI library probes, configurable.
If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
I have also added to hvmloader an option to allow setting this new config, which can
be triggered by setting the platform/tpm_verion xenstore key.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jason Andryuk <jandryuk@gmail.com>

v4:
* Omit tpm_version 0 case, to fallback to 1.2, previously intended for
  compatibility for unknown code.
* Add checks for xenstore tpm_version field.
* Minor code style fixes.
v3:
* Default to probing for 1.2 TPM, if xenstore tpm_version field missing
  or tpm flag set, but not the TPM version.  (Functional revert change in v2)
* Correct TPM flag setting
v2:
* Split patch into two.
* Default not to probe a TPM, unless tpm_version xenstore field set.
* Minor code style fixes.
---
 docs/misc/xenstore-paths.pandoc |  9 +++++
 tools/firmware/hvmloader/util.c | 28 ++++++++++----
 tools/libacpi/build.c           | 68 ++++++++++++++++++---------------
 tools/libacpi/libacpi.h         |  3 +-
 4 files changed, 70 insertions(+), 38 deletions(-)

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
index 581b35e5cf..1b733a3091 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -920,6 +920,8 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
 {
     const char *s;
     struct acpi_ctxt ctxt;
+    long long tpm_version = 0;
+    char *end;
 
     /* Allocate and initialise the acpi info area. */
     mem_hole_populate_ram(ACPI_INFO_PHYSICAL_ADDRESS >> PAGE_SHIFT, 1);
@@ -967,8 +969,6 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     s = xenstore_read("platform/generation-id", "0:0");
     if ( s )
     {
-        char *end;
-
         config->vm_gid[0] = strtoll(s, &end, 0);
         config->vm_gid[1] = 0;
         if ( end && end[0] == ':' )
@@ -994,13 +994,27 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
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
+    config->tpm_version = 0;
+    s = xenstore_read("platform/tpm_version", "1");
+    tpm_version = strtoll(s, &end, 0);
+
+    if ( end && end[0] == '\0' )
+    {
+        switch ( tpm_version )
+        {
+        case 1:
+            config->table_flags |= ACPI_HAS_TPM;
+            config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+            config->tpm_version = 1;
+            break;
+        }
+    }
 
     config->numa.nr_vmemranges = nr_vmemranges;
     config->numa.nr_vnodes = nr_vnodes;
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62..bb0d0557d4 100644
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


