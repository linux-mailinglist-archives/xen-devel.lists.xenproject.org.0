Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B054173D63
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:46:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iku-0000Ew-30; Fri, 28 Feb 2020 16:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7iks-0000Er-Hh
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:44:50 +0000
X-Inumbo-ID: a2510dec-5a49-11ea-8e51-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2510dec-5a49-11ea-8e51-bc764e2007e4;
 Fri, 28 Feb 2020 16:44:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62414AC79;
 Fri, 28 Feb 2020 16:44:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-4-roger.pau@citrix.com>
 <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
 <20200228163135.GD24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c390bcde-f0c6-fd53-ac17-2e2791b1087a@suse.com>
Date: Fri, 28 Feb 2020 17:44:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228163135.GD24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMjo1ODo0MlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL2hhcC9oYXAuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+
Pj4gQEAgLTY2OSwzMiArNjY5LDI4IEBAIHN0YXRpYyB2b2lkIGhhcF91cGRhdGVfY3IzKHN0cnVj
dCB2Y3B1ICp2LCBpbnQgZG9fbG9ja2luZywgYm9vbCBub2ZsdXNoKQo+Pj4gICAgICBodm1fdXBk
YXRlX2d1ZXN0X2NyMyh2LCBub2ZsdXNoKTsKPj4+ICB9Cj4+PiAgCj4+PiArLyoKPj4+ICsgKiBO
QjogZG9lc24ndCBhY3R1YWxseSBwZXJmb3JtIGFueSBmbHVzaCwgdXNlZCBqdXN0IHRvIGNsZWFy
IHRoZSBDUFUgZnJvbSB0aGUKPj4+ICsgKiBtYXNrIGFuZCBoZW5jZSBzaWduYWwgdGhhdCB0aGUg
Z3Vlc3QgVExCIGZsdXNoIGhhcyBiZWVuIGRvbmUuCj4+PiArICovCj4+Cj4+ICJoYXMgYmVlbiBk
b25lIiBpc24ndCBjb3JyZWN0LCBhcyB0aGUgZmx1c2ggbWF5IGhhcHBlbiBvbmx5IGxhdGVyCj4+
IG9uICh1cG9uIG5leHQgVk0gZW50cnkpLiBJIHRoaW5rIHdvcmRpbmcgaGVyZSBuZWVkcyB0byBi
ZSBhcwo+PiBwcmVjaXNlIGFzIHBvc3NpYmxlLCBob3dldmVyIHRoZSBjb21tZW50IG1heSB0dXJu
IG91dCB1bm5lY2Vzc2FyeQo+PiBhbHRvZ2V0aGVyOgo+IAo+IFdoYXQgYWJvdXQ6Cj4gCj4gLyoK
PiAgKiBOQjogRHVtbXkgZnVuY3Rpb24gZXhjbHVzaXZlbHkgdXNlZCBhcyBhIHdheSB0byB0cmln
Z2VyIGEgdm1leGl0LAo+ICAqIGFuZCB0aHVzIGZvcmNlIGFuIEFTSUQvVlBJRCB1cGRhdGUgb24g
dm1lbnRyeSAodGhhdCB3aWxsIGZsdXNoIHRoZQo+ICAqIGNhY2hlKS4KPiAgKi8KCk9uY2UgaXQn
cyBlbXB0eSAtIHllcywgbG9va3Mgb2theSAod2l0aCBzL2NhY2hlL1RMQi8pLgoKPj4+IEBAIC03
MDUsMjAgKzcwMSwyMiBAQCBib29sIGhhcF9mbHVzaF90bGIoYm9vbCAoKmZsdXNoX3ZjcHUpKHZv
aWQgKmN0eHQsIHN0cnVjdCB2Y3B1ICp2KSwKPj4+ICAgICAgICAgIGlmICggIWZsdXNoX3ZjcHUo
Y3R4dCwgdikgKQo+Pj4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4gIAo+Pj4gLSAgICAgICAg
cGFnaW5nX3VwZGF0ZV9jcjModiwgZmFsc2UpOwo+Pj4gKyAgICAgICAgaHZtX2FzaWRfZmx1c2hf
dmNwdSh2KTsKPj4+ICAKPj4+ICAgICAgICAgIGNwdSA9IHJlYWRfYXRvbWljKCZ2LT5kaXJ0eV9j
cHUpOwo+Pj4gLSAgICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2NwdShjcHUpICkKPj4+ICsgICAg
ICAgIGlmICggY3B1ICE9IHRoaXNfY3B1ICYmIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQo+Pj4g
ICAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwgbWFzayk7Cj4+PiAgICAgIH0KPj4+
ICAKPj4+IC0gICAgLyogRmx1c2ggVExCcyBvbiBhbGwgQ1BVcyB3aXRoIGRpcnR5IHZjcHUgc3Rh
dGUuICovCj4+PiAtICAgIGZsdXNoX3RsYl9tYXNrKG1hc2spOwo+Pj4gLQo+Pj4gLSAgICAvKiBE
b25lLiAqLwo+Pj4gLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4+PiAtICAgICAgICBpZiAo
IHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKPj4+IC0gICAgICAgICAgICB2
Y3B1X3VucGF1c2Uodik7Cj4+PiArICAgIC8qCj4+PiArICAgICAqIFRyaWdnZXIgYSB2bWV4aXQg
b24gYWxsIHBDUFVzIHdpdGggZGlydHkgdkNQVSBzdGF0ZSBpbiBvcmRlciB0byBmb3JjZSBhbgo+
Pj4gKyAgICAgKiBBU0lEL1ZQSUQgY2hhbmdlIGFuZCBoZW5jZSBhY2NvbXBsaXNoIGEgZ3Vlc3Qg
VExCIGZsdXNoLiBOb3RlIHRoYXQgdkNQVXMKPj4+ICsgICAgICogbm90IGN1cnJlbnRseSBydW5u
aW5nIHdpbGwgYWxyZWFkeSBiZSBmbHVzaGVkIHdoZW4gc2NoZWR1bGVkIGJlY2F1c2Ugb2YKPj4+
ICsgICAgICogdGhlIEFTSUQgdGlja2xlIGRvbmUgaW4gdGhlIGxvb3AgYWJvdmUuCj4+PiArICAg
ICAqLwo+Pj4gKyAgICBvbl9zZWxlY3RlZF9jcHVzKG1hc2ssIGhhbmRsZV9mbHVzaCwgbWFzaywg
MCk7Cj4+PiArICAgIHdoaWxlICggIWNwdW1hc2tfZW1wdHkobWFzaykgKQo+Pj4gKyAgICAgICAg
Y3B1X3JlbGF4KCk7Cj4+Cj4+IFdoeSBkbyB5b3UgcGFzcyAwIGFzIGxhc3QgYXJndW1lbnQ/IElm
IHlvdSBwYXNzZWQgMSwgeW91IHdvdWxkbid0Cj4+IG5lZWQgdGhlIHdoaWxlKCkgaGVyZSwgaGFu
ZGxlX2ZsdXNoKCkgY291bGQgYmUgZW1wdHksIGFuZCB5b3UnZAo+PiBzYXZlIGEgcGVyaGFwcyBs
YXJnZSBhbW91bnQgb2YgQ1BVcyB0byBhbGwgdHJ5IHRvIG1vZGlmeSB0d28KPj4gY2FjaGUgbGlu
ZXMgKHRoZSBvbmUgdXNlZCBieSBvbl9zZWxlY3RlZF9jcHVzKCkgaXRzZWxmIGFuZCB0aGUKPj4g
b25lIGhlcmUpIGluc3RlYWQgb2YganVzdCBvbmUuIFllcywgbGF0ZW5jeSBmcm9tIHRoZSBsYXN0
IENQVQo+PiBjbGVhcmluZyBpdHMgYml0IHRvIHlvdSBiZWluZyBhYmxlIHRvIGV4aXQgZnJvbSBo
ZXJlIG1heSBiZSBhCj4+IGxpdHRsZSBsYXJnZXIgdGhpcyB3YXksIGJ1dCBvdmVyYWxsIGxhdGVu
Y3kgbWF5IHNocmluayB3aXRoIHRoZQo+PiBjdXQgYnkgaGFsZiBhbW91bnQgb2YgYXRvbWljIG9w
cyBpc3N1ZWQgdG8gdGhlIGJ1cy4KPiAKPiBJbiBmYWN0IEkgdGhpbmsgcGFzc2luZyAwIGFzIHRo
ZSBsYXN0IGFyZ3VtZW50IGlzIGZpbmUsIGFuZAo+IGhhbmRsZV9mbHVzaCBjYW4gYmUgZW1wdHkg
aW4gdGhhdCBjYXNlIGFueXdheS4gV2UgZG9uJ3QgcmVhbGx5IGNhcmUKPiB3aGV0aGVyIG9uX3Nl
bGVjdGVkX2NwdXMgcmV0dXJucyBiZWZvcmUgYWxsIENQVXMgaGF2ZSBleGVjdXRlZCB0aGUKPiBk
dW1teSBmdW5jdGlvbiwgYXMgbG9uZyBhcyBhbGwgb2YgdGhlbSBoYXZlIHRha2VuIGEgdm1leGl0
LiBVc2luZyAwCj4gYWxyZWFkeSBndWFyYW50ZWVzIHRoYXQgQUZBSUNULgoKSXNuJ3QgaXQgdGhh
dCB0aGUgY2FsbGVyIGFudHMgdG8gYmUgZ3VhcmFudGVlZCB0aGF0IHRoZSBmbHVzaApoYXMgYWN0
dWFsbHkgb2NjdXJyZWQgKG9yIGF0IGxlYXN0IHRoYXQgbm8gZnVydGhlciBpbnNucyBjYW4KYmUg
ZXhlY3V0ZWQgcHJpb3IgdG8gdGhlIGZsdXNoIGhhcHBlbmluZywgaS5lLiBhdCBsZWFzdCB0aGUg
Vk0KZXhpdCBoYXZpbmcgb2NjdXJyZWQpPwoKPj4gKEZvcmNpbmcgYW4gZW1wdHkgZnVuY3Rpb24g
dG8gYmUgY2FsbGVkIG1heSBzZWVtIG9kZCwgYnV0IHNlbmRpbmcKPj4gIGp1c3Qgc29tZSBJUEkg
W2xpa2UgdGhlIGV2ZW50IGNoZWNrIG9uZV0gd291bGRuJ3QgYmUgZW5vdWdoLCBhcwo+PiAgeW91
IHdhbnQgdG8gYmUgc3VyZSB0aGUgb3RoZXIgc2lkZSBoYXMgYWN0dWFsbHkgcmVjZWl2ZWQgdGhl
Cj4+ICByZXF1ZXN0LikKPiAKPiBFeGFjdGx5LCB0aGF0J3MgdGhlIHJlYXNvbiBmb3IgdGhlIGVt
cHR5IGZ1bmN0aW9uLgoKQnV0IHRoZSBmdW5jdGlvbiBpc24ndCBlbXB0eS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
