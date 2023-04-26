Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316856EEB54
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526384.818128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpw-0001KU-Lq; Wed, 26 Apr 2023 00:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526384.818128; Wed, 26 Apr 2023 00:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpw-0001IB-He; Wed, 26 Apr 2023 00:16:44 +0000
Received: by outflank-mailman (input) for mailman id 526384;
 Wed, 26 Apr 2023 00:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpu-0008T0-TM
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:42 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e42371a-e3c7-11ed-b223-6b7b168915f2;
 Wed, 26 Apr 2023 02:16:42 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 639493200488;
 Tue, 25 Apr 2023 20:16:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 20:16:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:38 -0400 (EDT)
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
X-Inumbo-ID: 9e42371a-e3c7-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468200; x=1682554600; bh=F/
	nKkof+j5Rza7lQDx9tTTYfM+sXNOVmeqYfVz+E/ZI=; b=KP4rI7h1Vw1ZnW0JBo
	P1QgOP5jM3k89/pD6nX/gNVWSdCCfSd3F3KCjb0maoW3lT+ac/m8c95IPGHrY7Ec
	yVvO8OkcjBony1Ts2HVZRl8UV61pb8i6jjHFcxjhYGxxulrhUFIO6KR7DuezBrWw
	rd/voIAgCvFf5x68Z/UKHGGGH2E6u+9tr4oSsZKq+j8C67xe/lVUA4/uFEBPhpIb
	PtpoqTnPKzJ5++Zxb2vLDoBLZH/SHAW8bDTV54Fnqz1Qc75qzG5QCsP6VQwbqBvT
	+0huT6Y9iNRsdW116QJTl7pWw+YuelRIUabM7CI+kho57gF77ygdCvQvadlR/dXh
	ek4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468200; x=1682554600; bh=F/nKkof+j5Rza7lQDx9tTTYfM+sXNOVmeqY
	fVz+E/ZI=; b=ZiO7U0LqpfqK946evgxizbYuvTouHTt4rR/TQfOWuOYRcdE1Pn2
	cAowElQZaKd4akRzcZ3kPPZFWmyOO7M1aJHp9VgedFotIoh84dH/N3HTLRUr76uB
	Dd5BrEkXk/WSet2xMoUog45evoHMGwhJAbVNrEpsgSPzNytAUaC28qD2xdg+unL0
	rAyn3oNxjlWa5DuIb1L7zCoMhDf5oNYcPFInBhDpeKcHdlLVJHnrLDGK8Pt8Zr4y
	oE3tFQ4V1qn00nngr3fiEsqQzKwUd7eurVs12c0CxDR8FKacjZMTKuOUHnEgb41l
	ETWR33pBVUvAnhrsv7PioZBJSMi31nEbqFA==
X-ME-Sender: <xms:Z21IZC4K6ncVgAJfzUfYC-b1R96qu34PHJ9IblT6qL0Nj-JnLyzw6Q>
    <xme:Z21IZL7FKeKHs9wzBvaQ6P-TG_hkLbmuLjUQkY07XVOGlmgD1UQdlzhwoV9_QfgAA
    E3QgIDzWr89UA>
X-ME-Received: <xmr:Z21IZBc--tnvIM9QRPBSVRJ9X0LwDS2vtlDvAODbnFtU2AfnRQmvI3ga2A1qHeNS_Ui4nRrVsqU9ap5l6lEaqKBXQWK-J6IKC92ok9RC7uYTck7ZhSqf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Z21IZPKFbBd5Hjh1-lenOoTy3qbV9meBtPkxzvzw-9qooXKx4tczlg>
    <xmx:Z21IZGI46AwgT2gxi3-TEU3wln0rts2k1YfKrf-ad-C0wHI7dcqtgg>
    <xmx:Z21IZAyqxpjpaadPYsFfc7nDlc9_v-cha9hvNWA8sCPLqF4f1twn5Q>
    <xmx:aG1IZIidfzHzSJ9vIW7SvlSx_-hrFoiON2douDVn7TQ_yZuTg-DsgA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 5/6] automation: PCI passthrough tests on ADL hw
Date: Wed, 26 Apr 2023 02:16:15 +0200
Message-Id: <1948952135feb360797da0bb0136e7d42e188e72.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add simple PCI passthrough test to both PV and HVM domU. It passes
through a network adapter (the only one in the system), gets an IP via
DHCP (first basic test) and then ping the gateway (second basic test).
Finally, if device is supposed to use MSI or MSI-X (as set in the
PCIDEV_INTR test variable), check if it's in use via /proc/interrupts.

On the current runner, the device in question is this:
03:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I225-V [8086:15f3] (rev 03)
	Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7d25]
	Flags: bus master, fast devsel, latency 0, IRQ 18
	Memory at 50400000 (32-bit, non-prefetchable) [size=1M]
	Memory at 50500000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
	Capabilities: [a0] Express Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Device Serial Number ...
	Capabilities: [1c0] Latency Tolerance Reporting
	Capabilities: [1f0] Precision Time Measurement
	Capabilities: [1e0] L1 PM Substates
	Kernel driver in use: igc
	Kernel modules: igc

