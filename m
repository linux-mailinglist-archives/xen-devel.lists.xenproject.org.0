Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23778C781F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723367.1128239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beE-0000bR-QR; Thu, 16 May 2024 13:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723367.1128239; Thu, 16 May 2024 13:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beE-0000V0-Js; Thu, 16 May 2024 13:59:54 +0000
Received: by outflank-mailman (input) for mailman id 723367;
 Thu, 16 May 2024 13:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7beC-0006bS-N1
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:52 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9094c71b-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:59:52 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 3D62D11400E9;
 Thu, 16 May 2024 09:59:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 May 2024 09:59:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:49 -0400 (EDT)
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
X-Inumbo-ID: 9094c71b-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867991; x=1715954391; bh=+fHnK5t5dh
	ObVIi07JV7R8fbSKdAnIHiqOJTfPBBf/o=; b=xih3xk6iUC4oRz+Ikirrjztdz7
	N8eXJSIh5k+/jg3O3zYpAjbiXc4CR3EmmJ/FQuioLz1+GjxfeqNYcrln3Vmpom5g
	/4mLHwvyxuYch0IWuoyxCgiVYbM+WDWESzDY7BSiwXFl2kYqhFoBKZTgGeW7l0Xf
	nNWyKa5JrLhdfLPSISdXT1znSyUr+On/KKrAsP62LMs0oK6ypwNDvfoJq/HDBdXV
	OMIwmv45bQxyLHxpdyu/ehyK236xsKZF7pTa8khMPwf1Az/zzvNeYnGI+YN0yHph
	rIls2xqlOPL3Otr+4/ygltYHCVTSBAGjDXwLK6Ofp+l4DRiaokBMLAsUB8Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867991; x=
	1715954391; bh=+fHnK5t5dhObVIi07JV7R8fbSKdAnIHiqOJTfPBBf/o=; b=g
	dqtQML5KABpcZ5M6iT+EzKk5qgZeGkMKV5d5rNvX/p6owhz6F3w7v1GPqQW9ysRt
	xqSz3Fc1VpPKkHixdv8HUOScrBxrr2SVH+D3CgYwHvTC1uSTr5PJ1AYmgO2IGA57
	8gc0ov1U96rnmvpKYFflCTHJaERDlTMEgjAuy2exNGX5qS/f5SCwGKsvrer8UtVv
	JdKT/oj/AFXZh8/ded4Od83+i8RePrHSoP9TyJ2re9VYxA/hoZIeDwr+fppMRp/7
	z/YdnsibCMp1thSKVQWBFA3CWcMPr7XgYBvYE4iYNsI1Lc8Ngj6zqEfMesC1BAmX
	0sBR1oQQPXpYBi3YQ4KYQ==
X-ME-Sender: <xms:VhFGZvOZx2AFw7_bwjcP0bra6gWa4x0NMvtAoOqSsxjDcA0jMu4r4Q>
    <xme:VhFGZp_6RnepA9pLnytdaywnlzb99BeaM-cQBDAUEyI_-N430yFzcyRBbGIooPeQv
    0QET1zb59U_SA>
X-ME-Received: <xmr:VhFGZuTnV3LzJw4XfgObY_wG9QtNafPe5nJE8J6RoI-gY1c5Mp1lKwJzNd0fu_0ZCfGnDZWfVcWE9su1OznZWseOYa6LpeOn4fbLCp0q62zXm4EF-g0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:VhFGZjsA2GwYiTirVCJDoQ4ASosjvfV5uvJj8Gn8D_VkLIFeOFQPyQ>
    <xmx:VhFGZnff1AQ3FvgVlRTfrnp3xAGw6MjqFQfGmroytvSWTCfBgOzQ_g>
    <xmx:VhFGZv2rAgSRyZDGmQ1WhdeErujnBM-dCzMD9PRRIJUB5Efz4F41sQ>
    <xmx:VhFGZj8agoEeYLOX5cAN0soz-9YRGfWTNcgUkDGsvevwN90i_vGrWw>
    <xmx:VxFGZj60YxH2btEKbMMRtQSwNmZ_7zq7y7bX9zybj23TTR2ydMb2mifG>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 11/12] automation: stubdom test with boot from CDROM
