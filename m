Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D0CA48B5
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177993.1501970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLS-0008Ld-2S; Thu, 04 Dec 2025 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177993.1501970; Thu, 04 Dec 2025 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLR-0008JZ-VS; Thu, 04 Dec 2025 16:38:17 +0000
Received: by outflank-mailman (input) for mailman id 1177993;
 Thu, 04 Dec 2025 16:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLQ-0008JN-85
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:16 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a055efb2-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:38:14 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id 06A6AEC05A9;
 Thu,  4 Dec 2025 11:38:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 04 Dec 2025 11:38:13 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:11 -0500 (EST)
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
X-Inumbo-ID: a055efb2-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866293; x=1764952693; bh=3br/kbpoG4
	8NZlT+9b0/J8VIYGJaNyaNEShdOIiOHwE=; b=phlQITGyBDJExVO7A2tqUIxjRz
	xwdPxP1IEZfB/c2U9igbkK6TefOC6YM6LLvCS8Nmzv7bTZ1JlwimxcaXk4SuTz3A
	dQ0Dd+uc5jtcsKfPPaO66Ft8kIQnqUySeZ2I/vVGeIFZxogHGtl/RYoW9AjHYe8d
	lYPuoYNbbzTE7O1ESC6T29TIMSwv5dg/8FUe9wg7CzIAOGnmCG5ByvgWQcWzo2za
	w+9T4vHZyndHMJkNieMkSeNcd0Kk2+SXkrVDk+uT9ToWAss5fm/oI8mxrZjmXp7S
	ZayAtoG6QbuC5XRtb7X1EVJK7OtXN4MUHmQUoyf20t2XAsKr7knFijF1ATSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866293; x=
	1764952693; bh=3br/kbpoG48NZlT+9b0/J8VIYGJaNyaNEShdOIiOHwE=; b=G
	BRIEJvKSQYY14dA9CRSvn/Bfh8vuIShBWtUEsgg8LiPYgtrhgZnkboaxg0wDwOHB
	zlOJLGjTBYgFOQR7ALElrHrKCTBxvv3xq2gKZhI5PIpV7pnNbsUt8Fwh6REaQjOM
	L5J25UKWSw7xN0kJxBCaDm++ItJia5q6QaA7eASBK3xSDCwlYU1wwUBYyuAspNGD
	ev8hpJ6DtFCGRxIRlZYcpNaKHDvVBx5EJpARICuLNoA4MrB6akrGYtLliXsJceKt
	kAZqeDeE3PypGYnM7jT2mP8Bjnht1CNjyIrOQX1rfFQZa2DMLiMm0TCqSiGzuAgc
	c35DZnhTNS7raG6kS/6kA==
X-ME-Sender: <xms:9LgxaSQchLHaizYFFjPTJiLCqEQCBfnHixGMqoxMIDoISQOPeLfVnw>
    <xme:9Lgxaeo55Yq-2rjztYrgLLd025e5BMfxSXDbuhjzC9ToKLxoGfLNqMhIiFOa0f3ZY
    MF-O56apsKZkoFkIU04rIwSt0m6CHzriXlGtUaj2DCkJBC_0A>
X-ME-Received: <xmr:9LgxaYJ3bAgeiv-YQaObGZ7NGkw6XuQu_SfSlQ9i8StD8P-PkS_IyqP2PXbwQZF3jQ-vFPnKVlrFcQT3k4IxIyN2jcSGLVi0s0z8Kngmkns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9LgxaZrYBndtOCWUhDV5S_tsnEdayxKa98xN4eTUi7mMjzZJb4m-ng>
    <xmx:9LgxaYxSkkO8FruHKnufLr5s4a58vlj7RabyKmeqGBq8FUTpTFZFIA>
    <xmx:9LgxaVNHg8CXn4i_vDc8R00zYn_HfKzM7qtpGXQjZWPxEatGPY2-kg>
    <xmx:9LgxaV44t_rsdtWy3q2C6PvJJ8zMinPNNwb_luKW_oh1qqd3SuiUQg>
    <xmx:9bgxaQK7AAD_tr1Ciihe9PTKRd8qRGZGCh2blMoV_wXpPJasi7gNlLFK>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 02/12] Switch Linux builds to use Alpine 3.22 container
Date: Thu,  4 Dec 2025 17:37:23 +0100
Message-ID: <b1d58190ac7e2b65f80542685191944b83338960.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Slowly phase out 3.18 one.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 17d25ce..36622c7 100644
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

