Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A295A7DDBA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939837.1339834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgX-000729-99; Mon, 07 Apr 2025 12:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939837.1339834; Mon, 07 Apr 2025 12:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgX-0006w0-1b; Mon, 07 Apr 2025 12:34:41 +0000
Received: by outflank-mailman (input) for mailman id 939837;
 Mon, 07 Apr 2025 12:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgW-0006u9-03
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:40 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa96952e-13ac-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:34:37 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5F731114016D;
 Mon,  7 Apr 2025 08:34:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 08:34:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:35 -0400 (EDT)
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
X-Inumbo-ID: aa96952e-13ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029276; x=1744115676; bh=oUzAo8IKhM
	cypBS9tzrQd/MdWccuAy4m3Q9jZgmqj4k=; b=Qj5q/13Fgj5Aono7HNX6PRJbEf
	hTweD2CbsxHB5a4t6RVDNrdnsnvL9qYQ0+HRtDBqUBP58tbFtk3k+y3V6La2FJic
	GdGoBsQT6RtRA0ZFt5WVI2xt8edBQHYYUByU+aPo14f8lWFaNg3ZY7RcE3iWFYtn
	U3l3qhLme0cKd5RbepbA0IPKLrX+bGZ8GSR+JPw0jN+w6XnSGGirRG4K5UWNZ7Gh
	cUXG8Rn3F7W8FEFFM0PpXvqaqg+ErDbVich3xWCAtkKQ2s20L4cZztmw9S6FTQ/b
	o3jg6pW8JU69+U6SKl3ewGXQ9LazYG5Q7/WMmxwS0aHI0C/Nb76rPUpVBo0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029276; x=
	1744115676; bh=oUzAo8IKhMcypBS9tzrQd/MdWccuAy4m3Q9jZgmqj4k=; b=W
	dNFDrzT87NMqkaD6glQO9gujVR3+bAwtw9rXLW+MWJ+dwJtKDgjpj2UyYQtoPDLk
	FFGCHHcfX5u69IItIKMdglTIOphgN3L4d0nzTglWbZmXiuIUBb9zDu7r7QbusWl1
	OXhUHD67siwaWl40z02MkkhKAum8qHlRUXzzKwXe74dFnhr+v0mSJgZmaJRPqmKY
	1nTylKhaiUouN/SRlZL5FKRBECvj3UsXc/N+jqh75VZAgToUEOX8+Rdhl5pl+Ggj
	z4XamcNul09mAE0WPhJA66pIxrbHnapPlCcE3wPBkzfxIMCKIPw3z+IGY3f7RiGZ
	aCLulCYPOph4tLCVXfdmQ==
X-ME-Sender: <xms:XMbzZz7xzgwN6Hx1o9AzlphsbeK09guW7UAdH0EuIZ_hLXpucx4TIg>
    <xme:XMbzZ46H-NE4otK9Ug9zsQHhrMPqYy3IphuPlsOobmB-lVjPu1cKr7gAi-McWwRiw
    S4GIuzbEreK5A>
X-ME-Received: <xmr:XMbzZ6ej48LzaiCBSGb31GUyB5JyWcCxfB7Je00Xma1WdGiuOV8-F7QauR6AODCqRo0Lp3MiYp3jYnoip93gxpGSPBfLYlk0lm_Ufnahp6rsxmvq6n8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:XMbzZ0IkzHStgvvqnqHtak-7tKS-B--S1hoxXmM2tAdtPub64vIyFA>
    <xmx:XMbzZ3KAmggM5VSVQr9_ZiN3Cpm9dNstgqFUMGJoRaCAXR5z45uNyQ>
    <xmx:XMbzZ9y4LT-Woh6xnv1JqwHUbSV4rYYtbH9x2OqO_naGb7bMieaW2Q>
    <xmx:XMbzZzLv-p8WAvt63q-d7cqZy2jqkmPvunCO3m6hZevbBFI3IqJIDQ>
    <xmx:XMbzZ9RjoVRvVKmQjgubiGSMRvDiVObKD6YPP4c30-fzwYg7ow2J1O7s>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 03/12] CI: enable XHCI console in Xen debug build on Alpine
Date: Mon,  7 Apr 2025 14:31:03 +0200
Message-ID: <318a25de10a4ec992d5e42b1f920354b720988ba.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This build is used for hardware tests, and some runners use XHCI console

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2513908b059b..169bebe3c775 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -341,6 +341,7 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
+      CONFIG_XHCI=y
 
 debian-12-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
-- 
git-series 0.9.1

