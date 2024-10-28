Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F059B2B30
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826299.1240545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu5-0006jz-9s; Mon, 28 Oct 2024 09:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826299.1240545; Mon, 28 Oct 2024 09:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu5-0006fH-54; Mon, 28 Oct 2024 09:19:13 +0000
Received: by outflank-mailman (input) for mailman id 826299;
 Mon, 28 Oct 2024 09:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu3-0005MP-DJ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0d03caf-950d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 10:19:10 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso503388266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:10 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:08 -0700 (PDT)
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
X-Inumbo-ID: b0d03caf-950d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107150; x=1730711950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tHJ9KvrKOuMjaRdKbRkR2CwfZwErwPkHq08Lc76WTw=;
        b=kahqWksxgzonAQz1hLCbU2S8FFI6DVKIeBrsa/xBMnrbV6FIhTxLUjFO4yymZr934T
         Fwp22CxvtECXf/VLMk8ogr5zoBKk5DmtUg2ZodOU/978FSgLVwSPT6Heg7y6iPJhmp29
         jFIgRRJfO2m9NepiFzsdXGbrGZHP+zQIPS0+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107150; x=1730711950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tHJ9KvrKOuMjaRdKbRkR2CwfZwErwPkHq08Lc76WTw=;
        b=Gt6d52xzOfaHgt9I9Itrm4BN+Ka8bSBhSbPtaPLAeOKxmIl9FQO3b0PzDVUJdOjQSa
         YPPelV3ASAAm8UpWyIQ2Ydxio9rA/WNF6sW9xGDK2Apmow7nRIkHBpIavkdTnR1FMctc
         2aCxwWnmdg2YZZcFigOLDWxM45mW09V47gjI7ypBEzM2nC17vhp3C/4dbL/kTaqgoAP3
         uGyQqbPzqUw4OXal5O9W/l5HJirpt2cKyg3HggiWt8TLX8tkfg/th5eMLVwbpn8f9Jo2
         buGOPl+H/KMPpvGlHRhxT/vBCyXw+38OlhFKM9PAxUE8fe0D6funn3dV2ZwrYILE+BPx
         2ULQ==
X-Gm-Message-State: AOJu0YxDKyiUAKffccbHTWHC40TxlqyYM06ZyqCO5WgIWuwxnmBYZOWj
	Jo6johjfjQ/Y9SCm/pu6GlUuZ3/b+4R5/pljLh3G4gBvPASHBqmjyFTkLh5IgI+2maydO7sWaxv
	L
X-Google-Smtp-Source: AGHT+IFnmPuo6iIDZ2uIcOkFOtwk+936hL3j8xHD3pymnaePQ9S+o2bupb6g8N/5ycChEVRj6IpzKg==
X-Received: by 2002:a17:907:3f20:b0:a9a:375e:c167 with SMTP id a640c23a62f3a-a9de5c91a19mr711781366b.1.1730107149626;
        Mon, 28 Oct 2024 02:19:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 06/10] x86/ucode: Enforce invariant about module selection
Date: Mon, 28 Oct 2024 09:18:52 +0000
Message-Id: <20241028091856.2151603-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The work to add the `ucode=nmi` cmdline option left a subtle corner case.
Both scan and an explicit index could be selected, and we could really find a
CPIO archive and explicit microcode file.

Worse, because the if/else chains for processing ucode_{blob,mod} are opposite
ways around in early_microcode_load() and microcode_init_cache(), we can
genuinely perform early microcode loading from the CPIO archive, then cache
from the explicit file.

Therefore, enforce that only one selection method can be active.

Rename ucode_{scan,mod_idx} to have an opt_ prefix.  This is both for
consistency with the rest of Xen, and to guarantee that we've got all
instances of the variables covered in this change.  Explain how they're use.
During cmdline/config parsing, always update both variables in pairs.

In early_microcode_load(), ASSERT() the invariant just in case.  Use a local
variable for idx rather than operating on the static; we're the only consume
of the value.

Expand the index selection logic with comments and warnings to the user when
something went wrong.

Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Despite the fixes tag, this can't be backported (at least not in this form).
---
 xen/arch/x86/cpu/microcode/core.c | 76 +++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 4c4003bf9687..fc31ab35c3c8 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -60,7 +60,6 @@
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
 static module_t __initdata ucode_mod;
