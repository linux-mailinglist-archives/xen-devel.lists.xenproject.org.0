Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984514EE2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:06:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf9a-0004MD-Pp; Mon, 06 May 2019 15:03:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004Lm-7r
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:41 +0000
X-Inumbo-ID: 1e4c2b40-7010-11e9-8e99-d39ca5764b89
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e4c2b40-7010-11e9-8e99-d39ca5764b89;
 Mon, 06 May 2019 15:03:34 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDDA4136C5;
 Mon,  6 May 2019 11:03:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=j/pJrzCOwItYX2g5i
 YLCnlWTe3eZ4MWUfdEkcvCwSsY=; b=6Ery8UZmLD7b8zuTkTUYeatEQOZsiBWVq
 NYtuDU2FnXdZPIngs/sUvHZY0+oO4wirM3bcF8yAN7/a4yslPyqF6FhjkL4mLZN4
 HVRQP8S8G4GcReLK+k+Tau7ko2vLcFVnbhgD5a0e5xwUiO6AL3B8NtvC4A2t5rMd
 NcrCPwtINc6PXF4BpAoCLov4Oqr2cdKsUEePzayDDa89/HdkUHqfxz5s0PHXuP7N
 Uf8GdHTC3rlMsamblmVwvA8naUSfI6tzLyyvj8yBa9wmGRkPaE7/ubziLmTg8IG3
 H/9Nkpc8Kph989BSfB8prH40x5pe16V8edRg029Pqf93uMO6bHZdg==
X-ME-Sender: <xms:xUzQXF4996An7Ao8SmQYrb0KYXsGaTbavB8yRzGN2QBZknpybxshhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xUzQXICrs0rMQ60uNyi9xCzrI4PygFlX45iB-ll5s7YAKM8xiUbOwQ>
 <xmx:xUzQXDsPRqTUt8ma0Dc52hs0wsbuXOd5wg4cKAAnv5tyh4ofb0EDHQ>
 <xmx:xUzQXFtflRWLM2PK8eeZa-lSwRePL-e39vsNR7yMRjAwxHCeLR6UQw>
 <xmx:xUzQXPjH3XV1awHKPI-p_fBs1THELwehGAguBiMPicIzhpNwElrQbw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBED71037C;
 Mon,  6 May 2019 11:03:31 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 16:50:17 +0200
Message-Id: <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH 1/5] xen/bitmap: fix bitmap_fill with zero-sized
 bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBiaXRtYXBfZmlsbCguLi4sIDApIGlzIGNhbGxlZCwgZG8gbm90IHRyeSB0byB3cml0ZSBh
bnl0aGluZy4gQmVmb3JlCnRoaXMgcGF0Y2gsIGl0IHRyaWVkIHRvIHdyaXRlIGFsbW9zdCBMT05H
X01BWCwgc3VyZWx5IG92ZXJ3cml0aW5nCnNvbWV0aGluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4K
LS0tCkZvdW5kIHdoaWxlIGRlYnVnZ2luZyBmcmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQi4g
SW4gdGhhdCBjYXNlIDMyYml0CnZhcmlhYmxlIGZvciBpdCBvdmVyZmxvd3MgYW5kIGZyYW1lYnVm
ZmVyIGluaXRpYWxpemF0aW9uIHplcm9lZAp1bnJlbGF0ZWQgbWVtb3J5LiBTcGVjaWZpY2FsbHks
IGl0IGhpdCBtYmktPm1vZHNfY291bnQsIHNvIGxhdGVyIG9uCmJpdG1hcF9maWxsKG1vZHVsZV9t
YXAsIG1iaS0+bW9kc19jb3VudCkgaW4gX19zdGFydF94ZW4oKSBjcmFzaGVkLgotLS0KIHhlbi9p
bmNsdWRlL3hlbi9iaXRtYXAuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggYi94ZW4vaW5jbHVkZS94
ZW4vYml0bWFwLmgKaW5kZXggZmUzYzcyMC4uMDQzMGMxYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUveGVuL2JpdG1hcC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaApAQCAtMTI2LDYg
KzEyNiw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBiaXRtYXBfZmlsbCh1bnNpZ25lZCBsb25nICpk
c3QsIGludCBuYml0cykKIAlzaXplX3QgbmxvbmdzID0gQklUU19UT19MT05HUyhuYml0cyk7CiAK
IAlzd2l0Y2ggKG5sb25ncykgeworCWNhc2UgMDoKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJbWVt
c2V0KGRzdCwgLTEsIChubG9uZ3MgLSAxKSAqIHNpemVvZih1bnNpZ25lZCBsb25nKSk7CiAJCS8q
IGZhbGwgdGhyb3VnaCAqLwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
