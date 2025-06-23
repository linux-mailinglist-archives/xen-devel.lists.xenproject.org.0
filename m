Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6AAE4556
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022433.1398276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZy-0002e7-Me; Mon, 23 Jun 2025 13:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022433.1398276; Mon, 23 Jun 2025 13:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZy-0002av-JJ; Mon, 23 Jun 2025 13:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1022433;
 Mon, 23 Jun 2025 13:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWP-0004sG-0c
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:41 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1043072-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:40 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A547D114015A;
 Mon, 23 Jun 2025 09:47:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Mon, 23 Jun 2025 09:47:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:38 -0400 (EDT)
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
X-Inumbo-ID: a1043072-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686459; x=1750772859; bh=U6TR5I9wcC
	fnv1sKQpBd62+VqvdLWnBwgNaz4GebnSI=; b=YJo9CxzEEqAsmupJmRAmP6IOiP
	aJujjDW63kCGaElzWbDpTlYlDy+JEFXZ8hDWCZFvdyrqHbWQs2LUqBK9ABLmpFH1
	ggeSAOGr3h+YbmjHwwfPz3gFFoim+paGqWcPqOTNJhG3CRqFGQoeyaYhEyNZiWgt
	VH0mRqseVlamiM0AeDLl4bA6QvUAol3FbbvF/wPSdZZVgxnKHrF8zJTWLVF5xPuJ
	t84wg5bb8lL596Lx+Y/EgIg+YfSX75mhz0qJ3LNzNZ9fRKRaNdKV2q/5q02PcVt3
	VGdbeaVwSOEFwyVjPrvCzePjbS9PDWmxwFZOe6GxMflbnswhSzlQddjlt6lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686459; x=
	1750772859; bh=U6TR5I9wcCfnv1sKQpBd62+VqvdLWnBwgNaz4GebnSI=; b=o
	C3q3MEfcXd8q22lWBBy6iR8MHfR9iDxRvhA1jjWD/o+/lU6+OJnjwn1ED3HbjtD3
	fq26ajnjk2OLJPk/jg9WPUvdDAcERGvWJB0Mqo9T5Zf74zIS4k3K3cI6nR/OVFFw
	ZqMP6p6L/eb2acIoOxSbKg++JdLviBfAL66nX7NjBzzpFubWa7n5VWD2zg1bEnLT
	uZk6pRCXUZsaj4y6WkBj4+9DlTkY0PG3kYQGOxtSqz55XMx3qTYNnoqD7XJlWwfm
	i9f5xF20ItLJCJzdvikVMg7TOyR0KyK4lQwWlTY8j7tTcKL7so92q6SStrKsZSd7
	S6FhXFtLxTKWaIrKDxZtQ==
X-ME-Sender: <xms:-1pZaHNGTXOAb-FmOkaBxP_GEomLezrII42T-SXfFIsYC3RteJZPlw>
    <xme:-1pZaB9tLHkyl4fOlS_VgOFCjrkwmIR0eMAdYAQhha1ywF0lpIcmrySoIXacYeD3C
    H_q4hbHnNpq5g>
X-ME-Received: <xmr:-1pZaGSo6PN_2IrbxyfGue7tbagWhP1oi2Dwp3j2kWVXpN67iVzFfhZtRB2fCLDGy3-9Ka0PRgl4Fi9sV1zas2EgyTH7I5lvh589R-Cs1mgvZuHHkFUf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeitdeg
    veffteelvdeghffhvefghfefkeelheeujeejgedvvdfgffejuedtvdelnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:-1pZaLv2bBpyjm_6vbxEZgeXIkATTj_V7J6Ry94QgWdFzglCQLH5AA>
    <xmx:-1pZaPfTuAB5VXf20o9Y-i1zapPyDZcuEcKRzLVskeOBxTCxksdf9A>
    <xmx:-1pZaH3GvHekfLXVuk4d1fuJtj7GaKqhEEC6pxmsgT0_9ube1GLR6w>
    <xmx:-1pZaL9ijmn2bAEz38FJniSOKM6zACEfzc0mvieDJkzFJGl1OBeTMg>
    <xmx:-1pZaKmnAlrrhqydQLKJElmEnrM04JhCcIM2lgf73t9l1CB7FZAAoG80>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 2/6] CI: add AMD Zen 4 HW runner
Date: Mon, 23 Jun 2025 15:47:11 +0200
Message-ID: <57ddf8058a966d98e3fbfa923de567553ea712c0.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is AMD Ryzen 5 7640U in Framework Laptop AMD.
It has several things different than the other runners.
First of all, the console is using XHCI debug capability.
And then, this system doesn't have normal wired ethernet. But is has one
on USB, and this one is used for booting. For this, enable
CONFIG_USB_RTL8152 in the Linux build.

Include some basic tests, plus PCI passthrough.

This machine doesn't support S3. S0ix pretends to be working with
Qubes's dom0 (kernel + userspace), but it hangs on suspend with Alpine
used in test. But even when it doesn't hang, it doesn't really reach
deep sleep, so skip this test for now here.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Previous version posted at https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/T/#u
Unchanged since then.
---
 automation/gitlab-ci/test.yaml | 56 +++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1b88ee5c3be7..a9d871cf72ad 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -197,6 +197,16 @@
   tags:
     - qubes-hw11
 
+.zen4-x86-64:
+  extends: .adl-x86-64
+  variables:
+    PCIDEV: "c3:00.4"
+    PCIDEV_INTR: "MSI-X"
+    CONSOLE_OPTS: "console=xhci dbgp=xhci@pcic1:00.3,share=yes"
+    SUT_ADDR: test-12.testnet
+  tags:
+    - qubes-hw12
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -488,6 +498,52 @@ zen3p-tools-tests-pvh-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen4-smoke-x86-64-gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen4-smoke-x86-64-dom0pvh gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen4-pci-hvm-x86-64-gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen4-tools-tests-pv-x86-64-gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+zen4-tools-tests-pvh-x86-64-gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
-- 
git-series 0.9.1

