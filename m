Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK+LGk9XzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD57372B3C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269364.1558467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPg-00023d-SK; Tue, 31 Mar 2026 23:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269364.1558467; Tue, 31 Mar 2026 23:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPg-00020v-NM; Tue, 31 Mar 2026 23:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1269364;
 Tue, 31 Mar 2026 23:22:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPf-0001iC-3h
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPe-002Gy3-Gf
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5720-bab6-0a2a0a5309dd-0a2a4503c6ca-14
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:22 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc572d-1947-0a2a45030019-67a8ac9592a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:22 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 4C1D0EC00F3;
 Tue, 31 Mar 2026 19:22:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 19:22:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:20 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999341; x=1775085741; bh=p7rWrahvk6
	JZ/tY0ShzzDvBBI7TO4pkrt9njRVboptQ=; b=VorOkEC4IanmZGgmFI/1AFMiTD
	ayKDMGhQbUcO6526SewO7x2JtuYw4IzRj3ybI/G3e0qxF2JzJrIOaeE83r3LDc1S
	RKBYTsMk4jrxxCX4mGjsF4NycDQ7LUgr+nMJk6qXG470pgF5PSPqGc0Kzo++NTph
	WYPv2+Z2oZOsnrdZszY6nv3gygOilI7bp3t9VXLPG0pWYPt0Zc6CNqaijNY+D2tg
	FhrpJiLLlt1lkgL0iWVcl81Pi0Z7sXCGcczRmPHApKBm/sM9kMgMx3/8q7vfKwxJ
	RGDXTP9Fhu+U1VlUGWjt7REKiuJuQ/NDAHHxa+J0YNqjupeO6LIvzXcFKYGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999341; x=
	1775085741; bh=p7rWrahvk6JZ/tY0ShzzDvBBI7TO4pkrt9njRVboptQ=; b=s
	viz7HgxIQ6l9BUAYuEdT32CvUVDNj/9P8HNScTATOHqGgpNhI8jNcJbNAmiMq7r6
	/sd+L3fdkfZleMDMRn8pxMkPNcIkfLfaRrP3KOidQ/0zBgW7GcRGzwVetFhuYLes
	bqYdAn5il/PZXJ7ekYabe4DSsvbTUxV4WZL/8WWun9xWxLngKX3XTqN9/Oe36bxn
	6uHJyorRu3JOmMgJ0Gtw/d4Tv89EzaZBSKVzvasg20L+tywoS16A+mr8yw0+rP0b
	dhNeUsQNuN0qtCgUd0O2j7575cY2JL9b2VuXLgH6yPF2Xs+mfBGdH9O2SQtJuLP4
	Zs0fXoll7UWtzv5JVOscw==
X-ME-Sender: <xms:LVfMacUknPhx8khBvS9Fp5jkZJTq3VgbP0WhA-a4orea66Y2CEtJPQ>
    <xme:LVfMaXeMTfqskD836TkpdSb3O02QZUHXyQg2MYvo4STEGAnwT6Q5Kv7uB4dN8PBNt
    9LI8Za1ZUzBxvSaKhcP5o0cZJtToHoXYxQm9GtsGCMzSKL5vEA>
X-ME-Received: <xmr:LVfMaYtL_pHwXq1EZedCk8zpEYy5wBeAf8LwfwwRou3WkITYpeFm-GD5xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:LVfMaW826lRuH2S5ywAeYQrxewyPhnCAgLHBHRDd-Nda_1wVWQ5nCg>
    <xmx:LVfMaT2kCjrxula4Yws11j09N_CnwVfftKmr6KH0wiFyls3Mh9APDA>
    <xmx:LVfMabAVT5jXA2dejw_HJZdZNLkcuW31OeJmUgjmowDAJCb7j9a6Lg>
    <xmx:LVfMafejodtxPrwtmgTGzftF91WPL76mdXxjHya1NIIXJYAC2rCHXA>
    <xmx:LVfMaUT9nM-iyi0KQkW8b0xDjNi5ourZoUmM_ReRlzQsa4GEBgxwT1lx>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 08/13] Save Linux config to artifacts too
Date: Wed,  1 Apr 2026 01:21:58 +0200
Message-ID: <8a07a44041c152c46ee1d957b4f20027bbc5fa1f.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774999342-4A05C72C-90C85676/0/0
X-purgate-type: clean
X-purgate-size: 552
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
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 0FD57372B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 scripts/build-linux.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 882bac2189a6..967c63c5effb 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -53,6 +53,8 @@ esac
 
 make olddefconfig
 
+cp .config "${COPYDIR}/linux.config"
+
 case $UNAME in
     x86_64)
         make -j$(nproc) bzImage
-- 
git-series 0.9.1

