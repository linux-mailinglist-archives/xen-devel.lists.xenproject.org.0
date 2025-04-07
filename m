Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F9A7DDE3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939934.1339909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmf-0005Kh-VI; Mon, 07 Apr 2025 12:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939934.1339909; Mon, 07 Apr 2025 12:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmf-0005Fo-NF; Mon, 07 Apr 2025 12:41:01 +0000
Received: by outflank-mailman (input) for mailman id 939934;
 Mon, 07 Apr 2025 12:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgh-0006Bg-ML
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:51 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10c42b4-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:48 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 40B931380191;
 Mon,  7 Apr 2025 08:34:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Mon, 07 Apr 2025 08:34:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:45 -0400 (EDT)
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
X-Inumbo-ID: b10c42b4-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029287; x=1744115687; bh=0lH0mmLiee
	74SgDvco7HYwzx3T1Kyj8W/7DH9aYE+F8=; b=WCD3ukoAQ+QFlMR7aUFHcehRb/
	KTUMDZFfWKHggS/01GyH0ELWjyL/zBM59is2SNHAt3uQSEOV4+IyBwQ4YhmECoQ6
	Pl+N6l7BEvRZd5d9z626S84UzU7vTRYqbtSmNdT2wm1vnkIJ/SmeT/xFQ0kTLe4P
	3z8t76tG6YPossk8YsPy6ajDkyJZvvLtp4+goVeCBdNymhP2PK+DOgsdMHe4IKZr
	RuXw9cITZF4BjZIgkJK1jAWo6WpBNniAYrUKHIt8ZOxueqBS5rt6Pita48LyR2Ee
	w8aFtikbDrqKQlIKza2cUcdIamF3QXnfrLKIrkCbgeDcBNuv+SoaKmrUgRoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029287; x=
	1744115687; bh=0lH0mmLiee74SgDvco7HYwzx3T1Kyj8W/7DH9aYE+F8=; b=o
	gW/NnV1ayS2qtraAS0eNIBRNBURb+K/eg/D/RqjGFuhH/fvmLQ3SN9W+3udLqy4W
	R3UMTgv59L8iRihm3H1s6tXQoHm22zXVnWM7VFbuLbBqZEazqZx48OHZnvtGgsQD
	lz6sBE7QxSM+bbNkWsTfEsf8y/u04683ov22tShYFcPlvKNBF6nvuMBwInBQXw2H
	Dr/3OgM4KyWhnouZdsLSXlz05b52Wjf/R+ukR72rOnhIfNNYqqb4z4T5M+Ms/BVC
	7y+kxEEfTdf/WtZE4totQd7Xw3NX60niyYrbGDVU6Hi8O9zDciadK8XnrQOTSVsu
	TIUjg7RWEFJjJyqIMaNOQ==
X-ME-Sender: <xms:ZsbzZ88lBBbXA1v6iGB7_tiicjI4HvMiinzt3Xk8-HFEzpO2OzaHfQ>
    <xme:ZsbzZ0svhr6kWah99qCRfqJ9prABQMchBIVuMqQjQARL69N4l5TbOZ2SMeBSPDF4A
    yq9riMOKuRH9Q>
X-ME-Received: <xmr:ZsbzZyDdI0jJ3dwIMFzkrEUq2B0DRMxnlYUX_gBu8v4d6WIOUXG95XJmtedh_crDNTZqTULREtlUfF1XTPpJTlo9VK9Mkns6fbJxcTBjPYWQLmTKeEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeelfedtfefgfffghfevhfehvdeileehheffueekieetfeffhf
    etgefggfejudfggeenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrh
    guohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:ZsbzZ8dSU8550WLxRioLLXHQXk-f2M2hagGXHxBGLN3_X3d9W-sAxA>
    <xmx:Z8bzZxPNkNPfo29eXJkivWspMWWLg-hfHQ2DTbsY_-JcKGjfkhJpYA>
    <xmx:Z8bzZ2n_UDXj-IWB-UVFNBTGKvRtsL_LtCLyNojD0xt-2Sl6eUb-EQ>
    <xmx:Z8bzZzunXm73-SSklYBZmLmKqCPe2sTPb-8Ya2g_B44ceNSckqE1ng>
    <xmx:Z8bzZ4XS2-4jJSjOUzAiGmTf02vPJckjv8YBe1LLfT1b4dPExnZ1EWFj>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/12] CI: avoid repacking initrd as part of the test job
Date: Mon,  7 Apr 2025 14:31:11 +0200
Message-ID: <18391a01aef89e928d04fd746fb6e5e5943df439.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The prerequisite for this is building initrd.cpio.gz, not only
initrd.tar.gz. That's a change in the test-artifacts repository.

