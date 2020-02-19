Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27366164B79
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:06:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Skp-0006EO-Pm; Wed, 19 Feb 2020 17:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Sko-0006EG-45
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:03:18 +0000
X-Inumbo-ID: b8a977b2-5339-11ea-83d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8a977b2-5339-11ea-83d4-12813bfff9fa;
 Wed, 19 Feb 2020 17:03:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2527BAD7B;
 Wed, 19 Feb 2020 17:03:16 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
 <20200219160825.GF4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be0a78d2-f175-96fb-dccc-58088362ddd4@suse.com>
Date: Wed, 19 Feb 2020 18:03:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219160825.GF4679@Air-de-Roger>
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

T24gMTkuMDIuMjAyMCAxNzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCAwMzowNzoxNFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxOS8wMi8yMDIwIDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE5LjAyLjIwMjAg
MTU6NDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gV2VkLCBGZWIgMTksIDIwMjAg
YXQgMDI6NDQ6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5LjAyLjIw
MjAgMTQ6MjIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEZlYiAxOSwg
MjAyMCBhdCAwMTo1OTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAx
My4wMi4yMDIwIDEyOjMyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+Pj4+IERvbid0IGFs
bG93IGNwdV9ob3RwbHVnX2JlZ2luIHRvIGZhaWwgYnkgY29udmVydGluZyB0aGUgdHJ5bG9jayBp
bnRvIGEKPj4+Pj4+Pj4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUgdXNlcnMgb2Yg
dGhlIGNwdV9hZGRfcmVtb3ZlX2xvY2sgYXJlCj4+Pj4+Pj4+IGxpbWl0ZWQgdG8gQ1BVIHBsdWcv
dW5wbHVnIG9wZXJhdGlvbnMsIGFuZCBjYW5ub3QgZGVhZGxvY2sgYmV0d2Vlbgo+Pj4+Pj4+PiB0
aGVtc2VsdmVzIG9yIG90aGVyIHVzZXJzIHRha2luZyB0aGUgbG9jayBpbiByZWFkIG1vZGUgYXMK
Pj4+Pj4+Pj4gY3B1X2FkZF9yZW1vdmVfbG9jayBpcyBhbHdheXMgbG9ja2VkIHdpdGggaW50ZXJy
dXB0cyBlbmFibGVkLiBUaGVyZQo+Pj4+Pj4+PiBhcmUgYWxzbyBubyBvdGhlciBsb2NrcyB0YWtl
biBkdXJpbmcgdGhlIHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMuCj4+Pj4+Pj4gSSBkb24ndCB0aGlu
ayB0aGUgZ29hbCB3YXMgZGVhZGxvY2sgYXZvaWRhbmNlLCBidXQgcmF0aGVyIGxpbWl0aW5nCj4+
Pj4+Pj4gb2YgdGhlIHRpbWUgc3BlbnQgc3Bpbm5pbmcgd2hpbGUgdHJ5aW5nIHRvIGFjcXVpcmUg
dGhlIGxvY2ssIGluCj4+Pj4+Pj4gZmF2b3Igb2YgaGF2aW5nIHRoZSBjYWxsZXIgcmV0cnkuCj4+
Pj4+PiBOb3cgdGhhdCB0aGUgY29udGVudGlvbiBiZXR3ZWVuIHJlYWQtb25seSB1c2VycyBpcyBy
ZWR1Y2VkIGFzIHRob3NlCj4+Pj4+PiBjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJhbGxlbCBJIHRo
aW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+Pj4+Pj4gYmxvY2tpbmcgbW9kZS4K
Pj4+Pj4gSSdkIGFncmVlIGlmIHdyaXRlcnMgY291bGRuJ3QgYmUgc3RhcnZlZCBieSAobWFueSkg
cmVhZGVycy4KPj4+PiBBRkFJQ1QgZnJvbSB0aGUgcncgbG9jayBpbXBsZW1lbnRhdGlvbiByZWFk
ZXJzIHdvbid0IGJlIGFibGUgdG8gcGljawo+Pj4+IHRoZSBsb2NrIGFzIHNvb24gYXMgdGhlcmUn
cyBhIHdyaXRlciB3YWl0aW5nLCB3aGljaCBzaG91bGQgYXZvaWQgdGhpcwo+Pj4+IHN0YXJ2YXRp
b24/Cj4+Pj4KPj4+PiBZb3Ugc3RpbGwgbmVlZCB0byB3YWl0IGZvciBjdXJyZW50IHJlYWRlcnMg
dG8gZHJvcCB0aGUgbG9jaywgYnV0IG5vCj4+Pj4gbmV3IHJlYWRlcnMgd291bGQgYmUgYWJsZSB0
byBsb2NrIGl0LCB3aGljaCBJIHRoaW5rIHNob3VsZCBnaXZiZSB1cwo+Pj4+IGVub3VnaCBmYWly
bmVzcy4KPj4+IEFoLCByaWdodCwgaXQgd2FzIHJhdGhlciB0aGUgb3RoZXIgd2F5IGFyb3VuZCAt
IGJhY2stdG8tYmFjawo+Pj4gd3JpdGVycyBjYW4gc3RhcnZlIHJlYWRlcnMgd2l0aCBvdXIgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbi4KPj4+Cj4+Pj4gT1RPSCB3aGVuIHVzaW5nIF90cnlsb2NrIG5l
dyByZWFkZXJzIGNhbiBzdGlsbCBwaWNrCj4+Pj4gdGhlIGxvY2sgaW4gcmVhZCBtb2RlLCBhbmQg
aGVuY2UgSSB0aGluayB1c2luZyBibG9ja2luZyBtb2RlIGZvcgo+Pj4+IHdyaXRlcnMgaXMgYWN0
dWFsbHkgYmV0dGVyLCBhcyB5b3UgY2FuIGFzc3VyZSB0aGF0IHJlYWRlcnMgd29uJ3QgYmUKPj4+
PiBhYmxlIHRvIHN0YXJ2ZSB3cml0ZXJzLgo+Pj4gVGhpcyBpcyBhIGdvb2QgcG9pbnQuIE5ldmVy
dGhlbGVzcyBJIHJlbWFpbiB1bmNvbnZpbmNlZCB0aGF0Cj4+PiB0aGUgY2hhbmdlIGlzIHdhcnJh
bnRlZCBnaXZlbiB0aGUgb3JpZ2luYWwgaW50ZW50aW9ucyAoYXMgZmFyCj4+PiBhcyB3ZSdyZSBh
YmxlIHRvIHJlY29uc3RydWN0IHRoZW0pLiBJZiB0aGUgY3VycmVudCBiZWhhdmlvcgo+Pj4gZ2V0
cyBpbiB0aGUgd2F5IG9mIHNlbnNpYmxlIHNoaW0gb3BlcmF0aW9uLCBwZXJoYXBzIHRoZQo+Pj4g
YmVoYXZpb3Igc2hvdWxkIGJlIG1hZGUgZGVwZW5kZW50IHVwb24gcnVubmluZyBpbiBzaGltIG1v
ZGU/Cj4+Cj4+IEhvdHBsdWcgaXNuJ3QgZ2VuZXJhbGx5IHVzZWQgYXQgYWxsLCBzbyB0aGVyZSBp
cyAwIHdyaXRlIHByZXNzdXJlIG9uIHRoZQo+PiBsb2NrLgo+Pgo+PiBXaGVuIGl0IGlzIHVzZWQs
IGl0IGlzIGFsbCBhdCBleHBsaWNpdCByZXF1ZXN0IGZyb20gdGhlIGNvbnRyb2xsaW5nCj4+IGVu
dGl0eSBpbiB0aGUgc3lzdGVtIChoYXJkd2FyZSBkb21haW4sIG9yIHNpbmdsZXRvbiBzaGltIGRv
bWFpbikuCj4+Cj4+IElmIHRoYXQgZW50aXR5IGlzIHRyeWluZyB0byBEb1MgeW91LCB5b3UndmUg
YWxyZWFkeSBsb3N0Lgo+Pgo+PiBUaGVyZSBtaWdodCBiZSBhdHRlbXB0cyB0byBqdXN0aWZ5IHdo
eSB0aGUgbG9ja2luZyB3YXMgZG9uZSBsaWtlIHRoYXQgaW4KPj4gdGhlIGZpcnN0IHBsYWNlLCBi
dXQgaXQgZG9lc24ndCBtZWFuIHRoZXkgd2VyZSBuZWNlc3NhcmlseSBjb3JyZWN0IHRvCj4+IGJl
aW5nIHdpdGgsIGFuZCB0aGV5IGRvbid0IG1hdGNoIHVwIHdpdGggdGhlIHJlYWxpc3RpYyB1c2Fn
ZSBvZiB0aGUgbG9jay4KPiAKPiBJJ20gaGFwcHkgdG8gcmV3cml0ZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgaW4gb3JkZXIgdG8gaW5jbHVkZSB0aGUKPiBkaXNjdXNzaW9uIGhlcmUuIFdoYXQgYWJvdXQg
YWRkaW5nOgo+IAo+IE5vdGUgdGhhdCB3aGVuIHVzaW5nIHJ3IGxvY2tzIGEgd3JpdGVyIHdhbnRp
bmcgdG8gdGFrZSB0aGUgbG9jayB3aWxsCj4gcHJldmVudCBmdXJ0aGVyIHJlYWRzIGZyb20gbG9j
a2luZyBpdCwgaGVuY2UgcHJldmVudGluZyByZWFkZXJzIGZyb20KPiBzdGFydmluZyB3cml0ZXJz
LiBXcml0ZXJzIE9UT0ggY291bGQgc3RhcnZlIHJlYWRlcnMsIGJ1dCBzaW5jZSB0aGUKPiBsb2Nr
IGlzIG9ubHkgcGlja2VkIGluIHdyaXRlIG1vZGUgYnkgYWN0aW9ucyByZXF1ZXN0ZWQgYnkgcHJp
dmlsZWdlZAo+IGRvbWFpbnMgc3VjaCBlbnRpdGllcyBhbHJlYWR5IGhhdmUgdGhlIGFiaWxpdHkg
dG8gRG9TIHRoZSBoeXBlcnZpc29yCj4gaW4gbWFueSBvdGhlciB3YXlzLgoKV2hpbGUgdGhpcyBz
b3VuZHMgZmluZSwgbXkgcHJpbWFyeSByZXF1ZXN0IHdhcyBtb3JlIHRvd2FyZHMgcmVtb3ZpbmcK
KG9yIGF0IGxlYXN0IG1ha2luZyBsZXNzIHNjYXJ5KSB0aGUgcGFydCBhYm91dCBkZWFkbG9ja3Mu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
