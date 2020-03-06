Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBD17BCA8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:23:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABxk-0004J0-SN; Fri, 06 Mar 2020 12:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABxj-0004Iv-0i
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:20:19 +0000
X-Inumbo-ID: d70487a2-5fa4-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d70487a2-5fa4-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 12:20:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8FF5B049;
 Fri,  6 Mar 2020 12:20:16 +0000 (UTC)
To: pdurrant@amzn.com
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
Date: Fri, 6 Mar 2020 13:20:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124504.3564-6-pdurrant@amzn.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gLS0tIGEveGVu
L2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvY29tbW9uLmMKPiBAQCAtMjA4NywxOSArMjA4NywyMiBAQCBzdGF0aWMgaW50IHNoX3JlbW92
ZV9hbGxfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgZ21mbiwgZ2ZuX3QgZ2ZuKQo+
ICAgICAgICAgICAqIFRoZSBxZW11IGhlbHBlciBwcm9jZXNzIGhhcyBhbiB1bnR5cGVkIG1hcHBp
bmcgb2YgdGhpcyBkb20ncyBSQU0KPiAgICAgICAgICAgKiBhbmQgdGhlIEhWTSByZXN0b3JlIHBy
b2dyYW0gdGFrZXMgYW5vdGhlci4KPiAgICAgICAgICAgKiBBbHNvIGFsbG93IG9uZSB0eXBlZCBy
ZWZjb3VudCBmb3IKPiAtICAgICAgICAgKiAtIFhlbiBoZWFwIHBhZ2VzLCB0byBtYXRjaCBzaGFy
ZV94ZW5fcGFnZV93aXRoX2d1ZXN0KCksCj4gLSAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFn
ZXMsIHRvIG1hdGNoIHByZXBhcmVfcmluZ19mb3JfaGVscGVyKCkuCj4gKyAgICAgICAgICogLSBz
cGVjaWFsIHBhZ2VzLCB3aGljaCBhcmUgZXhwbGljaXRseSByZWZlcmVuY2VkIGFuZCBtYXBwZWQg
YnkKPiArICAgICAgICAgKiAgIFhlbi4KPiArICAgICAgICAgKiAtIGlvcmVxIHNlcnZlciBwYWdl
cywgd2hpY2ggbWF5IGJlIHNwZWNpYWwgcGFnZXMgb3Igbm9ybWFsCj4gKyAgICAgICAgICogICBn
dWVzdCBwYWdlcyB3aXRoIGFuIGV4dHJhIHJlZmVyZW5jZSB0YWtlbiBieQo+ICsgICAgICAgICAq
ICAgcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPiAgICAgICAgICAgKi8KPiAgICAgICAgICBp
ZiAoICEoc2hhZG93X21vZGVfZXh0ZXJuYWwoZCkKPiAgICAgICAgICAgICAgICAgJiYgKHBhZ2Ut
PmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPD0gMwo+ICAgICAgICAgICAgICAgICAmJiAo
KHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spCj4gLSAgICAgICAgICAg
ICAgICAgICA9PSAoaXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fAo+ICsgICAgICAgICAgICAgICAg
ICAgPT0gKGlzX3NwZWNpYWxfcGFnZShwYWdlKSB8fAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IChpc19odm1fZG9tYWluKGQpICYmIGlzX2lvcmVxX3NlcnZlcl9wYWdlKGQsIHBhZ2UpKSkpKSAp
CgpTaG91bGRuJ3QgeW91IGRlbGV0ZSBtb3N0IG9mIHRoaXMgbGluZSwgYWZ0ZXIgdGhlIHByZXZp
b3VzIHBhdGNoCmNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIHRvIFBHQ19leHRyYSBv
bmVzPwoKPiAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiY2FuJ3QgZmluZCBhbGwg
bWFwcGluZ3Mgb2YgbWZuICUiUFJJX21mbgo+IC0gICAgICAgICAgICAgICAgICAgIiAoZ2ZuICUi
UFJJX2dmbiIpOiBjPSVseCB0PSVseCB4PSVkIGk9JWRcbiIsCj4gKyAgICAgICAgICAgICAgICAg
ICAiIChnZm4gJSJQUklfZ2ZuIik6IGM9JWx4IHQ9JWx4IHM9JWQgaT0lZFxuIiwKPiAgICAgICAg
ICAgICAgICAgICAgIG1mbl94KGdtZm4pLCBnZm5feChnZm4pLAo+ICAgICAgICAgICAgICAgICAg
ICAgcGFnZS0+Y291bnRfaW5mbywgcGFnZS0+dS5pbnVzZS50eXBlX2luZm8sCj4gLSAgICAgICAg
ICAgICAgICAgICAhIWlzX3hlbl9oZWFwX3BhZ2UocGFnZSksCj4gKyAgICAgICAgICAgICAgICAg
ICAhIWlzX3NwZWNpYWxfcGFnZShwYWdlKSwKClRoZSAhISB3b3VsZCBiZSBuaWNlIHRvIGdvIGF3
YXkgYXQgdGhpcyBvY2Nhc2lvbjoKCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgKPiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+IEBAIC0yODUsNiArMjg1LDkgQEAgZXh0ZXJuIHN0cnVj
dCBkb21haW4gKmRvbV9jb3c7Cj4gIAo+ICAjaW5jbHVkZSA8YXNtL21tLmg+Cj4gIAo+ICsjZGVm
aW5lIGlzX3NwZWNpYWxfcGFnZShwYWdlKSBcCj4gKyAgICAoaXNfeGVuX2hlYXBfcGFnZShwYWdl
KSB8fCAoKHBhZ2UpLT5jb3VudF9pbmZvICYgUEdDX2V4dHJhKSkKCkNhbiB0aGlzIGJlY29tZSBh
biBpbmxpbmUgZnVuY3Rpb24gcmV0dXJuaW5nIGJvb2w/CgpBbHNvIEkgbm90aWNlIHRoaXMgY29u
c3RydWN0IGlzIHVzZWQgYnkgeDg2IGNvZGUgb25seSAtIGlzIHRoZXJlCmEgcGFydGljdWxhciBy
ZWFzb24gaXQgZG9lc24ndCBnZXQgcGxhY2VkIGluIGFuIHg4NiBoZWFkZXIgKGF0CmxlYXN0IGZv
ciB0aGUgdGltZSBiZWluZyk/CgpGdXJ0aGVyIEkgbm90aWNlIHlvdSBuZWl0aGVyIHRha2UgY2Fy
ZSBvZiBpc194ZW5faGVhcF9tZm4oKSwgbm9yCmRvZXMgdGhlIGRlc2NyaXB0aW9uIGV4cGxhaW4g
d2h5IHRoYXQgd291bGQgbm90IGFsc28gbmVlZCBhdApsZWFzdCBjb25zaWRlcmluZyBjb252ZXJz
aW9uLiBfc2hfcHJvcGFnYXRlKCksIGZvciBleGFtcGxlLCBoYXMKYW4gaW5zdGFuY2UgdGhhdCBJ
IHRoaW5rIHdvdWxkIG5lZWQgY2hhbmdpbmcuCgpGaW5hbGx5IEkgbm90aWNlIHRoZXJlIGFyZSB0
d28gaXNfeGVuX2hlYXBfcGFnZSgpIHVzZXMgaW4gdGJvb3QuYywKYm90aCBvZiB3aGljaCBsb29r
IGxpa2UgdGhleSBhbHNvIHdhbnQgY29udmVydGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
