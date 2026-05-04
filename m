Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM5VOguV+GnnwgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5254BD251
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299773.1574361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgL-0002m5-WB; Mon, 04 May 2026 12:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299773.1574361; Mon, 04 May 2026 12:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgL-0002jN-SW; Mon, 04 May 2026 12:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1299773;
 Mon, 04 May 2026 12:45:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgK-0002a2-4S
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgJ-002Q9j-GW
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894eb-2eae-0a2a0a5409dd-0a2a450c8f4e-46
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:51 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894fe-62f1-0a2a450c0019-ca0c7c928a8f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:51 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 08D161D000DB;
 Mon,  4 May 2026 08:45:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 04 May 2026 08:45:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:48 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898749; x=1777985149; bh=aH/QFTCDK+
	4uref1LKMXrUhKJWfLK5QJxoF2YksRrqE=; b=CiMazIxvPelcygMfosrox7rgIq
	DcAYVDjavFKbHOxToo5XMNf3dBBx8J95HdnmwQWuDUsrz2QMf4Q4+PnPr75rpB38
	a6JsRsueuN+Ta5am4q4C+6zFGJWCOsh/1eeeP6RubesR9AaxJ91XHS8ho2ZxCljO
	yn2CrOr0YaWyc5yRmZ3zJecnFT7vNNkYo3/cEDM2qG2VyLhFkn7VQ6NiQQ5h755o
	XnYFAVYDDCG5KKlv3SXug+BC12rPyo15w1ys4/9nqeUqGs3OEXYPQZoCjr17v/mi
	w0GkRRNmG5Pk23LNvUcBTZ2Thsq/k0vqKcWObCHIE2Buy26zADHl1sCOPMbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898749; x=
	1777985149; bh=aH/QFTCDK+4uref1LKMXrUhKJWfLK5QJxoF2YksRrqE=; b=F
	K23RcqzWHjTbdfVzKZAkcqOn0xG0LO9vFYJEY2boGPlSWF5I4wfsLjHyCk0arbrH
	sgG0pDUagp4e65krWwMZ3c/eS79RIlDGXPIGBH7j2JnD/E/xYNp6aHDNYwhAqoDN
	nRkAIgKf5bZPEGXd1nfkS6nHY1sInCsiU7ZgtLP6NPM+dyOAssydntaCEftFPO2z
	uBFRe5619433bGnyhNkGQpHQvH7NQUbtgc3es7Bou5tjzHEFi1fiUsubXCW6K32a
	pP6DUKRyOPEba+XBm8CilX4/RDBumzA8Wi1kvGwqapH9i4ByZaO+V5+dkR2mscxO
	H2X3x9kuIetOqpeua+ASw==
X-ME-Sender: <xms:_ZT4aflTe_qt7ODm9aNOePwUJmcjyn9hHXq8KcnfIuDhQjKNWfXelg>
    <xme:_ZT4aeUJk26AX5DmfbYiIv0WMtKz0J--8G56fWyDa5RXYtq8qOW7eJRrDhCLPHxnW
    tmwTKxIuISSCRcu1PtF0DdBws43Ne9rBK81nh_tSBy4S1uNxA>
X-ME-Received: <xmr:_ZT4acEePGoco8l3yrwGzvG-4wnEHd3abcMsh1LlkY5t_7GyT2nKRNP0yLwAKPcWs0CT2zpoQorUoGcyPQSFaKM4nyhLVnXgBkRGIuol30U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:_ZT4aSc7PCxDFSFEx_zHhpRO0WTpxgwoe3XwSSjJ-R_BJdV3aS3jPw>
    <xmx:_ZT4aVKTulDPz58jyfYZb2Lw-CgSNVSs0Qrlw7Ta29B2rxccEXKZXQ>
    <xmx:_ZT4afGtnUFKz6MJJqd4WyyVVGiCEjQtbX9FukV3-FpcC-bM-ORXvQ>
    <xmx:_ZT4aQDXBup1kgkmgIsbT_qeCIAmjxJtC01rN51gqeaHL6Hcr86tXg>
    <xmx:_ZT4adi15_KzkTQfFbS4p9je70vxi3s3FZA_-RTeiRcv58G43yCBRqUG>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 05/13] Include git in the ARM64 build container too
Date: Mon,  4 May 2026 14:35:44 +0200
Message-ID: <7ddce46d356128e4aa3b27a8c82da83a6317898b.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777898751-6CF62CF5-4C0A0A05/0/0
X-purgate-type: clean
X-purgate-size: 761
X-Rspamd-Queue-Id: 3F5254BD251
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim,citrix.com:email];
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

It will be used for fetching some Linux versions.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 images/alpine/3.18-arm64-build.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
index 25a8dbd..38464c9 100644
--- a/images/alpine/3.18-arm64-build.dockerfile
+++ b/images/alpine/3.18-arm64-build.dockerfile
@@ -14,6 +14,7 @@ RUN <<EOF
       DEPS=(# Base environment
             build-base
             curl
+            git
 
             # Linux build deps
             bison
-- 
git-series 0.9.1

