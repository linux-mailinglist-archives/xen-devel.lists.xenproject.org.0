Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597219312
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2V-000670-83; Thu, 09 May 2019 19:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2U-00066q-Bt
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:10 +0000
X-Inumbo-ID: 819ffbc4-7293-11e9-93fb-53c225e2bcf5
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819ffbc4-7293-11e9-93fb-53c225e2bcf5;
 Thu, 09 May 2019 19:49:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 23724261AE;
 Thu,  9 May 2019 15:49:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+SF0FkQdajCUtphJn
 lcTGK89e836Pf6YLxX7ZQjBaA0=; b=nCtuuH2LkHIY5AwIFpmT3wIJNN7GQzC4Z
 ujYpZUnpOPA3KqmbKlDR+RPKoQVLpBBe0AQpjJNE88M/Vnkx/w3SIOJYu/1rp4L3
 4FCuFY4I/2zNxpvIEVGqblBzHGePbhuJ0mhEcr6L3UmSgMpxjJYh8wpsFksITVtn
 jeW8U1bzkLiCHW7Xn5xgSggXalznFaUygRQNhaZKGXzgNll5Ouc98+66mSBSYWMi
 qAEeXAkGKVHauBYtxbewbNAzWQR6bJ3b+1onoToKGffZ535PW5bkJPKL96bRbKtD
 bWzwqvF4GxsjzYxZXgjnrvN5vvEK6lRodjWYn9Hp+B2n1I6+xGWlA==
X-ME-Sender: <xms:MoTUXLjgHUyd-uwxptpXAzOVO_jvatkV6ksbcUuBg5hCBPcBW15BVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:M4TUXBVuK96cgP_jeFoHdJG4HX9Swzcutr55Eqs2wp0Ku7VMSiQ-LA>
 <xmx:M4TUXCWMNrWnEq3-mdEX9Iy-NxN2Yf4zl6Sw5JhM90_JPku2xBHQgw>
 <xmx:M4TUXJgIbwGvKBLoQntVQ8Zr9Y6t2lIepevPFw3EDfS_MDltkAbeNQ>
 <xmx:M4TUXIZidZ71yssnLIOx7lq1drdPqC9ESFRAvvfc36DSF52TC3L3hA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54822103D2;
 Thu,  9 May 2019 15:49:05 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:54 +0200
Message-Id: <3126f6f2fa19be61319ea922243fddd7ae87e958.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH v2 3/5] drivers/video: Drop framebuffer size
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
dGhpbmdzbGFiLmNvbT4KU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgot
LS0KQ2M6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0tCiB4ZW4vZHJpdmVycy92aWRl
by9sZmIuYyB8IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92aWRlby9sZmIuYyBiL3hlbi9kcml2ZXJzL3ZpZGVv
L2xmYi5jCmluZGV4IDA0NzVhNjguLjUwMjIxOTUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Zp
ZGVvL2xmYi5jCisrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL2xmYi5jCkBAIC0xMCw5ICsxMCw2IEBA
CiAjaW5jbHVkZSAibGZiLmgiCiAjaW5jbHVkZSAiZm9udC5oIgogCi0jZGVmaW5lIE1BWF9YUkVT
IDE5MDAKLSNkZWZpbmUgTUFYX1lSRVMgMTIwMAotCiBzdHJ1Y3QgbGZiX3N0YXR1cyB7CiAgICAg
c3RydWN0IGxmYl9wcm9wIGxmYnA7CiAKQEAgLTE0NiwxMyArMTQzLDYgQEAgdm9pZCBsZmJfY2Fy
cmlhZ2VfcmV0dXJuKHZvaWQpCiAKIGludCBfX2luaXQgbGZiX2luaXQoc3RydWN0IGxmYl9wcm9w
ICpsZmJwKQogewotICAgIGlmICggbGZicC0+d2lkdGggPiBNQVhfWFJFUyB8fCBsZmJwLT5oZWln
aHQgPiBNQVhfWVJFUyApCi0gICAgewotICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIkNv
dWxkbid0IGluaXRpYWxpemUgYSAldXgldSBmcmFtZWJ1ZmZlciBlYXJseS5cbiIsCi0gICAgICAg
ICAgICAgICBsZmJwLT53aWR0aCwgbGZicC0+aGVpZ2h0KTsKLSAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Ci0gICAgfQotCiAgICAgbGZiLmxmYnAgPSAqbGZicDsKIAogICAgIGxmYi5sYnVmID0geG1h
bGxvY19ieXRlcyhsZmIubGZicC5ieXRlc19wZXJfbGluZSk7Ci0tIApnaXQtc2VyaWVzIDAuOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
