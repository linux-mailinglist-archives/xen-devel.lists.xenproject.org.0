Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225AF7EEF31
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634964.990627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSS-0008BH-KU; Fri, 17 Nov 2023 09:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634964.990627; Fri, 17 Nov 2023 09:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSS-00089C-HN; Fri, 17 Nov 2023 09:48:16 +0000
Received: by outflank-mailman (input) for mailman id 634964;
 Fri, 17 Nov 2023 09:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vSR-0007p0-69
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:48:15 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d6d9253-852e-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:48:14 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5094cb3a036so2672441e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:48:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b0032f7d7ec4adsm1771881wrv.92.2023.11.17.01.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:48:13 -0800 (PST)
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
X-Inumbo-ID: 6d6d9253-852e-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700214493; x=1700819293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbfnLiSboEjj7ZovZYmQgy+lf6RZEwYxMOTQ6veSeok=;
        b=pPK9SBm2mp8lb2PfodqufAhENb6wvlC+6vaY8FZ1qz4hEMhft1b1Ya90ZgXa8V5tU4
         nOp6ToUqrDEIzMbh48/Iu2gE1QSaq/b+4PbqMHHzPVnykA+xWKPhkZ3JgmGxl8p1b+k2
         hMmzuhhRAzZ0C5jYyDChJHZfcHQAZOWpcwEik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214493; x=1700819293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbfnLiSboEjj7ZovZYmQgy+lf6RZEwYxMOTQ6veSeok=;
        b=v46mYQsiXJYuzlQzEUNVDB8dpjnuGvfk2FllahL4C5b/HZbsUy4AdZCEoXQIbHu9x+
         gv87R8sPZBBAXI1UbiFqBN6AB3jcJmDQWvJzRl1PHbmNPYGg8mXfvkjCcZVFbrRld6rG
         ycajK4Z4aMKwV91wjhw0ETVA61eP+62aM9Q3IVlCBB/PDE3X1APRnVvuaOdaHqMgLNkY
         4Dfv4U9GSF/h69f4Is8ooH4GSFIDUaUZObj8LgeKWUTK+zH6Wz7YPXnBXXJau75jmITh
         CQK3vIuSwtus7zep2yagMLPaiBIMeZ2yPfh5wlxk0j2pWYh1BrQ6hfXHAIOSye7yBbkg
         JSyQ==
X-Gm-Message-State: AOJu0Ywn0YK9d5OZ5++pdh5d6alDTdWHIQLxZw4ANLYHwXz60rnW5ft1
	jukr4RhFk+KIzzI3Tc9q9SFG9quZiYt2DSkCq5g=
X-Google-Smtp-Source: AGHT+IErDsdGtVszEcMZBEn6fOFlC16pRsXfTnVi9InEOTwzXkIN9XjUoH+lhV4FzSftE2Ubi6zOqg==
X-Received: by 2002:a19:434b:0:b0:507:9ae6:6913 with SMTP id m11-20020a19434b000000b005079ae66913mr11254723lfj.28.1700214493702;
        Fri, 17 Nov 2023 01:48:13 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 2/3] x86/iommu: move xen_in_range() so it can be made static
Date: Fri, 17 Nov 2023 10:47:48 +0100
Message-ID: <20231117094749.81091-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094749.81091-1-roger.pau@citrix.com>
References: <20231117094749.81091-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/setup.h    |  2 --
 xen/arch/x86/setup.c                | 49 ----------------------------
 xen/drivers/passthrough/x86/iommu.c | 50 +++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 9a460e4db8f4..4a1600decf6a 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,8 +36,6 @@ unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map(const module_t *mod);
 
-int xen_in_range(unsigned long mfn);
-
 extern uint8_t kbd_shift_flags;
 
 #ifdef NDEBUG
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a3d3f797bb1e..54daff3d4942 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2080,55 +2080,6 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
     }
 }
 
