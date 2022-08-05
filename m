Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23958B10E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 23:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381517.616249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4hc-0007pc-DJ; Fri, 05 Aug 2022 21:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381517.616249; Fri, 05 Aug 2022 21:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4hc-0007mt-A3; Fri, 05 Aug 2022 21:17:52 +0000
Received: by outflank-mailman (input) for mailman id 381517;
 Fri, 05 Aug 2022 21:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oK4ha-0007XM-Vr
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 21:17:51 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5dd7d5-1504-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 23:17:50 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id z16so4471012wrh.12
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 14:17:50 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 z9-20020a5d4d09000000b0021dd08ad8d7sm4833347wrt.46.2022.08.05.14.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:17:48 -0700 (PDT)
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
X-Inumbo-ID: 0f5dd7d5-1504-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=s9dZ6sD5EIOKc0plVklLAsEe+knWyHasBDCNA/VtHus=;
        b=DcUFLQg+YNAbdV/DmeSGNv8P8WebdIyymNu1Z26ni61qgnFhAkmTdJ7px68E3khP83
         wSQnneMtiEJdZ24Nh8cFtVGJ043EaQ31P+yUcGLBXwJqtGMhR/ApDkLrmsA10Lg1mqMU
         MtU5AyPLtPxcq8/PGGF6jlu3IGn2NY5yc2O5v5hpicUtDz/qzAQOzJvE68GhL1GQyfbF
         6X2vnrdA4Bsk5UPOtRK0hGHGHZ88q4jqrnpwpvGgHBnXgOxtIKttCUlDhtANiUhPHfBu
         +bucLw5+1+2E3vqo+1XU5iTXXKs6x7wTRjytAvxKi7DSrjHQVNI7tuJ6fGaNB+wGnfJL
         GtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=s9dZ6sD5EIOKc0plVklLAsEe+knWyHasBDCNA/VtHus=;
        b=bGywSkySecqzOuPNnyMPhxM+nZx18nV4lRsePLCJIY3yCJatwDdJ37796rRcEt8Jks
         EPOYxUhCGIhV8h5efHeIS7yuf1mnvtWE2oHJExw+0cAC19lt+UqhB9bHv6o9fhVU0hsK
         zMJ64Fwdnb9TV30eGk8mjWB5Q+8Pdbeq2CMj5cesUwQ/XA9DNCfDJCtVCIqoyzZ67USd
         aDqtpmcWgUIyukyjJEwjo79kmlWwvbntMPIz9LFUBv1VzMoOA5bTCe7Po3ILaYJb1yiu
         SV+eWySD9bVEYb41fMej4mV0DJlbs6laC/vzEZWa/MT2sxnlQ/pR6kq4fbKpVsN0rHGW
         PZ9g==
X-Gm-Message-State: ACgBeo1a+MfAhDXmMbCktYAH+u29Ry980aQxPUUeAp13usiufzMfTz3j
	9Fdw+NOdh6h8porU3dpMTyWvajr8iZo=
X-Google-Smtp-Source: AA6agR4hrVFhpDLKSUGRNxT6uDWRR5gklde0uzfTdMLn9KjEGGlsjQsBbtgAxXxuTXRjBfJybezsIQ==
X-Received: by 2002:adf:ce10:0:b0:221:760e:17fc with SMTP id p16-20020adfce10000000b00221760e17fcmr2420585wrn.495.1659734269494;
        Fri, 05 Aug 2022 14:17:49 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: qemu-smoke-arm64: Use kernel 5.19
Date: Sat,  6 Aug 2022 00:17:40 +0300
Message-Id: <20220805211741.1869068-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805211741.1869068-1-burzalodowa@gmail.com>
References: <20220805211741.1869068-1-burzalodowa@gmail.com>
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


