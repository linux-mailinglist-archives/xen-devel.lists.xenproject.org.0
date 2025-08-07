Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B554B1CFB7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 02:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072314.1435491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBb-0002er-OT; Thu, 07 Aug 2025 00:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072314.1435491; Thu, 07 Aug 2025 00:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBb-0002cy-KY; Thu, 07 Aug 2025 00:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1072314;
 Thu, 07 Aug 2025 00:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujoBa-0002ci-9g
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 00:08:46 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae64c874-7322-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 02:08:45 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id AD6651D005CF;
 Wed,  6 Aug 2025 20:08:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 06 Aug 2025 20:08:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 20:08:42 -0400 (EDT)
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
X-Inumbo-ID: ae64c874-7322-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1754525323; x=1754611723; bh=mouI2rKFCG
	Uv19+o1cVeOdBcrUjRYlEI1C7PrbJfiwA=; b=fDulLMXJm/uFAFGOnyO10t65Sy
	FPdJU1NUme5uoGp2nSr0GnEeuhW66Hk9bHbm7PJYcdCq133iF1GgUhuQl+PPS9jY
	Av76eaAgWV8w3fwqLgZ7FS4dOitI2IaAYCPIW10n/MWSSQCS0DwtZCHHCD59p9Uj
	k5Y+xZOuZ2P+1PkoZHjXcTAmZ8cammcPq9GVCiJYRZncekWpuSG8zktWJMuXlEkW
	gn9aB150gfcC2S/wW9o/7DUFfGd/wwlqjlQzEBW2sQ8kViPChRPFloLQs3lOQvaS
	NTJlpuSYGK0Zt8dAnwvuR+PNxvLUPOIM1ZWdkCW0WSI5tk2U34BGZxGv3drA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754525323; x=
	1754611723; bh=mouI2rKFCGUv19+o1cVeOdBcrUjRYlEI1C7PrbJfiwA=; b=A
	Xi0G08u/+FlaVfjwILg4j85JTCXh0MyVS1+UZLTYj1QCWrxQm0bx7kKrifhnupR+
	81FbTA89IH8Mru3Jzo4rk6vGYSh9T/fYdcEnbboI31XEVu7f0v8MJbtwqVKFbrfZ
	tQZmoWcfKjIEFq4/YNiatHXTZ/XaQ1n2LFKNCgcHIS3tIxipph1dmGvzmj3KLzIi
	pEV6Zl8UrYBXVvulhG1psPtoS/lj4p8lcPJB8alJqMoYW2QUexQCpl0mKPy4u8tt
	ofiRauf0bfgdjTIvnjvYXtZeE40Ck6p4aMbRgN7tZreSlB89rJZAioST8ZyaRFv0
	BiVfWEAESBPRMG/M+edrg==
X-ME-Sender: <xms:i-6TaBrTXH47_EERim50iPqLys_cUgF82Hxiuwav42_Ns5BRFbycZA>
    <xme:i-6TaONLEclYLEHj6ynVwqX-MoplbN--LxkTAcZTTqYn8vaP-zbHlCtS0-rkpoliU
    sGwd0AeQsZxbg>
X-ME-Received: <xmr:i-6TaKxP785njsR5--UB84AGumU1z-f8mBg_xzXnZvsffc6PQ2BN9AEi4WELJT2Us4DB273L2og3a6ZIF0ha-84ZhSnaPtdI4t79yDs_obXzqTIg-53G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefguedu
    hefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhs
    rdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegt
    rghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:i-6TaPupSmUNfUhxlq_RDcg5HJZ-yw2Rwd8F3oJDu2omFsVD3ddMwA>
    <xmx:i-6TaL4vfOHx_XjVivlW7VT4qaViXV1vwd4f8SyltN2ej_9t4EUviA>
    <xmx:i-6TaGQb2OM5hR6VvRezn6gIxoJyDZXUsIm-TNgutLK5Y-T7cKPnjw>
    <xmx:i-6TaCpo_D6qSGIyNaiAEJxDCL62soTHbgrDPQ6NRCJh13nxWt36fg>
    <xmx:i-6TaNlKMow5ijvy7YOG5wbxUm1uLzwlsrhvo8QsaurzqDFOoc1w8dja>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/2] CI: Add driver domains tests
Date: Thu,  7 Aug 2025 02:06:49 +0200
Message-ID: <4595a5aaa66e8d26ff9851496624ceb9c734ee4c.1754525202.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com>
References: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setup a simple two domU system. One with network backend, running
xendriverdomain service, and one with frontend, trying to ping the
backend.

