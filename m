Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6F6C0A9B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 07:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511723.790904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe900-0001Um-3p; Mon, 20 Mar 2023 06:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511723.790904; Mon, 20 Mar 2023 06:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe8zz-0001RD-Vd; Mon, 20 Mar 2023 06:28:03 +0000
Received: by outflank-mailman (input) for mailman id 511723;
 Mon, 20 Mar 2023 06:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbMo=7M=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pe8zz-0001QZ-3U
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 06:28:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5bbda8c1-c6e8-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 07:27:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3D1FEC;
 Sun, 19 Mar 2023 23:28:42 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBEAF3F885;
 Sun, 19 Mar 2023 23:27:56 -0700 (PDT)
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
X-Inumbo-ID: 5bbda8c1-c6e8-11ed-b464-930f4c7d94ae
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder][PATCH v3 1/2] uboot-script-gen: Add XEN_STATIC_HEAP
Date: Mon, 20 Mar 2023 06:27:17 +0000
Message-Id: <20230320062718.365896-2-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320062718.365896-1-jiamei.xie@arm.com>
References: <20230320062718.365896-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiamei Xie <jiamei.xie@arm.com>

Add a new config parameter to configure Xen static heap.
XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
if specified, indicates the host physical address regions
[baseaddr, baseaddr + size) to be reserved as Xen static heap.

For instance, XEN_STATIC_HEAP="0x50000000 0x30000000", if specified,
indicates the host memory region starting from paddr 0x50000000
with a size of 0x30000000 to be reserved as static heap.

Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from v1 to v2:
 - add Reviewed-by and Acked-by
Changes from v1:
 - Rename STATIC_HEAP to XEN_STATIC_HEAP and move it right after
   XEN_CMD documentation.
 - Use split_value function instead of opencoding it.
---
 README.md                |  4 ++++
 scripts/uboot-script-gen | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/README.md b/README.md
index 814a004..78b83f1 100644
--- a/README.md
+++ b/README.md
@@ -97,6 +97,10 @@ Where:
 - XEN_CMD specifies the command line arguments used for Xen.  If not
   set, the default one will be used.
 
+- XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
+  if specified, indicates the host physical address regions
+  [baseaddr, baseaddr + size) to be reserved as Xen static heap.
+
 - PASSTHROUGH_DTS_REPO specifies the git repository and/or the directory
   which contains the partial device trees. This is optional. However, if
   this is specified, then DOMU_PASSTHROUGH_PATHS[number] need to be specified.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f07e334..cca3e59 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -189,6 +189,21 @@ function add_device_tree_static_mem()
     dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
 }
 
+function add_device_tree_xen_static_heap()
+{
+    local path=$1
+    local regions=$2
+    local cells=()
+    local val
+
+    for val in ${regions[@]}
+    do
+        cells+=("$(split_value $val)")
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
+    if test "${XEN_STATIC_HEAP}"
+    then
+        add_device_tree_xen_static_heap "/chosen" "${XEN_STATIC_HEAP}"
+    fi
 }
 
 function linux_device_tree_editing()
-- 
2.25.1


