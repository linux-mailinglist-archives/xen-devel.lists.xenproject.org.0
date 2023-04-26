Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D236EEB51
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526385.818138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSq0-0001g9-1V; Wed, 26 Apr 2023 00:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526385.818138; Wed, 26 Apr 2023 00:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSpz-0001cR-TV; Wed, 26 Apr 2023 00:16:47 +0000
Received: by outflank-mailman (input) for mailman id 526385;
 Wed, 26 Apr 2023 00:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpy-0008Sz-AZ
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:46 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fbf73ca-e3c7-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 02:16:44 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E2B413200488;
 Tue, 25 Apr 2023 20:16:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Apr 2023 20:16:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:41 -0400 (EDT)
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
X-Inumbo-ID: 9fbf73ca-e3c7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468202; x=1682554602; bh=QO
	VEexrNPOXNZ0lPTo4d9Cd3KrC07w6b0cxFok+5DDs=; b=UQt9JUPcYG8T8XYXyn
	cWPw78l2D/P82ymMRLbKF7UnZ8kYD2F+OtczCsRv0vz2YNLhGUj33oXXNbsFczIZ
	ihvsSdlJ9wBkR9IIYwEDYyYJOulpN66KsjzHfmi/fcp/9jeLLH6XgXKFC4Lr1HYW
	QpSL4y2FvnHrKgMYTGQWq4ZDMnmFBjvhBGS1CqEC6QY8QVxrbEq3SQ4cuq5/KBEA
	yqHbb8yZZGntNApnRvn1kTNW0msdRxtfmQOcsA6y2U4/ng4shkq4vM0q5H8a4DIR
	AFyAPXsQes2nk0QO9ZLho40bUbf8YdpVbfc2TgjjpPspj9vBbJi8Al8FWOo57lhJ
	9LtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468202; x=1682554602; bh=QOVEexrNPOXNZ0lPTo4d9Cd3KrC07w6b0cx
	Fok+5DDs=; b=XIBbv6pPX5qPNi03kvVdxAHrbWQDBaZJkTexy8KWdyggwgIKZ6r
	/YH4JLgXDJICHSD1wZssFv0JvOSBHjRrWGybSlqN9qLfKSy2JB8gU04wHsqscrvm
	KMIVTWaQ5NqkFjpSp1IYJxcWKhbNdnMo4toaot0bYwIohyLvGVOvBEiCVMffdRxC
	CggxCwqOf/7PPQ88h8wSfj2lcMwuy397TrYhqq0t90yXnXRQ+puqY0PLbhBSunQC
	nQP0AGURXyrEeZHj+h/UxBXwryNsI1oESC5rdGdfP4N+HruuhSg7Zd/uRp0f+PCg
	J6D45qmGRSMvO/iUuAOimeuDE+7kp8hbrMg==
X-ME-Sender: <xms:am1IZMCJDjEp9pY9afx626boJYyYMFkmjtCvXr8hNlfPQrumAD8Dwg>
    <xme:am1IZOhC6bfJUw0ScIRwgE3s7x0maD1_jUIupUhiGLYK2AauX9Vn4V4xgjLO5v5hr
    TiXz_Bu6UqIuA>
X-ME-Received: <xmr:am1IZPlErrV3gVMzDaV3UUK16dV9zrmQExwKAJX0j2AvMk_wfBZW9W4whVoaPJwk3Al0Z6_iU0GJE-ufmmv8ARWX7HV16a6mrx5y78gBGagtGvKSCCXB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:am1IZCyAmrWNC5mqrDEm7_Cuw2LDTLBKRN4-X4Nkx9zsTIfyZdEU1w>
    <xmx:am1IZBTfw656o94sxfDgn9BrW70VM2LrVV0NGhG38giOyxGxvynkXw>
    <xmx:am1IZNaPKONjuWDPB8jVSlebX2vnJCus-_EMSyM4As97RPEWZmcamg>
    <xmx:am1IZALlOFQAbRFtDVqKND0JAbB9uL4NXaLWky-artFJh6DYiq4XFA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 6/6] automation: include tail of serial log in the gitlab outout
Date: Wed, 26 Apr 2023 02:16:16 +0200
Message-Id: <8e1799a0e50b5a4b693f92ba26b6fef6154aeb79.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it a bit easier to see what has failed.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - print it also in case of a timeout
---
 automation/scripts/qubes-x86-64.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index a01c571860ee..056faf9e6de8 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -225,6 +225,9 @@ until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
     sleep 1;
     : $((--timeout))
 done
+
+tail -n 100 smoke.serial
+
 if [ $timeout -le 0 ]; then
     echo "ERROR: test timeout, aborting"
     exit 1
-- 
git-series 0.9.1

