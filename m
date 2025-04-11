Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3AA86745
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947821.1345452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4D-00007R-JQ; Fri, 11 Apr 2025 20:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947821.1345452; Fri, 11 Apr 2025 20:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4D-0008Tt-CG; Fri, 11 Apr 2025 20:33:37 +0000
Received: by outflank-mailman (input) for mailman id 947821;
 Fri, 11 Apr 2025 20:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L4B-0007Qw-Ot
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:35 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d295e74-1714-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 22:33:34 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id F1B8E13801E9;
 Fri, 11 Apr 2025 16:33:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 11 Apr 2025 16:33:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:32 -0400 (EDT)
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
X-Inumbo-ID: 3d295e74-1714-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403613; x=1744490013; bh=NDEEL3vnp9
	1rUswoHWj1DPTJJmgLP0WDQTpqGrFuTCo=; b=kDr5k72ygdLZCZkGX7ib57cawd
	jFCLdCRzjtEby7UUs4vdGQytO6iQQz+mO/k61F/J2XicAPHt7EIn794JVZqr8xX9
	zxh3LM0err2uZOgfwZbAEKNnz/u2C/xG6aGDKoEvCXP3LjtgClb+VLGJCIFIIEPI
	+rfteppAPMpQ3MSHrcr7ZhXVCqliYzIYuGI2d9Ha+oiQe/QYJ/JevRE25O34qRMw
	Ay7tOPjYViC5SArZHCaN1xYjontoeXGXCuaWZbI/3VgmIk0OFjIqAmunCrKQJNuH
	9j0iiQM/YQX6GVLyipfcn5L7TLI7d7NDrJ7E+45Pxgpu2KRxUBET8R4mLNKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403613; x=
	1744490013; bh=NDEEL3vnp91rUswoHWj1DPTJJmgLP0WDQTpqGrFuTCo=; b=k
	TOUJzB6jUQX+DE6z7ysaEoJTXOVXLu6PGb3ZJojqunCUhwdOMOavxGLBSltSlGjH
	H1XeQXkUwwQoNxZCRs2HZRi1JDTCtjf59/V39+FFZvDUoZRib2DDEwhM1gVLcttf
	ohA9q6ppMPRXaBvL5z0LegG6aQgIsPNXbvBEPHXnR9sExcLMJD91kzoBmL+XCqSL
	zDgx07wFwP6r3sj4g9dh6/I6kqcY+jOrTrnba6n6QRsJWoIH6qNv35p4VLWCx2cD
	mCaqaVfV+LouCkqqWmaL8ERynQUYU7qCMgSJbLlu9EYmxB94bVacWSHpoosiLFhe
	Yye181zqP0iSHKTHGo9RQ==
X-ME-Sender: <xms:nXz5Z27MgfV_VUA-vHbpzN9x48v00dGIhHnA2eBGvr3d8tH5JpNlZw>
    <xme:nXz5Z_76TEfeIwTNwBywBkO3afB15F98r18Chc9bYQPyaltZ-Rrhe07Zc_JqrOFtn
    SDGgglPATPs9Q>
X-ME-Received: <xmr:nXz5Z1dqzyKZgGEcaSUoJ_rGiXtewpY4GQT_BM0tI4i1gv9Xey0D6pEXyVN2uUQDr8nVkQooc0-vhmzkabhjJywSjpoXyWSoZjyjjp927PmAy9jpebM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:nXz5ZzLd8ep7RWYaQ11PwFnTIza0278CdV7CCSgKYurmJVAcFFJABw>
    <xmx:nXz5Z6LeEdiOaIC0zViTy-iqErRS1_3KZpFlvk_npEnlFLYC9Jiehw>
    <xmx:nXz5Z0zz30c1A8UG8qyK6blP6kT-rwqtKc7uLpv_U0bEVmIpFz5pWA>
    <xmx:nXz5Z-JwnnM2L4Ptugp9t1IMCIvlnc36lGyEpHuuByyTQ8ybuYkwNg>
    <xmx:nXz5Z2CVRlq1bGXxLXnrMMHtSPRbfuZ_aBCfuByq1YFSb_lYvL8GZbun>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/7] CI: avoid repacking initrd as part of the test job
Date: Fri, 11 Apr 2025 22:32:17 +0200
Message-ID: <c7bd8aa95e8bd85f3e42ed4f07d69444f5435e25.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The prerequisite for this is building rootfs.cpio.gz, not only
initrd.tar.gz. That's a change in the test-artifacts repository in the
"Rootfs generation" series from Andrew.

Having that, do not repack the whole initrd, but only pack modified
files and rely on Linux handling of concatenated archives.
This allows packing just test-related files (which includes the whole
toolstack), instead of the whole initrd.

DomU initrd handling is a bit more complicated thing. It's sent to the
target host as part of the dom0 initrd. For now include prepared domU
initrd as a whole in dom0's rootfs "overlay", which means compressing it
(again) each job (this takes 3s). This can be later improved by
splitting domU initrd into two parts (base + overlay) and concatenate
them in target dom0 already. For this to be useful, test-artifacts would
need to provide pre-made double-cpio version too (rootfs.cpio.gz wrapper
in yet another cpio.gz as boot/domU-initrd).