Having that, do not repack the whole initrd, but only pack modified
files and rely on Linux handling of concatenated archives.
This allows packing just test-related files (which includes the whole
toolstack), instead of the whole initrd.

DomU initrd handling is a bit more complicated thing. It's sent to the
target host as part of the dom0 initrd. But to modify/extend it, the
"overlay" need to be applied already on the target system (otherwise
controller host would need to repack it anyway). So, make the
initrd.cpio.gz in test-artifacts include boot/initrd-domU already, and
add test-specific files as boot/initrd-domU-overlay that is concatenated
by dom0 boot script.

Since full initrd is not unpacked now when preparing domU (and dom0)
rootfs, a couple of minor changes are needed to how they are prepared.
This includes creating whole etc/issue file, instead of modifying
existing one, and a need to create a couple directories.

And since there is now initrd.cpio.gz artifact, rename temporary domU
initrd to initrd-domU.cpio.gz

Finally, move adding "rc_verbose=yes" to /etc/rc.conf to initrd
building.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v2

In fact, alpine/3.18.dockerfile in this repository is not what
is used to build initrd.cpio.gz for test here, but add it anyway in case
there are some other tests using it that I missed. If it's really
unused, it probably should be removed, but that's a separate patch.

Jobs xilinx-* are untested, as I don't have necessary access.
---
 automation/gitlab-ci/build.yaml                           |  5 +-
 automation/scripts/qemu-alpine-x86_64.sh                  | 11 +--
 automation/scripts/qemu-smoke-dom0-arm64.sh               | 11 +--
 automation/scripts/qemu-smoke-dom0less-arm64.sh           |  7 +--
 automation/scripts/qubes-x86-64.sh                        | 29 +++-----
 automation/scripts/xilinx-smoke-dom0-x86_64.sh            | 23 +++---
 automation/scripts/xilinx-smoke-dom0less-arm64.sh         | 14 +---
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile |  5 +-
 automation/tests-artifacts/alpine/3.18.dockerfile         |  1 +-
 9 files changed, 55 insertions(+), 51 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d41f27fc94bf..8e1ff0178469 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -268,10 +268,13 @@ alpine-3.18-arm64-rootfs-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18-arm64v8
   script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+    - mkdir binaries
+    - cp /initrd.tar.gz binaries/initrd.tar.gz
+    - cp /initrd.cpio.gz binaries/initrd.cpio.gz
   artifacts:
     paths:
       - binaries/initrd.tar.gz
+      - binaries/initrd.cpio.gz
   tags:
     - arm64
 
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 17e2141d625e..9b47b662c3f2 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -25,20 +25,19 @@ mount -t devtmpfs devtmpfs /dev
 chmod +x initrd/init
 # DomU rootfs
 cd initrd
-find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+find . | cpio --create --format='newc' | gzip > ../initrd-domU.cpio.gz
 cd ..
 
 # initrd.tar.gz is Dom0 rootfs
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
-mv ../initrd.cpio.gz ./root
+mkdir -p root etc/local.d
+mv ../initrd-domU.cpio.gz ./root/initrd.cpio.gz
 cp ../bzImage ./root
 echo "name=\"test\"
 memory=512
@@ -60,9 +59,9 @@ xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
 # rebuild Dom0 rootfs
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cp ../initrd.cpio.gz ../xen-rootfs.cpio.gz
+find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
 cat >> binaries/pxelinux.0 << EOF
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 8774a8701232..533b286528f1 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -24,19 +24,18 @@ mount -t devtmpfs devtmpfs /dev
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
-find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+find . | cpio --create --format='newc' | gzip > ../initrd-domU.cpio.gz
 cd ..
 
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
-mv ../initrd.cpio.gz ./root
+mkdir -p etc/local.d root
+mv ../initrd-domU.cpio.gz ./root/initrd.cpio.gz
 cp ../Image ./root
 echo "name=\"test\"
 memory=512
