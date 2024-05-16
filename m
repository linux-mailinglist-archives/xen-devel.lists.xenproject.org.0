Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE938C7821
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723368.1128251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beH-000135-BR; Thu, 16 May 2024 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723368.1128251; Thu, 16 May 2024 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beH-0000y4-34; Thu, 16 May 2024 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 723368;
 Thu, 16 May 2024 13:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7beE-0005tl-PR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:54 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91559875-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:53 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 76D441140191;
 Thu, 16 May 2024 09:59:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 May 2024 09:59:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:51 -0400 (EDT)
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
X-Inumbo-ID: 91559875-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1715867992; x=1715954392; bh=8Lwmc35RtboctQggSkgi0
	X2iYEdiNrOG6NFi8XBFJfU=; b=Y07+ofj+C6yaj8CQ62l94Sw9BFdAcITaXDbUd
	oWyna9YEHPrJLiYuedx+YCE15d80c+bmJ8Kc/dci9UUZ0wQb/bARIHmOfXHEfAYx
	q5HCiHRXNnwv1yI7lpi8sfFKBdPffc2+bwx7zV1EKvpgNRX7rE3mwc+5sKkZAipS
	jtRRzbEQqk6HpfRnuorguonI58g2hgNy3QU7+nt8ADaW47vRMPi91WKR+6nygN2W
	/535QV7Z22QbtoM1JBd5XrgrPU1aOD7n/hEyIszi5pg5M6U4/QigTzosy1Ux/mfb
	lL+IKh3FFwiE/dXJKrRoXo9VjDmq13CmBIFMZhG8Wp1/nA01g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867992; x=
	1715954392; bh=8Lwmc35RtboctQggSkgi0X2iYEdiNrOG6NFi8XBFJfU=; b=G
	XaxK/XmnS8GPzNtSwQ9lYdOpRtfzAX4k1UF7pBTDxBF/LCvqAuL7tRCWxhdDy/w4
	frsSh0+VusIHys6Tp1RhQXWsjXX4jv0Gzh43qqCfd9mXzMqbIO2jnXi0SOPNQFtP
	0zxA1l9BI+Du3NzxOSdfWlCdjkyVGr908MucYli7crb+2D5X258x5Xi0OEa6UaeX
	Mo0qp9ND9OzidDt923q1wtuzJYWWEA3+KlFyYb4XVu9ruVg57eNbajVeTRtoytVJ
	H1snnNogValp3Nvh9k5A9icgTM53xwcWT8lp9XGnL2pVJQasG0qvg2KW0eLxK4V2
	tKXsdQPbAAzr0JfHgcbxw==
X-ME-Sender: <xms:WBFGZl4nLb70zh8qrl2tqAhKDyU_E9g93nnWIxjEIxKPqKpWwJ_0ng>
    <xme:WBFGZi5TNqFRN41AR8nB7ZJ-o8UmbMgF_UkE_E-qGn1V8WnmVD8u389qFeEF99AuD
    ShUKwqQUj0z8w>
X-ME-Received: <xmr:WBFGZscWpfyTzaDfcQkqaIrWjxvhFd1WpRliT5-1NjMd6vURJrwhL0hvHC2jOer4WdwHay9UWW6AhU7RXX-wlIZeGjzOTLRWU5rOO5wkq8ylrNp8ibg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueet
    hefgieehheeftdeuleduhffgieelueejhffggfeiieevtefhfeffffeftdehnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:WBFGZuLoGLuJWaZq3hsWG5sizxh9_tOz9y6ruvH5K13oschCr_vtNQ>
    <xmx:WBFGZpL4cfPXWHlaZqDptJ-mjLtD0Ms6_-9HOhkrNbAvhp_S3zsCZw>
    <xmx:WBFGZnyeWFAnU57AzBuWSkQPAOPl-xp0pAEOfjjuhTTw5qT59znh5A>
    <xmx:WBFGZlJ0DOlBUtaoHNgHllOsmnO7KqHYttd6uarA1NyCC0GqFQaOlg>
    <xmx:WBFGZp3Xbzd0XyOsRetrv-AqPwiSpboj2G_1_HSQucziPf5qI0_e5Xt6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 12/12] [DO NOT MERGE] switch to my containers fork
