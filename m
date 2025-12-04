Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84ACA48C4
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177997.1502007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLV-0000fN-5P; Thu, 04 Dec 2025 16:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177997.1502007; Thu, 04 Dec 2025 16:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLV-0000aR-01; Thu, 04 Dec 2025 16:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1177997;
 Thu, 04 Dec 2025 16:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLT-0008JN-FA
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:19 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a358add0-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:38:18 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 1DFD5EC0578;
 Thu,  4 Dec 2025 11:38:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 04 Dec 2025 11:38:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:16 -0500 (EST)
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
X-Inumbo-ID: a358add0-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866298; x=1764952698; bh=QG8dKhrWvv
	GTlwDVn3FIfWbEGXxs8coS0YgMvQyIRtw=; b=QnqebouNQsF+eBQ9qmTSvfflfV
	f19pac/1P6/PMQD4qdCwgRQ3Xf1K7SVEN2dSjEvyJ8aX/VkCG4zUYgzc0zCWpm9c
	5Es12d2OwZhu2ySYC6j5YEbBkL7iBJKrZainSUE9laqwifbJS5af5eqMPP0u3XGZ
	qYZY8UXJNV/PpPXzBqn/aCKHgD0A9FgawkooI8EaLgcueq7FlMaXWXnmkcwZbS2Z
	o+3YdOq8NYqfrP4imhcPgGxcHaSXbvOzyMydf0BPmlJlyfe+OEXKGevOV5ZPnyDi
	BX6SM+GkKYZATx3jTSmBl3CQXLl//zzoxtrCa+FdjD8EEBKj/HAGK0lP5HVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866298; x=
	1764952698; bh=QG8dKhrWvvGTlwDVn3FIfWbEGXxs8coS0YgMvQyIRtw=; b=c
	d572b9UrXG3DM9tUE4/WE1PAbPeYMV848wOLTpY8cQS4qLuSRgSvw/veCtq6wo3Q
	sPGmnMD4MRCQYaUkf2H8XXvMC4XiXqwkrayFDX4ti5sTzJX6Cxq52TG+I5M9Cl39
	uo+qlK99cwnld7wEBGVJyzoQNfBGCDbvIqyIiuBof+Q9aRJDMF2U0wccnq8effNF
	nSskJV5bAudLg4MOVxwJlnz6y6suiYvMSw+WOrqY9IFdcG8T8NnUYM2PxaH30sFe
	69yyHAkjbETSz18NkqBAj9BX2slyVGRFYd9rSevnl3Ctxm9iqapaWWqZx0L0n0QH
	A7+C/qmYsjqKnBkfJO6GQ==
X-ME-Sender: <xms:-bgxaa3QBgjAclbLXOCG5MdzN_Bhng2OYnpmoLjbV2mDrNLeDTmGcw>
    <xme:-bgxaT8uCwu6jIrydFYTFKuufTl5qyiZ12Lk3FuMHiGRO6wc8kiLOZydgaziSnWRc
    hHdtYeKiyA4JW4lUFZjCoeXqs9e6mUrCrmV6JFTAYO5k6RU>
X-ME-Received: <xmr:-bgxabPddaZUuDHdI_IVF3Vr4H4UGJEI3mKCyS1cdF_SlOIuPOUi5JggkkeOECYp87bYxZcDkpRWFzR5rhas5Ta8rtItMAn8gX9dPIQMtLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:-bgxaXdhA-boaLs8UNK7Phpl_0fQHt4mENsy8ZVK8BH-QcatylKMBg>
    <xmx:-rgxaaUmyzn8H4VVkNTLLtshnSTCCRvorUOpph3s63VRwISmqIkVqw>
    <xmx:-rgxafgLUNqmg_5uS3iwtROTkQ4OyRQflV510iSGvqOTI0zL5k41cA>
    <xmx:-rgxaZ8wr02PAvJX-yU0Yd16qcEeuPH7PdbL6rGrUDjeNO0P3r5UCg>
    <xmx:-rgxaWuexigqmxRMWI2AXdYOT5xeSiP8lMoYKjZL_BNghd0GoTh21hdY>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 06/12] Include git in the ARM64 build container too
Date: Thu,  4 Dec 2025 17:37:27 +0100
Message-ID: <c404521c3598d4872a0a02155833f7f64cebcdab.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be used for fetching some Linux versions.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

