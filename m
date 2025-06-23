Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DCAE4553
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022431.1398262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZv-0002DE-DX; Mon, 23 Jun 2025 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022431.1398262; Mon, 23 Jun 2025 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZv-000266-A3; Mon, 23 Jun 2025 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1022431;
 Mon, 23 Jun 2025 13:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWU-00048y-VA
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:46 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fbc67a-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:45 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 97AB311400CA;
 Mon, 23 Jun 2025 09:47:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 23 Jun 2025 09:47:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:43 -0400 (EDT)
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
X-Inumbo-ID: a3fbc67a-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750686464; x=1750772864; bh=sZVLbSs4nB7LGE4gIMwQS
	1mLqB9TPuKDluXnxQTuE1U=; b=l6w+jpG8tdiGF1lkw6B4vcYw+qY91X6FycNLI
	qRFDybkAXJFo1UQkNjCoVCGQRHRM4D5/XqYnO+fsmefjY42nhEIk1bkAdHd0IZsI
	wfaobgB9PhAwMX3c6djvUJs+kxL55fW31UmhidCtjTXFJtgtydB9OQYP3rAJSRIt
	VczNbTMxh8Ke29PxyKo7oQ2415bYHinSxzdS+VQHavrZ1CfcT0pu7XRHVGl8koFB
	e+Ol2StrNIBXkfz+Yvcbn6rZAJ8lpaF0NxzAKPwgqWHcOlAzCgC+uzSbyrNskm5m
	e4i4959k3sxBqv/SOJYPZw50SDm11tmEGRhQVleCH7vTfLpog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1750686464; x=1750772864; bh=s
	ZVLbSs4nB7LGE4gIMwQS1mLqB9TPuKDluXnxQTuE1U=; b=f2XR2UrTAdhWCSWnH
	VuKIpRx/vEoW7cKfcoH1860qH7GM3jL9gBzZysC+vL3WxY6MMvwWfC+vQH91uG5j
	2InOvwxKR6rt4qvqBgA5Hq1EwRLVAyyXPL7I77cGHmtRTlk8yNL9OYd1HPeOgaCL
	+am5Bu7lJH9itMY2Wao8Mk2oxQvouzs3p+dhA8fB6QPCGTIEJ/e2UM8PSJXYZ4LT
	HUjHcm4c2T1Tyl0vPE8kiKy3Ziq28QLk4T0Abh3D3yNL0fMjinqcpynDeMZms5mC
	PLfsHcogBKpvaliY05Yz2EVS8MaFCWgJa/00daAnfI9wR012osERNJLRwv5AJ8iP
	MAzuw==
X-ME-Sender: <xms:AFtZaK7_z-9ZYzAh42GJGP3McawHtm_QenwlXqFOQ6Y3yNNSDq1-Bw>
    <xme:AFtZaD5NpNsWpGXjfnPwxWLEJN-I9bAMQe3HXs_q-L-TxMkOB7nVE5DWgGCz-_uqX
    -7iV-uy8FI5bA>
X-ME-Received: <xmr:AFtZaJfv4hL9gVvST2-oOnVuN7_CToupAvPopGZyTuxBYtZWkt_RPJYYfo8sNwrlhyTotZMSGu_q8Nj0B84ApudoL_ikbf-D94htsw5MJC3CK0KT9vn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevleejfeeh
    vddvvdeiveefjefgtefhuedtjeetveeuffejgeekvedttdehhffgtdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghr
    ughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:AFtZaHIZ-QNN8DRhWotfwa4ycTHXaXDp3DqhIqv625-w4MPt4HbFbA>
    <xmx:AFtZaOIFSAszuOeiuqJ0BFNjzc1CgEtrhtxGDnJQhxEoBYM03_wILQ>
    <xmx:AFtZaIwpMmyMfN-lu6egKMZaAUupLi6fgghjvAzLJWRBah2DgzdXqg>
    <xmx:AFtZaCIKXUqIzKABsQdWuCMnKTxinEVKzG8rmBarKN7oL4aYPRUc6g>
    <xmx:AFtZaETAhQtjuyWuGNR6OYGY4T3XpL8uY4kkdTjcgwH97rOL19Vmmq2P>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 6/6] [DO NOT MERGE] CI: example how to use ssh to extract logs
Date: Mon, 23 Jun 2025 15:47:15 +0200
Message-ID: <9e10434c1e5ff6edb53b9efc65485247ad450f0c.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index cf040a29856b..944d0c6d383f 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -292,6 +292,8 @@ export TEST_LOG="smoke.serial"
 export TEST_TIMEOUT="$timeout"
 ./automation/scripts/console.exp | sed 's/\r\+$//'
 TEST_RESULT=$?
+ssh -o StrictHostKeyChecking=no root@$SUT_ADDR xl dmesg || :
+ssh -o StrictHostKeyChecking=no root@$SUT_ADDR dmesg || :
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
-- 
git-series 0.9.1

