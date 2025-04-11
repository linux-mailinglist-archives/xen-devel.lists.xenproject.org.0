Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62340A85A7F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946999.1344742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzn-0006wf-6A; Fri, 11 Apr 2025 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946999.1344742; Fri, 11 Apr 2025 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Bzn-0006v2-1V; Fri, 11 Apr 2025 10:52:27 +0000
Received: by outflank-mailman (input) for mailman id 946999;
 Fri, 11 Apr 2025 10:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Bzk-0006S8-EF
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:52:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb4603b-16c3-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 12:52:24 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso2164593f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:52:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c81f6sm78493215e9.20.2025.04.11.03.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:52:22 -0700 (PDT)
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
X-Inumbo-ID: 0cb4603b-16c3-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368743; x=1744973543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qvic3eUPy20STA5MQiJH4xRVltasBwTAFm2fFFSPQT4=;
        b=SFUR96CLWNCllkL+p++kNCifey/R9yyIcrMKz8XHg44kdoYLVA5caS9Rp66Vvpxskr
         91YqX1tjlVfPut4b7RzdeDJBRrD1tydPiveY3RtSqCMyowtdbg3wHw3sW61PmzXIZKsV
         GKOEjSko/68qeRwoSpPZWW+dPYnxc1TnGWYTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368743; x=1744973543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qvic3eUPy20STA5MQiJH4xRVltasBwTAFm2fFFSPQT4=;
        b=fEU7TI7aSBaVpYF+/2uFEuz9dp0wLCm1CVMHUr3OTAGliEG8j7+ClHGg9kPoya1vcP
         cofLVdeH7K/Zy8x/UUMCUJV8eYuvdCzjNrvVPwcUJ2L32r0MrI/I1BjBQYfBOqTz+gr6
         RunEUAtsJzD6DcRjTq/pT4UCECzKTATosUZEQSM7F5JkGXvfp80oJK/WcXXSLglUcLXD
         xbCKlEl3WTWdrXbrGTj/rSlpxLigJGH0fIQJ0V4/WIPB02nLvXwvv7gS8ZotSX+4wF2R
         lbHSdSUvmQMQ0XnD8FDAz7rgkREHxewcbRuKIsCna7tz4GfA0kZifTiD2eCHRNTP5k0U
         yclw==
X-Gm-Message-State: AOJu0YwxQkj9Z0aoUJVHV9BOSi7ckyQPwOMmwQIbXU1QvWlCDizh+qhf
	OV3+WpP8C+oUplIv/YF4WYFbBO8U7w0yuixhvB+CdDuqaae65xUIoHW8FEtHemp/euc5on3h3JY
	W0ak=
X-Gm-Gg: ASbGncsbvvxx1YEVnJwMp6y3PP/kyBCaALmH/HXIsBGFPl/9yCkCw0iav+Ckc1o3VSN
	F++JzHu3RDSznsaPCO0key0TWeUTFoUjskL7+2ZgDuGdjHbfbNNjpC+mwcxxPlrxXx9xUfQk9kx
	4k4o5g+LV9xWqWTg/GaDwzL9HKQyUKE8iPdYvQg6pJNuR48DBtwG3Y79+f23qEphFUqTvhXezgq
	AFaWzKCtFwzp+EiXUbdwrb7IGo2vz4hzhR6SWuB+ZF/5NnLQM88IbNu8tgBb+0qbWlarIoWAO9+
	UkGjv1xlVBPH83fxFNNAlLcXnRaned2ZpVK7OPb51BtaV8fiFx6854Q1WecCYOoD3K58Kidw7eo
	JnepaoCgNQNZy3A==
X-Google-Smtp-Source: AGHT+IHC/IoBpEen7blw8f+Nwf7qaOd4zRPDAm1sg1XHDwUmVsypkS0tFBpL4lqLOL1zNk2eTp/jUg==
X-Received: by 2002:a05:6000:1787:b0:39c:2c38:4599 with SMTP id ffacd0b85a97d-39eaaec7559mr1517072f8f.48.1744368742858;
        Fri, 11 Apr 2025 03:52:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] Provide an ARM64 rootfs too
Date: Fri, 11 Apr 2025 11:52:17 +0100
Message-Id: <20250411105217.2141356-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
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
index 916c5ae9d508..3587d660aa62 100644
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
index 30d426d6e88f..220a8aedf4a1 100755
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


