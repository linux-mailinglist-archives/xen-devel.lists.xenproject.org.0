Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJPfG2NXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6C372B88
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269360.1558431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPb-00016i-Lo; Tue, 31 Mar 2026 23:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269360.1558431; Tue, 31 Mar 2026 23:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPb-00014p-IC; Tue, 31 Mar 2026 23:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1269360;
 Tue, 31 Mar 2026 23:22:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPa-00010e-0l
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPZ-00DeiG-DR
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc570d-5cb7-0a2a0a5109dd-0a2a450ad570-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:17 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5728-1772-0a2a450a0019-67a8ac95941d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:17 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 4B347EC01BF;
 Tue, 31 Mar 2026 19:22:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 31 Mar 2026 19:22:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:15 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999336; x=1775085736; bh=mm4xQsaq/Y
	B9yzN/v7EQNg+j0D8ljj8xJdWuu9yUqjw=; b=CGxUKcWWk2ggvKYso6GGA2jZ3r
	teMrQvS3cp2A5W5lkI5DDUBV4Nsm1d7mUkD5k0UQ2/0sNooaYR72/ikJ0OoXvzoB
	DB2SrcU1fF80GUawo6DkBRCz0oubKqBmIOlleRyhK2+8s0PkBXTdg5TAmxOG4G5C
	MXyBR8dPHWfi6ktpd/az5zDJv2stOJqZrAkqXDwXSB4RE/R8TwDlxo2OV3IFbo90
	Fb8mOB46IrBGXUw2ymaR3BL+IXp04nZj0RvgtvD4tTCtAV7+XgLDlKsCZE6tvgZ7
	OLSrR9B9cOFg3SeFgqgDtE5UGwnoBEADPfBvX4+fZLTZH+4uAJ7JEjjBFSmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999336; x=
	1775085736; bh=mm4xQsaq/YB9yzN/v7EQNg+j0D8ljj8xJdWuu9yUqjw=; b=e
	BIHDuyj1Pv6sDieCvVKdejSmKuIfTWjrY06vn246TkfSUUiJcRuXMxyCras338JO
	rmsjsmSlQiWjIsXwvAnkTWrY/bOacEuKPpG9RxRR9YxGVjcXICdXS3PAqrUja5Me
	KM6f68bqR/aKvMMwcWoJvUGy8zib7cFFoWd2ECnXqDHxqxWXFiL1PFFUKP4ZO3Va
	2fdKXFCZYYrYai2f+lH32ZFdBRlDvjRE3QlQ2nPcKMrkBhu3o29Qhxqo1j2PZiq1
	n5EhwkizWlKf7KPQQVTLJ9Hh4RmhK9A58TGSZm5lr66IQjwcCFGw10ShvUw+tMns
	xEwTaZzlf1SV3c8Q5AjvA==
X-ME-Sender: <xms:KFfMaeQQ9tbIUFQopcGEilkBcbGwh8ee7qNAT7uSi5fFZr5jhUMhpQ>
    <xme:KFfMaarvTv_9RPvQzS2K_3bJgemjQqc0zDtKRbrOvIll42XQcDVJxNqugB2Q240A-
    Unj8gPptYiKyDp0hrnlr9V6Emn3HH8v0FVs8b7X28NAYjX3jA>
X-ME-Received: <xmr:KFfMaUJauZ9hsW-PCsk4D4ISKg-cV8Oyst2sJBcDYWM2bHisXw16RRhbRw>
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
X-ME-Proxy: <xmx:KFfMaVrke3-f5rK9v46B0xo-24NEg2AJTEMT_xnORYNAVwFAUJ33Gg>
    <xmx:KFfMaUzT9loB7Rtl49LicU0kv1uGpGozrckYONhaRCOC-IywNxa5GQ>
    <xmx:KFfMaROZ-jJLEjzaYbEUWLcmMftt4skHCF14KFHxNPqWcI9OyZT9Dw>
    <xmx:KFfMaR6H98c4TMgVGlBhcze1DmRKApeQH6LEkXyjqB-9_-pFhq_j2w>
    <xmx:KFfMaUceUjmAhbmKVvSmqOS2ht_tn5c1Li2Q2qTz3nzgtp65X_eMrJRY>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 04/13] Add linux-6.12.79-x86_64
Date: Wed,  1 Apr 2026 01:21:54 +0200
Message-ID: <b53df707293f8907f5bb28a6d7380c28236b2637.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774999337-52A93900-3B9C9A5C/0/0
X-purgate-type: clean
X-purgate-size: 1016
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 03A6C372B88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is necessary for new Zen4 runner.
Do not include Argo module in this build, as it isn't compatible with
6.12 yet.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
- update 6.12.34 to 6.12.60, retaining acks
Changes in v3:
- update 6.12.60 to 6.12.79, retaining acks
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b23040505bf5..58f7571f5366 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -85,6 +85,10 @@ linux-6.6.56-x86_64:
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
+linux-6.12.60-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh "6.12.60"
+
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
-- 
git-series 0.9.1

