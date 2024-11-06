Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4879BDA75
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 01:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830526.1245545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007WA-74; Wed, 06 Nov 2024 00:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830526.1245545; Wed, 06 Nov 2024 00:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8U5P-0007Tw-34; Wed, 06 Nov 2024 00:39:51 +0000
Received: by outflank-mailman (input) for mailman id 830526;
 Wed, 06 Nov 2024 00:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8U5M-0007S3-Oy
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 00:39:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d64042f-9bd7-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 01:39:43 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso843693266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 16:39:43 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm198664166b.59.2024.11.05.16.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 16:39:41 -0800 (PST)
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
X-Inumbo-ID: 9d64042f-9bd7-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkNjQwNDJmLTliZDctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODUzNTgzLjQ5MDEzMSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730853582; x=1731458382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qg2p2KdWuxuaSDUiJ7yQpVbcR99qOY01rSKquEZmgVI=;
        b=MHtQ36V5LBRxPc7FSpuz2QLzccbg7s60P4b4Pl/0wRuDEdsqRs80bg5fw3ccd7fV0t
         AcKugUcZ9Xxb4uMmRUGQjrGMcLp/wgBVecptFBpqtwDyfcrRKrJuduwZUW9Lcq5uUHwG
         InyoL5bycQTcbhlNhnKiNlCab9ze2o6/PA9oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730853582; x=1731458382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qg2p2KdWuxuaSDUiJ7yQpVbcR99qOY01rSKquEZmgVI=;
        b=Ea90mtW1PO0+AMJ5cv+lctljTaBH4IOJ3F81nMMC44H01KZtnpurqZkV4SZiubjAH9
         AVINIscHhHFQg3RAJGOWbzDfT+bfhbXpAgD9Awc55b0Pr8laf/VRa2ZYvzkoXiszQrsd
         T2JS939Ct8YigmBmzsSK8kxXl5m703G1Kp+/FYs9VDIeNh/Oqb8nhqvnCoEgq2yZ96EV
         KrmUspPOKM6jqbm3Djj4IQ/yGG5/sPHmzJoFzsMTIVOILUeQI0fj13rHxWTpw0MJQ4Px
         44QZVPH4XXxlh0d+QNa3wntX3npv4rTY8ErdKjYlmyBhHGYYECiRzr89ULPMOZxRHVld
         sVdQ==
X-Gm-Message-State: AOJu0Yw9WOYWSkJFdsilFu4pwV83tMMYzH5HSE+QT4+USzg7DlBtRYOt
	UJQyStl17mjxDnRLkwi2KhpONRf5Lz5tc6PyhQ6ujd7Rg/rUcwIxeNu0n7He5CcPOa6hsnSWZSC
	2
X-Google-Smtp-Source: AGHT+IHG8CAkxzc9uWotSu9/8aMwFwGXV78MGz0LANQehu5h+v2rf2xbbw88T0N8fLiqFo1bR1l7Cw==
X-Received: by 2002:a17:907:3202:b0:a9a:1a6a:b5f5 with SMTP id a640c23a62f3a-a9e3a7f0abamr2652933066b.56.1730853582157;
        Tue, 05 Nov 2024 16:39:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] x86/ucode: Enforce invariant about module selection
Date: Wed,  6 Nov 2024 00:39:35 +0000
Message-Id: <20241106003938.3453243-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
References: <20241106003938.3453243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The work to add the `ucode=nmi` cmdline option left a subtle corner case.
Both scan and an explicit index could be chosen, and we could really find both
a CPIO archive and a microcode file.

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
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

This intentionally does not change the behaviour beyond excluding the
unintended ambiguous case.  It is deeply unintuitive behaviour, and there are
complains on various distros forums/wikis.  It ought to be changed, but not
before we have a more sane way of handling modules.

v2:
 * Adjust ucode=$num error case.

Despite the fixes tag, this can't be backported (at least not in this form).
---
 xen/arch/x86/cpu/microcode/core.c | 80 +++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b7c3e270e17e..97ed1f11588a 100644
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
 
@@ -139,14 +148,22 @@ static int __init cf_check parse_ucode(const char *s)
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
+                opt_mod_idx = simple_strtol(s, &q, 0);
                 if ( q != ss )
+                {
+                    opt_mod_idx = 0;
                     rc = -EINVAL;
+                }
+                else
+                    opt_scan = false;
             }
         }
 
@@ -167,7 +184,7 @@ static void __init microcode_scan_module(struct boot_info *bi)
     int i;
 
     ucode_blob.size = 0;
-    if ( !ucode_scan )
+    if ( !opt_scan )
         return;
 
     /*
@@ -806,7 +823,7 @@ static int __init cf_check microcode_init_cache(void)
     if ( !ucode_ops.apply_microcode )
         return -ENODEV;
 
-    if ( ucode_scan )
+    if ( opt_scan )
         /* Need to rescan the modules because they might have been relocated */
         microcode_scan_module(bi);
 
@@ -831,17 +848,42 @@ static int __init early_microcode_load(struct boot_info *bi)
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


