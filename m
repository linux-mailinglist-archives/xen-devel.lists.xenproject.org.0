Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E8B2BF5
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 17:42:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9A7p-0001O0-A3; Sat, 14 Sep 2019 15:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i9A7o-0001Ne-2Z
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 15:38:12 +0000
X-Inumbo-ID: 9a56ce6e-d705-11e9-b299-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a56ce6e-d705-11e9-b299-bc764e2007e4;
 Sat, 14 Sep 2019 15:37:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 083AE5AD;
 Sat, 14 Sep 2019 11:37:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 14 Sep 2019 11:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=4/s/jYbsj2ZCPx+BVDqUSheBP4o43d0M+JLSj/Z2G
 WY=; b=rCWoSL88NABwLIrt5o1L1H747T6XM1UXWe0UdHenTMfufvBobiTdREbxx
 Wxwgp1+/HY4WY+670apxn8WhBJi7xqYVGZ+viLNeZQSxSTnZk1fQlKQFoJLGZELu
 Jk+dt1I4wzRuYjQgnoDrWjwprZMhgRgseqaqTIf17whwSGu5/jNLU8b+pSyOQ/WP
 YJUol+4W7QFtdJOOWF0FZWBvyAibSRfaE+04rJEGCRKwxCRZx646PTexSalXZVe3
 +4JS7BxzbbYb6OdnQnEX7W4tXgfP2oTBfuOL8bFgLjRRcXpLEAZ/TKOvy5k7InZL
 +jZNoxFP/5096Jq/IAmT7NRVT9XLw==
X-ME-Sender: <xms:Sgl9XWikBcEH_lHRluhh77EhYUAzvP8Tj5N_SBXS0Y2k8x5f8uXBIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdelgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Sgl9XQXg6eSd8DfkwFDwVG9yQL76xI3j2gzCzcMUpVyyfvNhe8IO-w>
 <xmx:Sgl9XVWv6tevc8CrmbAyEXUNhh57OBuIR4AWO9RYq08w_K5Ck8a4KQ>
 <xmx:Sgl9XQgk_68UXxdp9tqZXreUqXTuVAGoumNCbqkinqXv_bgIUTBYHA>
 <xmx:Sgl9XeSSBItcDpB5ILsDgTRM2O6JwqCqtnWCIBClSZmP6PZrIkuy7g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1175D60057;
 Sat, 14 Sep 2019 11:37:45 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 17:37:21 +0200
Message-Id: <2f61f30aa8d270212506542bda6cdf083a68c069.1568475323.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_interrupt_control
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGxpYnhjIHdyYXBwZXIgZm9yIFBIWVNERVZPUF9pbnRlcnJ1cHRfY29udHJvbCBpbnRyb2R1
Y2VkIGluIHByZXZpb3VzCmNvbW1pdC4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjM6CiAtIG5ldyBwYXRjaApDaGFuZ2VzIGluIHY0OgogLSBhZGp1c3QgZm9yIHVwZGF0ZWQg
cHJldmlvdXMgcGF0Y2gKQ2hhbmdlcyBpbiB2NToKIC0gcmVuYW1lIHRvIFBIWVNERVZPUF9tc2lf
Y29udHJvbCwgYWRqdXN0IGFyZ3VtZW50cwpDaGFuZ2UgaW4gdjY6CiAtIGluaXRpYWxpemUgc3Ry
dWN0IHBoeXNkZXZfaW50ZXJydXB0X2NvbnRyb2wgaW5saW5lLCBkcm9wIHBvaW50bGVzcyByYwog
ICB2YXJpYWJsZQogLSByZW5hbWUgdG8gUEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9sCi0tLQog
dG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggfCAgNiArKysrKysKIHRvb2xzL2xpYnhjL3hj
X3BoeXNkZXYuYyAgICAgIHwgMTUgKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwu
aCBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCmluZGV4IDBmZjZlZDkuLjJhZGIxMTQg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCisrKyBiL3Rvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oCkBAIC0xNjM5LDYgKzE2MzksMTIgQEAgaW50IHhjX3BoeXNk
ZXZfdW5tYXBfcGlycSh4Y19pbnRlcmZhY2UgKnhjaCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwaXJxKTsK
IAoraW50IHhjX3BoeXNkZXZfaW50ZXJydXB0X2NvbnRyb2woeGNfaW50ZXJmYWNlICp4Y2gsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgc2VnLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50IGJ1cywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBkZXZmbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBmbGFn
cyk7CisKIC8qCiAgKiAgTE9HR0lORyBBTkQgRVJST1IgUkVQT1JUSU5HCiAgKi8KZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhjL3hjX3BoeXNkZXYuYyBiL3Rvb2xzL2xpYnhjL3hjX3BoeXNkZXYuYwpp
bmRleCA0NjBhOGU3Li41YWY4Mjk2IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19waHlzZGV2
LmMKKysrIGIvdG9vbHMvbGlieGMveGNfcGh5c2Rldi5jCkBAIC0xMTEsMyArMTExLDE4IEBAIGlu
dCB4Y19waHlzZGV2X3VubWFwX3BpcnEoeGNfaW50ZXJmYWNlICp4Y2gsCiAgICAgcmV0dXJuIHJj
OwogfQogCitpbnQgeGNfcGh5c2Rldl9pbnRlcnJ1cHRfY29udHJvbCh4Y19pbnRlcmZhY2UgKnhj
aCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBzZWcsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgYnVzLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IGRldmZuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IGZsYWdzKQoreworICAgIHN0cnVjdCBwaHlzZGV2X2ludGVycnVwdF9jb250cm9sIG9wID0gewor
ICAgICAgICAuc2VnID0gc2VnLAorICAgICAgICAuYnVzID0gYnVzLAorICAgICAgICAuZGV2Zm4g
PSBkZXZmbiwKKyAgICAgICAgLmZsYWdzID0gZmxhZ3MsCisgICAgfTsKKworICAgIHJldHVybiBk
b19waHlzZGV2X29wKHhjaCwgUEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9sLCAmb3AsIHNpemVv
ZihvcCkpOworfQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
