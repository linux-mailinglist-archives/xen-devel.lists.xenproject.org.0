Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1414EF5
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf9c-0004Nv-2j; Mon, 06 May 2019 15:03:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004M1-P2
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:41 +0000
X-Inumbo-ID: 21d827a4-7010-11e9-843c-bc764e045a96
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 21d827a4-7010-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:03:40 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 061B613ECE;
 Mon,  6 May 2019 11:03:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PzWno+nCIDVdwD5OP
 R9zT98Rark5n8AGgx+Zt3nVNRg=; b=nBAvcf4ZuJ/qiWlVpxsa6Ts/xGBb4FJSZ
 BKuADe+wMjUJdhw0E0HV2Q/FL9kEyFM6MHQwKQ8ph/QgVuO5i2zbv2b/0mh6GZOe
 rfDlh7suXIiuoMAYxTZkox33dScHiv4gP7ZC17kM8imUvkJNpbEy7hjSVNQ97ip7
 MBOpZtBSp1guiWQORMnkl1cwZurTOh8hwfecFO4M/6FyRLmZt5SG4+rOzJqnTn6t
 vI2vSvOMpJG7xoPBP7CdUaDLju04LWaquHv6ZwekVTILc76ZtAaN+b6y5RipWDO0
 JcABLaQIVlShKmZTKtaOA7LRxU0rfVtgzDI5kpmQGtYpeZh0YVf6g==
X-ME-Sender: <xms:y0zQXGpmXi5HWN0RWKFTbaSXl7DAicRBiMvo47uY0z8iHmt-738yOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:y0zQXD5Cs4GV-Z4sO8IbZAMjSqBVxvsnZ6VBs5CsMnKYwdDphe2KwQ>
 <xmx:y0zQXHFW9BRsYi8tqfoTEp_62tzEGqE_BbU6Q5DoyjZTSuyJaHNVAw>
 <xmx:y0zQXFU0fgUHHtkdIR9BpChw7ojDAxmJ1sGEpTqBt-0TKEjaZcNcQA>
 <xmx:zEzQXIL8W9CZLLal9KgloNdbibs9w6raHwrbDza4IgjkUjmXiP5vIQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54BEE103CA;
 Mon,  6 May 2019 11:03:38 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 16:50:21 +0200
Message-Id: <0463b8875424fc7be3d8ec5610d21439507af325.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH 5/5] drivers/video: use vlfb_info consistently
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

dmxmYl9pbmZvIGlzIGFuIGFsaWFzIGZvciB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIsIHNv
IHRoaXMgY2hhbmdlIGlzCnB1cmVseSBjb3NtZXRpYy4gQnV0IHVzaW5nIHRoZSBzYW1lIG5hbWUg
aGVscHMgcmVhZGluZyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCiB4ZW4vZHJp
dmVycy92aWRlby92ZXNhLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92aWRlby92ZXNhLmMgYi94
ZW4vZHJpdmVycy92aWRlby92ZXNhLmMKaW5kZXggZjIyY2Y3Zi4uMzc2NzAyNCAxMDA2NDQKLS0t
IGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCisrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL3Zlc2Eu
YwpAQCAtNDQsNyArNDQsNyBAQCB2b2lkIF9faW5pdCB2ZXNhX2Vhcmx5X2luaXQodm9pZCkKIHsK
ICAgICB1bnNpZ25lZCBpbnQgdnJhbV92bW9kZTsKIAotICAgIHZnYV9jb21wYXQgPSAhKHZnYV9j
b25zb2xlX2luZm8udS52ZXNhX2xmYi5nYmxfY2FwcyAmIDIpOworICAgIHZnYV9jb21wYXQgPSAh
KHZsZmJfaW5mby5nYmxfY2FwcyAmIDIpOwogCiAgICAgaWYgKCAodmxmYl9pbmZvLmJpdHNfcGVy
X3BpeGVsIDwgOCkgfHwgKHZsZmJfaW5mby5iaXRzX3Blcl9waXhlbCA+IDMyKSApCiAgICAgICAg
IHJldHVybjsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
