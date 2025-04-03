Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0EA7A1AE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936555.1337807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IT6-0003xO-5A; Thu, 03 Apr 2025 11:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936555.1337807; Thu, 03 Apr 2025 11:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IT6-0003u2-1f; Thu, 03 Apr 2025 11:10:44 +0000
Received: by outflank-mailman (input) for mailman id 936555;
 Thu, 03 Apr 2025 11:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPY-0005Qy-Fw
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:07:04 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4609f32-107b-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:07:01 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id C96F513801AD;
 Thu,  3 Apr 2025 07:07:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 03 Apr 2025 07:07:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:59 -0400 (EDT)
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
X-Inumbo-ID: c4609f32-107b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1743678420; x=1743764820; bh=WvayeI8/G07ya1OZLTzdC
	zIa1mP6LNpSD3wkb/NtbkU=; b=ApojOqlDmd/kN31tyd4yc2IX6Id6P5LpJeHw8
	/jsmyqrBAIf/tfQAhPahSoZjYPSQXEZb9/etX08LehguPm9DfwBLCy0pRCr643+E
	0v3gtL5MFYWYKJivqzV5KXM1rHm/1iuNoSLc8KheUblr/Av8Pz8xbVd/x/bR9gqq
	ikwEU+YIQT6naazTBNpwqSC6brvlzeZsmljKXqDxWOzbuZSGYgC2CG/3UGsIBjgx
	RTorLDIA3Etco/sNs4X+wZnzSVcgYF2430vjWXcUVwk9fI7rKB1Qfn4kvugMzsyq
	y+7/13sj3bIi3M3PuOy7gyNDtphFg+d5vvhmsxd27cPFdD9fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1743678420; x=1743764820; bh=W
	vayeI8/G07ya1OZLTzdCzIa1mP6LNpSD3wkb/NtbkU=; b=glbA+Bmf3Q3G+mDF7
	htwVBLyQZjTux/xq4oZCkxyRF18XtOiC9Q+hWqBlpNf+xbDnngsjOmEXK+FV/A8Z
	39W/STy0ozsn6rocn5ZgCi1lAHZg8v3wKpv3g0ZVdnN2Jmqds3uOS57BHXqb0bDd
	SYZzUUaYMmUzMwjIYjN4n4CEMj0wX/klD2yv/rkCx98U0YdQPSjqkRthgLr6Y2Co
	rkOAjqojPoIN7tAmG8RO/e5vXDqlHDDHC1Fus0/S2cu1XQDZFK/2QOzZGnuTpZDf
	YPfzc8zGdVfa5KivOAdF1mip4fwKPRBllCX+Vtu7IxdCzc6cSDx2FnI3usrVn/tz
	WQAsA==
X-ME-Sender: <xms:1GvuZ4x_lkbIp835M1dNPWMsf0lbFACekkKko3CMp0_SkYF8HpCauw>
    <xme:1GvuZ8QysonmKp6Ci5y677KnLk-dZLlJ_mr4c8fCYqtu-CCDBSBIkkrGA2BcPsuqg
    4MgvHIe22uFMg>
X-ME-Received: <xmr:1GvuZ6UNjHb99B1JZnXr7OvKVFW1ASICbPQsNnHcqTkNr5Flm-oygLLpj6biKHCIwjkcM6SZ4u3o7HUmFb1bHCZWb8QWioMHWN886EH8OmmLPYJirOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepueethefgieehheeftdeuleduhffgieelueejhffggfeiieevte
    fhfeffffeftdehnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgv
    rdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1GvuZ2h54zzysrkk6Yxl4jqStt7L8utZEPNIiU2nxhhw2wI7ncpedQ>
    <xmx:1GvuZ6DlEaQtj3yZanhoFhm7k0rI3S6nNXnzVvd1oT01hAaBX-PxCg>
    <xmx:1GvuZ3IhU-A5tm1tQO0DYTKVnsymt8l3EaEcqj06gQj7W4jLSlYbfA>
    <xmx:1GvuZxA7J1e_R1d47YlZL9CupzN1ryRGQzAldhTZMWpcg30i979-KQ>
    <xmx:1GvuZ7aEiRKwRcgYLMgYZEEJQZbRb6zWMG-Sph-z71Cu-HfQ40npPOls>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 11/11] [DO NOT MERGE] container
Date: Thu,  3 Apr 2025 13:04:46 +0200
Message-ID: <dc5fc82931b918a3d77571f7df538aba9fa17605.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to my container repo for rebuilt kernel
---
 automation/gitlab-ci/build.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d41f27fc94bf..ac7aca141010 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -312,7 +312,7 @@ qemu-system-aarch64-6.0.0-arm32-export:
 
 kernel-6.12.21-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.12.21
+  image: registry.gitlab.com/xen-project/people/marmarek/xen/tests-artifacts/kernel:6.12.21
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
   artifacts:
-- 
git-series 0.9.1

