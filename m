Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDxxElBXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8420372B4B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269361.1558439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPc-0001KI-Tc; Tue, 31 Mar 2026 23:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269361.1558439; Tue, 31 Mar 2026 23:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPc-0001IT-QG; Tue, 31 Mar 2026 23:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1269361;
 Tue, 31 Mar 2026 23:22:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPb-00014k-DA
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPa-00DeiG-Q1
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc570d-5cb7-0a2a0a5109dd-0a2a450ad570-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:18 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5729-1772-0a2a450a0019-67a8ac99bca9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:18 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 81309140008F;
 Tue, 31 Mar 2026 19:22:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 31 Mar 2026 19:22:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:16 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774999337; x=1775085737; bh=GItMxhqnAd
	/SJN1c6tnGv9+Vx9NKPGtRzfXhVmXexUw=; b=OEAsjwmoTOKSUnFzCKqVrWUa5K
	L4paYEttfj1VN/vX16b1LbIGAimJP+Z+hsTDZnioieExEQb/lqaeEH7Areje9DvM
	H3c/dR2CsX4aa6xBZCuJf6Gg2S4SVOJjML2K9PzYYZx6FH1In358mbk5pb00KP8R
	+jDD1YD4Q0wI+DjxYyFNbve6k65mSpsKQYehR3UZSSUs/uIyLpJSCvqIhk/Knfve
	ohrC2JjyvtSHNZXzZ4EVCyNlHRnMhsglYiKI2BF8CfMRPBYcDyE1NQ4RKKADo9Ol
	5fmpS2D5uchELI/GCLptXkZVkHSb6PUcjSz9q10XtOH5YKp4Q3NUOQQa6wmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999337; x=
	1775085737; bh=GItMxhqnAd/SJN1c6tnGv9+Vx9NKPGtRzfXhVmXexUw=; b=Y
	58+/r+ThrbQQdZLT3HYR43BM4RACEkfFktA+EvZVs3JIrUBP6tk+wz4jgdbWAgpA
	ZajeDLsKLfUvfN37qVfZjNc818j04GEYGzrRdwTCdetFtibosAgsC4Jb3C/LMikD
	RsqMj9PYu1GjlANbNBNu+Mo+nyUBrnPws3xDF3Q8N3mxTFv5Tk053I/7vL6+zZ2D
	BNZpvNS5JB3FEZ4fV249rkR1/1GwwTaXe2FLMNDol8EN9zUKRV/KvPWcBFDx1zj0
	6v2mYRIT6l4Y4HnYBKS8fJhKDuucS8uODtF8PS8EAGjMP3DBx3kS2zNKwPhoaT1o
	qMizrZPeFfpfyMy7ufKGw==
X-ME-Sender: <xms:KVfMaevnOZ3P8abrDusjWX5kSA2msII0XTT_-RM0AIT3DPZdAw7GUQ>
    <xme:KVfMaaXH1amPkg6x_mhc1SVldeUvsMdhzYCcBbtIha3OHikuQuxYR8zir_ihM-KKA
    _vi-AHoxs_NtB_GwZ8bXp3pnAWvu13x6kbjKRCwiommuAFq4w>
X-ME-Received: <xmr:KVfMaSHSkiYLe2Fe-CpBirjcTy2Xc734CK-SgPPhqDTEy3mQFVRa9cA9Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffiedtgeev
    ffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehroh
    hgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:KVfMaU1IWi9PExSLXosSA77Uvu7O2jKUEayUX4fW9imyfmS3E1R5yA>
    <xmx:KVfMacOzd-iqHSmCYMQgqNCPCLNcUOqLuOOWP0hlahA_jkKgG8rqmA>
    <xmx:KVfMab4VOVzPui5GYimfrsinKp0GyzhaMDdES-KwKA2TpH5dQu3zHg>
    <xmx:KVfMae09OLPkvXoWz3UyK2AdTj_831GyslDrTSU6F-1z9d5aTY96Uw>
    <xmx:KVfMaZL_2-qQjDcYO88s0QmM93sTKsrU2SGP1y7CnMCUM2HpzUXSogAt>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 05/13] Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
Date: Wed,  1 Apr 2026 01:21:55 +0200
Message-ID: <dbb413df1fabb760de2f67ed9f5c55ab38061cf9.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774999338-53096900-5CD973C8/0/0
X-purgate-type: clean
X-purgate-size: 818
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: E8420372B4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It uses this USB network interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
This was posted before at https://lore.kernel.org/xen-devel/20250411203336.585215-1-marmarek@invisiblethingslab.com/
---
 scripts/build-linux.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 441b8721a490..cf0e744bd232 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -32,6 +32,7 @@ case $UNAME in
             | grep 'XEN' \
             | grep '=m' \
             | sed 's/=m/=y/g' >> .config
+        ./scripts/config --enable USB_RTL8152
         ;;
 
     aarch64)
-- 
git-series 0.9.1