Since full initrd is not unpacked now when preparing domU (and dom0)
rootfs, a couple of minor changes are needed to how they are prepared.
This includes creating whole etc/issue file, instead of modifying
existing one, and a need to create a couple directories.

Finally, move adding "rc_verbose=yes" to /etc/rc.conf to initrd
building.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- adjust for Andrew's version of cpio rootfs artifacts
- don't require double-cpio archive for domU initrd, instead add it via
  dom0 initrd as plain cpio to avoid re-compressing the same thing
New in v2

Jobs xilinx-* are untested, as I don't have necessary access.
---
 automation/gitlab-ci/test.yaml                    |  6 +++--
 automation/scripts/qemu-alpine-x86_64.sh          |  9 +++-----
 automation/scripts/qemu-smoke-dom0-arm64.sh       |  7 ++----
 automation/scripts/qemu-smoke-dom0less-arm64.sh   |  7 ++----
 automation/scripts/qubes-x86-64.sh                | 18 +++++++---------
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 15 ++++++-------
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 14 +++++-------
 7 files changed, 35 insertions(+), 41 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 59a2de28c864..3e02bf0e4d21 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -11,7 +11,9 @@
   - project: xen-project/hardware/test-artifacts
     job: linux-6.6.86-arm64
     ref: master
-  - alpine-3.18-arm64-rootfs-export
+  - project: xen-project/hardware/test-artifacts
+    job: alpine-3.18-arm64-rootfs
+    ref: master
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
@@ -22,7 +24,7 @@
     job: linux-6.6.56-x86_64
     ref: master
   - project: xen-project/hardware/test-artifacts
-    job: x86_64-rootfs-alpine-3.18
+    job: alpine-3.18-x86_64-rootfs
     ref: master
 
 .qemu-arm64:
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 89bdb4df7dac..6e0a67b4018c 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -28,16 +28,15 @@ cd initrd
 find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
 cd ..
 
-# initrd.tar.gz is Dom0 rootfs
+# Dom0 rootfs - overlay on top of rootfs.cpio.gz
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
+mkdir -p root etc/local.d
 mv ../initrd.cpio.gz ./root
 cp ../bzImage ./root
 echo "name=\"test\"
@@ -60,9 +59,9 @@ xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
 # rebuild Dom0 rootfs
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cp ../rootfs.cpio.gz ../xen-rootfs.cpio.gz
+find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
 cat >> binaries/pxelinux.0 << EOF
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 51d037b0003e..86047ccd9e7b 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -29,13 +29,12 @@ cd ..
 
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
 mkdir srv
 mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
+mkdir -p etc/local.d root
 mv ../initrd.cpio.gz ./root
 cp ../Image ./root
 echo "name=\"test\"
@@ -56,8 +55,8 @@ xl -vvv create -c /root/test.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cp ../rootfs.cpio.gz ../xen-rootfs.cpio.gz
+find . |cpio -H newc -o|gzip >> ../xen-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f72d20936181..b095a5008e30 100755
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
+cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # ImageBuilder
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index dd88a1398f2b..99c2ece304f0 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -167,13 +167,11 @@ if [ -n "$domU_check" ]; then
     # DomU
     mkdir -p rootfs
     cd rootfs
-    # fakeroot is needed to preserve device nodes in rootless podman container
-    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
     mkdir proc
     mkdir run
     mkdir srv
     mkdir sys
-    rm var/run
+    mkdir -p etc/local.d
     echo "#!/bin/sh
 
 echo 8 > /proc/sys/kernel/printk
@@ -181,26 +179,25 @@ echo 8 > /proc/sys/kernel/printk
 ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
-    echo "rc_verbose=yes" >> etc/rc.conf
     echo "domU Welcome to Alpine Linux 3.18
 Kernel \r on an \m (\l)
 
 " > etc/issue
-    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+    cp ../binaries/rootfs.cpio.gz ../binaries/domU-rootfs.cpio.gz
+    find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
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
 mkdir srv
 mkdir sys
-rm var/run
+mkdir -p etc/local.d
 cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
@@ -237,7 +234,6 @@ fi
 chmod +x etc/local.d/xen.start
 echo "$domU_config" > etc/xen/domU.cfg
 
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
@@ -245,7 +241,9 @@ cp ../binaries/bzImage boot/vmlinuz
 if [ -n "$domU_check" ]; then
     cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 fi
-find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+# take base initrd and append test-specific files
+cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 4db249530823..52a0e05e3f1b 100755
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
@@ -102,23 +102,22 @@ PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "domU Welcome to Alpine Linux 3.18
 Kernel \r on an \m (\l)
 
 " > etc/issue
 copy_domU_files
-find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+cp ../binaries/initrd.cpio.gz ../binaries/domU-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
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
@@ -127,14 +126,14 @@ ${DOM0_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 copy_dom0_files
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # Load software into TFTP server directory.
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 3e1fcf6bf93c..97190d0cbb9c 100755
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
+cp ../binaries/rootfs.cpio.gz ../binaries/domU-rootfs.cpio.gz
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
+cp ../binaries/rootfs.cpio.gz ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
-- 
git-series 0.9.1

