Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB8FC820
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 14:51:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVFUf-0003vt-Un; Thu, 14 Nov 2019 13:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVFUf-0003vo-11
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 13:49:05 +0000
X-Inumbo-ID: 8514124a-06e5-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8514124a-06e5-11ea-adbe-bc764e2007e4;
 Thu, 14 Nov 2019 13:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42800AE84;
 Thu, 14 Nov 2019 13:49:03 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191113155940.81837-1-roger.pau@citrix.com>
 <20191113155940.81837-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70d5ebcc-12a4-6a8e-acab-aaebc850a63a@suse.com>
Date: Thu, 14 Nov 2019 14:49:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113155940.81837-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 3/3] x86/vioapic: sync PIR to
 IRR when modifying entries
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNjo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdmlvYXBpYy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMK
PiBAQCAtMjEyLDYgKzIxMiw0NCBAQCBzdGF0aWMgaW50IHZpb2FwaWNfaHdkb21fbWFwX2dzaSh1
bnNpZ25lZCBpbnQgZ3NpLCB1bnNpZ25lZCBpbnQgdHJpZywKPiAgICAgIHJldHVybiByZXQ7Cj4g
IH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgaW50IHBpdF9jaGFubmVsMF9lbmFibGVkKHZvaWQpCj4g
K3sKPiArICAgIHJldHVybiBwdF9hY3RpdmUoJmN1cnJlbnQtPmRvbWFpbi0+YXJjaC52cGl0LnB0
MCk7Cj4gK30KClJhdGhlciB0aGFuIG1vdmluZyBpdCB1cCBoZXJlLCBjb3VsZCBJIHRhbGsgeW91
IGludG8gdGFraW5nIHRoZQpvcHBvcnR1bml0eSBhbmQgbW92ZSBpdCBpbnRvIGh2bS92cHQuaD8g
VGhpcyByZWFsbHkgaXNuJ3QgYQp2SU8tQVBJQyBmdW5jdGlvbiwgYW5kIGhlbmNlIHNob3VsZCBu
ZXZlciBoYXZlIGJlZW4gcGxhY2VkIGluCnRoaXMgZmlsZS4KCj4gK3N0YXRpYyB2b2lkIHN5bmNf
dmNwdXNfcGlyKHN0cnVjdCBkb21haW4gKmQsIHVuaW9uIHZpb2FwaWNfcmVkaXJfZW50cnkgKmVu
dCwKCmNvbnN0ICh0d2ljZSk/Cgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgaXJxKQo+ICt7Cj4gKyAgICBERUNMQVJFX0JJVE1BUCh2Y3B1cywgTUFYX1ZJUlRfQ1BV
UykgPSB7IH07CgpTYW1lIGNvbW1lbnQgaGVyZSBhcyBmb3IgcGF0Y2ggMi4KCj4gKyAgICBzd2l0
Y2ggKCBlbnQtPmZpZWxkcy5kZWxpdmVyeV9tb2RlICkKPiArICAgIHsKPiArICAgIGNhc2UgZGVz
dF9Mb3dlc3RQcmlvOgo+ICsgICAgY2FzZSBkZXN0X0ZpeGVkOgo+ICsjaWZkZWYgSVJRMF9TUEVD
SUFMX1JPVVRJTkcKPiArICAgICAgICBpZiAoIChpcnEgPT0gaHZtX2lzYV9pcnFfdG9fZ3NpKDAp
KSAmJiBwaXRfY2hhbm5lbDBfZW5hYmxlZCgpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAg
IF9fc2V0X2JpdCgwLCB2Y3B1cyk7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0K
PiArI2VuZGlmCj4gKyAgICAgICAgaHZtX2ludHJfZ2V0X2Rlc3RzKGQsIGVudC0+ZmllbGRzLmRl
c3RfaWQsIGVudC0+ZmllbGRzLmRlc3RfbW9kZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW50LT5maWVsZHMuZGVsaXZlcnlfbW9kZSwgdmNwdXMpOwo+ICsgICAgICAgIGJyZWFrOwo+
ICsKPiArICAgIGNhc2UgZGVzdF9OTUk6Cj4gKyAgICAgICAgLyogTm90aGluZyB0byBkbywgTk1J
cyBhcmUgbm90IHNpZ25hbGVkIG9uIHRoZSBQSVIuICovCj4gKyAgICAgICAgYnJlYWs7Cj4gKwo+
ICsgICAgZGVmYXVsdDoKPiArICAgICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgInVuc3Vw
cG9ydGVkIGRlbGl2ZXJ5IG1vZGUgJTAydVxuIiwKPiArICAgICAgICAgICAgICAgICBlbnQtPmZp
ZWxkcy5kZWxpdmVyeV9tb2RlKTsKPiArICAgICAgICBicmVhazsKPiArICAgIH0KPiArCj4gKyAg
ICBkb21haW5fc3luY192bGFwaWNfcGlyKGQsIHZjcHVzKTsKPiArfQoKSSByZWFsaXplIGl0IG1h
eSBiZSBsZXNzIG9mIGEgcmlzayBmb3IgNC4xMyB0aGlzIHdheSwgYnV0IHRoZXJlJ3MKcXVpdGUg
YSBiaXQgb2YgbG9naWMgZHVwbGljYXRpb24gd2l0aCB2aW9hcGljX2RlbGl2ZXIoKSwgd2hpY2gK
d291bGQgYmUgbmljZSB0byBiZSB0YWtlbiBjYXJlIG9mIGJ5IGJyZWFraW5nIG91dCBzaW1pbGFy
IGxvZ2ljCmludG8gb25lIG9yIG1vcmUgaGVscGVycy4KCj4gQEAgLTIzNSw2ICsyNzMsOSBAQCBz
dGF0aWMgdm9pZCB2aW9hcGljX3dyaXRlX3JlZGlyZW50KAo+ICAgICAgcGVudCA9ICZ2aW9hcGlj
LT5yZWRpcnRibFtpZHhdOwo+ICAgICAgZW50ICA9ICpwZW50Owo+ICAKPiArICAgIGlmICggIWVu
dC5maWVsZHMubWFzayAmJiBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50ciApCj4gKyAgICAg
ICAgc3luY192Y3B1c19waXIoZCwgcGVudCwgdmlvYXBpYy0+YmFzZV9nc2kgKyBpZHgpOwoKSnVz
dCBsaWtlIGZvciBNU0ksIGRvbid0IHlvdSB3YW50IHRvIGRvIHRoaXMgX2FmdGVyXyBoYXZpbmcK
dXBkYXRlZCBldmVyeXRoaW5nPyBJdCBtYXkgbm90IG1hdHRlciBtdWNoIGJlY2F1c2UgdGhpcyBp
cwp3aXRoaW4gYSByZWdpb24gd2l0aCB0aGUgbmVjZXNzYXJ5IGxvY2sgaGVsZCwgYnV0IGl0IHdv
dWxkIGF0CmxlYXN0IGxvb2sgYmV0dGVyIGZyb20gYW4gYWJzdHJhY3QgcG92LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
