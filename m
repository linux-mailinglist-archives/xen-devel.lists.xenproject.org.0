Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584066B2FB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 03:04:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnYK6-00055Z-Ig; Wed, 17 Jul 2019 01:01:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnYK4-00055O-Fp
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 01:01:32 +0000
X-Inumbo-ID: 695ccef4-a82e-11e9-aa66-8bb310a9bfcd
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 695ccef4-a82e-11e9-aa66-8bb310a9bfcd;
 Wed, 17 Jul 2019 01:01:30 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8BD4D3EB;
 Tue, 16 Jul 2019 21:01:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jul 2019 21:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=SnT1nCoHjJFRhs+EcWdbFq47ZHj0OL2KgdeM1Eytu
 WI=; b=opmNLfG8MI8BJSyYEkKxko6Hfo2o9oPCMhQYhd1Ev+mGCbmufZABZ/fz9
 IYu15kM2Bpej9VPF//OAHaz/J4unp0lwLhgibvcY6CK2DwPEC+5kHNgTJxbLAEXK
 CH1P9Lgdzqog+U0ndMoKb3mTUubCWkneD2jXnCTv4JcSJKx0+6drjWfBIwboPxI1
 xbQDIojXMcuU46NCTj67NndZ37vaLcDkHewxWwog/h94IWKN8Z8+EgCiWACIhUWY
 9Ygsb2Kfa5YXI8msaUqvT/wV1jaP4lwYstmAb/xWNZrUUqeX2MxXI/OKjh9e2423
 8Ct3q+w+Xybc3+0xxIylAMQ0de+PA==
X-ME-Sender: <xms:aXMuXau-rRvzTZuHnizIGr3MpU3-iOOW7G2bC6D4yiNENKAgAvAOfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:aXMuXXsrUMU3PWCPyknEZNLZsWiZl5DBPCUwLS3e7EcQh3pI2Od1Og>
 <xmx:aXMuXTloAVHVCYeeMTegDPXK9ZUcUvEYUmXGJRd-pq1EwnLmS24_kw>
 <xmx:aXMuXaLaoZgQcPYwJMTcDlwp9XTELNbxECYs6Yim2PP4lu0WWdrCDw>
 <xmx:aXMuXcc_ElZTQFX-rOUJ0yHdO5kKWNBE0f_GTA2J-qG4kso46or4cQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5302F38008D;
 Tue, 16 Jul 2019 21:01:28 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 03:00:44 +0200
Message-Id: <5c8fb8141c0f92ccaa78cdc169b8544f7634ce65.1563325215.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_msi_control
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

QWRkIGxpYnhjIHdyYXBwZXIgZm9yIFBIWVNERVZPUF9tc2lfY29udHJvbCBpbnRyb2R1Y2VkIGlu
IHByZXZpb3VzCmNvbW1pdC4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6
CiAtIG5ldyBwYXRjaApDaGFuZ2VzIGluIHY0OgogLSBhZGp1c3QgZm9yIHVwZGF0ZWQgcHJldmlv
dXMgcGF0Y2gKQ2hhbmdlcyBpbiB2NToKIC0gcmVuYW1lIHRvIFBIWVNERVZPUF9tc2lfY29udHJv
bCwgYWRqdXN0IGFyZ3VtZW50cwotLS0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwg
IDYgKysrKysrCiB0b29scy9saWJ4Yy94Y19waHlzZGV2LmMgICAgICB8IDE5ICsrKysrKysrKysr
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5j
dHJsLmgKaW5kZXggNTM4MDA3YS4uODI2ZDEwZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmgKKysrIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKQEAgLTE2
MzgsNiArMTYzOCwxMiBAQCBpbnQgeGNfcGh5c2Rldl91bm1hcF9waXJxKHhjX2ludGVyZmFjZSAq
eGNoLAogICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50IHBpcnEpOwogCitpbnQgeGNfcGh5c2Rldl9tc2lfY29udHJv
bCh4Y19pbnRlcmZhY2UgKnhjaCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBzZWcs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgYnVzLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IGRldmZuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGZsYWdz
KTsKKwogLyoKICAqICBMT0dHSU5HIEFORCBFUlJPUiBSRVBPUlRJTkcKICAqLwpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGMveGNfcGh5c2Rldi5jIGIvdG9vbHMvbGlieGMveGNfcGh5c2Rldi5jCmlu
ZGV4IDQ2MGE4ZTcuLmEyNWExMTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3BoeXNkZXYu
YworKysgYi90b29scy9saWJ4Yy94Y19waHlzZGV2LmMKQEAgLTExMSwzICsxMTEsMjIgQEAgaW50
IHhjX3BoeXNkZXZfdW5tYXBfcGlycSh4Y19pbnRlcmZhY2UgKnhjaCwKICAgICByZXR1cm4gcmM7
CiB9CiAKK2ludCB4Y19waHlzZGV2X21zaV9jb250cm9sKHhjX2ludGVyZmFjZSAqeGNoLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IHNlZywKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBidXMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZGV2Zm4sCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgZmxhZ3MpCit7CisgICAgaW50IHJjOworICAgIHN0
cnVjdCBwaHlzZGV2X21zaV9jb250cm9sIG9wOworCisgICAgbWVtc2V0KCZvcCwgMCwgc2l6ZW9m
KHN0cnVjdCBwaHlzZGV2X21zaV9jb250cm9sKSk7CisgICAgb3Auc2VnID0gc2VnOworICAgIG9w
LmJ1cyA9IGJ1czsKKyAgICBvcC5kZXZmbiA9IGRldmZuOworICAgIG9wLmZsYWdzID0gZmxhZ3M7
CisKKyAgICByYyA9IGRvX3BoeXNkZXZfb3AoeGNoLCBQSFlTREVWT1BfbXNpX2NvbnRyb2wsICZv
cCwgc2l6ZW9mKG9wKSk7CisKKyAgICByZXR1cm4gcmM7Cit9Ci0tIApnaXQtc2VyaWVzIDAuOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
