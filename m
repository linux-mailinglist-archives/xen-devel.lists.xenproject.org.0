Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3BC14F0DE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:48:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZQk-0000Ng-1h; Fri, 31 Jan 2020 16:46:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixZQi-0000NV-SR
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:46:04 +0000
X-Inumbo-ID: 2b50b370-4449-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b50b370-4449-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 16:46:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44324AC8F;
 Fri, 31 Jan 2020 16:46:03 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Message-ID: <a2fabad3-2a05-da71-64b8-bd77ac955b82@suse.com>
Date: Fri, 31 Jan 2020 17:46:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 7/7] x86/HVM: reduce scope of pfec in
 hvm_emulate_init_per_insn()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgbmVlZHMgY2FsY3VsYXRpbmcgb25seSBpbiBvbmUgb3V0IG9mIHRocmVlIGNhc2VzLiBSZS1z
dHJ1Y3R1cmUgdGhlCmNvZGUgYSBsaXR0bGUgc3VjaCB0aGF0IHRoZSB2YXJpYWJsZSB0cnVseSBn
ZXRzIGNhbGN1bGF0ZWQgb25seSB3aGVuIHdlCmRvbid0IGdldCBhbnkgaW5zbiBieXRlcyBmcm9t
IGVsc2V3aGVyZSwgYW5kIGhlbmNlIG5lZWQgdG8gKHRyeSB0bykKZmV0Y2ggdGhlbS4gQWxzbyBP
UiBpbiBQRkVDX2luc25fZmV0Y2ggcmlnaHQgaW4gdGhlIGluaXRpYWxpemVyLgoKV2hpbGUgaW4g
dGhpcyBtb29kLCByZXN0cmljdCBhZGRyJ3Mgc2NvcGUgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY0OiBOZXcuCgotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwpA
QCAtMjc2Miw4ICsyNzYyLDYgQEAgdm9pZCBodm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKAogICAg
IHVuc2lnbmVkIGludCBpbnNuX2J5dGVzKQogewogICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3Vy
cmVudDsKLSAgICB1bnNpZ25lZCBpbnQgcGZlYyA9IFBGRUNfcGFnZV9wcmVzZW50OwotICAgIHVu
c2lnbmVkIGxvbmcgYWRkcjsKIAogICAgIGh2bWVtdWxfY3R4dC0+Y3R4dC5sbWEgPSBodm1fbG9u
Z19tb2RlX2FjdGl2ZShjdXJyKTsKIApAQCAtMjc3OCwxNCArMjc3NiwyMyBAQCB2b2lkIGh2bV9l
bXVsYXRlX2luaXRfcGVyX2luc24oCiAgICAgICAgICAgICBodm1lbXVsX2N0eHQtPnNlZ19yZWdb
eDg2X3NlZ19zc10uZGIgPyAzMiA6IDE2OwogICAgIH0KIAotICAgIGlmICggaHZtZW11bF9jdHh0
LT5zZWdfcmVnW3g4Nl9zZWdfc3NdLmRwbCA9PSAzICkKLSAgICAgICAgcGZlYyB8PSBQRkVDX3Vz
ZXJfbW9kZTsKLQogICAgIGh2bWVtdWxfY3R4dC0+aW5zbl9idWZfZWlwID0gaHZtZW11bF9jdHh0
LT5jdHh0LnJlZ3MtPnJpcDsKLSAgICBpZiAoICFpbnNuX2J5dGVzICkKKworICAgIGlmICggaW5z
bl9ieXRlcyApCiAgICAgeworICAgICAgICBodm1lbXVsX2N0eHQtPmluc25fYnVmX2J5dGVzID0g
aW5zbl9ieXRlczsKKyAgICAgICAgbWVtY3B5KGh2bWVtdWxfY3R4dC0+aW5zbl9idWYsIGluc25f
YnVmLCBpbnNuX2J5dGVzKTsKKyAgICB9CisgICAgZWxzZSBpZiAoICEoaHZtZW11bF9jdHh0LT5p
bnNuX2J1Zl9ieXRlcyA9CisgICAgICAgICAgICAgICAgaHZtX2dldF9pbnNuX2J5dGVzKGN1cnIs
IGh2bWVtdWxfY3R4dC0+aW5zbl9idWYpKSApCisgICAgeworICAgICAgICB1bnNpZ25lZCBpbnQg
cGZlYyA9IFBGRUNfcGFnZV9wcmVzZW50IHwgUEZFQ19pbnNuX2ZldGNoOworICAgICAgICB1bnNp
Z25lZCBsb25nIGFkZHI7CisKKyAgICAgICAgaWYgKCBodm1lbXVsX2N0eHQtPnNlZ19yZWdbeDg2
X3NlZ19zc10uZHBsID09IDMgKQorICAgICAgICAgICAgcGZlYyB8PSBQRkVDX3VzZXJfbW9kZTsK
KwogICAgICAgICBodm1lbXVsX2N0eHQtPmluc25fYnVmX2J5dGVzID0KLSAgICAgICAgICAgIGh2
bV9nZXRfaW5zbl9ieXRlcyhjdXJyLCBodm1lbXVsX2N0eHQtPmluc25fYnVmKSA/OgogICAgICAg
ICAgICAgKGh2bV92aXJ0dWFsX3RvX2xpbmVhcl9hZGRyKHg4Nl9zZWdfY3MsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmh2bWVtdWxfY3R4dC0+c2VnX3JlZ1t4ODZf
c2VnX2NzXSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1lbXVs
X2N0eHQtPmluc25fYnVmX2VpcCwKQEAgLTI3OTUsMTUgKzI4MDIsOSBAQCB2b2lkIGh2bV9lbXVs
YXRlX2luaXRfcGVyX2luc24oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmFkZHIpICYmCiAgICAgICAgICAgICAgaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoaHZt
ZW11bF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZiksCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZlYyB8IFBGRUNfaW5zbl9mZXRjaCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKSA9PSBIVk1UUkFOU19va2F5
KSA/CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZlYywgTlVMTCkg
PT0gSFZNVFJBTlNfb2theSkgPwogICAgICAgICAgICAgc2l6ZW9mKGh2bWVtdWxfY3R4dC0+aW5z
bl9idWYpIDogMDsKICAgICB9Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgaHZtZW11bF9jdHh0
LT5pbnNuX2J1Zl9ieXRlcyA9IGluc25fYnl0ZXM7Ci0gICAgICAgIG1lbWNweShodm1lbXVsX2N0
eHQtPmluc25fYnVmLCBpbnNuX2J1ZiwgaW5zbl9ieXRlcyk7Ci0gICAgfQogfQogCiB2b2lkIGh2
bV9lbXVsYXRlX3dyaXRlYmFjaygKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
