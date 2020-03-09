Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2117DF9C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:13:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHFd-000436-7M; Mon, 09 Mar 2020 12:11:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBHFb-00042c-Ny
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:11:15 +0000
X-Inumbo-ID: 128f37de-61ff-11ea-ac1a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 128f37de-61ff-11ea-ac1a-12813bfff9fa;
 Mon, 09 Mar 2020 12:11:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C845B454;
 Mon,  9 Mar 2020 12:11:13 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Message-ID: <63f27503-0cbf-7ac3-a3b1-3b2c7f3fc484@suse.com>
Date: Mon, 9 Mar 2020 13:11:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 8/9] x86/HVM: reduce hvm.h include dependencies
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

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYsIGFuZCBhZGQg
c21hbGxlciBzY29wZQpvbmVzIGluc3RlYWQuIFB1dCB0aGUgb25lcyBuZWVkZWQgaW50byB3aGlj
aGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkKbmVlZCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
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
OwogCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZwdC5oCkBAIC0yMSw2ICsyMSw3IEBACiAKICNpbmNsdWRlIDx4ZW4vdGlt
ZXIuaD4KICNpbmNsdWRlIDx4ZW4vbGlzdC5oPgorI2luY2x1ZGUgPHhlbi9yd2xvY2suaD4KICNp
bmNsdWRlIDxhc20vaHZtL2h2bS5oPgogCiAvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
