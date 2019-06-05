Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9E35501
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 03:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYKiu-00033I-AJ; Wed, 05 Jun 2019 01:28:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pWaW=UE=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hYKis-00033B-Ar
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 01:28:14 +0000
X-Inumbo-ID: 2de3b133-8731-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2de3b133-8731-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 01:28:11 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Wed, 5 Jun 2019 09:25:59 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 5 Jun 2019 09:27:56 +0800
Message-ID: <1559698076-17247-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH v3] xen: make tracebuffer configurable
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

WGVuIGludGVybmFsIHJ1bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxsIGJlIHNhdmVkIHRv
CnRyYWNlIG1lbW9yeSB3aGVuIGVuYWJsZWQuIHRyYWNlIGV2ZW50IGRhdGEgYW5kIGNvbmZpZyBw
YXJhbXMgY2FuIGJlCnJlYWQvY2hhbmdlZCBieSBzeXN0ZW0gY29udHJvbCBoeXBlcmNhbGwgYXQg
cnVuIHRpbWUuCgpDYW4gYmUgZGlzYWJsZWQgZm9yIHNtYWxsZXIgY29kZSBmb290cHJpbnQuCgpT
aWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Ci0tLQog
eGVuL2NvbW1vbi9LY29uZmlnICAgICAgfCAgOSArKysrKysrKysKIHhlbi9jb21tb24vTWFrZWZp
bGUgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi90cmFjZS5oIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2Nv
bmZpZwppbmRleCBjODM4NTA2Li5kOTA4ZmUxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25m
aWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0zNjgsNCArMzY4LDEzIEBAIGNvbmZpZyBE
T00wX01FTQogCiAJICBMZWF2ZSBlbXB0eSBpZiB5b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8gc3Bl
Y2lmeS4KIAorY29uZmlnIFRSQUNFQlVGRkVSCisJYm9vbCAiRW5hYmxlIHRyYWNpbmcgaW5mcmFz
dHJ1Y3R1cmUiICBpZiBFWFBFUlQgPSAieSIKKwlkZWZhdWx0IHkKKwktLS1oZWxwLS0tCisJICBF
bmFibGUgaW4gdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBhbmQgcHJlLWRlZmluZWQgdHJhY2Vwb2lu
dHMgd2l0aGluIFhlbi4KKwkgIFRoaXMgd2lsbCBhbGxvdyBsaXZlIGluZm9ybWF0aW9uIGFib3V0
IFhlbuKAmXMgZXhlY3V0aW9uIGFuZCBwZXJmb3JtYW5jZQorCSAgdG8gYmUgY29sbGVjdGVkIGF0
IHJ1biB0aW1lIGZvciBkZWJ1Z2dpbmcgb3IgcGVyZm9ybWFuY2UgYW5hbHlzaXMuCisJICBNZW1v
cnkgYW5kIGV4ZWN1dGlvbiBvdmVyaGVhZCB3aGVuIG5vdCBhY3RpdmUgaXMgbWluaW1hbC4KKwog
ZW5kbWVudQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9NYWtlZmlsZSBiL3hlbi9jb21tb24vTWFr
ZWZpbGUKaW5kZXggYmNhNDhlNi4uOWZkMWJkMiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9NYWtl
ZmlsZQorKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCkBAIC01Niw3ICs1Niw3IEBAIG9iai15ICs9
IHN5c2N0bC5vCiBvYmoteSArPSB0YXNrbGV0Lm8KIG9iai15ICs9IHRpbWUubwogb2JqLXkgKz0g
dGltZXIubwotb2JqLXkgKz0gdHJhY2Uubworb2JqLSQoQ09ORklHX1RSQUNFQlVGRkVSKSArPSB0
cmFjZS5vCiBvYmoteSArPSB2ZXJzaW9uLm8KIG9iai15ICs9IHZpcnR1YWxfcmVnaW9uLm8KIG9i
ai15ICs9IHZtX2V2ZW50Lm8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oIGIv
eGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKaW5kZXggMTI5NjZlYS4uZmFkOTJjNyAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgK
QEAgLTIxLDEyICsyMSwxOCBAQAogI2lmbmRlZiBfX1hFTl9UUkFDRV9IX18KICNkZWZpbmUgX19Y
RU5fVFJBQ0VfSF9fCiAKKy8qIFB1dCAndGJfaW5pdF9kb25lJyBoZXJlIGJlY2F1c2UgJ2FzbS90
cmFjZS5oJyBtYXkgdXNlIGl0ICovCisjaWZkZWYgQ09ORklHX1RSQUNFQlVGRkVSCiBleHRlcm4g
aW50IHRiX2luaXRfZG9uZTsKKyNlbHNlCisjZGVmaW5lIHRiX2luaXRfZG9uZSBmYWxzZQorI2Vu
ZGlmCiAKICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+CiAjaW5jbHVkZSA8cHVibGljL3RyYWNl
Lmg+CiAjaW5jbHVkZSA8YXNtL3RyYWNlLmg+CiAKKyNpZmRlZiBDT05GSUdfVFJBQ0VCVUZGRVIK
IC8qIFVzZWQgdG8gaW5pdGlhbGlzZSB0cmFjZSBidWZmZXIgZnVuY3Rpb25hbGl0eSAqLwogdm9p
ZCBpbml0X3RyYWNlX2J1ZnModm9pZCk7CiAKQEAgLTQ3LDYgKzUzLDI2IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0cmFjZV92YXIodTMyIGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgZXh0cmEsCiB2b2lk
IF9fdHJhY2VfaHlwZXJjYWxsKHVpbnQzMl90IGV2ZW50LCB1bnNpZ25lZCBsb25nIG9wLAogICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCB4ZW5fdWxvbmdfdCAqYXJncyk7CiAKKyNlbHNlCitz
dGF0aWMgaW5saW5lIHZvaWQgaW5pdF90cmFjZV9idWZzKHZvaWQpIHt9CitzdGF0aWMgaW5saW5l
IGludCB0Yl9jb250cm9sKHN0cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3AgKnRiYykKK3sKKyAgICBy
ZXR1cm4gLUVOT1NZUzsKK30KKworc3RhdGljIGlubGluZSBpbnQgdHJhY2Vfd2lsbF90cmFjZV9l
dmVudCh1aW50MzJfdCBldmVudCkKK3sKKyAgICByZXR1cm4gMDsKK30KKworc3RhdGljIGlubGlu
ZSB2b2lkIHRyYWNlX3Zhcih1aW50MzJfdCBldmVudCwgaW50IGN5Y2xlcywgaW50IGV4dHJhLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7fQor
c3RhdGljIGlubGluZSB2b2lkIF9fdHJhY2VfdmFyKHVpbnQzMl90IGV2ZW50LCBib29sIGN5Y2xl
cywgdW5zaWduZWQgaW50IGV4dHJhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHZvaWQgKmV4dHJhX2RhdGEpIHt9CitzdGF0aWMgaW5saW5lIHZvaWQgX190cmFjZV9oeXBl
cmNhbGwodWludDMyX3QgZXZlbnQsIHVuc2lnbmVkIGxvbmcgb3AsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgeGVuX3Vsb25nX3QgKmFyZ3MpIHt9CisjZW5kaWYK
KwogLyogQ29udmVuaWVuY2UgbWFjcm9zIGZvciBjYWxsaW5nIHRoZSB0cmFjZSBmdW5jdGlvbi4g
Ki8KICNkZWZpbmUgVFJBQ0VfMEQoX2UpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
