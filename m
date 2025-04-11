Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A75FA86741
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947822.1345462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4H-0000Yg-2q; Fri, 11 Apr 2025 20:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947822.1345462; Fri, 11 Apr 2025 20:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4G-0000Wg-Ui; Fri, 11 Apr 2025 20:33:40 +0000
Received: by outflank-mailman (input) for mailman id 947822;
 Fri, 11 Apr 2025 20:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L4F-0007cp-72
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:39 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ee5cbc3-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:33:37 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id D7A38138021C;
 Fri, 11 Apr 2025 16:33:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 11 Apr 2025 16:33:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:35 -0400 (EDT)
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
X-Inumbo-ID: 3ee5cbc3-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403616; x=1744490016; bh=YUNGCrguCt
	aKfdk0ykLhED3S58oNoWyLOaKPEveJ8o0=; b=H7gZIBnMiR5sM1nUYeFoJnOMVC
	yL4YXMTZoWaTXoKAJQNmnei8zOOJyl8YafMOOvcvTgilhNfeoKb4Ke5ezhm9KfsV
	ZIgMc02qoYJor0qT81RDXNKvbM3fWqHqo5loHyAopPZmRSTLc8KKtrFDyaBnnJBE
	HwiCMBWld424/7QM2GuMQX6fhN1ZFcNpMHfmfFVGCQuBckEaewSEbJe/GlQMw8Bc
	XaazjIdpouY5YFfmYqE+EY6dsbBcStDL237ElqHMqKxQenSoOC3ZlhXYZKNlkudr
	WlyeqmqL4psiB2ld3QQcjyUovbIZhz98Vl6yzut12+2KboxrgquJhYO7TLww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403616; x=
	1744490016; bh=YUNGCrguCtaKfdk0ykLhED3S58oNoWyLOaKPEveJ8o0=; b=m
	2BEqRh4HomZTX9T0ahPkRqAIsy7aIxJAxAAttQOf4vaWSITrAFQsqrNl4evgK5Ml
	F1wQlT94lG+VaDMfg6cjRXzbYwpzeEeIZZGnQXn915z7YbofniFKOaF+MbY4Ol3T
	R2RKWx1OhnAeWRG+jPj1ToqPkfKPKu6X32XLLveH9Kqt9GvRYb/13PFwdkD1dS9O
	VMUW2qIGxL+0uKvk9gar1HcPFw8Ib9Xv+LCIxP8+bDPP8M48dF6cIHeYxQ/cUO5f
	R1zBvC6nR29Cppu15/e+0VZBAY8ZSX3c7w1QSA9KKo/ZswoJ3TjDZhw3rb+0smfS
	auOQHvRsLkVrTFVPivPaw==
X-ME-Sender: <xms:oHz5Z0oud2TwrmkkK8nnEOasopxvs-UR8NrQZSQ4qMx0kl_5VzGU8g>
    <xme:oHz5Z6pNg_qz3TEEHUdTvACRpLzpmdWb4_DD3c9V5u8CjvVF2uHN0rFiGxc3FF3CN
    ZL698v7ZFS4Ow>
X-ME-Received: <xmr:oHz5Z5Mlx51KYttEN_HVahk2NM6gLMAatowqbUiPDVkOhIMYjmbHLeQPSZJAkgbxD0Fs9pTy2OxIjSOYxitTd3t9CeZxVszJu-CpSmkFudsAEWVQa2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:oHz5Z7599HtPApBybawrBmFgFAZdBELvZ6bv5Thz9A_wywqPQV15fQ>
    <xmx:oHz5Zz4CflvvaRnlKUw_qDZcgN2A8ZfVOl1-BzkFd2b3vIJ2IHzPKw>
    <xmx:oHz5Z7hEuYBR_6WFSRHSLYnhUinXfBJeqY6m_rZIqabOLBnLN23xMg>
    <xmx:oHz5Z94j3Z6mVa1eX8OqrzVBu-LPr3b4MOZk746Xh-hVmR9tIKKArw>
    <xmx:oHz5ZywSloNOaeYx7ptwBSFU6oeOsNADdEw5r0LjjoI9IGPylke60P5L>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 7/7] CI: save toolstack artifact as cpio.gz
Date: Fri, 11 Apr 2025 22:32:19 +0200
Message-ID: <ad49ca0e3fda22639d7a00d17eda786a81b0e6f7.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This avoids the need to re-compress it in every test job.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v2
---
 automation/scripts/build                          | 2 +-
 automation/scripts/qemu-alpine-x86_64.sh          | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qubes-x86-64.sh                | 4 +++-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 4 ++--
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 7 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 522efe774ef3..365534895047 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -108,7 +108,7 @@ else
     # Note: Some smoke tests depending on finding binaries/xen on a full build
     # even though dist/ contains everything, while some containers don't even
     # build Xen
-    cp -r dist binaries/
+    (cd dist/install; find | cpio -o -H newc | gzip) > binaries/toolstack.cpio.gz
     cp -r tools/tests binaries/
     collect_xen_artefacts
 fi
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 6e0a67b4018c..746fd48e6a0e 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -35,7 +35,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../dist/install/* .
 mkdir -p root etc/local.d
 mv ../initrd.cpio.gz ./root
 cp ../bzImage ./root
@@ -61,6 +60,7 @@ xl -vvv create -c /root/test.cfg
 chmod +x etc/local.d/xen.start
 # rebuild Dom0 rootfs
 cp ../rootfs.cpio.gz ../xen-rootfs.cpio.gz
+cat ../toolstack.cpio.gz >> ../xen-rootfs.cpio.gz
 find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 86047ccd9e7b..a3f321b253e2 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -33,7 +33,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../dist/install/* .
 mkdir -p etc/local.d root
 mv ../initrd.cpio.gz ./root
 cp ../Image ./root
@@ -56,6 +55,7 @@ xl -vvv create -c /root/test.cfg
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 cp ../rootfs.cpio.gz ../xen-rootfs.cpio.gz
+cat ../toolstack.cpio.gz >> ../xen-rootfs.cpio.gz
 find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index b095a5008e30..a73cb24b7e52 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -121,7 +121,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../binaries/dist/install/* .
 mkdir -p etc/local.d
 
 echo "#!/bin/bash
@@ -142,6 +141,7 @@ ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 99c2ece304f0..a9696d2168c3 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -198,7 +198,6 @@ mkdir run
 mkdir srv
 mkdir sys
 mkdir -p etc/local.d
-cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
 
@@ -232,8 +231,10 @@ else
 fi
 
 chmod +x etc/local.d/xen.start
+mkdir -p etc/xen
 echo "$domU_config" > etc/xen/domU.cfg
 
+mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
@@ -243,6 +244,7 @@ if [ -n "$domU_check" ]; then
 fi
 # take base initrd and append test-specific files
 cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 52a0e05e3f1b..40f23f29582e 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -116,8 +116,7 @@ rm -rf rootfs
 mkdir -p rootfs
 cd rootfs
 mkdir boot proc run srv sys
-cp -ar ../binaries/dist/install/* .
-mkdir -p etc/local.d
+mkdir -p etc/local.d etc/xen etc/default
 echo "#!/bin/bash
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -133,6 +132,7 @@ cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 copy_dom0_files
 cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 97190d0cbb9c..ab9205f29689 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -63,7 +63,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../binaries/dist/install/* .
 
 mkdir -p etc/local.d
 echo "#!/bin/bash
@@ -77,6 +76,7 @@ ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
git-series 0.9.1

