Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A9A87E83
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949713.1346214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hge-00015L-7A; Mon, 14 Apr 2025 11:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949713.1346214; Mon, 14 Apr 2025 11:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hge-00011r-2A; Mon, 14 Apr 2025 11:09:12 +0000
Received: by outflank-mailman (input) for mailman id 949713;
 Mon, 14 Apr 2025 11:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hgc-0000MU-Dj
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3718eb5-1920-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:09:09 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so36430705e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:08 -0700 (PDT)
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
X-Inumbo-ID: e3718eb5-1920-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628949; x=1745233749; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwMsxn6Jd7jyTrnz0TEyUCElfwL1OHRjwA8ZnK04oco=;
        b=LSJ8BL4q0PdPq0e/61LQ0TfrkCTEbfTt4jpJQk8S1aWELBcd/TZ+fumzvTS6+Dt+HQ
         grmsX7AC7A/mAmjI+lH5uvioNr3FN7004poOaqMVsFG0dTgT+Gqm2lBNXm0aTj2twMq/
         WZNxOdW1aKGB7fLxnOzctwICQoHnsDM14X8g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628949; x=1745233749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwMsxn6Jd7jyTrnz0TEyUCElfwL1OHRjwA8ZnK04oco=;
        b=EAnDZYzChRGqgYVEz4/kZfQ/eJkDWIQZOiuYL+5YzcKJnpmM0SPzb68RMG+DeII6iy
         j32PC4pf/U5p5N1pNeMZ5hO4xeZVJgMHexTgLorhLYyaPMP4t/b/4WSK62uFM/1QRzFE
         f0kqRBGCYBRXRo9ThyxmvEs39Q3HNsEO5Pvo7X8LYZTcjVb1wGi5hFR90T5i4P0OnbCX
         /CuPwZjmAsFHa7V+5tAu6atgyLwuXPw1q7UGo0nRQLlXteNxfEzrakzfmXmuwKDV96Z6
         mvcXoVcmzwE7aErWdli2rRSldP6YkUXbCbh/QkD0VOlnA8tK8PWGL4V8mzK+rJNnQwWN
         oVaQ==
X-Gm-Message-State: AOJu0YzR0l+Oe/1et2qurbW+JuVORaVwjCGAi4FyDKt4lrKbS9dGjqnl
	bEf9dJdzRIBwZ/eAAcwfpkutPa3/SF297QtHx89M2FQecMvGL7IMqIxB6jOOS4iEnsXxhjlG/q8
	QbFQ=
X-Gm-Gg: ASbGnctNatGbM70J+j7Nx6BS/Oo16ea4bkv3rH7urNJ1VythK9+7f27m6mDFHeSBwoc
	Q+AfKPFsSl4sQGZM4GN7PHjYu83Ja0hHH+tqj2SrKyLIHCW62Er1Fh2+18O/MkfFDNRz5bsMbY2
	48jjDmKPCI9uKOdiy6HE+oKs9Ctzwa8KojkwM7N43zfDuxg59o1A8pbLzciIpxYWtsJJJlOH5os
	cCR2/pyN8aCe8H/ruYTjim/NAFP9n+Z9BEggMSAkOX11YlQiUlD4PwgWoBhCtGJoVXIiSeoNh26
	sRfl9xd4hjKg0jXL5YDnIHdBMH6f0bQ56qWCO6HkuJlx1yfjoDFPUGvGNfMm1T9M8NuAZIIL+Tf
	mJ2YBLfgmn639Sg==
X-Google-Smtp-Source: AGHT+IFnAY3HNdb1GkemiFAV4NeEsPcpgR1Y2eChTj17M0J4//b9qAZzHqAbfJ4PdYYIgohtWyCBrg==
X-Received: by 2002:a05:600c:500d:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43f3a959599mr121393665e9.17.1744628948708;
        Mon, 14 Apr 2025 04:09:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 3/6] CI: remove now unused alpine-3.18-arm64-rootfs job and its container
Date: Mon, 14 Apr 2025 12:09:00 +0100
Message-Id: <20250414110903.2355303-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This got moved to test-artifacts.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml               | 11 ----
 .../alpine/3.18-arm64v8.dockerfile            | 66 -------------------
 2 files changed, 77 deletions(-)
 delete mode 100644 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 40dcd31f1bce..1b82b359d01f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -264,17 +264,6 @@
 
 # Arm test artifacts
 
-alpine-3.18-arm64-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18-arm64v8
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - arm64
-
 qemu-system-aarch64-6.0.0-arm64-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
deleted file mode 100644
index a4542f703997..000000000000
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ /dev/null
@@ -1,66 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN \
-  # apk
-  apk update && \
-  \
-  # xen runtime deps
-  apk add musl && \
-  apk add openrc && \
-  apk add busybox && \
-  apk add sudo && \
-  apk add dbus && \
-  apk add bash && \
-  apk add python3 && \
-  apk add zlib && \
-  apk add ncurses && \
-  apk add yajl && \
-  apk add libaio && \
-  apk add xz && \
-  apk add util-linux && \
-  apk add argp-standalone && \
-  apk add libfdt && \
-  apk add glib && \
-  apk add pixman && \
-  apk add curl && \
-  apk add udev && \
-  \
-  # Xen
-  cd / && \
-  # Minimal ramdisk environment in case of cpio output
-  rc-update add udev && \
-  rc-update add udev-trigger && \
-  rc-update add udev-settle && \
-  rc-update add networking sysinit && \
-  rc-update add loopback sysinit && \
-  rc-update add bootmisc boot && \
-  rc-update add devfs sysinit && \
-  rc-update add dmesg sysinit && \
-  rc-update add hostname boot && \
-  rc-update add hwclock boot && \
-  rc-update add hwdrivers sysinit && \
-  rc-update add killprocs shutdown && \
-  rc-update add modloop sysinit && \
-  rc-update add modules boot && \
-  rc-update add mount-ro shutdown && \
-  rc-update add savecache shutdown && \
-  rc-update add sysctl boot && \
-  rc-update add local default && \
-  cp -a /sbin/init /init && \
-  echo "ttyS0" >> /etc/securetty && \
-  echo "hvc0" >> /etc/securetty && \
-  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
-  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
-  passwd -d "root" root && \
-  \
-  # Create rootfs
-  cd / && \
-  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
-- 
2.39.5


