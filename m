Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC2C1109
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 16:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEDb4-0003jr-OP; Sat, 28 Sep 2019 14:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEDb3-0003jX-EU
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 14:21:17 +0000
X-Inumbo-ID: 39f16b46-e1fb-11e9-97fb-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by localhost (Halon) with ESMTPS
 id 39f16b46-e1fb-11e9-97fb-bc764e2007e4;
 Sat, 28 Sep 2019 14:21:13 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9149821C1C;
 Sat, 28 Sep 2019 10:21:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 28 Sep 2019 10:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=v7bttf3yQOOR1SZPxB6rw3qy/co3pMgStgeM8sWnq
 as=; b=j0QHtM6cJwEJK8Oe4DumSwdn3mmcdrKRopVeCd1s9dziVLGYGBZcQWXXT
 Zsw4hrxLn5Jsr7J5SaBShaNCNK8/pwPuSp+Zhkquyv6RwQTkqMMxKB69lU6Uawb4
 W5/dGoaPii1XkDyKt1wTKWUjVypokMxdktPLyFCOqeu0OFLUjqmHSyuedMUOn40q
 ng/J9FHp3D3+LDmpW3n4k1YIxrQKea2hQ45FUXo+n9FAIikfS+NHnmbtC8w+qMtw
 cR3J4yHLs/VktJI3uaYdfz8WT9TNN8urBuFkrsgmciUCf3CpoF7T+UIq0o7Uiavn
 Q70cRxtOOuskE+XhYpoYKAmIeq40w==
X-ME-Sender: <xms:WWyPXbsiSKTTXgGsAUaqW3T2DAI1RYGat184NBDXsoB1VCkkECFX6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WWyPXZCyGmi7i5njz_-8xGdmG7nZkGyQtrflTZIhgaoqUOpN8_-8Ew>
 <xmx:WWyPXTOgMUDDsPgVsXB0MChgitfC-IzVTA6s38rK3AtC38f8J8KHhg>
 <xmx:WWyPXRAJiATO6sPkfXttg7q1UxtIRbfjrDxqYrG7YsMKT_wCVypaag>
 <xmx:WWyPXYoAQDSpzAobP7k5HeRlKpNvcWlOVxUZJeELhQZbP21jSEBUAg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8966CD60057;
 Sat, 28 Sep 2019 10:21:12 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 28 Sep 2019 16:20:35 +0200
Message-Id: <38b059a9d0a923c7d3f7eb24b675f6ab43863340.1569680095.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 2/4] libxl: do not attach xen-pciback to HVM
 domain, if stubdomain is in use
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

