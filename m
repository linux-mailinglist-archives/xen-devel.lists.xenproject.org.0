Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F81528CF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:04:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHVv-0002Mz-6W; Wed, 05 Feb 2020 10:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHVt-0002Mq-LS
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:02:29 +0000
X-Inumbo-ID: 9de6699e-47fe-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de6699e-47fe-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 10:02:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80162AF9F;
 Wed,  5 Feb 2020 10:02:27 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
 <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
 <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eff7962d-c6e8-c185-43b6-5c851423cddd@suse.com>
Date: Wed, 5 Feb 2020 11:02:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMDo1MCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFR1ZSwgMjAy
MC0wMi0wNCBhdCAxNTozNyArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gQXQgdmVyeSBs
ZWFzdCBpdCdzIG1vcmUgcm9idXN0IHRoaXMgd2F5OyB0aGUgYWxnb3JpdGhtIGlzIGFsc28gbGVz
cwo+PiAibWFnaWMiLiAgV2UganVzdCBoYWQgYSBsb25nIGRpc2N1c3Npb24gdGhpcyBtb3JuaW5n
IHRyeWluZyB0byByZS1jcmVhdGUKPj4gdGhlIGxvZ2ljIGZvciB3aHkgIlJlbW92ZSBNRk4gMCIg
d2FzIHN1ZmZpY2llbnQgdG8gcHJldmVudCB0aGlzIGlzc3VlLAo+PiBhbmQgZXZlbiB0aGVuIERh
dmlkIHdhc24ndCBzdXJlIGl0IHdhcyBjb3JyZWN0IGF0IGZpcnN0Lgo+IAo+IFJpZ2h0LiBTbyB0
aGUgcmVhbCByZWFzb24gSSdtIHN0YXJpbmcgaGFyZCBhdCB0aGlzIGlzIGJlY2F1c2UgSSBjYW4n
dAo+IGNvbnZpbmNlIG15c2VsZiB0aGVyZSBhcmVuJ3QgcGxhY2VzIHdoZXJlIG1lbW9yeSBhbGxv
Y2F0ZWQgYnkgdGhlIGJvb3QKPiBhbGxvY2F0b3IgaXMgbGF0ZXIgZnJlZWQgd2l0aCBmcmVlX3hl
bmhlYXBfcGFnZXMoKS4KPiAKPiBXZSBoYXZlIGEgZmV3IHBpZWNlcyBvZiBjb2RlIHdoaWNoIGRl
Y2lkZSB3aGV0aGVyIHRvIHVzZSB0aGUgYm9vdAo+IGFsbG9jYXRvciB2cy4gaGVhcCBiYXNlZCBv
biBzeXN0ZW1fc3RhdGUgPj0gU1lTX1NUQVRFX2Jvb3QsIGFuZCAqaWYqCj4gdGhlIHJ1bGUgaXMg
InRob3Ugc2hhbHQgbm90IGFsbG9jYXRlIHdpdGggYm9vdCBhbGxvY2F0b3IgYW5kIGZyZWUKPiBs
YXRlciIgdGhlbiBpdCdzICpleHRyZW1lbHkqIGZyYWdpbGUgYW5kIHByb2JhYmx5IGJlaW5nIHZp
b2xhdGVkIOKAlAo+IGVzcGVjaWFsbHkgYmVjYXVzZSBpdCBhY3R1YWxseSAqd29ya3MqIG1vc3Qg
b2YgdGhlIHRpbWUsIGV4Y2VwdCBpbiBzb21lCj4gZXNvdGVyaWMgY29ybmVyIGNhc2VzIGxpa2Ug
TUZOIzAsIGJvb3QgYWxsb2NhdGlvbnMgd2hpY2ggY3Jvc3MKPiB6b25lcy9yZWdpb25zLCBldGMu
Cj4gCj4gU28gYmVjYXVzZSB3ZSB3YW50IHRvIG1ha2UgdGhhdCAqbW9yZSogbGlrZWx5IGJ5IGFs
bG93aW5nIHZtYXAoKSB0bwo+IGhhcHBlbiBlYXJsaWVyLCBJJ2QgbGlrZSB0byBjbGVhbiB0aGlu
Z3MgdXAgYnkgYWRkcmVzc2luZyB0aG9zZSBjb3JuZXIKPiBjYXNlcyBhbmQgbWFraW5nIGl0IHVu
Y29uZGl0aW9uYWxseSBPSyB0byBmcmVlIGJvb3QtYWxsb2NhdGVkIHBhZ2VzCj4gaW50byB0aGUg
aGVhcC4KPiAKPiBJIHRoaW5rIG1pZ2h0IGJlIGFzIHNpbXBsZSBhcyBjaGVja2luZyBmb3IgKGZp
cnN0X3BnKS0+Y291bnRfaW5mbyA9PSAwCj4gaW4gZnJlZV94ZW5oZWFwX3BhZ2VzKCkuIFRoYXQn
cyBxdWljayBlbm91Z2gsIGFuZCBpZiB0aGUgY291bnRfaW5mbyBpcwo+IHplcm8gdGhlbiBJIHRo
aW5rIGl0IGRvZXMgaW5kaWNhdGUgYSBib290LWFsbG9jYXRlZCBwYWdlLCBiZWNhdXNlIHBhZ2Vz
Cj4gZnJvbSBhbGxvY194ZW5oZWFwX3BhZ2VzKCkgd291bGQgaGF2ZSBQR0NfeGVuX2hlYXAgc2V0
PwoKVGhleSB3b3VsZCwgYnV0IHRoYXQgbGVhdmVzIHthbGxvYyxmcmVlfV9kb21oZWFwX3BhZ2Vz
KCkgb3V0IG9mCnRoZSBwaWN0dXJlLiBJLmUuIC4uLgoKPiBJdCB3b3VsZCBzdWZmaWNlIGp1c3Qg
dG8gcGFzcyBzdWNoIHBhZ2VzIHRvIGluaXRfaGVhcF9wYWdlcygpIGluc3RlYWQKPiBvZiBkaXJl
Y3RseSB0byBmcmVlX2hlYXBfcGFnZXMoKSwgSSB0aGluay4gSnVsaWVuPwo+IAo+IFRoZSBzdHJh
dyBtYW4gdmVyc2lvbiBvZiB0aGF0IGxvb2tzIGEgYml0IGxpa2UgdGhpcy4uLgo+IAo+IC0tLSBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
PiBAQCAtMjMwNCw2ICsyMzA0LDEyIEBAIHZvaWQgZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYs
IHVuc2lnbmVkIGludCBvcmRlcikKPiAgCj4gICAgICBwZyA9IHZpcnRfdG9fcGFnZSh2KTsKPiAg
Cj4gKyAgICAvKiBQYWdlcyBmcm9tIHRoZSBib290IGFsbG9jYXRvciBuZWVkIHRvIHBhc3MgdGhy
b3VnaCBpbml0X2hlYXBfcGFnZXMoKSAqLwo+ICsgICAgaWYgKCB1bmxpa2VseSghcGctPmNvdW50
X2luZm8pICkKCi4uLiB3aGlsZSBJIHRoaW5rIHRoaXMgY2hlY2sgbWF5IGJlIGZpbmUgaGVyZSwg
bm8gc2ltaWxhciBvbmUKY2FuIGJlIHVzZWQgaW4gZnJlZV9kb21oZWFwX3BhZ2VzKCksIHlldCBw
YWdlcyBnZXR0aW5nIGhhbmRlZAp0aGVyZSBpc24ndCBsZXNzIGxpa2VseSB0aGFuIG9uZXMgZ2V0
dGluZyBoYW5kZWQgdG8KZnJlZV94ZW5oZWFwX3BhZ2VzKCkgKGlmIHdlIGFscmVhZHkgZmVhciBt
aXNtYXRjaCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
