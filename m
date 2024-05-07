Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B28BE275
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718067.1120605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBp-00049B-ME; Tue, 07 May 2024 12:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718067.1120605; Tue, 07 May 2024 12:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KBp-00046I-Iz; Tue, 07 May 2024 12:45:01 +0000
Received: by outflank-mailman (input) for mailman id 718067;
 Tue, 07 May 2024 12:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4KBn-0003AI-FO
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:44:59 +0000
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c561c91-0c6f-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 14:44:58 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.west.internal (Postfix) with ESMTP id D40251C001A6;
 Tue,  7 May 2024 08:44:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 May 2024 08:44:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 08:44:55 -0400 (EDT)
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
X-Inumbo-ID: 9c561c91-0c6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715085896; x=1715172296; bh=Uac2qx6Vbh
	R5d6LSLBww4OHHHB4xRISCtst2qrKvDik=; b=NZ3nJJayXQFTqA+mUvCpiC9TVg
	gD7W0R0+PciJkLArYtoaAdQk84tR+KchXX9U+GziNDtiauWVtn6lHxk4CE3eQn78
	95bQcuwfcwm+cesruC+s/1LWd+o1eIXrxEro2oIVKQ2zp/MgUY7t+PbbNB0UBlPi
	jcBGEFZvvD99VbQJsv+Ppjg1R64lDguVWXjMhzLZ3SfzbO31h3CiuFRkmDGZV3QL
	xpcQmdj8+RHIMeUFX60QAycx7Y2ZQ5hKIpN+JNkjcUmJZ5Rc4q+Gs5pwU99yE8Dk
	GqB1LaiOR05dof6bcCUBnUuXbvp8dKlhi2nQjifDESP5dPckcGAYTiZ+cYtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715085896; x=
	1715172296; bh=Uac2qx6VbhR5d6LSLBww4OHHHB4xRISCtst2qrKvDik=; b=M
	kpBVCHFyUPYgsWeu2RSfdoAbC6hMyrHx7HznkSDgdAMsmogGBwFSEIEj0/jmJYES
	spMCgyVn4xLtyMFffEhtu/tyWWJXA289ZQvz66oIgSBqXRC2758sXXq+G5uYlLvR
	VTKLniHznDfluiN5JipvUtdbXw7TncZJtjaCQjbVphK1d0fg2oX64pBrfqV35MAH
	hjFJOEtwawijNqlH3+t3FC9+x5DsRlvyOtFrBlZXuRkxY31wVBCcJ8+pjv6RAaXr
	DF3lvrQcTBz99iUWpkS/0QjlKIga/t1lY93JZjM+KWSbb/9rBuPYaraLRZoSMD1+
	AVfk2RlXGaWRqVwEn5uDw==
X-ME-Sender: <xms:SCI6ZkcrioHD4UUikHK1ABBzxLW_nZrhxumPUam0MMVBYWZQYyvEiw>
    <xme:SCI6ZmNTIAo1F1D-4Us48n5Jwk5eR7Fzog5akkaVrM3f61YZLUX8VGaS9-vcrPHEA
    uqIHK2d0-w8hQ>
X-ME-Received: <xmr:SCI6ZljLUguujsDD8LKeEiK89RC2dxvByyr-1qpvvpDNiZXY2SOgnu7u50Kojid37RaYTB-KCGHtcH9GtmXtRLsrXOy2xg6dRkQ6A4S9_vgAgvW-Gso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeff
    iedtgeevffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:SCI6Zp8Q9T6_t4ByT_Uk1qu-7fdF_8LiPMYkm7kJzMFF8i_4bpqxXQ>
    <xmx:SCI6ZguyHmzeuqQtHYTid8kveP95-KYpEMF2XP8WF3REVah09bm-Rw>
    <xmx:SCI6ZgFNEspnXz_uLMNUZdVNikEvpSo8wwhH1hUSqrg1JOCqYLoJFw>
    <xmx:SCI6ZvNAg8iMMdXgMqcOaZDpImDM_PG7Hy5v6vQJoSLG4L_2GM9igg>
    <xmx:SCI6ZsLx_A8nMaAy_PIdAERGpop0Pj7otlC_nlFEiKI_Otk_JCgSLfIN>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v7 4/6] automation: switch to a wifi card on ADL system
Date: Tue,  7 May 2024 14:44:04 +0200
Message-ID: <666976d22bb50574b5c2a91d8b41b48de944b38a.1715085837.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
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

