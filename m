Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA0CAD9C0
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180880.1503984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdGw-0004qu-4X; Mon, 08 Dec 2025 15:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180880.1503984; Mon, 08 Dec 2025 15:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdGw-0004of-1s; Mon, 08 Dec 2025 15:35:34 +0000
Received: by outflank-mailman (input) for mailman id 1180880;
 Mon, 08 Dec 2025 15:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGNe=6O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vSdGu-0004oZ-P2
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:35:32 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a31ad9-d44b-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 16:35:30 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id E6A7BEC059A;
 Mon,  8 Dec 2025 10:35:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 08 Dec 2025 10:35:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 10:35:27 -0500 (EST)
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
X-Inumbo-ID: 86a31ad9-d44b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1765208128; x=1765294528; bh=0HG/zquzlucXaxIuwMGaUa1JkVM3dE4t
	+EHv5mS50Tc=; b=rFQoPIm4PnULH6BFT4aUGqUslVTASK9BdoLmYpdTAe1DSLuw
	j5RKfoDW2ELnePmmiLrDtcHJ7+R6Z+fQwT+OTDt8ywgcWWAozUKb3FBx9rG1089p
	BEWIBZ/RIl3xOs9+lxsPbTE4xC9O//hJu40VaXbCbj80Z0z92FMbwcWmm41uvY6w
	yfQgx4nc9OwbgjGNPekILoVvJYwDYVgLOpPzHl0Y35lBd/pKwlcbW7sqN3N72Cs9
	yaw/3m7chTDvOW1vv7Q9sUZ5uX7anQvjfxxbjGKFbjRWndyZk62I6fix98NWLB2R
	+IDnk4sbVz9+R06KUH3Aukk0Ynhp7J7bknnwOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765208128; x=1765294528; bh=0HG/zquzlucXaxIuwMGaUa1JkVM3
	dE4t+EHv5mS50Tc=; b=iaVjUauCSU+pQQebWxypWbiVyzb2v3LIwMyLtZefAOfP
	WnppC2Oc81b13QhUjAWaTy1tKG7OqyQSy2/xpqtH47HCyUKtxqWNj6ha++8lzLqI
	3AkKHNHNhYiG5tdlilo6dryGIjtlmLWkjHeuYwpykt90Y0kaaxsdo+END2RAH4X/
	bZTV9qZ3C5QAu4nPvHtsw/O6vXRePjRRlXs7Ml0uXY2dS3DyNlCipfrtzLsockPe
	S6wvWNjriZnuO6UBFJSNAdQNcJXUdlKOm2NWTniO/Gca5+5m2+6Uzgbbx3WwO8Q5
	W862jLkONM6VGUeblDvWsdJAN777S3+LCaui3WNoOg==
X-ME-Sender: <xms:QPA2adbfajNtn3dOzbwahcdkPVUJjG6usU_LEuXfJIb-dgJNWYJv1g>
    <xme:QPA2abZSEjqNePsFxouB-5cfgn6yoZA4tRYErE08Hs2qvgiUMSpU79HzBjdBoDg5E
    PX-nMxgCL6pKNxqgcICzw0e9wxvjbkQZ4lt3Ng5UX7caXkm>
X-ME-Received: <xmr:QPA2aU_JzrEWe4T7kn5H17hekBZ8KhbTK4nm5MMgRCRBwxpHYnkrvJFudq3kjcHEcg2ItLhIPs1upo8MNov2ccmVCw912ZnKXd3k4WaodgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleet
    leelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhgu
    ohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:QPA2aai-3G3IbWHfiFiqxBkYRAn1F6L9o27jgKcDDnn0b-7OBjxI5A>
    <xmx:QPA2aUdTaTqxin3viYOAKAytNpwsdJZwdV4g4Jv19JSOqMRsWsbEsQ>
    <xmx:QPA2aRqNtCV7vM4lOm2K6iRgjfj0RqVVo_rTh-go61eDV34nE6US3Q>
    <xmx:QPA2aZCDiGxspAQxhVa59xwvfqqw2JPelYZiYcpluU1nn5KADCwb5g>
    <xmx:QPA2aR4SAxbUoRbh5dx0UMm7UCm_NYpfnq2EmeUCuseswI3k7kbIWSOW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: switch KBL console into polling mode
Date: Mon,  8 Dec 2025 16:35:13 +0100
Message-ID: <20251208153519.1198226-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In an attempt to debug/workaround occasional console freeze, switch it
to polling mode. If that helps, it will narrow down the search.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9eb102a885e5..31616c5710a0 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -187,7 +187,7 @@
   variables:
     PCIDEV: "00:1f.6"
     PCIDEV_INTR: "MSI"
-    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,0"
     SUT_ADDR: test-3.testnet
   tags:
     - qubes-hw3
-- 
2.51.0


