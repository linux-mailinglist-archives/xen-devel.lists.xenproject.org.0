Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343912F940
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:36:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inO1A-0004Ot-Eb; Fri, 03 Jan 2020 14:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inO18-0004Oo-4a
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:33:34 +0000
X-Inumbo-ID: 0461c048-2e36-11ea-a4b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0461c048-2e36-11ea-a4b5-12813bfff9fa;
 Fri, 03 Jan 2020 14:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15C45ABD0;
 Fri,  3 Jan 2020 14:33:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
 <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
 <5f6fff0a-d677-11e5-07ad-7e0250d29477@suse.com>
 <1628e07b-4599-e885-df5b-8b71872ca291@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cc1f7c7-c40d-c155-0d69-239cd6ac4455@suse.com>
Date: Fri, 3 Jan 2020 15:34:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1628e07b-4599-e885-df5b-8b71872ca291@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxNToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wMS8yMDIw
IDEzOjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDEuMjAyMCAxNDo0NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAzLzAxLzIwMjAgMTM6MzYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDAyLjAxLjIwMjAgMTU6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IEBA
IC0xMTEsMjYgKzEwOSw2IEBAIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnk6Cj4+Pj4+ICBzdGFy
dDY0Ogo+Pj4+PiAgICAgICAgICAvKiBKdW1wIHRvIGhpZ2ggbWFwcGluZ3MuICovCj4+Pj4+ICAg
ICAgICAgIG1vdmFicyAgJF9faGlnaF9zdGFydCwgJXJkaQo+Pj4+PiAtCj4+Pj4+IC0jaWZkZWYg
Q09ORklHX0lORElSRUNUX1RIVU5LCj4+Pj4+IC0gICAgICAgIC8qCj4+Pj4+IC0gICAgICAgICAq
IElmIGJvb3RpbmcgdmlydHVhbGlzZWQsIG9yIGhvdC1vbmxpbmluZyBhIENQVSwgc2libGluZyB0
aHJlYWRzIGNhbgo+Pj4+PiAtICAgICAgICAgKiBhdHRlbXB0IEJyYW5jaCBUYXJnZXQgSW5qZWN0
aW9uIGFnYWluc3QgdGhpcyBqbXAuCj4+Pj4+IC0gICAgICAgICAqCj4+Pj4+IC0gICAgICAgICAq
IFdlJ3ZlIGdvdCBubyB1c2FibGUgc3RhY2sgc28gY2FuJ3QgdXNlIGEgUkVUUE9MSU5FIHRodW5r
LCBhbmQgYXJlCj4+Pj4+IC0gICAgICAgICAqIGZ1cnRoZXIgdGhhbiBkaXNwMzIgZnJvbSB0aGUg
aGlnaCBtYXBwaW5ncyBzbyBjb3VsZG4ndCB1c2UKPj4+Pj4gLSAgICAgICAgICogSlVNUF9USFVO
SyBldmVuIGlmIGl0IHdhcyBhIG5vbi1SRVRQT0xJTkUgdGh1bmsuICBGdXJ0aGVybW9yZSwgYW4K
Pj4+Pj4gLSAgICAgICAgICogTEZFTkNFIGlzbid0IG5lY2Vzc2FyaWx5IHNhZmUgdG8gdXNlIGF0
IHRoaXMgcG9pbnQuCj4+Pj4+IC0gICAgICAgICAqCj4+Pj4+IC0gICAgICAgICAqIEFzIHRoaXMg
aXNuJ3QgYSBob3RwYXRoLCB1c2UgYSBmdWxseSBzZXJpYWxpc2luZyBldmVudCB0byByZWR1Y2UK
Pj4+Pj4gLSAgICAgICAgICogdGhlIHNwZWN1bGF0aW9uIHdpbmRvdyBhcyBtdWNoIGFzIHBvc3Np
YmxlLiAgJWVieCBuZWVkcyBwcmVzZXJ2aW5nCj4+Pj4+IC0gICAgICAgICAqIGZvciBfX2hpZ2hf
c3RhcnQuCj4+Pj4+IC0gICAgICAgICAqLwo+Pj4+PiAtICAgICAgICBtb3YgICAgICVlYngsICVl
c2kKPj4+Pj4gLSAgICAgICAgY3B1aWQKPj4+Pj4gLSAgICAgICAgbW92ICAgICAlZXNpLCAlZWJ4
Cj4+Pj4+IC0jZW5kaWYKPj4+Pj4gLQo+Pj4+PiAgICAgICAgICBqbXBxICAgIColcmRpCj4+Pj4g
SSBjYW4gc2VlIHRoaXMgYmVpbmcgdW5uZWVkZWQgd2hlbiBydW5uaW5nIHZpcnR1YWxpemVkLCBh
cyB5b3Ugc2FpZAo+Pj4+IGluIHJlcGx5IHRvIFdlaS4gSG93ZXZlciwgZm9yIGhvdC1vbmxpbmlu
ZyAod2hlbiBvdGhlciBDUFVzIG1heSBydW4KPj4+PiByYW5kb20gdkNQVS1zKSBJIGRvbid0IHNl
ZSBob3cgdGhpcyBjYW4gc2FmZWx5IGJlIGRyb3BwZWQuIFRoZXJlJ3MKPj4+PiBubyBzaW1pbGFy
IGNvbmNlcm4gZm9yIFMzIHJlc3VtZSwgYXMgdGhhd19kb21haW5zKCkgaGFwcGVucyBvbmx5Cj4+
Pj4gYWZ0ZXIgZW5hYmxlX25vbmJvb3RfY3B1cygpLgo+Pj4gSSBjb3ZlcmVkIHRoYXQgaW4gdGhl
IHNhbWUgcmVwbHkuwqAgQW55IGd1ZXN0IHdoaWNoIGNhbiB1c2UgYnJhbmNoIHRhcmdldAo+Pj4g
aW5qZWN0aW9uIGFnYWluc3QgdGhpcyBqbXAgY2FuIGFsc28gcG9pc29uIHRoZSByZWd1bGFyIGJy
YW5jaCBwcmVkaWN0b3IKPj4+IGFuZCBnZXQgYXQgZGF0YSB0aGF0IHdheS4KPj4gQXJlbid0IHlv
dSBpbXBseWluZyB0aGVuIHRoYXQgcmV0cG9saW5lcyBjb3VsZCBhbHNvIGJlIGRyb3BwZWQ/Cj4g
Cj4gTm8uwqAgSXQgaXMgYSBzaW1wbGUgcmlzayB2cyBjb21wbGV4aXR5IHRyYWRlb2ZmLgo+IAo+
IEd1ZXN0cyBydW5uaW5nIG9uIGEgc2libGluZyAqY2FuIGFscmVhZHkqIGF0dGFjayB0aGlzIGJy
YW5jaCB3aXRoIEJUSSwKPiBiZWNhdXNlIENQVUlEIGlzbid0IGEgZml4IHRvIGJhZCBCVEIgc3Bl
Y3VsYXRpb24sIGFuZCB0aGUgbGVha2FnZSBnYWRnZXQKPiBuZWVkIG9ubHkgYmUgYSBzaW5nbGUg
aW5zdHJ1Y3Rpb24uCj4gCj4gU3VjaCBhIGd1ZXN0IGNhbiBhbHNvIGF0dGFjayBYZW4gaW4gZ2Vu
ZXJhbCB3aXRoIFNwZWN0cmUgdjEuCj4gCj4gQXMgSSBzYWlkIC0gdGhpcyB3YXMgaW50cm9kdWNl
ZCBiZWNhdXNlIG9mIHBhcmFub2lhLCBiYWNrIHdoaWxlIHRoZSBmZXcKPiBwZW9wbGUgd2hvIGtu
ZXcgYWJvdXQgdGhlIGlzc3VlcyAob25seSBzZXZlcmFsIGh1bmRyZWQgYXQgdGhlIHRpbWUpIHdl
cmUKPiBhdHRlbXB0aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBleGFjdGx5IGEgc3BlY3VsYXRpdmUg
YXR0YWNrIGxvb2tlZCBsaWtlLAo+IGFuZCB3YXMgYXBwbHlpbmcgZHVjdCB0YXBlIHRvIGV2ZXJ5
dGhpbmcgc3VzcGljaW91cyBiZWNhdXNlIHdlIGhhZCAwCj4gdGltZSB0byByZXdyaXRlIHNldmVy
YWwgY29yZSBwaWVjZXMgb2Ygc3lzdGVtIGhhbmRsaW5nLgoKV2VsbCwgb2theSB0aGVuOgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPj4+IE9uY2UgYWdhaW4sIHdl
IGdldCB0byBDUFUgSG90cGx1ZyBiZWluZyBhbiB1bnVzZWQgZmVhdHVyZSBpbiBwcmFjdGljZSwK
Pj4+IHdoaWNoIGlzIGNvbXBsZXRlbHkgZXZpZGVudCBub3cgd2l0aCBJbnRlbCBNQ0UgYmVoYXZp
b3VyLgo+PiBXaGF0IGRvZXMgSW50ZWwncyBNQ0UgYmVoYXZpb3IgaGF2ZSB0byBkbyB3aXRoIHdo
ZXRoZXIgQ1BVIGhvdHBsdWcKPj4gKG9yIGhvdC1vbmxpbmluZykgaXMgKHVuKXVzZWQgaW4gcHJh
Y3RpY2U/Cj4gCj4gVGhlIGxvZ2ljYWwgY29uc2VxdWVuY2Ugb2YgaG90cGx1ZyBicmVha2luZyBN
Q0VzLgo+IAo+IElmIGhvdHBsdWcgaGFkIGJlZW4gdXNlZCBpbiBwcmFjdGljZSwgdGhlIE1DRSBi
ZWhhdmlvdXIgd291bGQgaGF2ZSBjb21lCj4gdG8gbGlnaHQgbXVjaCBzb29uZXIsIHdoZW4gTUNF
cyBkaWRuJ3Qgd29yayBpbiBwcmFjdGljZS4KPiAKPiBHaXZlbiB0aGF0IE1DRXMgcmVhbGx5IGRp
ZCB3b3JrIGluIHByYWN0aWNlIGV2ZW4gYmVmb3JlIHRoZSBMMVRGIGRheXMsCj4gaG90cGx1ZyB3
YXNuJ3QgaW4gY29tbW9uLWVub3VnaCB1c2UgZm9yIGFueW9uZSB0byBub3RpY2UgdGhlIE1DRSBi
ZWhhdmlvdXIuCgpPciBzeXN0ZW1zIHdoZXJlIENQVSBob3RwbHVnIHdhcyBhY3R1YWxseSB1c2Vk
IG9uIHdlcmUgb2YgZ29vZAplbm91Z2ggcXVhbGl0eSB0byBuZXZlciBzdXJmYWNlICNNQyAocGVy
c29uYWxseSBJIGRvbid0IHRoaW5rCkkndmUgc2VlbiBtb3JlIHRoYW4gYSBoYW5kZnVsIG9mIG5v
bi1yZXByb2R1Y2libGUgI01DIGluc3RhbmNlcyk/Ck9yIHBlb3BsZSBoYXZpbmcgcnVuIGludG8g
dGhlIGJhZCBiZWhhdmlvciBzaW1wbHkgZGlkbid0IGhhdmUgdGhlCnJlc291cmNlcyB0byBpbnZl
c3RpZ2F0ZSB3aHkgdGhlaXIgc3lzdGVtIHNodXQgZG93biBzaWxlbnRseQoocGVyaGFwcyBnaXZp
bmcgZW50aXJlbHkgcmFuZG9tIGFwcGVhcmFuY2Ugb2YgdGhlIGJlaGF2aW9yKT8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
