Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A6812452C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:57:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWzA-0006MO-U5; Wed, 18 Dec 2019 10:55:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihWz9-0006MI-9E
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:55:19 +0000
X-Inumbo-ID: dbb0c3fa-2184-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbb0c3fa-2184-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 10:55:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C61AAAD26;
 Wed, 18 Dec 2019 10:55:08 +0000 (UTC)
To: Sergey Kovalev <valor@list.ru>
References: <a7ab0db0-9c2f-9ba7-75dc-d0741a6c53ca@list.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9686b82-0e33-1b1f-3de6-0a61b1e2f186@suse.com>
Date: Wed, 18 Dec 2019 11:55:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a7ab0db0-9c2f-9ba7-75dc-d0741a6c53ca@list.ru>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2] x86/vm_event: add short-circuit for
 breakpoints (aka, "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAwNjo1MywgU2VyZ2V5IEtvdmFsZXYgd3JvdGU6Cj4gV2hlbiB1c2luZyBE
UkFLVlVGIChvciBhbm90aGVyIHN5c3RlbSB1c2luZyBhbHRwMm0gd2l0aCBzaGFkb3cgcGFnZXMg
c2ltaWxhcgo+IHRvIHdoYXQgaXMgZGVzY3JpYmVkIGluCj4gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9y
Zy8yMDE2LzA0LzEzL3N0ZWFsdGh5LW1vbml0b3Jpbmctd2l0aC14ZW4tYWx0cDJtKSwKPiBhZnRl
ciBhIGJyZWFrcG9pbnQgaXMgaGl0IHRoZSBzeXN0ZW0gc3dpdGNoZXMgdG8gdGhlIGRlZmF1bHQK
PiB1bnJlc3RyaWN0ZWQgYWx0cDJtIHZpZXcgd2l0aCBzaW5nbGVzdGVwIGVuYWJsZWQuIFdoZW4g
dGhlIHNpbmdsZXN0ZXAKPiB0cmFwcyB0byBYZW4gYW5vdGhlciB2bV9ldmVudCBpcyBzZW50IHRv
IHRoZSBtb25pdG9yIGFnZW50LCB3aGljaCB0aGVuCj4gbm9ybWFsbHkgZGlzYWJsZXMgc2luZ2xl
c3RlcHBpbmcgYW5kIHN3aXRjaGVzIHRoZSBhbHRwMm0gdmlldyBiYWNrIHRvCj4gdGhlIHJlc3Ry
aWN0ZWQgdmlldy4KPiAKPiBUaGlzIHBhdGNoIHNob3J0LWNpcmN1aXRpbmcgdGhhdCBsYXN0IHBh
cnQgc28gdGhhdCBpdCBkb2Vzbid0IG5lZWQgdG8gc2VuZCB0aGUKPiB2bV9ldmVudCBvdXQgZm9y
IHRoZSBzaW5nbGVzdGVwIGV2ZW50IGFuZCBzaG91bGQgc3dpdGNoIGJhY2sgdG8gdGhlIHJlc3Ry
aWN0ZWQKPiB2aWV3IGluIFhlbiBhdXRvbWF0aWNhbGx5Lgo+IAo+IFRoaXMgb3B0aW1pemF0aW9u
IGdhaW5zIGFib3V0IDM1JSBzcGVlZC11cC4KPiAKPiBXYXMgdGVzdGVkIG9uIERlYmlhbiBicmFu
Y2ggb2YgWGVuIDQuMTIuIFNlZSBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94ZW4vdHJl
ZS9kZWJpYW4va25vcnJpZS80LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+IAo+IFJlYmFzZWQgb24gbWFz
dGVyOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90cmVlL2Zhc3Qtc2luZ2xlc3RlcAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1Pgo+IC0tLQo+
ICAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gICB4
ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYyAgICAgfCAgOSArKysrKysrKysKPiAgIHhlbi9hcmNo
L3g4Ni92bV9ldmVudC5jICAgICAgICB8ICA4ICsrKysrKy0tCj4gICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9odm0uaCAgfCAgMSArCj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1Lmgg
fCAgNCArKysrCj4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCAgfCAxMCArKysrKysr
KysrCj4gICA2IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4gaW5kZXggNDc1NzNmNzFiOC4uNDk5OTU2OTUwMyAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IEBA
IC01MTI2LDYgKzUxMjYsMTggQEAgdm9pZCBodm1fdG9nZ2xlX3NpbmdsZXN0ZXAoc3RydWN0IHZj
cHUgKnYpCj4gICAgICAgdi0+YXJjaC5odm0uc2luZ2xlX3N0ZXAgPSAhdi0+YXJjaC5odm0uc2lu
Z2xlX3N0ZXA7Cj4gICB9Cj4gCj4gK3ZvaWQgaHZtX2Zhc3Rfc2luZ2xlc3RlcChzdHJ1Y3QgdmNw
dSAqdiwgdWludDE2X3QgcDJtaWR4KQo+ICt7Cj4gKyAgICBBU1NFUlQoYXRvbWljX3JlYWQoJnYt
PnBhdXNlX2NvdW50KSk7Cj4gKwo+ICsgICAgaWYgKCAhaHZtX2lzX3NpbmdsZXN0ZXBfc3VwcG9y
dGVkKCkgKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAgICB2LT5hcmNoLmh2bS5zaW5nbGVf
c3RlcCA9IHRydWU7Cj4gKyAgICB2LT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLmVuYWJsZWQg
PSB0cnVlOwo+ICsgICAgdi0+YXJjaC5odm0uZmFzdF9zaW5nbGVfc3RlcC5wMm1pZHggPSBwMm1p
ZHg7CgpQZXJoYXBzIGJldHRlciBhdCBsZWFzdCByYW5nZSBjaGVjayBwMm1pZHggYmVmb3JlIHN0
b3Jpbmc/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L3ZtX2V2ZW50LmMKPiBAQCAtNjEsNyArNjEsOCBAQCB2b2lkIHZtX2V2ZW50X2NsZWFudXBf
ZG9tYWluKHN0cnVjdCBkb21haW4gKmQpCj4gICB2b2lkIHZtX2V2ZW50X3RvZ2dsZV9zaW5nbGVz
dGVwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bV9ldmVudF9yZXNwb25zZV90ICpyc3ApCj4gICB7Cj4gLSAgICBp
ZiAoICEocnNwLT5mbGFncyAmIFZNX0VWRU5UX0ZMQUdfVE9HR0xFX1NJTkdMRVNURVApICkKPiAr
ICAgIGlmICggIShyc3AtPmZsYWdzICYgVk1fRVZFTlRfRkxBR19UT0dHTEVfU0lOR0xFU1RFUCB8
fAo+ICsgICAgICAgICAgIHJzcC0+ZmxhZ3MgJiBWTV9FVkVOVF9GTEFHX0ZBU1RfU0lOR0xFU1RF
UCkgKQoKVGhpcyB3YW50cyBwYXJlbnRoZXNlcyBhZGRlZCwgb3IgcmUtd3JpdGluZyBhcwoKICAg
IGlmICggIShyc3AtPmZsYWdzICYgKFZNX0VWRU5UX0ZMQUdfVE9HR0xFX1NJTkdMRVNURVAgfAog
ICAgICAgICAgICAgICAgICAgICAgICAgVk1fRVZFTlRfRkxBR19GQVNUX1NJTkdMRVNURVApKSAp
CgpBbHNvIHlvdXIgcGF0Y2ggaGFzIGNvbWUgdGhyb3VnaCBtYW5nbGVkLCByZW1pbmRpbmcgbWUg
b2YgYSBwcm9ibGVtCkkgaGFkIHdpdGggVGh1bmRlcmJpcmQgYWZ0ZXIgaW5pdGlhbGx5IGhhdmlu
ZyBzd2l0Y2hlZCB0byBpdC4gVGhlcmUKYXJlIGxpbmUgbGVuZ3RoIC8gd3JhcHBpbmcgc2V0dGlu
Z3MgeW91IG1heSBuZWVkIHRvIHBsYXkgd2l0aCB0bwphdm9pZCBpdCBpbnNlcnRpbmcgZXh0cmEg
YmxhbmtzIChJJ20gc29ycnksIEkgZG9uJ3QgcmVhbGx5IHJlY2FsbAp3aGljaCBvbmUocykgaXQg
d2FzLikuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
