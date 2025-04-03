Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B526A7A19B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936488.1337796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPX-0007c8-I8; Thu, 03 Apr 2025 11:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936488.1337796; Thu, 03 Apr 2025 11:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPX-0007YL-A1; Thu, 03 Apr 2025 11:07:03 +0000
Received: by outflank-mailman (input) for mailman id 936488;
 Thu, 03 Apr 2025 11:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPV-0005Cd-At
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:07:01 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37a004d-107b-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:07:00 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 58C6C1380212;
 Thu,  3 Apr 2025 07:06:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 03 Apr 2025 07:06:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:58 -0400 (EDT)
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
X-Inumbo-ID: c37a004d-107b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743678419; x=1743764819; bh=eDRMDWc9wx
	viWDrrMjlcr8Np1k6ZW48yzc8tizk3d4M=; b=mFEpgL+4tkxMM84m3+oT/cfigH
	58bAiU08K/GDUK+UoQiOLVWC29+ZiSxAysQDFPESM1w4EdGmwxVfKOVtyxEyRs5D
	3lQ+T26/tWmnPbi8CwSWNP5k8AsvgzGh75P+mIqCNu0WMYESXBYlT1IqUnP9QYd8
	4SlUYc+yub+k7KOUq4B0UvJ6c9+m4K8HLgvxi9cOp6/kNm8q2DKJyNwXRZLaWc/y
	jhYIfntgI2DZsMEj+AKY6tlaPjfrz7Ghd/p2zLUTsygCVZRLL5x7KXLc6AFBOMEJ
	A4M0vY9DRoLuC1uY+9HwMQ0iZp82gLwf6noLw7G2/MzgH9fylKtRszN+JKbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743678419; x=
	1743764819; bh=eDRMDWc9wxviWDrrMjlcr8Np1k6ZW48yzc8tizk3d4M=; b=J
	R5sXnLOPhL30a4k2cqBl5CY6nCFJNATgwIMU0kq63W0pjv66sG0FxkyC5ZoUD2UV
	yYzT6qG1O9TF6mDcgyXDCORVB226CQGCVejfq7xvijyESriJGVaRi8Zm9Ke8vhuT
	BJxpJ8Y+PlGwNHokp6XY5Cmou6+fkShxO/gszJigce4aIh7Mpze1I0KljZsbZ2HZ
	p7OM/xuheGLNsAZTB528YDNwzJLv6nMSsi14Z/gEW8wzxTMt/efTF3YvCIvZfjlK
	sVuSZP2qeCp8o3OoqLeGLbnZ47zCJ74c30LVkwBDnICLAOXlgYEDqf2m0f0qHvJf
	uuD53twkM0zgyVl5qnRjA==
X-ME-Sender: <xms:02vuZ0sIMaM7XK7xVP-XLB7YUDO3fSYprN2waFXo19ywH_orRBrt3w>
    <xme:02vuZxcGboC6dhpxLOUI_gNfW1czqR6ZY_8kRGaU-2OslWwDDxqIxhGMyDPPCE9NX
    bxfh1t_eudowQ>
X-ME-Received: <xmr:02vuZ_yZ5Q5GlfOXwva6ziUBMOBAD2ydILFt8FFoFl5gnGL0MM13LCbv2OeUmCmL5wva-PaxCaY5E7bT69yO61hoRS4y2O_nvetS5EeR7gTpH4aElrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeffiedtgeevffetledvgefhhfevgffhfeekleehueejjeegvd
    dvgfffjeeutddvleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhef
    segtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrugho
    vgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:02vuZ3NkTmGFy3nvOhOIbdq9os49l3kXYVrWvXlC9Jb-_gQV9NDGdg>
    <xmx:02vuZ0_b52znNBfQl96T8QJvta0wSDmKqoBg7VkfE1qLxjxpC1FfxA>
    <xmx:02vuZ_X2e91qxfIi-Kdw43atS1g0J1dPbdp_3j81ScFWDDH7ZAscfA>
    <xmx:02vuZ9fVIUDYobDiYml1P2XWtVUlvllqxxWA3MXHCHXyQO-3cpnlQA>
    <xmx:02vuZ1Gu7INgb68rd0aAKya_TnyOrizUA1CbkwSHI1-fsHbjUwpK1eii>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 10/11] ci: add AMD Zen 4 HW runner
Date: Thu,  3 Apr 2025 13:04:45 +0200
Message-ID: <5d80b0abf5979f5238781099a22a418b744e3315.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
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

