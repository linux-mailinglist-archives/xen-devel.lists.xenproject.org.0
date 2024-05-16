Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A98C7820
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723366.1128228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beD-0000Eh-A7; Thu, 16 May 2024 13:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723366.1128228; Thu, 16 May 2024 13:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beD-000096-3g; Thu, 16 May 2024 13:59:53 +0000
Received: by outflank-mailman (input) for mailman id 723366;
 Thu, 16 May 2024 13:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7beA-0006bS-EW
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:50 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f468cfc-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:59:49 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 0F07D13803A4;
 Thu, 16 May 2024 09:59:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 May 2024 09:59:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:47 -0400 (EDT)
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
X-Inumbo-ID: 8f468cfc-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867989; x=1715954389; bh=neWLSYtrwE
	5oJ6YyyAYbJGxLAujbQDz+IR1NVL0iM3w=; b=R25Te2hxyjQXXz6SNJaBblO2sZ
	PJb7NAWjSbryuR3D/6jNbC/Q4OHo02DtHIUpW3eU60r8b8fl0XRB4/X6kB3CpV5n
	8yST4bI0zfYAsexvbuW/MqaJdkQGdyOvE3hr0OYNGZSCQdsMR0jLvJqkj4SHt6ck
	/0Tuo6eDsvPN5e7t8HVdIexEXcq/GVPu1OERzFrEXLX02miR9ZbgSsEqIvLVkk4T
	ZLj3LlBjUhZXiJXVKkxucVTSuyhTXB/+OmuNBp2n9lj1EDCbjGTPryL04RXB2N7q
	aaa3HpI0+k3R/t6tSertGzb2j6sOPY3w58MD3RKta/AQSlW/Vwm5yqA5rnWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867989; x=
	1715954389; bh=neWLSYtrwE5oJ6YyyAYbJGxLAujbQDz+IR1NVL0iM3w=; b=T
	qrNwIAbphsbDC2cHlgh1nEhVghfdWyDHWyRe8jp9gnHiMjfMy+THePOxfVqg0jGh
	JXpy3HUcM7UVkZe4+63IjwCek2SVRE8junLognkckSFaFuKfzcQ9Cd1fkhDLq8Ej
	3It5xlXSg5c5R6f97JwbsawvxAEpsQb5twJE9F0SwAMLfSrhBuYmR/mtNW+pqDw/
	hRsiHZwk6Bw1uTntwM288ciyoWyXIPKm+B8o4B+jqplqa5vZDUNd/8WCWInWRa4X
	+vddsbJLhtHcHZD7Ha60slxCYfi2HfXUe3KrL6rALtvKbY4f3tiUraizWE03/aPj
	xgkxhbL9DvgIPq7ECMXag==
X-ME-Sender: <xms:VBFGZrT7oOB9MQ6u8uZvJeMJoQitOP9MMiyeTmDk8B3CwMS5i_saRw>
    <xme:VBFGZsz_lLBBzDzEuprvrhWoQP0PTdPomonLwPvLjInhrYlgLXOy7GD9QIvApcqj6
    W5-022WPGZBRw>
X-ME-Received: <xmr:VBFGZg2KsrzY_Qzq2Wd7Vpspa3hUhpl-VrrFWwl7_bDDI9r17-GKgpIVGjcwf8ryCpuH8mfrWAZTlQT6BMXU7RT1jxljUZ-g_GYNqGrPCSmXokeA_4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:VBFGZrDh647gYotZwpGNTrV7rUAa-QK67xc1wvA4slKv9NSoXs_a5Q>
    <xmx:VBFGZkj8trFA-utu_xvvQ22hoJySfdQQDLzh4RChNTKLuEdvAiOmaA>
    <xmx:VBFGZvq22JQN6nlAiWE6SHUwsz_y9d8oSsIeti_tKQLxzSd0h72SOg>
    <xmx:VBFGZvgVwAFVNx6o0-R7oKiNYMvr3EpHzbR1n_6apMrzqlbVNQXGiQ>
    <xmx:VRFGZttBX2dFBfjsiavjICC2GIrZ7fd9diiaVasvcUJTdI8MLy1pXRpo>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 10/12] automation: stubdom test with PCI passthrough
Date: Thu, 16 May 2024 15:58:31 +0200
Message-ID: <16c7001cfec1cb7a601414b745655656ea63fe29.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on the initial stubdomain test and existing PCI passthrough tests,
add one that combines both.
Schedule it on the AMD runner, as it has less tests right now.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml     |  8 ++++++++
 automation/scripts/qubes-x86-64.sh | 30 +++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e3910f4c1a9f..76cc430ae00f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -231,6 +231,14 @@ zen3p-pci-hvm-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.19-gcc-debug
 
+zen3p-pci-stubdom-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-stubdom 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.19-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index fc73403dbadf..816c16fbab3e 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -98,8 +98,8 @@ ping -c 10 192.168.0.2 || exit 1
 echo \"${passed}\"
 "
 
-### test: pci-pv, pci-hvm
-elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
+### test: pci-pv, pci-hvm, pci-stubdom
+elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ] || [ "${test_variant}" = "pci-stubdom" ]; then
 
     if [ -z "$PCIDEV" ]; then
         echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
@@ -109,15 +109,35 @@ elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
 
     passed="pci test passed"
 
-    domU_config='
+    domain_type="${test_variant#pci-}"
+    if [ "$test_variant" = "pci-stubdom" ]; then
+        domain_type="hvm"
+        domU_config='
+type = "hvm"
+disk = [ "/srv/disk.img,format=raw,vdev=xvda" ]
+device_model_version = "qemu-xen"
+device_model_stubdomain_override = 1
+on_reboot = "destroy"
+# libxl configures vkb backend to be dom0 instead of the stubdomain, defer
+# changing that until there is consensus what to do about VGA output (VNC)
+vkb_device = 0
+'
+        domU_disk_path=/srv/disk.img
+    else
+        domU_config='
 type = "'${test_variant#pci-}'"
-name = "domU"
 kernel = "/boot/vmlinuz"
 ramdisk = "/boot/initrd-domU"
 extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
+disk = [ ]
+'
+    fi
+
+    # common part
+    domU_config="$domU_config"'
+name = "domU"
 memory = 512
 vif = [ ]
-disk = [ ]
 pci = [ "'$PCIDEV',seize=1" ]
 on_reboot = "destroy"
 '
-- 
git-series 0.9.1

