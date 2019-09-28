Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF8CC110A
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 16:24:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEDb1-0003ij-E1; Sat, 28 Sep 2019 14:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEDaz-0003iJ-MN
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 14:21:13 +0000
X-Inumbo-ID: 39665e8e-e1fb-11e9-969b-12813bfff9fa
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by localhost (Halon) with ESMTPS
 id 39665e8e-e1fb-11e9-969b-12813bfff9fa;
 Sat, 28 Sep 2019 14:21:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8EDA820A34;
 Sat, 28 Sep 2019 10:21:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 28 Sep 2019 10:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ibdft5z05fi+deOTQfoWvYpaHLXDhNtQVvDJtCVld
 ek=; b=EJcRl8RJQcWWC0vMTt+Tx14LvkuG14LrlIEOFuy8DJsHYdbZ8fG2q2aLg
 H6aDJ/1LJP2q9qjtxugq8ttode4FnxPwveU2XHTDDOE/EC7o7LJ3OtreXIp7vpYs
 qkB9FLpgDPorNCjR/RLdDSe+55aoyaReO+oD5cq9FYY+q5aXjg9TX5Nbh4o+CN7V
 EvvwrNe4d+v53F9TbjdtuAIVs6gAPNk/qKQrIecIhDNMLgkKkM+MxBuTo9pbwqQ/
 y7kXI0tLpGpRUFk5tTQmswiEQWjLChPvbLaEBJe76h3BNFA6kkgPgJUmvjuePW2Y
 KKkhSaDWUoTl3XYgAJed7ZGFUykow==
X-ME-Sender: <xms:WGyPXcdMEp4Bf540tcMzmwEkJOPmv2IkTdPuXR14WYu5NZHnL1l6kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WGyPXR68qg_Q_ZR8hMzkUyIoRhEPiQn9uehaKy9Qn_b39QAA8yaDeg>
 <xmx:WGyPXXVnIMmAcH71Iph7Ci5ZXN6-YavuqGBNcpqTYSBqAUH9k8e-Tg>
 <xmx:WGyPXY6aiHlHXp8n2EToCCSox0RyqI38Wzd8l_IhokZlMl45pt5DEw>
 <xmx:WGyPXVRi9Aa9XAl2GOEhsD47Qr_sZ3T4GJoH58lyWKScGa9ogdI9UA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BFE3D6005E;
 Sat, 28 Sep 2019 10:21:11 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 28 Sep 2019 16:20:34 +0200
Message-Id: <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 1/4] libxl: fix cold plugged PCI device with
 stubdomain
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQoKSBpcyBjYWxsZWQsIHN0dWJkb21haW4gaXMgYWxy
ZWFkeSBydW5uaW5nLApldmVuIHdoZW4gc3RpbGwgY29uc3RydWN0aW5nIHRoZSB0YXJnZXQgZG9t
YWluLiBQcmV2aW91c2x5LCBkb19wY2lfYWRkKCkKd2FzIGNhbGxlZCB3aXRoICdzdGFydGluZycg
aGFyZGNvZGVkIHRvIGZhbHNlLCBidXQgbm93IGRvX3BjaV9hZGQoKSBzaGFyZXMKJ3N0YXJ0aW5n
JyBmbGFnIGluIHBjaV9hZGRfc3RhdGUgZm9yIGJvdGggdGFyZ2V0IGRvbWFpbiBhbmQgc3R1YmRv
bWFpbi4KCkZpeCB0aGlzIGJ5IHJlc2V0dGluZyAobG9jYWwpICdzdGFydGluZycgdG8gZmFsc2Ug
aW4gcGNpX2FkZF9kbV9kb25lKCkKKHByZXZpb3VzbHkgcGFydCBvZiBkb19wY2lfYWRkKCkpIHdo
ZW4gaGFuZGxpbmcgc3R1YmRvbWFpbiwgcmVnYXJkbGVzcwpvZiBwYXMtPnN0YXJ0aW5nIHZhbHVl
LgoKRml4ZXM6IDExZGI1NmY5YTYgKGxpYnhsX3BjaTogVXNlIGxpYnhsX19hb19kZXZpY2Ugd2l0
aCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQpClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9wY2kuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCmluZGV4IDQ3MjU4MTcuLjJlZGZmNjQgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
CkBAIC0xMzAwLDYgKzEzMDAsMTAgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25lKGxpYnhs
X19lZ2MgKmVnYywKIAogICAgIGlmIChyYykgZ290byBvdXQ7CiAKKyAgICAvKiBzdHViZG9tYWlu
IGlzIGFsd2F5cyBydW5uaW5nIGJ5IG5vdywgZXZlbiBhdCBjcmVhdGUgdGltZSAqLworICAgIGlm
IChpc3N0dWJkb20pCisgICAgICAgIHN0YXJ0aW5nID0gZmFsc2U7CisKICAgICBzeXNmc19wYXRo
ID0gR0NTUFJJTlRGKFNZU0ZTX1BDSV9ERVYiLyJQQ0lfQkRGIi9yZXNvdXJjZSIsIHBjaWRldi0+
ZG9tYWluLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5idXMsIHBjaWRldi0+
ZGV2LCBwY2lkZXYtPmZ1bmMpOwogICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOwpAQCAt
MTU1OSw3ICsxNTYzLDYgQEAgdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQobGlieGxfX2VnYyAq
ZWdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgR0NORVcocGNpZGV2X3MpOwogICAgICAgICBs
aWJ4bF9kZXZpY2VfcGNpX2luaXQocGNpZGV2X3MpOwogICAgICAgICBsaWJ4bF9kZXZpY2VfcGNp
X2NvcHkoQ1RYLCBwY2lkZXZfcywgcGNpZGV2KTsKLSAgICAgICAgLyogc3R1YmRvbWFpbiBpcyBh
bHdheXMgcnVubmluZyBieSBub3csIGV2ZW4gYXQgY3JlYXRlIHRpbWUgKi8KICAgICAgICAgcGFz
LT5jYWxsYmFjayA9IGRldmljZV9wY2lfYWRkX3N0dWJkb21fZG9uZTsKICAgICAgICAgZG9fcGNp
X2FkZChlZ2MsIHN0dWJkb21pZCwgcGNpZGV2X3MsIHBhcyk7IC8qIG11c3QgYmUgbGFzdCAqLwog
ICAgICAgICByZXR1cm47Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
