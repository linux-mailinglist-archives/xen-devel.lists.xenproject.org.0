Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FA203E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDy1-0006pB-J1; Thu, 16 May 2019 10:50:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRDy0-0006p6-Ft
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:50:28 +0000
X-Inumbo-ID: 6a157cba-77c8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a157cba-77c8-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 10:50:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 04:50:26 -0600
Message-Id: <5CDD406E020000780022F906@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 04:50:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
 <20190516103238.pm6ducegde3xw5wz@Air-de-Roger>
In-Reply-To: <20190516103238.pm6ducegde3xw5wz@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] x86/IRQ: don't keep EOI timer running
 without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDEyOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA2OjQ2OjI1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGUgdGltZXIgbmVlZHMgdG8gcmVtYWluIGFjdGl2ZSBvbmx5IHVudGlsIGFsbCBw
ZW5kaW5nIElSUSBpbnN0YW5jZXMKPj4gaGF2ZSBzZWVuIEVPSXMgZnJvbSB0aGVpciByZXNwZWN0
aXZlIGRvbWFpbnMuIFN0b3AgaXQgd2hlbiB0aGUgaW4tZmxpZ2h0Cj4+IGNvdW50IGhhcyByZWFj
aGVkIHplcm8gaW4gZGVzY19ndWVzdF9lb2koKS4gTm90ZSB0aGF0IHRoaXMgaXMgcmFjZSBmcmVl
Cj4+ICh3aXRoIF9fZG9fSVJRX2d1ZXN0KCkpLCBhcyB0aGUgSVJRIGRlc2NyaXB0b3IgbG9jayBp
cyBiZWluZyBoZWxkIGF0Cj4+IHRoYXQgcG9pbnQuCj4+IAo+PiBBbHNvIHB1bGwgdXAgc3RvcHBp
bmcgb2YgdGhlIHRpbWVyIGluIF9fZG9fSVJRX2d1ZXN0KCkgaXRzZWxmOiBJbnN0ZWFkCj4+IG9m
IHN0b3BwaW5nIGl0IGltbWVkaWF0ZWx5IGJlZm9yZSByZS1zZXR0aW5nLCBzdG9wIGl0IGFzIHNv
b24gYXMgd2UndmUKPj4gbWFkZSBpdCBwYXN0IGFueSBlYXJseSByZXR1cm5zIGZyb20gdGhlIGZ1
bmN0aW9uIChhbmQgaGVuY2Ugd2UncmUgc3VyZQo+PiBpdCdsbCBnZXQgc2V0IGFnYWluKS4KPj4g
Cj4+IEZpbmFsbHkgYmFpbCBmcm9tIHRoZSBhY3R1YWwgdGltZXIgaGFuZGxlciBpbiBjYXNlIHdl
IGZpbmQgdGhlIHRpbWVyCj4+IGFscmVhZHkgYWN0aXZlIGFnYWluIGJ5IHRoZSB0aW1lIHdlJ3Zl
IG1hbmFnZWQgdG8gYWNxdWlyZSB0aGUgSVJRCj4+IGRlc2NyaXB0b3IgbG9jay4gV2l0aG91dCB0
aGlzIHdlIG1heSBmb3JjaWJseSBFT0kgYW4gSVJRIGltbWVkaWF0ZWx5Cj4+IGFmdGVyIGl0IGdv
dCBzZW50IHRvIGEgZ3Vlc3QuIEZvciB0aGlzLCB0aW1lcl9pc19hY3RpdmUoKSBnZXRzIHNwbGl0
IG91dAo+PiBvZiBhY3RpdmVfdGltZXIoKSwgZGVsaWJlcmF0ZWx5IG1vdmluZyBqdXN0IG9uZSBv
ZiB0aGUgdHdvIEFTU0VSVCgpcyAodG8KPj4gYWxsb3cgdGhlIGZ1bmN0aW9uIHRvIGJlIHVzZWQg
YWxzbyBvbiBhIG5ldmVyIGluaXRpYWxpemVkIHRpbWVyKS4KPiAKPiBBRkFJQ1QgdGltZXJfaXNf
YWN0aXZlIGlzIGV4Y2x1c2l2ZWx5IHVzZWQgaW4gaXJxX2d1ZXN0X2VvaV90aW1lcl9mbiwKPiB3
aGljaCBtdXN0IGhhdmUgaW5pdGlhbGl6ZWQgdGhlIHRpbWVyIGluIG9yZGVyIGZvcgo+IGlycV9n
dWVzdF9lb2lfdGltZXJfZm4gdG8gYmUgY2FsbGVkLCBhbmQgaGVuY2UgSSdtIG5vdCBzdXJlIHdo
eSB5b3UKPiBuZWVkIHRvIGJlIGFibGUgdG8gY2FsbCB0aW1lcl9pc19hY3RpdmUgd2l0aCBhbiB1
bmluaXRpYWxpemVkIHRpbWVyLgoKSXQncyBub3QgbmVlZGVkIGhlcmUsIGJ1dCBJIGNvbnNpZGVy
IHRoaXMgdXNlZnVsIGJlaGF2aW9yIHdoZW4gdXNlZApvdXRzaWRlIG9mIHRoZSBzcGVjaWZpYyB0
aW1lcidzIGhhbmRsZXIuCgo+IElzIHRoaXMgbWF5YmUgdXNlZCBieSBvdGhlciBwYXRjaGVzPwoK
Tm9uZSB0aGF0IEkgd291bGQgaGF2ZSBpbiB0aGUgd29ya3MuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
