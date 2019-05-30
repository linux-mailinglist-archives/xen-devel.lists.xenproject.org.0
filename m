Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C842FA32
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 12:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWI7j-0001SQ-FS; Thu, 30 May 2019 10:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8x6=T6=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWI7h-0001SL-KL
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 10:17:25 +0000
X-Inumbo-ID: 1b6ef9b8-82c4-11e9-9d33-73645005e1c7
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b6ef9b8-82c4-11e9-9d33-73645005e1c7;
 Thu, 30 May 2019 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 30 May 2019 18:15:07 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 May 2019 18:17:12 +0800
Message-ID: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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

RGVmYXVsdDogZW5hYmxlZC4KQ2FuIGJlIGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHBy
aW50LgoKU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29t
PgotLS0KIHhlbi9jb21tb24vS2NvbmZpZyAgICAgIHwgIDYgKysrKysrCiB4ZW4vY29tbW9uL01h
a2VmaWxlICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS94ZW4vdHJhY2UuaCB8IDE4ICsrKysrKysr
KysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZp
ZwppbmRleCBjODM4NTA2Li4zYTZlZWM4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcK
KysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0zNjgsNCArMzY4LDEwIEBAIGNvbmZpZyBET00w
X01FTQogCiAJICBMZWF2ZSBlbXB0eSBpZiB5b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8gc3BlY2lm
eS4KIAorY29uZmlnIEhBU19UUkFDRUJVRkZFUgorCWJvb2wgIkVuYWJsZS9EaXNhYmxlIHRyYWNl
YnVmZmVyIgorCWRlZmF1bHQgeQorCS0tLWhlbHAtLS0KKwkgIEVuYWJsZSBvciBkaXNhYmxlIHRy
YWNlYnVmZmVyIGZ1bmN0aW9uLgorCiBlbmRtZW51CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL01h
a2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQppbmRleCBiY2E0OGU2Li44NmM1YmY5IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCisrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKQEAg
LTU2LDcgKzU2LDcgQEAgb2JqLXkgKz0gc3lzY3RsLm8KIG9iai15ICs9IHRhc2tsZXQubwogb2Jq
LXkgKz0gdGltZS5vCiBvYmoteSArPSB0aW1lci5vCi1vYmoteSArPSB0cmFjZS5vCitvYmotJChD
T05GSUdfSEFTX1RSQUNFQlVGRkVSKSArPSB0cmFjZS5vCiBvYmoteSArPSB2ZXJzaW9uLm8KIG9i
ai15ICs9IHZpcnR1YWxfcmVnaW9uLm8KIG9iai15ICs9IHZtX2V2ZW50Lm8KZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKaW5kZXgg
MTI5NjZlYS4uZmIxYTJiYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKQEAgLTIxLDEyICsyMSwxNCBAQAogI2lmbmRlZiBf
X1hFTl9UUkFDRV9IX18KICNkZWZpbmUgX19YRU5fVFJBQ0VfSF9fCiAKLWV4dGVybiBpbnQgdGJf
aW5pdF9kb25lOwogCiAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgogI2luY2x1ZGUgPHB1Ymxp
Yy90cmFjZS5oPgogI2luY2x1ZGUgPGFzbS90cmFjZS5oPgogCisjaWZkZWYgQ09ORklHX0hBU19U
UkFDRUJVRkZFUgorCitleHRlcm4gaW50IHRiX2luaXRfZG9uZTsKIC8qIFVzZWQgdG8gaW5pdGlh
bGlzZSB0cmFjZSBidWZmZXIgZnVuY3Rpb25hbGl0eSAqLwogdm9pZCBpbml0X3RyYWNlX2J1ZnMo
dm9pZCk7CiAKQEAgLTQ3LDYgKzQ5LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIo
dTMyIGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgZXh0cmEsCiB2b2lkIF9fdHJhY2VfaHlwZXJjYWxs
KHVpbnQzMl90IGV2ZW50LCB1bnNpZ25lZCBsb25nIG9wLAogICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB4ZW5fdWxvbmdfdCAqYXJncyk7CiAKKyNlbHNlCisjZGVmaW5lIHRiX2luaXRfZG9u
ZSAoMCkKK3N0YXRpYyBpbmxpbmUgdm9pZCBpbml0X3RyYWNlX2J1ZnModm9pZCkge30KK3N0YXRp
YyBpbmxpbmUgaW50IHRiX2NvbnRyb2woc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCAqdGJjKSB7
IHJldHVybiAtRU5PU1lTOyB9CisKK3N0YXRpYyBpbmxpbmUgaW50IHRyYWNlX3dpbGxfdHJhY2Vf
ZXZlbnQodTMyIGV2ZW50KSB7IHJldHVybiAwOyB9CitzdGF0aWMgaW5saW5lIHZvaWQgdHJhY2Vf
dmFyKHUzMiBldmVudCwgaW50IGN5Y2xlcywgaW50IGV4dHJhLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7fQorc3RhdGljIGlubGluZSB2b2lk
IF9fdHJhY2VfdmFyKHUzMiBldmVudCwgYm9vbF90IGN5Y2xlcywgdW5zaWduZWQgaW50IGV4dHJh
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKmV4dHJhX2RhdGEp
IHt9CitzdGF0aWMgaW5saW5lIHZvaWQgX190cmFjZV9oeXBlcmNhbGwodWludDMyX3QgZXZlbnQs
IHVuc2lnbmVkIGxvbmcgb3AsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgeGVuX3Vsb25nX3QgKmFyZ3MpIHt9CisjZW5kaWYKKwogLyogQ29udmVuaWVuY2UgbWFj
cm9zIGZvciBjYWxsaW5nIHRoZSB0cmFjZSBmdW5jdGlvbi4gKi8KICNkZWZpbmUgVFJBQ0VfMEQo
X2UpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICBkbyB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
