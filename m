Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD781647A2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:00:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Qn1-0007m8-V7; Wed, 19 Feb 2020 14:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Qmz-0007m3-W1
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 14:57:26 +0000
X-Inumbo-ID: 232962d0-5328-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 232962d0-5328-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 14:57:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EC14AF4D;
 Wed, 19 Feb 2020 14:57:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
Date: Wed, 19 Feb 2020 15:57:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219144549.GD4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxNTo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCAwMjo0NDoxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgRmVi
IDE5LCAyMDIwIGF0IDAxOjU5OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gRG9uJ3QgYWxs
b3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0cnlsb2NrIGlu
dG8gYQo+Pj4+PiBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2VycyBvZiB0aGUg
Y3B1X2FkZF9yZW1vdmVfbG9jayBhcmUKPj4+Pj4gbGltaXRlZCB0byBDUFUgcGx1Zy91bnBsdWcg
b3BlcmF0aW9ucywgYW5kIGNhbm5vdCBkZWFkbG9jayBiZXR3ZWVuCj4+Pj4+IHRoZW1zZWx2ZXMg
b3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+Pj4+PiBjcHVf
YWRkX3JlbW92ZV9sb2NrIGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQu
IFRoZXJlCj4+Pj4+IGFyZSBhbHNvIG5vIG90aGVyIGxvY2tzIHRha2VuIGR1cmluZyB0aGUgcGx1
Zy91bnBsdWcgb3BlcmF0aW9ucy4KPj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGdvYWwgd2Fz
IGRlYWRsb2NrIGF2b2lkYW5jZSwgYnV0IHJhdGhlciBsaW1pdGluZwo+Pj4+IG9mIHRoZSB0aW1l
IHNwZW50IHNwaW5uaW5nIHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2NrLCBpbgo+Pj4+
IGZhdm9yIG9mIGhhdmluZyB0aGUgY2FsbGVyIHJldHJ5Lgo+Pj4KPj4+IE5vdyB0aGF0IHRoZSBj
b250ZW50aW9uIGJldHdlZW4gcmVhZC1vbmx5IHVzZXJzIGlzIHJlZHVjZWQgYXMgdGhvc2UKPj4+
IGNhbiB0YWtlIHRoZSBsb2NrIGluIHBhcmFsbGVsIEkgdGhpbmsgaXQncyBzYWZlIHRvIHN3aXRj
aCB3cml0ZXJzIHRvCj4+PiBibG9ja2luZyBtb2RlLgo+Pgo+PiBJJ2QgYWdyZWUgaWYgd3JpdGVy
cyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5IChtYW55KSByZWFkZXJzLgo+IAo+IEFGQUlDVCBmcm9t
IHRoZSBydyBsb2NrIGltcGxlbWVudGF0aW9uIHJlYWRlcnMgd29uJ3QgYmUgYWJsZSB0byBwaWNr
Cj4gdGhlIGxvY2sgYXMgc29vbiBhcyB0aGVyZSdzIGEgd3JpdGVyIHdhaXRpbmcsIHdoaWNoIHNo
b3VsZCBhdm9pZCB0aGlzCj4gc3RhcnZhdGlvbj8KPiAKPiBZb3Ugc3RpbGwgbmVlZCB0byB3YWl0
IGZvciBjdXJyZW50IHJlYWRlcnMgdG8gZHJvcCB0aGUgbG9jaywgYnV0IG5vCj4gbmV3IHJlYWRl
cnMgd291bGQgYmUgYWJsZSB0byBsb2NrIGl0LCB3aGljaCBJIHRoaW5rIHNob3VsZCBnaXZiZSB1
cwo+IGVub3VnaCBmYWlybmVzcy4KCkFoLCByaWdodCwgaXQgd2FzIHJhdGhlciB0aGUgb3RoZXIg
d2F5IGFyb3VuZCAtIGJhY2stdG8tYmFjawp3cml0ZXJzIGNhbiBzdGFydmUgcmVhZGVycyB3aXRo
IG91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLgoKPiBPVE9IIHdoZW4gdXNpbmcgX3RyeWxvY2sg
bmV3IHJlYWRlcnMgY2FuIHN0aWxsIHBpY2sKPiB0aGUgbG9jayBpbiByZWFkIG1vZGUsIGFuZCBo
ZW5jZSBJIHRoaW5rIHVzaW5nIGJsb2NraW5nIG1vZGUgZm9yCj4gd3JpdGVycyBpcyBhY3R1YWxs
eSBiZXR0ZXIsIGFzIHlvdSBjYW4gYXNzdXJlIHRoYXQgcmVhZGVycyB3b24ndCBiZQo+IGFibGUg
dG8gc3RhcnZlIHdyaXRlcnMuCgpUaGlzIGlzIGEgZ29vZCBwb2ludC4gTmV2ZXJ0aGVsZXNzIEkg
cmVtYWluIHVuY29udmluY2VkIHRoYXQKdGhlIGNoYW5nZSBpcyB3YXJyYW50ZWQgZ2l2ZW4gdGhl
IG9yaWdpbmFsIGludGVudGlvbnMgKGFzIGZhcgphcyB3ZSdyZSBhYmxlIHRvIHJlY29uc3RydWN0
IHRoZW0pLiBJZiB0aGUgY3VycmVudCBiZWhhdmlvcgpnZXRzIGluIHRoZSB3YXkgb2Ygc2Vuc2li
bGUgc2hpbSBvcGVyYXRpb24sIHBlcmhhcHMgdGhlCmJlaGF2aW9yIHNob3VsZCBiZSBtYWRlIGRl
cGVuZGVudCB1cG9uIHJ1bm5pbmcgaW4gc2hpbSBtb2RlPwoKSW4gYW55IGV2ZW50IEkgdGhpbmsg
dGhlIGNvbW1pdCBtZXNzYWdlIGhlcmUgd291bGQgd2FudAp1cGRhdGluZy4gSW4gdGhlIG1lYW50
aW1lIEkgdGhpbmsgSSdsbCBjb21taXQgcGF0Y2ggMSB3aXRoCkFuZHJldydzIGFjay4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
