Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOkLO9YzGk4SgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774E372CA7
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269503.1558529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWi-00080n-EL; Tue, 31 Mar 2026 23:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269503.1558529; Tue, 31 Mar 2026 23:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWi-0007yn-Bd; Tue, 31 Mar 2026 23:29:40 +0000
Received: by outflank-mailman (input) for mailman id 1269503;
 Tue, 31 Mar 2026 23:29:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWh-0007yh-Bi
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWg-004YpL-Nk
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5879-bab6-0a2a0a5309dd-0a2a45078f28-22
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:38 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f1-fd74-0a2a45070019-67a8ac9993bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:38 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 59E291400205;
 Tue, 31 Mar 2026 19:25:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 19:25:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:36 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999537; x=1775085937; bh=I5mcvvSHTF
	hBZyVOt5aUywdyDCm1qx7B5kYIprHbf1U=; b=mTrbgDtY9ijZYxABIf6tOFFmPw
	fGA1nntetrsZ2PVAJEG6ycM+7s/j8B5zKjY2N9yNFOha60oMOyP9LgAtcde9JteW
	tUAEEb8M0AjynnOQfE4ZkMLpdCnTTBduxPyoMB/HjHLkAEVlSRRfX43wruWSIGeo
	u6j/U+ANIwotmfcl9euUl7gswJXGZgtvryKOhCHT/4SVSYxSxii/6xqnv/NBIar7
	a/JJrW0wVY3mYwULsV4xiBKp90RvY5orU4Roriifrsn4ebDCgbl8q2k40yJBEjVw
	q+CMM3SUpzveG3aXGAKlho0W2O2QXyP0b0IA4osLGqrWVapllqnfyI90yffw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999537; x=
	1775085937; bh=I5mcvvSHTFhBZyVOt5aUywdyDCm1qx7B5kYIprHbf1U=; b=Y
	wNpnAS4dinWlxXobhuTAJDI4DQf4nXpIxkwbSNX80RKmi0LEss0oPhqc2ZEh+iXE
	LrCnEcRw/qxobyFSzKQSvGu9SlLaPKF4/mydR94UWGUX6P1gKNQIgarr2Lpqd/20
	y/vGHh9MQMsZLLxv8mjPhgqr51RdheNSxLmbnq7BzitgIAnqHFN0s3RICTlUmPaB
	m2xh77Pyfg/iiMwTPfcd+FSAF0bKpP/HMxryWhRWtqXZNRzlkZjDwX8n4mN3YlHT
	bk+BOyhFjrhwNQpOVpjOz9/wyWrKKEy4/budxMBQ3+FolfIMqCjBFTnV2OW5TqQE
	tyGnx9doXkeobB+D4dCjQ==
X-ME-Sender: <xms:8VfMaTjFq87Jl9vome3qZkaC-wPVY_1wuylQoo6La7vpsfAjEY1NCw>
    <xme:8VfMaW4vIM3P2JeSEjIbgclKlWw32SdNnOkZ7-H1Hl_gJKPRMa5mSweCLLi_OShaK
    qLEyd0oXafN0ScIgjVo09zMgttOfmFzU8p2P7KdkVzzfWzUKg>
X-ME-Received: <xmr:8VfMabaYywHMGUODEIeDo5HDc7T2lF-2LzwquMfJOT1_dGwIZMuUDbz0BQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:8VfMab6zTNB0jATECAyFCRu78nD-PwcIjzBf_8iUhU2hxCAPLqDiZg>
    <xmx:8VfMaeD4Yka7mrHl1OSB5zDgXQkIl2ourxXhcfz1TFl7tp2yCSa8wA>
    <xmx:8VfMaReROZZwxA2hFmMt3YhWAU7nFUKJZTE-8n3Ax_yPb12aIK7G1g>
    <xmx:8VfMadK4SrjJARPyMrE1tnxoWevnCjgZLWXWQKhBEITL6sojowHwIg>
    <xmx:8VfMacvNtWFBelZrUB6FEtHzA78nUUOynZbdOzeTF9T7-S5aTWGO0DSB>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 1/6] CI: upload tests-junit.xml as a normal artifact too
Date: Wed,  1 Apr 2026 01:24:50 +0200
Message-ID: <99d3244f3b937c52e58d5c96b2b8dc9b94439c14.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774999538-4E0B0303-7CD736CC/13/0
X-purgate-type: clean
X-purgate-size: 709
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 2774E372CA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This allows checking the file if gitlab can't parse it for some reason.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/test.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 275c01c19f77..e189a774e946 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -151,6 +151,7 @@
     paths:
       - smoke.serial
       - '*.log'
+      - tests-junit.xml
     when: always
   rules:
     - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $QUBES_JOBS == "true"
-- 
git-series 0.9.1

