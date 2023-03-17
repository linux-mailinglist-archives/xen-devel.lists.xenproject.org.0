Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1466BDFAD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 04:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510879.789414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0ra-0002lc-PH; Fri, 17 Mar 2023 03:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510879.789414; Fri, 17 Mar 2023 03:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd0ra-0002ct-Lu; Fri, 17 Mar 2023 03:34:42 +0000
Received: by outflank-mailman (input) for mailman id 510879;
 Fri, 17 Mar 2023 03:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZYU=7J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pd0rZ-0002SR-9B
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 03:34:41 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3961e52-c474-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 04:34:37 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 216F2320091E;
 Thu, 16 Mar 2023 23:34:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 16 Mar 2023 23:34:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 23:34:33 -0400 (EDT)
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
X-Inumbo-ID: a3961e52-c474-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1679024074; x=1679110474; bh=LF
	mqdDp6YXYTm72Vlia5HwQnvD1gMa7Se9NnalAyYU4=; b=DvAOn9BSW2wanxdHsY
	6+qVP/GVPoNTTf1k/qL2lhOWnmYv3/v4q3D8txQWQruJ5cQyprcUMYN8QgdEErqU
	ylmte6K+Lqud0k+aceI58xmWN6hMXMX3RR7BLbQMTpsF/dIqvjb/Jl/DUM+PGSr1
	AfPPSjxM2AWfZfQCgNxnfO7L/jwI/NCmfDH809odGcv6IfvlyaG+Qt0KWR/L5118
	KNjFCWus9/BAoO8AZaW5U1sTAXbVcZ4gFva6xqLx/QkENe93EpeJJXK3dRMqHtpU
	A90NIejrt6q8nIxSjIT2wOVDhiToNXWU18deJsLePHoD07Uc3bNZ0P7NN1BKX3YC
	NSfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679024074; x=1679110474; bh=LFmqdDp6YXYTm72Vlia5HwQnvD1gMa7Se9N
	nalAyYU4=; b=UYrOVXczwaFw/1UGdYnR1DcOnPuYu9sLsrIL3uBILQYe9//855B
	m0Btwl9qWMrTOdFszvIGfYnCX+mZWhFy6uVE+ErWllIHaWV4O9Z9d34naxc/NbdD
	sq35djsEIbY8jBPet+PcbqhuKGRNHe9HfgfbopAFXqYYAs0xKCeTpvyzNWybNR4B
	1KtAJp418V94wnUKvrgLTYqwkgCG82EEXOduYnI9VW6dcg06N8Lsm0ML5l/JV7b8
	6AyjNCvgu289aD2p5lEtvNp20g+bzwRCES/QJay0RGQAKx20qwjaMIa6S4nickUt
	oUrSYE03P2kdJrE4rBCDA3k5ushTnjq3m2w==
X-ME-Sender: <xms:yt8TZBjpxxnF4G7vZB96BAMFYQRhFMyYoRWpkh-ntHhOXhwhQWQfwQ>
    <xme:yt8TZGDrn4-PgB_HL3TZpbbuazYG7EQHZdIxxJhM5lFM4oYQeKRY77DJqIvXvEI46
    UWsq75GqMps5g>
X-ME-Received: <xmr:yt8TZBHQbwhfChe7vEj8eYKwHKTV_tsFdPYFwU0q1cThG8lr5-o48wLQDc8ApeoleAc3Q-TtdjhcrpnOPY-fQbK9-ync4Po6dg0TWLfQXLBuf8XKc90V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefuddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    lefggfeuffegjeduheeigeetueegfeekjeetgffhvdeiffeiieejgfduieekgeenucffoh
    hmrghinhepghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:yt8TZGRJGt8z-ivgX08mqbeb_oAORo7JPRhkFQyDRqtHxGfJIXnlag>
    <xmx:yt8TZOzblDhU_L_wgO_d0vw46iVyS-z9bl0Cy-c55zurH1ZNEXcosA>
    <xmx:yt8TZM5HbruAVJpZ70mKDriif_zDA33o9uNXzNPEIt0qQnOclF291Q>
    <xmx:yt8TZDqdw-iz9XhLa45TbaRwDDRPgfJO_b_hEMN8lh4hH10s_VWr0g>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: build 6.1.19 kernel for x86-64 dom0
Date: Fri, 17 Mar 2023 04:34:17 +0100
Message-Id: <59ced41c97daac93abe4a2794af289d59808f0ac.1679023966.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be used in tests added in subsequent patches.
Enable config options needed for those tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml                     | 11 ++++-
 automation/tests-artifacts/kernel/6.1.19.dockerfile | 40 ++++++++++++++-
 2 files changed, 51 insertions(+)
 create mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 38bb22d8609b..e1799d454c76 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -790,3 +790,14 @@ kernel-5.10.74-export:
       - binaries/bzImage
   tags:
     - x86_64
+
+kernel-6.1.19-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  script:
+    - mkdir binaries && cp /bzImage binaries/bzImage
+  artifacts:
+    paths:
+      - binaries/bzImage
+  tags:
+    - x86_64
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

