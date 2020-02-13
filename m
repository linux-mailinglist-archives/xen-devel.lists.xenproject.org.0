Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A772D15BF84
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 14:37:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2EeT-0001kW-UY; Thu, 13 Feb 2020 13:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2EeS-0001kR-HW
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 13:35:32 +0000
X-Inumbo-ID: b48867d4-4e65-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b48867d4-4e65-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 13:35:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D56C1AE57;
 Thu, 13 Feb 2020 13:35:30 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-3-roger.pau@citrix.com>
 <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
 <20200213100355.GV4679@Air-de-Roger>
 <a839cdc7-bc52-92cf-8020-74cfad568358@suse.com>
 <20200213114154.GX4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7ef9355-8661-1a20-9f27-24db633eed78@suse.com>
Date: Thu, 13 Feb 2020 14:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213114154.GX4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMjo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAxMywgMjAyMCBhdCAxMToxOTowMkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTMuMDIuMjAyMCAxMTowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmVi
IDEzLCAyMDIwIGF0IDEwOjU5OjI5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDEyLjAyLjIwMjAgMTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gVXNpbmcgc2Ny
YXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNlIGl0IGNhbiBi
ZQo+Pj4+PiBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIFhlbiB3b3Vs
ZCBoYXZlIHRvIG1ha2Ugc3VyZQo+Pj4+PiBhbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNoIGNw
dW1hc2sgZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCj4+Pj4+IGl0Lgo+Pj4+Pgo+Pj4+
PiBJbnN0ZWFkIGludHJvZHVjZSBhIG5ldyBjcHVtYXNrIHRvIGJlIHVzZWQgYnkgc2VuZF9JUElf
bWFzaywgYW5kCj4+Pj4+IGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZy4KPj4+Pgo+Pj4+
IE15IGZpcnN0IHRob3VnaHQgaGVyZSB3YXM6IFdoYXQgYWJvdXQgTk1JIG9yICNNQyBjb250ZXh0
PyBFdmVuIGlmCj4+Pj4gbm90IHVzaW5nIHRoZSBmdW5jdGlvbiB0b2RheSAod2hpY2ggSSBkaWRu
J3QgY2hlY2spLCB0aGVyZSBzaG91bGRuJ3QKPj4+PiBiZSBhIGxhdGVudCBpc3N1ZSBpbnRyb2R1
Y2VkIGhlcmUgcHJldmVudGluZyB0aGVtIGZyb20gZG9pbmcgc28gaW4KPj4+PiB0aGUgZnV0dXJl
LiBJbnN0ZWFkIEkgdGhpbmsgeW91IHdhbnQgdG8gYWxsb2NhdGUgdGhlIHNjcmF0Y2ggbWFzawo+
Pj4+IGR5bmFtaWNhbGx5IChhdCBsZWFzdCBpZiBjYWxsZXIgY29udGV4dCBkb2Vzbid0IGFsbG93
IHVzZSBvZiB0aGUKPj4+PiBnZW5lcmljIG9uZSksIGFuZCBzaW1wbHkgcmVmcmFpbiBmcm9tIGNv
YWxlc2NpbmcgSVBJcyBpZiB0aGlzCj4+Pj4gYWxsb2NhdGlvbnMgZmFpbHMuCj4+Pgo+Pj4gSG0s
IGlzbid0IHRoaXMgZ29pbmcgdG8gYmUgcXVpdGUgZXhwZW5zaXZlLCBhbmQgaGVuY2UgcmVuZGVy
IHRoZQo+Pj4gYmVuZWZpdCBvZiB1c2luZyB0aGUgc2hvcnRoYW5kIG1vb3Q/Cj4+Cj4+IERlcGVu
ZHMgb24gaG93IG1hbnkgQ1BVcyB0aGVyZSBhcmUsIGkuZS4gaG93IGxvbmcgdGhlIGxvb3Agb3Ro
ZXJ3aXNlCj4+IHdvdWxkIGJlLiBXaGVuIHhtYWxsb2MoKSBkb2Vzbid0IG5lZWQgdG8gdHVybiB0
byB0aGUgcGFnZSBhbGxvY2F0b3IsCj4+IEkgdGhpbmsgaXQgd29uJ3QgYmUgb3Zlcmx5IHNsb3cu
IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGF2b2lkCj4+IGNvYWxlc2NpbmcgaW4gYSBzbGln
aHRseSBkaWZmZXJlbnQgd2F5ICh3aXRob3V0IGhhdmluZyB0byBmaWRkbGUKPj4gd2l0aCB0aGUg
c2NyYXRjaCBtYXNrKSB3aGVuIGNhbGxlZCBpbiBpbnRlcnJ1cHQgY29udGV4dC4KPiAKPiBXaGF0
IGFib3V0IHByZXZlbnRpbmcgdGhlIG1hc2sgdXNhZ2Ugd2hlbiBpbiBubWkgY29udGV4dD8KPiAK
PiBJIGNvdWxkIGludHJvZHVjZSBzb21ldGhpbmcgbGlrZSBpbl9ubWkgYW5kIGp1c3QgYXZvaWQg
dGhlIHNjcmF0Y2gKPiBtYXNrIHVzYWdlIGluIHRoYXQgY2FzZSAoYW5kIHRoZSBzaG9ydGhhbmQp
LgoKUmlnaHQsIGFsbG9jYXRpb24gaXNuJ3QgcGVybWl0dGVkIGluIE5NSSBjb250ZXh0IGFueXdh
eS4gQXMgdG8KI01DIGNvbnRleHQgLSBJJ20gYWZyYWlkIHdlIGRvbid0IGhhdmUgYW55IGluZGlj
YXRvciBvZiB0aGlzIHNvCmZhciwgd2hpY2ggaXMgYSBwcm9ibGVtIChoZXJlIGFuZCBtYXliZSBh
bHNvIGVsc2V3aGVyZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
