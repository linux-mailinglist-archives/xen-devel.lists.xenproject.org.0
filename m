Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA674167E09
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:09:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j580K-0007bL-T3; Fri, 21 Feb 2020 13:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j580J-0007bE-W8
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:06:04 +0000
X-Inumbo-ID: e9331448-54aa-11ea-8655-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9331448-54aa-11ea-8655-12813bfff9fa;
 Fri, 21 Feb 2020 13:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1AEFADC8;
 Fri, 21 Feb 2020 13:06:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <20200219160825.GF4679@Air-de-Roger>
 <be0a78d2-f175-96fb-dccc-58088362ddd4@suse.com>
 <55e22641-7719-ea56-2961-4f38439c10b8@suse.com>
 <20200221102348.GX4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <842d14b2-8634-5e3d-4e4c-32690a17f7f3@suse.com>
Date: Fri, 21 Feb 2020 14:06:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221102348.GX4679@Air-de-Roger>
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

T24gMjEuMDIuMjAyMCAxMToyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwOToxNjo0OEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxODowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wMi4yMDIwIDE3
OjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0
IDAzOjA3OjE0UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9uIDE5LzAyLzIw
MjAgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMDIuMjAyMCAxNTo0NSwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEZlYiAxOSwgMjAyMCBhdCAw
Mjo0NDoxMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTkuMDIuMjAy
MCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Pj4+Pj4+IE9uIFdlZCwgRmViIDE5
LCAyMDIwIGF0IDAxOjU5OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+
IE9uIDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+Pj4+Pj4g
RG9uJ3QgYWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0
cnlsb2NrIGludG8gYQo+Pj4+Pj4+Pj4+PiBibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0
ZSB1c2VycyBvZiB0aGUgY3B1X2FkZF9yZW1vdmVfbG9jayBhcmUKPj4+Pj4+Pj4+Pj4gbGltaXRl
ZCB0byBDUFUgcGx1Zy91bnBsdWcgb3BlcmF0aW9ucywgYW5kIGNhbm5vdCBkZWFkbG9jayBiZXR3
ZWVuCj4+Pj4+Pj4+Pj4+IHRoZW1zZWx2ZXMgb3Igb3RoZXIgdXNlcnMgdGFraW5nIHRoZSBsb2Nr
IGluIHJlYWQgbW9kZSBhcwo+Pj4+Pj4+Pj4+PiBjcHVfYWRkX3JlbW92ZV9sb2NrIGlzIGFsd2F5
cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJlCj4+Pj4+Pj4+Pj4+IGFyZSBh
bHNvIG5vIG90aGVyIGxvY2tzIHRha2VuIGR1cmluZyB0aGUgcGx1Zy91bnBsdWcgb3BlcmF0aW9u
cy4KPj4+Pj4+Pj4+PiBJIGRvbid0IHRoaW5rIHRoZSBnb2FsIHdhcyBkZWFkbG9jayBhdm9pZGFu
Y2UsIGJ1dCByYXRoZXIgbGltaXRpbmcKPj4+Pj4+Pj4+PiBvZiB0aGUgdGltZSBzcGVudCBzcGlu
bmluZyB3aGlsZSB0cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jaywgaW4KPj4+Pj4+Pj4+PiBmYXZv
ciBvZiBoYXZpbmcgdGhlIGNhbGxlciByZXRyeS4KPj4+Pj4+Pj4+IE5vdyB0aGF0IHRoZSBjb250
ZW50aW9uIGJldHdlZW4gcmVhZC1vbmx5IHVzZXJzIGlzIHJlZHVjZWQgYXMgdGhvc2UKPj4+Pj4+
Pj4+IGNhbiB0YWtlIHRoZSBsb2NrIGluIHBhcmFsbGVsIEkgdGhpbmsgaXQncyBzYWZlIHRvIHN3
aXRjaCB3cml0ZXJzIHRvCj4+Pj4+Pj4+PiBibG9ja2luZyBtb2RlLgo+Pj4+Pj4+PiBJJ2QgYWdy
ZWUgaWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5IChtYW55KSByZWFkZXJzLgo+Pj4+
Pj4+IEFGQUlDVCBmcm9tIHRoZSBydyBsb2NrIGltcGxlbWVudGF0aW9uIHJlYWRlcnMgd29uJ3Qg
YmUgYWJsZSB0byBwaWNrCj4+Pj4+Pj4gdGhlIGxvY2sgYXMgc29vbiBhcyB0aGVyZSdzIGEgd3Jp
dGVyIHdhaXRpbmcsIHdoaWNoIHNob3VsZCBhdm9pZCB0aGlzCj4+Pj4+Pj4gc3RhcnZhdGlvbj8K
Pj4+Pj4+Pgo+Pj4+Pj4+IFlvdSBzdGlsbCBuZWVkIHRvIHdhaXQgZm9yIGN1cnJlbnQgcmVhZGVy
cyB0byBkcm9wIHRoZSBsb2NrLCBidXQgbm8KPj4+Pj4+PiBuZXcgcmVhZGVycyB3b3VsZCBiZSBh
YmxlIHRvIGxvY2sgaXQsIHdoaWNoIEkgdGhpbmsgc2hvdWxkIGdpdmJlIHVzCj4+Pj4+Pj4gZW5v
dWdoIGZhaXJuZXNzLgo+Pj4+Pj4gQWgsIHJpZ2h0LCBpdCB3YXMgcmF0aGVyIHRoZSBvdGhlciB3
YXkgYXJvdW5kIC0gYmFjay10by1iYWNrCj4+Pj4+PiB3cml0ZXJzIGNhbiBzdGFydmUgcmVhZGVy
cyB3aXRoIG91ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+Pj4+Pj4KPj4+Pj4+PiBPVE9IIHdo
ZW4gdXNpbmcgX3RyeWxvY2sgbmV3IHJlYWRlcnMgY2FuIHN0aWxsIHBpY2sKPj4+Pj4+PiB0aGUg
bG9jayBpbiByZWFkIG1vZGUsIGFuZCBoZW5jZSBJIHRoaW5rIHVzaW5nIGJsb2NraW5nIG1vZGUg
Zm9yCj4+Pj4+Pj4gd3JpdGVycyBpcyBhY3R1YWxseSBiZXR0ZXIsIGFzIHlvdSBjYW4gYXNzdXJl
IHRoYXQgcmVhZGVycyB3b24ndCBiZQo+Pj4+Pj4+IGFibGUgdG8gc3RhcnZlIHdyaXRlcnMuCj4+
Pj4+PiBUaGlzIGlzIGEgZ29vZCBwb2ludC4gTmV2ZXJ0aGVsZXNzIEkgcmVtYWluIHVuY29udmlu
Y2VkIHRoYXQKPj4+Pj4+IHRoZSBjaGFuZ2UgaXMgd2FycmFudGVkIGdpdmVuIHRoZSBvcmlnaW5h
bCBpbnRlbnRpb25zIChhcyBmYXIKPj4+Pj4+IGFzIHdlJ3JlIGFibGUgdG8gcmVjb25zdHJ1Y3Qg
dGhlbSkuIElmIHRoZSBjdXJyZW50IGJlaGF2aW9yCj4+Pj4+PiBnZXRzIGluIHRoZSB3YXkgb2Yg
c2Vuc2libGUgc2hpbSBvcGVyYXRpb24sIHBlcmhhcHMgdGhlCj4+Pj4+PiBiZWhhdmlvciBzaG91
bGQgYmUgbWFkZSBkZXBlbmRlbnQgdXBvbiBydW5uaW5nIGluIHNoaW0gbW9kZT8KPj4+Pj4KPj4+
Pj4gSG90cGx1ZyBpc24ndCBnZW5lcmFsbHkgdXNlZCBhdCBhbGwsIHNvIHRoZXJlIGlzIDAgd3Jp
dGUgcHJlc3N1cmUgb24gdGhlCj4+Pj4+IGxvY2suCj4+Pj4+Cj4+Pj4+IFdoZW4gaXQgaXMgdXNl
ZCwgaXQgaXMgYWxsIGF0IGV4cGxpY2l0IHJlcXVlc3QgZnJvbSB0aGUgY29udHJvbGxpbmcKPj4+
Pj4gZW50aXR5IGluIHRoZSBzeXN0ZW0gKGhhcmR3YXJlIGRvbWFpbiwgb3Igc2luZ2xldG9uIHNo
aW0gZG9tYWluKS4KPj4+Pj4KPj4+Pj4gSWYgdGhhdCBlbnRpdHkgaXMgdHJ5aW5nIHRvIERvUyB5
b3UsIHlvdSd2ZSBhbHJlYWR5IGxvc3QuCj4+Pj4+Cj4+Pj4+IFRoZXJlIG1pZ2h0IGJlIGF0dGVt
cHRzIHRvIGp1c3RpZnkgd2h5IHRoZSBsb2NraW5nIHdhcyBkb25lIGxpa2UgdGhhdCBpbgo+Pj4+
PiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCBpdCBkb2Vzbid0IG1lYW4gdGhleSB3ZXJlIG5lY2Vzc2Fy
aWx5IGNvcnJlY3QgdG8KPj4+Pj4gYmVpbmcgd2l0aCwgYW5kIHRoZXkgZG9uJ3QgbWF0Y2ggdXAg
d2l0aCB0aGUgcmVhbGlzdGljIHVzYWdlIG9mIHRoZSBsb2NrLgo+Pj4+Cj4+Pj4gSSdtIGhhcHB5
IHRvIHJld3JpdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIG9yZGVyIHRvIGluY2x1ZGUgdGhlCj4+
Pj4gZGlzY3Vzc2lvbiBoZXJlLiBXaGF0IGFib3V0IGFkZGluZzoKPj4+Pgo+Pj4+IE5vdGUgdGhh
dCB3aGVuIHVzaW5nIHJ3IGxvY2tzIGEgd3JpdGVyIHdhbnRpbmcgdG8gdGFrZSB0aGUgbG9jayB3
aWxsCj4+Pj4gcHJldmVudCBmdXJ0aGVyIHJlYWRzIGZyb20gbG9ja2luZyBpdCwgaGVuY2UgcHJl
dmVudGluZyByZWFkZXJzIGZyb20KPj4+PiBzdGFydmluZyB3cml0ZXJzLiBXcml0ZXJzIE9UT0gg
Y291bGQgc3RhcnZlIHJlYWRlcnMsIGJ1dCBzaW5jZSB0aGUKPj4+PiBsb2NrIGlzIG9ubHkgcGlj
a2VkIGluIHdyaXRlIG1vZGUgYnkgYWN0aW9ucyByZXF1ZXN0ZWQgYnkgcHJpdmlsZWdlZAo+Pj4+
IGRvbWFpbnMgc3VjaCBlbnRpdGllcyBhbHJlYWR5IGhhdmUgdGhlIGFiaWxpdHkgdG8gRG9TIHRo
ZSBoeXBlcnZpc29yCj4+Pj4gaW4gbWFueSBvdGhlciB3YXlzLgo+Pj4KPj4+IFdoaWxlIHRoaXMg
c291bmRzIGZpbmUsIG15IHByaW1hcnkgcmVxdWVzdCB3YXMgbW9yZSB0b3dhcmRzIHJlbW92aW5n
Cj4+PiAob3IgYXQgbGVhc3QgbWFraW5nIGxlc3Mgc2NhcnkpIHRoZSBwYXJ0IGFib3V0IGRlYWRs
b2Nrcy4KPj4KPj4gQWN0dWFsbHksIGhhdmluZyB0aG91Z2h0IGFib3V0IHRoaXMgc29tZSBtb3Jl
IG92ZXIgbmlnaHQsIEknbSBmaW5lCj4+IHdpdGggdGhlIG1lbnRpb25pbmcgb2YgdGhlIGRlYWRs
b2NrIHNjZW5hcmlvIGFzIHlvdSBoYXZlIGl0IHJpZ2h0IG5vdy4KPj4gSSdtIG5vdCBvdmVybHkg
ZnVzc2VkIGFzIHRvIHRoZSBhZGRpdGlvbiAob3Igbm90KSBvZiB0aGUgYWJvdmUgZXh0cmEKPj4g
cGFyYWdyYXBoLgo+IAo+IFVwIHRvIHlvdSwgSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24u
Cj4gCj4gQUZBSUNUIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgbWUgdG8gcmVzZW5kIHRoZW4/CgpJbmRl
ZWQsIGJ1dCBJIHdvdWxkbid0IHdhbnQgdG8gYXBwbHkgdGhpcyBvbmUgdW50aWwgdGhlIHJlZ3Jl
c3Npb24KZnJvbSBwYXRjaCAxIHdhcyBmaXhlZCwgYXMgZWxzZSB0aGF0IGNoYW5nZSBtYXkgYWxz
byBzdGlsbCBnZXQKcmV2ZXJ0ZWQuIEJ1dCBJJ2xsIGtlZXAgaXQgcXVldWVkIGZvciBjb21taXR0
aW5nIHVudGlsIHN1Y2ggdGltZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
