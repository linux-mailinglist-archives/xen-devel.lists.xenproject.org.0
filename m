Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJV1F2ZXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1569C372B8F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269359.1558421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPZ-0000tl-Da; Tue, 31 Mar 2026 23:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269359.1558421; Tue, 31 Mar 2026 23:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPZ-0000rR-Aw; Tue, 31 Mar 2026 23:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1269359;
 Tue, 31 Mar 2026 23:22:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPX-0000eQ-MB
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPX-004XrY-2d
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56ff-e002-0a2a0a5209dd-0a2a4504bf0e-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:15 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5726-c823-0a2a45040019-67a8ac95dd09-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:14 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id CDC14EC00F3;
 Tue, 31 Mar 2026 19:22:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 19:22:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:12 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999333; x=1775085733; bh=nsv/7E0U9b
	OyDuG5hXwgvJ0RpjOK4cIyUqYK0KrSRi4=; b=r2OMGfGmIS/GLtoMCuaDaOdRyk
	OXMyh+X/suwA2vLTRKiblC+SOIDXfCUCedl2VwoSCOE0QnGqESV6Uzq5xObI3KFf
	gFiG0q99xMJ9zz9IXAfD85XR8/wsAKfKZ4Rr+1zUTDyTcuO3+zIxxLuK1JfZoTlu
	EKxpz7FQmiPJ+TXqgMHZOP6tIbEg/8IEOjuY17GwMAHDEBgCYL4Oq478eClY9P83
	dge8ON9u6jmyRxlVC/DN2pL9DzO8U0ALQOqP9MFsShogylIn9z5ZbRd8sayCZQmE
	D959WJh5gIr/CBInKQn54D3CgZIwUqeQ7JuXFYtaw3UQKhbwcCsOqIJxKaRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999333; x=
	1775085733; bh=nsv/7E0U9bOyDuG5hXwgvJ0RpjOK4cIyUqYK0KrSRi4=; b=j
	FhuUlLa7Kmdm7d6K3q0e1ulVLB1gNyIhUF9xF6HwIK5kpHaS8rwifk/RKmQCgela
	TUTHNSkyj56CeNmHZ5xEGrI3ONFD1WY/uJ4OeB4LyCqX2Fbo1q0FI0vfnqGoIJvq
	ifyq9G0yjoP64kUBHVcMbghS0DLWcR20zkDsF8fkBS6+3E1moHMNlh8pX2wJMk7v
	7VLnmZSLZGATaRJs9IMTK+VAndHPzmLOZIiaskcpP1704+mzrDH3BRm0H/vDs72x
	DhikjgiLaPiyNghmQ/LIVnEMdyfgmU0wPoWnCEyOvJyFNEXpDETe95pf8ePnoC2g
	BCf6qbV3URtzGUzNCjZFQ==
X-ME-Sender: <xms:JVfMaZUsfAM65UcJVkUygwXoYjq8_AzvMqx_3c56PY_9Zxwmaw0Idw>
    <xme:JVfMaQfAdXY5CdShA-ksTMBv14osH-AWQ1gFEVXgEoU85xRiFVE_QEzPQtUJGfcl4
    tEMPttRALhswjhoybj2laHNVzhnEuQM9-k37dXHd2uyPsiDvQ>
X-ME-Received: <xmr:JVfMadufL_bcXh76izfRq8_fgOvLDFFl8FWHs9VCgSJylDNFek0mTUU72A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfe
    estghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:JVfMaX_8ammrFkCxbaApY6RP9Z7jmO-RSSmAGGXXszvrEUzbdm7aVg>
    <xmx:JVfMaQ1ZkR1haxkhTiKPwPhGk3879bnfq0P1m7w4RDf3jRUGzC8sbw>
    <xmx:JVfMaUDy3I58NYIA4uMHIw384u-YKK981-tD0bjkyOxKg6C7DRQ0Qw>
    <xmx:JVfMaUft8X61wN-zgkpAulJPyCXkixVZyyBw-tKLNHBusfl2NRE8dA>
    <xmx:JVfMadQnPT95o1F5p2efDIMY-iAfsqePUhQVy9uFPDrmhG-pX0IByDdE>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 02/13] Switch Linux builds to use Alpine 3.22 container
Date: Wed,  1 Apr 2026 01:21:52 +0200
Message-ID: <652a2f219b370af5364d8ef29264acc33a89f676.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774999335-B249D9D1-65F73456/0/0
X-purgate-type: clean
X-purgate-size: 694
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 1569C372B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Slowly phase out 3.18 one.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 17d25ce0f921..36622c723ce9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,14 +21,14 @@ stages:
   tags:
     - arm64
   variables:
-    CONTAINER: alpine:3.18-arm64-build
+    CONTAINER: alpine:3.22-arm64-build
 
 .x86_64-artifacts:
   extends: .artifacts
   tags:
     - x86_64
   variables:
-    CONTAINER: alpine:3.18-x86_64-build
+    CONTAINER: alpine:3.22-x86_64-build
 
 #
 # ARM64 artifacts
-- 
git-series 0.9.1

