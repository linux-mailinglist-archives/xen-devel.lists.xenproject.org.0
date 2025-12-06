Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EBECA9F30
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179691.1503185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMb-0007bf-Js; Sat, 06 Dec 2025 02:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179691.1503185; Sat, 06 Dec 2025 02:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiMb-0007aC-GB; Sat, 06 Dec 2025 02:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1179691;
 Sat, 06 Dec 2025 02:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiMa-0007M8-MM
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:49:36 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31ed41f5-d24e-11f0-980a-7dc792cee155;
 Sat, 06 Dec 2025 03:49:34 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 41D1B7A0149;
 Fri,  5 Dec 2025 21:49:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 21:49:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:49:32 -0500 (EST)
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
X-Inumbo-ID: 31ed41f5-d24e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764989373; x=1765075773; bh=kOc5r6GnVP
	FBVwv2phdHKekXLtzAx8B+0AyzS/nrGAY=; b=u8InFHFzrd4zdgoBP+NmUi3M+m
	OS1JJugg9kqmxAaJQWQv9tb6g++wBy5c6UzZaRXvA1cRmv++tBVL98W7zjJBalVj
	HEj6uWtAP6Abb919Hi4TAWVRZs7arJUm/EYmCMJMqqUlqRIcN49RxEVVGyoym3zF
	ijFv6SH3MGiKkrNy3gK0GajA+157jd5gwFZt92gqa6ur3aYVeGVLKxK445TNzWCE
	zAouhSXQSslo8ZbCKLzYQGKPPsLZDaGK1sKSQAe7U6dVI8zOhy3VeKVZx5cz+UHE
	NnEB/4dsaCYJE+K74Y3uz9XLMiQH6jHPHO/CR1tHwa0v9C42bAl+w6qUWe7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764989373; x=
	1765075773; bh=kOc5r6GnVPFBVwv2phdHKekXLtzAx8B+0AyzS/nrGAY=; b=c
	/9AWcNpBQWc3GjjV053LbMYZben++ojpKRen+DhZosgNQ79L2C91J7oSg80uBnWi
	yuwkUiV306DAfW/iU9bXcaVEFOqowPMbH1qDzI20mD2AJgKRHi+xBdZhx2DzAYEM
	A/2Flzx1Y4PjabqpsrLEwtjMSChHgGytWj6tsYBHRPR8PEylpFQTs0NWLG1h8CzR
	fe2ts+sHczNjzZ33kuNrxQ8YJGdhC9TO+fgf3G7JywHllI3ijBymKI/UyC0odN0N
	Sj/cPylRyxApTmdLYlqYzqnUK5qWnItADyBjSmCsHeUCmbOBdUCy06RjA/BgnLxt
	NQr/IUC1/ywcNq62wt61Q==
X-ME-Sender: <xms:vZkzaampUksWULTy3zfn4aXxQ-XUbrFNXfHZVGs4OZbA-igbgoO7dw>
    <xme:vZkzaYv5mGfQXBA_ZK2THGbqV3-oUlB2WS-eTG1FYcjz7HCGu4J9yRgt6ynz3qfwt
    JHavYAQFvqmzr_jXdm_IwtQiVv_Mi9H8Bs6Ujqf2vDeF6rxCpc>
X-ME-Received: <xmr:vZkzaQ-1i8VFZvHGr9b8f2roDJVhj3KTLpJhTJTkKRqYN71BR4zUAsa69JQtPOw7zIfsrD5MTU-cedIQCMi_e0BxGM8yTRIlWMEqcGngRv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguoh
    gvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vZkzaaO7nBIpJqSAPuApASM6YPJcl6iBfkspa5W_ehj0lYrbKM2tTw>
    <xmx:vZkzaWETqkbG9LtZLqV4rQqrLY82crAkzcL6dA8Cqko2qgogNhE9dw>
    <xmx:vZkzaQTAO-Pf_rOHBM5USHOZpdSHt3eQfahY7WCB3ek1HOjs7k-ptg>
    <xmx:vZkzabuh3UCs0SfjFIZSjb02Zf6IOOUepbiZ8rfujzbwsJLnXEbDMQ>
    <xmx:vZkzaZfnGQMdlD1DNXBsd6AUSR9IB_bl_m2fsBOH5rbICX-pvqNdwgZ9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/6] CI: Add driver domains tests
Date: Sat,  6 Dec 2025 03:48:06 +0100
Message-ID: <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
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

Use fakeroot to preserve file owners/permissions. This is especially
important for suid binaries like /bin/mount - without fakeroot, they
will end up as suid into non-root user.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- add fakeroot
- run ldconfig at the disk image creation time, to avoid running it at
  dom0/domU boot time (which is much slower)
Changes in v2:
- use heredoc
- limit ping loop iterations
- use full "backend" / "frontend" in disk image names
- print domU consoles directly to /dev/console, to avoid systemd-added
  messages prefix
- terminate test on failure, don't wait for timeout
---
 automation/build/debian/13-x86_64.dockerfile    |   2 +-
 automation/gitlab-ci/test.yaml                  |   8 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 138 +++++++++++++++++-
 3 files changed, 148 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 2c6c9d4a5098..6382bafbd5bd 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -55,7 +55,9 @@ RUN <<EOF
 
         # for test phase, qemu-* jobs
         busybox-static
+        e2fsprogs
         expect
+        fakeroot
         ovmf
         qemu-system-x86
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 7b36f1e126ca..abc5339a74ab 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -656,6 +656,14 @@ qemu-alpine-x86_64-gcc:
     - *x86-64-test-needs
     - alpine-3.22-gcc
 
+qemu-alpine-driverdomains-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-driverdomains-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.22-gcc
+
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
   script:
diff --git a/automation/scripts/qemu-driverdomains-x86_64.sh b/automation/scripts/qemu-driverdomains-x86_64.sh
new file mode 100755
index 000000000000..c0241da54168
--- /dev/null
+++ b/automation/scripts/qemu-driverdomains-x86_64.sh
@@ -0,0 +1,138 @@
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
+fakeroot sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+    mkfs.ext4 -d . ../domU-rootfs.img 1024M
+"
+cd ..
+rm -rf rootfs
+
+# Dom0 rootfs
+mkdir -p rootfs
+cd rootfs
+fakeroot -s ../fakeroot-save sh -c "
+    zcat ../rootfs.cpio.gz | cpio -imd
+    zcat ../xen-tools.cpio.gz | cpio -imd
+    ldconfig -r .
+    touch etc/.updated
+"
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
+fakeroot -i ../fakeroot-save mkfs.ext4 -d . ../dom0-rootfs.img 2048M
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

