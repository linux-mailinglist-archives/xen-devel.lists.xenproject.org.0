Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CAA7DDC2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939853.1339888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgj-0000Xx-Uj; Mon, 07 Apr 2025 12:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939853.1339888; Mon, 07 Apr 2025 12:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgj-0000UY-QJ; Mon, 07 Apr 2025 12:34:53 +0000
Received: by outflank-mailman (input) for mailman id 939853;
 Mon, 07 Apr 2025 12:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgh-0006u9-IM
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:51 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1e75ccd-13ac-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:34:49 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id AC8171380334;
 Mon,  7 Apr 2025 08:34:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 07 Apr 2025 08:34:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:47 -0400 (EDT)
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
X-Inumbo-ID: b1e75ccd-13ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029288; x=1744115688; bh=RayiXMebKB
	VQZ9cR/fh1HsEVnIaXaoIq2vJJNpeCIXQ=; b=hI9fbPYGdd8sBUDcXodPNV+mMP
	Npw9lz4vw0/wBUzEBG4Jv+d1tGIWSoOYbcyFQ6xVuHAapxbMbuXkEEPeStFdVfkV
	WvGmQpquqEKp8vtwZv1801XhE+9gvWpQLV3gew97EzBGE574TDti0Xa/PEslNSHE
	OaLEbdspUfs6YKgxdlpGsQ0EPyUd2i0RwPyWvzCT6kdYmdJ6nR0mKXjv2oX1FESJ
	LHiUh579rXo+MRwJUaScN56CSNaW0KpaG4KrhOdSaOUl6ElM9HxZLNY02k5+r8pN
	VQaDhHIkvXeUP1EhRl4BQMtABROeHbPZdrcKFa3FGy7NCZOxxIXaDiLWmpzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029288; x=
	1744115688; bh=RayiXMebKBVQZ9cR/fh1HsEVnIaXaoIq2vJJNpeCIXQ=; b=g
	wO3332R7XyaioCHDeCbr9O9woMKViFedyqd69o5sJLFZuyszSL5zzg2tsLcAKY0D
	TW95S0BB6Ort8ap8LnYqtDXGk/szlN0GvvyGyhIuuidYblxMCnX2mp4X/pnMIMGV
	r26ebRjNA3pwaMd54xEByYkc/gSSTs/o4/7X0XM2BX+BgGoPwGM9rEkGi4jKgF9k
	LRu6xLmYtIltr1HtojXhaSQCf0WDuP6VBUjxpJPicY3xHUaCRorVeBIx8uKT6kwF
	penSKHF5eIS4uFWXd2W/eByJGYDhuwF/5naeLZqHk1EdFE1+uSQ0Nt5BjUW0XScE
	PM2nEpNJbCmmVzTGf/5jA==
X-ME-Sender: <xms:aMbzZ1dF3pVyWzlv-KKYm_Vl0SeI6aC_fgCzdlLnJC92cbEfh2eEPA>
    <xme:aMbzZzPMGSgdrMedIdlt78gGRDLtCCSAHXZNax4yG7sGZhdBp6zzvNCy2EOfKZ59L
    jlo40C1CfMroA>
X-ME-Received: <xmr:aMbzZ-gb1rApHOmpZoqcjFauNjX9ePZI1LP5SydFy0j_k7e9yimkUZ8TzHiLsSbRk93AhRHDZj6Pyn7IVgwsbPE8qidhHsC6e7Iv-EU2L8knWTbBfWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:aMbzZ--9_9ZbRnPq6R076mRfCMBErcOReqhWbHP0k8KfbvxBE9Yvrg>
    <xmx:aMbzZxtdIOb3JTASiT0Rxm3bRoLjg_rygIyIKG1oE5pbbMqwHIQMCg>
    <xmx:aMbzZ9GCOM-97aGOaaZjBAeWxtYke11tN3gmyucdC-O3QuwjzVTrhA>
    <xmx:aMbzZ4MK4Ul6maBIQnUtLQtSFGxPRJlj-dP-saGC-KIYZHjUWyxwQA>
    <xmx:aMbzZw0jJwjM0KBao6qxTqzauAjJlD8vZwT04piMDP0eGbDsZpQFzQ51>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 12/12] CI: save toolstack artifact as cpio.gz
Date: Mon,  7 Apr 2025 14:31:12 +0200
Message-ID: <ded706422ea35898ac4f9c64cf41e11795347bb0.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
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
index 9b47b662c3f2..81e8ff24327a 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -35,7 +35,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../dist/install/* .
 mkdir -p root etc/local.d
 mv ../initrd-domU.cpio.gz ./root/initrd.cpio.gz
 cp ../bzImage ./root
@@ -61,6 +60,7 @@ xl -vvv create -c /root/test.cfg
 chmod +x etc/local.d/xen.start
 # rebuild Dom0 rootfs
 cp ../initrd.cpio.gz ../xen-rootfs.cpio.gz
+cat ../toolstack.cpio.gz >> ../xen-rootfs.cpio.gz
 find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 533b286528f1..2e5246f2c9b6 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -33,7 +33,6 @@ mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-cp -ar ../dist/install/* .
 mkdir -p etc/local.d root
 mv ../initrd-domU.cpio.gz ./root/initrd.cpio.gz
 cp ../Image ./root
@@ -56,6 +55,7 @@ xl -vvv create -c /root/test.cfg
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 cp ../initrd.cpio.gz ../xen-rootfs.cpio.gz
+cat ../toolstack.cpio.gz >> ../xen-rootfs.cpio.gz
 find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 70085e26c139..93f4fb410690 100755
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
 cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 399d72e0600d..4fe59fce8999 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -195,7 +195,6 @@ mkdir proc
 mkdir run
 mkdir sys
 mkdir -p etc/local.d
-cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
 
@@ -231,8 +230,10 @@ else
 fi
 
 chmod +x etc/local.d/xen.start
+mkdir -p etc/xen
 echo "$domU_config" > etc/xen/domU.cfg
 
+mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
@@ -242,6 +243,7 @@ if [ -n "$domU_check" ]; then
 fi
 # take base initrd and append test-specific files
 cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 6b9f0e4a8dc7..ea0f952975c7 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -115,8 +115,7 @@ rm -rf rootfs
 mkdir -p rootfs
 cd rootfs
 mkdir boot proc run srv sys
-cp -ar ../binaries/dist/install/* .
-mkdir -p etc/local.d
+mkdir -p etc/local.d etc/xen etc/default
 echo "#!/bin/bash
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -134,6 +133,7 @@ cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs-overlay.cpio.gz boot/initrd-domU-overlay
 copy_dom0_files
 cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 81be60e2026e..dbb955df0478 100755
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
 cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+cat ../binaries/toolstack.cpio.gz >> ../binaries/dom0-rootfs.cpio.gz
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
git-series 0.9.1

