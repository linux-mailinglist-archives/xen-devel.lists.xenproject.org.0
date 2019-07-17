Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0B6B304
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 03:06:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnYNH-0005eu-31; Wed, 17 Jul 2019 01:04:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnYNE-0005el-R2
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 01:04:48 +0000
X-Inumbo-ID: 6607eb62-a82e-11e9-ac5a-cb9da3a1b495
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6607eb62-a82e-11e9-ac5a-cb9da3a1b495;
 Wed, 17 Jul 2019 01:01:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id CA2003FA;
 Tue, 16 Jul 2019 21:01:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jul 2019 21:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=4TEx41rBDtnAVuYynPevXwnuw1J6hoytIjvxfT36S
 /8=; b=pQ0Ka6Dqlol6W5Cy2p1L3KdFvBRIWRJKihyfJm3QSBfX8t1I26fL/Ucsc
 ou4rhRddxrXHwzDc8Am8P4c9AnJzdBadlB10YTbr8N7Ey7qZbacRDxO3eCpbAz6k
 o5Zt3iOeODGcLb1n+dWyYh7SHkommdCaf0e7QaS/gv9Stka0ZbWjlW6OpSHoLBKM
 Sn6FeBE/NviIt2odnbjEveHnHsa3oBPuZ/132mwaDNO0gYYgSJvaozF+jB3dgERS
 EomS7cKwh3XKn9nv2PTfyUApRKqihDYRz5UNhw5lxVj+FgLKtPXJxkVpsQvtOBnV
 9fGZvS0eXQTl90w7FnhlZ1PEhAOig==
X-ME-Sender: <xms:Y3MuXZtg0gwLfc8k6_snIp_DdI_fKyLKYdHyoCgrV0vxoWVbY5DFDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvhgvrhhsihho
 nhdrqddqqdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Y3MuXWKls-iBN0yiaBVq3jxEgM2qmHXcnV4Um-8KiL8e1URMR5GVGA>
 <xmx:Y3MuXWnRLjZXd8vng1qQHftA1xkywYI9D4zDOGt01GUbKxbnD8djPg>
 <xmx:Y3MuXXLvzCDQwV5SciY-M1kr5cqZHG1jSMdMgAGBO78kZaE3tp8BSA>
 <xmx:Y3MuXfFCnzfg4C-6IZDUalyAaqqWziYopwghWPdfprV9yyqhPLb1qA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64852380089;
 Tue, 16 Jul 2019 21:01:22 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 03:00:40 +0200
Message-Id: <9ced73c8ec8569b90cbdf413e5db2ada5121c973.1563325215.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 2/6] libxl: attach PCI device to qemu only
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
X3BjaS5jCmluZGV4IDdmZmFiODkuLjE4MDg5ZWEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
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
