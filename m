Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C987013E6
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 04:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534121.831402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel4-0002zz-D8; Sat, 13 May 2023 02:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534121.831402; Sat, 13 May 2023 02:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxel4-0002wk-9g; Sat, 13 May 2023 02:13:18 +0000
Received: by outflank-mailman (input) for mailman id 534121;
 Sat, 13 May 2023 02:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxel2-0002fe-Oh
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 02:13:16 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63e5fc3-f133-11ed-b229-6b7b168915f2;
 Sat, 13 May 2023 04:13:14 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F18755C0230;
 Fri, 12 May 2023 22:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 12 May 2023 22:13:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 22:13:10 -0400 (EDT)
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
X-Inumbo-ID: b63e5fc3-f133-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683943991; x=1684030391; bh=Pq
	0ODF4oWtMA348eaNF9YassconxWjLy3yNF0iJyH1E=; b=FTKYYRqT1YMETKA5PJ
	pyIdjmf74CAq9jXOhJxBz6HfcOc2lehOtt2pKxjmuxAdjmP9bgVHMi34DxUPWg5r
	rKc4nvtv9tDiZFKalPL2qpu4bCxxIv0U/j/yoP5pLUS8bRMLHCgN/ySqoJmRhRLm
	ksOpuDVfNBuN0FYU8RJ+UcmXwidhw52Gh0vrwYSvBqge9ulPCIdelepTO7OxCuB5
	SicX2MYSlB+qaLHBAZKLUMjRWh8fKbh0Ofeq72NDfp1VxVOXbtlDFkJJLOXaPOOk
	6VBv2PIzrAKCymQweTILDqwQHc4uv4kG+lzmhst3eXPiCyFGbY++6d9AUvwwIl+o
	uB9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1683943991; x=1684030391; bh=Pq0ODF4oWtMA348eaNF9YassconxWjLy3yN
	F0iJyH1E=; b=oPq5DlDwW9cHaLN6XBZCy/0l1fSl9Nob/VInM2Yi4baMJ1+Y0I1
	sp1crTi8ISUHBVq/iyCpcnZSatpP56/ryA4CzSPcSB13/P8snSDDyDLuUR7H6mEw
	OsZY8nbTa6o5MUr2mAUREFZXa1fPkKuGRH+bBtb34DnmBcKtmEmDxruJhiQ2xdw6
	ezW+/y6lKeJ/BSHDiW2PRbE2y5c8xN1sHcVE9B8w1gJeCc5K/efK0x/lO/qF6WLR
	xU3PjBXryMInM+Xfw440agMXo5MSpXiyyIA25lNMzg0cavjewvNXDVWFsf+4GjbB
	nR2uEvutiMMkCc8qa4+Xk0kt0OZaEJ10jZA==
X-ME-Sender: <xms:N_JeZBMLdqaqGclVRNDY7I-6X4pEPXU4HwzijLEwB1psIgyS9TbVKg>
    <xme:N_JeZD_lr-W3irfQQ3eDK5EzT6MKEk6TlBmYDW2AqpEaW8kP7J4lsPbTR3a8jbig7
    7qW842pKruwhg>
X-ME-Received: <xmr:N_JeZASOT8NNa2p6ihHHvI1stCJ6lXhTpSZ_E-OUqwwFGRg8X3SH65nRaJh-lWamSm1v4zCByywqqMxlwogGq9GcStqIOJY1B8guZIRU7Ax4KhgbM3IC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:N_JeZNt7Ckuw6i8pwVPMs-yA17PP18YlHoJwDwcOvhXVir19bF4Qgg>
    <xmx:N_JeZJdC5bKFKVpC9DkwJuFBu8c_3YNhBfEJW8_vU7Ik9NU8Fqk6fw>
    <xmx:N_JeZJ2gi_vE3eoUg_3EuHCjCeBwkadUm8aC4M3mKtlZTCfeZka_qQ>
    <xmx:N_JeZJEHRTaX_SzEsoFURRPj73ZPC5cTKx2I6ufHKRhWy1QpFm0HWQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/4] automation: add x86_64 tests on a AMD Zen3+ runner
Date: Sat, 13 May 2023 04:12:46 +0200
Message-Id: <741648760682e3097a0d984342e5cad9387172cf.1683943670.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds another physical runner to Gitlab-CI, running similar set of
jobs that the Adler Lake one.

The machine specifically is
MinisForum UM773 Lite with AMD Ryzen 7 7735HS

The PV passthrough test is skipped as currently it fails on this system
with:
(d1) Can't find new memory area for initrd needed due to E820 map conflict

The S3 test is skipped as it currently fails - the system seems to
suspend properly (power LED blinks), but when woken up the power LED
gets back to solid on and the fan spins at top speed and but otherwise there is no
signs of if life from the system (no output on the console, HDMI or
anything else).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index cb7fd5c272e9..81d027532cca 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -108,6 +108,16 @@
   tags:
     - qubes-hw2
 
+.zen3p-x86-64:
+  # it's really similar to the above
+  extends: .adl-x86-64
+  variables:
+    PCIDEV: "01:00.0"
+    PCIDEV_INTR: "MSI-X"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
+  tags:
+    - qubes-hw11
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -176,6 +186,22 @@ adl-pci-hvm-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.12-gcc-debug
 
+zen3p-smoke-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
+zen3p-pci-hvm-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
-- 
git-series 0.9.1

