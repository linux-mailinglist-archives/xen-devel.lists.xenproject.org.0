Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80A87AA44
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692561.1079857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLq-0006m6-Ki; Wed, 13 Mar 2024 15:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692561.1079857; Wed, 13 Mar 2024 15:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLq-0006ga-Fw; Wed, 13 Mar 2024 15:17:06 +0000
Received: by outflank-mailman (input) for mailman id 692561;
 Wed, 13 Mar 2024 15:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLo-0005e0-QW
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:04 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be8de75e-e14c-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:17:03 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 6CC4E11400FF;
 Wed, 13 Mar 2024 11:17:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 13 Mar 2024 11:17:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:17:01 -0400 (EDT)
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
X-Inumbo-ID: be8de75e-e14c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710343022; x=1710429422; bh=i5H8JidWWb
	TxxhBJM5jd/OPNyDg2YLsGie249e88IWE=; b=UKvjsY1vxQCEsNgn1NvSASZJoX
	pC8aLwCl5sLjzxT4OQ9Dg17DN2aJXfyEym/U2Kxndo4u7HtrzwzDPjedgB+qrNu5
	3E1JODtwBLtCb8h99WBxL32dvSYLfQjFLGpFSzzkAzp9EgunpsMaYbTVP7VUh4VE
	vLIur6Gbo9E8yz/lnlSzkSKNaj24DdYopTlgD8OHPHAZEbM3LPr1e1N/vKfu6V88
	swr0+L6LQPYMVwcL5Kq+9nmjoe9c7wojGI0PTfdLCUGGUPyZthsHnqx/rRO/kgtv
	Ll64MMjn4YG3ZkVHDxc4eLSm1W2YzXZcbAJLDHhOQum1xwtemkI8M+XrFU0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343022; x=
	1710429422; bh=i5H8JidWWbTxxhBJM5jd/OPNyDg2YLsGie249e88IWE=; b=B
	Ryd5Gz71E/xqjdh+hLpHF1s6usSvZ7wmu8PgBUnfhM4MPSbUg7316DtNRP8cVTSl
	Oxut5vsoQBIohFQr0tDayu95L19ilUXuT2ZkL+eY869urylBE8h5apVFVOwsxQ9E
	Ek5F3My6NFkGVrobko4Soem7jEkmk0Tp7sAcK1wtMzVD+Mh1ghUOXH/ev3gd+RG9
	Lb3jqQptdiKGH4f568DgHnl3OcsiDQ7kDia4KzV8Kcfk0aVogblyZdRQXJXQVmrA
	MWLOt0/Fo+MIoCV1E/VJykslsIjFm4+nTkXX7KK6rkxnlYeNJJUgjk3BVeooZ50t
	QzcOz3w4NhgdKyECS99og==
X-ME-Sender: <xms:bsPxZYL6OJbcN8M0hsc35Gy1xgTOdKKHyJJo6nmi6DnmBLTugkgNgA>
    <xme:bsPxZYKRIRuKr4FyQhmzlc_kpXSjAceGN8sPfZUBomp-pc_80zfRl9TgTejMt-VDE
    3jHbbemfOWpwg>
X-ME-Received: <xmr:bsPxZYsYPo3will0EuUzg5vYVfRYh2J86H2beXpmrRcg4ezW5jY7_tTWY4E0pYPYsYTY-7ygm_tRD3Iblxx-st7yHZ5KjxHGlMqSInXkOAO7dHy1a4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffei
    tdegveffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:bsPxZVbBhFyf6ol0OG1IwSy63HhMkTJ69oGfE3r3dwMd7y_87UxlOg>
    <xmx:bsPxZfZZxbXF8innZCLqNyOk8LnHuR5VS2DCCAaihQMmGONqaBVsgg>
    <xmx:bsPxZRDuiHcpI5soTp24Evu539frPz0jQkq1fcHrbKS11839qFy9uQ>
    <xmx:bsPxZVZOjbQVGvl0QLtC4i2bpElcnKBJzMRdRYJvr3boZurauMdaSg>
    <xmx:bsPxZeURPhs6kKQmRrmvnHeeDA6q8z4oqFlyi5iNiIr2v7ZxPY4QVg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 5/7] automation: switch to a wifi card on ADL system
Date: Wed, 13 Mar 2024 16:16:10 +0100
Message-ID: <30d445332e4cd70ce1d53a71d878107e43f128c5.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
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
index 8b7b2e4da92d..23a183fad967 100644
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

