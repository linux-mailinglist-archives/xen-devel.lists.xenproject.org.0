Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A602A7DDBD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939841.1339864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lgb-0007s3-7q; Mon, 07 Apr 2025 12:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939841.1339864; Mon, 07 Apr 2025 12:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lga-0007lv-Um; Mon, 07 Apr 2025 12:34:44 +0000
Received: by outflank-mailman (input) for mailman id 939841;
 Mon, 07 Apr 2025 12:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uyK1=WZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u1lgZ-0006Bg-6X
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:34:43 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id add3e471-13ac-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 14:34:42 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C72EE11401EF;
 Mon,  7 Apr 2025 08:34:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 07 Apr 2025 08:34:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 08:34:40 -0400 (EDT)
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
X-Inumbo-ID: add3e471-13ac-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744029281; x=1744115681; bh=vn4e4W4xWz
	4ei2euUqprCz3nyrIw2LqvIbqSGRhnE5Y=; b=Ex7vC62DxJw1hPi3VF//AHZnd1
	BF192vzYV0nEz7gXW0kJICSmFbUd51EKsSbaDtJCieuJaVKTDAMbM4Pe/aWrfERi
	w1kjblOE4L1VlvNtnXcBTSB0y7hhObFU/0ISF1iYM1i577Hm7VThzDzOPlGsjRf1
	mPhtR2v5wB9QAAmJmeyn7D9X2SQgI0YIlyWUPijfN4WW0IoKcVH98/SSZYJoD3sS
	V0K3n1JCleW9ryiWSbmQ2brzsR8I3Kj/BoDtOO3KJuo12rhD2FRkvA5EtJG8QwP1
	qoG16rsmufzlvKP+97FUI+5YIiRnzasbqwaN5Uf/uTNgVkEGH/1296uYS5eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744029281; x=
	1744115681; bh=vn4e4W4xWz4ei2euUqprCz3nyrIw2LqvIbqSGRhnE5Y=; b=k
	zsXtzO+RxOE+mYVPP6fHcYwudfFKIxtEfnLTh0xiSm/Hfv7SdB0mUgjnsrhaq4BI
	fTfz85wuswv1UWZqRrVGs7/8rSDLiHsXOigx9Ace9ktqDcxB1PS/WD1L2YMA9SU2
	A7d4sHEv+Zyr6W/ytgcGlhMAKqbmXNqaXUOzmOOr7tJ4Gvw4zyCPmclLetfm3Pbr
	RFZXs8guGyRo6XXfhNmZ0SsQ9AYG/Fq65DShYWi8NyPCWTe5hL3k3D6YJYMdHIkS
	14gL8FCASmZ8GmhXSCteuGAA9Ooy5jAcxP+2Bh/x8jS1Ix/fK67mz/v3Tj35t1g8
	a+hqc1cmJJugi+4bJH8aA==
X-ME-Sender: <xms:YcbzZ9ic7vkUkicFzuqnpZUaL509gf2SXRshPtPSKzealn9nbAMfLw>
    <xme:YcbzZyD0mPrBYUk14AsNxMYUNyfekAeN3glOs-E-jYaPSLtw5slk7tNFSaw_0JjNF
    2N1iQUglQMVAg>
X-ME-Received: <xmr:YcbzZ9EJVePpTVWzLiP7H2I9Utg_xNdrN6qDgz-hlsRJErVzvSxmvJ2skx8P43dHItT2bsUxd7W-U0hFY8-SSDjGSmHqXYCtV9d0QmRXJPY_tbmo-oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:YcbzZyRglsEmu1vs3FrATEZBwoYNiNURw64kJ6p7qTZY_TViYX3pGA>
    <xmx:YcbzZ6wL25ygjfY8A--ppb-OL8mzCM5YiJEdjPAdRUpQvwqsnl5Zgw>
    <xmx:YcbzZ44cNwH8I5qzgLqtuGK0U5eD0eIyibWT8IvcseKVEI4XGxNC4g>
    <xmx:YcbzZ_xNpPE7aDbI_Hesulcv1v_CDOuTbv0BPkELBNKFRfA_phCt7Q>
    <xmx:YcbzZ66SltPfQKiGm8BByq8LnxhopoKxhndexctEBIGrATYBxu2ENSNZ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 07/12] CI: wait for the network interface in PCI passthrough tests
Date: Mon,  7 Apr 2025 14:31:07 +0200
Message-ID: <e6430d1b11257ee4f3c87c098e98b46ee26489c5.1744028549.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The network driver initializes asynchronously, and it may not be ready
yet by the time the startup script is called. This is especially the
case for USB network adapter (where the PCI device is the USB
controller) in the upcoming runner.

Don't bother about separate timeout - test timeout will cover this part
too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 17fcbd8fa7db..9359e8914fb2 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -104,6 +104,7 @@ on_reboot = "destroy"
         domU_check="
 set -x -e
 interface=eth0
+while ! [ -e \"/sys/class/net/\$interface\" ]; do sleep 1; done
 ip link set \"\$interface\" up
 timeout 30s udhcpc -i \"\$interface\"
 pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
-- 
git-series 0.9.1