Date: Thu, 16 May 2024 15:58:32 +0200
Message-ID: <4c08412876def58402f639b5cef2b9c7d5fffa96.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on the initial stubdomain test add booting from CDOM. It's
significantly different in terms of emulated devices (contrary to PV
disk, the cdrom is backed by qemu), so test that path too.
Schedule it on the AMD runner, as it has less tests right now.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/build/alpine/3.19-arm64v8.dockerfile   |  1 +-
 automation/gitlab-ci/build.yaml                   |  2 +-
 automation/gitlab-ci/test.yaml                    |  8 ++-
 automation/scripts/qubes-x86-64.sh                | 58 +++++++++++-----
 automation/tests-artifacts/alpine/3.19.dockerfile |  3 +-
 5 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/automation/build/alpine/3.19-arm64v8.dockerfile b/automation/build/alpine/3.19-arm64v8.dockerfile
index 12810f87ecc6..03a3f28ff686 100644
--- a/automation/build/alpine/3.19-arm64v8.dockerfile
+++ b/automation/build/alpine/3.19-arm64v8.dockerfile
@@ -49,3 +49,4 @@ RUN apk --no-cache add \
   fakeroot \
   sfdisk \
   e2fsprogs \
+  xorriso \
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 134a01d03efa..f1e6a6144c90 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -324,10 +324,12 @@ alpine-3.19-rootfs-export:
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
     - cp /grub-core.img binaries/grub-core.img
+    - cp /grub-core-eltorito.img binaries/grub-core-eltorito.img
   artifacts:
     paths:
       - binaries/initrd.tar.gz
       - binaries/grub-core.img
+      - binaries/grub-core-eltorito.img
   tags:
     - x86_64
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 76cc430ae00f..4e4dca91c26e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -239,6 +239,14 @@ zen3p-pci-stubdom-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.19-gcc-debug
 
+zen3p-stubdom-hvm-cdboot-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh stubdom-hvm-cdboot 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.19-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 816c16fbab3e..b4f5c846ffe3 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -19,6 +19,7 @@ vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
 domU_disk_path=
+domU_disk_type=disk
 
 ### helper functions
 
