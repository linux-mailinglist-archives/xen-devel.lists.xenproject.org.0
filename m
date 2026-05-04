Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCDMORKV+Gn0wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E4BD2AE
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299780.1574404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgU-00048Y-BI; Mon, 04 May 2026 12:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299780.1574404; Mon, 04 May 2026 12:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgU-0003zB-1p; Mon, 04 May 2026 12:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1299780;
 Mon, 04 May 2026 12:45:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgR-0003qf-Pr
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgR-00AFBL-5K
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f6-2eae-0a2a0a5409dd-0a2a45069204-44
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:59 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89506-7371-0a2a45060019-ca0c7c92de8f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:59 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id AB64E1D000DB;
 Mon,  4 May 2026 08:45:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 08:45:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:56 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898757; x=1777985157; bh=JzEDyjPRPU
	xC57KHDouSD/8yuPWNMyeGIMSfhE5EUM4=; b=s7vTZMUnNGrTKYlT8ZY+vksdNv
	t8rwet8wZu7tD2RKHT8GH8uWpT7JzgRz4TWprXJAOxTf2yO6w9oUoukH6H3Ez1r9
	/VWtpl+DFLpMdJs5ew8SBZepvDWgMkhmkpWdnUD66IRwCeSOzqcVUJ0W5gNXI0d7
	FivB+VNscRrGEc3+37OXdN9WHgQZ01AertXVkXuQ+YX4ivjzI+yBf8cozvohbBpy
	MVTEc+wMLUgw/sunMr4wFxFR3+j7iCWEbzD60vjAl/CjvTtwaBDBCUjcbm47Xwaq
	1/Lqu2l5F/icNFp7FvpgrcuCWIY/Kr6sPHTuFRFDhPYs4HXuoEJ9C1UBAStg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898757; x=
	1777985157; bh=JzEDyjPRPUxC57KHDouSD/8yuPWNMyeGIMSfhE5EUM4=; b=Y
	7lHbZzEAa+PRli0pRZjEUzBfX/kHiRco4mdPxbcgquonhbdeIgZG7Pts5WjJiIZ6
	mMIcjSgIWhLcNDdg1oW8n7PSjsyKItraVqOTaULY9pDn43l6awfx9zpDe1Qt66KW
	s1Iveq3/PQ+yawpETHoYK/pT4WiQhTLM9aNvGxfecVMy5HUuDDoKG52uLiXF2pKl
	FbnMdlhFCFjQHcGICftLEp3en+gzN5XFdUnOaPjTBywYYk5X9f34GeVsRfo4gA1g
	fhstOryRVuHGFQ/2FNwlOdzA4xpl8ClL3eO0+4BlHxkuk4PdfDuWsZkTG6c1r/3I
	As79O5CTJPEZM84JwD9PA==
X-ME-Sender: <xms:BZX4aUjsPbU_q9vTKcVauh9eRCn9gB3sKjSlA9wLuEnCO4HVM5KG2w>
    <xme:BZX4aT4xMyuNtv85ReF9jd7xwWm0RWZlDjp3ev67bvZsSGfLPzyKSDU3iScGNLm5h
    qJmcXmERKdVzRk2lxHBDLRHjK8Hxh982a9PY6PRAL8Q95w8o9Y>
X-ME-Received: <xmr:BZX4aUY-RC8LNqzJ_J8MEowD824orVbcS6T3kocH1IOzIvZnHulGpclLbmf8X3mjBGxyyL8vtpSHCsreWU_qBtaTZcHezjPdrb4RCKg-nrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:BZX4aQ6SKhKux9w0EsfM7qXZy1-QT4BKLwiAVckNGIs1r22pb3T-zw>
    <xmx:BZX4afCAVvnaKDWxBc2B6PAWsjeud5aohZQJ_w82XtX-F82-mhPPLw>
    <xmx:BZX4aeff6OK8kkuMGXxdaRP072BEMu2zdBtlgvcSkHoAeya5ma1UdQ>
    <xmx:BZX4aWInfueGM6ST8fUBKOJbPRy2fxt6SUnZCBh-TCxX5BpA_Zt5qA>
    <xmx:BZX4aZuigBqg0CdAWhZ9Fir4LLlNX2OlrXSLSmI56CIqwAvRu5VIgrPA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 10/13] Add linux-stubdom dependencies
Date: Mon,  4 May 2026 14:35:49 +0200
Message-ID: <11ddf37d6acc5ef3274f3d09f7ea2f0b64b62243.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777898759-CF77FD75-6FF29069/0/0
X-purgate-type: clean
X-purgate-size: 623
X-Rspamd-Queue-Id: 9F78E4BD2AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 3cd3ab9..2671ab5 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -39,6 +39,10 @@ case $UNAME in
 
             # QEMU
             libelf
+
+            # Stubdomain
+            grub-bios
+            libseccomp
             )
         # libdw used to be part of libelf in Alpine 3.18, but it's a separate
         # package in 3.22.
-- 
git-series 0.9.1

