Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFzMDgyV+GnnwgIAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C415A4BD271
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299769.1574335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgG-00020X-7Z; Mon, 04 May 2026 12:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299769.1574335; Mon, 04 May 2026 12:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgG-0001yc-3z; Mon, 04 May 2026 12:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1299769;
 Mon, 04 May 2026 12:45:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgF-0001kP-5x
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgE-001PV9-D1
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f8-e002-0a2a0a5209dd-0a2a4504ca26-8
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:46 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f9-1dec-0a2a45040019-ca0c7c9297d7-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:46 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id C7D731D0007D;
 Mon,  4 May 2026 08:45:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 08:45:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:43 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898744; x=1777985144; bh=lDurhCnEVx
	k5QBuNDNgcwnaqx3Wd1t33ua2Ae6U5h5Y=; b=B6p2GnSnMe6AZ9zcJw2SfwTVVT
	Nuq6S7BY+oXpUAkqe3kvJZR9SugIUQPvjW6JqGxn+q0Evpmgq9SA8UtG66LeDT7U
	vFJNud8tSVL5a++J0psfrvv0DkDCUCkFta/nBbFnHZwp3l2XhWx79vz/ZOqmpQ1s
	lQFnXGWJ5IizNUx+ogM80eOYYvkLpD9iwiW+jEHOxqHDe+sOtcijJLKB9t5elcbg
	obGKJeSrm5HN1Y8bPtWSyj/55LqWkAbl9fYtUW3CK8XfebE3UJqeoYcju1ejuNR2
	yiouZr6SKMBYSJiSbbPnPHaOAteaahtgzip4N5hiboMmbjLPelJ5131i7elg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898744; x=
	1777985144; bh=lDurhCnEVxk5QBuNDNgcwnaqx3Wd1t33ua2Ae6U5h5Y=; b=M
	cU+zisRjC/V4N4IHRzfMDG4Uth2PttqZt/uSKSs97HJJlO5Nr9s4EmvcvnyapQX3
	8xk7zECV85S98/pnohD2/u3kem1JoA8y3Nf1FNppfHGivHtRW/MG3f5aVaDoHPuG
	cHPvaEf/WCF1o1n9iFkYe0NeJELz/nIMIjHE+TYwmmEns/qwUN4Ru6GkPzhSpWeZ
	29Rac4PMW/DAg2MtTwIc407GgyRDQPd/T0CfihRlQvy07Y6TQ8gIqZAjHt4fOamh
	bfwuE+y1gtcyn72mpD6hQd5czuhwvqsa1rQyHs73HkUMvhJ0x2TTEIk5WhvkWfPW
	mgIsEnzy6uPx6/i5QJdLg==
X-ME-Sender: <xms:-JT4acTqwixw2NJ0eml8Pcp6YMV877QKI0E_bh_f5j8vTk26NXl_oA>
    <xme:-JT4aQr0xq3l3P0B9wXOTE2FU48pXsZyXwrI4JiCt8YZDRFQxWuM65kJUwY6jkZi0
    E2B2HNfpqB1Raw2acXUkQTrRGh6R6jqBP1t4whzxnxBbXSH1w>
X-ME-Received: <xmr:-JT4aSJ3QQVibd2y-eyJobvCCA-P5OPU682s2FcjTBZth_HzAJHUMJHltz4UBHmHCMKGRv_3FLb8U0JNkmu4rXF5yQwudRDu84We-SZYDwM>
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
X-ME-Proxy: <xmx:-JT4abpv4eI4t1jXVS500yZnemWlajZWDNROHtyB0VRe2C4ucxE-JQ>
    <xmx:-JT4aSxr66QmtrUjrQcwMglYApyslYl-rr-NxOF16FSahLACNfi5Kg>
    <xmx:-JT4aXODErMV7Iy5-RBA_O4b2KN5OwV90Y3B-ifWAeyLCem-I4jySQ>
    <xmx:-JT4af6ROB_8LvS_dEzzbgYzF_l0kLIyGjQpONQ8DegzGSumpVU-xQ>
    <xmx:-JT4aaf80cQQak_J8iDY-4D-xBNnzLQaR3qMnM1jrX59YYUBprHYQP0P>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 02/13] Switch Linux builds to use Alpine 3.23 container
Date: Mon,  4 May 2026 14:35:41 +0200
Message-ID: <23fbf2c275cfb021161688eb5f0e9013bfb4aa83.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777898746-32E743FF-0F06FFE7/0/0
X-purgate-type: clean
X-purgate-size: 1350
X-Rspamd-Queue-Id: C415A4BD271
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
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

Slowly phase out 3.18 one.

But keep Linux 6.6 on Alpine 3.18 containers - it fails to build on
Alpine 3.23 (due to GCC 15 defaulting to -std=c23).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v4:
- Alpine 3.23
- Keep Linux 6.6 on Alpine 3.18
---
 .gitlab-ci.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b86d9aa..5281c1f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -21,14 +21,14 @@ stages:
   tags:
     - arm64
   variables:
-    CONTAINER: alpine:3.18-arm64-build
+    CONTAINER: alpine:3.23-arm64-build
 
 .x86_64-artifacts:
   extends: .artifacts
   tags:
     - x86_64
   variables:
-    CONTAINER: alpine:3.18-x86_64-build
+    CONTAINER: alpine:3.23-x86_64-build
 
 #
 # ARM64 artifacts
@@ -52,6 +52,7 @@ linux-6.6.86-arm64:
   script: ./scripts/build-linux.sh
   variables:
     LINUX_VERSION: 6.6.86
+    CONTAINER: alpine:3.18-arm64-build
 
 #
 # x86_64 artifacts
@@ -77,6 +78,7 @@ linux-6.6.56-x86_64:
     LINUX_VERSION: 6.6.56
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
+    CONTAINER: alpine:3.18-x86_64-build
 
 microcode-x86:
   extends: .x86_64-artifacts
-- 
git-series 0.9.1

