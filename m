Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBF1845C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:16:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiHO-000611-VN; Fri, 13 Mar 2020 11:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiHM-00060t-Sr
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:15:00 +0000
X-Inumbo-ID: e09ac67f-651b-11ea-b2c1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e09ac67f-651b-11ea-b2c1-12813bfff9fa;
 Fri, 13 Mar 2020 11:15:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1C0AAAC7;
 Fri, 13 Mar 2020 11:14:59 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Message-ID: <bc56b6ff-b510-e8ac-4ae7-3a278c10daf9@suse.com>
Date: Fri, 13 Mar 2020 12:15:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 2/9] x86/HVM: reduce vcpu.h include
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUg
b25lcyBuZWVkZWQKaW50byB3aGljaGV2ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Ci0tLQp2MjogUmUtYmFzZSBvdmVyIGNo
YW5nZXMgdG8gcHJldmlvdXMgcGF0Y2guCgotLS0gYS94ZW4vYXJjaC94ODYvY3B1aWQuYworKysg
Yi94ZW4vYXJjaC94ODYvY3B1aWQuYwpAQCAtNyw2ICs3LDcgQEAKICNpbmNsdWRlIDxhc20vaHZt
L2h2bS5oPgogI2luY2x1ZGUgPGFzbS9odm0vbmVzdGVkaHZtLmg+CiAjaW5jbHVkZSA8YXNtL2h2
bS9zdm0vc3ZtLmg+CisjaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogI2luY2x1ZGUgPGFz
bS9odm0vdm14L3ZtY3MuaD4KICNpbmNsdWRlIDxhc20vcGFnaW5nLmg+CiAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKQEAgLTY1LDYgKzY1LDcgQEAKICNpbmNsdWRlIDxhc20vaHZtL25lc3Rl
ZGh2bS5oPgogI2luY2x1ZGUgPGFzbS9odm0vbW9uaXRvci5oPgogI2luY2x1ZGUgPGFzbS9odm0v
aW9yZXEuaD4KKyNpbmNsdWRlIDxhc20vaHZtL3ZpcmlkaWFuLmg+CiAjaW5jbHVkZSA8YXNtL2h2
bS92bV9ldmVudC5oPgogI2luY2x1ZGUgPGFzbS9hbHRwMm0uaD4KICNpbmNsdWRlIDxhc20vbXRy
ci5oPgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vaHlwZXJjYWxsLmMKQEAgLTIzLDYgKzIzLDcgQEAKICNpbmNsdWRlIDx4ZW4vbm9zcGVj
Lmg+CiAKICNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KKyNpbmNsdWRlIDxhc20vaHZtL3Zp
cmlkaWFuLmg+CiAKICNpbmNsdWRlIDxwdWJsaWMvaHZtL2h2bV9vcC5oPgogI2luY2x1ZGUgPHB1
YmxpYy9odm0vcGFyYW1zLmg+Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vcHJpdmF0
ZS5oCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vcHJpdmF0ZS5oCkBAIC00LDYgKzQs
NyBAQAogI2RlZmluZSBYODZfSFZNX1ZJUklESUFOX1BSSVZBVEVfSAogCiAjaW5jbHVkZSA8YXNt
L2h2bS9zYXZlLmg+CisjaW5jbHVkZSA8YXNtL2h2bS92aXJpZGlhbi5oPgogI2luY2x1ZGUgPHB1
YmxpYy9odm0vcGFyYW1zLmg+CiAKIGludCB2aXJpZGlhbl9zeW5pY193cm1zcihzdHJ1Y3QgdmNw
dSAqdiwgdWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpOwotLS0gYS94ZW4vYXJjaC94ODYvbXNy
LmMKKysrIGIveGVuL2FyY2gveDg2L21zci5jCkBAIC0yNSw2ICsyNSw3IEBACiAjaW5jbHVkZSA8
eGVuL3NjaGVkLmg+CiAKICNpbmNsdWRlIDxhc20vZGVidWdyZWcuaD4KKyNpbmNsdWRlIDxhc20v
aHZtL3ZpcmlkaWFuLmg+CiAjaW5jbHVkZSA8YXNtL21zci5oPgogI2luY2x1ZGUgPGFzbS9zZXR1
cC5oPgogCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92Y3B1LmgKQEAgLTIwLDkgKzIwLDcgQEAKICNkZWZpbmUgX19BU01f
WDg2X0hWTV9WQ1BVX0hfXwogCiAjaW5jbHVkZSA8eGVuL3Rhc2tsZXQuaD4KLSNpbmNsdWRlIDxh
c20vaHZtL2lvLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS92bGFwaWMuaD4KLSNpbmNsdWRlIDxhc20v
aHZtL3ZpcmlkaWFuLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS92bXgvdm1jcy5oPgogI2luY2x1ZGUg
PGFzbS9odm0vdm14L3Z2bXguaD4KICNpbmNsdWRlIDxhc20vaHZtL3N2bS92bWNiLmg+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
