Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FB6ED66B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525619.816921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fa-0005CB-PF; Mon, 24 Apr 2023 20:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525619.816921; Mon, 24 Apr 2023 20:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3Fa-00058i-Ll; Mon, 24 Apr 2023 20:57:30 +0000
Received: by outflank-mailman (input) for mailman id 525619;
 Mon, 24 Apr 2023 20:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3FZ-0004NP-EH
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:29 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e741b8c-e2e2-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:57:27 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F00563200957;
 Mon, 24 Apr 2023 16:57:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 16:57:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:24 -0400 (EDT)
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
X-Inumbo-ID: 9e741b8c-e2e2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682369845; x=1682456245; bh=WH
	t+xbfkCam7fQl05pWoTXNVf+J69fv1QL2w/kPcch0=; b=CJnDcwxcB5NhxjwL7n
	7nvz8NLMXsb5jIZlVwYbX6QvTMFgcUEd6VwQ8KHmdVwztRNsgf4AwV8KKTsw4jMw
	dBlBidSiZeKxE3oRLLblhrhqUS6PgDwadMgvEgw4VBgl+oN8Slf1We/VI1/+LZDp
	EwbJXGYwiOL+JDOL5r+DkxUPnx+Qm7plC+EUNOqhVxMvrJGUPK9q8T1i3abhbwOs
	UawuEqLtberLhSXsshLiuaapP+mgXw6auKQ6ng3X0Zp0FPhpsvaabws0oPVd1ekU
	X0RwvOJoB5dxC/7PrZup9iLQB1nXUrPdEuIdA8J4RJSEKbOf5/3hGG/ALq2lFZnO
	yspA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369845; x=1682456245; bh=WHt+xbfkCam7fQl05pWoTXNVf+J69fv1QL2
	w/kPcch0=; b=HSLT1uWZlSWfCnXI7RpFRbi85eJNnVVDyRLTxBBlKUntVOl2Wsd
	nvKTyHM2xzvGKAuDqUj2yU13fHm3O+Yf7DhKl6adexGeuoRSdTip/LoW48R5MVQa
	s7R+NIcOf3bsjMALvQqey/HWMrJh4xTv9C4682YQZ4pBiGzkidJHIP5KeKLX9WAk
	kJVdz4q9mOzhWmPRu3jjvU5EtksB/MDBJFc/9Vos4g6/JxaLp0M29cVESrDG23UT
	3+1Mk7/bNLL7NRoXTnIJghf4xeDht6a/wyCZKPL6IzckRqjC1oUKaIvHHDVufnYq
	WaLJ83AovfC3u3j8UFxGhMapOIGFnYKxY9Q==
X-ME-Sender: <xms:Ne1GZCIL9S3-htgPJtCT7EFoc6g7mobjttGmQd7FpiYW-dg2WiwOsQ>
    <xme:Ne1GZKJlpMCxNFNn6xkEtxI_H5d2P0Rl2OkOePQtzvFe67B1TzFhKSyurBOZaU9Qu
    Df23coG9pnriA>
X-ME-Received: <xmr:Ne1GZCsqB96008humR4GCKEqx2QvqbYnUNK9OPGuytB87FTTFsndEuVD-8JqwrEDJ2GmmfBwDTc_cfkWOa7EaiO4hyKRGmte5TD5hfq_hVZAIb3uluJS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Ne1GZHYCd2cy5_LsvaBZdaURaIBqnOqZaAk4nuAYVElWWeTv39-29g>
    <xmx:Ne1GZJbU7c7ySAznl0xBybgXtNnXC0rvjQ6xKj6-axnV1SMqh3O7Sg>
    <xmx:Ne1GZDDkcFdas6jCRnBR6UWi63rWBR429vCuRbrMLgHEg8pczsOwyw>
    <xmx:Ne1GZIymQwGkSdwyF1J0Pn3Lx1eZg1kBRyzKeI_qySplIqVP7f1Zvg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 4/6] automation: wait for the login prompt as test end marker
Date: Mon, 24 Apr 2023 22:56:59 +0200
Message-Id: <8bdae473db12295b536680283820eb18a7dbd911.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The login prompt is printed after all the startup (test) scripts, wait
for that instead of "passed" marker. And only then check if test passed.
Before this patch there was a race: "passed" marker could be already
printed, but the final check would fail because login prompt wasn't
there yet.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 916dbaae59c3..c0bc71764f73 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -159,7 +159,7 @@ if [ -n "$wait_and_wakeup" ]; then
     ssh $CONTROLLER wake
 fi
 
-until grep "$passed" smoke.serial || [ $timeout -le 0 ]; do
+until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
     sleep 1;
     : $((--timeout))
 done
-- 
git-series 0.9.1

