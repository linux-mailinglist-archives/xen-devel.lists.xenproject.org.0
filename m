Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87059783B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 22:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389167.626000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOPwa-0002SA-Ma; Wed, 17 Aug 2022 20:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389167.626000; Wed, 17 Aug 2022 20:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOPwa-0002Pb-Iw; Wed, 17 Aug 2022 20:47:16 +0000
Received: by outflank-mailman (input) for mailman id 389167;
 Wed, 17 Aug 2022 20:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xirH=YV=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oOPwY-0002PV-GC
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 20:47:14 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3cb4bfc-1e6d-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 22:47:12 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D120F3200917;
 Wed, 17 Aug 2022 16:47:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Aug 2022 16:47:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 16:47:07 -0400 (EDT)
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
X-Inumbo-ID: c3cb4bfc-1e6d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1660769228; x=1660855628; bh=KXh6Uvdv34/5rKAq05jgR4FCnFu5OmRatzX
	LBAK3Ru0=; b=p/1r35v6se8midISMDdDinUYFwespi/R9S2Knf7ggcJq2eL+gKK
	E/ax54ByQEPuNuy3aQaI+rd5sOsdx21UbpIBjsZB316cCDvzmdwxYTCkfBGcAw3q
	Bl9hN6Zw9O/UAo5a3o4RhB8YxmzLJTqW2hfyels9Mx+09bQkI2NBsvkAeepU4Lst
	rzbn8ecuzwAB4r8zp86ok0DlBhTQ4TgkH6PfYs31CzcifQ5Nn3EK1lcsTs+GGf1K
	vpIhCWeRKH41pVdfvlDuBdEAqOPE8x7Zp7jUQFDKtZQip8ZY21Ee414X9xLsZfNp
	czHPhKtcbhMbddoDvikhtIFAk4CoOa7iT9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660769228; x=1660855628; bh=KXh6Uvdv34/5r
	KAq05jgR4FCnFu5OmRatzXLBAK3Ru0=; b=vGht7qssTR+7JsyUaJaWV7e5gjn9Y
	8WXMuG1/IP6osY1HnYwkie7pG9zuXElvLUTrBH+u2Sv5CJ1Mt22gfVvDtrv/roTs
	7CxgR2VOr8hpJDaWzuzC7c/nFhUlflCAOULHYjYOPSMvhOzdgeL2hybAqpA7BPjh
	DRnIFkhxGnBXrSV4mxKVNOckOjnpVDYQ3xLUKkYrzNLeMDBznm+ejwSWTamx2/OI
	3kYgnEnjGxUfhnN7wXGXXdf8i+B7kzFkuM5wB0WlOi7ouiP/jianElyY9sHRXJqg
	ZU7JfErCdKv0rKuMw0Fj+vVFC5iRTac2pcLBEGPN69+nQifglvVSWTC+w==
X-ME-Sender: <xms:zFP9YrKnsI1qId2dl1kEjcCJo4DSIOPYY7djYz_TLufYxk-PhXON1A>
    <xme:zFP9YvJu70YqSRRKTu_gnFpc2wagDXblrvIIaOTZ9tW1Fc-ddR7Nu-JZewhNNDamn
    RyIogULpnA1ON4>
X-ME-Received: <xmr:zFP9YjsBGGw77XofcrTV-UCoFTXhS-eFA89AMA3Pm0pNuPt7l679Kw3syr2TngkxvD4TtxnLbIaD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfet
    geehheegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:zFP9Ykb0migte5WOEYGViSpsp5UJALXmo3bK_qG_QZ1Nq5XJ6OuRuw>
    <xmx:zFP9YiaqPKLIPQQH1L4z59rdo327iwZiD-XnlZKCgpc7nK-3_ZTB5A>
    <xmx:zFP9YoAyoeSFWciwgyw678PzYNTGxShburjqUhP-k0ObLlRDKhGC9A>
    <xmx:zFP9YhmWyIW2CiIuhdHsUUmA8yVOOx05-_HIKYjs9oL3gkBReiaMQg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Use direct I/O for loop devices
Date: Wed, 17 Aug 2022 16:46:34 -0400
Message-Id: <20220817204634.1886-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a huge performance improvement for two reasons:

1. It uses the filesystem’s asynchronous I/O support, rather than using
   synchronous I/O.
2. It bypasses the page cache, removing a redundant layer of caching and
   associated overhead.
---
 tools/hotplug/Linux/block | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/block b/tools/hotplug/Linux/block
index 2691b56951c9b82094471a141b9e0bed04abb929..75785f3a5422c4a5f962a4cd4f6acae5080d036d 100644
--- a/tools/hotplug/Linux/block
+++ b/tools/hotplug/Linux/block
@@ -330,7 +330,7 @@ mount it read-write in a guest domain."
         else
           roflag=''
         fi
-        do_or_die losetup $roflag "$loopdev" "$file"
+        do_or_die losetup --direct-io=on $roflag "$loopdev" "$file"
         xenstore_write "$XENBUS_PATH/node" "$loopdev"
         write_dev "$loopdev"
         release_lock "block"
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

