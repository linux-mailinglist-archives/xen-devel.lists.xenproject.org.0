Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAFA17E13D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 14:32:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBISH-0002HX-Pl; Mon, 09 Mar 2020 13:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBISG-0002HS-Ud
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 13:28:24 +0000
X-Inumbo-ID: da069140-6209-11ea-ac30-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da069140-6209-11ea-ac30-12813bfff9fa;
 Mon, 09 Mar 2020 13:28:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 54D34AD45;
 Mon,  9 Mar 2020 13:28:23 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41a8e134-bb6e-0437-536b-48afa3fa0ac9@suse.com>
Date: Mon, 9 Mar 2020 14:28:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309102304.1251-6-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/6] mm: add 'is_special_page' inline
 function...
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxMToyMywgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IHY0Ogo+ICAtIFVzZSBp
bmxpbmUgZnVuY3Rpb24gaW5zdGVhZCBvZiBtYWNybwo+ICAtIEFkZCBtaXNzaW5nIGNvbnZlcnNp
b25zIGZyb20gaXNfeGVuX2hlYXBfcGFnZSgpCgpBbW9uZyB0aGVzZSBhbHNvIG9uZSBjb252ZXJz
aW9uIG9mIGlzX3hlbl9oZWFwX21mbigpLiBJJ20gc3RpbGwKY3VyaW91cyB3aHkgb3RoZXJzIHdv
dWxkbid0IG5lZWQgY29udmVydGluZyAtIHRoZSBkZXNjcmlwdGlvbgpkb2Vzbid0IG1lbnRpb24g
dGhlcmUgYXJlIG1vcmUsIHNlZSBwMm1fYWRkX2ZvcmVpZ24oKSBmb3IgYW4KZXhhbXBsZSAobWF5
IHdhcnJhbnQgaW50cm9kdWN0aW9uIG9mIGlzX3NwZWNpYWxfbWZuKCkgdGhlbikuIEl0CndvdWxk
IHByb2JhYmx5IGJlIGJlbmVmaWNpYWwgaWYgdGhlIGRlc2NyaXB0aW9uIGdhdmUgc29tZQpnZW5l
cmljIGNyaXRlcmlhIGZvciBjYXNlcyB3aGVyZSBjb252ZXJzaW9uIGlzIChub3QpIG5lZWRlZC4K
CkJ1dCB0aGVyZSBhcmUgaXNzdWVzIGJleW9uZCB0aGlzLCBhcyB0aGVyZSBhcmUgYWxzbyBvcGVu
LWNvZGVkCmluc3RhbmNlcyBvZiBQR0NfeGVuX2hlYXAgY2hlY2tzLCBhbmQgdGhhdCdzIHRoZSBv
dGhlciBwb3NzaWJsZQpyZWdyZXNzaW9uIEkgbm90aWNlIGZyb20gdGhlIEFQSUMgYXNzaXN0IE1G
TiBwYWdlIGNvbnZlcnNpb246ClBvRCBjb2RlLCB0byBhdm9pZCBkb2luZyB0d28gc2VwYXJhdGUg
Y2hlY2tzIG9uIC0+Y291bnRfaW5mbyBbMV0sCnVzZXMgdHdvIGluc3RhbmNlcyBvZiBhIGNvbnN0
cnVjdCBsaWtlIHRoaXMgb25lCgogICAgICAgICAgICAgIShwZy0+Y291bnRfaW5mbyAmIChQR0Nf
cGFnZV90YWJsZSB8IFBHQ194ZW5faGVhcCkpICYmCgooYW5kIGFnYWluIEkgZGlkbid0IGRvIGEg
Y29tcGxldGUgYXVkaXQgZm9yIGZ1cnRoZXIKb2NjdXJyZW5jZXMpLiBUaGlzIG1lYW5zIHRoZSBB
UElDIGFzc2lzdCBwYWdlIHJpZ2h0IG5vdyBtaWdodApiZSBhIGNhbmRpZGF0ZSBmb3IgZ2V0dGlu
ZyBjb252ZXJ0ZWQgdG8gUG9EIChwb3NzaWJseSBvdGhlcnMgb2YKdGhlIGNvbnN0cmFpbnRzIGFj
dHVhbGx5IHByb2hpYml0IHRoaXMsIGJ1dCBJJ20gbm90IHN1cmUpLgoKWzFdIEknbSB1bmNvbnZp
bmNlZCBQR0NfcGFnZV90YWJsZSBwYWdlcyBjYW4gYWN0dWFsbHkgYXBwZWFyCnRoZXJlLCBzbyB0
aGUgb3Blbi1jb2RpbmcgbWF5IGluIGZhY3QgYmUgYW4gb3B0aW1pemF0aW9uIG9mCmRlYWQgY29k
ZS4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiBAQCAtMjA4NywxOSArMjA4NywyMiBAQCBzdGF0
aWMgaW50IHNoX3JlbW92ZV9hbGxfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgZ21m
biwgZ2ZuX3QgZ2ZuKQo+ICAgICAgICAgICAqIFRoZSBxZW11IGhlbHBlciBwcm9jZXNzIGhhcyBh
biB1bnR5cGVkIG1hcHBpbmcgb2YgdGhpcyBkb20ncyBSQU0KPiAgICAgICAgICAgKiBhbmQgdGhl
IEhWTSByZXN0b3JlIHByb2dyYW0gdGFrZXMgYW5vdGhlci4KPiAgICAgICAgICAgKiBBbHNvIGFs
bG93IG9uZSB0eXBlZCByZWZjb3VudCBmb3IKPiAtICAgICAgICAgKiAtIFhlbiBoZWFwIHBhZ2Vz
LCB0byBtYXRjaCBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KCksCj4gLSAgICAgICAgICogLSBp
b3JlcSBzZXJ2ZXIgcGFnZXMsIHRvIG1hdGNoIHByZXBhcmVfcmluZ19mb3JfaGVscGVyKCkuCj4g
KyAgICAgICAgICogLSBzcGVjaWFsIHBhZ2VzLCB3aGljaCBhcmUgZXhwbGljaXRseSByZWZlcmVu
Y2VkIGFuZCBtYXBwZWQgYnkKPiArICAgICAgICAgKiAgIFhlbi4KPiArICAgICAgICAgKiAtIGlv
cmVxIHNlcnZlciBwYWdlcywgd2hpY2ggbWF5IGJlIHNwZWNpYWwgcGFnZXMgb3Igbm9ybWFsCj4g
KyAgICAgICAgICogICBndWVzdCBwYWdlcyB3aXRoIGFuIGV4dHJhIHJlZmVyZW5jZSB0YWtlbiBi
eQo+ICsgICAgICAgICAqICAgcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPiAgICAgICAgICAg
Ki8KPiAgICAgICAgICBpZiAoICEoc2hhZG93X21vZGVfZXh0ZXJuYWwoZCkKPiAgICAgICAgICAg
ICAgICAgJiYgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPD0gMwo+ICAgICAg
ICAgICAgICAgICAmJiAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2sp
Cj4gLSAgICAgICAgICAgICAgICAgICA9PSAoaXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fAo+ICsg
ICAgICAgICAgICAgICAgICAgPT0gKGlzX3NwZWNpYWxfcGFnZShwYWdlKSB8fAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIChpc19odm1fZG9tYWluKGQpICYmIGlzX2lvcmVxX3NlcnZlcl9wYWdl
KGQsIHBhZ2UpKSkpKSApCj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgImNhbid0
IGZpbmQgYWxsIG1hcHBpbmdzIG9mIG1mbiAlIlBSSV9tZm4KPiAtICAgICAgICAgICAgICAgICAg
ICIgKGdmbiAlIlBSSV9nZm4iKTogYz0lbHggdD0lbHggeD0lZCBpPSVkXG4iLAo+ICsgICAgICAg
ICAgICAgICAgICAgIiAoZ2ZuICUiUFJJX2dmbiIpOiBjPSVseCB0PSVseCBzPSVkIGk9JWRcbiIs
Cj4gICAgICAgICAgICAgICAgICAgICBtZm5feChnbWZuKSwgZ2ZuX3goZ2ZuKSwKPiAgICAgICAg
ICAgICAgICAgICAgIHBhZ2UtPmNvdW50X2luZm8sIHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvLAo+
IC0gICAgICAgICAgICAgICAgICAgISFpc194ZW5faGVhcF9wYWdlKHBhZ2UpLAo+ICsgICAgICAg
ICAgICAgICAgICAgISFpc19zcGVjaWFsX3BhZ2UocGFnZSksCgpUaGUgcmVhc29uIGZvciBtZSB0
byBhc2sgdG8gc3dpdGNoIHRvIGFuIGlubGluZSBmdW5jdGlvbiB3YXMgdG8Kc2VlIHRoaXMgISEg
Z28gYXdheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
