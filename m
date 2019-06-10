Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5D3AC9E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 03:08:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ha8iU-0003QR-Mw; Mon, 10 Jun 2019 01:03:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y1/0=UJ=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1ha8iT-0003QJ-93
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 01:03:17 +0000
X-Inumbo-ID: 8455306e-8b1b-11e9-bf86-f76a39bc58d7
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8455306e-8b1b-11e9-bf86-f76a39bc58d7;
 Mon, 10 Jun 2019 01:03:13 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 10 Jun 2019 08:59:57 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Jun 2019 09:01:55 +0800
Message-ID: <1560128515-20347-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH v4] xen: make tracebuffer configurable
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIGludGVybmFsIHJ1bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50IGF0IHByZS1kZWZpbmVkIHRy
YWNlIHBvaW50KQp3aWxsIGJlIHNhdmVkIHRvIHRyYWNlIG1lbW9yeSB3aGVuIGVuYWJsZWQuClRy
YWNlIGV2ZW50IGRhdGEgYW5kIGNvbmZpZyBwYXJhbXMgY2FuIGJlIHJlYWQvY2hhbmdlZApieSBz
eXN0ZW0gY29udHJvbCBoeXBlcmNhbGwgYXQgcnVuIHRpbWUuCgpDYW4gYmUgZGlzYWJsZWQgZm9y
IHNtYWxsZXIgY29kZSBmb290cHJpbnQuCgpTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNo
ZW5iYW9kb25nQG14bmF2aS5jb20+Ci0tLQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgfCAgOSAr
KysrKysrKysKIHhlbi9jb21tb24vTWFrZWZpbGUgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hl
bi90cmFjZS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCBjODM4NTA2Li5lY2I4Zjc1IDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBA
IC0zNjgsNCArMzY4LDEzIEBAIGNvbmZpZyBET00wX01FTQogCiAJICBMZWF2ZSBlbXB0eSBpZiB5
b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8gc3BlY2lmeS4KIAorY29uZmlnIFRSQUNFQlVGRkVSCisJ
Ym9vbCAiRW5hYmxlIHRyYWNpbmcgaW5mcmFzdHJ1Y3R1cmUiICBpZiBFWFBFUlQgPSAieSIKKwlk
ZWZhdWx0IHkKKwktLS1oZWxwLS0tCisJICBFbmFibGUgdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBh
bmQgcHJlLWRlZmluZWQgdHJhY2Vwb2ludHMgd2l0aGluIFhlbi4KKwkgIFRoaXMgd2lsbCBhbGxv
dyBsaXZlIGluZm9ybWF0aW9uIGFib3V0IFhlbuKAmXMgZXhlY3V0aW9uIGFuZCBwZXJmb3JtYW5j
ZQorCSAgdG8gYmUgY29sbGVjdGVkIGF0IHJ1biB0aW1lIGZvciBkZWJ1Z2dpbmcgb3IgcGVyZm9y
bWFuY2UgYW5hbHlzaXMuCisJICBNZW1vcnkgYW5kIGV4ZWN1dGlvbiBvdmVyaGVhZCB3aGVuIG5v
dCBhY3RpdmUgaXMgbWluaW1hbC4KKwogZW5kbWVudQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9N
YWtlZmlsZSBiL3hlbi9jb21tb24vTWFrZWZpbGUKaW5kZXggYmNhNDhlNi4uOWZkMWJkMiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCkBA
IC01Niw3ICs1Niw3IEBAIG9iai15ICs9IHN5c2N0bC5vCiBvYmoteSArPSB0YXNrbGV0Lm8KIG9i
ai15ICs9IHRpbWUubwogb2JqLXkgKz0gdGltZXIubwotb2JqLXkgKz0gdHJhY2Uubworb2JqLSQo
Q09ORklHX1RSQUNFQlVGRkVSKSArPSB0cmFjZS5vCiBvYmoteSArPSB2ZXJzaW9uLm8KIG9iai15
ICs9IHZpcnR1YWxfcmVnaW9uLm8KIG9iai15ICs9IHZtX2V2ZW50Lm8KZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi90cmFjZS5oIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKaW5kZXggMTI5
NjZlYS4uZmFkOTJjNyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKQEAgLTIxLDEyICsyMSwxOCBAQAogI2lmbmRlZiBfX1hF
Tl9UUkFDRV9IX18KICNkZWZpbmUgX19YRU5fVFJBQ0VfSF9fCiAKKy8qIFB1dCAndGJfaW5pdF9k
b25lJyBoZXJlIGJlY2F1c2UgJ2FzbS90cmFjZS5oJyBtYXkgdXNlIGl0ICovCisjaWZkZWYgQ09O
RklHX1RSQUNFQlVGRkVSCiBleHRlcm4gaW50IHRiX2luaXRfZG9uZTsKKyNlbHNlCisjZGVmaW5l
IHRiX2luaXRfZG9uZSBmYWxzZQorI2VuZGlmCiAKICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+
CiAjaW5jbHVkZSA8cHVibGljL3RyYWNlLmg+CiAjaW5jbHVkZSA8YXNtL3RyYWNlLmg+CiAKKyNp
ZmRlZiBDT05GSUdfVFJBQ0VCVUZGRVIKIC8qIFVzZWQgdG8gaW5pdGlhbGlzZSB0cmFjZSBidWZm
ZXIgZnVuY3Rpb25hbGl0eSAqLwogdm9pZCBpbml0X3RyYWNlX2J1ZnModm9pZCk7CiAKQEAgLTQ3
LDYgKzUzLDI2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIodTMyIGV2ZW50LCBpbnQg
Y3ljbGVzLCBpbnQgZXh0cmEsCiB2b2lkIF9fdHJhY2VfaHlwZXJjYWxsKHVpbnQzMl90IGV2ZW50
LCB1bnNpZ25lZCBsb25nIG9wLAogICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB4ZW5fdWxv
bmdfdCAqYXJncyk7CiAKKyNlbHNlCitzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF90cmFjZV9idWZz
KHZvaWQpIHt9CitzdGF0aWMgaW5saW5lIGludCB0Yl9jb250cm9sKHN0cnVjdCB4ZW5fc3lzY3Rs
X3RidWZfb3AgKnRiYykKK3sKKyAgICByZXR1cm4gLUVOT1NZUzsKK30KKworc3RhdGljIGlubGlu
ZSBpbnQgdHJhY2Vfd2lsbF90cmFjZV9ldmVudCh1aW50MzJfdCBldmVudCkKK3sKKyAgICByZXR1
cm4gMDsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1aW50MzJfdCBldmVudCwg
aW50IGN5Y2xlcywgaW50IGV4dHJhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCB2b2lkICpleHRyYV9kYXRhKSB7fQorc3RhdGljIGlubGluZSB2b2lkIF9fdHJhY2VfdmFyKHVp
bnQzMl90IGV2ZW50LCBib29sIGN5Y2xlcywgdW5zaWduZWQgaW50IGV4dHJhLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKmV4dHJhX2RhdGEpIHt9CitzdGF0aWMg
aW5saW5lIHZvaWQgX190cmFjZV9oeXBlcmNhbGwodWludDMyX3QgZXZlbnQsIHVuc2lnbmVkIGxv
bmcgb3AsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgeGVuX3Vs
b25nX3QgKmFyZ3MpIHt9CisjZW5kaWYKKwogLyogQ29udmVuaWVuY2UgbWFjcm9zIGZvciBjYWxs
aW5nIHRoZSB0cmFjZSBmdW5jdGlvbi4gKi8KICNkZWZpbmUgVFJBQ0VfMEQoX2UpICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
