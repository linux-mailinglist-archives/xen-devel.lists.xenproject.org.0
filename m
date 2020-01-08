Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5B133FC6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip926-0001tF-QD; Wed, 08 Jan 2020 10:57:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ip924-0001t9-HM
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:57:48 +0000
X-Inumbo-ID: b45ebe1c-3205-11ea-b79c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b45ebe1c-3205-11ea-b79c-12813bfff9fa;
 Wed, 08 Jan 2020 10:57:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29F16AD12;
 Wed,  8 Jan 2020 10:57:47 +0000 (UTC)
To: Michael Kelley <mikelley@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
 <MW2PR2101MB10520EB8D020D858A3499656D73F0@MW2PR2101MB1052.namprd21.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8533f932-180e-40b1-1615-ef6c7c6065bf@suse.com>
Date: Wed, 8 Jan 2020 11:57:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <MW2PR2101MB10520EB8D020D858A3499656D73F0@MW2PR2101MB1052.namprd21.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxNzo0NSwgTWljaGFlbCBLZWxsZXkgd3JvdGU6Cj4gRnJvbTogV2VpIExp
dSA8d2xAeGVuLm9yZz4gU2VudDogVHVlc2RheSwgSmFudWFyeSA3LCAyMDIwIDg6MzQgQU0KPj4K
Pj4gT24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTE6Mjc6MThBTSArMDEwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+PiBPbiAwNS4wMS4yMDIwIDE3OjQ3LCBXZWkgTGl1IHdyb3RlOgo+Pj4+IEh5cGVy
LVYncyBpbnB1dCAvIG91dHB1dCBhcmd1bWVudCBtdXN0IGJlIDggYnl0ZXMgYWxpZ25lZCBhbiBu
b3QgY3Jvc3MKPj4+PiBwYWdlIGJvdW5kYXJ5LiBUaGUgZWFzaWVzdCB3YXkgdG8gc2F0aXNmeSB0
aG9zZSByZXF1aXJlbWVudHMgaXMgdG8gdXNlCj4+Pj4gcGVyY3B1IHBhZ2UuCj4+Pgo+Pj4gSSdt
IG5vdCBzdXJlICJlYXNpZXN0IiBpcyByZWFsbHkgdHJ1ZSBoZXJlLiBPdGhlcnMgY291bGQgY29u
c2lkZXIgYWRkaW5nCj4+PiBfX2FsaWduZWQoKSBhdHRyaWJ1dGVzIGFzIGVhc3kgb3IgZXZlbiBl
YXNpZXIgKGJ5IGJlaW5nIGV2ZW4gbW9yZQo+Pj4gdHJhbnNwYXJlbnQgdG8gdXNlIHNpdGVzKS4g
Q291bGQgd2Ugc2V0dGxlIG9uICJPbmUgd2F5IC4uLiI/Cj4+Cj4+IERvIHlvdSBtZWFuIHNvbWV0
aGluZyBsaWtlCj4+Cj4+ICAgIHN0cnVjdCBmb28gX19hbGlnbmVkKDgpOwo+Pgo+PiAgICBodl9k
b19oeXBlcmNhbGwoT1AsIHZpcnRfdG9fbWFkZHIoJmZvbyksIC4uLik7Cj4+Cj4+ID8KPj4KPj4g
SSBkb24ndCB0aGluayB0aGlzIGlzIHRyYW5zcGFyZW50IHRvIHVzZXIgc2l0ZXMuIFBsdXMsIGZv
byBpcyBvbiBzdGFjawo+PiB3aGljaCBpcyAxKSBkaWZmaWN1bHQgdG8gZ2V0IGl0cyBtYWRkciwg
MikgbWF5IGNyb3NzIHBhZ2UgYm91bmRhcnkuCj4+Cj4+IElmIEkgbWlzdW5kZXJzdG9vZCB3aGF0
IHlvdSBtZWFudCwgcGxlYXNlIGdpdmUgbWUgYW4gZXhhbXBsZSBoZXJlLgo+Pgo+Pj4KPj4+PiBA
QCAtODMsMTQgKzg0LDMzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFn
ZSh2b2lkKQo+Pj4+ICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxf
bXNyLmFzX3VpbnQ2NCk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+ICtzdGF0aWMgdm9pZCBzZXR1cF9oeXBl
cmNhbGxfcGNwdV9hcmcodm9pZCkKPj4+PiArewo+Pj4+ICsgICAgdm9pZCAqbWFwcGluZzsKPj4+
PiArCj4+Pj4gKyAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4+Pj4gKyAgICBp
ZiAoICFtYXBwaW5nICkKPj4+PiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIGh5
cGVyY2FsbCBpbnB1dCBwYWdlIGZvciAldVxuIiwKPj4+Cj4+PiAiLi4uIGZvciBDUFUldVxuIiBw
bGVhc2UuCj4+Pgo+Pj4+ICsgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4+Pj4g
Kwo+Pj4+ICsgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpID0gbWFwcGluZzsKPj4+Cj4+
PiBXaGVuIG9mZmxpbmluZyBhbmQgdGhlbiByZS1vbmxpbmluZyBhIENQVSwgdGhlIHByaW9yIHBh
Z2Ugd2lsbCBiZQo+Pj4gbGVha2VkLgo+Pgo+PiBSaWdodC4gVGhhbmtzIGZvciBjYXRjaGluZyB0
aGlzIG9uZS4KPj4KPj4+Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnYuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPj4+PiBA
QCAtNTEsNiArNTEsOCBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X3NjYWxlX3RzYyh1aW50
NjRfdCB0c2MsIHVpbnQ2NF90IHNjYWxlLAo+Pj4+Cj4+Pj4gICNpZmRlZiBDT05GSUdfSFlQRVJW
X0dVRVNUCj4+Pj4KPj4+PiArI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPj4+PiArCj4+Pj4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5oPgo+Pj4+Cj4+Pj4gIHN0cnVjdCBtc19oeXBl
cnZfaW5mbyB7Cj4+Pj4gQEAgLTYzLDYgKzY1LDggQEAgc3RydWN0IG1zX2h5cGVydl9pbmZvIHsK
Pj4+PiAgfTsKPj4+PiAgZXh0ZXJuIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBtc19oeXBlcnY7Cj4+
Pj4KPj4+PiArREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+Pj4K
Pj4+IFdpbGwgdGhpcyByZWFsbHkgYmUgbmVlZGVkIG91dHNpZGUgb2YgdGhlIGZpbGUgdGhhdCBk
ZWZpbmVzIGl0Pwo+Pj4KPj4KPj4gVGhpcyBjYW4gbGl2ZSBpbiBhIHByaXZhdGUgaGVhZGVyIGZv
ciB0aGUgdGltZSBiZWluZy4KPj4KPj4+IEFsc28sIHdoaWxlIGxvb2tpbmcgYXQgdGhpcyBJIG5v
dGljZSB0aGF0IC0gZGVzcGl0ZSBteSBlYXJsaWVyCj4+PiBjb21tZW50IHdoZW4gZ2l2aW5nIHRo
ZSByZXNwZWN0aXZlLCBzb3J0LW9mLWNvbmRpdGlvbmFsIGFjayAtCj4+PiB0aGVyZSBhcmUgKHN0
aWxsKSBtYW55IGFwcGFyZW50bHkgcG9pbnRsZXNzIF9fcGFja2VkIGF0dHJpYnV0ZXMKPj4+IGlu
IGh5cGVydi10bGZzLmguIENhcmUgdG8gY29tbWVudCBvbiB0aGlzPwo+Pgo+PiBBZ2FpbiwgdGhh
dCdzIGEgc3RyYWlnaHQgaW1wb3J0IGZyb20gTGludXguIEkgdHJpZWQgbm90IHRvIGRldmlhdGUg
dG9vCj4+IG11Y2guIEEgY29tbWl0IGluIExpbnV4IChlYzA4NDQ5MTcyN2IwKSBjbGFpbXMgImNv
bXBpbGVyIGNhbiBhZGQKPj4gYWxpZ25tZW50IHBhZGRpbmcgdG8gc3RydWN0dXJlcyBvciByZW9y
ZGVyIHN0cnVjdCBtZW1iZXJzIGZvcgo+PiByYW5kb21pemF0aW9uIGFuZCBvcHRpbWl6YXRpb24i
Lgo+Pgo+PiBJIGp1c3QgY2hlY2tlZCBhbGwgdGhlIHBhY2tlZCBzdHJ1Y3R1cmVzLiBUaGV5IHNl
ZW0gdG8gaGF2ZSBhbGwgdGhlCj4+IHJlcXVpcmVkIG1hbnVhbCBwYWRkaW5ncyBhbHJlYWR5LiBJ
IGNhbiBvbmx5IGFzc3VtZSB0aGV5IHRyaWVkIHRvIGVycmVkCj4+IG9uIHRoZSBzYWZlIHNpZGUu
Cj4gCj4gQ29ycmVjdC4gIFRoZSBfX3BhY2tlZCBhdHRyaWJ1dGUgd2FzIGFkZGVkIG9ubHkgYWJv
dXQgYSB5ZWFyIGFnbwo+IGFmdGVyIHNvbWVib2R5IG9uIExLTUwgbm90aWNlZCB0aGF0IHRoZSBz
dHJ1Y3R1cmVzIHdlcmUgbm90IHBhY2tlZC4KPiBTb21lIGRpc2N1c3Npb24gZW5zdWVkLCBidXQg
dGhlIGNvbnNlbnN1cyB3YXMgdG8gYWRkIF9fcGFja2VkIGR1ZQo+IHRvIGdlbmVyYWwgIHBhcmFu
b2lhIGFib3V0IHdoYXQgdGhlIGNvbXBpbGVyIG1pZ2h0IGRvIGV2ZW4gdGhvdWdoCj4gaW5kaXZp
ZHVhbCBmaWVsZHMgYXJlIGFsaWduZWQgdG8gdGhlaXIgbmF0dXJhbCBib3VuZGFyeS4KCldoaWNo
LCBhcyB3d2UndmUgZm91bmQgdGhlIGhhcmQgd2F5LCB0aGVuIGxlYWRzIHRvIHByb2JsZW1zICh3
aXRoIGF0CmxlYXN0IGdjYyA5KSB3aGVuIHdhbnRpbmcgdG8gdGFrZSB0aGUgYWRkcmVzcyBvZiBh
IG1lbWJlciBvZiBzdWNoIGEKc3RydWN0dXJlLCBhcyB0aGUgY29tcGlsZXIgdGhlbiAobW9zdGx5
IHZhbGlkbHkpIGFzc3VtZXMgdGhlIHBvaW50ZXIKd29uJ3QgYmUgbmF0dXJhbGx5IGFsaWduZWQu
IEhlbmNlLCBhcyBhbHNvIHNhaWQgaW4gcmVwbHkgdG8gV2VpCmVsc2V3aGVyZSwgd2UgZm91bmQg
aXQgbmVjZXNzYXJ5IHRvIGRyb3AgdmFyaW91cyBfX3BhY2tlZCBpbiBvcmRlcgp0byBiZSBhYmxl
IHRvIGJ1aWxkIFhlbiB3aXRoIGdjYyA5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
