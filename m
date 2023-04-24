Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36426ED665
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525621.816938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fc-0005ax-HO; Mon, 24 Apr 2023 20:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525621.816938; Mon, 24 Apr 2023 20:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fc-0005U3-DK; Mon, 24 Apr 2023 20:57:32 +0000
Received: by outflank-mailman (input) for mailman id 525621;
 Mon, 24 Apr 2023 20:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3Fb-00058D-05
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:31 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fe8ce3f-e2e2-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 22:57:30 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 78B883200708;
 Mon, 24 Apr 2023 16:57:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Apr 2023 16:57:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:26 -0400 (EDT)
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
X-Inumbo-ID: 9fe8ce3f-e2e2-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369847; x=1682456247; bh=UR
	iOmP9knqsMpj+/wVJpseuPtx4rqcsH76JJ/F1c++g=; b=jblZFWBKdi1Ci5VHtl
	auVWPBC7czAliJ+3hPx8or3aa26MqOdLqX0qGcMrHDb6bVpqvwWwWCmUTewKjLwv
	ql2jtt0FENerI5uZUc/JVfA8rbL03qgdS5x1ebG6V3sNkOZLzY6GiTQDoj9aCcjz
	AqZhFROCsF/Q4Dyzp52SFTO8tGoxNaL/Fs5KAhkrXu30ZUE91OWGGjCebb/1Nuif
	n6KXP9enLwGFCrJUP6Scezs2UYhstqaSubwQlMsPdFCZ5BlDEnYXjz9gU5sQlqu1
	2CxU9rBGFjBt3iYxkxD30IZaZrnC8Ie7o7yEVhR4EcoNEN/p4lfOB/g9VlGRtpAD
	0PAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369847; x=1682456247; bh=URiOmP9knqsMpj+/wVJpseuPtx4rqcsH76J
	J/F1c++g=; b=GJ8ZAogatX/nXT5dL1Kn3xIZ8yFfqxKHZ7ZN39SloRDebf56MKN
	QrcOypkFicWCP7d3RiWDkonVBd2TwEhSaY9Jf9lgO7vZ0OkL/r6DnZfIILAtTzKH
	TbcxKeMQcL6ykE4ebjI2RW2SYdSs4yLWfp7QSxCNT3Wl4I0iXSW/jRgnCd+PNcaK
	0raEtrbApvjQ/IIRjsYH6iMDPUbhMqtqxtKFpJ+ZRfPTmFjelXmvmoT/wRvcXvgx
	hGhxG2S8LsLIDppKBuB9sJNIbvkIvMdncOzdmX5h/Gq53eMsKlNlaONUZQQ65ko3
	NTuUZI5prcKF8ARH3+n+ZJLuIaoTfWIGmug==
X-ME-Sender: <xms:N-1GZBGHZLTG-VvOIen2gfxk8RoPeY54QPD1Kk0biQhKyBWn79awFQ>
    <xme:N-1GZGXkyKlwcpkg8cuLdpEUhgH6hhgC_8h4bocign8zz9-hSYcnBBvihAZYkeqgc
    5o_WNE8kbriLQ>
X-ME-Received: <xmr:N-1GZDJVOOKrYE01NP76th6hnIiCdCMCaEPXD9gIG-r-SylB00pwmifkTks0D9JwGfzGS-TLJEiQTx0CK9RBYrqgyJFgjVv1EbDG7VefKGNXvh9hbuEi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:N-1GZHGeghnZNv5jZTnE7ls92kacXCA1H4sOTBo_FMtqtUETuvPi7Q>
    <xmx:N-1GZHXAZoEbpja1Cp6dUQUU-LABw0ZC3dXejLbcOnWvKz5WMN3HgA>
    <xmx:N-1GZCOsa8yZHpfvcR9iT7TydsEQJZOKfnvmCgaGh1FKPlNBAIwpdw>
    <xmx:N-1GZOem6ppg3his-_QQ5nBSzRYLV1FidFnxujKpMyOwGaPGmKMSqw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 5/6] automation: PCI passthrough tests on ADL hw
Date: Mon, 24 Apr 2023 22:57:00 +0200
Message-Id: <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
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
 automation/gitlab-ci/test.yaml     | 20 ++++++++-
 automation/scripts/qubes-x86-64.sh | 80 ++++++++++++++++++++++++++-----
 2 files changed, 89 insertions(+), 11 deletions(-)

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
index c0bc71764f73..6442f7dda515 100755
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
@@ -48,6 +63,59 @@ xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
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
+grep -- '\\(-msi\\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
+"
+    fi
+    domU_check="$domU_check
+echo \"${passed}\"
+"
+
+    dom0_check="
+tail -n 100 -F /var/log/xen/console/guest-domU.log
+"
 fi
 
 # DomU
@@ -97,17 +165,7 @@ xl create /etc/xen/domU.cfg
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

