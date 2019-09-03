Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A3A65DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55HC-0005qm-LG; Tue, 03 Sep 2019 09:39:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55HB-0005qd-PX
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:39:01 +0000
X-Inumbo-ID: a72d1b5a-ce2e-11e9-ab8c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a72d1b5a-ce2e-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 09:38:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEFEFABED;
 Tue,  3 Sep 2019 09:38:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Message-ID: <6509fa84-bc33-6de4-5ce8-eb371b782f0a@suse.com>
Date: Tue, 3 Sep 2019 11:39:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 3/8] x86emul: generalize invlpg() hook
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGhvb2sgaXMgYWxyZWFkeSBpbiB1c2UgZm9yIElOVkxQR0EgYXMgd2VsbC4gUmVuYW1lIHRo
ZSBob29rIGFuZCBhZGQKcGFyYW1ldGVycy4gRm9yIHRoZSBtb21lbnQgSU5WTFBHQSB3aXRoIGEg
bm9uLXplcm8gQVNJRCByZW1haW5zCnVuc3VwcG9ydGVkLCBidXQgdGhlIFRPRE8gaXRlbSBnZXRz
IHB1c2hlZCBpbnRvIHRoZSBhY3R1YWwgaG9vayBoYW5kbGVyLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQp2MjogTmV3LgoKLS0tIGEvdG9vbHMvZnV6ei94ODZf
aW5zdHJ1Y3Rpb25fZW11bGF0b3IvZnV6ei1lbXVsLmMKKysrIGIvdG9vbHMvZnV6ei94ODZfaW5z
dHJ1Y3Rpb25fZW11bGF0b3IvZnV6ei1lbXVsLmMKQEAgLTM3MCwxNiArMzcwLDIzIEBAIHN0YXRp
YyBpbnQgZnV6el9jbXB4Y2hnKAogICAgIHJldHVybiBtYXliZV9mYWlsKGN0eHQsICJjbXB4Y2hn
IiwgdHJ1ZSk7CiB9CiAKLXN0YXRpYyBpbnQgZnV6el9pbnZscGcoCi0gICAgZW51bSB4ODZfc2Vn
bWVudCBzZWcsCi0gICAgdW5zaWduZWQgbG9uZyBvZmZzZXQsCitzdGF0aWMgaW50IGZ1enpfdGxi
X29wKAorICAgIGVudW0geDg2ZW11bF90bGJfb3Agb3AsCisgICAgdW5zaWduZWQgbG9uZyBhZGRy
LAorICAgIHVuc2lnbmVkIGxvbmcgYXV4LAogICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpj
dHh0KQogewotICAgIC8qIGludmxwZygpLCB1bmxpa2UgYWxsIG90aGVyIGhvb2tzLCBtYXkgYmUg
Y2FsbGVkIHdpdGggeDg2X3NlZ19ub25lLiAqLwotICAgIGFzc2VydChpc194ODZfdXNlcl9zZWdt
ZW50KHNlZykgfHwgc2VnID09IHg4Nl9zZWdfbm9uZSk7Ci0gICAgYXNzZXJ0KGN0eHQtPmFkZHJf
c2l6ZSA9PSA2NCB8fCAhKG9mZnNldCA+PiAzMikpOworICAgIHN3aXRjaCAoIG9wICkKKyAgICB7
CisgICAgY2FzZSB4ODZlbXVsX2ludmxwZzoKKyAgICAgICAgYXNzZXJ0KGlzX3g4Nl91c2VyX3Nl
Z21lbnQoYXV4KSk7CisgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLworICAgIGNhc2UgeDg2ZW11
bF9pbnZscGdhOgorICAgICAgICBhc3NlcnQoY3R4dC0+YWRkcl9zaXplID09IDY0IHx8ICEoYWRk
ciA+PiAzMikpOworICAgICAgICBicmVhazsKKyAgICB9CiAKLSAgICByZXR1cm4gbWF5YmVfZmFp
bChjdHh0LCAiaW52bHBnIiwgZmFsc2UpOworICAgIHJldHVybiBtYXliZV9mYWlsKGN0eHQsICJU
TEItbWFuYWdlbWVudCIsIGZhbHNlKTsKIH0KIAogc3RhdGljIGludCBmdXp6X2NhY2hlX29wKApA
QCAtNjI0LDcgKzYzMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeDg2X2VtdWxhdGVfb3BzIGFs
bF8KICAgICBTRVQocmVhZF9tc3IpLAogICAgIFNFVCh3cml0ZV9tc3IpLAogICAgIFNFVChjYWNo
ZV9vcCksCi0gICAgU0VUKGludmxwZyksCisgICAgU0VUKHRsYl9vcCksCiAgICAgLmdldF9mcHUg
ICAgPSBlbXVsX3Rlc3RfZ2V0X2ZwdSwKICAgICAucHV0X2ZwdSAgICA9IGVtdWxfdGVzdF9wdXRf
ZnB1LAogICAgIC5jcHVpZCAgICAgID0gZW11bF90ZXN0X2NwdWlkLApAQCAtNzMzLDEyICs3NDAs
MTIgQEAgZW51bSB7CiAgICAgSE9PS19yZWFkX21zciwKICAgICBIT09LX3dyaXRlX21zciwKICAg
ICBIT09LX2NhY2hlX29wLAorICAgIEhPT0tfdGxiX29wLAogICAgIEhPT0tfY3B1aWQsCiAgICAg
SE9PS19pbmplY3RfaHdfZXhjZXB0aW9uLAogICAgIEhPT0tfaW5qZWN0X3N3X2ludGVycnVwdCwK
ICAgICBIT09LX2dldF9mcHUsCiAgICAgSE9PS19wdXRfZnB1LAotICAgIEhPT0tfaW52bHBnLAog
ICAgIEhPT0tfdm1mdW5jLAogICAgIENBTk9OSUNBTElaRV9yaXAsCiAgICAgQ0FOT05JQ0FMSVpF
X3JzcCwKQEAgLTc3Nyw5ICs3ODQsOSBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX2hvb2tzKHN0cnVj
dCB4ODZfZW11CiAgICAgTUFZQkVfRElTQUJMRV9IT09LKHJlYWRfbXNyKTsKICAgICBNQVlCRV9E
SVNBQkxFX0hPT0sod3JpdGVfbXNyKTsKICAgICBNQVlCRV9ESVNBQkxFX0hPT0soY2FjaGVfb3Ap
OworICAgIE1BWUJFX0RJU0FCTEVfSE9PSyh0bGJfb3ApOwogICAgIE1BWUJFX0RJU0FCTEVfSE9P
SyhjcHVpZCk7CiAgICAgTUFZQkVfRElTQUJMRV9IT09LKGdldF9mcHUpOwotICAgIE1BWUJFX0RJ
U0FCTEVfSE9PSyhpbnZscGcpOwogfQogCiAvKgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxh
dGUuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwpAQCAtMjM1NiwzNiArMjM1Niw1
MiBAQCBzdGF0aWMgdm9pZCBodm1lbXVsX3B1dF9mcHUoCiAgICAgfQogfQogCi1zdGF0aWMgaW50
IGh2bWVtdWxfaW52bHBnKAotICAgIGVudW0geDg2X3NlZ21lbnQgc2VnLAotICAgIHVuc2lnbmVk
IGxvbmcgb2Zmc2V0LAorc3RhdGljIGludCBodm1lbXVsX3RsYl9vcCgKKyAgICBlbnVtIHg4NmVt
dWxfdGxiX29wIG9wLAorICAgIHVuc2lnbmVkIGxvbmcgYWRkciwKKyAgICB1bnNpZ25lZCBsb25n
IGF1eCwKICAgICBzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKIHsKICAgICBzdHJ1Y3Qg
aHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0ID0KICAgICAgICAgY29udGFpbmVyX29mKGN0
eHQsIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0LCBjdHh0KTsKLSAgICB1bnNpZ25lZCBsb25nIGFk
ZHI7Ci0gICAgaW50IHJjOwotCi0gICAgcmMgPSBodm1lbXVsX3ZpcnR1YWxfdG9fbGluZWFyKAot
ICAgICAgICBzZWcsIG9mZnNldCwgMSwgTlVMTCwgaHZtX2FjY2Vzc19ub25lLCBodm1lbXVsX2N0
eHQsICZhZGRyKTsKKyAgICBpbnQgcmMgPSBYODZFTVVMX09LQVk7CiAKLSAgICBpZiAoIHJjID09
IFg4NkVNVUxfRVhDRVBUSU9OICkKKyAgICBzd2l0Y2ggKCBvcCApCiAgICAgewotICAgICAgICAv
KgotICAgICAgICAgKiBgaW52bHBnYCB0YWtlcyBzZWdtZW50IGJhc2VzIGludG8gYWNjb3VudCwg
YnV0IGlzIG5vdCBzdWJqZWN0IHRvCi0gICAgICAgICAqIGZhdWx0cyBmcm9tIHNlZ21lbnQgdHlw
ZS9saW1pdCBjaGVja3MsIGFuZCBpcyBzcGVjaWZpZWQgYXMgYSBOT1AKLSAgICAgICAgICogd2hl
biBpc3N1ZWQgb24gbm9uLWNhbm9uaWNhbCBhZGRyZXNzZXMuCi0gICAgICAgICAqCi0gICAgICAg
ICAqIGh2bWVtdWxfdmlydHVhbF90b19saW5lYXIoKSByYWlzZXMgZXhjZXB0aW9ucyBmb3IgdHlw
ZS9saW1pdAotICAgICAgICAgKiB2aW9sYXRpb25zLCBzbyBzcXVhc2ggdGhlbS4KLSAgICAgICAg
ICovCi0gICAgICAgIHg4Nl9lbXVsX3Jlc2V0X2V2ZW50KGN0eHQpOwotICAgICAgICByYyA9IFg4
NkVNVUxfT0tBWTsKKyAgICBjYXNlIHg4NmVtdWxfaW52bHBnOgorICAgICAgICByYyA9IGh2bWVt
dWxfdmlydHVhbF90b19saW5lYXIoYXV4LCBhZGRyLCAxLCBOVUxMLCBodm1fYWNjZXNzX25vbmUs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1lbXVsX2N0eHQsICZh
ZGRyKTsKKworICAgICAgICBpZiAoIHJjID09IFg4NkVNVUxfRVhDRVBUSU9OICkKKyAgICAgICAg
eworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIGBpbnZscGdgIHRha2VzIHNlZ21lbnQg
YmFzZXMgaW50byBhY2NvdW50LCBidXQgaXMgbm90IHN1YmplY3QKKyAgICAgICAgICAgICAqIHRv
IGZhdWx0cyBmcm9tIHNlZ21lbnQgdHlwZS9saW1pdCBjaGVja3MsIGFuZCBpcyBzcGVjaWZpZWQg
YXMKKyAgICAgICAgICAgICAqIGEgTk9QIHdoZW4gaXNzdWVkIG9uIG5vbi1jYW5vbmljYWwgYWRk
cmVzc2VzLgorICAgICAgICAgICAgICoKKyAgICAgICAgICAgICAqIGh2bWVtdWxfdmlydHVhbF90
b19saW5lYXIoKSByYWlzZXMgZXhjZXB0aW9ucyBmb3IgdHlwZS9saW1pdAorICAgICAgICAgICAg
ICogdmlvbGF0aW9ucywgc28gc3F1YXNoIHRoZW0uCisgICAgICAgICAgICAgKi8KKyAgICAgICAg
ICAgIHg4Nl9lbXVsX3Jlc2V0X2V2ZW50KGN0eHQpOworICAgICAgICAgICAgcmMgPSBYODZFTVVM
X09LQVk7CisgICAgICAgIH0KKworICAgICAgICBpZiAoIHJjID09IFg4NkVNVUxfT0tBWSApCisg
ICAgICAgICAgICBwYWdpbmdfaW52bHBnKGN1cnJlbnQsIGFkZHIpOworICAgICAgICBicmVhazsK
KworICAgIGNhc2UgeDg2ZW11bF9pbnZscGdhOgorICAgICAgICAvKiBUT0RPOiBTdXBwb3J0IEFT
SURzLiAqLworICAgICAgICBpZiAoICFhdXggKQorICAgICAgICAgICAgcGFnaW5nX2ludmxwZyhj
dXJyZW50LCBhZGRyKTsKKyAgICAgICAgZWxzZQorICAgICAgICB7CisgICAgICAgICAgICB4ODZf
ZW11bF9od19leGNlcHRpb24oVFJBUF9pbnZhbGlkX29wLCBYODZfRVZFTlRfTk9fRUMsIGN0eHQp
OworICAgICAgICAgICAgcmMgPSBYODZFTVVMX0VYQ0VQVElPTjsKKyAgICAgICAgfQorICAgICAg
ICBicmVhazsKICAgICB9CiAKLSAgICBpZiAoIHJjID09IFg4NkVNVUxfT0tBWSApCi0gICAgICAg
IHBhZ2luZ19pbnZscGcoY3VycmVudCwgYWRkcik7Ci0KICAgICByZXR1cm4gcmM7CiB9CiAKQEAg
LTI0MjUsMTAgKzI0NDEsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ODZfZW11bGF0ZV9vcHMg
aHZtXwogICAgIC5yZWFkX21zciAgICAgID0gaHZtZW11bF9yZWFkX21zciwKICAgICAud3JpdGVf
bXNyICAgICA9IGh2bWVtdWxfd3JpdGVfbXNyLAogICAgIC5jYWNoZV9vcCAgICAgID0gaHZtZW11
bF9jYWNoZV9vcCwKKyAgICAudGxiX29wICAgICAgICA9IGh2bWVtdWxfdGxiX29wLAogICAgIC5j
cHVpZCAgICAgICAgID0geDg2ZW11bF9jcHVpZCwKICAgICAuZ2V0X2ZwdSAgICAgICA9IGh2bWVt
dWxfZ2V0X2ZwdSwKICAgICAucHV0X2ZwdSAgICAgICA9IGh2bWVtdWxfcHV0X2ZwdSwKLSAgICAu
aW52bHBnICAgICAgICA9IGh2bWVtdWxfaW52bHBnLAogICAgIC52bWZ1bmMgICAgICAgID0gaHZt
ZW11bF92bWZ1bmMsCiB9OwogCkBAIC0yNDUyLDEwICsyNDY4LDEwIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeDg2X2VtdWxhdGVfb3BzIGh2bV8KICAgICAucmVhZF9tc3IgICAgICA9IGh2bWVtdWxf
cmVhZF9tc3IsCiAgICAgLndyaXRlX21zciAgICAgPSBodm1lbXVsX3dyaXRlX21zcl9kaXNjYXJk
LAogICAgIC5jYWNoZV9vcCAgICAgID0gaHZtZW11bF9jYWNoZV9vcF9kaXNjYXJkLAorICAgIC50
bGJfb3AgICAgICAgID0gaHZtZW11bF90bGJfb3AsCiAgICAgLmNwdWlkICAgICAgICAgPSB4ODZl
bXVsX2NwdWlkLAogICAgIC5nZXRfZnB1ICAgICAgID0gaHZtZW11bF9nZXRfZnB1LAogICAgIC5w
dXRfZnB1ICAgICAgID0gaHZtZW11bF9wdXRfZnB1LAotICAgIC5pbnZscGcgICAgICAgID0gaHZt
ZW11bF9pbnZscGcsCiAgICAgLnZtZnVuYyAgICAgICAgPSBodm1lbXVsX3ZtZnVuYywKIH07CiAK
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2Fy
Y2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTU1OTAsMTAgKzU1OTAsOSBAQCB4
ODZfZW11bGF0ZSgKICAgICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZighKG1zcl92YWwg
JiBFRkVSX1NWTUUpIHx8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIWluX3By
b3Rtb2RlKGN0eHQsIG9wcyksIEVYQ19VRCk7CiAgICAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRp
b25faWYoIW1vZGVfcmluZzAoKSwgRVhDX0dQLCAwKTsKLSAgICAgICAgICAgIGdlbmVyYXRlX2V4
Y2VwdGlvbl9pZihfcmVncy5lY3gsIEVYQ19VRCk7IC8qIFRPRE86IFN1cHBvcnQgQVNJRHMuICov
Ci0gICAgICAgICAgICBmYWlsX2lmKG9wcy0+aW52bHBnID09IE5VTEwpOwotICAgICAgICAgICAg
aWYgKCAocmMgPSBvcHMtPmludmxwZyh4ODZfc2VnX25vbmUsIHRydW5jYXRlX2VhKF9yZWdzLnIo
YXgpKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4dCkpICkKKyAgICAg
ICAgICAgIGZhaWxfaWYoIW9wcy0+dGxiX29wKTsKKyAgICAgICAgICAgIGlmICggKHJjID0gb3Bz
LT50bGJfb3AoeDg2ZW11bF9pbnZscGdhLCB0cnVuY2F0ZV9lYShfcmVncy5yKGF4KSksCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9yZWdzLmVjeCwgY3R4dCkpICE9IFg4NkVN
VUxfT0tBWSApCiAgICAgICAgICAgICAgICAgZ290byBkb25lOwogICAgICAgICAgICAgYnJlYWs7
CiAKQEAgLTU3NDcsOCArNTc0Niw5IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBjYXNlIEdSUDdf
TUVNKDcpOiAvKiBpbnZscGcgKi8KICAgICAgICAgICAgIEFTU0VSVChlYS50eXBlID09IE9QX01F
TSk7CiAgICAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIW1vZGVfcmluZzAoKSwgRVhD
X0dQLCAwKTsKLSAgICAgICAgICAgIGZhaWxfaWYob3BzLT5pbnZscGcgPT0gTlVMTCk7Ci0gICAg
ICAgICAgICBpZiAoIChyYyA9IG9wcy0+aW52bHBnKGVhLm1lbS5zZWcsIGVhLm1lbS5vZmYsIGN0
eHQpKSApCisgICAgICAgICAgICBmYWlsX2lmKCFvcHMtPnRsYl9vcCk7CisgICAgICAgICAgICBp
ZiAoIChyYyA9IG9wcy0+dGxiX29wKHg4NmVtdWxfaW52bHBnLCBlYS5tZW0ub2ZmLCBlYS5tZW0u
c2VnLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHh0KSkgIT0gWDg2RU1V
TF9PS0FZICkKICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7CiAgICAgICAgICAgICBicmVhazsK
IAotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaAorKysgYi94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaApAQCAtMTg1LDYgKzE4NSwxMSBAQCBl
bnVtIHg4NmVtdWxfY2FjaGVfb3AgewogICAgIHg4NmVtdWxfd2Jub2ludmQsCiB9OwogCitlbnVt
IHg4NmVtdWxfdGxiX29wIHsKKyAgICB4ODZlbXVsX2ludmxwZywKKyAgICB4ODZlbXVsX2ludmxw
Z2EsCit9OworCiBzdHJ1Y3QgeDg2X2VtdWxhdGVfc3RhdGU7CiAKIC8qCkBAIC00NzIsNiArNDc3
LDE5IEBAIHN0cnVjdCB4ODZfZW11bGF0ZV9vcHMKICAgICAgICAgdW5zaWduZWQgbG9uZyBvZmZz
ZXQsCiAgICAgICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0KTsKIAorICAgIC8qCisg
ICAgICogdGxiX29wOiBJbnZhbGlkYXRlIHBhZ2luZyBzdHJ1Y3R1cmVzIHdoaWNoIG1hcCBhZGRy
ZXNzZWQgYnl0ZS4KKyAgICAgKgorICAgICAqIEBhZGRyIGFuZCBAYXV4IGhhdmUgQG9wLXNwZWNp
ZmljIG1lYW5pbmc6CisgICAgICogLSBJTlZMUEc6ICBAYXV4OkBhZGRyIHJlcHJlc2VudCBzZWc6
b2Zmc2V0CisgICAgICogLSBJTlZMUEdBOiBAYWRkciBpcyB0aGUgbGluZWFyIGFkZHJlc3MsIEBh
dXggdGhlIEFTSUQKKyAgICAgKi8KKyAgICBpbnQgKCp0bGJfb3ApKAorICAgICAgICBlbnVtIHg4
NmVtdWxfdGxiX29wIG9wLAorICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCisgICAgICAgIHVu
c2lnbmVkIGxvbmcgYXV4LAorICAgICAgICBzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCk7
CisKICAgICAvKiBjcHVpZDogRW11bGF0ZSBDUFVJRCB2aWEgZ2l2ZW4gc2V0IG9mIEVBWC1FRFgg
aW5wdXRzL291dHB1dHMuICovCiAgICAgaW50ICgqY3B1aWQpKAogICAgICAgICB1aW50MzJfdCBs
ZWFmLApAQCAtNDk5LDEyICs1MTcsNiBAQCBzdHJ1Y3QgeDg2X2VtdWxhdGVfb3BzCiAgICAgICAg
IGVudW0geDg2X2VtdWxhdGVfZnB1X3R5cGUgYmFja291dCwKICAgICAgICAgY29uc3Qgc3RydWN0
IHg4Nl9lbXVsX2ZwdV9hdXggKmF1eCk7CiAKLSAgICAvKiBpbnZscGc6IEludmFsaWRhdGUgcGFn
aW5nIHN0cnVjdHVyZXMgd2hpY2ggbWFwIGFkZHJlc3NlZCBieXRlLiAqLwotICAgIGludCAoKmlu
dmxwZykoCi0gICAgICAgIGVudW0geDg2X3NlZ21lbnQgc2VnLAotICAgICAgICB1bnNpZ25lZCBs
b25nIG9mZnNldCwKLSAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpOwotCiAg
ICAgLyogdm1mdW5jOiBFbXVsYXRlIFZNRlVOQyB2aWEgZ2l2ZW4gc2V0IG9mIEVBWCBFQ1ggaW5w
dXRzICovCiAgICAgaW50ICgqdm1mdW5jKSgKICAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0
eHQgKmN0eHQpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
