Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55912AE44F8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022374.1398185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVr-000523-Tp; Mon, 23 Jun 2025 13:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022374.1398185; Mon, 23 Jun 2025 13:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVr-0004vk-MU; Mon, 23 Jun 2025 13:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1022374;
 Mon, 23 Jun 2025 13:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVp-00048y-PT
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:05 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b71d67c-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:04 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 77B3911400D0;
 Mon, 23 Jun 2025 09:47:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 23 Jun 2025 09:47:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:02 -0400 (EDT)
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
X-Inumbo-ID: 8b71d67c-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686423; x=1750772823; bh=QG8dKhrWvv
	GTlwDVn3FIfWbEGXxs8coS0YgMvQyIRtw=; b=G0xRUjr67l4K1kKxfKcKVGA93o
	nC8RLgsNqeNfWuafpdMY0zHNR+fy3g+LGD4W2T1A7obSs9rlnR1t/7zRYnp0Vbeb
	ybmITzQi25DxjugE6MWtQdtm9CJMclgLGwsq4SQ72JlPq8rGrdPFv7ihbM0x3zUF
	7koGCoNwsE63PnakPHefBiOrSJJB0Ia8njH5Gs68QR5vE7qxrXdB83D7yT3wRVHL
	3N1KaX5C+luKqmC6zqyR67mzJCM/+5xmiyVrpBcev+wywa6m8M6Qjbxi+T09HC67
	kT8YSSmZSkOOudK7RDBhcovlayzjJIAggL/2/JRhwKZIgQZqbwGRr8COxq5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686423; x=
	1750772823; bh=QG8dKhrWvvGTlwDVn3FIfWbEGXxs8coS0YgMvQyIRtw=; b=H
	lnvA2s6EeqpjNoF73Qjv2lGmfVPqWKUMVjCzplk67Cmt1bZzD/EcFPOBa0QRjl+6
	scyEBq2gRKmVNvGXgWu6aGvUBpYPSs84lMRWeHOpaNJ/QG599vqhvethDGVMw9LY
	poh/Gzvx5TrVras8eL9i5hfjRT6K4D53pCkECHaRNRKJZ9wVF1ndz9AXf/8mZtnu
	s2Q2+FvmxhdkHs2OX7sdnuIETVs6SQSL5FgOa68hgOIGSZ+GBQslKVLhb39MkytE
	JpVKz9mso2iBwT9ebDjaeIHs1Rv0/wdq6rJ1ROT4TRxgkId0ef1pml+07qBTqkbm
	tKb2jhRd3FpYH61FBtpBg==
X-ME-Sender: <xms:11pZaJGjzRZKsFpt_9d5zIt1u594o61oRGIT4UQtaqOusGgAJorekA>
    <xme:11pZaOUGJUaVGeEWBLI4sf8x0hDKsy_pKJi9SjNF9czcMIYh8i0FVueXC_yVcIlUw
    pvpETqxGXid2w>
X-ME-Received: <xmr:11pZaLIFcgqNG0nCYYd1ov6G0AX-HTjto2Oz0EsEgCG4GCNUTZVKkmSV9EFAw9yvz2GCC4Hv5pBTG6I0IjkVh5TBAbAzlnK_t8hdLQ8O3eep3su8Nq_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:11pZaPHEpcQ_wYMLnoBTX561zgIx1qP-FMMec15paVSi1ut0IVFwvA>
    <xmx:11pZaPUk9XE-CBvonk_p23qSYK4ikHsG2Uz8Fus8gDHluD01oX75Sg>
    <xmx:11pZaKN2V82MkTJFqkMwSnJ5VAnJVe6SfC8BBzFX3hWcIgNm5Aaivw>
    <xmx:11pZaO2GtS18QKJs9xDEyLKuBVEEMTDdjkz3O__yqXvJ9PIA4F9SmQ>
    <xmx:11pZaG872PzDh8rFflMflbNFHtLYvesJO6mSvUb5ty2XrIA8991lwPhI>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 3/5] Include git in the ARM64 build container too
Date: Mon, 23 Jun 2025 15:46:22 +0200
Message-ID: <dd83dd435e519d937eecbdb8313ca0794877c8f5.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
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