@@ -56,8 +55,8 @@ xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cp ../initrd.cpio.gz ../xen-rootfs.cpio.gz
+find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f72d20936181..70085e26c139 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -117,13 +117,12 @@ cd ..
 # DOM0 rootfs
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../binaries/dist/install/* .
+mkdir -p etc/local.d
 
 echo "#!/bin/bash
 
@@ -142,8 +141,8 @@ xl network-attach 1 type=vif
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # ImageBuilder
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 861e302d845b..399d72e0600d 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -167,13 +167,10 @@ if [ -n "$domU_check" ]; then
     # DomU
     mkdir -p rootfs
     cd rootfs
-    # fakeroot is needed to preserve device nodes in rootless podman container
-    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
     mkdir proc
     mkdir run
-    mkdir srv
     mkdir sys
-    rm var/run
+    mkdir -p etc/local.d
     echo "#!/bin/sh
 
 echo 8 > /proc/sys/kernel/printk
@@ -181,23 +178,23 @@ echo 8 > /proc/sys/kernel/printk
 ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
-    echo "rc_verbose=yes" >> etc/rc.conf
-    sed -i -e 's/^Welcome/domU \0/' etc/issue
-    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+    echo "domU Welcome to Alpine Linux 3.18
+Kernel \r on an \m (\l)
+
+" > etc/issue
+    find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs-overlay.cpio.gz
     cd ..
     rm -rf rootfs
 fi
 
-# DOM0 rootfs
+# DOM0 rootfs - this will be an overlay over alpine's initrd
 mkdir -p rootfs
 cd rootfs
-fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
 mkdir boot
 mkdir proc
 mkdir run
-mkdir srv
 mkdir sys
-rm var/run
+mkdir -p etc/local.d
 cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
@@ -221,6 +218,8 @@ fi
 
 if [ -n "$domU_check" ]; then
     echo "
+# append test-specific files to domU initrd
+cat /boot/initrd-domU-overlay >> boot/initrd-domU
 # get domU console content into test log
 tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
@@ -234,18 +233,18 @@ fi
 chmod +x etc/local.d/xen.start
 echo "$domU_config" > etc/xen/domU.cfg
 
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 if [ -n "$domU_check" ]; then
-    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+    cp ../binaries/domU-rootfs-overlay.cpio.gz boot/initrd-domU-overlay
 fi
-find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+# take base initrd and append test-specific files
+cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-
 TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7834ffbe0593..6b9f0e4a8dc7 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -80,6 +80,7 @@ argo-exec -l -p 28333 -- /bin/echo
 "
 copy_dom0_files ()
 {
+    mkdir -p root usr/local/lib
     cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
     cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
     cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
@@ -92,9 +93,8 @@ fi
 # Set up domU rootfs.
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
 mkdir proc run srv sys
-rm var/run
+mkdir -p etc/local.d
 echo "#!/bin/sh
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -102,36 +102,39 @@ PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-sed -i -e 's/^Welcome/domU \0/' etc/issue
+echo "domU Welcome to Alpine Linux 3.18
+Kernel \r on an \m (\l)
+
+" > etc/issue
 copy_domU_files
-find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs-overlay.cpio.gz
 cd ..
 rm -rf rootfs
 
 # Set up dom0 rootfs.
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
 mkdir boot proc run srv sys
-rm var/run
 cp -ar ../binaries/dist/install/* .
+mkdir -p etc/local.d
 echo "#!/bin/bash
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
 bash /etc/init.d/xencommons start
+# append test-specific files to domU initrd
+cat /boot/initrd-domU-overlay >> boot/initrd-domU
 ${DOM0_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
-cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+cp ../binaries/domU-rootfs-overlay.cpio.gz boot/initrd-domU-overlay
 copy_dom0_files
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # Load software into TFTP server directory.
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index b24ad11b8cac..81be60e2026e 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -41,33 +41,31 @@ fi
 # DomU
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
+mkdir -p etc/local.d
 echo "#!/bin/sh
 
 ${domU_check}
 /bin/sh" > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+cp ../binaries/initrd.cpio.gz ../binaries/domU-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
 # DOM0 rootfs
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../binaries/dist/install/* .
 
+mkdir -p etc/local.d
 echo "#!/bin/bash
 
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -78,8 +76,8 @@ bash /etc/init.d/xencommons start
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cp ../binaries/initrd.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
index a4542f703997..78d465dc6a39 100644
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
@@ -60,7 +60,10 @@ RUN \
   echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
   echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
   passwd -d "root" root && \
+  echo "rc_verbose=yes" >> /etc/rc.conf && \
   \
   # Create rootfs
   cd / && \
-  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
+  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var && \
+  find bin dev etc home init lib mnt opt root sbin usr var |\
+    cpio -o -H newc | gzip > /initrd.cpio.gz
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 311a92889b87..ff124fef49a8 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -61,6 +61,7 @@ RUN \
   echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
   echo > /etc/modules && \
   passwd -d "root" root && \
+  echo "rc_verbose=yes" >> /etc/rc.conf && \
   \
   # Create rootfs
   cd / && \
-- 
git-series 0.9.1

