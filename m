Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4356A7DDDF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939901.1339899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmI-0004JW-Gd; Mon, 07 Apr 2025 12:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939901.1339899; Mon, 07 Apr 2025 12:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lmI-0004H1-Dn; Mon, 07 Apr 2025 12:40:38 +0000
Received: by outflank-mailman (input) for mailman id 939901;
 Mon, 07 Apr 2025 12:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lge-0006Bg-LU
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:48 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02659ec-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:46 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B8382114013D;
 Mon,  7 Apr 2025 08:34:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Mon, 07 Apr 2025 08:34:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:44 -0400 (EDT)
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
X-Inumbo-ID: b02659ec-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029285; x=1744115685; bh=bBr+eZXUOc
	ukuCDFZbX2ITRA0wCf4Pu2nOyRJufUmqM=; b=oLWxl48stmB4k9m+WEpoU33GhF
	w5K9tlQCQO4SwpqU7z8mSv8sWGk0dyVaRRbTR9n8J19ecBh9nkaLjAGumQaPIPOd
	4JhuzRxBzR196XBGlwSaWnPcpu55LAQID0230FMKw6z3MJs2+nw0TdzkkmTj52Al
	gLYGo9nxhNBvqqj/lU3E6zj5yHYltizGrDoyWP5TWkm7iksOIb+soPGUT8LvF2iF
	bJ+lnoqfa82joim6XPbAbHayCHDftxlJoChO3BRgWilf9Rp9jTAMmkT7Y8aF1aVn
	dA2rbIXowY8W952+Hu4yjvirqWRf/hnpX84H/aB6nT5lbxymDG6FNS05asPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029285; x=
	1744115685; bh=bBr+eZXUOcukuCDFZbX2ITRA0wCf4Pu2nOyRJufUmqM=; b=D
	0vKijYuWx66E1hKtUlss0mwfEJr6lbwgCYSHUWhmE8s2lJ1qzYGdpFWh0ziR4a1C
	pOUOpqMq7Jbv0NNqdqrWg3xcUpXNqoAF0VE3XtIeZviQkBr3HlSi9hXOneIq+irA
	pXk3eOyPdODzg5fGR/9puu9oacaeFswa2UMg10fNykpk40YObnYKyKgWK9+GDCNb
	wH9Ai8toEPSzFfUizuqJ0IY3hD1oq9/fBppuLZTLuY7UI7vK9b+kFXm1YnF/3Fy/
	G42bOUXVOC8U3d8DlePQf12HCZqzigkN3RpaE7FRCvC80VcIbWoKrGGdq615LBBm
	BpKP+yiDHe/eLHl+yImIw==
X-ME-Sender: <xms:ZcbzZ4FGtUqphP5AD0j0vpE6rdZRzRZo3PdnrRm2ocbGovnelAbN-w>
    <xme:ZcbzZxUHadEmNU03T6V854vqT6t9fNF8xhOTZbb5_bnz-UBWRfci9VzAtiFbkFcJs
    qRHotGfEcM2Gw>
X-ME-Received: <xmr:ZcbzZyI60TrZTcjx9WiwkG_JX3RzppDFo4h3OIOxw9v0PPDzC3RLCEuf13PJOy-0gu4wKF3DCvVkKVBbv_laofU2iZowcf8k8GifF3_w_mSCq4ci3-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeffiedtgeevffetledvgefhhfevgffhfeekleehueejjeegvd
    dvgfffjeeutddvleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinh
    hisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgt
    ohhm
X-ME-Proxy: <xmx:ZcbzZ6G4i11ORz5KBXPDZD6zqWyZ76reLrbToSyNItpuCrnMZM2h7g>
    <xmx:ZcbzZ-UGDmvR9qIgPr_Pwf3aDbhRbxAAX6e98bcDPIRjxPd0D2jfbg>
    <xmx:ZcbzZ9NJLaEif4eLIZ0iMERazV0sZczWB0Ddhs-z_08moO0AqIRGUA>
    <xmx:ZcbzZ12SvcvVrPyATOcPjoJRceDnge_wU86yqO3cfkNRiCuJB-QtPg>
    <xmx:ZcbzZ3fZnEF2zkIHwtGonrNd6rpqcm9LBKMBKf1IGSTDRFVBsrIgKYlp>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 10/12] CI: add AMD Zen 4 HW runner
Date: Mon,  7 Apr 2025 14:31:10 +0200
Message-ID: <3f825b4bc78916fc537d8bde4a5e49931106bffc.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
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
Requires containers rebuild, especially tests-artifacts/kernel/6.12.21.

Do not apply yet, until issues found by those tests are fixed. That
would be at least third issue found using this system, so lets have it
in CI.
---
 automation/gitlab-ci/test.yaml                       | 56 +++++++++++++-
 automation/tests-artifacts/kernel/6.12.21.dockerfile |  2 +-
 2 files changed, 58 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index a13dd040bd26..feb2dd10ab30 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -188,6 +188,16 @@
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
@@ -479,6 +489,52 @@ zen3p-tools-tests-pvh-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen4-smoke-x86-64-gcc-debug:
+  extends: .zen4-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
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
diff --git a/automation/tests-artifacts/kernel/6.12.21.dockerfile b/automation/tests-artifacts/kernel/6.12.21.dockerfile
index d7d34031cab5..4e0a68ec61eb 100644
--- a/automation/tests-artifacts/kernel/6.12.21.dockerfile
+++ b/automation/tests-artifacts/kernel/6.12.21.dockerfile
@@ -19,6 +19,7 @@ RUN apt-get update && \
         flex \
         bison \
         libelf-dev \
+        libssl-dev \
         && \
     apt-get autoremove -y && \
     apt-get clean && \
@@ -33,6 +34,7 @@ RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSI
     scripts/config --enable BRIDGE && \
     scripts/config --enable IGC && \
     scripts/config --enable TUN && \
+    scripts/config --enable USB_RTL8152 && \
     cp .config .config.orig && \
     cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
     make -j$(nproc) bzImage && \
-- 
git-series 0.9.1

