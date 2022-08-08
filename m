Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3758CDC6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 20:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382541.617499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fV-0005Cf-B4; Mon, 08 Aug 2022 18:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382541.617499; Mon, 08 Aug 2022 18:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7fV-00058l-7q; Mon, 08 Aug 2022 18:40:01 +0000
Received: by outflank-mailman (input) for mailman id 382541;
 Mon, 08 Aug 2022 18:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWor=YM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oL7fU-0004sh-3x
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 18:40:00 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81664ca1-1749-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 20:39:59 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id y13so18092645ejp.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Aug 2022 11:39:59 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:f2e5:15e2:30fb:8a7e])
 by smtp.googlemail.com with ESMTPSA id
 c16-20020aa7df10000000b0043cf2e0ce1csm4915221edy.48.2022.08.08.11.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 11:39:58 -0700 (PDT)
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
X-Inumbo-ID: 81664ca1-1749-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pmYnYXaiATMWy4qWVpvV+VyEhrge4cny24Q8a2VB19A=;
        b=F0QEKyhBbcycjypi2VCRocS89EgmXSpBpvDkBkGxnFge8vM1S6bGvWpxJZ6dfN6IaN
         JuB6ZQV/fdUt9UuudtsIDk+8PxuzTJxUEesmNj8qiFxwxWB4t6PgGDHCkBYd1ODxotv4
         DVN7IAZZj4JN32246k9DRYfZ96fyBVRDccXJmeG80GXgj4scH9j2ffVUD5vBTgUL/uWm
         R6UqO1rftwgSTV+spG+a6g9tGDJD5Y/8JQZnvcJZX1T05x0hlMNlWLXheiYBaf25PYRo
         LN1JySDnQtHZyKVk50poiO+16WqDSwvcBbsCcQJQmBYfh+8SJEBDQoRVrnW6m9GefF/d
         2RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pmYnYXaiATMWy4qWVpvV+VyEhrge4cny24Q8a2VB19A=;
        b=sbrojy6SOioPIrpRidV/Y8t+8AvkC5anA63WTaFCT8/IY5D8MSbQ3Mnlw3JpRuSzhk
         Okq4kEAEc1ZQq9Vld0QUyMWznl1IpAqvIBeuxuk1Mfc0jOYwrapPDiUJ6+DDomxvfvtk
         /s8DacIDn+HXLZopOaYrKvfOfg/WGLIidfVttzz/lftD+h8oayxzasUvmugp8dAcZY05
         /OQLnvrkngmN3x0yf9rbdAgQHqNOAtmuEu3Oov6DexhMrvN3mfpaslPSe1PiLHr3m1po
         4ZVHiRJStc3xuXedG+ZtFvXQGypQV4Bv8GtSOYItl9MaVzEC8vcZI6bHdv0Ty/J5F/Fv
         aG5g==
X-Gm-Message-State: ACgBeo1PQf598fKKmLrMFi5qCc6KKV9BiqAXXvEeJBWiEBLu+8mbpFTE
	GC+kEeDAHXnrAOq88nJEjkaVozqWsE4=
X-Google-Smtp-Source: AA6agR7yoQWy06m47LTBzo+Baes3blkewYmxwh1AG0j2GSdf4y/eEUyGHr1/ev5nhUPP4/xQZRIq6w==
X-Received: by 2002:a17:907:c14:b0:730:9d15:c9bc with SMTP id ga20-20020a1709070c1400b007309d15c9bcmr14685850ejc.752.1659983998487;
        Mon, 08 Aug 2022 11:39:58 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] automation: qemu-smoke-arm64: Use kernel 5.19
Date: Mon,  8 Aug 2022 21:39:51 +0300
Message-Id: <20220808183952.1888459-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808183952.1888459-1-burzalodowa@gmail.com>
References: <20220808183952.1888459-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kernel 5.19 to unblock testing dom0less enhanced.
This kernel version has the necessary patches for deferring xenbus probe
until xenstore is fully initialized.
Also, build kernel with bridging and xen netback support enabled because
it will be used for testing network connectivity between Dom0 and Dom1
over a pv network interface.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- none

 automation/gitlab-ci/build.yaml               | 11 ++++++
 automation/gitlab-ci/test.yaml                |  4 +-
 .../kernel/5.19-arm64v8.dockerfile            | 37 +++++++++++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 23b306e7d0..d2f75a090c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -597,6 +597,17 @@ kernel-5.9.9-arm64-export:
   tags:
     - arm64
 
+kernel-5.19-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
+  script:
+    - mkdir binaries && cp /Image binaries/Image
+  artifacts:
+    paths:
+      - binaries/Image
+  tags:
+    - arm64
+
 qemu-system-aarch64-6.0.0-arm64-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 6f9f64a8da..aa633fb655 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -70,7 +70,7 @@ qemu-smoke-arm64-gcc:
     - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - debian-unstable-gcc-arm64
-    - kernel-5.9.9-arm64-export
+    - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
     paths:
@@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
     - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - debian-unstable-gcc-arm64
-    - kernel-5.9.9-arm64-export
+    - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
     paths:
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
new file mode 100644
index 0000000000..e445c1f03a
--- /dev/null
+++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
@@ -0,0 +1,37 @@
+FROM arm64v8/debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=5.19
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        libssl-dev \
+        bc \
+        curl \
+        flex \
+        bison \
+        && \
+    \
+    # Build the kernel
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    sed -i 's/CONFIG_IPV6=m/CONFIG_IPV6=y/g' .config && \
+    sed -i 's/CONFIG_BRIDGE=m/CONFIG_BRIDGE=y/g' .config && \
+    sed -i 's/# CONFIG_XEN_NETDEV_BACKEND is not set/CONFIG_XEN_NETDEV_BACKEND=y/g' .config && \
+    make -j$(nproc) Image.gz && \
+    cp arch/arm64/boot/Image / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"* && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.34.1


