Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B075EACBA72
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 19:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003739.1383342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-00049V-Dq; Mon, 02 Jun 2025 17:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003739.1383342; Mon, 02 Jun 2025 17:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-00047w-7q; Mon, 02 Jun 2025 17:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1003739;
 Mon, 02 Jun 2025 17:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM9Ew-00044r-IV
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 17:46:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b13329-3fd9-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 19:46:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so41370835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 10:46:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f0097539sm15997416f8f.63.2025.06.02.10.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:46:23 -0700 (PDT)
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
X-Inumbo-ID: 80b13329-3fd9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748886384; x=1749491184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9VfFp7KStC3qDdOP/ZlcW7W//yetvsaldEN92b/Svg=;
        b=WFfNUm9BqVzzA/JjaLHRqcpOQp5St6dgqk4+o5s+325i6jkUJZEWhN4c8ZUv5fd/9b
         Cn7dWDjDakR05yh5KpajzYnLlP/co9FO1/2cScLGzQz4fVoUQb8bicYZFUCjAYCHvLPg
         dQJ3HdAr6ZJwn9OiqIjDlfgFhkVmUkCJ20p4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748886384; x=1749491184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9VfFp7KStC3qDdOP/ZlcW7W//yetvsaldEN92b/Svg=;
        b=HcAcsMXly4AaquLIzBuuAu9dvDOUPOp3Sdl8mU5a9Ftga3KIHEQerG9wZog3QCHtjv
         zmzzvQVhMEXrycE6r8sFtQuGXfhGzl9YZHk+SyyPxIVQrELi/lf3j4UsDRqi1ablyRYW
         jkN7L1MWEnp+W8ceLbeSQbPxp5cdje/bs0WAmOhRqm3AY3VDkFcZrhJqtnoE49S83ZwQ
         0l8tOnHj5jQk1PaDcex+bHtnb+/9LtR+U5HGF/dY3AASN4OOkqiHDq6Z01nsyvPFU9Yg
         YeeNsxBtxQi4MD9k9Z6W4uWu0rAIrVln2gCSal3T6SMJ46wZmHyQGTOHc92Pv1FxgvDW
         FRZw==
X-Gm-Message-State: AOJu0YxFl96xY+J8oPlDcBAMgT6hjAztoxopHSGOWa680hlFTRPe+XR5
	xTY7Dcb9bGFLCtth9Srlxl+jpgswDfWX+YCWWay6x/w+KmwCT5iHGRLtMwMq7pLiN76qkhsyBYN
	vb/gg
X-Gm-Gg: ASbGncsmhx2OTdV1YcHjUomFN4uPEIGt9J2BrFP1ovFoLKK18jMWRf79s82yXWHApxT
	p0zDgZXjcihE3kcgkosf9pod8JqpAJdQblQdldmoWjHHdX3LF0cOXQyBF+aRAJuCHg8JTFyXTuI
	qno36zErUHyJJ9sAJ0zA4dUYIF6Pnr5SUhBJ0ZFoUd9oKCzawp32xtN2w4TpjxzdKY8OVw0q/Je
	r9C/zwWf70P4Ba08GOWBMzsNoY7HGjKT/ZsJyvgbiFyht/zw6o7nqwmrwgSDywH6eWYiANO09qe
	JMh+rLNTeMyO6tsfDsTmn6b2B74wTItTZ7uNGtLCp+/A8LsTznsWN2e+RHjnrQWamE7AcS14I4y
	292iMBUKElhoAizFMXzr5FFubl7sRYeKV9CY=
X-Google-Smtp-Source: AGHT+IGuQ0VThV/yJUVdC3GCVEM3YobvqBbPkEGiEo1ShTS8wNLmy+vLpB1N2s8mmpGR6FXcpOJg8w==
X-Received: by 2002:a05:600c:5494:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-4511ecc2522mr71040995e9.11.1748886384117;
        Mon, 02 Jun 2025 10:46:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/2] CI: Use bash arrays to simplfy dom0 rootfs construction
Date: Mon,  2 Jun 2025 18:46:17 +0100
Message-Id: <20250602174618.2641439-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For Qubes, this requires switching from sh to bash.

This reduces the number of times the target filename needs to be written to 1.

Expand the comment to explain the concatination constraints.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Use dom0_rootfs_extra_{un,}comp arrays
---
 automation/scripts/qubes-x86-64.sh            | 18 ++++++++++++-----
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 20 ++++++++++++-------
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 8e86940c6eff..5ec6eff6c469 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 set -ex -o pipefail
 
@@ -22,6 +22,8 @@ domU_type="pvh"
 domU_vif="'bridge=xenbr0',"
 domU_extra_config=
 retrieve_xml=
+dom0_rootfs_extra_comp=()
+dom0_rootfs_extra_uncomp=()
 
 case "${test_variant}" in
     ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
@@ -187,10 +189,16 @@ Kernel \r on an \m (\l)
     rm -rf rootfs
 fi
 
-# Dom0 rootfs
-cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
-cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
+# Dom0 rootfs.  The order or concatination is important; ucode wants to come
+# first, and all uncompressed must be ahead of compressed.
+dom0_rootfs_parts=(
+    binaries/ucode.cpio
+    "${dom0_rootfs_extra_uncomp[@]}"
+    binaries/rootfs.cpio.gz
+    binaries/xen-tools.cpio.gz
+    "${dom0_rootfs_extra_comp[@]}"
+)
+cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 8f02fa73bd06..45121f39400a 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -28,6 +28,8 @@ extra = "root=/dev/ram0 console=hvc0"
 memory = 512
 '
 DOMU_CFG_EXTRA=""
+dom0_rootfs_extra_comp=()
+dom0_rootfs_extra_uncomp=()
 
 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -71,6 +73,7 @@ do
   sleep 1
 done | argo-exec -p 28333 -d 0 -- /bin/echo
 "
+    dom0_rootfs_extra_comp+=(binaries/argo.cpio.gz)
     DOM0_CMD="
 insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
 xl -vvv create /etc/xen/domU.cfg
@@ -103,13 +106,16 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
-# Dom0 rootfs
-cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
-cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-if [[ "${TEST}" == argo ]]; then
-    cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-fi
+# Dom0 rootfs.  The order or concatination is important; ucode wants to come
+# first, and all uncompressed must be ahead of compressed.
+dom0_rootfs_parts=(
+    binaries/ucode.cpio
+    "${dom0_rootfs_extra_uncomp[@]}"
+    binaries/rootfs.cpio.gz
+    binaries/xen-tools.cpio.gz
+    "${dom0_rootfs_extra_comp[@]}"
+)
+cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
-- 
2.39.5


