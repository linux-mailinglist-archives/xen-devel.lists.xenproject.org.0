Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC1279C82
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 22:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMHEt-0003k4-6G; Sat, 26 Sep 2020 20:56:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMHEs-0003jG-1J
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 20:56:14 +0000
X-Inumbo-ID: 32ccde0f-bd5f-4a94-82cc-189a6a8efc4a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32ccde0f-bd5f-4a94-82cc-189a6a8efc4a;
 Sat, 26 Sep 2020 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=jcmiVe5RuWiItP2oy4PwdbYtzFeVBgjJGWBjlKbiLh0=; b=s824IM09TYDwfgSKrtSyO3Nr7
 kc7/aYhHrzvf1/s8/+IN7qxGmP4G91pBfsMEAEcOyGq6c7dBpodutNnOjHErzvWj2xb6FK1wCRyJ3
 nBVmZMfajRRNBvTBIMczc/Ssej3uKLUluMq5cxoJbHMvwKUufrtEFTHmHJhEUFMQtFJ5Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEn-0000Ch-0e; Sat, 26 Sep 2020 20:56:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEm-0004I0-N6; Sat, 26 Sep 2020 20:56:08 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/4] xen/arm: Introduce fw_unreserved_regions() and use it
Date: Sat, 26 Sep 2020 21:55:42 +0100
Message-Id: <20200926205542.9261-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926205542.9261-1-julien@xen.org>
References: <20200926205542.9261-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Since commit 6e3e77120378 "xen/arm: setup: Relocate the Device-Tree
later on in the boot", the device-tree will not be kept mapped when
using ACPI.

However, a few places are calling dt_unreserved_regions() which expects
a valid DT. This will lead to a crash.

As the DT should not be used for ACPI (other than for detecting the
modules), a new function fw_unreserved_regions() is introduced.

It will behave the same way on DT system. On ACPI system, it will
unreserve the whole region.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Is there any region we should exclude on ACPI?
---
 xen/arch/arm/kernel.c       |  2 +-
 xen/arch/arm/setup.c        | 22 +++++++++++++++++-----
 xen/include/asm-arm/setup.h |  2 +-
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 032923853f2c..ab78689ed2a6 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -307,7 +307,7 @@ static __init int kernel_decompress(struct bootmodule *mod)
      * Free the original kernel, update the pointers to the
      * decompressed kernel
      */
-    dt_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
 
     return 0;
 }
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 35e5bee04efa..7fcff9af2a7e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -196,8 +196,9 @@ static void __init processor_id(void)
     processor_setup();
 }
 
-void __init dt_unreserved_regions(paddr_t s, paddr_t e,
-                                  void (*cb)(paddr_t, paddr_t), int first)
+static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
+                                         void (*cb)(paddr_t, paddr_t),
+                                         int first)
 {
     int i, nr = fdt_num_mem_rsv(device_tree_flattened);
 
@@ -244,6 +245,17 @@ void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     cb(s, e);
 }
 
+void __init fw_unreserved_regions(paddr_t s, paddr_t e,
+                                  void (*cb)(paddr_t, paddr_t), int first)
+{
+    if ( acpi_disabled )
+        dt_unreserved_regions(s, e, cb, first);
+    else
+        cb(s, e);
+}
+
+
+
 struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                                           paddr_t start, paddr_t size,
                                           bool domU)
@@ -405,7 +417,7 @@ void __init discard_initial_modules(void)
              !mfn_valid(maddr_to_mfn(e)) )
             continue;
 
-        dt_unreserved_regions(s, e, init_domheap_pages, 0);
+        fw_unreserved_regions(s, e, init_domheap_pages, 0);
     }
 
     mi->nr_mods = 0;
@@ -712,7 +724,7 @@ static void __init setup_mm(void)
                 n = mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages));
             }
 
-            dt_unreserved_regions(s, e, init_boot_pages, 0);
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
 
             s = n;
         }
@@ -765,7 +777,7 @@ static void __init setup_mm(void)
             if ( e > bank_end )
                 e = bank_end;
 
-            dt_unreserved_regions(s, e, init_boot_pages, 0);
+            fw_unreserved_regions(s, e, init_boot_pages, 0);
             s = n;
         }
     }
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 2f8f24e286ed..34df23247b87 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -96,7 +96,7 @@ int construct_dom0(struct domain *d);
 void create_domUs(void);
 
 void discard_initial_modules(void);
-void dt_unreserved_regions(paddr_t s, paddr_t e,
+void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t, paddr_t), int first);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-- 
2.17.1


