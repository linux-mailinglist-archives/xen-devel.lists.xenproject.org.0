Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67196ED667
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525622.816951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Ff-00065X-Sh; Mon, 24 Apr 2023 20:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525622.816951; Mon, 24 Apr 2023 20:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Ff-00061N-Nd; Mon, 24 Apr 2023 20:57:35 +0000
Received: by outflank-mailman (input) for mailman id 525622;
 Mon, 24 Apr 2023 20:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3Fd-0004NP-SM
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:33 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a11e4afc-e2e2-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:57:32 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8512C32005C1;
 Mon, 24 Apr 2023 16:57:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 16:57:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:29 -0400 (EDT)
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
X-Inumbo-ID: a11e4afc-e2e2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369850; x=1682456250; bh=Mh
	8lt/tCiYSiI3kokJmf/Tdax7W7ULmBBzi/97xm0PQ=; b=kibAK+HhiMe0bA5wtL
	cjabupcuAX+uSIBEy1Y2WjGncqXr4glo8dT9TttYbAsof8IhNXfYQ0M/KBffjO27
	PtUfqWT6fG1yr7ds0dgF60kKPEi6qhn/N+V+uyy7hfAU7C7DO6imWQkYoASs+OfA
	S4PEpxQFvg08jVfdXgi+4Vqp8M1Pde87p4W/fel62js0WxRZxA/kjFIm8LfKTUyK
	IJdc2yWDQAgnRaSbiMyvhcYnRM/nhGH7z9xJQ2B9RNkO9dR5T0fcPMrxIwWbvSkR
	TYlce2bbTTT8ua3LGafvY8evRGC75mtdNyAPz3PYksXNJsFkex8uqA/4Zf81IlF6
	cXYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369850; x=1682456250; bh=Mh8lt/tCiYSiI3kokJmf/Tdax7W7ULmBBzi
	/97xm0PQ=; b=a4xjzEMJISkljx+e5gK4l8f7h/n6YYwxwEmTvGVIJ/4fWeJYw6+
	fAcvvmuWw6cq6HFpXKRNKef+RE4x2VF5Z/Uq+WFWyL+svTLU+Tg2jVmMeDRqtwXb
	/b8sbYtAB9ABMqS53IFr3gUUXFv7G0ZMR4LLKyufAtbhD1AAYlGWLKGyYgVoGNE+
	e5ySp0y2VkpaLRmu8F8dMxsU59zxxJDV7Ocbo0IyB7Htp7teopWi/NwbV4WDbnRS
	RBYad6GTHGj0PxzPxIlsqnkLTq/gx1L4+TwPNBxcx5Ou7nF+eshmVoCtbXq1bbgW
	8cS2h61HRLZRsaBaDKbtaipWx+qctPjVaDQ==
X-ME-Sender: <xms:Ou1GZN8UwlzA0PXK6UtDE99RyvbHGDmMGVmeqt-L4pe2iVvjpyxwRQ>
    <xme:Ou1GZBtZ7cTCssGHoZqvzWbUlNdCjJyM_cqBCN0nkRdDv9TdD4d9BjEEiA60654eJ
    Zzv-5jvZWb6Kw>
X-ME-Received: <xmr:Ou1GZLCKYZ11fXyAO0HwSPrXHGB7okpBq5HsmQBSLhwmHut7KafwOCxeP4-LHcCmcXvCMseO5GRyCgGASeMnb9GZdEg0VwHMGPWhPT-vQsSJXpxELctk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Ou1GZBeZRWTMPIZowTnyoLFVfYlVEP15U8zwBrFt4lo8gZt67zeGfw>
    <xmx:Ou1GZCOdpIhaJ6uiahl53D56VpSgS534XmHAlrfn5O_ILpYF93Jqqg>
    <xmx:Ou1GZDn2bspwGK8oXmBuJVrTKmRLbhSwl76hEKqGqPfVnuiCtY1tsw>
    <xmx:Ou1GZE0QuKsg6UzAxtQy398HUljR93UjyOT5PjRtrBnyLaFzBbKoDg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 6/6] automation: include tail of serial log in the gitlab outout
Date: Mon, 24 Apr 2023 22:57:01 +0200
Message-Id: <a3d33c869b7fcf4f72047daa4dcbcf4ff97143c3.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it a bit easier to see what has failed.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 6442f7dda515..9b89d90f653c 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -228,5 +228,6 @@ fi
 
 sleep 1
 
+tail -n 100 smoke.serial
 (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
 exit 0
-- 
git-series 0.9.1

