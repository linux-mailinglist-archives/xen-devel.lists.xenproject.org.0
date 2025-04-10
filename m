Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60FA8420B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945329.1343558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNF-0004HR-7s; Thu, 10 Apr 2025 11:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945329.1343558; Thu, 10 Apr 2025 11:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNF-0004Bc-2E; Thu, 10 Apr 2025 11:47:13 +0000
Received: by outflank-mailman (input) for mailman id 945329;
 Thu, 10 Apr 2025 11:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qND-0003vN-Dz
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:11 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8927a9f4-1601-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 13:47:10 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-399749152b4so290956f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:08 -0700 (PDT)
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
X-Inumbo-ID: 8927a9f4-1601-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285629; x=1744890429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDlRltBQlDK5HzUxWDgj0k+9YEzjv0UHHKFuSv9/huI=;
        b=BnEQQgntFcg9KYbjHgUJf3zo1L2aGy6ioxbFXHrXdef8Du29ZnYQ/cA1ulO+1MNhlC
         xmVyPKwr5UaOvwXrPDqu+dDlD63N3L50cXc++go6/eI2Hwdx5pOiWPeQrWgJMqN//9BW
         8EooCouxK1eOqxeUVzpNT3lwmkH1gHPQc5o5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285629; x=1744890429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDlRltBQlDK5HzUxWDgj0k+9YEzjv0UHHKFuSv9/huI=;
        b=Je5KUPmTFjRG+G7iFOpUweu6O1lFfGfdPPUuOE61+EhtiF7Ky3t4oR4FKAKmYqw51Y
         3AfQmk9UIXEeD8cOZv70znDyAa9Q9kiLwvdJwbfOmcFzB5GtJbpJVv0/4C3+220nd1sx
         SKX41VyonoMGaouQ48HlzfIb8aZPylzpk9mAksaToJroD3Xvx1Jdgo2ewCfRF0MBJM4E
         xxukJIOX/XhsUrn++kywqf8m9y42axHYmgaCkUacaSO1PxDr8a5HEriTyyrjsKVTL4hN
         c9FDSnEHuOEXME7MvyoPaoH3XTs6ms7YdIAR4/45XMD6glog+kXKe08mi4IyfmNnBAML
         xgJg==
X-Gm-Message-State: AOJu0YwbqdQzWQPIQ6dcodDplHE+Uu+gKa+NqglIRiQQbVQWspWmt3DL
	KlxaROy+aTk6w6aOGOVffYtKsXE2RDta2shz5062M7Vwc4pKa9W5KmwfO7eVmbDzptaRha+rGRF
	oUlQ=
X-Gm-Gg: ASbGncsj1VtNeJoGbdw24vWzTL5rCtesg7oeWZglCg5J9fyHjuadStlriqXsre2XcFB
	YuXNQLzm0qejWFtfC2lTqSNrsXqj19TT2cVOKRTeYsbPr7v3h37waUt9E11stVuA6tONNi3mKBf
	MNmIUFU157m/Noe1q+lmXZhJfZoZUFhwRcVudsJ8T8iWxXDOLVWywfvU5b3gYfN6+xaNQqu42pf
	o2LT1cu6oyNfg4UI2PQAucIIkNjBzKt3pG1YgIG66+z0wQQTtSiKz/7nI+IClJ63PNu9Ugxiu9C
	qTkPS9a5cb1rzjiRvVA8Tgv9M4oL4YmlT73sEu+yeWfYVae/Kheu7yJtLTfCNHfS0g0l/iJpAbf
	6YlmUjviJh4AJaA==
X-Google-Smtp-Source: AGHT+IEi369RxGSg/Usod6vfW65JYGq/Nc8vCcbbU/LfGgo17meuZmZCJuIfe2wKsSey9HbCPSbN6Q==
X-Received: by 2002:a05:6000:2a8:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-39d8f276117mr1993700f8f.12.1744285629150;
        Thu, 10 Apr 2025 04:47:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/6] Infrastructure for arm64 linux builds
Date: Thu, 10 Apr 2025 12:46:27 +0100
Message-Id: <20250410114628.2060072-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
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

v2:
 * Drop musl-dev.  It's brought in by build-base.
 * Include findutils to fix build warnings.
---
 .gitlab-ci.yml                            |  7 ++++++
 containerize                              |  1 +
 images/alpine/3.18-arm64-build.dockerfile | 27 +++++++++++++++++++++++
 scripts/build-linux.sh                    | 10 +++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 images/alpine/3.18-arm64-build.dockerfile

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a8e56b165ed6..6faa85d8dd7c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,6 +16,13 @@ stages:
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
index fd488cc57596..7abeb119ff6a 100755
--- a/containerize
+++ b/containerize
@@ -24,6 +24,7 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
 case "_${CONTAINER}" in
+    _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
     _alpine-x86_64-rootfs) CONTAINER="${BASE}/alpine:x86_64-rootfs" ;;
     _alpine-x86_64-build|_) CONTAINER="${BASE}/alpine:x86_64-build" ;;
 esac
diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
new file mode 100644
index 000000000000..b6d9bd1af531
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
+            build-base
+            curl
+
+            # Linux build deps
+            bison
+            findutils
+            flex
+            openssl-dev
+            perl
+      )
+
+      apk add --no-cache "\${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index c78cd6ca46da..652fdba7b9d1 100755
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


