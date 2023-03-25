Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1186C90E7
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 22:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514763.797216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBZ-0007zj-P6; Sat, 25 Mar 2023 21:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514763.797216; Sat, 25 Mar 2023 21:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgBBZ-0007xO-Lb; Sat, 25 Mar 2023 21:12:25 +0000
Received: by outflank-mailman (input) for mailman id 514763;
 Sat, 25 Mar 2023 21:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgBBX-0007ws-Dd
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 21:12:23 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b95de818-cb51-11ed-b464-930f4c7d94ae;
 Sat, 25 Mar 2023 22:12:18 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EB3A05C00CD;
 Sat, 25 Mar 2023 17:12:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Mar 2023 17:12:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Mar 2023 17:12:16 -0400 (EDT)
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
X-Inumbo-ID: b95de818-cb51-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679778737; x=1679865137; bh=3w
	s6jUP18muaz1emPu0yGWXPNCRk+TTr+7tv8YnTvmY=; b=QLJAl7nWwTHWtit6LW
	nCBjCg/Ls7DjU2+m/+49OeLchCeorp8zJIXG8xA1Z6inzyfFZoGY+KCtG9ILgIOF
	zar3d/HFj5KwMqYq/R8wOei9F+Cpg42nPQ2Ivls0Z+pftjB6wnNSAwv6xCWe4iff
	0ptubvgfFUmW0b1BIC1DUe7FSeKS7/iX8Je1844JDlkNdxAHD1EXTQZV7nH3SOZx
	drc9tp4ZCbN0w3p6y6gRD3lfIb2spXu/qqJ8GKw6NX6C8UhPfvCqX01BpBC9QaAA
	iSU4aEHAgmOoDCup0c+uRrz45zPso654vgaU5pKl3WJ4qQdK1H7Vqz6AS/zu+Igw
	4jTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679778737; x=1679865137; bh=3ws6jUP18muaz1emPu0yGWXPNCRk+TTr+7t
	v8YnTvmY=; b=HXQe191G7Luh8zFcoaE+pAQ6wT4G58910hljHNNT60G63SB3eZ7
	m50bl1L4+Q5tsBSrCJBcWpJ/mt4KomKrg9wvyrJE/TYOj/l8LgA8tvjC0ookqf7p
	Qt0UIJO6IKHlpuBw5LSaSkURVlmM9A6GbohlAnc7jYud9G3wlYLDXRVBVsb9SOwb
	JxvgO4PcREpSMQrGrsLS+6Sjiv29T0Z1PMutH0RdM+gJpoGh2lxaT9GeGsSzHuQB
	xE7tfDU/DaVHsiOTNV0rWvpQGwjXrv4WbZS9kvuXdLJWs691nk6Oh/78o63bUDTK
	e+cQEDjidgLp9/yc67H0ZWVyUoThoq7pRmw==
X-ME-Sender: <xms:sWMfZBhQtBemA6ayxMEWiiNE2Aqk53klJD3T268yLBUNedKWmiM9og>
    <xme:sWMfZGDG0QVh8euYEXyJdW43qZ1sV5X6hGOHadBPHxB2dB9vChUwzNtfUFAG6NXcv
    14IiKQIo0ihkA>
X-ME-Received: <xmr:sWMfZBEPbAqq1qXnyJGY1YghZ8_Bx1DsUjY-0yWjYd4uWTHc6-hDrvpMuHhtC5-sR3_gV6fq9LxWumuwmSi3Zz5HdMzg-oKTXxqYD9H05b2mtvgqchvX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfelgffgueffgeejudehieegteeugeefkeejtefghfdvieffieeijefgudeikeegnecuff
    homhgrihhnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sWMfZGQcG2xWFiRrQ0NyPaRw5bIji9a0lc1EtHS3aYeNWLwEokGkew>
    <xmx:sWMfZOyygINX0geJfB68EDlGNP3gqjZPmgqxdeb2tKvlQDAPSf2DPg>
    <xmx:sWMfZM7SArmkuu7JcqibotoSYOLAtpHyB-YlJp-veXd6F9aqiiU07A>
    <xmx:sWMfZJ-xng-YwqUH29gOFKRlrUmz23eSueaKS2uJtVF_oCtnjo0iqA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] automation: update x86-64 tests to Linux 6.1.19
Date: Sat, 25 Mar 2023 22:11:57 +0100
Message-Id: <cd3c32a9e013ff4f9442eccb17c3fc698a862bbf.1679778534.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com>
References: <cover.21e1254a0c5cb3256afbc6b7bd44e8f347d7c08f.1679778534.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be used in tests added in subsequent patches.
Enable config options needed for those tests.
While at it, migrate all the x86 tests to the newer kernel, and
introduce x86-64-test-needs to allow deduplication later (for now it's
used only once).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - replace 5.10.74 with 6.1.19 in all the tests
 - introduce x86-64-test-needs
---
 automation/gitlab-ci/build.yaml                      |  4 +-
 automation/gitlab-ci/test.yaml                       |  7 +-
 automation/tests-artifacts/kernel/5.10.74.dockerfile | 38 +------------
 automation/tests-artifacts/kernel/6.1.19.dockerfile  | 40 +++++++++++++-
 4 files changed, 47 insertions(+), 42 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/5.10.74.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 820cc0af83bd..0817f110556e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -798,9 +798,9 @@ alpine-3.12-rootfs-export:
   tags:
     - x86_64
 
-kernel-5.10.74-export:
+kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.10.74
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d75662358f34..ee9e3210772b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -15,6 +15,10 @@
 .arm32-test-needs: &arm32-test-needs
   - qemu-system-aarch64-6.0.0-arm32-export
 
+.x86-64-test-needs: &x86-64-test-needs
+  - alpine-3.12-rootfs-export
+  - kernel-6.1.19-export
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
@@ -299,9 +303,8 @@ qemu-alpine-x86_64-gcc:
   script:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *x86-64-test-needs
     - alpine-3.12-gcc
-    - alpine-3.12-rootfs-export
-    - kernel-5.10.74-export
 
 qemu-smoke-x86-64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/tests-artifacts/kernel/5.10.74.dockerfile b/automation/tests-artifacts/kernel/5.10.74.dockerfile
deleted file mode 100644
index 112e27fe45e1..000000000000
--- a/automation/tests-artifacts/kernel/5.10.74.dockerfile
+++ /dev/null
@@ -1,38 +0,0 @@
-FROM debian:unstable
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=5.10.74
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        libssl-dev \
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
-RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    make xen.config && \
-    cp .config .config.orig && \
-    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
-    make -j$(nproc) bzImage && \
-    cp arch/x86/boot/bzImage / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"*
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
new file mode 100644
index 000000000000..c2171555a0a6
--- /dev/null
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -0,0 +1,40 @@
+FROM debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=6.1.19
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
+        libelf-dev \
+        && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Build the kernel
+RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    make xen.config && \
+    scripts/config --enable BRIDGE && \
+    scripts/config --enable IGC && \
+    cp .config .config.orig && \
+    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
+    make -j$(nproc) bzImage && \
+    cp arch/x86/boot/bzImage / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"*
-- 
git-series 0.9.1