-static signed int __initdata ucode_mod_idx;
 static bool __initdata ucode_mod_forced;
 static unsigned int nr_cores;
 
@@ -97,11 +96,6 @@ struct patch_with_flags {
 };
 
 static struct ucode_mod_blob __initdata ucode_blob;
-/*
- * By default we will NOT parse the multiboot modules to see if there is
- * cpio image with the microcode images.
- */
-static bool __initdata ucode_scan;
 
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
@@ -109,13 +103,28 @@ static bool ucode_in_nmi = true;
 /* Protected by microcode_mutex */
 static const struct microcode_patch *microcode_cache;
 
+/*
+ * opt_mod_idx and opt_scan have subtle semantics.
+ *
+ * The cmdline can either identify a module by number (inc -ve back-reference)
+ * containing a raw microcode container, or select scan which instructs Xen to
+ * search all modules for an uncompressed CPIO archive containing a file with
+ * a vendor-dependent name.
+ *
+ * These options do not make sense when combined, so for the benefit of module
+ * location we require that they are not both active together.
+ */
+static int __initdata opt_mod_idx;
+static bool __initdata opt_scan;
+
 /*
  * Used by the EFI path only, when xen.cfg identifies an explicit microcode
  * file.  Overrides ucode=<int>|scan on the regular command line.
  */
 void __init microcode_set_module(unsigned int idx)
 {
-    ucode_mod_idx = idx;
+    opt_mod_idx = idx;
+    opt_scan = false;
     ucode_mod_forced = 1;
 }
 
@@ -139,12 +148,16 @@ static int __init cf_check parse_ucode(const char *s)
         else if ( !ucode_mod_forced ) /* Not forced by EFI */
         {
             if ( (val = parse_boolean("scan", s, ss)) >= 0 )
-                ucode_scan = val;
+            {
+                opt_scan = val;
+                opt_mod_idx = 0;
+            }
             else
             {
                 const char *q;
 
-                ucode_mod_idx = simple_strtol(s, &q, 0);
+                opt_scan = false;
+                opt_mod_idx = simple_strtol(s, &q, 0);
                 if ( q != ss )
                     rc = -EINVAL;
             }
@@ -166,7 +179,7 @@ static void __init microcode_scan_module(struct boot_info *bi)
     int i;
 
     ucode_blob.size = 0;
-    if ( !ucode_scan )
+    if ( !opt_scan )
         return;
 
     if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
@@ -792,7 +805,7 @@ static int __init cf_check microcode_init_cache(void)
     if ( !ucode_ops.apply_microcode )
         return -ENODEV;
 
-    if ( ucode_scan )
+    if ( opt_scan )
         /* Need to rescan the modules because they might have been relocated */
         microcode_scan_module(bi);
 
@@ -817,17 +830,42 @@ static int __init early_microcode_load(struct boot_info *bi)
     const void *data = NULL;
     size_t size;
     struct microcode_patch *patch;
+    int idx = opt_mod_idx;
+
+    /*
+     * Cmdline parsing ensures this invariant holds, so that we don't end up
+     * trying to mix multiple ways of finding the microcode.
+     */
+    ASSERT(idx == 0 || !opt_scan);
 
-    if ( ucode_mod_idx < 0 )
-        ucode_mod_idx += bi->nr_modules;
-    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
-         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
-        goto scan;
-    ucode_mod = *bi->mods[ucode_mod_idx].mod;
- scan:
-    if ( ucode_scan )
+    if ( opt_scan ) /* Scan for a CPIO archive */
         microcode_scan_module(bi);
 
+    if ( idx ) /* Specific module nominated */
+    {
+        /*
+         * Negative indicies can be used to reference from the end of the
+         * modules.  e.g. ucode=-1 refers to the last module.
+         */
+        if ( idx < 0 )
+            idx += bi->nr_modules;
+
+        if ( idx <= 0 || idx >= bi->nr_modules )
+        {
+            printk(XENLOG_WARNING "Microcode: Chosen module %d out of range [1, %u)\n",
+                   idx, bi->nr_modules);
+            return -ENODEV;
+        }
+
+        if ( !__test_and_clear_bit(idx, bi->module_map) )
+        {
+            printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
+            return -ENODEV;
+        }
+
+        ucode_mod = *bi->mods[idx].mod;
+    }
+
     if ( !ucode_mod.mod_end && !ucode_blob.size )
         return 0;
 
-- 
2.39.5


