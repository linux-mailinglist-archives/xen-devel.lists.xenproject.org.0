Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771528C1D3C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719467.1122258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM3-0007yx-UA; Fri, 10 May 2024 03:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719467.1122258; Fri, 10 May 2024 03:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM3-0007xP-Pw; Fri, 10 May 2024 03:55:31 +0000
Received: by outflank-mailman (input) for mailman id 719467;
 Fri, 10 May 2024 03:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HM2-0006yN-Cb
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:30 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22db5715-0e81-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 05:55:28 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.west.internal (Postfix) with ESMTP id 6113B180012B;
 Thu,  9 May 2024 23:55:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2024 23:55:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:24 -0400 (EDT)
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
X-Inumbo-ID: 22db5715-0e81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715313326; x=1715399726; bh=Uac2qx6Vbh
	R5d6LSLBww4OHHHB4xRISCtst2qrKvDik=; b=w2D+lAYsyqL5Yt1/KjA/K7+087
	GPEhsECSdBsTWU+T6243GImObLIxzRLcMOXQQ/B8Nu3PA5/YO+WVaAEYuVhIZpGI
	oz03idPiaded75Qoq4amyWkIVRxK33kgWehEvT5iqkJRLk3N89p35dl8zxclygfm
	HwSJMejJ5mZz/d2GM11n5kKZPmf8MY8q9THz2tRiA5oenJL32OVxtG41Lw0QvByO
	wIopligZP5mqgcuLKe2llvcBdWQi9lSjRSZlcOLZH33vzNu9PZrjpg+K6MS+/5DV
	1NjsW2ZvA9qHgxmWkb+Gd+ikFgEMuE5DzwnxpPtRCNJ3BysWdDcjl1SrDALw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313326; x=
	1715399726; bh=Uac2qx6VbhR5d6LSLBww4OHHHB4xRISCtst2qrKvDik=; b=J
	YxxpGxc/MIMaxzkLte1Vm9jls+CbjD2naXZS9tjilKFNpa4CCX3Oo1mBueodpsjt
	UpmbGl5nMrpyPOLE+A4R6807/CURiamk117zOza2c8nsH7DfziTrwuXZbAL+XKtn
	E84YZGgeckPlYV4Xs10aVNYYKsal6AJN8KpSJ1rrUVRcVxWZssB73scJhhKdfTJi
	BxJAls+C3CPymQ1+cknSd7egKW9rC0TZYMPwzzVmOZgcBGM+iAIjKhXAsNpwuxPJ
	bYC7fsVkjxajJ+GYhaoHIc9v/YnLXLIxprgHm0qH1OpSa3TjuB2ZYFQbHviuvrS2
	+tsn/LBNY6RdldMfQ2H3g==
X-ME-Sender: <xms:rZo9ZtCvOQSxi4CRoMRRWyg4CfzoXvAgflmpAx9x8G9kt0P-T_Plzg>
    <xme:rZo9ZrjXOlxb3RoZThYzym255HIH83xo6LF65rgZ6_ny23KoXaO0_0C0f4s652q9V
    PrwMw0tiDzQfQ>
X-ME-Received: <xmr:rZo9ZomB3Yefn2PPJVhrcy-LrIUQubD1Ct-52pAyxM65-vofryMQCdh9IiiDoEbfLyVh5lSqCAo37naIIpZVFEz6bro0gNymA0j6zL4658ggUqLiEk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeff
    iedtgeevffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:rZo9Znyp4FhIS8fm9Hvba_amqn864PoFElIJ1yD90RyBILCMuOw6yA>
    <xmx:rZo9ZiRWgbJQqPOu8i7Jx58MoGUT6TnKLB_DXszcBFpqIZtQop8yOw>
    <xmx:rZo9ZqahjFZJj0QXUpb-8Zn4M6zqbyf79eCCAxg6vmol3yZcwa7FEQ>
    <xmx:rZo9ZjSJwZ49puO4IVArPRa7eWZRLO2SYfQ2FRQ7zxzhnUV9Q1Krdg>
    <xmx:rpo9ZgdWLd1x-75kyQW9RGaTg0wrPpJfbBdI8mrYvnuDgjyAlB1UQwUG>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v8 4/6] automation: switch to a wifi card on ADL system
Date: Fri, 10 May 2024 05:53:24 +0200
Message-ID: <ac5f7b07e47edf6f14d50935d7fd01fdd6a6e900.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to a wifi card that has registers on a MSI-X page. This tests the
"x86/hvm: Allow writes to registers on the same page as MSI-X table"
feature. Switch it only for HVM test, because MSI-X adjacent write is
not supported on PV.

This requires also including drivers and firmware in system for tests.
Remove firmware unrelated to the test, to not increase initrd size too
much (all firmware takes over 100MB compressed).
And finally adjusts test script to handle not only eth0 as a test device,
but also wlan0 and connect it to the wifi network.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This needs two new gitlab variables: WIFI_HW2_SSID and WIFI_HW2_PSK. I'll
provide them in private.

This change requires rebuilding test containers.

This can be applied only after QEMU change is committed. Otherwise the
test will fail.
---
 automation/gitlab-ci/test.yaml                      | 4 ++++
 automation/scripts/qubes-x86-64.sh                  | 7 +++++++
 automation/tests-artifacts/alpine/3.18.dockerfile   | 7 +++++++
 automation/tests-artifacts/kernel/6.1.19.dockerfile | 2 ++
 4 files changed, 20 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ad249fa0a5d9..6803cae116b5 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -193,6 +193,10 @@ adl-pci-pv-x86-64-gcc-debug:
 
 adl-pci-hvm-x86-64-gcc-debug:
   extends: .adl-x86-64
+  variables:
+    PCIDEV: "00:14.3"
+    WIFI_SSID: "$WIFI_HW2_SSID"
+    WIFI_PSK: "$WIFI_HW2_PSK"
   script:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 7eabc1bd6ad4..60498ef1e89a 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -94,6 +94,13 @@ on_reboot = "destroy"
     domU_check="
 set -x -e
 interface=eth0
+if [ -e /sys/class/net/wlan0 ]; then
+    interface=wlan0
+    set +x
+    wpa_passphrase "$WIFI_SSID" "$WIFI_PSK" > /etc/wpa_supplicant.conf
+    set -x
+    wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf
+fi
 ip link set \"\$interface\" up
 timeout 30s udhcpc -i \"\$interface\"
 pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 9cde6c9ad4da..c323e266c7da 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -34,6 +34,13 @@ RUN \
   apk add udev && \
   apk add pciutils && \
   apk add libelf && \
+  apk add wpa_supplicant && \
+  # Select firmware for hardware tests
+  apk add linux-firmware-other && \
+  mkdir /lib/firmware-preserve && \
+  mv /lib/firmware/iwlwifi-so-a0-gf-a0* /lib/firmware-preserve/ && \
+  rm -rf /lib/firmware && \
+  mv /lib/firmware-preserve /lib/firmware && \
   \
   # Xen
   cd / && \
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index 3a4096780d20..84ed5dff23ae 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -32,6 +32,8 @@ RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSI
     make xen.config && \
     scripts/config --enable BRIDGE && \
     scripts/config --enable IGC && \
+    scripts/config --enable IWLWIFI && \
+    scripts/config --enable IWLMVM && \
     cp .config .config.orig && \
     cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
     make -j$(nproc) bzImage && \
-- 
git-series 0.9.1

