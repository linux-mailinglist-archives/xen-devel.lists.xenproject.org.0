Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0207A82C95
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944346.1342885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQO-0006Fs-Cc; Wed, 09 Apr 2025 16:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944346.1342885; Wed, 09 Apr 2025 16:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQO-0006BE-4f; Wed, 09 Apr 2025 16:37:16 +0000
Received: by outflank-mailman (input) for mailman id 944346;
 Wed, 09 Apr 2025 16:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQM-0004du-GT
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40489f6-1560-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 18:37:13 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso48219915e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:13 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:12 -0700 (PDT)
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
X-Inumbo-ID: e40489f6-1560-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216633; x=1744821433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2mT/JfncdqV5tSU+jW+RQIjWQnr3c8c6UD7AZjsbPw=;
        b=tflH/FYjDwX7xQc0Ia9LGU84CfnbLIXcTvbwtUHYYrdbsWUAMGqgRikS0cOx+cwORv
         qseHPNuC+6EeGZHrp2mRF8wGpjejY3QwGX8zM9ujCd/gy83ADxzp0ikGDWp1xQFrVn2t
         G5o7cvpfUnsYb97zvjUOY8Zrm7R/egfYbkrws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216633; x=1744821433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2mT/JfncdqV5tSU+jW+RQIjWQnr3c8c6UD7AZjsbPw=;
        b=Lu0tdoAItzoYStkBI7a/Yv5BdHO0qmPTG16DkftYO/e8SxN8EU/n9kMNxk+bdjd+Mm
         Delr1oA26YfCtREZhJoh8h37DVBaRIiI8Jha6ZNOYEQyckteCkMGyEjkitk+/aZm1PZS
         KerNPPvCyiWWGHd6uqHkgiKW37daRIQXXIU3OTXuSQLwXrePaCtI+soqx7PndB0TOFOP
         0beXwN3ge7aB7ltbLjbFazBANLzP+VOagxggIoEDAFoENA0wxzwbn+3oHXiP+Q1iqfpx
         8SU2gbX/0fQCmBbURbgf1RiakFW11XMlo+4DZAsWMXm73Km0DZx6KlFCPc7pB2S6j4rX
         VB1A==
X-Gm-Message-State: AOJu0YweKRBvBnsRyUsE4oQTu2eWcoNX10OnK4Y9n80l83+aIWrxzMx+
	C/HK5ik730Zy2BDZ7gtEMp3pf5R7IdI1ytJ7Ic7C4cgTVNlBZqJgNXA2l7MWSJ+CNMa1ZsjSM8X
	Na8o=
X-Gm-Gg: ASbGncvlwWkczXAWWpfqpWCMHE7N9ZvyL7qw/CbbCB3cMN9qWNaE2SK8gotUoF4yNoh
	J+I3nYhZc/XscCR2rqexy7svQjcfNsG+j4Tnu4Be5NQ0VpI1Pw9aP0gVPyTA5GITib45D2DcUrd
	61y1sLqm9qNljeh0LNCY7pKeAUW7Hekp0Carr5lKKhJN0BQcZrxSUGt4xpixsqTzLl1op44ysq9
	hXBSa5UP0paVewGvSIKhAPJ7aDvfk+cWLfke9ou+KjxxlBbp5kq6xMwYCbVzpzm2WsHiBytJuXh
	fd1MV4d5a4oZRpO2taOwxrufPuTyXwxMgoCMBam2ViK2e/ERR46K9pUQH2JfBnyTQVuOTp4VJkC
	PLrrQXIsoh7SanksRHx9h/ydu
X-Google-Smtp-Source: AGHT+IFeAOIEsPP+PKgdQeDrOa66hkGlAAR3QFoVe90GA0l/Y3sZ1wzkRcbvByRiqErOlzaGnHWv8Q==
X-Received: by 2002:a05:6000:40d9:b0:39a:c9ed:8555 with SMTP id ffacd0b85a97d-39d88539008mr3376723f8f.23.1744216632825;
        Wed, 09 Apr 2025 09:37:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 7/8] Infrastructure for arm64 linux builds
Date: Wed,  9 Apr 2025 17:37:01 +0100
Message-Id: <20250409163702.2037301-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml                            |  7 ++++++
 containerize                              |  1 +
 images/alpine/3.18-arm64-build.dockerfile | 27 +++++++++++++++++++++++
 scripts/build-linux.sh                    | 10 +++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 images/alpine/3.18-arm64-build.dockerfile

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ff8dce7be05d..6e38c2f2a108 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,6 +19,13 @@ stages:
     exclude:
       - binaries/.gitignore
 
+.arm64-artifacts:
+  extends: .artifacts
+  tags:
+    - arm64
+  variables:
+    CONTAINER: alpine:3.18-arm64-build
+
 .x86_64-artifacts:
   extends: .artifacts
   tags:
diff --git a/containerize b/containerize
index c32e40f5a6d9..6664ef9821d0 100755
--- a/containerize
+++ b/containerize
@@ -24,6 +24,7 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
 case "_${CONTAINER}" in
+    _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
     _alpine-x86_64-base) CONTAINER="${BASE}/alpine:x86_64-base" ;;
     _alpine-x86_64-build|_) CONTAINER="${BASE}/alpine:x86_64-build" ;;
 esac
diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
new file mode 100644
index 000000000000..c76ac435e8dd
--- /dev/null
+++ b/images/alpine/3.18-arm64-build.dockerfile
@@ -0,0 +1,27 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.18
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN bash -ex <<EOF
+      adduser -D user --shell bash
+
+      DEPS=(# Base environment
+            musl-dev
+            build-base
+            curl
+
+            # Linux build deps
+            flex
+            bison
+            perl
+            openssl-dev
+      )
+
+      apk add --no-cache "\${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 5e25e958c0f3..1be20a38071d 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -21,6 +21,7 @@ cd linux-"${LINUX_VERSION}"
 make defconfig
 ./scripts/config --enable BRIDGE
 ./scripts/config --enable IGC
+./scripts/config --enable IPV6
 ./scripts/config --enable TUN
 
 case $UNAME in
@@ -32,6 +33,10 @@ case $UNAME in
             | grep '=m' \
             | sed 's/=m/=y/g' >> .config
         ;;
+
+    aarch64)
+        ./scripts/config --enable XEN_NETDEV_BACKEND
+        ;;
 esac
 
 make olddefconfig
@@ -41,4 +46,9 @@ case $UNAME in
         make -j$(nproc) bzImage
         cp arch/x86/boot/bzImage "${COPYDIR}"
         ;;
+
+    aarch64)
+        make -j$(nproc) Image
+        cp arch/arm64/boot/Image "${COPYDIR}"
+        ;;
 esac
-- 
2.39.5


