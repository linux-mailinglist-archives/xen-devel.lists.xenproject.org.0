Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3350AF3318
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:30:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjiL-0007Wq-VY; Thu, 07 Nov 2019 15:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSjiK-0007Wl-MT
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:28:48 +0000
X-Inumbo-ID: 4ac61ea2-0173-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ac61ea2-0173-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 15:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0BBD9B4EE;
 Thu,  7 Nov 2019 15:28:47 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
Date: Thu, 7 Nov 2019 16:28:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107150609.93004-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw
 entry reads/writes in clear_IO_APIC_pin
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

T24gMDcuMTEuMjAxOSAxNjowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IGNsZWFyX0lPX0FQ
SUNfcGluIGNhbiBiZSBjYWxsZWQgYWZ0ZXIgdGhlIGlvbW11IGhhcyBiZWVuIGVuYWJsZWQsIGFu
ZAo+IHVzaW5nIHJhdyBlbnRyeSByZWFkcyBhbmQgd3JpdGVzIHdpbGwgcmVzdWx0IGluIGEgbWlz
Y29uZmlndXJhdGlvbiBvZgo+IHRoZSBlbnRyaWVzIGFscmVhZHkgc2V0dXAgdG8gdXNlIHRoZSBp
bnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlLgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQg
dGhpczogUmF3IHJlYWRzIGFuZCB3cml0ZXMgZG9uJ3QgZXZlbgpnbyB0byB0aGUgSU9NTVUgaW50
ZXJydXB0IHJlbWFwcGluZyBjb2RlLCBzbyBob3cgd291bGQgdGhlIGFzc2VydGlvbgpiZSB0cmln
Z2VyZWQ/Cgo+IChYRU4pIFsgICAxMC4wODIxNTRdIEVOQUJMSU5HIElPLUFQSUMgSVJRcwo+IChY
RU4pIFsgICAxMC4wODc3ODldICAtPiBVc2luZyBuZXcgQUNLIG1ldGhvZAo+IChYRU4pIFsgICAx
MC4wOTM3MzhdIEFzc2VydGlvbiAnZ2V0X3J0ZV9pbmRleChydGUpID09IG9mZnNldCcgZmFpbGVk
IGF0IGlvbW11X2ludHIuYzozMjgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCiJSZXBvcnRlZC1ieTogU2VyZ2V5IC4uLiIgYWhlYWQg
b2YgdGhpcz8KCj4gLS0tIGEveGVuL2FyY2gveDg2L2lvX2FwaWMuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9pb19hcGljLmMKPiBAQCAtNTE0LDEzICs1MTQsMTMgQEAgc3RhdGljIHZvaWQgY2xlYXJf
SU9fQVBJQ19waW4odW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4pCj4gICAgICAg
ICAgZW50cnkubWFzayA9IDE7Cj4gICAgICAgICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywg
cGluLCBmYWxzZSwgZW50cnkpOwo+ICAgICAgfQo+IC0gICAgZW50cnkgPSBfX2lvYXBpY19yZWFk
X2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSk7Cj4gKyAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50
cnkoYXBpYywgcGluLCBmYWxzZSk7Cj4gIAo+ICAgICAgaWYgKGVudHJ5Lmlycikgewo+ICAgICAg
ICAgIC8qIE1ha2Ugc3VyZSB0aGUgdHJpZ2dlciBtb2RlIGlzIHNldCB0byBsZXZlbC4gKi8KPiAg
ICAgICAgICBpZiAoIWVudHJ5LnRyaWdnZXIpIHsKPiAgICAgICAgICAgICAgZW50cnkudHJpZ2dl
ciA9IDE7Cj4gLSAgICAgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgdHJ1
ZSwgZW50cnkpOwo+ICsgICAgICAgICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4s
IGZhbHNlLCBlbnRyeSk7Cj4gICAgICAgICAgfQoKQWxsIHdlIGRvIGhlcmUgaXMgc2V0IHRoZSB0
cmlnZ2VyIGJpdC4gTm8gdHJhbnNsYXRpb24gYmFjayBhbmQgZm9ydGgKb2YgdGhlIFJURSBzaG91
bGQgYmUgbmVlZGVkLgoKPiBAQCAtNTMwLDkgKzUzMCw5IEBAIHN0YXRpYyB2b2lkIGNsZWFyX0lP
X0FQSUNfcGluKHVuc2lnbmVkIGludCBhcGljLCB1bnNpZ25lZCBpbnQgcGluKQo+ICAgICAgICov
Cj4gICAgICBtZW1zZXQoJmVudHJ5LCAwLCBzaXplb2YoZW50cnkpKTsKPiAgICAgIGVudHJ5Lm1h
c2sgPSAxOwo+IC0gICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCB0cnVlLCBlbnRy
eSk7Cj4gKyAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4sIGZhbHNlLCBlbnRyeSk7
CgpJIG1heSBiZSBhYmxlIHRvIHVuZGVyc3RhbmQgd2h5IHRoaXMgb25lIGNhbid0IHVzZSByYXcg
bW9kZSwgYnV0IGFzCnBlciBhYm92ZSBhIGJldHRlciBvdmVyYWxsIGRlc2NyaXB0aW9uIGlzIG5l
ZWRlZC4KCj4gLSAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGluLCB0cnVl
KTsKPiArICAgIGVudHJ5ID0gX19pb2FwaWNfcmVhZF9lbnRyeShhcGljLCBwaW4sIGZhbHNlKTsK
PiAgICAgIGlmIChlbnRyeS5pcnIpCj4gICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJJTy1BUElD
JTAyeC0ldTogVW5hYmxlIHRvIHJlc2V0IElSUlxuIiwKPiAgICAgICAgICAgICAgICAgSU9fQVBJ
Q19JRChhcGljKSwgcGluKTsKClRoaXMgcmVhZCBhZ2FpbiBzaG91bGRuJ3QgbmVlZCBjb252ZXJz
aW9uLCBhcyB0aGUgSVJSIGJpdCBkb2Vzbid0CmdldCB0b3VjaGVkIChJIHRoaW5rKSBieSB0aGUg
aW50ZXJydXB0IHJlbWFwcGluZyBjb2RlIGR1cmluZyB0aGUKdHJhbnNsYXRpb24gaXQgZG9lcy4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
