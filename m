Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3F14EF4
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf9b-0004MX-4K; Mon, 06 May 2019 15:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004Ln-8A
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:41 +0000
X-Inumbo-ID: 1fdeec5e-7010-11e9-8459-2f617a146875
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fdeec5e-7010-11e9-8459-2f617a146875;
 Mon, 06 May 2019 15:03:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id BB6B5138DD;
 Mon,  6 May 2019 11:03:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vxIwGkZF0Qh48Fb/X
 4px3qHjXLFIttc6teIFmBO2GJE=; b=FnENpOGlKYBctYnp1wYQLVqE6tNeol2F2
 7Nx8tjzWzgypAtGHZ15yrpCm90ap+gX+belr6k111f/nZXl9S4qlOHvQ4LDmL58q
 5i4wh3gDkri6kxAFO7jZI6PpTokJ1HoOnyanN4IzKKZk42cjYd3E5niEozAtqKCW
 rNWhrrKnwBuhxpZrRCDCAm1F9j7wFrYxFL1xX7MOPZjvQ7LAehlbWtPpmNJ4hi4v
 Y1etqu5Adc1H1m2IqEFQ6daiGy7mBRP7nnuRu4MdylypbRl1uDw8XsKW84MYtl6e
 d0w4gs6Q0vmB+h3nBvC+ectX97Vk5Te+La2rYZjnYlbzWIaatccaA==
X-ME-Sender: <xms:yEzQXL-FRKaK4IQWch7jRRF54j6jEF_s14FFeN-kf9rRIDocbWenPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:yEzQXK-U6H11rpm_nsXdq3Muoks4kuy1r_91flBdkprAb7iZMB9Obg>
 <xmx:yEzQXCcMu03q32w2Ot85CBJ6LbabeYkLl1XSuJghKH01veQOp4gKsA>
 <xmx:yEzQXDGy5JXI1KfbxUPtqJT7zJxhkppV6bI8aRTVzaN6DnOeVGQbRA>
 <xmx:yEzQXHUIBQz-WFkfjkLgXsFnf6b7Jp89og2uLxswAucLskbbe49Z8g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBBC51037C;
 Mon,  6 May 2019 11:03:34 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 16:50:19 +0200
Message-Id: <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH 3/5] drivers/video: Drop framebuffer size
 constraints
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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

VGhlIGxpbWl0IDE5MDB4MTIwMCBkbyBub3QgbWF0Y2ggcmVhbCB3b3JsZCBkZXZpY2VzICgxOTAw
IGxvb2tzIGxpa2UgYQp0eXBvLCBzaG91bGQgYmUgMTkyMCkuIEJ1dCBpbiBwcmFjdGljZSB0aGUg
bGltaXRzIGFyZSBhcmJpdHJhcnkgYW5kIGRvCm5vdCBzZXJ2ZSBhbnkgcmVhbCBwdXJwb3NlLiBB
cyBkaXNjdXNzZWQgaW4gIkluY3JlYXNlIGZyYW1lYnVmZmVyIHNpemUKdG8gdG9kYXlzIHN0YW5k
YXJkcyIgdGhyZWFkLCBkcm9wIHRoZW0gY29tcGxldGVseS4KClRoaXMgZml4ZXMgZ3JhcGhpYyBj
b25zb2xlIG9uIGRldmljZSB3aXRoIDM4NDB4MjE2MCBuYXRpdmUgcmVzb2x1dGlvbi4KClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT4KLS0tCkNjOiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQog
eGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgYi94
ZW4vZHJpdmVycy92aWRlby9sZmIuYwppbmRleCAwNDc1YTY4Li41MDIyMTk1IDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy92aWRlby9sZmIuYworKysgYi94ZW4vZHJpdmVycy92aWRlby9sZmIuYwpA
QCAtMTAsOSArMTAsNiBAQAogI2luY2x1ZGUgImxmYi5oIgogI2luY2x1ZGUgImZvbnQuaCIKIAot
I2RlZmluZSBNQVhfWFJFUyAxOTAwCi0jZGVmaW5lIE1BWF9ZUkVTIDEyMDAKLQogc3RydWN0IGxm
Yl9zdGF0dXMgewogICAgIHN0cnVjdCBsZmJfcHJvcCBsZmJwOwogCkBAIC0xNDYsMTMgKzE0Myw2
IEBAIHZvaWQgbGZiX2NhcnJpYWdlX3JldHVybih2b2lkKQogCiBpbnQgX19pbml0IGxmYl9pbml0
KHN0cnVjdCBsZmJfcHJvcCAqbGZicCkKIHsKLSAgICBpZiAoIGxmYnAtPndpZHRoID4gTUFYX1hS
RVMgfHwgbGZicC0+aGVpZ2h0ID4gTUFYX1lSRVMgKQotICAgIHsKLSAgICAgICAgcHJpbnRrKFhF
TkxPR19XQVJOSU5HICJDb3VsZG4ndCBpbml0aWFsaXplIGEgJXV4JXUgZnJhbWVidWZmZXIgZWFy
bHkuXG4iLAotICAgICAgICAgICAgICAgbGZicC0+d2lkdGgsIGxmYnAtPmhlaWdodCk7Ci0gICAg
ICAgIHJldHVybiAtRUlOVkFMOwotICAgIH0KLQogICAgIGxmYi5sZmJwID0gKmxmYnA7CiAKICAg
ICBsZmIubGJ1ZiA9IHhtYWxsb2NfYnl0ZXMobGZiLmxmYnAuYnl0ZXNfcGVyX2xpbmUpOwotLSAK
Z2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
