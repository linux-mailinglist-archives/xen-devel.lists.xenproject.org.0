Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FF297293
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11093.29429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCq-00023x-55; Fri, 23 Oct 2020 15:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11093.29429; Fri, 23 Oct 2020 15:42:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCq-000236-0V; Fri, 23 Oct 2020 15:42:16 +0000
Received: by outflank-mailman (input) for mailman id 11093;
 Fri, 23 Oct 2020 15:42:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCo-0001sI-11
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db9169e1-10ff-4b6d-9589-f36f9e8684c5;
 Fri, 23 Oct 2020 15:42:10 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCj-0006qo-SC; Fri, 23 Oct 2020 15:42:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCj-0007wb-IJ; Fri, 23 Oct 2020 15:42:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCo-0001sI-11
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:14 +0000
X-Inumbo-ID: db9169e1-10ff-4b6d-9589-f36f9e8684c5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id db9169e1-10ff-4b6d-9589-f36f9e8684c5;
	Fri, 23 Oct 2020 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=xtMpaYLn6G5WzirrAmp6ZgVW0jgej4JPXWVQTvLzkCo=; b=4IiEUZqsbsyOdS75K5/AVt7sW
	d4Q6IqmGbH8LriIHX2DeilsKgbwamOXU4sh/VLRB1onAOqLIG51TLQlaCaz1f29JfuclM1gPzSIET
	+lkNoBi4N/VJzh8IUCPeqRBxvAd7T+LT461M1c/Jg/f4EOgc4iawB2NUP3e2aYskdojLI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCj-0006qo-SC; Fri, 23 Oct 2020 15:42:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCj-0007wb-IJ; Fri, 23 Oct 2020 15:42:09 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/7] xen/arm: Introduce fw_unreserved_regions() and use it
Date: Fri, 23 Oct 2020 16:41:53 +0100
Message-Id: <20201023154156.6593-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

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

Take the opportunity to clarify that bootinfo.reserved_mem is only used
when booting using Device-Tree.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Is there any region we should exclude on ACPI?

    Changes in v2:
        - Add a comment on top of bootinfo.reserved_mem.
---
 xen/arch/arm/kernel.c       |  2 +-
 xen/arch/arm/setup.c        | 22 +++++++++++++++++-----
 xen/include/asm-arm/setup.h |  3 ++-
 3 files changed, 20 insertions(+), 7 deletions(-)

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
index 2f8f24e286ed..28bf622aa196 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -67,6 +67,7 @@ struct bootcmdlines {
 
 struct bootinfo {
     struct meminfo mem;
+    /* The reserved regions are only used when booting using Device-Tree */
     struct meminfo reserved_mem;
     struct bootmodules modules;
     struct bootcmdlines cmdlines;
@@ -96,7 +97,7 @@ int construct_dom0(struct domain *d);
 void create_domUs(void);
 
 void discard_initial_modules(void);
-void dt_unreserved_regions(paddr_t s, paddr_t e,
+void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t, paddr_t), int first);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
-- 
2.17.1


