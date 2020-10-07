Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE9286674
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3616.10443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDlA-0004pe-3M; Wed, 07 Oct 2020 18:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3616.10443; Wed, 07 Oct 2020 18:01:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDl9-0004pC-Vn; Wed, 07 Oct 2020 18:01:51 +0000
Received: by outflank-mailman (input) for mailman id 3616;
 Wed, 07 Oct 2020 18:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQDl9-0004ov-3x
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d99c4ae-0f97-4f2c-8f85-87f864b84b6e;
 Wed, 07 Oct 2020 18:01:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQDl9-0004ov-3x
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:51 +0000
X-Inumbo-ID: 1d99c4ae-0f97-4f2c-8f85-87f864b84b6e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d99c4ae-0f97-4f2c-8f85-87f864b84b6e;
	Wed, 07 Oct 2020 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602093709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sKrFXatEEq5DqK+cx9YnltRr6D+EMF7PGcHSzrSySec=;
  b=PciKDSt472tfF64m7UjHPgyj2hM13CQvFzJmPP/3hhODNgEGnaNk7dHS
   +H4bU7ZPFIZUpN2XB39rQsbfO10KXwLK973s2dLZqBQYczIOVJgGyYHO6
   6XaDVdswe1KlaXonPj0DG9SFkLcSl6QtTYGx5Omsru+/qDo1HJ4jM2AHW
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: V1uCHVTavA80cRQ7zMOl16lNe7ZtZdcmLaxOW/s3OB6o+2VQ0R6hveNDy/1UOPuAggBjH2NFWs
 H47HMYBM57uoDVZ6bVaBK0B+jteu5RZGjSP+ZKf5ZrM5KoX7xt5SzOi/msEchQHcfcjoZagikX
 AI9DC/bLVfHEa+cxQH4xG3k+KmJENfQoFrwmeWOk3YmXFEahshIc23GVp2m77DPQu+3v2eSzFP
 Y1pSlzrS7xat0W8PH+Oa8o9kHb5Df+hQGdA8qqbpJABICHDR6Kkq3nYuS21reZzM4t2whdAWeq
 o4w=
X-SBRS: None
X-MesageID: 28774375
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,347,1596513600"; 
   d="scan'208";a="28774375"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ucode: Trivial further cleanup
Date: Wed, 7 Oct 2020 19:01:20 +0100
Message-ID: <20201007180120.27203-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Drop unused include in private.h.
 * Used explicit width integers for Intel header fields.
 * Adjust comment to better describe the extended header.
 * Drop unnecessary __packed attribute for AMD header.
 * Switch mc_patch_data_id to being uint16_t, which is how it is more commonly
   referred to.
 * Fix types and style.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/amd.c     | 10 +++++-----
 xen/arch/x86/cpu/microcode/intel.c   | 34 +++++++++++++++++-----------------
 xen/arch/x86/cpu/microcode/private.h |  2 --
 3 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index cd532321e8..e913232067 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -24,7 +24,7 @@
 
 #define pr_debug(x...) ((void)0)
 
-struct __packed equiv_cpu_entry {
+struct equiv_cpu_entry {
     uint32_t installed_cpu;
     uint32_t fixed_errata_mask;
     uint32_t fixed_errata_compare;
@@ -35,7 +35,7 @@ struct __packed equiv_cpu_entry {
 struct microcode_patch {
     uint32_t data_code;
     uint32_t patch_id;
-    uint8_t  mc_patch_data_id[2];
+    uint16_t mc_patch_data_id;
     uint8_t  mc_patch_data_len;
     uint8_t  init_flag;
     uint32_t mc_patch_data_checksum;
@@ -102,7 +102,7 @@ static void collect_cpu_info(void)
              smp_processor_id(), csig->rev);
 }
 
-static bool_t verify_patch_size(uint32_t patch_size)
+static bool verify_patch_size(uint32_t patch_size)
 {
     uint32_t max_size;
 
@@ -113,7 +113,7 @@ static bool_t verify_patch_size(uint32_t patch_size)
 #define F17H_MPB_MAX_SIZE 3200
 #define F19H_MPB_MAX_SIZE 4800
 
-    switch (boot_cpu_data.x86)
+    switch ( boot_cpu_data.x86 )
     {
     case 0x14:
         max_size = F14H_MPB_MAX_SIZE;
@@ -135,7 +135,7 @@ static bool_t verify_patch_size(uint32_t patch_size)
         break;
     }
 
-    return (patch_size <= max_size);
+    return patch_size <= max_size;
 }
 
 static bool check_final_patch_levels(const struct cpu_signature *sig)
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index d031196d4c..d9bb1bc10e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -32,38 +32,38 @@
 #define pr_debug(x...) ((void)0)
 
 struct microcode_patch {
-    unsigned int hdrver;
-    unsigned int rev;
+    uint32_t hdrver;
+    uint32_t rev;
     uint16_t year;
     uint8_t  day;
     uint8_t  month;
-    unsigned int sig;
-    unsigned int cksum;
-    unsigned int ldrver;
+    uint32_t sig;
+    uint32_t cksum;
+    uint32_t ldrver;
 
     /*
      * Microcode for the Pentium Pro and II had all further fields in the
      * header reserved, had a fixed datasize of 2000 and totalsize of 2048,
      * and didn't use platform flags despite the availability of the MSR.
      */
-    unsigned int pf;
-    unsigned int datasize;
-    unsigned int totalsize;
-    unsigned int reserved[3];
+    uint32_t pf;
+    uint32_t datasize;
+    uint32_t totalsize;
+    uint32_t reserved[3];
 
     /* Microcode payload.  Format is propriety and encrypted. */
     uint8_t data[];
-};
 
-/* microcode format is extended from prescott processors */
+    /* Extended header (iff totalsize > datasize, P4 Prescott and later) */
+};
 struct extended_sigtable {
-    unsigned int count;
-    unsigned int cksum;
-    unsigned int reserved[3];
+    uint32_t count;
+    uint32_t cksum;
+    uint32_t rsvd[3];
     struct {
-        unsigned int sig;
-        unsigned int pf;
-        unsigned int cksum;
+        uint32_t sig;
+        uint32_t pf;
+        uint32_t cksum;
     } sigs[];
 };
 
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c00ba590d1..9a15cdc879 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -1,8 +1,6 @@
 #ifndef ASM_X86_MICROCODE_PRIVATE_H
 #define ASM_X86_MICROCODE_PRIVATE_H
 
-#include <xen/types.h>
-
 #include <asm/microcode.h>
 
 enum microcode_match_result {
-- 
2.11.0


