Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3A267AF
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 18:06:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTTi4-0004c7-LI; Wed, 22 May 2019 16:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTTi3-0004c2-Sc
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 16:03:19 +0000
X-Inumbo-ID: 1d09fdaa-7cab-11e9-aaad-77302781aca9
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1d09fdaa-7cab-11e9-aaad-77302781aca9;
 Wed, 22 May 2019 16:03:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC60C341;
 Wed, 22 May 2019 09:03:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C82FA3F718;
 Wed, 22 May 2019 09:03:15 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
 <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
 <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
 <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
 <16cea000-3b02-08f6-4b0e-2df1024ed245@arm.com>
Message-ID: <e5141755-d677-184b-765a-2d67f80320cf@arm.com>
Date: Wed, 22 May 2019 17:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16cea000-3b02-08f6-4b0e-2df1024ed245@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBbnN3ZXJpbmcgdG8gbXlzZWxmLgoKT24gMTAvMDUvMjAxOSAxNTozNCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+IE9uIDEwLzA1LzIwMTkgMTU6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
PiBPbiAxMC4wNS4xOSBhdCAxNjowNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+
IE9uIDEwLzA1LzIwMTkgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEwLjA1
LjE5IGF0IDE1OjQxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiBUaGUgcG9p
bnQgaGVyZSwgd2Uga2VlcCB3aXRoaW4gdGhlIGh5cGVydmlzb3IgdGhlIGlkZWEgb2Ygd2hhdCdz
IHZhbGlkIG9yCj4+Pj4+IGludmFsaWQuIFRoaXMgYWxsb3dzIHVzIG1vcmUgZmxleGliaWxpdHkg
b24gdGhlIHZhbHVlIGhlcmUgKGltYWdpbmUgd2UgCj4+Pj4+IGRlY2lkZSB0bwo+Pj4+PiBjaGFu
Z2UgdGhlIHZhbHVlIG9mIEdGTl9JTlZBTElEIGluIHRoZSBmdXR1cmUuLi4pLgo+Pj4+Cj4+Pj4g
RXhhY3RseSwgYW5kIGhlbmNlIElOVkFMSURfR0ZOIHNob3VsZCBub3QgYmVjb21lIHZpc2libGUg
dG8gdGhlCj4+Pj4gb3V0c2lkZS4gSGVuY2UgbXkgcmVxdWVzdCB0byB1c2UgYW4gYWxsLW9uZXMg
dmFsdWUgaGVyZS4KPj4+IEl0IGlzIG9ubHkgdmlzaWJsZSBpZiB5b3UgcHV0IGFuIGV4YWN0IHZh
bHVlIGluIHRoZSBkb2N1bWVudGF0aW9uLiBZb3VyCj4+PiBzdWdnZXN0aW9uIGlzIHRvIHB1dCBh
IGV4YWN0bHkgdmFsdWUgYW5kIEkgd291bGQgcmF0aGVyIG5vdCBzZWUgdGhhdC4KPj4KPj4gSSBk
aWQgc3BlY2lmaWNhbGx5IHN1Z2dlc3QgdG8gX25vdF8gc3RvcmUgSU5WQUxJRF9HRk4gaGVyZSwg
YnV0IHRvCj4+IHN0b3JlIDY0LWJpdCBiaXRzIG9mIG9uZXMuIE5vdGUgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgdHdvIG9uCj4+IDMyLWJpdCBBcm0uCj4gWW91ciBwb2ludCBvZiBoYXZpbmcg
YW4gZXhhY3QgdmFsdWUgaXMgb25seSB1c2VmdWwgaWYgeW91IHdhbnQgdG8gdG9vbHN0YWNrIHRv
IAo+IHNpbGVudGx5IGlnbm9yZSB0aGUgbWlzc2luZyBmcmFtZSBhbmQgYXZvaWQgYSBjYWxsLgo+
IAo+IFRoZSBmb3JtZXIgaXMgcHJldHR5IG11Y2ggd3JvbmcgYXMgaWYgeW91IHdlcmUgdHJ5aW5n
IHRvIHJlYWQgdGhlIGZyYW1lIHRoZW4gCj4gbW9zdCBsaWtlbHkgeW91IHdhbnRlZCB0byBhY2Nl
c3MgaXQuIFNvIGEgbWVzc2FnZSBtYWtlcyBzZW5zZSBoZXJlLgo+IAo+IEZvciB0aGUgbGF0dGVy
LCBhdm9pZGluZyB0aGUgY2FsbCBpcyBvbmx5IGdvaW5nIHRvIHNhdmUgeW91IGEgY291cGxlIG9m
IGN5Y2xlcyAKPiBpbiBhIGxpa2VseSBjb2xkIHBhdGguCj4gCj4gWW91IHJlYWxseSBkb24ndCBu
ZWVkIHRvIGdpdmUgYW4gZXhhY3QgKGluY2x1ZGluZyBzYXkgYWxsIG9uZXMpLiBZb3Ugb25seSBu
ZWVkIAo+IHRvIHNheSB0aGF0IHRoZSBhZGRyZXNzIHJldHVybiBtYXkgbm90IGJlIG1hcHBhYmxl
LiBUaGUgdG9vbHN0YWNrIHdpbGwgdHJ5IHRvIAo+IG1hcCBpdCBhbmQgZmFpbC4gVGhhdCdzIG5v
dCBhIGJpZyBkZWFsLgo+IAo+IEFueXdheSwgSSB3aWxsIHdhaXQgYW5kIHNlZSB3aGF0J3MgdGhl
IHZpZXcgZnJvbSB0aGUgdG9vbHMgbWFpbnRhaW5lci4KCkkgaGFkIGEgZGlzY3Vzc2lvbiB3aXRo
IElhbiBvbiBJUkMgcmVnYXJkaW5nIHRoZSB2YWx1ZSBoZXJlLiBBZnRlciBzb21lIGRlYmF0ZSAK
d2UgYWdyZWVkIHRoYXQgc3BlY2lmeWluZyBhIHNpbmdsZSB2YWx1ZSB3b3VsZCBiZSBiZXN0LgoK
QXQgdGhlIG1vbWVudCwgWGVuIG9ubHkgc3VwcG9ydHMgNDgtYml0cyBhZGRyZXNzIHRoYXQgY291
bGQgYmUgY292ZXJlZCBieSAzNi1iaXQgCk1GTi4gTmV3ZXIgQXJtIHJldmlzaW9uIHN1cHBvcnRz
IHVwIHRvIDUyLWJpdCBhZGRyZXNzLCBidXQgdGhhdCdzIG9ubHkgd2l0aCA2NEtCIApwYWdlIGdy
YW51bGFyaXR5LiBFdmVuIGlmIHdlIHdlcmUgc3VwcG9ydGluZyA2NC1iaXQgYWRkcmVzcywgaXQg
d291bGQgb25seSBjb3ZlciAKNDgtYml0LCBzbyBhbGwgb25lcyBzaG91bGQgc3RpbGwgYmUgaW52
YWxpZC4gU28gSSBhbSBoYXBweSB3aXRoIHRoZSBhbGwgb25lcyAKdmVyc2lvbi4KCkkgd2lsbCBp
bnRyb2R1Y2UgYSBkZWZpbmUgc28gdGhlIHRvb2xzIGNhbiB1c2UgaXQgcmF0aGVyIHRoYW4gYW4g
aGFyZGNvZGVkIHZhbHVlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
