Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30324BEE69
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 01:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276457.472651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMIt1-0004DM-O9; Tue, 22 Feb 2022 00:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276457.472651; Tue, 22 Feb 2022 00:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMIt1-0004Ab-KT; Tue, 22 Feb 2022 00:18:35 +0000
Received: by outflank-mailman (input) for mailman id 276457;
 Tue, 22 Feb 2022 00:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nMIsz-0003tm-Vs
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 00:18:34 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f79df940-9374-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 01:18:33 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EC12B32020A4;
 Mon, 21 Feb 2022 19:18:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Feb 2022 19:18:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 19:18:28 -0500 (EST)
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
X-Inumbo-ID: f79df940-9374-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=XmMT3EWtd+ciLfBzi+9TAwPbS18Eh5Hhy+YbNx2fX
	t0=; b=ClWyCP3Q0+m9yPFE7QpnuAWSp8luBTmJ3dLZy+53AyJh/Zew6r3VyamYI
	iIhemKxWThFxC9kjEGU4HTzWxms0kukrEJ21uNabiUgyw1CWTJB8I6V/Yajjg6aG
	gJi1YtMtbrm7sM9Erce+fv++TOxyyHvQDRqtgOQNB2w83NYj3DclV9DMyMOCCNsa
	4yZATPgb5G4jVwJtkfCtvFQN8JEHz6vt+tTs7J7HHu4aWtEHEEHMcn3ZO+9kB5jW
	VrLEjdY0doKSnZi71hE3tknHK7T/mwblYjPTeOwZu4g4jwtWSHWbG6ogEAKC9u+4
	UhNrMNXlgXOqMVRm3xFGpr2MkjzXA==
X-ME-Sender: <xms:1isUYnp-l1g2xVkAWM45cpnGjhFq1lLPA09vmSVMt2qLjxxAx_ooAQ>
    <xme:1isUYhqSkIDI7-B35lBCLYjTC-Cw6TELhPgxRZZL-Pc4HLqKzPRDwSojxmpyhwMVW
    zz5gQTN5jjdhA>
X-ME-Received: <xmr:1isUYkPpKdTxiNAu3PorE0HL9L-j9eE5zP6qjiW4hrnn84tT2QJrJW3wokxTjfxJcXz6ROhhMzcKZq9450PHhG5fGbMIESBVseNv8Z3x4rf6mvaZ-5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffdt
    uefffeduhfelueegvdetheejvdehteelfeetfeekgfekkefggedtgefhieejnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:1isUYq7vEWZ-SE0XIvbz58gerzXTrCf3BlDiqPoxqk8ZPfjUnpgIjA>
    <xmx:1isUYm4lpafkKQCw-Ua0K26waSc4wfUPKHHETM0uuInsy1-cCGoHfg>
    <xmx:1isUYihgQCeVDr3-kAq_Mk3RudqD2Gr_o3pFtlkIFlymhmvjfN4pMQ>
    <xmx:1isUYtbWCqyVYZH2lMGASRpooP3YL8N-JPeOpnkdvnTqBcODn-1uRw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	stable@vger.kernel.org,
	Michael Brown <mcb30@ipxe.org>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN NETWORK BACKEND DRIVER),
	netdev@vger.kernel.org (open list:XEN NETWORK BACKEND DRIVER)
Subject: [PATCH v2 2/2] Revert "xen-netback: Check for hotplug-status existence before watching"
Date: Tue, 22 Feb 2022 01:18:17 +0100
Message-Id: <20220222001817.2264967-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

This reverts commit 2afeec08ab5c86ae21952151f726bfe184f6b23d.

The reasoning in the commit was wrong - the code expected to setup the
watch even if 'hotplug-status' didn't exist. In fact, it relied on the
watch being fired the first time - to check if maybe 'hotplug-status' is
already set to 'connected'. Not registering a watch for non-existing
path (which is the case if hotplug script hasn't been executed yet),
made the backend not waiting for the hotplug script to execute. This in
turns, made the netfront think the interface is fully operational, while
in fact it was not (the vif interface on xen-netback side might not be
configured yet).

This was a workaround for 'hotplug-status' erroneously being removed.
But since that is reverted now, the workaround is not necessary either.

More discussion at
https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org/T/#u

Cc: stable@vger.kernel.org
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I believe this is the same issue as discussed at
https://lore.kernel.org/xen-devel/20220113111946.GA4133739@dingwall.me.uk/
Cc: James Dingwall <james-xen@dingwall.me.uk
Cc: Michael Brown <mcb30@ipxe.org>
---
 drivers/net/xen-netback/xenbus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 3fad58d22155..990360d75cb6 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -824,15 +824,11 @@ static void connect(struct backend_info *be)
 	xenvif_carrier_on(be->vif);
 
 	unregister_hotplug_status_watch(be);
-	if (xenbus_exists(XBT_NIL, dev->nodename, "hotplug-status")) {
-		err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch,
-					   NULL, hotplug_status_changed,
-					   "%s/%s", dev->nodename,
-					   "hotplug-status");
-		if (err)
-			goto err;
+	err = xenbus_watch_pathfmt(dev, &be->hotplug_status_watch, NULL,
+				   hotplug_status_changed,
+				   "%s/%s", dev->nodename, "hotplug-status");
+	if (!err)
 		be->have_hotplug_status_watch = 1;
-	}
 
 	netif_tx_wake_all_queues(be->vif->dev);
 
-- 
2.31.1


