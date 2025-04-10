Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2475A84271
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945474.1343672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qet-0007ar-9q; Thu, 10 Apr 2025 12:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945474.1343672; Thu, 10 Apr 2025 12:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qet-0007a3-6w; Thu, 10 Apr 2025 12:05:27 +0000
Received: by outflank-mailman (input) for mailman id 945474;
 Thu, 10 Apr 2025 12:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qer-0006ob-Lm
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:05:25 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15de51f5-1604-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 14:05:25 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso381141f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:05:25 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a6e7sm4522476f8f.44.2025.04.10.05.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 05:05:23 -0700 (PDT)
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
X-Inumbo-ID: 15de51f5-1604-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744286724; x=1744891524; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZykuuQVq0JKbj+J4r/e2Lj4KUTdErpj+5YMzbXkZZY=;
        b=XcaAqemmZslg4S55GkQepvmryH/1sC2d4QqShDF6bjBTUEVbdA/qNBs/7KChNAAxHs
         ccMRxGoY/mtWAdINbFPtTCsnedj+f0zwsQO425IJHCUBCMdE+xmub/C4a5/LkCh66iXT
         pEX9B7Z/mjS6oVRaEefEIxzECkA63olB7IMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286724; x=1744891524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZykuuQVq0JKbj+J4r/e2Lj4KUTdErpj+5YMzbXkZZY=;
        b=IEb6hAfETPkgCGC1JET7Cu6pIlZ1cPi5KUghQQpeOWzck7eFL84nsV7cNlEPpjZjgU
         xyA7twGnslmT11XCY96Ws3hROq2zfqCp0xfuZcfyfG650VVb/jvsCgMBxB3cTkHwiw/U
         6GhAUeEx48aAGEsr5JSr6T/7jpmGTUxfoPf4zXhxhhsCtkP7uztaEUXn0sgI8dOho8tQ
         XVOOc6xa+rKOP6M7k1ViLluafwrgs8PhFvW+3odZvacv3imVAvwqwJ/QmnWl2bPyn6ep
         1txW0ZHYwOFZssV4FJv+scx0CF1N+2rEzrVB2YWyYKwjQaj/kJAf8wlXs+0ZMdsAiTpi
         LD4A==
X-Gm-Message-State: AOJu0YwINNe/aP3FLQS1yJIkhcBFlspkjzXsRMx6ms4N1EMBB+RkweZo
	iHDAjTt7zOnz/TQkONY+BUUberqKCzxMBC2NcsRY3KmbFyUlehF7NOi8TJJACZ8+RVV0TPN+3st
	QpEU=
X-Gm-Gg: ASbGnculkguqeJ1SirGJbmryaQSI0Ti0LxYslDElQ0lfQOb4myC1DeSKlyUzWauoGuM
	3Di1mBSUXtFbJ/2dfESbCot2pPPs5y4u1vg5yNAbEhSciLiSN1BBD9xMV6JJY3kggaaPAl4lqX8
	C7PqQjCBP5ElIk4kqA+R01vyTsIdyG7Nodp/YvvnCMQCtZuIykpI7E0HldUxdYwenYkGgmYKgZL
	Rm6mz3uk05gt6BG4IYnWX6qoLFOLlcNnypzlWD7p9bW7j9H221F8a1S8IUAjdlS+VDWlcRBfiHp
	PPUV+xfs1BQw5IJ5qGOfMWsrUnh/XH2gEQPwi+6blgok19GFcvE48rk2SfOHcHI6YwT38fhxgLZ
	jlpVCy78HO1fmSQZdOwJs2BGz
X-Google-Smtp-Source: AGHT+IEEZOgOKLYwDQXgd1rzipEUXzLnU9Y+xZnxO069vImyGY4M7/2LfwLYcPab9097AhftsE7Atg==
X-Received: by 2002:a05:6000:4404:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-39d8f4e4741mr1433988f8f.47.1744286724293;
        Thu, 10 Apr 2025 05:05:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/3] CI: Update ARM64 tests from Linux 6.6.74 to 6.6.86
Date: Thu, 10 Apr 2025 13:05:19 +0100
Message-Id: <20250410120520.2062328-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch over to test-artifacts.

Drop the associated export job, and dockerfile.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml               | 11 ------
 automation/gitlab-ci/test.yaml                |  4 +-
 .../kernel/6.6.74-arm64v8.dockerfile          | 38 -------------------
 3 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ab758243c1ec..40dcd31f1bce 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -275,17 +275,6 @@ alpine-3.18-arm64-rootfs-export:
   tags:
     - arm64
 
-kernel-6.6.74-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.6.74-arm64v8
-  script:
-    - mkdir binaries && cp /Image binaries/Image
-  artifacts:
-    paths:
-      - binaries/Image
-  tags:
-    - arm64
-
 qemu-system-aarch64-6.0.0-arm64-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index a23ff8a6e7fe..59a2de28c864 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -8,8 +8,10 @@
   - when: on_success
 
 .arm64-test-needs: &arm64-test-needs
+  - project: xen-project/hardware/test-artifacts
+    job: linux-6.6.86-arm64
+    ref: master
   - alpine-3.18-arm64-rootfs-export
-  - kernel-6.6.74-arm64-export
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
diff --git a/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile b/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
deleted file mode 100644
index 73e51454257d..000000000000
--- a/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
+++ /dev/null
@@ -1,38 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=6.6.74
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
-        libssl-dev \
-        && \
-    \
-    # Build the kernel
-    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    sed -i 's/CONFIG_IPV6=m/CONFIG_IPV6=y/g' .config && \
-    sed -i 's/CONFIG_BRIDGE=m/CONFIG_BRIDGE=y/g' .config && \
-    sed -i 's/# CONFIG_XEN_NETDEV_BACKEND is not set/CONFIG_XEN_NETDEV_BACKEND=y/g' .config && \
-    make -j$(nproc) Image.gz && \
-    cp arch/arm64/boot/Image / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"* && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.39.5


