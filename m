Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0D802F00
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646681.1009245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tz-0004on-BS; Mon, 04 Dec 2023 09:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646681.1009245; Mon, 04 Dec 2023 09:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tz-0004ih-5W; Mon, 04 Dec 2023 09:43:19 +0000
Received: by outflank-mailman (input) for mailman id 646681;
 Mon, 04 Dec 2023 09:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Tx-0003MS-VT
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c9171d0-9289-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:43:16 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso1602431f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:16 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d7-20020a05600c3ac700b0040b632f31d2sm9370573wms.5.2023.12.04.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:15 -0800 (PST)
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
X-Inumbo-ID: 8c9171d0-9289-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682995; x=1702287795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxD/xIKIZNY1Gd+udPylENsx3szHutH/fapKCoFaITg=;
        b=c2MH7ZNoZwZP90Z0dFD7stBvxBoFVPXHD6/Og9rfg9Liw/LCOcK/sCf9/fElYytCJM
         /j+1NcTZWl1LpFCGtEJZiWEeudoVF/Bt04vaCzwGvj+n2b3zAw44qncXT4JS/dcmjJ1K
         MdabpxhRJOzxQim1NImjhz4W0XcdS8VGvlW6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682995; x=1702287795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxD/xIKIZNY1Gd+udPylENsx3szHutH/fapKCoFaITg=;
        b=uuLidUkhjCofsJ0olzK9orfEDV63CKBETbo9ByRkV4CpagEldXJEO3jukHP10nVI4q
         TK9tdKmlTX/Tc+r7xJSMu8IazHr0RabdR7MZ/y+vKZIv9ZzD/JjzY/j38f3SjNQpn+gY
         i3tLbvw5Ph9HuLMvtWcVn5LQqpiYo0Wnv+xMr6Z4h1zKBV+KjzDuogJuv9U5pJSOe99g
         fc/HmquB/zs7OOHId3QNcuvpRHRHuGZEtD21PrZZ4KEzocdN6NGiKDrrYh7S+VUqFYW3
         fQbNU44OaRwEyPo3IqkJ/14Oz+6U/6ypEQy84rS17Ye7kg+ZzAWPSWR9PdqloCKDsMvE
         hKbA==
X-Gm-Message-State: AOJu0YwwwmDt9Maeir1irNkq8xVT1S1DDEhK1s6r79ut1KdhFUX9tBs+
	x5okhmBbx5s2wLJ8UuDsyDoxwAhiVJrvU1BpPgo=
X-Google-Smtp-Source: AGHT+IHC4vfktUCR6jsvd+9qQfs94hYFg8QP5pZ0Uo7toZQiieUuEjnP32WLZ2tIqVAz6IBf96RBXQ==
X-Received: by 2002:a05:600c:181c:b0:40b:5e59:b7af with SMTP id n28-20020a05600c181c00b0040b5e59b7afmr2209866wmp.140.1701682995478;
        Mon, 04 Dec 2023 01:43:15 -0800 (PST)
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
Subject: [PATCH v2 6/6] x86/iommu: cleanup unused functions
Date: Mon,  4 Dec 2023 10:43:05 +0100
Message-ID: <20231204094305.59267-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204094305.59267-1-roger.pau@citrix.com>
References: <20231204094305.59267-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.

Adjust comments to point to the new functions that replace the existing ones.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Can be squashed with the previous patch if desired, split as a separate patch
for clarity.
---
 xen/arch/x86/include/asm/hvm/io.h |  3 --
 xen/arch/x86/include/asm/setup.h  |  1 -
 xen/arch/x86/setup.c              | 53 ++-----------------------------
 xen/arch/x86/tboot.c              |  2 +-
 4 files changed, 3 insertions(+), 56 deletions(-)

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