Contrary to other similar tests, use disk image instead of initrd, to
allow bigger rootfs without adding more RAM (for both dom0 and domU).
But keep using pxelinux as a bootloader as it's easier to setup than
installing grub on the disk. Theoretically, it could be started via direct
kernel boot in QEMU, but pxelinux is slightly closer to real-world
deployment.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml                  |   8 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 116 +++++++++++++++++-
 2 files changed, 124 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1f0b27b2378a..5c4b2dc304b4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.18-gcc
 
+qemu-alpine-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
new file mode 100755
index 000000000000..1caaede7722e
--- /dev/null
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -0,0 +1,116 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+dom0_rootfs_extra_comp=()
+dom0_rootfs_extra_uncomp=()
+
+cd binaries
+
+# DomU rootfs
+
+mkdir -p rootfs
+cd rootfs
+mkdir -p etc/local.d
+passed="ping test passed"
+echo "#!/bin/bash
+
+set -x
+
+if grep -q test=backend /proc/cmdline; then
+    brctl addbr xenbr0
+    ip link set xenbr0 up
+    ip addr add 192.168.0.1/24 dev xenbr0
+    bash /etc/init.d/xendriverdomain start
+    # log backend-related logs to the console
+    tail -F /var/log/xen/xldevd.log /var/log/xen/xen-hotplug.log >>/dev/console 2>/dev/null &
+else
+    ip link set eth0 up
+    ip addr add 192.168.0.2/24 dev eth0
+    until ping -c 10 192.168.0.1; do
+        sleep 1
+    done
+    echo \"${passed}\"
+fi
+
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+zcat ../rootfs.cpio.gz | cpio -imd
+zcat ../xen-tools.cpio.gz | cpio -imd
+mkfs.ext4 -d . ../domU-rootfs.img 1024M
+cd ..
+rm -rf rootfs
+
+# Dom0 rootfs
+mkdir -p rootfs
+cd rootfs
+zcat ../rootfs.cpio.gz | cpio -imd
+zcat ../xen-tools.cpio.gz | cpio -imd
+mkdir -p root etc/local.d
+echo "name=\"backend\"
+memory=512
+vcpus=1
+kernel=\"/root/bzImage\"
+extra=\"console=hvc0 root=/dev/xvda net.ifnames=0 test=backend\"
+disk=[ '/root/domU-rootfs-b.img,raw,xvda,rw' ]
+" > root/backend.cfg
+echo "name=\"frontend\"
+memory=512
+vcpus=1
+kernel=\"/root/bzImage\"
+extra=\"console=hvc0 root=/dev/xvda net.ifnames=0 test=frontend\"
+disk=[ '/root/domU-rootfs-f.img,raw,xvda,rw' ]
+vif=[ 'bridge=xenbr0,backend=backend' ]
+" > root/frontend.cfg
+echo "#!/bin/bash
+
+set -x
+
+bash /etc/init.d/xencommons start
+
+xl list
+
+tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e \"s/^/(backend) /\" &
+tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e \"s/^/(frontend) /\" &
+xl -vvv create /root/backend.cfg
+xl -vvv create /root/frontend.cfg
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+
+cp ../domU-rootfs.img ./root/domU-rootfs-b.img
+cp ../domU-rootfs.img ./root/domU-rootfs-f.img
+cp ../bzImage ./root/
+mkdir -p etc/default
+echo 'XENCONSOLED_TRACE=all' >> etc/default/xencommons
+mkdir -p var/log/xen/console
+mkfs.ext4 -d . ../dom0-rootfs.img 2048M
+cd ..
+rm -rf rootfs
+
+cd ..
+
+cat >> binaries/pxelinux.0 << EOF
+#!ipxe
+
+kernel xen console=com1 console_timestamps=boot
+module bzImage console=hvc0 root=/dev/sda net.ifnames=0
+boot
+EOF
+
+# Run the test
+rm -f smoke.serial
+export TEST_CMD="qemu-system-x86_64 \
+    -cpu qemu64,+svm \
+    -m 2G -smp 2 \
+    -monitor none -serial stdio \
+    -nographic \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 \
+    -drive file=binaries/dom0-rootfs.img,format=raw"
+
+export TEST_LOG="smoke.serial"
+export BOOT_MSG="Latest ChangeSet: "
+export LOG_MSG="Domain-0"
+export PASSED="$passed"
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
-- 
git-series 0.9.1

