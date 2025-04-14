Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F6A87D60
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949558.1346098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtz-0006Tr-TA; Mon, 14 Apr 2025 10:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949558.1346098; Mon, 14 Apr 2025 10:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtz-0006PK-PD; Mon, 14 Apr 2025 10:18:55 +0000
Received: by outflank-mailman (input) for mailman id 949558;
 Mon, 14 Apr 2025 10:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gty-0005Nh-P5
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:54 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de1a3f6b-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:54 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso2429491f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:54 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:52 -0700 (PDT)
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
X-Inumbo-ID: de1a3f6b-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625933; x=1745230733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNXGZn+6xdEm7eUiN1rhPMralAe0vvaD92Ofput/+hY=;
        b=O7Za0dQQwtCKAeoPABXZyjTyy9YuTeHiysHQetb9g/Amp0bTCbrbuxQ78p1DSlo3Xa
         8NHidCS567OMV5udU2/68tf39L4PWTtpN8+58bjT4JcEpeQUhBZIda9BFl+pzAUboFLs
         eDaFoNKpRlcRXC/md3lto+CX8D8WaL0nSvgMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625933; x=1745230733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNXGZn+6xdEm7eUiN1rhPMralAe0vvaD92Ofput/+hY=;
        b=JU+azb4aVPF8lcupELhZ2w07SQEDfFxdUrdiDJuTST6mJy59n2jxCsfYvZ4ltOgyZ6
         Z7bKQxdi9EiMTMetMwWyu5nK8VyWdc+OhOrB8jl4T/UQfePN9EuQEgRrSu5L7DWNQJGV
         DxJ1zuK5AF+Vd+AXpT9T34Xtr4vEe7gEoaQi56+79MeVCNaGf4nUDYG+KfsoqoPZkA61
         1c7DU3lUg04+UYtEv/Y3hoRO6iRgXtwQ6h7kj0mpQ50lLN13uMH/q0r2sNln9KrdW3le
         j/XiF1yDsgcohNcVvWzPRzwdXNFFuVmPoG24VuL9jrVlPOz8bBAO01SYMSB1YWnK3/bL
         hyVg==
X-Gm-Message-State: AOJu0Yy3XOh581nw7tzBkY2m5/cHq/J5Im+JF2a+OgAKla7uidWCwzAB
	8U2labyEnVX3gGb4fPbVt/RYiRF9Hkauso27JTJZlsNAXZmmxwOHszjayiOwt8H/CM7/iOoUxoy
	Xd9A=
X-Gm-Gg: ASbGncsjRHqTbsRYgjpld42BwBjL5zDivxcPnoujwOVd8BqYT1N4naqv+jObaj2RCG2
	jhx89xEqNs2AZ7/qb1k3voEiEBwpfnNnDg+RI1V9bxllokmM2YB4RMA4rDbRKSdJGT3AQ2A5OXY
	9NgvGUswZCxT6nc/snnYIRufkcliMmBwpFSXVkRisxzIlhkvY3OQDh/O2ywX0WXehjR0qzEbByq
	2XL6KH19MBEUwBhJSIzxBCB9L+Nvy16gkLboTdkFMkSf29A9kSDhibaVM+gQaWyheIFVZz0mGch
	pZG5YD6ukoecDW+xvNeSx9IqYHRGpElIE8lsWnzFlinh5g0pdbqDZIs7kexlRMPo/D/lrD16uXX
	CmEdzhm2R92GpaQ==
X-Google-Smtp-Source: AGHT+IGDgWsZdwPw7zxnnU1IXbbRkiqFuoLkSDmnmlnEk9nygrtJraTF3sOh8z1bDsIdi1CEl58G9A==
X-Received: by 2002:adf:9dcb:0:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-39ecbd292afmr5466712f8f.55.1744625933228;
        Mon, 14 Apr 2025 03:18:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 6/7] Provide an ARM64 rootfs too
Date: Mon, 14 Apr 2025 11:18:42 +0100
Message-Id: <20250414101843.2348330-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The only extra package needed is libfdt.

The older ARM64 rootfs configured modloop, networking and sysctl, but none of
this is used in any of the testing, so is omitted here for now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml                           | 7 +++++++
 containerize                             | 1 +
 images/alpine/3.18-arm64-base.dockerfile | 6 ++++++
 scripts/alpine-rootfs.sh                 | 7 +++++++
 4 files changed, 21 insertions(+)
 create mode 100644 images/alpine/3.18-arm64-base.dockerfile

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b7d187168df2..d70ddd99e529 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -33,6 +33,13 @@ stages:
 #
 # ARM64 artifacts
 #
+alpine-3.18-arm64-rootfs:
+  extends: .arm64-artifacts
+  script:
+    - ./scripts/alpine-rootfs.sh cpio
+  variables:
+    CONTAINER: alpine:3.18-arm64-base
+
 linux-6.6.86-arm64:
   extends: .arm64-artifacts
   script: ./scripts/build-linux.sh
diff --git a/containerize b/containerize
index c23f55ead737..38a434ab7075 100755
--- a/containerize
+++ b/containerize
@@ -24,6 +24,7 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
 case "_${CONTAINER}" in
+    _alpine-3.18-arm64-base) CONTAINER="${BASE}/alpine:3.18-arm64-base" ;;
     _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
     _alpine-3.18-x86_64-base) CONTAINER="${BASE}/alpine:3.18-x86_64-base" ;;
     _alpine-3.18-x86_64-build|_) CONTAINER="${BASE}/alpine:3.18-x86_64-build" ;;
diff --git a/images/alpine/3.18-arm64-base.dockerfile b/images/alpine/3.18-arm64-base.dockerfile
new file mode 100644
index 000000000000..ab597c75b80e
--- /dev/null
+++ b/images/alpine/3.18-arm64-base.dockerfile
@@ -0,0 +1,6 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.18
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 53547b5c5282..e52908a3d588 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -37,6 +37,13 @@ case $UNAME in
             libelf
             )
         ;;
+
+    aarch64)
+        PKGS+=(
+            # Xen
+            libfdt
+            )
+        ;;
 esac
 
 apk add --no-cache "${PKGS[@]}"
-- 
2.39.5


