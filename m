Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDB5B1C33
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403281.645341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGJp-0000Xr-GN; Thu, 08 Sep 2022 12:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403281.645341; Thu, 08 Sep 2022 12:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGJp-0000Uq-DT; Thu, 08 Sep 2022 12:07:41 +0000
Received: by outflank-mailman (input) for mailman id 403281;
 Thu, 08 Sep 2022 12:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWGJn-0000Uk-CT
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:07:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d4a13726-2f6e-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 14:07:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE54214BF;
 Thu,  8 Sep 2022 05:07:43 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53A653F71A;
 Thu,  8 Sep 2022 05:07:35 -0700 (PDT)
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
X-Inumbo-ID: d4a13726-2f6e-11ed-a31c-8f8a9ae3403f
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] docs/device-tree: Place the static-heap dt-binding in proper place
Date: Thu,  8 Sep 2022 12:07:28 +0000
Message-Id: <20220908120728.8290-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The static-heap dt-binding should be placed after the last feature,
namely static-evtchn.

Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 86 +++++++++++++--------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5395a1077c..93bf6fe577 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -425,49 +425,6 @@ The static event channel node has the following properties:
     link-to-foreign-evtchn is a single phandle to a remote evtchn to which
     local-evtchn will be connected.
 
-Static Heap Memory
-==================
-
-The static heap memory refers to parts of RAM reserved in the beginning of
-boot time for heap. The memory is reserved by configuration in the device
-tree using physical address ranges.
-
-The static heap memory declared in the device tree defines the memory areas
-that will be reserved to be used exclusively as heap.
-
-- For Arm32, since there are separated heaps, the static heap will be used
-for both domheap and xenheap. The admin should make sure that the static
-heap region should contain enough memory below 4GB to cater 32-bit DMA.
-
-- For Arm64, since there is a single heap, the defined static heap areas
-shall always go to the heap allocator.
-
-The static heap memory is an optional feature and can be enabled by adding
-below device tree property.
-
-- xen,static-heap
-
-    Property under the top-level "chosen" node. It specifies the address
-    and size of Xen static heap memory. Number of address and size cells
-    for the "xen,static-heap" property is determined by the root node
-    "#address-cells" and "#size-cells". Note that at least a 64KB alignment
-    is required.
-
-Below is an example on how to specify the static heap in device tree:
-
-    / {
-        #address-cells = <0x2>;
-        #size-cells = <0x2>;
-        ...
-        chosen {
-            xen,static-heap = <0x0 0x30000000 0x0 0x40000000>;
-            ...
-        };
-    };
-
-RAM starting from the host physical address 0x30000000 of 1GB size will
-be reserved as static heap.
-
 Example
 =======
 
@@ -523,3 +480,46 @@ chosen {
         };
     };
 };
+
+Static Heap Memory
+==================
+
+The static heap memory refers to parts of RAM reserved in the beginning of
+boot time for heap. The memory is reserved by configuration in the device
+tree using physical address ranges.
+
+The static heap memory declared in the device tree defines the memory areas
+that will be reserved to be used exclusively as heap.
+
+- For Arm32, since there are separated heaps, the static heap will be used
+for both domheap and xenheap. The admin should make sure that the static
+heap region should contain enough memory below 4GB to cater 32-bit DMA.
+
+- For Arm64, since there is a single heap, the defined static heap areas
+shall always go to the heap allocator.
+
+The static heap memory is an optional feature and can be enabled by adding
+below device tree property.
+
+- xen,static-heap
+
+    Property under the top-level "chosen" node. It specifies the address
+    and size of Xen static heap memory. Number of address and size cells
+    for the "xen,static-heap" property is determined by the root node
+    "#address-cells" and "#size-cells". Note that at least a 64KB alignment
+    is required.
+
+Below is an example on how to specify the static heap in device tree:
+
+    / {
+        #address-cells = <0x2>;
+        #size-cells = <0x2>;
+        ...
+        chosen {
+            xen,static-heap = <0x0 0x30000000 0x0 0x40000000>;
+            ...
+        };
+    };
+
+RAM starting from the host physical address 0x30000000 of 1GB size will
+be reserved as static heap.
-- 
2.17.1