-int __hwdom_init xen_in_range(unsigned long mfn)
-{
-    paddr_t start, end;
-    int i;
-
-    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
-    static struct {
-        paddr_t s, e;
-    } xen_regions[nr_regions] __hwdom_initdata;
-
-    /* initialize first time */
-    if ( !xen_regions[0].s )
-    {
-        /* S3 resume code (and other real mode trampoline code) */
-        xen_regions[region_s3].s = bootsym_phys(trampoline_start);
-        xen_regions[region_s3].e = bootsym_phys(trampoline_end);
-
-        /*
-         * This needs to remain in sync with the uses of the same symbols in
-         * - __start_xen() (above)
-         * - is_xen_fixed_mfn()
-         * - tboot_shutdown()
-         */
-
-        /* hypervisor .text + .rodata */
-        xen_regions[region_ro].s = __pa(&_stext);
-        xen_regions[region_ro].e = __pa(&__2M_rodata_end);
-        /* hypervisor .data + .bss */
-        xen_regions[region_rw].s = __pa(&__2M_rwdata_start);
-        xen_regions[region_rw].e = __pa(&__2M_rwdata_end);
-        if ( efi_boot_mem_unused(&start, &end) )
-        {
-            ASSERT(__pa(start) >= xen_regions[region_rw].s);
-            ASSERT(__pa(end) <= xen_regions[region_rw].e);
-            xen_regions[region_rw].e = __pa(start);
-            xen_regions[region_bss].s = __pa(end);
-            xen_regions[region_bss].e = __pa(&__2M_rwdata_end);
-        }
-    }
-
-    start = (paddr_t)mfn << PAGE_SHIFT;
-    end = start + PAGE_SIZE;
-    for ( i = 0; i < nr_regions; i++ )
-        if ( (start < xen_regions[i].e) && (end > xen_regions[i].s) )
-            return 1;
-
-    return 0;
-}
-
 static int __hwdom_init cf_check io_bitmap_cb(
     unsigned long s, unsigned long e, void *ctx)
 {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 857dccb6a465..d70cee9fea77 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -13,6 +13,7 @@
  */
 
 #include <xen/cpu.h>
+#include <xen/efi.h>
 #include <xen/sched.h>
 #include <xen/iocap.h>
 #include <xen/iommu.h>
@@ -300,6 +301,55 @@ void iommu_identity_map_teardown(struct domain *d)
     }
 }
 
+static int __hwdom_init xen_in_range(unsigned long mfn)
+{
+    paddr_t start, end;
+    int i;
+
+    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
+    static struct {
+        paddr_t s, e;
+    } xen_regions[nr_regions] __hwdom_initdata;
+
+    /* initialize first time */
+    if ( !xen_regions[0].s )
+    {
+        /* S3 resume code (and other real mode trampoline code) */
+        xen_regions[region_s3].s = bootsym_phys(trampoline_start);
+        xen_regions[region_s3].e = bootsym_phys(trampoline_end);
+
+        /*
+         * This needs to remain in sync with the uses of the same symbols in
+         * - __start_xen()
+         * - is_xen_fixed_mfn()
+         * - tboot_shutdown()
+         */
+
+        /* hypervisor .text + .rodata */
+        xen_regions[region_ro].s = __pa(&_stext);
+        xen_regions[region_ro].e = __pa(&__2M_rodata_end);
+        /* hypervisor .data + .bss */
+        xen_regions[region_rw].s = __pa(&__2M_rwdata_start);
+        xen_regions[region_rw].e = __pa(&__2M_rwdata_end);
+        if ( efi_boot_mem_unused(&start, &end) )
+        {
+            ASSERT(__pa(start) >= xen_regions[region_rw].s);
+            ASSERT(__pa(end) <= xen_regions[region_rw].e);
+            xen_regions[region_rw].e = __pa(start);
+            xen_regions[region_bss].s = __pa(end);
+            xen_regions[region_bss].e = __pa(&__2M_rwdata_end);
+        }
+    }
+
+    start = (paddr_t)mfn << PAGE_SHIFT;
+    end = start + PAGE_SIZE;
+    for ( i = 0; i < nr_regions; i++ )
+        if ( (start < xen_regions[i].e) && (end > xen_regions[i].s) )
+            return 1;
+
+    return 0;
+}
+
 static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
                                                  unsigned long pfn,
                                                  unsigned long max_pfn)
-- 
2.42.0


