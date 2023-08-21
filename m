Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665C78221A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 06:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587212.918593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6m-0005n5-FC; Mon, 21 Aug 2023 04:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587212.918593; Mon, 21 Aug 2023 04:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6m-0005kT-BE; Mon, 21 Aug 2023 04:01:40 +0000
Received: by outflank-mailman (input) for mailman id 587212;
 Mon, 21 Aug 2023 04:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Scea=EG=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qXw6l-0003VX-5m
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 04:01:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6caa1f95-3fd7-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 06:01:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37E501FB;
 Sun, 20 Aug 2023 21:02:17 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C50573F7CE;
 Sun, 20 Aug 2023 21:01:33 -0700 (PDT)
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
X-Inumbo-ID: 6caa1f95-3fd7-11ee-9b0c-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 8/8] xen/docs: refine docs about static shared memory
Date: Mon, 21 Aug 2023 12:00:46 +0800
Message-Id: <20230821040046.2965665-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821040046.2965665-1-Penny.Zheng@arm.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit amends docs(docs/misc/arm/device-tree/booting.txt) to include the
new scenario where host address is not provided in "xen,shared-mem" property,
and we also add a new example to explain in detail.

We also fix some buggy info in the docs, like SHMID is "my-shared-mem-1",
not "0x1".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
- no new changes
---
v2 -> v3
- rebase and no change
---
 docs/misc/arm/device-tree/booting.txt | 52 ++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..ac4bad6fe5 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -590,7 +590,7 @@ communication.
     An array takes a physical address, which is the base address of the
     shared memory region in host physical address space, a size, and a guest
     physical address, as the target address of the mapping.
-    e.g. xen,shared-mem = < [host physical address] [guest address] [size] >
+    e.g. xen,shared-mem = < [host physical address] [guest address] [size] >;
 
     It shall also meet the following criteria:
     1) If the SHM ID matches with an existing region, the address range of the
@@ -601,8 +601,8 @@ communication.
     The number of cells for the host address (and size) is the same as the
     guest pseudo-physical address and they are inherited from the parent node.
 
-    Host physical address is optional, when missing Xen decides the location
-    (currently unimplemented).
+    Host physical address is optional, when missing Xen decides the location.
+    e.g. xen,shared-mem = < [guest address] [size] >;
 
 - role (Optional)
 
@@ -629,7 +629,7 @@ chosen {
         role = "owner";
         xen,shm-id = "my-shared-mem-0";
         xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
-    }
+    };
 
     domU1 {
         compatible = "xen,domain";
@@ -640,25 +640,36 @@ chosen {
         vpl011;
 
         /*
-         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
-         * is shared between Dom0 and DomU1.
+         * shared memory region "my-shared-mem-0" is shared
+         * between Dom0 and DomU1.
          */
         domU1-shared-mem@10000000 {
             compatible = "xen,domain-shared-memory-v1";
             role = "borrower";
             xen,shm-id = "my-shared-mem-0";
             xen,shared-mem = <0x10000000 0x50000000 0x10000000>;
-        }
+        };
 
         /*
-         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
-         * is shared between DomU1 and DomU2.
+         * shared memory region "my-shared-mem-1" is shared between
+         * DomU1 and DomU2.
          */
         domU1-shared-mem@50000000 {
             compatible = "xen,domain-shared-memory-v1";
             xen,shm-id = "my-shared-mem-1";
             xen,shared-mem = <0x50000000 0x60000000 0x20000000>;
-        }
+        };
+
+        /*
+         * shared memory region "my-shared-mem-2" is shared between
+         * DomU1 and DomU2.
+         */
+        domU1-shared-mem-2 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = "my-shared-mem-2";
+            role = "owner";
+            xen,shared-mem = <0x80000000 0x20000000>;
+        };
 
         ......
 
@@ -672,14 +683,21 @@ chosen {
         cpus = <1>;
 
         /*
-         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
-         * is shared between domU1 and domU2.
+         * shared memory region "my-shared-mem-1" is shared between
+         * domU1 and domU2.
          */
         domU2-shared-mem@50000000 {
             compatible = "xen,domain-shared-memory-v1";
             xen,shm-id = "my-shared-mem-1";
             xen,shared-mem = <0x50000000 0x70000000 0x20000000>;
-        }
+        };
+
+        domU2-shared-mem-2 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = "my-shared-mem-2";
+            role = "borrower";
+            xen,shared-mem = <0x90000000 0x20000000>;
+        };
 
         ......
     };
@@ -699,3 +717,11 @@ shared between DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest
 physical address space, and at 0x70000000 in DomU2 guest physical address space.
 DomU1 and DomU2 are both the borrower domain, the owner domain is the default
 owner domain DOMID_IO.
+
+For the static shared memory region "my-shared-mem-2", since host physical
+address is not provided by user, Xen will automatically allocate 512MB
+from heap as static shared memory to be shared between DomU1 and DomU2.
+The automatically allocated static shared memory will get mapped at
+0x80000000 in DomU1 guest physical address space, and at 0x90000000 in DomU2
+guest physical address space. DomU1 is explicitly defined as the owner domain,
+and DomU2 is the borrower domain.
-- 
2.25.1