@@ -27,27 +28,47 @@ build_domU_disk() {
     local initrd="$2"
     local rootfs="$3"
     local output="$4"
+    local img_type="$5"
     local grubcfg="$rootfs/boot/grub2/grub.cfg"
-    local kernel_cmdline="root=/dev/xvda1 console=hvc0 earlyprintk=xen"
+    local kernel_cmdline
 
     mkdir -p "$rootfs/boot/grub2"
     cp "$kernel" "$rootfs/boot/vmlinuz"
+    if [ "$img_type" = "disk" ]; then
+        kernel_cmdline="root=/dev/xvda1 console=hvc0 earlyprintk=xen"
+    elif [ "$img_type" = "cdrom" ]; then
+        kernel_cmdline="root=/dev/sr0 console=hvc0 earlyprintk=xen"
+    fi
     echo "linux /boot/vmlinuz $kernel_cmdline" >> "$grubcfg"
     if [ -n "$initrd" ]; then
         cp "$initrd" "$rootfs/boot/initrd.img"
         echo "initrd /boot/initrd.img" >> "$grubcfg"
     fi
     echo "boot" >> "$grubcfg"
-    size=$(du -sm "$rootfs")
-    size=${size%%	*}
-    # add 5M margin
-    size=$(( size + 5 ))
-    mke2fs -d "$rootfs" "$output.part1" ${size}m
-    cat "$rootfs/usr/lib/grub/i386-pc/boot_hybrid.img" binaries/grub-core.img > "$output"
-    # align for the partition 1 start (2048 sectors)
-    truncate -s $((2048 * 512)) "$output"
-    cat "$output.part1" >> "$output"
-    echo ",,linux,*" | sfdisk "$output"
+    if [ "$img_type" = "disk" ]; then
+        size=$(du -sm "$rootfs")
+        size=${size%%	*}
+        # add 5M margin
+        size=$(( size + 5 ))
+        mke2fs -d "$rootfs" "$output.part1" ${size}m
+        cat "$rootfs/usr/lib/grub/i386-pc/boot_hybrid.img" binaries/grub-core.img > "$output"
+        # align for the partition 1 start (2048 sectors)
+        truncate -s $((2048 * 512)) "$output"
+        cat "$output.part1" >> "$output"
+        echo ",,linux,*" | sfdisk "$output"
+    elif [ "$img_type" = "cdrom" ]; then
+        cp binaries/grub-core-eltorito.img "$rootfs/boot/"
+        xorriso -as mkisofs \
+            -o "$output" \
+            -b boot/grub-core-eltorito.img \
+            -no-emul-boot \
+            -boot-load-size 4 \
+            -boot-info-table \
+            "$rootfs"
+    else
+        echo "Invalid img_type: $img_type" >&2
+        return 1
+    fi
 }
 
 ### test: smoke test & smoke test PVH
@@ -168,16 +189,22 @@ until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.
 done
 "
 
-### test: stubdom-hvm
-elif [ "${test_variant}" = "stubdom-hvm" ]; then
+### test: stubdom-hvm, stubdom-hvm-cdboot
+elif [ "${test_variant}" = "stubdom-hvm" ] || [ "${test_variant}" = "stubdom-hvm-cdboot" ] ; then
     passed="ping test passed"
 
+    disk_opts=
+    if [ "${test_variant}" = "stubdom-hvm-cdboot" ]; then
+        disk_opts=",devtype=cdrom"
+        domU_disk_type="cdrom"
+    fi
+
     domU_config='
 type = "hvm"
 name = "domU"
 memory = 512
 vif = [ "bridge=xenbr0", ]
-disk = [ "/srv/disk.img,format=raw,vdev=xvda" ]
+disk = [ "/srv/disk.img,format=raw,vdev=xvda'"$disk_opts"'" ]
 device_model_version = "qemu-xen"
 device_model_stubdomain_override = 1
 on_reboot = "destroy"
@@ -229,7 +256,8 @@ if [ -n "$domU_disk_path" ]; then
         "binaries/bzImage" \
         "" \
         "rootfs" \
-        "binaries/disk.img"
+        "binaries/disk.img" \
+        "$domU_disk_type"
 else
     (cd rootfs; find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz)
 fi
diff --git a/automation/tests-artifacts/alpine/3.19.dockerfile b/automation/tests-artifacts/alpine/3.19.dockerfile
index cfb2cb30fb30..7632b694c3da 100644
--- a/automation/tests-artifacts/alpine/3.19.dockerfile
+++ b/automation/tests-artifacts/alpine/3.19.dockerfile
@@ -68,4 +68,5 @@ RUN \
   cd / && \
   tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var && \
   # Prepare boot sector for HVM disk
-  grub-mkimage -o /grub-core.img -O i386-pc -p '(hd0,msdos1)/boot/grub2' boot part_msdos ext2 linux biosdisk configfile normal
+  grub-mkimage -o /grub-core.img -O i386-pc -p '(hd0,msdos1)/boot/grub2' boot part_msdos ext2 linux biosdisk configfile normal && \
+  grub-mkimage -o /grub-core-eltorito.img -O i386-pc-eltorito -p '(cd)/boot/grub2' boot part_msdos ext2 linux biosdisk configfile normal iso9660
-- 
git-series 0.9.1

