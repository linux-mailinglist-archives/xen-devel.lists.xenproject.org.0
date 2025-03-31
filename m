Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C38A77171
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933217.1335227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlR-0007Q8-5p; Mon, 31 Mar 2025 23:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933217.1335227; Mon, 31 Mar 2025 23:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlR-0007Jw-28; Mon, 31 Mar 2025 23:41:57 +0000
Received: by outflank-mailman (input) for mailman id 933217;
 Mon, 31 Mar 2025 23:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tzOlP-0007E9-Gz
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:41:55 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ba9069-0e89-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:41:54 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 64CE425401C1;
 Mon, 31 Mar 2025 19:41:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 31 Mar 2025 19:41:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 19:41:51 -0400 (EDT)
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
X-Inumbo-ID: b9ba9069-0e89-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743464513; x=1743550913; bh=6taB5AKLCg
	AteYa5L4VQBlP/oIhsp6KAWxosy/Sm+y0=; b=OQHs5WfC243oIFQLh65vLu1NtN
	F+/HUO+p67VZ0+g8v88/XVvqkioO+hhv73yg6rDCQ7OIdujgHILQvo6lU2xDPu3d
	9sM4//ptpVX2bCJC3CLtK6C4Srk9paqmCIMD8M9ztUU9OKLR4BZCAXxP8TXPqcmr
	0u3rlcmM8vgglxmvyIqJdwJB2ZVLhUXMUSoWzIwkhw7CZJ8QD6AiUc1S0Scj/9dh
	P3XI5dt5PxRDJPV7pXDwQivPhO91a0QH9+CR25bHg1JuyaYhFPekxPTEh4D5haA0
	WRgVWp/ZCPuk5zihO+IBjyh8veFgKFxwEMV3wL9vf1W3dVEpOMm1IFTUBYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743464513; x=
	1743550913; bh=6taB5AKLCgAteYa5L4VQBlP/oIhsp6KAWxosy/Sm+y0=; b=p
	XM8ZrDcl3LXlyIUmMWrgUFyPvI5CnEYp3ZmtubhtCSrTnUVztZ8jtkC4yHw3inBw
	ceavDFGfvyg7YVA/5njyjyGcA7DN1VpojtbELloF3YLm973qOiwN0B1zvI/G6pa9
	KG1OmNbN48v/syFf8Tp4nolC2cG4NLa4tCXFEeTZw1ApTyiGzlMvZknIgFHDH99E
	mpaUCq+tEKcljF/7cCsxgY0k7d90WmrV9TPQi+ZwG4kulj1SqysQDolCSOTZdPjd
	vUHZRqtoz/oKhAicsGz23q/VWbH5FiXIsnr4IOxBmjv4wwBoI7BMB4Bv3X7HLdbc
	4hcseVZFdptMHex6XTZ+w==
X-ME-Sender: <xms:QCjrZ72Lkh0ds7V-AVw3h419LF_WM80kQqOaq4huBF-lwHuhrpbQPQ>
    <xme:QCjrZ6FpI0FP3vUxDbEnX-eCQYDCrm0ZXG-r9C5oUpGJJZ06nYUCoa201yx6VZzgN
    4lDeTMltY2fqg>
X-ME-Received: <xmr:QCjrZ773xoIGg-tB-VwvXl4bFh4IPjulsqWE4v-8bk2j5LJRPfBAj9PyR1kTbt0YjOToLsSlEmmS9VVP_Yo9EUKLQd8zTsCOYzf78hb8n_ACShAQqJ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeduvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurh
    gvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheptggrrhguohgv
    segtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:QCjrZw2cV93WmeQzAAK-ah9ptLlfmjpiKsk9diFEAGHS2WXbx7BGLg>
    <xmx:QCjrZ-HjwFI7e8UrRtQg2kpcBHe_qUw3iwFGo4xRdqnA_W8Sq7sj2A>
    <xmx:QCjrZx_JLzsSTNM-MEF50EPIxsfnesVsasdwAe8vMcLMcZgfXRWAgQ>
    <xmx:QCjrZ7kNPN_wgNmjOFSLtfAQr1wphgWds7AIKbY1r7hU57XXVtDrWQ>
    <xmx:QSjrZz5aXoTHndbBmfDKm2SPQT_ZY0aLkYAoTIkfSonrEFzM-SK51SLW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] ci: add Intel KabyLake HW runner
Date: Tue,  1 Apr 2025 01:41:36 +0200
Message-ID: <c92c7baeb09883dbbfc493c0abc1e9576533cffa.1743464494.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com>
References: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is Intel i7-7567U in NUC 7i7BNH. This one is an older one, with no
firmware updates (last update from 2023) and no microcode udpates
either. While this firmware supports UEFI, network boot works only in
legacy mode - thus legacy is used here (via iPXE, instead of grub2.efi).
Testing legacy boot path may be a useful thing on its own.

Add the same set of tests as on ADL runner.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

Not sure if duplicating pvshim test makes sense? Others do look like may
have hardware-sensitive parts.
---
 automation/gitlab-ci/test.yaml | 89 +++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 225eb4399807..d05b9a98afa6 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -155,6 +155,17 @@
   tags:
     - qubes-hw2
 
+.kbl-x86-64:
+  # it's really similar to the ADL one
+  extends: .adl-x86-64
+  variables:
+    PCIDEV: "00:1f.6"
+    PCIDEV_INTR: "MSI"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
+    SUT_ADDR: test-3.testnet
+  tags:
+    - qubes-hw3
+
 .zen2-x86-64:
   # it's really similar to the above
   extends: .adl-x86-64
@@ -312,6 +323,84 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+kbl-smoke-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-smoke-x86-64-dom0pvh-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-suspend-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-pci-pv-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-pci-hvm-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-pvshim-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-tools-tests-pv-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
+kbl-tools-tests-pvh-x86-64-gcc-debug:
+  extends: .kbl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 zen2-smoke-x86-64-gcc-debug:
   extends: .zen2-x86-64
   script:
-- 
git-series 0.9.1

