Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498AA82591
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943969.1342555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2V7B-0002Nq-Aj; Wed, 09 Apr 2025 13:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943969.1342555; Wed, 09 Apr 2025 13:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2V7B-0002MB-83; Wed, 09 Apr 2025 13:05:13 +0000
Received: by outflank-mailman (input) for mailman id 943969;
 Wed, 09 Apr 2025 13:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2V79-0002M3-Ow
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:05:11 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 443160c6-1543-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:05:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso45002965e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:05:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20626c19sm20023245e9.15.2025.04.09.06.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 06:05:08 -0700 (PDT)
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
X-Inumbo-ID: 443160c6-1543-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744203909; x=1744808709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wA19nJTTFlLi2S5i3hNhxXNAIAEva6dxvHNqQxRQqxM=;
        b=hzN9tgJ2Kkz+wwpsptk/NlUFrwhMOcCJG1pmBoXaLIhi5exqKyNpFQoJxt+mITqXcg
         XpqmmPo+YWDO5/4vse+cDoSg0YjGEaAvMy/e9c33D/7hZj+auWyJlXdqVOiP+iQJQAY1
         zKFcIq81+1rU5mbp8d2lrzFvoZG3rxzuRghMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203909; x=1744808709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wA19nJTTFlLi2S5i3hNhxXNAIAEva6dxvHNqQxRQqxM=;
        b=ThC7cVroGdfcAdNca8z9S5FHV1GPjDTpch/cUZYUVDymeoUXlvbvhYyPiICITY58VL
         wk2pkBeGNEs+5Y84VtoIyKZ4o64EVOI96vigFQ+WoHtONrnoJBz0kF7Nb8Z52G8Fer5e
         Fr/gtxDvM+GX1ZHdw2qlQBuPiReS79/cKVghbwRJMB+ZF6pI1nHY8OLrxh7IMVlZfr8L
         PtIS0s8+rV6GvKWl7gVUnPl9rFGMMfTnYQacb4sw+LQdCfhW0LbdkQI2m7Ow2yh4dgXg
         Uo6CVRDIVvRnmPwDKpVN4TtFL5WuW8YsglcGkBBDP2w8HL5Ps/vLYwnvTWn8LUxJiwSq
         aiig==
X-Gm-Message-State: AOJu0YzrE4ijhpQafpvvo3zEx84/TJbHy7MYEA088r7mkecCiBOZEXLV
	1q3qY3pabPYognlDQb60HwvV23aRWNR0oOWmB84Pla2RkdhMmljtZ9wfii6uVR8bXYODJf9z+X7
	sP64=
X-Gm-Gg: ASbGncvqnl4TEy1wfJD5jRS3H0wtwogq5osPvwx0KpyWI6Gda73mHdACXVcozzPDXzt
	QBz4GzTmxapv0L4oZHJ11i+mKHiNCuQbqHG2EQ59kxxJ0u2nh7sEKNpA/rFtafEEfKudnrnmdjv
	Et2pKrUSc8TlFr6YOmFzW0GkiF5+F7+qS3/fqNYp8fx4IZkksGa1U/MxroO9J5pzFEqlahr+gUK
	5+XdMrKHbhB65BpAKpZC2D8/Ur4ObVw61GDAY6JgjpleR37/4+Byoq4PZhKMIVo0VFxlwDsah6n
	IX5TZES2vO/wg3qIxNkrOSrk3TQoAY5lYgrvwf5OelzjYiZtwmFvTNwCin3TS2zJv8j+ywR2Gn4
	wz3bALggTsW2wbA==
X-Google-Smtp-Source: AGHT+IHbin4zC3V9XaEOrFCp7aQ8gNdG+iIzLugTZiDUx08Rv9idObhZ1zUuQYRxWhzz3cLcmZIkmw==
X-Received: by 2002:a05:600c:1d86:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43f1ed671d7mr29515485e9.31.1744203909039;
        Wed, 09 Apr 2025 06:05:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Update x86 tests from Linux 6.1.19 to 6.6.56
Date: Wed,  9 Apr 2025 14:05:05 +0100
Message-Id: <20250409130505.2011604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux 6.6.56 was already added to test-artifacts for the argo testing, and
this removes one moving part while cleaning things up.

Drop the associated export job, and dockerfile.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760198654
---
 automation/gitlab-ci/build.yaml               | 13 ------
 automation/gitlab-ci/test.yaml                |  4 +-
 .../tests-artifacts/kernel/6.1.19.dockerfile  | 41 -------------------
 3 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 169bebe3c775..ab758243c1ec 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -308,19 +308,6 @@ qemu-system-aarch64-6.0.0-arm32-export:
   tags:
     - arm64
 
-# x86_64 test artifacts
-
-kernel-6.1.19-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
-  script:
-    - mkdir binaries && cp /bzImage binaries/bzImage
-  artifacts:
-    paths:
-      - binaries/bzImage
-  tags:
-    - x86_64
-
 # Jobs below this line
 
 # Build jobs needed for tests
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d05b9a98afa6..58620b32da5d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -16,7 +16,9 @@
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - kernel-6.1.19-export
+  - project: xen-project/hardware/test-artifacts
+    job: x86_64-kernel-linux-6.6.56
+    ref: master
   - project: xen-project/hardware/test-artifacts
     job: x86_64-rootfs-alpine-3.18
     ref: master
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
deleted file mode 100644
index 073eaa0e11fa..000000000000
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ /dev/null
@@ -1,41 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=6.1.19
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        bc \
-        curl \
-        flex \
-        bison \
-        libelf-dev \
-        && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
-# Build the kernel
-RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    make xen.config && \
-    scripts/config --enable BRIDGE && \
-    scripts/config --enable IGC && \
-    scripts/config --enable TUN && \
-    cp .config .config.orig && \
-    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
-    make -j$(nproc) bzImage && \
-    cp arch/x86/boot/bzImage / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"*

base-commit: 59bb316ea89e7f9461690fe00547d7d2af96321d
-- 
2.39.5


