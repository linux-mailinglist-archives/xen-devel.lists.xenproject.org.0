Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5781A013
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657808.1026960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws8-0004mJ-4K; Wed, 20 Dec 2023 13:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657808.1026960; Wed, 20 Dec 2023 13:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws7-0004eC-Ug; Wed, 20 Dec 2023 13:44:27 +0000
Received: by outflank-mailman (input) for mailman id 657808;
 Wed, 20 Dec 2023 13:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFws6-0003Gg-OR
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:44:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e73017-9f3d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 14:44:26 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so4697155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:44:26 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040d2e37c06dsm5317599wmn.20.2023.12.20.05.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:44:25 -0800 (PST)
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
X-Inumbo-ID: e3e73017-9f3d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703079865; x=1703684665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAlY4C0HQDzoSCwoi4E+eaPx6lrWU2JEHIBeS4B9AY0=;
        b=heQerYOhOz4OM30QeMY6cHkbgQU+ZdI01c025Be68wn0jB3Xa0Zf4rfHO9UNWHCo7S
         f7u21pUTPQepdolqQ1b/GPBYNdCozaIukFHOHmv/PWINBLx+YKcgAUTQaBOfoj6muOAt
         o4KeSV4tGt81l0aewnY93sQhVf5qA3343oG9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079865; x=1703684665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAlY4C0HQDzoSCwoi4E+eaPx6lrWU2JEHIBeS4B9AY0=;
        b=dvYmi2DORn3Mmk7gnRUWCCJ+xmKjxUgt8ScjdlBe8zkbOXR7aGP9bcSw7UTMEt94ky
         lrqeIQcYXNbkPKvi2NAjLT6E6WFnXiJBYX2ySRy1AcPLXVswmx35kOGKY5Wmw4PsU7+z
         aI65s4jnCE5lbK4Q0Abn/BAxfdWsNLnKZIP/Goh9eAae354ocSlPIS/oF7yGSa1LotR7
         IOSM0+9PP3MJwjrgOsaJP1MX8/rh4l14xY78+0BLj2XZ5KGizovTAAC/UBUe0bx1sc7q
         PFOBMMne2WE5QR4z9g0X5k3M9QTRLkqw6a9nXGNHeS7PjY+P7n2kWsd9NNE8UC8l+Lo+
         YE8w==
X-Gm-Message-State: AOJu0YyB3WFjra5RksFxWZdpgmbG9U7/mYPwbGzzfzGCgjlPE6heF0VL
	THD4SolOLoquhloycOKAhCVV2bW4riO/Cs8jm8o=
X-Google-Smtp-Source: AGHT+IGE7T54g7A2QSyHEI437s+5UNPHgj+iWpog6Qs0TeFPOUp+WcO4VvQ6OQFeiPX9ikmthQgmwQ==
X-Received: by 2002:a7b:c409:0:b0:40b:5e26:236e with SMTP id k9-20020a7bc409000000b0040b5e26236emr1629550wmi.31.1703079865538;
        Wed, 20 Dec 2023 05:44:25 -0800 (PST)
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
Subject: [PATCH v4 6/6] x86/iommu: cleanup unused functions
Date: Wed, 20 Dec 2023 14:43:46 +0100
Message-ID: <20231220134346.22430-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
References: <20231220134346.22430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.

Adjust comments to point to the new functions that replace the existing ones.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index ba6fe9afe5e6..f52fc3f63cb0 100644
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
@@ -2089,55 +2089,6 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
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


