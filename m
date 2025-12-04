Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7EACA49AE
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178128.1502101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCbC-0000hH-J6; Thu, 04 Dec 2025 16:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178128.1502101; Thu, 04 Dec 2025 16:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCbC-0000et-FS; Thu, 04 Dec 2025 16:54:34 +0000
Received: by outflank-mailman (input) for mailman id 1178128;
 Thu, 04 Dec 2025 16:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCbA-0000ds-UB
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:54:32 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bf26fe-d131-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 17:54:31 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3121E1400237;
 Thu,  4 Dec 2025 11:54:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 04 Dec 2025 11:54:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:54:28 -0500 (EST)
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
X-Inumbo-ID: e6bf26fe-d131-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764867270; x=1764953670; bh=D8R0Uma4yL
	RqgeVrb1I3uRMBKie8Z6RMuPmi55KhBLU=; b=d4JurwJJKDLgKSGpBG1HPGVbl5
	Ojs5qnNAmP6VZ4OMgCPBpeV64sXtiRXG3+a1f+fep/lownvIfiTZxEgvcu2Otrow
	1tDOfeFGNyCoMnItjCNvpavckdAfbVoO6bETr0lMALF8fdn5hyYb4wcPSv54bB16
	T/agxDE0k/ngQ9aBuJpmupbOnM8o4tAeddj5mJLRI+i65/slDrvQagrXOGkzFkN9
	48qNSWQuW9F/usTc+0cTZu8jhXlS22N6/3pizfFCHTp51EeH7tByl5yYEBy+1nFJ
	9huZ/LKPPAhpquSQ93DoppYdToYz/8s/0ob0fHV1uVCsWY1YzeVlFi6rfiEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764867270; x=
	1764953670; bh=D8R0Uma4yLRqgeVrb1I3uRMBKie8Z6RMuPmi55KhBLU=; b=I
	oDNNMSO/QDVC/U2yKtYUyAdu7UiFRgMq/sdHdJO0iKAqbMclWjE2TBPejYOZGpUQ
	X0et2gYYWCj1kZtaK2VlwxRLEy75e4J+KD/DKtxcvuajzqJ3kNDAnypPzZ6AfSV7
	PXf2BYl8Falpur4N/1U1Ai2bCRu3TOEImT4vAiFO40sr/o+EWrvVHLK/78HTTLA+
	6nJGKjnI8994SC9n4/PdujNuIJSKwtSIXa/MZ+vGCzmRWj1uBEXyFBn3Hm8vF5qH
	LLnzWWF+2Qi6OostPf2NPzvHIcn6/+Af3LXttQC5VeVYJWJYMqDJHZ5H4h43YZh+
	z5mXQaiR2m7A14prpm/bw==
X-ME-Sender: <xms:xrwxaTeZmVbewnDpmOc_WzZ_UIqypQdRvsJes-GHMe2TxOzMYqBeNQ>
    <xme:xrwxaQNn8DIIwMGzpwIqlxpTxTc6L6WS1X7DEZQW7tdr_tcHzBG1-DcIN1PMZJguP
    ny8vlRBQ4AmYQ4SiOkKkATymdutBxzHS0UIZBpjdSjBlPLIYQ>
X-ME-Received: <xmr:xrwxaRiclqtrzgehHcJw1-i_KhK067lzBdFr0q9MnPWxNn_2ZiQ_JNPmIFwLIWv0TbYnNPlPpexIgxH5JB_daL_w88vwtwl4oggr_WaW3pM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghr
    ughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:xrwxaT0Unu6zVJOSGSNfTCBJqickQ2FGluhLVG7P6KzDEs_7BGWnTg>
    <xmx:xrwxabih-trcZmtCZlBawt5n1zrOMpZqq4tw6-27p8I9P6vEe2ODdA>
    <xmx:xrwxaTd5OF5WwjV0cB1C9m7OjiNO3ZvST3-mGf9tqiXTn3O5zL6D5w>
    <xmx:xrwxaekZktOdqWBjZCopZoEv6gHG5wiC6lRtoGapbdmLFWM8ekrwsw>
    <xmx:xrwxaZ8fqB66MSoiSpPeZVN_lN1-9QsZ52TMvv3RV6cXgtIXoH7czHRX>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build
Date: Thu,  4 Dec 2025 17:53:50 +0100
Message-ID: <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't exclude sysvinit scripts, but allows testing systemd too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
Changes in v3:
- switch to trixie

New in v2.

Requires containers rebuild
---
 automation/build/debian/13-x86_64.dockerfile | 1 +
 automation/scripts/build                     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 6382bafbd5bd..9387da453fea 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -26,6 +26,7 @@ RUN <<EOF
         cpio
         git-core
         pkg-config
+        systemd-dev
         wget
         # libxenguest dombuilder
         libbz2-dev
diff --git a/automation/scripts/build b/automation/scripts/build
index 7a81d229decd..e77529cfc8ec 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -71,6 +71,9 @@ else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
     cfgargs+=("--enable-docs")
+    if pkg-config systemd; then
+        cfgargs+=("--enable-systemd")
+    fi
 
     # booleans for which compiler is in use
     cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
-- 
git-series 0.9.1

