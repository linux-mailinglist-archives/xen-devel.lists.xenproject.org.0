Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928F17DF8C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:10:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHBj-0002hc-0X; Mon, 09 Mar 2020 12:07:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBHBh-0002hR-HM
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:07:13 +0000
X-Inumbo-ID: 81f7292b-61fe-11ea-ac18-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81f7292b-61fe-11ea-ac18-12813bfff9fa;
 Mon, 09 Mar 2020 12:07:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 910F6AE19;
 Mon,  9 Mar 2020 12:07:11 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Message-ID: <4f22c250-9ef8-9afb-4fda-868ec08fa767@suse.com>
Date: Mon, 9 Mar 2020 13:07:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/9] x86/HVM: reduce vcpu.h include dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUg
b25lcyBuZWVkZWQKaW50byB3aGljaGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L2NwdWlkLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKQEAgLTcsNiAr
Nyw3IEBACiAjaW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KICNpbmNsdWRlIDxhc20vaHZtL25lc3Rl
ZGh2bS5oPgogI2luY2x1ZGUgPGFzbS9odm0vc3ZtL3N2bS5oPgorI2luY2x1ZGUgPGFzbS9odm0v
dmlyaWRpYW4uaD4KICNpbmNsdWRlIDxhc20vaHZtL3ZteC92bWNzLmg+CiAjaW5jbHVkZSA8YXNt
L3BhZ2luZy5oPgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC02NSw2ICs2NSw3IEBA
CiAjaW5jbHVkZSA8YXNtL2h2bS9uZXN0ZWRodm0uaD4KICNpbmNsdWRlIDxhc20vaHZtL21vbml0
b3IuaD4KICNpbmNsdWRlIDxhc20vaHZtL2lvcmVxLmg+CisjaW5jbHVkZSA8YXNtL2h2bS92aXJp
ZGlhbi5oPgogI2luY2x1ZGUgPGFzbS9odm0vdm1fZXZlbnQuaD4KICNpbmNsdWRlIDxhc20vYWx0
cDJtLmg+CiAjaW5jbHVkZSA8YXNtL210cnIuaD4KLS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBl
cmNhbGwuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jCkBAIC0yMyw2ICsyMyw3
IEBACiAjaW5jbHVkZSA8eGVuL25vc3BlYy5oPgogCiAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0
Lmg+CisjaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogCiBzdGF0aWMgbG9uZyBodm1fbWVt
b3J5X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQogewotLS0g
YS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZpcmlkaWFuL3ByaXZhdGUuaApAQCAtNCw2ICs0LDcgQEAKICNkZWZpbmUgWDg2X0hWTV9W
SVJJRElBTl9QUklWQVRFX0gKIAogI2luY2x1ZGUgPGFzbS9odm0vc2F2ZS5oPgorI2luY2x1ZGUg
PGFzbS9odm0vdmlyaWRpYW4uaD4KIAogaW50IHZpcmlkaWFuX3N5bmljX3dybXNyKHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCk7CiBpbnQgdmlyaWRpYW5fc3luaWNf
cmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgKnZhbCk7
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYworKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKQEAgLTI1
LDYgKzI1LDcgQEAKICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KIAogI2luY2x1ZGUgPGFzbS9kZWJ1
Z3JlZy5oPgorI2luY2x1ZGUgPGFzbS9odm0vdmlyaWRpYW4uaD4KICNpbmNsdWRlIDxhc20vbXNy
Lmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdmNwdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaApAQCAtMjAsOSAr
MjAsNyBAQAogI2RlZmluZSBfX0FTTV9YODZfSFZNX1ZDUFVfSF9fCiAKICNpbmNsdWRlIDx4ZW4v
dGFza2xldC5oPgotI2luY2x1ZGUgPGFzbS9odm0vaW8uaD4KICNpbmNsdWRlIDxhc20vaHZtL3Zs
YXBpYy5oPgotI2luY2x1ZGUgPGFzbS9odm0vdmlyaWRpYW4uaD4KICNpbmNsdWRlIDxhc20vaHZt
L3ZteC92bWNzLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS92bXgvdnZteC5oPgogI2luY2x1ZGUgPGFz
bS9odm0vc3ZtL3ZtY2IuaD4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
