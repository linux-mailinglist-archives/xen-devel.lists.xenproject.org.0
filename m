Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B614B379
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 12:26:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwOvp-00017z-Bv; Tue, 28 Jan 2020 11:21:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f0Vb=3R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwOvo-00017u-2O
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 11:21:20 +0000
X-Inumbo-ID: 4dc3b640-41c0-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dc3b640-41c0-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580210479;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=o3mYQUzDiGvo+ufJA1z7vIX0PX8qo2NHG7Z+09SYtak=;
 b=b019QNrvnMOPbZiUmp/PI98A+eqTE92SFUXcz8UjigI6m7rF59YpLHeo
 iCWFR0Y21/YMozS9wLBwxnh6+YhTtifkWuh00zdQQCZP/UFHgOtEPYKVL
 3lxA3Kkqzoh3mN5+Yw6L3suHDPbeiUbE1NsgQx1eL8vSlbIeiRvVRMMYE w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xfRKk9iQAcdctkATkW5d2WgySZ+h2atadAEXxFSVJb/GMuHOacIcEE+Khb8gUIvq3XkesOrg65
 AxS7LWiH1eUBV5QCKz4pUfSLBXFNb3yUdu9So2I23yVcBvR4U+sfq5I80bm1BSxUNLImua35Kr
 7E1/0Q51zqSqX8R2ian/591ZKu6xqNZBct8oIXw7fGlPJZlT/CE9KxRLfkB4lJULH0Y5+/fEz3
 tMxSA75G4NHlaomXoWw3d9w8CuOMcaXEKqoA6F6znki6eZdaFl8EjjqXLYd9h+qxENscG/XKft
 mfw=
X-SBRS: 2.7
X-MesageID: 11559666
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11559666"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
 <20200128103933.GK57924@desktop-tdan49n.eng.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <24a248a0-58da-66d6-a614-d876bd64a04b@citrix.com>