Date: Thu, 16 May 2024 15:58:33 +0200
Message-ID: <c9d3a79f5620f14326e54bf1f56ef0c18740d031.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 automation/gitlab-ci/build.yaml | 19 ++++++++++++++++---
 automation/gitlab-ci/test.yaml  |  9 ++++++++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f1e6a6144c90..88a59692a881 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -260,7 +260,7 @@
 
 alpine-3.19-arm64-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.19-arm64v8
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.19-arm64v8
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -320,7 +320,7 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 alpine-3.19-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.19
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/alpine:3.19
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
     - cp /grub-core.img binaries/grub-core.img
@@ -335,7 +335,7 @@ alpine-3.19-rootfs-export:
 
 kernel-6.1.90-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.90
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.1.90
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
@@ -350,11 +350,13 @@ kernel-6.1.90-export:
 
 alpine-3.19-gcc:
   extends: .gcc-x86-64-build
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19
 
 alpine-3.19-gcc-debug:
   extends: .gcc-x86-64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19
     STUBDOM_LINUX: y
@@ -445,28 +447,33 @@ debian-bookworm-gcc-debug-arm64-randconfig:
 
 alpine-3.19-gcc-arm64:
   extends: .gcc-arm64-build
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
 
 alpine-3.19-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
 
 alpine-3.19-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
     RANDCONFIG: y
 
 alpine-3.19-gcc-debug-arm64-randconfig:
   extends: .gcc-arm64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
     RANDCONFIG: y
 
 alpine-3.19-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -476,6 +483,7 @@ alpine-3.19-gcc-debug-arm64-staticmem:
 
 alpine-3.19-gcc-debug-arm64-static-shared-mem:
   extends: .gcc-arm64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -485,6 +493,7 @@ alpine-3.19-gcc-debug-arm64-static-shared-mem:
 
 alpine-3.19-gcc-debug-arm64-boot-cpupools:
   extends: .gcc-arm64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -598,11 +607,13 @@ debian-bookworm-gcc-arm64-cppcheck:
 
 alpine-3.19-clang:
   extends: .clang-x86-64-build
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19
 
 alpine-3.19-clang-debug:
   extends: .clang-x86-64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: alpine:3.19
 
@@ -698,11 +709,13 @@ debian-bookworm-32-gcc-debug:
 
 fedora-gcc:
   extends: .gcc-x86-64-build
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: fedora:39
 
 fedora-gcc-debug:
   extends: .gcc-x86-64-build-debug
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
   variables:
     CONTAINER: fedora:39
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4e4dca91c26e..0f36036d8275 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,6 @@
 .test-jobs-common:
   stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/${CONTAINER}
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.19-arm64-rootfs-export
@@ -16,6 +16,7 @@
 
 .qemu-arm64:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:bookworm-arm64v8
     LOGFILE: qemu-smoke-arm64.log
@@ -29,6 +30,7 @@
 
 .qemu-arm32:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:bookworm-arm64v8
     LOGFILE: qemu-smoke-arm32.log
@@ -42,6 +44,7 @@
 
 .qemu-x86-64:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:bookworm
     LOGFILE: qemu-smoke-x86-64.log
@@ -55,6 +58,7 @@
 
 .qemu-riscv64:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: archlinux:current-riscv64
     LOGFILE: qemu-smoke-riscv64.log
@@ -68,6 +72,7 @@
 
 .qemu-ppc64le:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:bullseye-ppc64le
     LOGFILE: qemu-smoke-ppc64le.log
@@ -81,6 +86,7 @@
 
 .xilinx-arm64:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: qemu-smoke-xilinx.log
@@ -129,6 +135,7 @@
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
   variables:
     CONTAINER: debian:bookworm
     XEN_TARGET_ARCH: x86_64
-- 
git-series 0.9.1

