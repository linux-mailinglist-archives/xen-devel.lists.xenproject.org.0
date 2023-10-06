Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A805F7BB031
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613210.953624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDq-0007WG-44; Fri, 06 Oct 2023 02:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613210.953624; Fri, 06 Oct 2023 02:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDp-0007RP-UE; Fri, 06 Oct 2023 02:05:45 +0000
Received: by outflank-mailman (input) for mailman id 613210;
 Fri, 06 Oct 2023 02:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDn-0006iR-Tp
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:43 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9464c7e-63ec-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 04:05:41 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D8F25C0308;
 Thu,  5 Oct 2023 22:05:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 05 Oct 2023 22:05:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:38 -0400 (EDT)
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
X-Inumbo-ID: d9464c7e-63ec-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696557940; x=1696644340; bh=/g
	Ul0Y4cOMR9LD5olCpH8YTdnvy+vSoAh/p2y/HuRgc=; b=Ut4sTEgCJe/T5EI9YH
	8vXs7bXEl7oicPQXlw+Yzif3J6/O/j6JhQoF3fRa2+WkL/ESjjYgATQfhHh4FWcb
	uIJSm0AQ17DJu/JZyDOSE3yMxYJz+o2jWBUhnCyfYspk0U7v2tc5zCIbS1qeeEEn
	X7t+iH4u1o/AQdUKMXqlEe0UyYnPMrFDKHpLrufBLgIh8Y3owfwRqGi1wJfs9iMZ
	clhPt6FmEdzJWstRtm4uKnD9bvLy+oMM9AaM57fLqRZSZS0aHx1CgBfo7nt2eMee
	qwsPz09YYKJS84VnG/fcIBn0fc9ta3dLhQPzTr0LrcIeABaW50KHpNuUMdAyOa3o
	LRlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696557940; x=1696644340; bh=/gUl0Y4cOMR9LD5olCpH8YTdnvy+vSoAh/p
	2y/HuRgc=; b=IzE/swSNreJkRnOHr//0+PEw71dhsW+yv/DA35+YM+fBzPgfazl
	Ddx79/cS7q6DBiJiUEDbIT8qYVhtu1E3zpffben/e22C5lxiWMPMfnCB48K4uBld
	Iqy3u6Dk0dvQlX1GnLWqwdNT00m2XZurdbJhyXCB0cHfyZGkt8kTdZBRZ5cXP9Hf
	qX3lL/UOd9R7ZbeImvsx9uQ2kpF1xTtytPp1c624AitQ+qWCh2kt65hyeNAESDGc
	lbEEHasuXNB8O4iiRXQNH+iU0gKidgWWwVg8BSsfitVEgZbneXeY4PxVuWyHDvY6
	BRIIyH/bFK3qY5uPO+f81yCnVfD5Fkj5mxQ==
X-ME-Sender: <xms:dGsfZcqd3q5d82BZ4IjG3We8Y35B9giWmNqxaC_yf-2YzjsWjV709w>
    <xme:dGsfZSrHumD-BP3jNe8X2lZpt7y4O32oSBfS2cFlsqjr1DXIuUN_M3Z5En8hTVmfA
    S6xWlAQTIVFqQ>
X-ME-Received: <xmr:dGsfZRPhjvyRHezULlr3dJX4zIXUyiZtE6sF9yBv1xp63iQ95DBggZZMEt3y8LCl1savzPlP3O4We6GWQ4mSnNa0I4wHyMpBCOE8O_uvERZk2lmORtVC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:dGsfZT5TdCPv9XR-Oq9eV-vjwJWRg7JRUrePtqp4SS1qzUIbNlDs1Q>
    <xmx:dGsfZb7pvFiPaG3W4k4vHj9KjQ5CDb-pkHuCG_V-grJLOfG-xQlykQ>
    <xmx:dGsfZTjWfkKih00I3vK6tSm8-s-FWaKHfjfV_hNlWdSF_OL6fYdrYw>
    <xmx:dGsfZbEwyExD9A6ybaS94iucrr3KbjXx6hA4CXcS0Qq7hUfNBrEV4A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] automation: improve checking for MSI/MSI-X in PCI passthrough tests
Date: Fri,  6 Oct 2023 04:05:18 +0200
Message-ID: <18b10f667f2df986691ed299f7640724618ec95a.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checking /proc/interrupts is unreliable because different drivers set
different names there. Install pciutils and use lspci instead.
In fact, the /proc/interrupts content was confusing enough that
adl-pci-hvm had it wrong (MSI-X is in use there). Fix this too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml                    |  2 +--
 automation/scripts/qubes-x86-64.sh                | 19 +++++-----------
 automation/tests-artifacts/alpine/3.18.dockerfile |  1 +-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4b836bf04784..61e642cce0cc 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -195,8 +195,6 @@ adl-pci-pv-x86-64-gcc-debug:
 
 adl-pci-hvm-x86-64-gcc-debug:
   extends: .adl-x86-64
-  variables:
-    PCIDEV_INTR: "MSI"
   script:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 5464d10fc343..842e6fae7204 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -90,23 +90,18 @@ on_reboot = "destroy"
 
     domU_check="
 set -x -e
-ip link set eth0 up
-timeout 30s udhcpc -i eth0
+interface=eth0
+ip link set \"\$interface\" up
+timeout 30s udhcpc -i \"\$interface\"
 pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
 ping -c 10 \"\$pingip\"
 echo domU started
-cat /proc/interrupts
+pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
+lspci -vs \$pcidevice
 "
-    if [ "$PCIDEV_INTR" = "MSI-X" ]; then
+    if [ -n "$PCIDEV_INTR" ]; then
         domU_check="$domU_check
-grep -- '\\(-msi-x\\|PCI-MSI-X\\).*eth0' /proc/interrupts
-"
-    elif [ "$PCIDEV_INTR" = "MSI" ]; then
-        # depending on the kernel version and domain type, the MSI can be
-        # marked as '-msi', 'PCI-MSI', or 'PCI-MSI-<SBDF>'; be careful to not match
-        # -msi-x nor PCI-MSI-X
-        domU_check="$domU_check
-grep -- '\\(-msi \\|PCI-MSI\\( \\|-[^X]\\)\\).*eth0' /proc/interrupts
+lspci -vs \$pcidevice | fgrep '$PCIDEV_INTR: Enable+'
 "
     fi
     domU_check="$domU_check
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 333951d05e84..5f521572b8fb 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -33,6 +33,7 @@ RUN \
   apk add pixman && \
   apk add curl && \
   apk add udev && \
+  apk add pciutils && \
   \
   # Xen
   cd / && \
-- 
git-series 0.9.1

