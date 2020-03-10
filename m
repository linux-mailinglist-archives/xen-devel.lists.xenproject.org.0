Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01C180283
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:54:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhAo-0003iM-T4; Tue, 10 Mar 2020 15:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBhAn-0003hw-5Y
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:52:01 +0000
X-Inumbo-ID: 1418c046-62e7-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1418c046-62e7-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 15:52:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9BAC0AE84;
 Tue, 10 Mar 2020 15:51:59 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Message-ID: <f84b99c1-3b9c-2886-5733-845b19c0c1e4@suse.com>
Date: Tue, 10 Mar 2020 16:51:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 8/9] x86/HVM: reduce hvm.h include
 dependencies
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYsIGFuZCBhZGQg
c21hbGxlciBzY29wZQpvbmVzIGluc3RlYWQuIFB1dCB0aGUgb25lcyBuZWVkZWQgaW50byB3aGlj
aGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkKbmVlZCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IEFsc28gbWFrZSB0aGluZ3MgYnVp
bGQgd2l0aCBQVl9TSElNX0VYQ0xVU0lWRT15LgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vZW11bGF0ZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaApAQCAt
MTMsNiArMTMsNyBAQAogI2RlZmluZSBfX0FTTV9YODZfSFZNX0VNVUxBVEVfSF9fCiAKICNpbmNs
dWRlIDx4ZW4vZXJyLmg+CisjaW5jbHVkZSA8eGVuL21tLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9o
dm0uaD4KICNpbmNsdWRlIDxhc20veDg2X2VtdWxhdGUuaD4KIAotLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9odm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApAQCAt
MjAsMTIgKzIwLDExIEBACiAjaWZuZGVmIF9fQVNNX1g4Nl9IVk1fSFZNX0hfXwogI2RlZmluZSBf
X0FTTV9YODZfSFZNX0hWTV9IX18KIAorI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgorI2lu
Y2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgogI2luY2x1
ZGUgPGFzbS94ODZfZW11bGF0ZS5oPgogI2luY2x1ZGUgPGFzbS9odm0vYXNpZC5oPgotI2luY2x1
ZGUgPHB1YmxpYy9kb21jdGwuaD4KLSNpbmNsdWRlIDxwdWJsaWMvaHZtL3NhdmUuaD4KLSNpbmNs
dWRlIDx4ZW4vbW0uaD4KIAogI2lmZGVmIENPTkZJR19IVk1fRkVQCiAvKiBQZXJtaXQgdXNlIG9m
IHRoZSBGb3JjZWQgRW11bGF0aW9uIFByZWZpeCBpbiBIVk0gZ3Vlc3RzICovCkBAIC0zMjYsNiAr
MzI1LDcgQEAgaW50IGh2bV9kZWJ1Z19vcChzdHJ1Y3QgdmNwdSAqdiwgaW50MzJfdAogdm9pZCBo
dm1fdG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IHZjcHUgKnYpOwogdm9pZCBodm1fZmFzdF9zaW5n
bGVzdGVwKHN0cnVjdCB2Y3B1ICp2LCB1aW50MTZfdCBwMm1pZHgpOwogCitzdHJ1Y3QgbnBmZWM7
CiBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9u
ZyBnbGEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbnBmZWMgbnBmZWMp
OwogCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaApAQCAtMTgsNiArMTgsOCBAQAogI2lmbmRlZiBf
X0FTTV9YODZfSFZNX1ZNWF9WTUNTX0hfXwogI2RlZmluZSBfX0FTTV9YODZfSFZNX1ZNWF9WTUNT
X0hfXwogCisjaW5jbHVkZSA8eGVuL21tLmg+CisKIGV4dGVybiB2b2lkIHZtY3NfZHVtcF92Y3B1
KHN0cnVjdCB2Y3B1ICp2KTsKIGV4dGVybiB2b2lkIHNldHVwX3ZtY3NfZHVtcCh2b2lkKTsKIGV4
dGVybiBpbnQgIHZteF9jcHVfdXBfcHJlcGFyZSh1bnNpZ25lZCBpbnQgY3B1KTsKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vdnB0LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dnB0LmgKQEAgLTIxLDYgKzIxLDcgQEAKIAogI2luY2x1ZGUgPHhlbi90aW1lci5oPgogI2luY2x1
ZGUgPHhlbi9saXN0Lmg+CisjaW5jbHVkZSA8eGVuL3J3bG9jay5oPgogI2luY2x1ZGUgPGFzbS9o
dm0vaHZtLmg+CiAKIC8qCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