Date: Tue, 28 Jan 2020 11:21:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128103933.GK57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDEvMjAyMCAxMDozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPgo+PiBUaGlzIGlz
IG9uZSBvZiB0d28gcG9zc2libGUgYXBwcm9hY2hlcywgYW5kIGJvdGggaGF2ZSB0aGVpciBkb3du
c2lkZXMuICBUaGlzCj4+IG9uZSB0YWtlcyBhbiBleHRyYSBoaXQgb24gY29udGV4dCBzd2l0Y2hl
cyBiZXR3ZWVuIFBWIHZjcHVzIGFuZCBpZGxlL2h2bSwgYXMKPj4gdGhleSB3aWxsIHVzdWFsbHkg
ZGlmZmVyIGluIEhZUEVSVklTT1IgYml0Lgo+Pgo+PiBUaGUgb3RoZXIgYXBwcm9hY2ggaXMgdG8g
b3JkZXIgdGhpbmdzIG1vcmUgY2FyZWZ1bGx5IHNvIGxldmVsbGluZyBpcwo+PiBjb25maWd1cmVk
IGFmdGVyIHNjYW5uaW5nIGZvciBjcHVpZCBiaXRzLCBidXQgdGhhdCBoYXMgdGhlIGRvd25zaWRl
IHRoYXQgaXQgaXMKPj4gdmVyeSBlYXN5IHRvIHJlZ3Jlc3MuCj4+Cj4+IFRob3VnaHRzIG9uIHdo
aWNoIGlzIHRoZSBsZWFzdC1iYWQgYXBwcm9hY2ggdG8gdGFrZT8gIEhhdmluZyB3cml0dGVuIHRo
aXMKPj4gcGF0Y2gsIEknbSBub3cgZXJyaW5nIG9uIHRoZSBzaWRlIG9mIGRvaW5nIGl0IHRoZSBv
dGhlciB3YXkuCj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgICAgICB8IDMgLS0t
Cj4+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgMiArKwo+PiAgeGVuL2FyY2gveDg2
L2RvbWN0bC5jICAgICAgICB8IDkgKysrKysrKystCj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2Rv
bWFpbi5oIHwgMiArKwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYyBiL3hl
bi9hcmNoL3g4Ni9jcHUvYW1kLmMKPj4gaW5kZXggOGI1ZjBmMmU0Yy4uMDkwNmIyMzU4MiAxMDA2
NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+PiArKysgYi94ZW4vYXJjaC94ODYv
Y3B1L2FtZC5jCj4+IEBAIC0yOTcsOSArMjk3LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vaW5s
aW5lIGFtZF9pbml0X2xldmVsbGluZyh2b2lkKQo+PiAgCQkJZWN4IHw9IGNwdWZlYXRfbWFzayhY
ODZfRkVBVFVSRV9PU1hTQVZFKTsKPj4gIAkJZWR4IHw9IGNwdWZlYXRfbWFzayhYODZfRkVBVFVS
RV9BUElDKTsKPj4gIAo+PiAtCQkvKiBBbGxvdyB0aGUgSFlQRVJWSVNPUiBiaXQgdG8gYmUgc2V0
IHZpYSBndWVzdCBwb2xpY3kuICovCj4+IC0JCWVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRV
UkVfSFlQRVJWSVNPUik7Cj4gV2UgYWxzbyBzZWVtIHRvIGZvcmNlIFg4Nl9GRUFUVVJFX0FQSUMg
aW50byB0aGUgcG9saWN5LCB3aGljaCBzZWVtcwo+IHdyb25nPwo+Cj4gSSBndWVzcyBhbGwgQU1E
IGhhcmR3YXJlIFhlbiBib290cyBvbiBoYXMgdGhlIEFQSUMgZmVhdHVyZSwgc28gdGhpcwo+IGlz
bid0IGEgcmVhbCBpc3N1ZSwgYnV0IHN0aWxsIHNlZW1zIHF1aXRlIHdlaXJkLgoKVGhlIGNvbW1l
bnQganVzdCBvdXQgb2YgY29udGV4dCBleHBsYWlucyB3aHkuCgpUaGUgQVBJQyBiaXQgaXMgc3Bl
Y2lhbCAoZmFzdCBmb3J3YXJkZWQgZnJvbSBNU1JfQVBJQ19CQVNFLkVOKSBhbmQgZm9yCnRoZSBm
YXN0LWZvcndhcmRpbmcgdG8gd29yayBjb3JyZWN0bHksIHRoZSBiaXQgbmVlZHMgdG8gcmVtYWlu
CnVuY29uZGl0aW9uYWxseSBzZXQgaW4gdGhlICJtYXNrIiBNU1IuCgo+Cj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4gaW5kZXgg
NWVkNjNhYzEwYS4uMDYyN2ViNGUwNiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0
bC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+PiBAQCAtNDgsNyArNDgsNyBAQCBz
dGF0aWMgaW50IGdkYnN4X2d1ZXN0X21lbV9pbyhkb21pZF90IGRvbWlkLCBzdHJ1Y3QgeGVuX2Rv
bWN0bF9nZGJzeF9tZW1pbyAqaW9wKQo+PiAgfQo+PiAgI2VuZGlmCj4+ICAKPj4gLXN0YXRpYyB2
b2lkIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKPj4gK3ZvaWQg
ZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+PiAgewo+PiAgICAg
IGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBkLT5hcmNoLmNwdWlkOwo+PiAgICAgIHN0
cnVjdCB2Y3B1ICp2Owo+PiBAQCAtMTA2LDYgKzEwNiwxMyBAQCBzdGF0aWMgdm9pZCBkb21haW5f
Y3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4+ICAgICAgICAgICAgICAgICAg
ICAgIGVjeCA9IDA7Cj4+ICAgICAgICAgICAgICAgICAgZWR4ID0gY3B1ZmVhdF9tYXNrKFg4Nl9G
RUFUVVJFX0FQSUMpOwo+PiAgCj4+ICsgICAgICAgICAgICAgICAgLyoKPj4gKyAgICAgICAgICAg
ICAgICAgKiBJZiB0aGUgSHlwZXJ2aXNvciBiaXQgaXMgc2V0IGluIHRoZSBwb2xpY3ksIHdlIGNh
biBhbHNvCj4+ICsgICAgICAgICAgICAgICAgICogZm9yd2FyZCBpdCBpbnRvIHJlYWwgQ1BVSUQu
Cj4+ICsgICAgICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAgICAgICAgaWYgKCBwLT5iYXNp
Yy5oeXBlcnZpc29yICkKPj4gKyAgICAgICAgICAgICAgICAgICAgZWN4IHw9IGNwdWZlYXRfbWFz
ayhYODZfRkVBVFVSRV9IWVBFUlZJU09SKTsKPiBTaW5jZSB0aGUgaHlwZXJ2aXNvciBiaXQgd2ls
bCBiZSBwYXJ0IG9mIGJvdGggdGhlIEhWTSBhbmQgUFYgbWF4Cj4gcG9saWNpZXMsIHdoeSBkbyB5
b3UgbmVlZCB0byBleHBsaWNpdGx5IGFsbG93IGl0IGhlcmU/Cj4KPiBXb24ndCBpdCBiZSBuYXR1
cmFsbHkgYWRkZWQgdG8gdGhlIGd1ZXN0IHBvbGljeSBhcyB0aGUgcmVzdCBvZgo+IGZlYXR1cmVz
PwoKY3B1aWRtYXNrX2RlZmF1bHRzIHNlcnZlcyBhcyBhbiBhbmQtbWFzayBvdmVyIGFueSBjb250
ZW50IHRoZSBndWVzdApwb2xpY3kgc2VsZWN0cy4KClRoaXMgaXMgYmVjYXVzZSwgaW4gdGhlIEFN
RCBjYXNlLCB0aGVzZSBhcmUgYWN0dWFsbHkgb3ZlcnJpZGUgTVNScwpyYXRoZXIgdGhhbiBtYXNr
IE1TUnMuwqAgQ2FyZSBoYXMgdG8gYmUgdGFrZW4gbm90IHRvIGFkdmVydGlzZSBhbnkKZmVhdHVy
ZXMgdGhlIHBpcGVsaW5lIGNhbid0IGRlbGl2ZXIgb24sIGJ1dCBpdCBpcyBhbHNvIHRoZSBwcm9w
ZXJseQp3aGljaCBhbGxvd3MgdXMgdG8gYWR2ZXJ0aXNlIHRoZSBIWVBFUlZJU09SIGJpdCBpbiBn
ZW5lcmFsLgoKUHJldmlvdXNseSwgSFlQRVJWSVNPUiB3YXMgd2l0aGluIHRoZSBhbmQgbWFzaywg
c28gaWYgdGhlIGd1ZXN0IHBvbGljeQpyZXF1ZXN0cyBpdCAod2hpY2ggaXQgd2lsbCBieSBkZWZh
dWx0LCBidXQgY2FuIGJlIHR1cm5lZCB3aXRoIHN1ZmZpY2llbnQKY3B1aWQ9IGNvbmZpZ3VyYXRp
b24pLCBpdCB3b3VsZCBnZXQgaW5jbHVkZWQuwqAgV2l0aCB0aGlzIGNoYW5nZSwKSFlQRVJWSVNP
UiBpcyBub3cgY2xlYXIgaW4gdGhlIG1hc2ssIHNvIG5lZWRzIGV4cGxpY2l0bHkgYWRkaW5nIGJh
Y2sgaW4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
