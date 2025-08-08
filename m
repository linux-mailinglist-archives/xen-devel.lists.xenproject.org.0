Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFBB1EA6B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074620.1437112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAQ-0003FP-AQ; Fri, 08 Aug 2025 14:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074620.1437112; Fri, 08 Aug 2025 14:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAQ-0003Ci-5K; Fri, 08 Aug 2025 14:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1074620;
 Fri, 08 Aug 2025 14:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AHj=2U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukOAO-00039T-M4
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:33:56 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b53db71c-7464-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 16:33:54 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6F54E140006F;
 Fri,  8 Aug 2025 10:33:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 08 Aug 2025 10:33:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Aug 2025 10:33:52 -0400 (EDT)
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
X-Inumbo-ID: b53db71c-7464-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1754663633; x=1754750033; bh=rzH4S8PiQY
	diFvv5Qp3o/668oqL/9FARyEfSxtejKVY=; b=QLTuakdyjuPwQnOn2z9gSn0OZZ
	dOm9h5I9hfZh4yS3OEp9q/3WXh5XlQBHClLt+FmTib2KFehCyxd7meOkkleKcosY
	N0jVEbZJAFVkvSx/cLksDah/raMruafz+wpNctY9yvZ52IeTN3Xp1smLJXN5Ihzg
	00TNSXTJDa5KzZOGJO653eWP5mUk7JUesCYYL3Aob4C/4TUk3zGSQAaOd3nAUjcc
	hf5aMkGzsJAQ70PfOq56oPhgDP9fycM+sm69htNDFwDnexfPYvf1pckWcr9WSNnL
	idJKeDKFWnsbkBwsDhMonM/6ABJgiXVAGTwToxaqCvwa7aME3rRZM3tJGiXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754663633; x=
	1754750033; bh=rzH4S8PiQYdiFvv5Qp3o/668oqL/9FARyEfSxtejKVY=; b=M
	RNeb3teBGXiL4wWU3/hE74OQ+yn/jGAdVbgwP6HZM+rgaKl8P2C48ayka/SabaOD
	uVLzas8+v0ufnBbyIcwMGXAJozH1hxckjfy4vyMZbos5mWiayJqKj3cOQfY0+/Zr
	I2GDIglvvPM79kymdUE+M+l7HLgO9IKl/pIcVJ0f6n3ndLhtg/dXwuw5O+Z9cNiE
	wB98X0rzA9bLqtoYzDFCpA0VL4Kc0bpFB+kzeycrd9hHJJ0/8HjyqkCsT4GxQaUw
	jPiPA5TGRUdh5SjyWNnU4a1g93YZxXdWtL/wbqcVpUwlM7+jn241Iehepa/ozwfY
	Y3EbLlFIvft5AidKc7V0Q==
X-ME-Sender: <xms:0QqWaD9GnxiqNsK8RfEnkV7kO9R6Y579zrzZ4yY4mEJ3S5czcXvvUw>
    <xme:0QqWaKSQ62Zf1HMUrjM9Xxa5Rkngedu5h7M3jwRDUthm6-OB8_DhwUp5_AmP3keZ0
    UZD8nageGJrUg>
X-ME-Received: <xmr:0QqWaNn7j95jrV5YMX9Db4sXXCf0jdwva0bJxrBcg1FOh90CulpNnPJYc1y4UCnxJLqmeXePeRvRklwXwuwq6TR8dqRE1LUL6zyPJNwgCdsCMGCT7taG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0QqWaCRn4CZD737lfR57PmrN237my-iMkvPXIMFqszQeh4bF1hwcEg>
    <xmx:0QqWaDOQ_MVvyx7lfFl5O41fEsIlMraKfkS8IEG63IoFDs7-i9K-nQ>
    <xmx:0QqWaDVLBuf7ySC1KNrD77S-29KjYiyU9ClgtkeDAES4QKT73iAC9w>
    <xmx:0QqWaCeKSGsWYF52LbcGF-yQRsx43RHPCyRucQ0PxCRBXumVAvOPGA>
    <xmx:0QqWaJ7qCNh_X-q3jUo16_9Bz7t7ZBCHv3Y2U6LX1xF8BgBstuE1x69z>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] CI: Add driver domains tests
Date: Fri,  8 Aug 2025 16:32:41 +0200
Message-ID: <0243d946ec451ddf18a620dbcaaa45eba861810a.1754663560.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
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
Changes in v2:
- use heredoc
- limit ping loop iterations
- use full "backend" / "frontend" in disk image names
- print domU consoles directly to /dev/console, to avoid systemd-added
  messages prefix
- terminate test on failure, don't wait for timeout
---
 automation/gitlab-ci/test.yaml                  |   8 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 130 +++++++++++++++++-
 2 files changed, 138 insertions(+)
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
index 000000000000..a8e2ceb33527
--- /dev/null
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -0,0 +1,130 @@
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
+failed="TEST FAILED"
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
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
+    timeout=6 # 6*10s
+    until ping -c 10 192.168.0.1; do
+        sleep 1
+        if [ \$timeout -le 0 ]; then
+            echo "${failed}"
+            exit 1
+        fi
+        ((timeout--))
+    done
+    echo "${passed}"
+fi
+EOF
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
+cat > root/backend.cfg << EOF
+name="backend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=backend"
+disk=[ '/root/domU-rootfs-backend.img,raw,xvda,rw' ]
+EOF
+cat > root/frontend.cfg << EOF
+name="frontend"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+extra="console=hvc0 root=/dev/xvda net.ifnames=0 test=frontend"
+disk=[ '/root/domU-rootfs-frontend.img,raw,xvda,rw' ]
+vif=[ 'bridge=xenbr0,backend=backend' ]
+EOF
+
+cat > etc/local.d/xen.start << EOF
+#!/bin/bash
+
+set -x
+
+bash /etc/init.d/xencommons start
+
+xl list
+
+tail -F /var/log/xen/console/guest-backend.log 2>/dev/null | sed -e "s/^/(backend) /" >>/dev/console &
+tail -F /var/log/xen/console/guest-frontend.log 2>/dev/null | sed -e "s/^/(frontend) /" >>/dev/console &
+xl -vvv create /root/backend.cfg
+xl -vvv create /root/frontend.cfg
+EOF
+chmod +x etc/local.d/xen.start
+
+cp ../domU-rootfs.img ./root/domU-rootfs-backend.img
+cp ../domU-rootfs.img ./root/domU-rootfs-frontend.img
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
+# exit early on test failure too, check if it was success below
+export PASSED="$passed|$failed"
+
+./automation/scripts/console.exp | sed 's/\r\+$//'
+
+grep "$passed" smoke.serial
-- 
git-series 0.9.1

