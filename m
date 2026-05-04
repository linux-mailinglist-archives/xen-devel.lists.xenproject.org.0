Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCi2BQyV+Gn0wgIAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75A4BD26A
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299775.1574379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgO-0003J9-VJ; Mon, 04 May 2026 12:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299775.1574379; Mon, 04 May 2026 12:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgO-0003En-Qo; Mon, 04 May 2026 12:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1299775;
 Mon, 04 May 2026 12:45:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgN-0002zJ-9q
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgM-00AF8N-Lg
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89500-bab6-0a2a0a5309dd-0a2a45059892-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:54 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f89501-aaa8-0a2a45050019-ca0c7c9a81fd-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:54 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 31D957A00A9;
 Mon,  4 May 2026 08:45:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 04 May 2026 08:45:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:51 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898753; x=1777985153; bh=6N28n/OuOK
	FC0lV13jcrj5ZtQAQhOnik8wiu6mipkKI=; b=im8mSYKyU/w3PnUQyU4ZE7Osl0
	lNThkUuSLHX5hoUAxjK7XlLM4Ref1zz/i1lrXFxKdOFCfbyIMKAw+kTOfG8g8X5g
	CzPTNHHuHx5giKkl7mN8Jmu3Yyrtr8whbnpLwfXE+tU71mkwn6ag9voXj63H/TTQ
	t/1qvSBRI4dlZJTiGlTnMTGHBh+vca82SA3/5VzGfw50qoPWC1VJZryoKUaQwlKY
	7hPQhUx6kOSSaqu5FoftrRsuGEbbr+7ssN1toF0X/NF9Ezbd7u3A3Sp5rJd3mupI
	nTWmhh25UiMDwx7GR6gFemlprt1RlZMo0JXuioqKAg5VUJXuawgcYvsi4VyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898753; x=
	1777985153; bh=6N28n/OuOKFC0lV13jcrj5ZtQAQhOnik8wiu6mipkKI=; b=m
	cpYSfP9GT0TaLDKtKpxkPSdnvgrLg/0qr3O4FalT4KkTus1E7Ja7Ag2aU7XDLI43
	oO9D0+UYexZwSu44aBmnfePAwCr1V5/JhvnxQ9EK4m/Krec2KHalPPvUsdjjiq1U
	6h/URf+32m5jaXibdT8pjt1OSvysPex0Y8M/7TCqYjfL3wC0k33w6tHxsWjbAMLy
	bl91peWWfvFbIehU5GyFZ2dFr6xjH8r/s4cepxXBCfm3llA28odQ7IxTv3OIYX2y
	hWUDq2OTeD69UP1+LmgWbw6MRS08Sr9fYYIrVcYcHbJsXh1VjabsrwUyo8lOgvDA
	R+S/WfLh4Fqj5jXykRJvA==
X-ME-Sender: <xms:AZX4adn8VuruvZy0UIXLbkLv3x6NLrAkq0O5envrRgn5YlZ3PQa16Q>
    <xme:AZX4afuEbU9C22FwVoDXtc2D3dzmA2yhYJfWjKKA9etD84ZfyGuJL1d0bWZ0wpFwI
    ULpsEysx_mYjmodizfA3CcNm4Ij-NXi_4ffH1J5hnDPDq5ocQ>
X-ME-Received: <xmr:AZX4ab-zkRsl2jA5tGlLabTbxmA_HnLnEps4hCQdoJ4pHQzpA8x-9KripH6ATb4qn1TSqcRn2pOK-tjiyo-0YurQCc2SDVFE6x_7P4Tn1CU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:AZX4aZNMPIC6EauEG8pObJXQSmfevSTpI4gE0ScXzE2zd3D4zuFLBw>
    <xmx:AZX4aZFpEg1q7UnTV_6G1aujrsFX1teFyUEhxJN6Jbj3LpyjenTbsQ>
    <xmx:AZX4aXSSVy8Qep129rImUV0sKCzbRVV6Ab4Ly6pUqMppQe4k1DWmng>
    <xmx:AZX4aWvbBseKEpXPUc9ZuEmObxEHxHRYKQE1Y0odLGd6CCVCrK8TIQ>
    <xmx:AZX4aYgZBPHqAqVQ33yOHc2ydwgyDXsmXES3DhNjfVzFclfxfnsJAhnc>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 07/13] Add linux-6.12.79-x86_64
Date: Mon,  4 May 2026 14:35:46 +0200
Message-ID: <731be3ebc522aeaaf08ee150bc566abc339b501b.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1777898754-E0DA3443-225C71AA/0/0
X-purgate-type: clean
X-purgate-size: 1009
X-Rspamd-Queue-Id: 8B75A4BD26A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim];
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
index 45006d4..3ba8a31 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -102,6 +102,10 @@ linux-6.6.56-x86_64:
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
     CONTAINER: alpine:3.18-x86_64-build
 
+linux-6.12.79-x86_64:
+  extends: .x86_64-artifacts
+  script: *linux-script
+
 linux-git-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh "$LINUX_GIT_VERSION" "$LINUX_GIT_URL"
-- 
git-series 0.9.1