With the current Xen version, it uses MSI-X under PV and MSI under HVM.

This patch moves domU config to a variable, to make it configurable on
per-test basis. Add also a few comments for visual separation of tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
changes in v2:
 - drop leftover debug shell
 - fix regex -msi to not match -msi-x
 - fix waiting for domU startup
---
 automation/gitlab-ci/test.yaml     | 20 +++++++-
 automation/scripts/qubes-x86-64.sh | 85 ++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d68c584269dd..1ce083e6cd88 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -94,6 +94,8 @@
     # the test controller runs on RPi4
     CONTAINER: alpine:3.12-arm64v8
     LOGFILE: smoke-test.log
+    PCIDEV: "03:00.0"
+    PCIDEV_INTR: "MSI-X"
   artifacts:
     paths:
       - smoke.serial
@@ -147,6 +149,24 @@ adl-suspend-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.12-gcc-debug
 
+adl-pci-pv-x86-64-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
+adl-pci-hvm-x86-64-gcc-debug:
+  extends: .adl-x86-64
+  variables:
+    PCIDEV_INTR: "MSI"
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 6c0309704661..a01c571860ee 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -4,8 +4,21 @@ set -ex
 
 test_variant=$1
 
+### defaults
 wait_and_wakeup=
 timeout=120
+domU_config='
+type = "pvh"
+name = "domU"
+kernel = "/boot/vmlinuz"
+ramdisk = "/boot/initrd-domU"
+extra = "root=/dev/ram0 console=hvc0"
+memory = 512
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+'
+
+### test: smoke test
 if [ -z "${test_variant}" ]; then
     passed="ping test passed"
     domU_check="
@@ -23,6 +36,8 @@ done
 tail -n 100 /var/log/xen/console/guest-domU.log
 echo \"${passed}\"
 "
+
+### test: S3
 elif [ "${test_variant}" = "s3" ]; then
     passed="suspend test passed"
     wait_and_wakeup="started, suspending"
@@ -48,6 +63,62 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
 ping -c 10 192.168.0.2 || exit 1
 echo \"${passed}\"
 "
+
+### test: pci-pv, pci-hvm
+elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
+
+    if [ -z "$PCIDEV" ]; then
+        echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
+        echo "Optionally set also 'PCIDEV_INTR' to 'MSI' or 'MSI-X'" >&2
+        exit 1
+    fi
+
+    passed="pci test passed"
+
+    domU_config='
+type = "'${test_variant#pci-}'"
+name = "domU"
+kernel = "/boot/vmlinuz"
+ramdisk = "/boot/initrd-domU"
+extra = "root=/dev/ram0 console=hvc0"
+memory = 512
+vif = [ ]
+disk = [ ]
+pci = [ "'$PCIDEV',seize=1" ]
+on_reboot = "destroy"
+'
+
+    domU_check="
+set -x -e
+ip link set eth0 up
+timeout 30s udhcpc -i eth0
+pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
+ping -c 10 \"\$pingip\"
+echo domU started
+cat /proc/interrupts
+"
+    if [ "$PCIDEV_INTR" = "MSI-X" ]; then
+        domU_check="$domU_check
+grep -- '\\(-msi-x\\|PCI-MSI-X\\).*eth0' /proc/interrupts
+"
+    elif [ "$PCIDEV_INTR" = "MSI" ]; then
+        # depending on the kernel version and domain type, the MSI can be
+        # marked as '-msi', 'PCI-MSI', or 'PCI-MSI-<SBDF>'; be careful to not match
+        # -msi-x nor PCI-MSI-X
+        domU_check="$domU_check
+grep -- '\\(-msi \\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
+"
+    fi
+    domU_check="$domU_check
+echo \"${passed}\"
+"
+
+    dom0_check="
+until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
+    sleep 1
+done
+tail -n 100 /var/log/xen/console/guest-domU.log
+"
 fi
 
 # DomU
@@ -63,7 +134,7 @@ rm var/run
 echo "#!/bin/sh
 
 ${domU_check}
-/bin/sh" > etc/local.d/xen.start
+" > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 sed -i -e 's/^Welcome/domU \0/' etc/issue
@@ -98,17 +169,7 @@ xl create /etc/xen/domU.cfg
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-# just PVH for now
-echo '
-type = "pvh"
-name = "domU"
-kernel = "/boot/vmlinuz"
-ramdisk = "/boot/initrd-domU"
-extra = "root=/dev/ram0 console=hvc0"
-memory = 512
-vif = [ "bridge=xenbr0", ]
-disk = [ ]
-' > etc/xen/domU.cfg
+echo "$domU_config" > etc/xen/domU.cfg
 
 echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
-- 
git-series 0.9.1

