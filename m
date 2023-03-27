Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31B6CAF04
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515456.798362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiv-0003KA-UT; Mon, 27 Mar 2023 19:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515456.798362; Mon, 27 Mar 2023 19:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiv-0003Gg-Q4; Mon, 27 Mar 2023 19:41:45 +0000
Received: by outflank-mailman (input) for mailman id 515456;
 Mon, 27 Mar 2023 19:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsiu-0002j7-Dp
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bbf68f-ccd7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 21:41:41 +0200 (CEST)
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
X-Inumbo-ID: 65bbf68f-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ycSPzPhEBhMtNfmYAIo5IKgNH3bA3cjpPAQnh0Y1CjM=;
  b=Za7FuoYXny5HaZx7CwZZwwnK5L7JmrWwz1JRXckx6o+JPc2Jaikx6cPT
   mYtzcXdXTPNkBSGYrTujTffDV1Eim2cjp1IVdFR8u0uo2nrHHowzRRoIO
   fXLeSZINi89oyyFLZtNhiLbfEqv4DHIgESpgDnxS4Jd44/BYgii1T3WKR
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103115617
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2Q+mEqgX7AJFwVioDI3Czs2XX161GhAKZh0ujC45NGQN5FlHY01je
 htvCG+Ea/beMWbwKd5yOori8RwEvcfQxtFqHQU++XowRi0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRJOjEQUBWJmtuIg5+hZ7Ywqcocdc3CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jmfpjmnW05y2Nq3liOsyzHz2PX1vSbHerAUCZS0rNBnqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsHBkE/ufmqpwKsFHiVPs8TIG7sYTxMGSlq
 9yVlxTSl4n/nOZSifrqow6a2Wn0znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kvmxSY21Da+OMIImjn1NmOmvpnkGiam4gQjQfLUEy/lja
 f93j+71ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2ddKdAtQcSFrVMmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:kV1XHKgXmofnPIpRnl/2v2WnuHBQXh0ji2hC6mlwRA09TySZ//
 re+sjztCWVtN91YhodcL+7WZVoLUmskKKdgrNhRItKPjOWwFdARbsKheSN/9SJIVyEygc379
 YFT0ERMqyWMXFKyevBzU2fNf1I+rW6GaaT79v2/jNWYTsvQYdGwCdWNj2yL21RY019KadRLu
 v+2uN34zWhfHgMbte2HBA+MtTrrcHQiZTjbQUnKnccmWuzsQ8=
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103115617"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 5/5] x86/ucode: Drop ucode_mod and ucode_blob
Date: Mon, 27 Mar 2023 20:41:26 +0100
Message-ID: <20230327194126.3573997-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These both incorrectly cache bootstrap_map()'d pointers across returns back to
__start_xen().  This is never valid, and such pointers may fault, or point to
something unrelated.

With the refactoring work in the previous patches, they're clearly now just
non-standard function return parameters.

Rename struct ucode_mod_blob to just struct blob for breviy and because
there's nothing really ucode-specific about it.

Introduce find_microcode_blob(), to replace microcode_grab_module(), and
rework microcode_scan_module() so they both return a pointer/size tuple, and
don't cache their return values in global state.

This allows us to remove the microcode_init() initcall, the comments of which
gives the false impression that either of the cached pointers are safe to use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 154 +++++++++++++-----------------
 1 file changed, 68 insertions(+), 86 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 7d32bc13db6f..0ae628ba99d4 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -55,7 +55,6 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static module_t __initdata ucode_mod;
 static signed int __initdata ucode_mod_idx;
 static bool_t __initdata ucode_mod_forced;
 static unsigned int nr_cores;
@@ -76,18 +75,11 @@ static enum {
     LOADING_EXIT,
 } loading_state;
 
