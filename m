Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7AC6A7A9D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504323.776971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXapz-00067x-O6; Thu, 02 Mar 2023 04:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504323.776971; Thu, 02 Mar 2023 04:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXapz-00064N-K0; Thu, 02 Mar 2023 04:46:39 +0000
Received: by outflank-mailman (input) for mailman id 504323;
 Thu, 02 Mar 2023 04:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXapx-0004UF-VL
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:46:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 372bf543-b8b5-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 05:46:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17E131FB;
 Wed,  1 Mar 2023 20:47:20 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BC4C3F99C;
 Wed,  1 Mar 2023 20:46:34 -0800 (PST)
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
X-Inumbo-ID: 372bf543-b8b5-11ed-96a9-2f268f93b82a
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for static heap
Date: Thu,  2 Mar 2023 04:46:05 +0000
Message-Id: <20230302044606.136130-2-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302044606.136130-1-jiamei.xie@arm.com>
References: <20230302044606.136130-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiamei Xie <jiamei.xie@arm.com>

Add a new config parameter to configure static heap.
STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
if specified, indicates the host physical address regions
[baseaddr, baseaddr + size) to be reserved as static heap.

For instance, STATIC_HEAP="0x50000000 0x30000000", if specified,
indicates the host memory region starting from paddr 0x50000000
with a size of 0x30000000 to be reserved as static heap.

Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
---
 README.md                |  4 ++++
 scripts/uboot-script-gen | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/README.md b/README.md
index 814a004..787f413 100644
--- a/README.md
+++ b/README.md
@@ -256,6 +256,10 @@ Where:
 
 - NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
 
+- STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
+  if specified, indicates the host physical address regions
+  [baseaddr, baseaddr + size) to be reserved as static heap.
+
 Then you can invoke uboot-script-gen as follows:
 
 ```
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f07e334..4775293 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -189,6 +189,21 @@ function add_device_tree_static_mem()
     dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
 }
 
+function add_device_tree_static_heap()
+{
+    local path=$1
+    local regions=$2
+    local cells=()
+    local val
+
+    for val in ${regions[@]}
+    do
+        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
+    done
+
+    dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
+}
+
 function add_device_tree_cpupools()
 {
     local cpu
@@ -344,6 +359,11 @@ function xen_device_tree_editing()
     then
         add_device_tree_cpupools
     fi
+
+    if test "${STATIC_HEAP}"
+    then
+        add_device_tree_static_heap "/chosen" "${STATIC_HEAP}"
+    fi
 }
 
 function linux_device_tree_editing()
-- 
2.25.1


