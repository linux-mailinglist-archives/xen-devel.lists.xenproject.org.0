Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3A146745
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:54:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iub1K-00043d-A9; Thu, 23 Jan 2020 11:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iub1J-00043X-4c
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 11:51:33 +0000
X-Inumbo-ID: adea0206-3dd6-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adea0206-3dd6-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 11:51:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90F5FB029;
 Thu, 23 Jan 2020 11:51:23 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Message-ID: <97f19bd2-7d59-a30b-9e79-157ad0bca017@suse.com>
Date: Thu, 23 Jan 2020 12:51:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] x86/p2m: fix PoD accounting in
 guest_physmap_add_entry()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGluaXRpYWwgb2JzZXJ2YXRpb24gd2FzIHRoYXQgdGhlIG1mbl92YWxpZCgpIGNoZWNrIGNv
bWVzIHRvbyBsYXRlOgpOZWl0aGVyIG1mbl9hZGQoKSBub3IgbWZuX3RvX3BhZ2UoKSAobGV0IGFs
b25lIGRlLXJlZmVyZW5jaW5nIHRoZQpyZXN1bHQgb2YgdGhlIGxhdHRlcikgYXJlIHZhbGlkIGZv
ciBNRk5zIGZhaWxpbmcgdGhpcyBjaGVjay4gTW92ZSBpdCB1cAphbmQgLSBub3RpY2luZyB0aGF0
IHRoZXJlJ3Mgbm8gY2FsbGVyIGRvaW5nIHNvIC0gYWxzbyBhZGQgYW4gYXNzZXJ0aW9uCnRoYXQg
dGhpcyBzaG91bGQgbmV2ZXIgcHJvZHVjZSAiZmFsc2UiIGhlcmUuCgpJbiB0dXJuIHRoaXMgd291
bGQgaGF2ZSBtZWFudCB0aGF0IHRoZSAiZWxzZSIgdG8gdGhhdCBpZigpIGNvdWxkIG5vdyBnbwph
d2F5LCB3aGljaCBkaWRuJ3Qgc2VlbSByaWdodCBhdCBhbGwuIEFuZCBpbmRlZWQsIGNvbnNpZGVy
aW5nIGNhbGxlcnMKbGlrZSBtZW1vcnlfZXhjaGFuZ2UoKSBvciB2YXJpb3VzIGdyYW50IHRhYmxl
IGZ1bmN0aW9ucywgdGhlIFBvRAphY2NvdW50aW5nIHNob3VsZCBoYXZlIGJlZW4gb3V0c2lkZSBv
ZiB0aGF0IGlmKCkgZnJvbSB0aGUgdmVyeQpiZWdpbm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC04ODMsNiArODgzLDEyIEBAIGd1ZXN0X3Bo
eXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQKICAgICBpZiAoIHAybV9pc19mb3JlaWdu
KHQpICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKKyAgICBpZiAoICFtZm5fdmFsaWQobWZu
KSApCisgICAgeworICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAgcmV0dXJu
IC1FSU5WQUw7CisgICAgfQorCiAgICAgcDJtX2xvY2socDJtKTsKIAogICAgIFAyTV9ERUJVRygi
YWRkaW5nIGdmbj0lI2x4IG1mbj0lI2x4XG4iLCBnZm5feChnZm4pLCBtZm5feChtZm4pKTsKQEAg
LTk4NCwxMiArOTkwLDEzIEBAIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4g
KmQKICAgICB9CiAKICAgICAvKiBOb3csIGFjdHVhbGx5IGRvIHRoZSB0d28td2F5IG1hcHBpbmcg
Ki8KLSAgICBpZiAoIG1mbl92YWxpZChtZm4pICkKKyAgICByYyA9IHAybV9zZXRfZW50cnkocDJt
LCBnZm4sIG1mbiwgcGFnZV9vcmRlciwgdCwgcDJtLT5kZWZhdWx0X2FjY2Vzcyk7CisgICAgaWYg
KCByYyA9PSAwICkKICAgICB7Ci0gICAgICAgIHJjID0gcDJtX3NldF9lbnRyeShwMm0sIGdmbiwg
bWZuLCBwYWdlX29yZGVyLCB0LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtLT5kZWZh
dWx0X2FjY2Vzcyk7Ci0gICAgICAgIGlmICggcmMgKQotICAgICAgICAgICAgZ290byBvdXQ7IC8q
IEZhaWxlZCB0byB1cGRhdGUgcDJtLCBiYWlsIHdpdGhvdXQgdXBkYXRpbmcgbTJwLiAqLworICAg
ICAgICBwb2RfbG9jayhwMm0pOworICAgICAgICBwMm0tPnBvZC5lbnRyeV9jb3VudCAtPSBwb2Rf
Y291bnQ7CisgICAgICAgIEJVR19PTihwMm0tPnBvZC5lbnRyeV9jb3VudCA8IDApOworICAgICAg
ICBwb2RfdW5sb2NrKHAybSk7CiAKICAgICAgICAgaWYgKCAhcDJtX2lzX2dyYW50KHQpICkKICAg
ICAgICAgewpAQCAtOTk4LDIwICsxMDA1LDYgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoc3Ry
dWN0IGRvbWFpbiAqZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl94KGdm
bl9hZGQoZ2ZuLCBpKSkpOwogICAgICAgICB9CiAgICAgfQotICAgIGVsc2UKLSAgICB7Ci0gICAg
ICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiQWRkaW5nIGJhZCBtZm4gdG8gcDJtIG1hcCAo
JSNseCAtPiAlI2x4KVxuIiwKLSAgICAgICAgICAgICAgICAgZ2ZuX3goZ2ZuKSwgbWZuX3gobWZu
KSk7Ci0gICAgICAgIHJjID0gcDJtX3NldF9lbnRyeShwMm0sIGdmbiwgSU5WQUxJRF9NRk4sIHBh
Z2Vfb3JkZXIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1faW52YWxpZCwgcDJtLT5k
ZWZhdWx0X2FjY2Vzcyk7Ci0gICAgICAgIGlmICggcmMgPT0gMCApCi0gICAgICAgIHsKLSAgICAg
ICAgICAgIHBvZF9sb2NrKHAybSk7Ci0gICAgICAgICAgICBwMm0tPnBvZC5lbnRyeV9jb3VudCAt
PSBwb2RfY291bnQ7Ci0gICAgICAgICAgICBCVUdfT04ocDJtLT5wb2QuZW50cnlfY291bnQgPCAw
KTsKLSAgICAgICAgICAgIHBvZF91bmxvY2socDJtKTsKLSAgICAgICAgfQotICAgIH0KIAogb3V0
OgogICAgIHAybV91bmxvY2socDJtKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
