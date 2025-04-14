Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B091A87E81
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949716.1346243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgi-0001tN-4y; Mon, 14 Apr 2025 11:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949716.1346243; Mon, 14 Apr 2025 11:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgi-0001ph-0z; Mon, 14 Apr 2025 11:09:16 +0000
Received: by outflank-mailman (input) for mailman id 949716;
 Mon, 14 Apr 2025 11:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hgg-0000MT-EG
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e556f221-1920-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:09:12 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so3244828f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:11 -0700 (PDT)
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
X-Inumbo-ID: e556f221-1920-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628952; x=1745233752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEagS0fgW08lXFE5KITuwG+96XL/PoduvFNAXAg+C84=;
        b=W3YsaCBNdUtOC/Z24z9X+rwO0FAHkqUPVDvyH+imojakKykAb9lO229uoPOnIlMkU+
         B9vIH0YBK9rN/KgofhP9setHEpnLGxKdxXU8JQDPKWpSLBwSirXZf5H0+7t6eF0XyJzR
         9bbb+GCn2uoHqhUMrPDlUBFC034M2qS/5jBBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628952; x=1745233752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEagS0fgW08lXFE5KITuwG+96XL/PoduvFNAXAg+C84=;
        b=s0IpUSoWmVxEda6mSYnj9JJk+cBcjP+pgoVAc2kD68iWpVoEsiRymQTylFQ/E+Gyde
         odnhOcS3SmPNV2gSBrTk2XGgphQv5e6FdKzyZnX4E6x7DpbKRxgLisqcy7/EIR8OLqpW
         7oImwDC1gTo26NEr3SrJQ6NspmUpSnA4LspPVb6DALXUS6coAy2AnWxq69Z5EnTvv80Z
         y2lJJdZRxH728A6UxNJPGxx8EBwsLvimjxPw7UISO3aKXKcFwXzSppoqKNDzX4G+bNRP
         luFAgfd0jIvyknRX3r8uvTGxg5/Mm7F0B0byxr9ZFeYkT2MN+pzyEBawRGmx8TIxk0WM
         tbYA==
X-Gm-Message-State: AOJu0YxWkGz4DLipFZeSGIJa0jg9SjggLDVWbm+otmfGiJFnH+VNyqdN
	Ta4dQj79hto72M+OVmlKybz2uvZU5TfQ1pL6L0Op6i+u2ULVGd3IJCK0jq8B4wHt1IIDnvDTrke
	bWUI=
X-Gm-Gg: ASbGncuAYKTsZ2dq1Ra/iUTIKgue22nesCOADLYS+rviUFdW7bPRVXLj1aDtZSVltjj
	DzWlBEsAusPwh7Co74Ygxn2Bvw9iIF/53p2Uy71mp+8MlxHmUg+BYblLEQf0uCBgWWcRFTh3q9v
	aNxS06EoPSOhMvwUyL79TEAgTYIndPpk+LQYWLnpqS5CGWsb7vgyEjUkKR3wUtyTX89oIVFLErz
	LQdeuZxgviaXPEx7gbBB0AhHBM9XjisT3WeDA4/dj+lR7i6mPgp0OVh79MgwDf2QQocU0dCR6OG
	U948sGPCHQh1el/+bx5EcYXPnBKfrj5r4EEKqh48R4YdwqUWou9fRsWlWzwcFOA0dZVF3Dxafg2
	XdhivnxhMjzRG6g==
X-Google-Smtp-Source: AGHT+IHqhiI94sSItJXNuhdApx+sOZ72wahpooTvttJ5PFefRV8bjzL81523dZ8IAeMFWNO84vjWgQ==
X-Received: by 2002:a05:6000:401f:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39eaaed1ebbmr9018066f8f.49.1744628951981;
        Mon, 14 Apr 2025 04:09:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 6/6] CI: Include microcode for x86 hardware jobs
Date: Mon, 14 Apr 2025 12:09:03 +0100
Message-Id: <20250414110903.2355303-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All the x86 hardware runners are out of date, to varying degrees, in terms of
microcode.

Microcode must be uncompressed and prepended to the initrd in order for Xen to
be able to use it during early boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v3:
 * New

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1766187024
---
 automation/gitlab-ci/build.yaml                | 1 +
 automation/gitlab-ci/test.yaml                 | 6 ++++++
 automation/scripts/qubes-x86-64.sh             | 3 ++-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 3 ++-
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1b82b359d01f..ac5367874526 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -306,6 +306,7 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
+      CONFIG_UCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
 debian-12-x86_64-gcc-debug:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d46da1c43d05..ef17def0120a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -26,6 +26,9 @@
   - project: xen-project/hardware/test-artifacts
     job: alpine-3.18-x86_64-rootfs
     ref: master
+  - project: xen-project/hardware/test-artifacts
+    job: microcode-x86_64
+    ref: master
 
 .qemu-arm64:
   extends: .test-jobs-common
@@ -250,6 +253,9 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
     - project: xen-project/hardware/test-artifacts
       job: x86_64-argo-linux-6.6.56
       ref: master
+    - project: xen-project/hardware/test-artifacts
+      job: microcode-x86_64
+      ref: master
 
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 3947027d6e4d..1f90e7002c73 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -188,7 +188,8 @@ Kernel \r on an \m (\l)
 fi
 
 # Dom0 rootfs
-cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
+cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 
 # test-local configuration
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 1f8cc172c630..5bb44188dc3d 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -106,7 +106,8 @@ cd ..
 rm -rf rootfs
 
 # Dom0 rootfs
-cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
+cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
 if [[ "${TEST}" == argo ]]; then
     cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
-- 
2.39.5


