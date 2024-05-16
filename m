Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3328C781A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723364.1128205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beA-0007sB-G0; Thu, 16 May 2024 13:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723364.1128205; Thu, 16 May 2024 13:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beA-0007no-5b; Thu, 16 May 2024 13:59:50 +0000
Received: by outflank-mailman (input) for mailman id 723364;
 Thu, 16 May 2024 13:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be8-0006bS-2I
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:48 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc5c438-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:59:47 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 7B8C413814B2;
 Thu, 16 May 2024 09:59:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 May 2024 09:59:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:45 -0400 (EDT)
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
X-Inumbo-ID: 8dc5c438-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867986; x=1715954386; bh=u6dbejfCbQ
	Ta4IPIW9KKt75kBi6AoNdi5qidbD/kO3Q=; b=H+gYi5L/MQNUlVI+sOc+kOKGaa
	eTr8K5spBGn6SfiU6ug0XIg68Q3AeXNYFfQtabr0CkYt+DzrRmDj/q221D1E6Fmb
	39KFsskZD83+QoYzPbpBET/rda8MB+9H6iUDronNtulyctZTkxbkKiBvwug388fS
	RBYubncENuDLhVQV18yncZCUQ8FeLL1snR+9V3YnZ4U04Z4glPeODai5emRA4m6T
	co6PkhE6K/CrA1R7dwEk3tjxKPPdZxa0epyzPCY4tDNj+6Q2QanopMq9jSUgE0oQ
	7neNjmTOvr1wBgDS48kGY8sl7WAIqhe138tvTCjOGGMaZWire7ttU16+HIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867986; x=
	1715954386; bh=u6dbejfCbQTa4IPIW9KKt75kBi6AoNdi5qidbD/kO3Q=; b=a
	xOQXQBOmO9Cew+s8XEfxNFpCMqXk7oJnXsr2yZR0jDE47PccfcStqXCuCQrOD/FZ
	jOYK3nx9qvxnUEdHOTA42GudDsj5u+E6f30JtJyzuG7o5jMh4Sln8a0dbTVvkpI+
	BuqYypnCR5hcJZdrZSOOdjfY/XnxOCeZz4T6Fx1qhWqbzBGvRdys/5hODWXC/T3Z
	EGVDV1VntIQLAg6ApLobPyftnAceX6SOluZiUTUtPd6V//6zWG7k7UhXfaJ/Df3L
	szDsxodzwiU9D/pkjGcq7z/Oy4ah46i652ydAWrghD5ycThxHcbuyCFqW7Qn+z6k
	cUm6cFvv+GSi/C794wHjA==
X-ME-Sender: <xms:UhFGZob3svXFchL8CGBhzoHl4GkYrOZ4nJ1-AI_9FgPFHz_J4bY80Q>
    <xme:UhFGZjbkExPkKHDQO8timU8ZmFOugnBwcB52W8QDuUZJteM4etHd50qpB-ygxEkOY
    C99NmkrwxHVnA>
X-ME-Received: <xmr:UhFGZi8HqSt62M-REjbjlAUjZqdCVqprBefN2-VlU3phOntc9sXnUKnHosA7BfSlDBmwVhu6kE7vBwJtl8LPlAgnHWWtZxMTVCOug3JogX-qXwVYzT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    lefggfeuffegjeduheeigeetueegfeekjeetgffhvdeiffeiieejgfduieekgeenucffoh
    hmrghinhepghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:UhFGZiq1oxmRMqeeelWuPJeHARMbcdtVc5rnBe_YYrdtOKPYc1tM1g>
    <xmx:UhFGZjqjc6qSR9z_0fHbaa8bD_f3WXfF_GNimwI6U4rqlxr2X1PETw>
    <xmx:UhFGZgQ4Qb4_ztJ56V0iBZhGQGztkjHX7UqIEN3_jfACfx__DdCguA>
    <xmx:UhFGZjoDZijGDbkPV3svToZYkGi5LbSqEGXJi7kerCGyIRd5stmTGg>
    <xmx:UhFGZiUab4JiFD0crPZqL6pIRHuALWrMg2U7xjQkRBA_RhGXY5N_uPdg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 08/12] automation: update kernel for x86 tests
Date: Thu, 16 May 2024 15:58:29 +0200
Message-ID: <2e6dc425056db1267768fd1bd0a20c444b1f1610.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update 6.1.x kernel to the latest version in this branch. This is
especially needed to include MSI-X related fixes for stubdomain
("xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled").

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml                     |  4 +-
 automation/gitlab-ci/test.yaml                      |  2 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile | 40 +--------------
 automation/tests-artifacts/kernel/6.1.90.dockerfile | 40 ++++++++++++++-
 4 files changed, 43 insertions(+), 43 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.1.90.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 783a0687ba34..9b9e5464f179 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -331,9 +331,9 @@ alpine-3.19-rootfs-export:
   tags:
     - x86_64
 
-kernel-6.1.19-export:
+kernel-6.1.90-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.90
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 80d10eb7f476..e3910f4c1a9f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -12,7 +12,7 @@
 
 .x86-64-test-needs: &x86-64-test-needs
   - alpine-3.19-rootfs-export
-  - kernel-6.1.19-export
+  - kernel-6.1.90-export
 
 .qemu-arm64:
   extends: .test-jobs-common
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
deleted file mode 100644
index 3a4096780d20..000000000000
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ /dev/null
@@ -1,40 +0,0 @@
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
-RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    make xen.config && \
-    scripts/config --enable BRIDGE && \
-    scripts/config --enable IGC && \
-    cp .config .config.orig && \
-    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
-    make -j$(nproc) bzImage && \
-    cp arch/x86/boot/bzImage / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"*
diff --git a/automation/tests-artifacts/kernel/6.1.90.dockerfile b/automation/tests-artifacts/kernel/6.1.90.dockerfile
new file mode 100644
index 000000000000..46cadf02ca78
--- /dev/null
+++ b/automation/tests-artifacts/kernel/6.1.90.dockerfile
@@ -0,0 +1,40 @@
+FROM --platform=linux/amd64 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=6.1.90
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

