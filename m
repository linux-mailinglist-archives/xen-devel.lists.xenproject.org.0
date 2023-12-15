Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D328814A4B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655128.1022822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE91p-0006hW-PD; Fri, 15 Dec 2023 14:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655128.1022822; Fri, 15 Dec 2023 14:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE91p-0006ey-ME; Fri, 15 Dec 2023 14:19:01 +0000
Received: by outflank-mailman (input) for mailman id 655128;
 Fri, 15 Dec 2023 14:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE91n-0006es-W5
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:18:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3510af2-9b54-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 15:18:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c236624edso7548425e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c468800b0040c488e4fb5sm19266019wmo.40.2023.12.15.06.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:57 -0800 (PST)
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
X-Inumbo-ID: e3510af2-9b54-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649938; x=1703254738; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfxozcO3CAG7eR5+VWkDWdrPK7Br/PqDvBXsKNSGHKo=;
        b=QeqAM+z6Kt+A5yRh3kV/q5cJiSZyAwU6YwYuTdXlASdrviMXTHImN9Nc1B1gFeXsrR
         m1ZLgvxQqgXMPQ1t5huvkeWjiQWAVtCIdiq/IFif0IwC94vrfD7pHscuQjAOhG7R2hwS
         GjrsrUCuZBO2vD92tlWc3dJYs7pnezYy/hy7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649938; x=1703254738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfxozcO3CAG7eR5+VWkDWdrPK7Br/PqDvBXsKNSGHKo=;
        b=PaYC74MTyhaiqgS0WIDzGR0zFsQ4nfgXDylItjsL5CTF38Rd4ukEQCyrhZ53E33+f2
         z7jCQg9wI4yKKQSJWYqZSYeBjiNViauE75LsjSPUwX9H/1WHB/F6cJV7+Cq4Yk88Rh5G
         +2p95g2+Rw2/RndZD2Tw45C5HsjEe1nExb0IGxtfQZCDQHDimhwWdKBC4IY0+zT99TGi
         yD+gCzrtNEkch3dubIJdWYZ3v1sQJtVVBMO5A+zxI910AfX9pDHumadxkU4vfA8GyHes
         M/1wwAWeVxB1buufw6LdFS0OQGHeXVH9uZj7KyTtUubmry9Y9SVVYO3RooIwqtjb6eTm
         D3Dg==
X-Gm-Message-State: AOJu0YzW1S6VD67533KGVxUMNAjYu6DntzF6D8myf4mQxhFVlkZ7v/LL
	yXYC9zBrgW0POfzYh24CWGZ03M49fqj1wDoEQvI=
X-Google-Smtp-Source: AGHT+IHUqRs+AdoriH7td6vOHiqYhpHsTg2itXwsLM+PX2tbjJTgM5u0HqcuKToJoxPHgO5/vzPsOQ==
X-Received: by 2002:a05:600c:4f93:b0:40c:6b55:2a0e with SMTP id n19-20020a05600c4f9300b0040c6b552a0emr493672wmq.75.1702649938297;
        Fri, 15 Dec 2023 06:18:58 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v3 7/7] x86/iommu: cleanup unused functions
Date: Fri, 15 Dec 2023 15:18:32 +0100
Message-ID: <20231215141832.9492-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.

Adjust comments to point to the new functions that replace the existing ones.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Do remove vpci_is_mmcfg_address().
---
Can be squashed with the previous patch if desired, split as a separate patch
for clarity.
---
 xen/arch/x86/hvm/io.c             |  5 ---
 xen/arch/x86/include/asm/hvm/io.h |  3 --
 xen/arch/x86/include/asm/setup.h  |  1 -
 xen/arch/x86/setup.c              | 53 ++-----------------------------
 xen/arch/x86/tboot.c              |  2 +-
 5 files changed, 3 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index a42854c52b65..06283b41c463 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -364,11 +364,6 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
     return NULL;
 }
 
-bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
-{
-    return vpci_mmcfg_find(d, addr);
-}
-
 int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
 {
     const struct hvm_mmcfg *mmcfg;
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index e1e5e6fe7491..24d1b6134f02 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -153,9 +153,6 @@ int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
 /* Destroy tracked MMCFG areas. */
 void destroy_vpci_mmcfg(struct domain *d);
 
-/* Check if an address is between a MMCFG region for a domain. */
-bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr);
-
 /* Remove MMCFG regions from a given rangeset. */
 int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index cd07d98101d8..1ced1299c77b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,7 +36,6 @@ unsigned long initial_images_nrpages(nodeid_t node);
 void discard_initial_images(void);
 void *bootstrap_map(const module_t *mod);
 
-int xen_in_range(unsigned long mfn);
 int remove_xen_ranges(struct rangeset *r);
 
 extern uint8_t kbd_shift_flags;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 71fa0b46f181..7d2cb61a2a4a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1343,7 +1343,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         relocated = true;
 
         /*
-         * This needs to remain in sync with xen_in_range() and the
+         * This needs to remain in sync with remove_xen_ranges() and the
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
@@ -1495,7 +1495,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( using_2M_mapping() )
         efi_boot_mem_unused(NULL, NULL);
 
-    /* This needs to remain in sync with xen_in_range(). */
+    /* This needs to remain in sync with remove_xen_ranges(). */
     if ( efi_boot_mem_unused(&eb_start, &eb_end) )
     {
         reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
@@ -2087,55 +2087,6 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
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
 int __hwdom_init remove_xen_ranges(struct rangeset *r)
 {
     paddr_t start, end;
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 86c4c22cacb8..4c254b4e34b4 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -321,7 +321,7 @@ void tboot_shutdown(uint32_t shutdown_type)
 
         /*
          * Xen regions for tboot to MAC. This needs to remain in sync with
-         * xen_in_range().
+         * remove_xen_ranges().
          */
         g_tboot_shared->num_mac_regions = 3;
         /* S3 resume code (and other real mode trampoline code) */
-- 
2.43.0