-/*
- * If we scan the initramfs.cpio for the early microcode code
- * and find it, then 'ucode_blob' will contain the pointer
- * and the size of said blob. It is allocated from Xen's heap
- * memory.
- */
-struct ucode_mod_blob {
+struct blob {
     const void *data;
     size_t size;
 };
 
-static struct ucode_mod_blob __initdata ucode_blob;
 /*
  * By default we will NOT parse the multiboot modules to see if there is
  * cpio image with the microcode images.
@@ -148,7 +140,15 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-void __init microcode_scan_module(
+/*
+ * Scan all unclaimed modules, looking for a decompressed CPIO archive
+ * containing a microcode file according to the Linux early microcode API.
+ *
+ * Always caches the results, positive or negative.
+ *
+ * Returns a ptr/size tupe.  Either NULL/0, or a bootstrap_map()'d region.
+ */
+static struct blob __init microcode_scan_module(
     unsigned long *module_map,
     const multiboot_info_t *mbi)
 {
@@ -159,32 +159,35 @@ void __init microcode_scan_module(
     } scan;
 
     module_t *mod = (module_t *)__va(mbi->mods_addr);
+    struct blob blob = {};
     const char *p = NULL;
     int i;
 
-    ucode_blob.size = 0;
-
     if ( scan.mod_idx ) /* Previous scan was successful. */
     {
         void *map = bootstrap_map(&mod[scan.mod_idx]);
 
         if ( !map )
-            return;
+            return blob;
+
+        blob.size = scan.size;
+        blob.data = map + scan.offset;
 
-        ucode_blob.size = scan.size;
-        ucode_blob.data = map + scan.offset;
-        return;
+        return blob;
     }
 
     if ( !ucode_scan )
-        return;
+        return blob;
+
+    /* Only scan once, whatever the outcome. */
+    ucode_scan = false;
 
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
         p = "kernel/x86/microcode/AuthenticAMD.bin";
     else if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         p = "kernel/x86/microcode/GenuineIntel.bin";
     else
-        return;
+        return blob;
 
     /*
      * Try all modules and see whichever could be the microcode blob.
@@ -214,30 +217,15 @@ void __init microcode_scan_module(
             scan.offset  = cd.data - _blob_start;
             scan.size    = cd.size;
 
-            ucode_blob.size = cd.size;
-            ucode_blob.data = cd.data;
+            blob.size = cd.size;
+            blob.data = cd.data;
             break;
         }
 
         bootstrap_map(NULL);
     }
-}
-
-static void __init microcode_grab_module(
-    unsigned long *module_map,
-    const multiboot_info_t *mbi)
-{
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
 
-    if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += mbi->mods_count;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= mbi->mods_count ||
-         !__test_and_clear_bit(ucode_mod_idx, module_map) )
-        goto scan;
-    ucode_mod = mod[ucode_mod_idx];
-scan:
-    if ( ucode_scan )
-        microcode_scan_module(module_map, mbi);
+    return blob;
 }
 
 static struct microcode_ops __ro_after_init ucode_ops;
@@ -746,28 +734,6 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
                                      microcode_update_helper, buffer);
 }
 
-static int __init cf_check microcode_init(void)
-{
-    /*
-     * At this point, all CPUs should have updated their microcode
-     * via the early_microcode_* paths so free the microcode blob.
-     */
-    if ( ucode_blob.size )
-    {
-        bootstrap_map(NULL);
-        ucode_blob.size = 0;
-        ucode_blob.data = NULL;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        bootstrap_map(NULL);
-        ucode_mod.mod_end = 0;
-    }
-
-    return 0;
-}
-__initcall(microcode_init);
-
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
@@ -779,26 +745,53 @@ int microcode_update_one(void)
     return microcode_update_cpu(NULL);
 }
 
+/*
+ * Find microcode within the boot modules provided.
+ *
+ * This is called twice on boot, once very early to find the BSP microcode,
+ * and a second time in order to initalise the cache once we've set up the
+ * heap to use.
+ *
+ * Returns a ptr/size tuple, either NULL/0 or a bootstrap_map()'d region.
+ */
+static struct blob __init find_microcode_blob(
+    unsigned long *module_map, const multiboot_info_t *mbi)
+{
+    struct blob blob = {};
+
+    if ( ucode_mod_idx != 0 )
+    {
+        module_t *mod = __va(mbi->mods_addr);
+
+        /* Adjust to support negative backreferences. */
+        if ( ucode_mod_idx < 0 )
+            ucode_mod_idx += mbi->mods_count;
+
+        if ( ucode_mod_idx > 0 &&
+             ucode_mod_idx < mbi->mods_count &&
+             __test_and_clear_bit(ucode_mod_idx, module_map) )
+        {
+            mod += ucode_mod_idx;
+
+            blob.data = bootstrap_map(mod);
+            blob.size = mod->mod_end;
+
+            return blob;
+        }
+
+        /* Still not valid.  Ignore it next time around. */
+        ucode_mod_idx = 0;
+    }
+
+    return microcode_scan_module(module_map, mbi);
+}
+
 int __init microcode_init_cache(unsigned long *module_map,
                                 const struct multiboot_info *mbi)
 {
     int rc = 0;
     struct microcode_patch *patch;
-    struct ucode_mod_blob blob = {};
-
-    if ( ucode_scan )
-        /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
-
-    if ( ucode_mod.mod_end )
-    {
-        blob.data = bootstrap_map(&ucode_mod);
-        blob.size = ucode_mod.mod_end;
-    }
-    else if ( ucode_blob.size )
-    {
-        blob = ucode_blob;
-    }
+    struct blob blob = find_microcode_blob(module_map, mbi);
 
     if ( !blob.data )
         return 0;
@@ -833,7 +826,7 @@ int __init early_microcode_init(unsigned long *module_map,
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     struct microcode_patch *patch;
-    struct ucode_mod_blob blob = {};
+    struct blob blob = {};
     int rc = 0;
 
     switch ( c->x86_vendor )
@@ -855,20 +848,9 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
-
     ucode_ops.collect_cpu_info();
 
-    if ( ucode_blob.data )
-    {
-        blob = ucode_blob;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        blob.data = bootstrap_map(&ucode_mod);
-        blob.size = ucode_mod.mod_end;
-    }
-
+    blob = find_microcode_blob(module_map, mbi);
     if ( !blob.data )
         return 0;
 
-- 
2.30.2