SFZNIGRvbWFpbnMgdXNlIElPTU1VIGFuZCBkZXZpY2UgbW9kZWwgYXNzaXN0YW5jZSBmb3IgY29t
bXVuaWNhdGluZyB3aXRoClBDSSBkZXZpY2VzLCB4ZW4tcGNpZnJvbnQvcGNpYmFjayBpc24ndCBk
aXJlY3RseSBuZWVkZWQgYnkgSFZNIGRvbWFpbi4KQnV0IHBjaWJhY2sgc2VydmUgYWxzbyBzZWNv
bmQgZnVuY3Rpb24gLSBpdCByZXNldCB0aGUgZGV2aWNlIHdoZW4gaXQgaXMKZGVhc3NpZ25lZCBm
cm9tIHRoZSBndWVzdCBhbmQgZm9yIHRoaXMgcmVhc29uIHBjaWJhY2sgbmVlZHMgdG8gYmUgdXNl
ZAp3aXRoIEhWTSBkb21haW4gdG9vLgpXaGVuIEhWTSBkb21haW4gaGFzIGRldmljZSBtb2RlbCBp
biBzdHViZG9tYWluLCBhdHRhY2hpbmcgeGVuLXBjaWJhY2sgdG8KdGhlIHRhcmdldCBkb21haW4g
aXRzZWxmIG1heSBwcmV2ZW50IGF0dGFjaGluZyB4ZW4tcGNpYmFjayB0byB0aGUKKFBWKSBzdHVi
ZG9tYWluLCBlZmZlY3RpdmVseSBicmVha2luZyBQQ0kgcGFzc3Rocm91Z2guCgpGaXggdGhpcyBi
eSBhdHRhY2hpbmcgcGNpYmFjayBvbmx5IHRvIG9uZSBkb21haW46IGlmIFBWIHN0dWJkb21haW4g
aXMgaW4KdXNlLCBsZXQgaXQgYmUgc3R1YmRvbWFpbiAodGhlIGNvbW1pdCBwcmV2ZW50cyBhdHRh
Y2hpbmcgZGV2aWNlIHRvIHRhcmdldApIVk0gaW4gdGhpcyBjYXNlKTsgb3RoZXJ3aXNlLCBhdHRh
Y2ggaXQgdG8gdGhlIHRhcmdldCBkb21haW4uCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkFja2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKIC0gcHJl
dmlvdXNseSBjYWxsZWQgImxpYnhsOiBhdHRhY2ggeGVuLXBjaWJhY2sgb25seSB0byBQViBkb21h
aW5zIgogLSBpbnN0ZWFkIG9mIGV4Y2x1ZGluZyBhbGwgSFZNcywgY2hhbmdlIHRoZSBjb25kaXRp
b24gdG8gd2hhdCBhY3R1YWxseQogICBtYXR0ZXJzIGhlcmUgLSBjaGVjayBpZiBzdHViZG9tYWlu
IGlzIGluIHVzZTsgdGhpcyB3YXkgeGVuLXBjaWJhY2sgaXMKICAgYWx3YXlzIGluIHVzZSAoZWl0
aGVyIGZvciB0aGUgdGFyZ2V0IGRvbWFpbiwgb3IgaXQncyBzdHViZG9tYWluKSwKICAgZml4aW5n
IFBDSSByZXNldCBieSB4ZW4tcGNpYmFjayBjb25jZXJucwpDaGFuZ2VzIGluIHYzOgogLSBhZGp1
c3QgY29tbWl0IG1lc3NhZ2UKQ2hhbmdlcyBpbiB2ODoKIC0gcmViYXNlIG9uIHN0YWdpbmcKLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCmluZGV4IDJlZGZmNjQuLmFjNTk3YTUg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX3BjaS5jCkBAIC0xMzk5LDcgKzEzOTksNyBAQCBvdXRfbm9faXJxOgogICAgICAgICB9CiAg
ICAgfQogCi0gICAgaWYgKCFzdGFydGluZykKKyAgICBpZiAoIXN0YXJ0aW5nICYmICFsaWJ4bF9n
ZXRfc3R1YmRvbV9pZChDVFgsIGRvbWlkKSkKICAgICAgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3Bj
aV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lkZXYsIHN0YXJ0aW5nKTsKICAgICBlbHNlCiAg
ICAgICAgIHJjID0gMDsKQEAgLTE2OTcsNyArMTY5Nyw3IEBAIHN0YXRpYyB2b2lkIGFkZF9wY2lk
ZXZzX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fbXVsdGlkZXYgKm11bHRpZGV2LAogICAg
IGxpYnhsX2RvbWlkIGRvbWlkID0gYXBkcy0+ZG9taWQ7CiAgICAgbGlieGxfX2FvX2RldmljZSAq
YW9kZXYgPSBhcGRzLT5vdXRlcl9hb2RldjsKIAotICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRl
dnMgPiAwKSB7CisgICAgaWYgKGRfY29uZmlnLT5udW1fcGNpZGV2cyA+IDAgJiYgIWxpYnhsX2dl
dF9zdHViZG9tX2lkKENUWCwgZG9taWQpKSB7CiAgICAgICAgIHJjID0gbGlieGxfX2NyZWF0ZV9w
Y2lfYmFja2VuZChnYywgZG9taWQsIGRfY29uZmlnLT5wY2lkZXZzLAogICAgICAgICAgICAgZF9j
b25maWctPm51bV9wY2lkZXZzKTsKICAgICAgICAgaWYgKHJjIDwgMCkgewotLSAKZ2l0LXNlcmll
cyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
