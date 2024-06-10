Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663369022BC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 15:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737281.1143502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGf8X-00014H-Cx; Mon, 10 Jun 2024 13:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737281.1143502; Mon, 10 Jun 2024 13:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGf8X-00012c-A6; Mon, 10 Jun 2024 13:32:37 +0000
Received: by outflank-mailman (input) for mailman id 737281;
 Mon, 10 Jun 2024 13:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tSL=NM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGf8W-00012W-2F
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 13:32:36 +0000
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e33d8463-272d-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 15:32:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id AC1CB1140141;
 Mon, 10 Jun 2024 09:32:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Jun 2024 09:32:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 09:32:29 -0400 (EDT)
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
X-Inumbo-ID: e33d8463-272d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1718026350; x=1718112750; bh=hbscGw/cNDRdJD9fToOHiVS/f5IXmV3L
	8pdO8Nf6aPw=; b=Li44MU9R01C8n26bbsjuDD/DkcWOfFGcreulZD7L+Fzqz1dy
	AWyRvheM9ySMC8Ib9AKnar2ASjOrE0RE8siMII3PdJuZDW83QyQ3+d+q1UUFcSJC
	MmnWyA4mRjrJkQqmXv7AV5Wv0hIRNQBo1JqgVLZQxmEoROR9AspUbu9KL7vgCNNG
	TFqB9Y84wmEzrybPCqQv7rlOMDfUw69V3NyVCKFaNnqHBDRSWgJvb+6uvSqLNNFh
	3H/QVjJGf/bXgu1MeiC6UT0vUOu+YUba/AZn9KtjRLh9s1xi9xB2+G2tWehosqtU
	YuulFZ5gPlvFGFhjKwbiQ5U4IVilUNt2vqoKoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718026350; x=1718112750; bh=hbscGw/cNDRdJ
	D9fToOHiVS/f5IXmV3L8pdO8Nf6aPw=; b=nntUy8ScznAo9ejAaCbiy2bvY3D8T
	Sy1AEGE/SgZLXwBVKnJckCTDkAIX2PiER1nt3MmkTHUwZo0RhMQUnRmTm5ZPVbTY
	zAmAmeFAv3VN7d5EZcytK2G5irx7n8lkVSD4HADgxoBe5m5I0ywjTnL85SCTKmVf
	xs6zysQx0on77FkVvTj0wPXuyzFL3DV6j+vmF8ztEf/Uk2soEKcFwsyi7FE/ooSI
	XLVwOC0RTyG7I8oCPfsdOI8b+IOqGRf2eWVTdAd3MO9bX+KbBR6Xo1bzE84NAv2g
	mtS+M8jWp4Pj6fPyUN4Amcts3ADhw2x6078p7BHpc9oXUGGKCj4fj0yEA==
X-ME-Sender: <xms:bgBnZlYcmwxJO97hkOZwWaIl59Ha_oe-Z3QfWsPpfOyebkYsXIAntQ>
    <xme:bgBnZsZwvrQsqcnspKlPFFY3azyXVh1--_YEdWxnUBfh5e4wCPDwXysLCm_itfW-J
    YPY97ATRvi9fA>
X-ME-Received: <xmr:bgBnZn9AULCGxY9CW8lbosqn4xyh6nc4_wIx5UKVzHlAk_B8vP3DCGgvIRMiRAv_WvsONcQYhv1A2hFazIJLj1K7ZSdAMVqnT5QuG-Fk0G6O7Hpj9Go>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeei
    veekueehfeegveejveevuedtjeeiveeguefhvdffueetfedtuddvueetveenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:bgBnZjr8FAg8siSULEkzrjEQ03u75RY-Lyt-1ZI7OPCR_az-RB2YZA>
    <xmx:bgBnZgpFR1n4kUpeXWBQIoceLW53rdiBj7mKz84RmqNcnGSgpKam5A>
    <xmx:bgBnZpT9fd2uKj6SloFFcum8wYjDowfwsj8akJZcLoRxYZk2PgvW_g>
    <xmx:bgBnZoqBhQ9WlkkyF5lR2Q9OWBA1sHbzg3ukioXhP5jV_R873rDsGw>
    <xmx:bgBnZrUByUUEgrXEsH9x7T-kHBh0BvVzpCdSb39STwT2mbUOmhQYDJQ9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: add a test for HVM domU on PVH dom0
Date: Mon, 10 Jun 2024 15:32:09 +0200
Message-ID: <20240610133210.724346-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This tests if QEMU works in PVH dom0. QEMU in dom0 requires enabling TUN
in the kernel, so do that too.

Add it to both x86 runners, similar to the PVH domU test.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Requires rebuilding test-artifacts/kernel/6.1.19

I'm actually not sure if there is a sense in testing HVM domU on both
runners, when PVH domU variant is already tested on both. Are there any
differences between Intel and AMD relevant for QEMU in dom0?
---
 automation/gitlab-ci/test.yaml                | 16 ++++++++++++++++
 automation/scripts/qubes-x86-64.sh            | 19 ++++++++++++++++---
 .../tests-artifacts/kernel/6.1.19.dockerfile  |  1 +
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 902139e14893..898d2adc8c5b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -175,6 +175,14 @@ adl-smoke-x86-64-dom0pvh-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+adl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
@@ -215,6 +223,14 @@ zen3p-smoke-x86-64-dom0pvh-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen3p-smoke-x86-64-dom0pvh-hvm-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 087ab2dc171c..816c5dd9aa77 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -19,8 +19,8 @@ vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
 
-### test: smoke test & smoke test PVH
-if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ]; then
+### test: smoke test & smoke test PVH & smoke test HVM
+if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
     passed="ping test passed"
     domU_check="
 ifconfig eth0 192.168.0.2
@@ -37,10 +37,23 @@ done
 set -x
 echo \"${passed}\"
 "
-if [ "${test_variant}" = "dom0pvh" ]; then
+if [ "${test_variant}" = "dom0pvh" ] || [ "${test_variant}" = "dom0pvh-hvm" ]; then
     extra_xen_opts="dom0=pvh"
 fi
 
+if [ "${test_variant}" = "dom0pvh-hvm" ]; then
+    domU_config='
+type = "hvm"
+name = "domU"
+kernel = "/boot/vmlinuz"
+ramdisk = "/boot/initrd-domU"
+extra = "root=/dev/ram0 console=hvc0"
+memory = 512
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+'
+fi
+
 ### test: S3
 elif [ "${test_variant}" = "s3" ]; then
     passed="suspend test passed"
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index 3a4096780d20..021bde26c790 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -32,6 +32,7 @@ RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSI
     make xen.config && \
     scripts/config --enable BRIDGE && \
     scripts/config --enable IGC && \
+    scripts/config --enable TUN && \
     cp .config .config.orig && \
     cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
     make -j$(nproc) bzImage && \
-- 
2.44.0


