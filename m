Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C923E9AC85F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 12:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824526.1238687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z46-0000xO-EO; Wed, 23 Oct 2024 10:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824526.1238687; Wed, 23 Oct 2024 10:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z46-0000tW-8b; Wed, 23 Oct 2024 10:58:10 +0000
Received: by outflank-mailman (input) for mailman id 824526;
 Wed, 23 Oct 2024 10:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Z44-0000Oq-5p
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 10:58:08 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af6f870f-912d-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 12:58:07 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c941623a5aso1312582a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 03:58:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571e3asm462067266b.147.2024.10.23.03.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 03:58:05 -0700 (PDT)
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
X-Inumbo-ID: af6f870f-912d-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729681087; x=1730285887; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Lb9ytF6JB17RhAg0W0RXGmRPpE1+HnU+Z6GNFh52Qc=;
        b=vP2NaT0lmx/1QnMhlXetG0LadCFhPbs14yJ5pSx21az9GeQHdgoE9bkGb0Hp4nzEgu
         f/yzmME6kvGSzTEu6wj2V5jYjcxJAHvoiGEJMJ8EaSXnOZMEop8BqDe6wWd0woTUk/ss
         SAqeGpNADObBbp5QSeF9juU4saNtuVteCAV74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681087; x=1730285887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Lb9ytF6JB17RhAg0W0RXGmRPpE1+HnU+Z6GNFh52Qc=;
        b=PELRxoMV1IDlsIVYs2yN0277dAhIMotSQ7GQ5rD2mnICXFwxHAem+iV9tLCbPY+FA6
         Kw94h4KiCwKvcB5pNVmNOujhzss2FgLUe0KM+w/l5auXNC/Ms6CiAmpWRwVXAEdspymF
         BQtz+joNVVzQJyDnzZ/dcKjyyCy/cWrYBEBYnthW4enUHVh6wqmlXUnGVU84KN9ExWeA
         lY2cdHzIHeDqbScFGCZdlPARVXrq7Pq6Gk694DcXu4OwQ/H4dL6kt+qArgD0EGFZ9bzR
         pwlSoO7WmxKi09QoCCTvu3m7l7xFKSvSlKHSaKTgfoxk08TczxTzC/E6yYoO0wZzbfri
         /edg==
X-Gm-Message-State: AOJu0YyaZS9kpoFt5CYLQny4fXJub6OXrUPYczP4yIDZs0ewokGwNH1d
	fThoGTPIGCZes7xglsCZNrgNgPw0jq03SHRsE9Atbg6PncCv/glTrwZDP+Up3dx5ErBYsi+HLmT
	h
X-Google-Smtp-Source: AGHT+IEJZI4upHZqGs4xzFVHTHSTqtsn6kBlDxFQY0Q6Ivu0fuFiQJyWFg7U8V0PMflWbAxcgL6UXw==
X-Received: by 2002:a17:907:2d8e:b0:a9a:60b0:a8e7 with SMTP id a640c23a62f3a-a9abef2b5e2mr197241266b.2.1729681086499;
        Wed, 23 Oct 2024 03:58:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/boot: Fix XSM module handling during PVH boot
Date: Wed, 23 Oct 2024 11:57:56 +0100
Message-Id: <20241023105756.641695-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023105756.641695-1-andrew.cooper3@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
transition period"), the use of __va(mbi->mods_addr) constitutes a
use-after-free on the PVH boot path.

This pattern has been in use since before PVH support was added.  This has
most likely gone unnoticed because no-one's tried using a detached Flask
policy in a PVH VM before.

Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
bi->mods[].mod is a safe way to access the module list during PVH boot.

As this is the final non-bi use of mbi in __start_xen(), make the pointer
unusable once bi has been established, to prevent new uses creeping back in.
This is a stopgap until mbi can be fully removed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Refectored/extracted from the hyperlaunch series.

There's no good Fixes tag for this, because it can't reasonably be "introduce
PVH", nor can the fix as-is reasonably be backported.  If we want to fix the
bug in older trees, we need to plumb the mod pointer down alongside mbi.
---
 xen/arch/x86/setup.c  |  5 ++++-
 xen/include/xsm/xsm.h | 12 +++++-------
 xen/xsm/xsm_core.c    |  7 +++----
 xen/xsm/xsm_policy.c  | 16 +++++++---------
 4 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c75b8f15fa5d..8974b0c6ede6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1088,6 +1088,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     bi = multiboot_fill_boot_info(mbi, mod);
     bi->module_map = module_map; /* Temporary */
 
+    /* Use bi-> instead */
+#define mbi DO_NOT_USE
+
     /* Parse the command-line options. */
     if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
     {
@@ -1862,7 +1865,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, mbi);
+    xsm_multiboot_init(bi);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 627c0d2731af..4dbff9d866e0 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -17,7 +17,6 @@
 
 #include <xen/alternative-call.h>
 #include <xen/sched.h>
-#include <xen/multiboot.h>
 
 /* policy magic number (defined by XSM_MAGIC) */
 typedef uint32_t xsm_magic_t;
@@ -778,11 +777,10 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi);
+struct boot_info;
+int xsm_multiboot_init(struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size);
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
@@ -828,8 +826,8 @@ static const inline struct xsm_ops *silo_init(void)
 #include <xsm/dummy.h>
 
 #ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, const multiboot_info_t *mbi)
+struct boot_info;
+static inline int xsm_multiboot_init(struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index eaa028109bde..6e3fac68c057 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -21,6 +21,7 @@
 #ifdef CONFIG_XSM
 
 #ifdef CONFIG_MULTIBOOT
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 #endif
 
@@ -139,8 +140,7 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 }
 
 #ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi)
+int __init xsm_multiboot_init(struct boot_info *bi)
 {
     int ret = 0;
     void *policy_buffer = NULL;
@@ -150,8 +150,7 @@ int __init xsm_multiboot_init(
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
-                                        &policy_size);
+        ret = xsm_multiboot_policy_init(bi, &policy_buffer, &policy_size);
         if ( ret )
         {
             bootstrap_map(NULL);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc93810f..6f799dd28f5b 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -20,7 +20,7 @@
 
 #include <xsm/xsm.h>
 #ifdef CONFIG_MULTIBOOT
-#include <xen/multiboot.h>
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 #endif
 #include <xen/bitops.h>
@@ -31,11 +31,9 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size)
+    struct boot_info *bi, void **policy_buffer, size_t *policy_size)
 {
     int i;
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     int rc = 0;
     u32 *_policy_start;
     unsigned long _policy_len;
@@ -44,13 +42,13 @@ int __init xsm_multiboot_policy_init(
      * Try all modules and see whichever could be the binary policy.
      * Adjust module_map for the module that is the binary policy.
      */
-    for ( i = mbi->mods_count-1; i >= 1; i-- )
+    for ( i = bi->nr_modules - 1; i >= 1; i-- )
     {
-        if ( !test_bit(i, module_map) )
+        if ( !test_bit(i, bi->module_map) )
             continue;
 
-        _policy_start = bootstrap_map(mod + i);
-        _policy_len   = mod[i].mod_end;
+        _policy_start = bootstrap_map(bi->mods[i].mod);
+        _policy_len   = bi->mods[i].mod->mod_end;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
@@ -60,7 +58,7 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
+            __clear_bit(i, bi->module_map);
             break;
 
         }
-- 
2.39.5


