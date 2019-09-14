Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD723B2BF4
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 17:42:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9A7V-0001G8-KV; Sat, 14 Sep 2019 15:37:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i9A7U-0001G2-1i
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 15:37:52 +0000
X-Inumbo-ID: 9723e218-d705-11e9-b299-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9723e218-d705-11e9-b299-bc764e2007e4;
 Sat, 14 Sep 2019 15:37:42 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 868FC5AD;
 Sat, 14 Sep 2019 11:37:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 14 Sep 2019 11:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=1A8lEmAUpw019VXdWnEGZkLXEHyBw42z6uUjfYtGZ
 q4=; b=i//iW2w8kwC+rfYeQRdS7TQLwWpx68g0LLh7GP1iwOqH8tKKjyoXA3RAV
 l4uRItXGdAdGvB9r7XH5OrTwYPON1bdYqEw2ICBg5ZhOcn1tRNg41dXD10je/EGp
 WOK7Oj1lCzfDD9JMhbdT1NzqVq/ViRFK6FfaLBRQsT7NxdZ06c8PEdILyFDZQN+4
 m/+AqF+T1vW1NipeWaj2J83b1usqQ7rwXKV44DShfkeyMathV5HY20+ChIIZenFT
 GMJ9/4S4BFLIqM+PcJlrMDr/tP2wNrFZ6Ge+H88UwtJFD4inPsigayFz/2L/lDU/
 SELgjublczIjI/tfnkSAMTs+QK6FQ==
X-ME-Sender: <xms:RAl9XapBvbqXUG41s1iAcKVOSt1pk44UO-WaaRF2VbUbQeGacYIydg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdelgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvhgvrhhsihho
 nhdrqddqqdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RQl9XQloQoRIT64-zob3TrFM33Wwz-7N89aPA43cjikaVl2nQHZRiQ>
 <xmx:RQl9XWZrsMVm9Y8-AkPaLx-IZm6IeRGUDu3RuqEKbmqpJ7G3yX59-g>
 <xmx:RQl9XQW8hjcggah3i9j1HGXI5pQwsr6DMeaWrYDqs2JVW2-mTAFXVA>
 <xmx:RQl9XQPPW4W3TwGgn31qb_a1tXUygayvkyuiXX05LPa4Fdr_kIvvaw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14A86D6005E;
 Sat, 14 Sep 2019 11:37:39 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 17:37:17 +0200
Message-Id: <e22295e077cc876bddfb6c596efff95eec7d5743.1568475323.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 2/6] libxl: attach PCI device to qemu only
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
