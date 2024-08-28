Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B1962610
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784740.1194120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGt9-00064J-F9; Wed, 28 Aug 2024 11:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784740.1194120; Wed, 28 Aug 2024 11:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGt9-00061g-CJ; Wed, 28 Aug 2024 11:30:59 +0000
Received: by outflank-mailman (input) for mailman id 784740;
 Wed, 28 Aug 2024 11:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecal=P3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjGt7-00061a-H4
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:30:57 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcdd01b9-6530-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:30:55 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7a4df9dc840so387979885a.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:30:55 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f35ba3bsm626925885a.59.2024.08.28.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 04:30:52 -0700 (PDT)
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
X-Inumbo-ID: fcdd01b9-6530-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724844654; x=1725449454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NP40Ho4Pmq7WnToYus2s15UIRJ92xUV+gpDp04qChq4=;
        b=AOTNdHnuYGlhcnYzgNN/uvdBzwVoS5TZtMbjVwf3MQPNimdMDhOQeiDMHFUafUN4m2
         WbjMIKlONArqqm12SF5Auk1Wh8V822ti3UpaaLZ+tVgJl0ReK/8xfmqOCwacYCfrWQls
         mcb/ueSCF7bfIqj/9GzDBlVP4HkGxUX6ft48o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724844654; x=1725449454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP40Ho4Pmq7WnToYus2s15UIRJ92xUV+gpDp04qChq4=;
        b=Wu5+FVSNjtQqmmWyj6htrY4j9NTO4wXaZlvrBPFnf1nr/319aUjlHQ5lTXXcHxGpTy
         EPnKVG95TnIN8W5eL/T1ecViJ71q/qZvli0Oj17AHrKMRfG4oA2CJnZJDWBqAoyh9y69
         smE8z+P7+1ZIvrcUdHrAoaB21ZlI+RGWL8ZM34HiNR4LWWCj7pRSYzR+hvTXxNNRWhWt
         ln0sEGLYqQjcdiymHlwTYw5KilMMqwQivKpjqr759QmEiwJ9kldUqCflYDZOF1SVPoU5
         gcbZ99GuMeIoFEzP4948SBt3jDjEbgmTQKRdCzJZpyNgmVzzVDWe+1oJ1o34Gm9nHb2l
         drUw==
X-Gm-Message-State: AOJu0YxswveN6IKCyXyh5XbNHuL96nyDPpGdXnAvW7cEr4va6/aywQ5K
	7JA/DQI+QInjrDFfZvzO+JUH1c/gOS+vXo/lkBnDfWVNZrqdFFEjrmqMhBmwFP6vRVzzM9q57+z
	+
X-Google-Smtp-Source: AGHT+IFKxLbDap4Z7rOnqJ3joVSoQbGTU5gfXH+djtGXTusKrCJtihPvJA714ffvGw6RZz0BhQwtbQ==
X-Received: by 2002:a05:620a:458c:b0:79f:197d:fe92 with SMTP id af79cd13be357-7a6896e4417mr1465527285a.2.1724844653525;
        Wed, 28 Aug 2024 04:30:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
Date: Wed, 28 Aug 2024 13:30:44 +0200
Message-ID: <20240828113044.35541-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the logic that disables SMAP so it's only performed when building a PV
dom0, PVH dom0 builder doesn't require disabling SMAP.

The fixes tag is to account for the wrong usage of cpu_has_smap in
create_dom0(), it should instead have used
boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
only.

While there also make cr4_pv32_mask __ro_after_init.

Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Drop comment and asmlinkage attribute.
 - Introduce a wrapper for dom0_construct_pv() so the usage of cr4_pv32_mask
   can be limited to a PV-specific file.

Changes since v4:
 - New approach, move the current logic so it's only applied when creating a PV
   dom0.
---
 xen/arch/x86/include/asm/setup.h |  2 ++
 xen/arch/x86/pv/dom0_build.c     | 38 +++++++++++++++++++++++++++-----
 xen/arch/x86/setup.c             | 20 +----------------
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b91..8f7dfefb4dcf 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -64,6 +64,8 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
+extern unsigned long cr4_pv32_mask;
+
 #define max_init_domid (0)
 
 #endif
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 57e58a02e707..22988f2660b0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -354,11 +354,11 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
-                             module_t *initrd,
-                             const char *cmdline)
+static int __init dom0_construct(struct domain *d,
+                                 const module_t *image,
+                                 unsigned long image_headroom,
+                                 module_t *initrd,
+                                 const char *cmdline)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -1051,6 +1051,34 @@ out:
     return rc;
 }
 
+int __init dom0_construct_pv(struct domain *d,
+                             const module_t *image,
+                             unsigned long image_headroom,
+                             module_t *initrd,
+                             const char *cmdline)
+{
+    int rc;
+
+    /*
+     * Temporarily clear SMAP in CR4 to allow user-accesses in
+     * construct_dom0().  This saves a large number of corner cases
+     * interactions with copy_from_user().
+     */
+    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    {
+        cr4_pv32_mask &= ~X86_CR4_SMAP;
+        write_cr4(read_cr4() & ~X86_CR4_SMAP);
+    }
+    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
+    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    {
+        write_cr4(read_cr4() | X86_CR4_SMAP);
+        cr4_pv32_mask |= X86_CR4_SMAP;
+    }
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..f1076c72032d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -79,8 +79,7 @@ bool __read_mostly use_invpcid;
 int8_t __initdata opt_probe_port_aliases = -1;
 boolean_param("probe-port-aliases", opt_probe_port_aliases);
 
-/* Only used in asm code and within this source file */
-unsigned long asmlinkage __read_mostly cr4_pv32_mask;
+unsigned long __ro_after_init cr4_pv32_mask;
 
 /* **** Linux config option: propagated to domain0. */
 /* "acpi=off":    Sisables both ACPI table parsing and interpreter. */
@@ -955,26 +954,9 @@ static struct domain *__init create_dom0(const module_t *image,
         }
     }
 
-    /*
-     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
-     * This saves a large number of corner cases interactions with
-     * copy_from_user().
-     */
-    if ( cpu_has_smap )
-    {
-        cr4_pv32_mask &= ~X86_CR4_SMAP;
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
-    }
-
     if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
-    if ( cpu_has_smap )
-    {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
-        cr4_pv32_mask |= X86_CR4_SMAP;
-    }
-
     return d;
 }
 
-- 
2.46.0


