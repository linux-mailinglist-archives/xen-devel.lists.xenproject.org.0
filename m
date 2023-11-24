Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6AC7F6A43
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 02:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640074.997899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ8-0002Tw-LE; Fri, 24 Nov 2023 01:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640074.997899; Fri, 24 Nov 2023 01:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6LJ8-0002SB-HX; Fri, 24 Nov 2023 01:48:38 +0000
Received: by outflank-mailman (input) for mailman id 640074;
 Fri, 24 Nov 2023 01:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uC13=HF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r6LJ6-0001id-I2
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 01:48:36 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 943652b4-8a6b-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 02:48:35 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 04B9E3200A48;
 Thu, 23 Nov 2023 20:48:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 23 Nov 2023 20:48:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 20:48:32 -0500 (EST)
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
X-Inumbo-ID: 943652b4-8a6b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700790513; x=1700876913; bh=eq
	3idnNj7apk53TrjyNs3MN+0xTHXPGEghyRmeuxtK4=; b=pixeXlnLfcoyGZAYeF
	ko+mkN4lEy+OTyNialH5Nql+TFXiVQyuFa3NuKcq218M68g1VUKl9a21l/Hz8o3n
	sjHAYRMR64q6jC8JOnUnro0CLkqqaG3MR19WSeHVJNvlLCNqJQqguSesU5o6oz3j
	Y5MpwEzvZOgoAAlTBzgqA0KpvI9XDtgmTy5vow6Z4szlZ67Qwwz+buu48R1s8SBz
	6CQ2RbzNvRWCP0L86KOZWDdvO90luhNg77CBBPPR9csG4RGCnreTmqhqCELgA4PW
	HjTTpvGsWnleoJSClwczt0opwRdfJKRcAz499Fp3AgLlI8qBgC1b9/f6KKaNnGpp
	ESgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700790513; x=1700876913; bh=eq3idnNj7apk53TrjyNs3MN+0xTHXPGEghy
	RmeuxtK4=; b=1IrHat9KKHv8B5r7izegXxv0l51hOzSWM0hqKGjxKrusIAJwU7l
	+kbUvIKJdjJXLLIsdCQM8eMYRPgagOWUVMzA3vTs0mXiaYTEsxD5SZLXWrSqMWnX
	3iPtEKwN+A8bEuOmX5y/wi1MC5NpQV6aa+uMXJeYZZBMEJ9yKcMdamhfNmW0eju8
	k7Qh+a+niUyGc1bDjg1eDAsQ9+Q5DdED5JL1OxggAa5VR7OrPSWrkHXkj7ajDEDB
	6Qug3CfzbHVGPZYhLBfwS5GIckHxC3XHFxZidPilrB/r5+v9G4CBlYlj5vR4Cgpo
	xFaNRP7wKgnCiuMYysuQaLGmFpEja2GD3lg==
X-ME-Sender: <xms:8QBgZfzq-qlWXw9MCGrX1x8lN8pFgTiJHH9qc7ru5xpckojCaBnynQ>
    <xme:8QBgZXSROj8UIYwKSi5aDWhcVAkNAKmbXhDaFBivNEazFGURi_eMihQkgefsbOxD2
    bfWSdUUc7CAqA>
X-ME-Received: <xmr:8QBgZZV-7jAwPKHiXEaaXzEXi_yN_1jblW1CTbcf8tdfs5_PE3BAQSsZtPQvI6T2WEWGYBEGY1tEj_jRRylebganWlZtNTgNb1VoRrbjEt-bFgBJWwKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeff
    iedtgeevffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:8QBgZZgvhUf8tE6cE8hkabv8DCY4jMMqKFPBsmAz01Ln28EkAIO2YA>
    <xmx:8QBgZRCY2whvn44wb4fwMtApEtv51dXstTWvpT8n9eK11tBtJ48Ngw>
    <xmx:8QBgZSK7xJ8eofUMdmQIevXd3ppbcUcyHWNZa7V--lG9tgEWFfdMFA>
    <xmx:8QBgZe6VCVWw7IiNoppNZAFkRLOH4IVTEgALRtdmImXsISGimAYBKw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/6] automation: switch to a wifi card on ADL system
Date: Fri, 24 Nov 2023 02:47:08 +0100
Message-ID: <9f18111c2d48b0715837789fc905d9e7b2a1ef0c.1700790421.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
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
index 6aabdb9d156f..931a8fb28e1d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -195,6 +195,10 @@ adl-pci-pv-x86-64-gcc-debug:
 
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
index f1b4a8b7a191..b821a291fed3 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -34,6 +34,13 @@ RUN \
   apk add curl && \
   apk add udev && \
   apk add pciutils && \
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

