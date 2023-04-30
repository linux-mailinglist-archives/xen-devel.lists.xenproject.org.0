Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F86F2B6B
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 00:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527891.820522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkm-0001j1-A0; Sun, 30 Apr 2023 22:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527891.820522; Sun, 30 Apr 2023 22:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkm-0001fd-6X; Sun, 30 Apr 2023 22:42:48 +0000
Received: by outflank-mailman (input) for mailman id 527891;
 Sun, 30 Apr 2023 22:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVg7=AV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ptFkk-0001dl-C4
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 22:42:46 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb274d7-e7a8-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 00:42:42 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B542E5C00A0;
 Sun, 30 Apr 2023 18:42:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Apr 2023 18:42:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Apr 2023 18:42:36 -0400 (EDT)
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
X-Inumbo-ID: 4eb274d7-e7a8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682894557; x=1682980957; bh=v2
	Vi7FgEgNWCjyUl2feZ+z266kJ26xqC5Cqb4uQACSc=; b=E4U3sDTC6au7lRyETH
	63MPUAdEiBt0XwlbbNo7uEOuD9zihvr+6ai76H6yQRNyj8j/0+AZKq9D4BTSECj9
	dP6X/E4n/Y/C9UGskyKxGwEPOsy1whCEwa1OLCV/uELFuWvdstm/Yx4TqOrzUK08
	9u7j/M3pKNSvEPdBTTMulMIoAwOKEZDJKKtYcRMgpwoMwtJxhtC2WRKfxMeqy9yS
	YrbLcqCmPeTWiUzZs2vHczaPzk7iYAnegxyzQOhcdsyfgLxfaf86mmqd1AqfWuhd
	y86LDiUF10ALwVtqqKfovqUuJgnb2C338IF8ncNfFG1q2IWcIOL8aB7pgm9BY33Z
	eIcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682894557; x=1682980957; bh=v2Vi7FgEgNWCjyUl2feZ+z266kJ26xqC5Cq
	b4uQACSc=; b=iGH9evVcNV1k9ggHEWeyVjxyQfEQFKAZkwih711T/Hty4cGhfcM
	sqnrLH556V8nwbQjhUcTnQSM4TezNWgUVAroa0xOSpfk01fxTFGA5DweEnF6GYUy
	U8qYPuXgxFhEoL/aRPLWXR+UywXM0ZqFA6doa6gRBDpWWhMl4tm4kBqKybKKZTs4
	4I6huimvPmRCN70+GShjHupKaaAMTl6Yj2K+OIBZDybErjdoS5oDgk6HS60fnK7U
	LEPhqcaP8EGF4D2L67nKfaNaQxY7LsJ/EeMTuAIbALr7nEzGqnKq94fJQe6Hnb8j
	z9x50tkGzSHA50In48LJAwTRiFGyAof6GvA==
X-ME-Sender: <xms:3e5OZCpFOwU3hWJKGUwqsEk1SdlAuPly12rqwVgu24veq0XB7gel3A>
    <xme:3e5OZApLDvGRgKwDb0AoDpQ4BTCNKX_tf47N_2aQW2_21Z-i_RenZHHRhDE3fdmwG
    8fDFO8zp7z9CA>
X-ME-Received: <xmr:3e5OZHNHGUuIAxVkbSwanR9WOezF_IKIiiSEv1COoEC-4Kib8T4iVtkzLFVc9afdoxMwZWKejTtqpFmCOWJG4hhgrfxTTJ9Ki6lnVqKv_lJL-3mEHaLr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeel
    fedtfefgfffghfevhfehvdeileehheffueekieetfeffhfetgefggfejudfggeenucffoh
    hmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:3e5OZB4q3Iz4UFI4kmCZKYIu7tI49ngOCIbC0pKE-zTd-kEnm6nGJg>
    <xmx:3e5OZB6ngNuiX-wzATpSTNO6B4bx-ZB9J8C2TDWhax_azpzxWidbPw>
    <xmx:3e5OZBi4eqD9mikA2JPnS-1zc9BCaxhh94BlSUOJOlfwv7A33pf6qg>
    <xmx:3e5OZDQbN7qLSss2lj1AYYUPlynaQ4A30JGwg7jCbUUaYes082V9Cw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] automation: move test artifacts jobs to the top
Date: Mon,  1 May 2023 00:42:22 +0200
Message-Id: <1529fdbdd083aa64c2d234b7ee88206bec774972.1682894502.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
References: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make them run earlier, so tests can start earlier in parallel to the
build jobs.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml | 152 ++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d323c30a8304..3f44902c44d0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -236,6 +236,82 @@
   variables:
     <<: *gcc
 
+## Test artifacts common
+
+.test-jobs-artifact-common:
+  stage: build
+  except: !reference [.test-jobs-common, except]
+
+# Arm test artifacts
+
+alpine-3.12-arm64-rootfs-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - arm64
+
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
+qemu-system-aarch64-6.0.0-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
+  artifacts:
+    paths:
+      - binaries/qemu-system-aarch64
+  tags:
+    - arm64
+
+qemu-system-aarch64-6.0.0-arm32-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
+  artifacts:
+    paths:
+      - binaries/qemu-system-arm
+  tags:
+    - arm64
+
+# x86_64 test artifacts
+
+alpine-3.12-rootfs-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - x86_64
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
+
 # Jobs below this line
 
 archlinux-gcc:
@@ -705,79 +781,3 @@ debian-unstable-gcc-arm64-cppcheck:
     CONTAINER: debian:unstable-cppcheck
     CPPCHECK: y
     HYPERVISOR_ONLY: y
-
-## Test artifacts common
-
-.test-jobs-artifact-common:
-  stage: build
-  except: !reference [.test-jobs-common, except]
-
-# Arm test artifacts
-
-alpine-3.12-arm64-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - arm64
-
-kernel-5.19-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
-  script:
-    - mkdir binaries && cp /Image binaries/Image
-  artifacts:
-    paths:
-      - binaries/Image
-  tags:
-    - arm64
-
-qemu-system-aarch64-6.0.0-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
-  artifacts:
-    paths:
-      - binaries/qemu-system-aarch64
-  tags:
-    - arm64
-
-qemu-system-aarch64-6.0.0-arm32-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
-  artifacts:
-    paths:
-      - binaries/qemu-system-arm
-  tags:
-    - arm64
-
-# x86_64 test artifacts
-
-alpine-3.12-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - x86_64
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
-- 
git-series 0.9.1

