Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002D1E84E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 08:33:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQnQB-0001Iy-Qz; Wed, 15 May 2019 06:29:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQnQ9-0001It-T8
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 06:29:45 +0000
X-Inumbo-ID: d3cb41d3-76da-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3cb41d3-76da-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 06:29:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 00:29:43 -0600
Message-Id: <5CDBB1D3020000780022F109@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 00:29:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-3-paul.durrant@citrix.com>
 <5CD98EC4020000780022E421@prv1-mh.provo.novell.com>
 <9a476c95c1fb410b9330c45fa6799b9a@AMSPEX02CL03.citrite.net>
In-Reply-To: <9a476c95c1fb410b9330c45fa6799b9a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/5] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDE4OjEzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgTWF5IDIwMTkgMDg6MzYKPj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBCcmlhbiBXb29k
cyA8YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCAKPiA8c3VyYXZl
ZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+OyBBbmRyZXcKPj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdl
aSAKPiBMaXUKPj4gPHdlaS5saXUyQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT47IHhlbi1kZXZlbCAKPiA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Pgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gaW9tbXUgLyB4ODY6IG1vdmUgY2FsbCB0byBz
Y2FuX3BjaV9kZXZpY2VzKCkgb3V0IG9mIAo+IHZlbmRvciBjb2RlCj4+IAo+PiA+Pj4gT24gMDgu
MDUuMTkgYXQgMTU6MjQsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gSXQn
cyBub3QgdmVuZG9yIHNwZWNpZmljIHNvIGl0IHNob3VsZG4ndCByZWFsbHkgYmUgdGhlcmUuCj4+
IAo+PiBQZXJoYXBzLCBidXQgdGhpcyBuZWVkcyBiZXR0ZXIganVzdGlmaWNhdGlvbjoKPj4gCj4+
ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPj4gPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiA+IEBAIC0yMzcyLDEwICsyMzcy
LDYgQEAgc3RhdGljIGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCj4+ID4gICAgICBQKGlvbW11
X2hhcF9wdF9zaGFyZSwgIlNoYXJlZCBFUFQgdGFibGVzIik7Cj4+ID4gICN1bmRlZiBQCj4+ID4K
Pj4gPiAtICAgIHJldCA9IHNjYW5fcGNpX2RldmljZXMoKTsKPj4gPiAtICAgIGlmICggcmV0ICkK
Pj4gPiAtICAgICAgICBnb3RvIGVycm9yOwo+PiA+IC0KPj4gPiAgICAgIHJldCA9IGluaXRfdnRk
X2h3KCk7Cj4+IAo+PiBFdmVuIGFmdGVyIHNvbWUgbG9va2luZyBhcm91bmQsIGl0J3Mgbm90IG9i
dmlvdXMgdG8gbWUgdGhhdCB0aGUgbGF0dGVyCj4+IGNhbGwgZG9lc24ndCBkZXBlbmQgb24gUENJ
IGRldmljZXMgYmVpbmcga25vd24sIG1vcmUgc3BlY2lmaWNhbGx5Cj4+IHNlZ21lbnQgMCdzIGJ1
czJicmlkZ2VbXSBoYXZpbmcgYmVlbiBmaWxsZWQuIE5vciBjYW4gSSB0ZWxsIHdoZXRoZXIKPj4g
dGhlcmUgd291bGQgYmUgc29tZSBub3RpY2VhYmxlIG1pc2JlaGF2aW9yIChwcmlvciB0byBhbnkg
Z3Vlc3RzCj4+IHN0YXJ0aW5nKSBpZiB0aGVyZSB3YXMgYSBkZXBlbmRlbmN5IGFuZCBpdCBnb3Qg
YnJva2VuIGJ5IHRoZSByZS0KPj4gb3JkZXJpbmcuCj4gCj4gSSBkb24ndCBzZWUgYW55IGRlcGVu
ZGVuY3kgYnV0IHRoZSBjb2RlIGlzIHNvbWV3aGF0IHRhbmdsZWQuIFBlcmhhcHMgaXQgCj4gd291
bGQgYmUgYmV0dGVyIHRvIGJ1aWxkIHRoZSBQQ0kgdG9wb2xvZ3kgKmJlZm9yZSogSU9NTVUgaW5p
dCBhbmQgdGhlbiAKPiBpdGVyYXRlIG92ZXIgdGhlIHRoZSBkZXZpY2VzIGFmdGVyIGluaXQgdG8g
ZG8gdGhlIGdyb3VwIGFzc2lnbm1lbnQuIEkgCj4gY2VydGFpbmx5IGNhbid0IHNlZSBhbnl0aGlu
ZyBpbiB0aGUgc2NhbiBhcyBpdCBzdGFuZHMgdGhhdCB3b3VsZCBuZWVkIHRoZSAKPiBJT01NVSB0
byBoYXZlIGJlZW4gaW5pdGlhbGl6ZWQuCgpBaCwgeWVzLCB0aGF0J3MgbGlrZWx5IGEgYmV0dGVy
IG1vZGVsLiBBcyB0byB0aGUgZGVwZW5kZW5jeQphc3BlY3Q6IHBjaV9hZGRfZGV2aWNlKCkgY2Fs
bHMgaW9tbXVfYWRkX2RldmljZSgpLiBCdXQgb2RkbHkKZW5vdWdoIF9zY2FuX3BjaV9kZXZpY2Vz
KCkgY2FsbHMgYWxsb2NfcGRldigpLCBub3QKcGNpX2FkZF9kZXZpY2UoKS4gU28gaW5kZWVkIHRo
ZXJlIGRvZXNuJ3QgbG9vayB0byBiZSBhbnkKZGVwZW5kZW5jeSBhdCBwcmVzZW50LgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
