Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB24164981
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:09:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Rrl-0007jq-2s; Wed, 19 Feb 2020 16:06:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Rrj-0007jg-JJ
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:06:23 +0000
X-Inumbo-ID: c5a850e4-5331-11ea-83c0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5a850e4-5331-11ea-83c0-12813bfff9fa;
 Wed, 19 Feb 2020 16:06:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56ED4AC1D;
 Wed, 19 Feb 2020 16:06:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f4fefd9-b5a9-ca40-1877-19e66b6ef625@suse.com>
Date: Wed, 19 Feb 2020 17:06:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxNjowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wMi8yMDIw
IDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTkuMDIuMjAyMCAxNTo0NSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDAyOjQ0OjEyUE0g
KzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjAyLjIwMjAgMTQ6MjIsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDAxOjU5OjUx
UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTMuMDIuMjAyMCAxMjozMiwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+Pj4+IERvbid0IGFsbG93IGNwdV9ob3RwbHVnX2Jl
Z2luIHRvIGZhaWwgYnkgY29udmVydGluZyB0aGUgdHJ5bG9jayBpbnRvIGEKPj4+Pj4+PiBibG9j
a2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2VycyBvZiB0aGUgY3B1X2FkZF9yZW1vdmVf
bG9jayBhcmUKPj4+Pj4+PiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1ZyBvcGVyYXRpb25zLCBh
bmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPj4+Pj4+PiB0aGVtc2VsdmVzIG9yIG90aGVyIHVz
ZXJzIHRha2luZyB0aGUgbG9jayBpbiByZWFkIG1vZGUgYXMKPj4+Pj4+PiBjcHVfYWRkX3JlbW92
ZV9sb2NrIGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJlCj4+
Pj4+Pj4gYXJlIGFsc28gbm8gb3RoZXIgbG9ja3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3VucGx1
ZyBvcGVyYXRpb25zLgo+Pj4+Pj4gSSBkb24ndCB0aGluayB0aGUgZ29hbCB3YXMgZGVhZGxvY2sg
YXZvaWRhbmNlLCBidXQgcmF0aGVyIGxpbWl0aW5nCj4+Pj4+PiBvZiB0aGUgdGltZSBzcGVudCBz
cGlubmluZyB3aGlsZSB0cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jaywgaW4KPj4+Pj4+IGZhdm9y
IG9mIGhhdmluZyB0aGUgY2FsbGVyIHJldHJ5Lgo+Pj4+PiBOb3cgdGhhdCB0aGUgY29udGVudGlv
biBiZXR3ZWVuIHJlYWQtb25seSB1c2VycyBpcyByZWR1Y2VkIGFzIHRob3NlCj4+Pj4+IGNhbiB0
YWtlIHRoZSBsb2NrIGluIHBhcmFsbGVsIEkgdGhpbmsgaXQncyBzYWZlIHRvIHN3aXRjaCB3cml0
ZXJzIHRvCj4+Pj4+IGJsb2NraW5nIG1vZGUuCj4+Pj4gSSdkIGFncmVlIGlmIHdyaXRlcnMgY291
bGRuJ3QgYmUgc3RhcnZlZCBieSAobWFueSkgcmVhZGVycy4KPj4+IEFGQUlDVCBmcm9tIHRoZSBy
dyBsb2NrIGltcGxlbWVudGF0aW9uIHJlYWRlcnMgd29uJ3QgYmUgYWJsZSB0byBwaWNrCj4+PiB0
aGUgbG9jayBhcyBzb29uIGFzIHRoZXJlJ3MgYSB3cml0ZXIgd2FpdGluZywgd2hpY2ggc2hvdWxk
IGF2b2lkIHRoaXMKPj4+IHN0YXJ2YXRpb24/Cj4+Pgo+Pj4gWW91IHN0aWxsIG5lZWQgdG8gd2Fp
dCBmb3IgY3VycmVudCByZWFkZXJzIHRvIGRyb3AgdGhlIGxvY2ssIGJ1dCBubwo+Pj4gbmV3IHJl
YWRlcnMgd291bGQgYmUgYWJsZSB0byBsb2NrIGl0LCB3aGljaCBJIHRoaW5rIHNob3VsZCBnaXZi
ZSB1cwo+Pj4gZW5vdWdoIGZhaXJuZXNzLgo+PiBBaCwgcmlnaHQsIGl0IHdhcyByYXRoZXIgdGhl
IG90aGVyIHdheSBhcm91bmQgLSBiYWNrLXRvLWJhY2sKPj4gd3JpdGVycyBjYW4gc3RhcnZlIHJl
YWRlcnMgd2l0aCBvdXIgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4KPj4KPj4+IE9UT0ggd2hlbiB1
c2luZyBfdHJ5bG9jayBuZXcgcmVhZGVycyBjYW4gc3RpbGwgcGljawo+Pj4gdGhlIGxvY2sgaW4g
cmVhZCBtb2RlLCBhbmQgaGVuY2UgSSB0aGluayB1c2luZyBibG9ja2luZyBtb2RlIGZvcgo+Pj4g
d3JpdGVycyBpcyBhY3R1YWxseSBiZXR0ZXIsIGFzIHlvdSBjYW4gYXNzdXJlIHRoYXQgcmVhZGVy
cyB3b24ndCBiZQo+Pj4gYWJsZSB0byBzdGFydmUgd3JpdGVycy4KPj4gVGhpcyBpcyBhIGdvb2Qg
cG9pbnQuIE5ldmVydGhlbGVzcyBJIHJlbWFpbiB1bmNvbnZpbmNlZCB0aGF0Cj4+IHRoZSBjaGFu
Z2UgaXMgd2FycmFudGVkIGdpdmVuIHRoZSBvcmlnaW5hbCBpbnRlbnRpb25zIChhcyBmYXIKPj4g
YXMgd2UncmUgYWJsZSB0byByZWNvbnN0cnVjdCB0aGVtKS4gSWYgdGhlIGN1cnJlbnQgYmVoYXZp
b3IKPj4gZ2V0cyBpbiB0aGUgd2F5IG9mIHNlbnNpYmxlIHNoaW0gb3BlcmF0aW9uLCBwZXJoYXBz
IHRoZQo+PiBiZWhhdmlvciBzaG91bGQgYmUgbWFkZSBkZXBlbmRlbnQgdXBvbiBydW5uaW5nIGlu
IHNoaW0gbW9kZT8KPiAKPiBIb3RwbHVnIGlzbid0IGdlbmVyYWxseSB1c2VkIGF0IGFsbCwgc28g
dGhlcmUgaXMgMCB3cml0ZSBwcmVzc3VyZSBvbiB0aGUKPiBsb2NrLgo+IAo+IFdoZW4gaXQgaXMg
dXNlZCwgaXQgaXMgYWxsIGF0IGV4cGxpY2l0IHJlcXVlc3QgZnJvbSB0aGUgY29udHJvbGxpbmcK
PiBlbnRpdHkgaW4gdGhlIHN5c3RlbSAoaGFyZHdhcmUgZG9tYWluLCBvciBzaW5nbGV0b24gc2hp
bSBkb21haW4pLgo+IAo+IElmIHRoYXQgZW50aXR5IGlzIHRyeWluZyB0byBEb1MgeW91LCB5b3Un
dmUgYWxyZWFkeSBsb3N0LgoKQnV0IHdyaXRlIHByZXNzdXJlIHdhcyBuZXZlciBpbiBxdWVzdGlv
bi4gTXkgY29uY2VybiBpcyB3aXRoCmhvdyBsb25nIGl0IG1pZ2h0IHRha2UgZm9yIGFsbCByZWFk
ZXJzIHRvIGRyb3AgdGhlaXIgbG9ja3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
