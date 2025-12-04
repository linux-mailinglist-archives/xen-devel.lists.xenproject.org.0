Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8DCA48B9
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177994.1501977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLS-0008QC-CA; Thu, 04 Dec 2025 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177994.1501977; Thu, 04 Dec 2025 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLS-0008Ln-5F; Thu, 04 Dec 2025 16:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1177994;
 Thu, 04 Dec 2025 16:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLQ-0008JN-Sa
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:16 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c382a0-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:38:16 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 71F93140001A;
 Thu,  4 Dec 2025 11:38:15 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 04 Dec 2025 11:38:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:14 -0500 (EST)
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
X-Inumbo-ID: a1c382a0-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866295; x=1764952695; bh=XvuFgKhf40
	HhvxhwKBZXVvY0it85GQmHd9i61fS3MnE=; b=ORj22vjgLrSvP9/aHHbcP+QZro
	fKruauT7qd/anptAF4sZ9VdbZRH3YspqPsKFfQoJcF/vlDuh8GFdeWgyQWGDV6nS
	BYRVKv8KWYFKZCaKvHSNcrbXHNBMk44RS194Zml8DmDsv4w/djG0imPfCin0xOgg
	z7u756s5dU8HhMqb7fUd1AIsg1XGPTU+ZQIMc0ieLhxHEovOvJ8Mpiq+KH7JSJ3T
	rz9uVLuu7xf7jYmxILXmGiEyjfsZLCBKOmZhJMq+W+Q6KlGbCMxEDH28TV1R5cvS
	aoOCalCFjK04BHKZXFiiFfIno3Ut38r+O1bpm7ZGDz+Uv4A8U5Lqqu5F3u8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866295; x=
	1764952695; bh=XvuFgKhf40HhvxhwKBZXVvY0it85GQmHd9i61fS3MnE=; b=G
	mQYWZCZP+xZuv6G4gLaGUC1Q9dV1kSRcC9VELnHVAtjONbwRz4A9IAAIbHzpLbz5
	6BBKukpWbILdkXllszNOp0W/8C+SGeNmS/ldud8qk2PUdxp9eRokMEAmwJTM5LHJ
	u/rEjovqCooRb5flJEFyFjK2J49IyjCIrG1ryZTfqT6bfZNEZbvJm/ePlGNGLFew
	HQ9HXjgOc+ZRGnBlwZHi6s30aigMejCytUipy6zXgawpQRCXPYXols5fRQPl+FCA
	ZCuitKovwLuRuhsIw1dy49+2pIc3btgxyrlDfZhAFNxj2OTop0qoA+t2iM3HkAhQ
	cLe14fWA8p8ihnrh2Cfqg==
X-ME-Sender: <xms:97gxadDgOtu7AUsk6kimTn7KfWphxB9K1SqDvYp8sjr2QwRlf2u2ag>
    <xme:97gxaSZ_-fixe56a-4CoD3IFlyjet6IqV_uIpaSzoF2XqjbrI5uWSDrLEF9BheGRw
    4A6V2BREUCitBEYiYF-m-KBOmEtzt8r9-S90JYTh9G2GEetpw>
X-ME-Received: <xmr:97gxaQ7akfg4UIKjHmkSjX6P3rFNjrBdLQUhy0h4o45nzzdhx0_QIiW5-P13lSphqXqs7AHheMkfGxTEgooM9bXlJbeZw7SszmdJMi-CMG8>
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
X-ME-Proxy: <xmx:97gxaTaWi47OvJCxeuK3Ema0cvREC7U-yucVMHE6N-TnOd78XWX5Bw>
    <xmx:97gxafg1QZ3Bp-C8aK_3Iff-i9hqw1yaAp-WqCCTdWTcYBJDPMsHUA>
    <xmx:97gxaU8k3V_oBLve04LcpUZzF4PkSEPWl22umEpFJDAeCWmswl7h3w>
    <xmx:97gxaaq31NA_bzWneI5SOAXnZjuDtrzxru4S2u627w0OGz8-TQBbhw>
    <xmx:97gxaeqXuW-NrbHk9d4mXWJhi3dJIXLV4iGXmhxIYEd8ZQVWbOxptxnt>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 04/12] Add linux-6.12.60-x86_64
Date: Thu,  4 Dec 2025 17:37:25 +0100
Message-ID: <378aa7d93dc81118044c8d376f7500c656a2afe9.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary for new Zen4 runner.
Do not include Argo module in this build, as it isn't compatible with
6.12 yet.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b230405..184d0b3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -85,6 +85,12 @@ linux-6.6.56-x86_64:
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
+linux-6.12.60-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: 6.12.60
+
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
-- 
git-series 0.9.1

