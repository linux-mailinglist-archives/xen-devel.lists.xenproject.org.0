Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A1AC1234
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 19:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994482.1377480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qb-00046S-JM; Thu, 22 May 2025 17:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994482.1377480; Thu, 22 May 2025 17:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qb-000432-Eb; Thu, 22 May 2025 17:36:49 +0000
Received: by outflank-mailman (input) for mailman id 994482;
 Thu, 22 May 2025 17:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI9qZ-0003ZZ-Ll
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 17:36:47 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553117a6-3733-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 19:36:46 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-601c5cd15ecso7805412a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:36:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm1116063366b.103.2025.05.22.10.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 10:36:44 -0700 (PDT)
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
X-Inumbo-ID: 553117a6-3733-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747935405; x=1748540205; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZadyQ1dGPInWsa7+i4u+dOHgUQQBDu0QP3e67vZGDBU=;
        b=c++HdavcNLa4vAnsAAM3dvr6ZZhMV1YwVBErgoWrRvNvYpDwfjYAQjmGI6RXPOf6ct
         K4aQm8DROpMIW0aZybfusnKDrWTOrxUd/3eNOV3gvK2AFZCrGFfpicViUyZ50BC0oLnx
         qoQPHzcOQr2O/yeFWAEQlCrUQLgo9ks5P5Tiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935405; x=1748540205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZadyQ1dGPInWsa7+i4u+dOHgUQQBDu0QP3e67vZGDBU=;
        b=tyRsjiovXxbodeqq2EUfDQQTuEBH6T00/D1Gf0Jzn5T5kBc7sFaVw6cxD/fqS5YnhO
         j9Ef3WfI4DA9vnF0CizEi74+J1sGKfIcJdw1O7wdx/LZkn1JhN29oojfQNbQ0lXnFZIs
         VzS91rXulXfTWPgnFoYKm7wdoD5I05m5YV9Bi6Sv0UyJCMSnVilM8kx1l2QKWBkR+UdT
         9x4Oicll4CpDPeCHySdVb5kw1wHDcTEVCp9Wh+spPk32PWzH2v51QpSihJG+8tDUNSF+
         6wkNexzHlOhe8VnjFFmEcDD0dK1gkGIjcu1GvL876+AkZFe8tPckExTdQ2F6tLBg1wEe
         nl+A==
X-Gm-Message-State: AOJu0YwhXRauIP8om0yV7ddPzEQLWxmvA9mDVEz8wk1NMYXVxLYR7x/j
	ufIdqZxvgQx/5CcdE76j1SyLpATmyWVTzl5/UbSNBuHgkogV20Q92h0VgTRq1pEuUI8FeP4bQ7j
	TQ3Em
X-Gm-Gg: ASbGncvKZUnRGLu3+LymNOQyp0eugyEpKQW6dL5QxnzBdxIP8HRDx/X9OWoZoxW15hm
	B2nWUt+BYoKMsXAv7GDgqBxpDc7kvG7JCd9T7YnjoXGmwbhLB8mbmN5zGhQYy1DFJIyiwGshKO2
	AEzHqFQ8+p3+INAH2O47NeQXJMR7hO7f9s6l3HnuXfnUjrgU/ZH2G/415ZsnoqhWR/rHbTIehx9
	RJ2SM54TUFTIvnoQpMMadocOpNRndqcVwQZjoC7oFSj+ARR161u1pHyiEwz/mgnY/YfIeuYxMRl
	GvJAZMZb2KPYbzhAVQgsfNyZ817XZyA1fZwqQ2KtuE3t6DOVTa6cQx9P6SfWyRoHrrQJClz2hjD
	9P/dLJWXtTPzir+3D9Eweh9w/bD0L2jIEN5Q=
X-Google-Smtp-Source: AGHT+IGpajxmUsPPYguIJRowQVROWmkBbc6c75BLnT1q+SBw/DEbc5kCmLDo8Qb2Z9sBZzuuh/yIBw==
X-Received: by 2002:a17:907:96a1:b0:ad2:3f54:1834 with SMTP id a640c23a62f3a-ad536dce664mr2444664566b.40.1747935405312;
        Thu, 22 May 2025 10:36:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs construction
Date: Thu, 22 May 2025 18:36:39 +0100
Message-Id: <20250522173640.575452-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522173640.575452-1-andrew.cooper3@citrix.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
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

I would like to find a slightly nicer way of conditional parts, but nothing
comes to mind.
---
 automation/scripts/qubes-x86-64.sh             | 14 +++++++++-----
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 16 +++++++++-------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 10af274a0ba7..1dd3f48b3d29 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 set -ex -o pipefail
 
@@ -187,10 +187,14 @@ Kernel \r on an \m (\l)
     rm -rf rootfs
 fi
 
-# Dom0 rootfs
-cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
-cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
+# Dom0 rootfs.  The order or concatination is important; ucode wants to come
+# first, and all uncompressed must be ahead of compressed.
+parts=(
+    binaries/ucode.cpio
+    binaries/rootfs.cpio.gz
+    binaries/xen-tools.cpio.gz
+)
+cat "${parts[@]}" > binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 8f02fa73bd06..0fbabb41054a 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -103,13 +103,15 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
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
+parts=(
+    binaries/ucode.cpio
+    binaries/rootfs.cpio.gz
+    binaries/xen-tools.cpio.gz
+)
+[[ "${TEST}" == argo ]] && parts+=(binaries/argo.cpio.gz)
+cat "${parts[@]}" > binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
 mkdir -p rootfs
-- 
2.39.5


