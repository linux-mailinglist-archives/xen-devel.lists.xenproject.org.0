Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55533C8F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 02:48:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXxZl-0002TA-B1; Tue, 04 Jun 2019 00:45:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rj+d=UD=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXxZj-0002T5-Tk
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 00:45:15 +0000
X-Inumbo-ID: 025ac852-8662-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 025ac852-8662-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 00:45:13 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 4 Jun 2019 08:43:00 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Jun 2019 08:44:56 +0800
Message-ID: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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
eGVuL2NvbW1vbi9LY29uZmlnICAgICAgfCAxMiArKysrKysrKysrKysKIHhlbi9jb21tb24vTWFr
ZWZpbGUgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi90cmFjZS5oIHwgMTcgKysrKysrKysr
KysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwpp
bmRleCBjODM4NTA2Li4zNDU5ZjU2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcKKysr
IGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0zNjgsNCArMzY4LDE2IEBAIGNvbmZpZyBET00wX01F
TQogCiAJICBMZWF2ZSBlbXB0eSBpZiB5b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8gc3BlY2lmeS4K
IAorY29uZmlnIFRSQUNFQlVGRkVSCisJYm9vbCAiRW5hYmxlIHRyYWNlIGV2ZW50IGxvZ3MiICBp
ZiBFWFBFUlQgPSAieSIKKwktLS1oZWxwLS0tCisJICBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0
dXModHJhY2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8gdHJhY2UgbWVtb3J5CisJICB3aGVuIGVu
YWJsZWQuIHRyYWNlIGV2ZW50IGRhdGEgYW5kIGNvbmZpZyBwYXJhbXMgY2FuIGJlIHJlYWQvY2hh
bmdlZAorCSAgYnkgc3lzdGVtIGNvbnRyb2wgaHlwZXJjYWxsIGF0IHJ1biB0aW1lLgorCisJICBU
aGlzIGlzIHVzZWQgdG8gcmVjb3JkIHhlbiBpbnRlcm5hbCBydW5uaW5nIHN0YXR1cy4KKwkgIHdp
dGggYSBsaXR0ZSBwZXJmb3JtYW5jZSBvdmVyaGVhZC4KKwkgIENhbiBiZSBzZXQgdG8gJ04nIGlm
IHlvdSBkb250IHdhbnQgdGhpcyBmdW5jdGlvbi4KKwkgIFdoZW4gbm90IGNvbmZpZ3VyZWQsICdY
RU5fU1RTQ1RMX3RidWZfb3AnIGNvbW1hbmQgd2lsbCByZXN1bHQgJ0VOT1NZUycuCisKIGVuZG1l
bnUKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vTWFrZWZpbGUgYi94ZW4vY29tbW9uL01ha2VmaWxl
CmluZGV4IGJjYTQ4ZTYuLjlmZDFiZDIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUK
KysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQpAQCAtNTYsNyArNTYsNyBAQCBvYmoteSArPSBzeXNj
dGwubwogb2JqLXkgKz0gdGFza2xldC5vCiBvYmoteSArPSB0aW1lLm8KIG9iai15ICs9IHRpbWVy
Lm8KLW9iai15ICs9IHRyYWNlLm8KK29iai0kKENPTkZJR19UUkFDRUJVRkZFUikgKz0gdHJhY2Uu
bwogb2JqLXkgKz0gdmVyc2lvbi5vCiBvYmoteSArPSB2aXJ0dWFsX3JlZ2lvbi5vCiBvYmoteSAr
PSB2bV9ldmVudC5vCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdHJhY2UuaCBiL3hlbi9p
bmNsdWRlL3hlbi90cmFjZS5oCmluZGV4IDEyOTY2ZWEuLmRhNzgxZmEgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL3hlbi90cmFjZS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oCkBAIC0y
MSwxMiArMjEsMTUgQEAKICNpZm5kZWYgX19YRU5fVFJBQ0VfSF9fCiAjZGVmaW5lIF9fWEVOX1RS
QUNFX0hfXwogCisjaWZkZWYgQ09ORklHX1RSQUNFQlVGRkVSCiBleHRlcm4gaW50IHRiX2luaXRf
ZG9uZTsKKyNlbmRpZgogCiAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgogI2luY2x1ZGUgPHB1
YmxpYy90cmFjZS5oPgogI2luY2x1ZGUgPGFzbS90cmFjZS5oPgogCisjaWZkZWYgQ09ORklHX1RS
QUNFQlVGRkVSCiAvKiBVc2VkIHRvIGluaXRpYWxpc2UgdHJhY2UgYnVmZmVyIGZ1bmN0aW9uYWxp
dHkgKi8KIHZvaWQgaW5pdF90cmFjZV9idWZzKHZvaWQpOwogCkBAIC00Nyw2ICs1MCwyMCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdHJhY2VfdmFyKHUzMiBldmVudCwgaW50IGN5Y2xlcywgaW50IGV4
dHJhLAogdm9pZCBfX3RyYWNlX2h5cGVyY2FsbCh1aW50MzJfdCBldmVudCwgdW5zaWduZWQgbG9u
ZyBvcCwKICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgeGVuX3Vsb25nX3QgKmFyZ3MpOwog
CisjZWxzZQorI2RlZmluZSB0Yl9pbml0X2RvbmUgZmFsc2UKK3N0YXRpYyBpbmxpbmUgdm9pZCBp
bml0X3RyYWNlX2J1ZnModm9pZCkge30KK3N0YXRpYyBpbmxpbmUgaW50IHRiX2NvbnRyb2woc3Ry
dWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCAqdGJjKSB7IHJldHVybiAtRU5PU1lTOyB9CisKK3N0YXRp
YyBpbmxpbmUgaW50IHRyYWNlX3dpbGxfdHJhY2VfZXZlbnQodWludDMyX3QgZXZlbnQpIHsgcmV0
dXJuIDA7IH0KK3N0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIodWludDMyX3QgZXZlbnQsIGlu
dCBjeWNsZXMsIGludCBleHRyYSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
dm9pZCAqZXh0cmFfZGF0YSkge30KK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3RyYWNlX3Zhcih1aW50
MzJfdCBldmVudCwgYm9vbCBjeWNsZXMsIHVuc2lnbmVkIGludCBleHRyYSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7fQorc3RhdGljIGlu
bGluZSB2b2lkIF9fdHJhY2VfaHlwZXJjYWxsKHVpbnQzMl90IGV2ZW50LCB1bnNpZ25lZCBsb25n
IG9wLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHhlbl91bG9u
Z190ICphcmdzKSB7fQorI2VuZGlmCisKIC8qIENvbnZlbmllbmNlIG1hY3JvcyBmb3IgY2FsbGlu
ZyB0aGUgdHJhY2UgZnVuY3Rpb24uICovCiAjZGVmaW5lIFRSQUNFXzBEKF9lKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
