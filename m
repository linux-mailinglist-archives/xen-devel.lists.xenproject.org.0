Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5428B3EB7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712998.1113963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnD-0005jW-FY; Fri, 26 Apr 2024 17:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712998.1113963; Fri, 26 Apr 2024 17:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0PnD-0005ch-AO; Fri, 26 Apr 2024 17:55:27 +0000
Received: by outflank-mailman (input) for mailman id 712998;
 Fri, 26 Apr 2024 17:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0PnB-0004Xj-Pd
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:55:25 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b0fa59-03f6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 19:55:24 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id A78591C00198;
 Fri, 26 Apr 2024 13:55:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 26 Apr 2024 13:55:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 13:55:20 -0400 (EDT)
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
X-Inumbo-ID: 27b0fa59-03f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714154121; x=1714240521; bh=i5H8JidWWb
	TxxhBJM5jd/OPNyDg2YLsGie249e88IWE=; b=FyaWZ2IWiUmzB/IXuhy7vGvwP2
	7TRyIGtGw+IDauhMqLG1KgcDvGrcVRswH7CMrd9XNGz22Mh2elX9+zSllFLHn7Dz
	kogQdTvSuD1lAnkmTi3y4s+JnouP6pTlw0LeVgy5wEuOxkxbtosUaxau8TZQzjZX
	+pggTCA2lgCNDRJqOfdblqli7iDcOiGl1Y0R+c9OI24Te4os7pGJWjALQKEj4CfV
	FHr3KML1g8fflq/932p8rs3s45VMlMP2QDOYm2s5X1c8dKK1HPxg0VMVhruEa0fb
	PWkMQjb35vu6faKSx7Luz8Tl+q2yP/QbDx/xJEmWUOr03+s0IcE6rqapnD5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714154121; x=
	1714240521; bh=i5H8JidWWbTxxhBJM5jd/OPNyDg2YLsGie249e88IWE=; b=k
	dhmtqB10MNCDIAqMnAQ2tHtNYX16Sz47/nS1K+O5ykAwTourPJoGK6Rf7j7Xw+TZ
	ySNcX5ROgzqcA1Zn4iL34byWeRDldjogAodCdzISL0dFA7BoTE8NdaqFx9ooeUHr
	TyoSZTkIuy4OX2E9vuUwmufqcg1n6uaQ/nDHwjBn3ECjPXHytXCYKQIm0PUkUeOX
	O0BF1QnI5uVFe96ohHUfXvprF1wS9AlwGFnW/PDaGcB41Pfdrx29tj45B9fgTKbB
	h6/GvgpqSHjXTAPqIf5+My4B3XsP8Cn5al7DIO3qTHguxtLQQLvfx0A3cDmKCWNJ
	avMsOWDm7NNxR+Rd/MUVA==
X-ME-Sender: <xms:ieorZtoQcLpOvTO5W9g660m_PC3ogJy95TQK-b3d5uKKAhRkY7e2fw>
    <xme:ieorZvokye3yra4qbAnhlG6i2PCqNSug6oQTY4i72146eIHXyNw-z1da5IiCDAp8C
    jOxaXlPXITFMg>
X-ME-Received: <xmr:ieorZqOytc9HeXkt6upEHVNajACJS6egAn8PV651shP7R650zcmBk_u0PZwVXTo_GIeA3PPxwPPUu70cSWNzLMHeXoa8EscW9d-vZVehWtPxKuYBJVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    ffeitdegveffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuff
    homhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ieorZo7tAvxq0hwjiOR6mIYkcXW5k0uAzLowEwrf2toW6ch6lxV_HQ>
    <xmx:ieorZs592E1DV9AWVtgVg5KVLTg_Y7Ur8cBFEYgS99QiF111URHh4Q>
    <xmx:ieorZghBA8XzBxGfWSrJtdh5fR2IhMdEBTMFR5KkHhDJyttsJAy2Cg>
    <xmx:ieorZu5xzSQpL2PLaSInVTNCmwdYyrTIYPNjDeFfofJaYXIiyD7Nsg>
    <xmx:ieorZqm_n65tsKrWcwjYBoC_6en5e-cZbpnItXtse17XWvVqcrR8G3hR>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v6 5/7] automation: switch to a wifi card on ADL system
Date: Fri, 26 Apr 2024 19:54:02 +0200
Message-ID: <7f3f80f2f7e106a9362c779b925cdcdaaadf3b36.1714154036.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
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

