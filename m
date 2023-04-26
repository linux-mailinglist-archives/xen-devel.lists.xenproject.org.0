Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F366EEB56
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526382.818101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpt-0000UG-4i; Wed, 26 Apr 2023 00:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526382.818101; Wed, 26 Apr 2023 00:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSps-0000MW-V0; Wed, 26 Apr 2023 00:16:40 +0000
Received: by outflank-mailman (input) for mailman id 526382;
 Wed, 26 Apr 2023 00:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpq-0008T0-Lq
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:38 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bcbbfab-e3c7-11ed-b223-6b7b168915f2;
 Wed, 26 Apr 2023 02:16:38 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 427DD3200918;
 Tue, 25 Apr 2023 20:16:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Apr 2023 20:16:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:34 -0400 (EDT)
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
X-Inumbo-ID: 9bcbbfab-e3c7-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468195; x=1682554595; bh=AI
	2JxnYviPNAYYE+wMSmcTdckoUvEFPuFDG8Zwtbt2A=; b=n/PtNepDuE337hVfcj
	zAOm8fgI/Q5sZACtn9piV/PwruY0dJ3FA6zdD3yVHdsUiRGSDgJ9Zlr01YtFJJNo
	ixY91Rx6ZZgautdWdRgfrWwK+hDyL1JGDh4U046w8Lx0VySX1CNw7l1USaIg8aCG
	JWvNhrIjOFEqOOmb6JPLk6vyS06y2/vUUKr4CDOXO4HrRbsnNT5h6s1JzniH56Mp
	B9WxmozxzLbTGVInpYD5ZlKLSVNIC7pguyiNj+DMqQaqKgjxQ8yHd3jErzEngFHh
	tFwGt9Mbfkrr7jrInHtS45WF6K+J6HpVFpyyGwKJijatDDOC6NtQACA9lgRNwHwm
	AHiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468195; x=1682554595; bh=AI2JxnYviPNAYYE+wMSmcTdckoUvEFPuFDG
	8Zwtbt2A=; b=XTKHwwBFRl+xoJafvnjVhhX8tUp2inan7n83tE1rpI7V55UOXYH
	FMfUm9nuQYZbQVKcIxT0dKYvcCwMgfTvkxp7Dco4enZyADfYz9NS9PVPRPcRI5C0
	ekQesw9Rwxg8ycUXC9M/oLSS+I7hH9SfvjbeBPOh1RB1cdxpmOp5OBSlCKvbxXlu
	LVZEfCOdNeRwF2LVgh/ciFUndfpeQLoP7hN59LeIDziVLpUOA1r2povsGD7D5bb0
	XmfLeKe+8DJVEArq6jo4dmJJZ8oBaAclHImPLRFSqUvp16QFDrOcXSESH4ePCFhb
	sLO21XXl0LBi71nAKpPbqOVm359XHNYLdxA==
X-ME-Sender: <xms:Y21IZNvyLy3PF3P8Ercc5zGiw6rW_0p1Ej6VchhS28S5Av1cQzezlA>
    <xme:Y21IZGdFdWX5Jq-eVBq4utoh9OAvbCbl1yTOT6basUqqKJx6NsQxQv-Ij-76mEKj3
    FLtEW0L9putDA>
X-ME-Received: <xmr:Y21IZAxvndPgxj6CXQhGIqXaJjL6eUR3NRxOfG2Z8SErgBRVruzD-vShc-qCa14mhDIwfPi6Kk0py0w95U9fKsgpXYBWiAVSB-j3Efzje7teywc5nga3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Y21IZEN8wJe6foV98MMi-iK-6VjjlFRWNNk413XdBoijOMRUhRWkGQ>
    <xmx:Y21IZN_eoHCZSiAjvBZFzFTk3NmoBBHqFS8enXQQnfap7PakiLP1kQ>
    <xmx:Y21IZEXbNdWWuNEKxJLfwNNAsbau31IpFICgWvUwwLr-NEH8WAVBAA>
    <xmx:Y21IZPmsA8vy3QnjRrO5hrOk1y1VrUVvGsrXS3MAaWPS6CrTXPWFTg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 3/6] automation: re-enable building SeaBIOS in Alpine container
Date: Wed, 26 Apr 2023 02:16:13 +0200
Message-Id: <9e7fc91744e52b6b2f5ea8a05a92b920ad22451a.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems to build just fine with Alpine 3.12, and SeaBIOS is necessary
for a HVM test (that use the Alpine build).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 7d1b19c4250d..d830cff7b7c7 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -77,8 +77,6 @@ else
     if ldd /bin/ls | grep -q musl; then
         # disable --disable-werror for QEMUU when building with MUSL
         cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
-        # SeaBIOS doesn't build on MUSL systems
-        cfgargs+=("--with-system-seabios=/bin/false")
     fi
 
     # Qemu requires Python 3.5 or later, and ninja
-- 
git-series 0.9.1

