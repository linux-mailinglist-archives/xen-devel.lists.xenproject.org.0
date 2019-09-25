Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D85BD679
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 04:45:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCxFL-0000ss-Bz; Wed, 25 Sep 2019 02:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CquU=XU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCxFJ-0000sh-HV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 02:41:37 +0000
X-Inumbo-ID: fdcedf01-df3d-11e9-9627-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by localhost (Halon) with ESMTPS
 id fdcedf01-df3d-11e9-9627-12813bfff9fa;
 Wed, 25 Sep 2019 02:41:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B680522237;
 Tue, 24 Sep 2019 22:41:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 24 Sep 2019 22:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=1A8lEmAUpw019VXdWnEGZkLXEHyBw42z6uUjfYtGZ
 q4=; b=TP2ATDiwzgpnROPXuxqik48FXQS0X726acH61nBEcnSIJ/BDJRplkYddu
 poiLK7bIxbdbdvzzx6ufNSwRSBeg2geuvnCK8H/cYsC70q7P7KU8MHIm7byHZNcu
 U3Y4h74S1NBlzyQhcYo6+nZBTLSvdzVh1LY2PDFDYdNqOoyalYM/GPapKvGygbjy
 Zc/q5TPJASChx04PJlW1vKUvBvv8e7oJEU9uBCs8+WB7Ufe+Vf4Po0w0DPeazpe/
 tpvCjGvlwsMevh2zYG0SRNuDM6q9ZIh0s5Bc0yClKlBPKA90Qyi6yhmS/SOIO2+D
 iSIjWIRWXHW8/5cVuc5zCZ3rdnHgA==
X-ME-Sender: <xms:39OKXWhucyZ8X9fZjSeqqexKrckA7bYauyaaCi9gKMeBhFFj3_Z6bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvhgvrhhsihho
 nhdrqddqqdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:39OKXXvg5pqYELSMF5DftpZGHmGg_-OwJj-STvwNrHHE_OxEyoi3vg>
 <xmx:39OKXcTqFEXTwR-BqkdmLHjKFA967OSDysMhzWGZS7eKtwE8PWZLDg>
 <xmx:39OKXT1t0esMkJzq_vbZMiJeM0ZxeZNRzKsQ5p0YNIA5KlX7c8P68w>
 <xmx:39OKXe-cVv5kX5Rye-yFQquJPoUbuXnqSEdxfLoe1OgYZdM8ogBaew>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8BB9D6005B;
 Tue, 24 Sep 2019 22:41:34 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 04:41:24 +0200
Message-Id: <e22295e077cc876bddfb6c596efff95eec7d5743.1569379186.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 2/4] libxl: attach PCI device to qemu only
 after setting pciback/pcifront
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBxZW11IGlzIHJ1bm5pbmcgaW4gc3R1YmRvbWFpbiwgaGFuZGxpbmcgInBjaS1pbnMiIGNv
bW1hbmQgd2lsbCBmYWlsCmlmIHBjaWZyb250IGlzIG5vdCBpbml0aWFsaXplZCBhbHJlYWR5LiBG
aXggdGhpcyBieSBzZW5kaW5nIHN1Y2ggY29tbWFuZApvbmx5IGFmdGVyIGNvbmZpcm1pbmcgdGhh
dCBwY2liYWNrL2Zyb250IGlzIHJ1bm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkFja2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBGaXhl
ZCBjb2RlIHN0eWxlIHNpbmNlIHByZXZpb3VzIHZlcnNpb24uCi0tLQogdG9vbHMvbGlieGwvbGli
eGxfcGNpLmMgfCAgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3BjaS5jCmluZGV4IDJlMDZhNDUuLjU3ODUzNWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC0xMTkxLDYgKzExOTEs
NyBAQCBpbnQgbGlieGxfX2RldmljZV9wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRv
bWlkLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZQogewogICAgIGxpYnhsX2N0eCAqY3R4ID0gbGli
eGxfX2djX293bmVyKGdjKTsKICAgICB1bnNpZ25lZCBpbnQgb3JpZ192ZGV2LCBwZnVuY19tYXNr
OworICAgIGNoYXIgKmJlX3BhdGg7CiAgICAgbGlieGxfZGV2aWNlX3BjaSAqYXNzaWduZWQ7CiAg
ICAgaW50IG51bV9hc3NpZ25lZCwgaSwgcmM7CiAgICAgaW50IHN0dWJkb21pZCA9IDA7CkBAIC0x
MjQ1LDYgKzEyNDYsMTQgQEAgaW50IGxpYnhsX19kZXZpY2VfcGNpX2FkZChsaWJ4bF9fZ2MgKmdj
LCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGUKICAgICAgICAgcmMgPSBk
b19wY2lfYWRkKGdjLCBzdHViZG9taWQsICZwY2lkZXZfcywgMCk7CiAgICAgICAgIGlmICggcmMg
KQogICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIC8qIFdhaXQgZm9yIHRoZSBkZXZpY2Ug
YWN0dWFsbHkgYmVpbmcgY29ubmVjdGVkLCBvdGhlcndpc2UgZGV2aWNlIG1vZGVsCisgICAgICAg
ICAqIHJ1bm5pbmcgdGhlcmUgd2lsbCBmYWlsIHRvIGZpbmQgdGhlIGRldmljZS4gKi8KKyAgICAg
ICAgYmVfcGF0aCA9IGxpYnhsX19zcHJpbnRmKGdjLCAiJXMvYmFja2VuZC9wY2kvJWQvMCIsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2Ms
IDApLCBzdHViZG9taWQpOworICAgICAgICByYyA9IGxpYnhsX193YWl0X2Zvcl9iYWNrZW5kKGdj
LCBiZV9wYXRoLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5U
RigiJWQiLCBYZW5idXNTdGF0ZUNvbm5lY3RlZCkpOworICAgICAgICBpZiAocmMpCisgICAgICAg
ICAgICBnb3RvIG91dDsKICAgICB9CiAKICAgICBvcmlnX3ZkZXYgPSBwY2lkZXYtPnZkZXZmbiAm
IH43VTsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
