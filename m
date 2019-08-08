Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13586112
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:45:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgnx-0000LS-S6; Thu, 08 Aug 2019 11:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvgnw-0000LJ-RB
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:42:00 +0000
X-Inumbo-ID: 87cd651a-b9d1-11e9-abc5-a71af8db9a22
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87cd651a-b9d1-11e9-abc5-a71af8db9a22;
 Thu, 08 Aug 2019 11:41:59 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wFQ9soKvoK7xqHFljWuec4aAMdd0zGsuGGQWLftOrM7Ua+3qILtMFGBltXfStPKnIOHGfMhVZu
 qikIhnpxBMqMhbzAEINgl/Fe3SU6Wkzu38p3r8bkbVqeaa8aLytsF4qFjBGzBN4Bc12tJNsa7Y
 /N71fhX5ixhhoEqmQLAhdr77GbEwduPfhKuio4AdRrBuJF57Ikad1/fj081IS6jiKuNU7PnBb7
 eXivlOJRsTOfmu+NWLLBMAElNgaPyr2LQphFHIpABrWjD+3L7pFUX3V90UHnCDCuOsYHYdbx13
 5DA=
X-SBRS: 2.7
X-MesageID: 4158977
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4158977"
Date: Thu, 8 Aug 2019 13:41:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Message-ID: <20190808114152.siw5id4knh5ess5r@Air-de-Roger>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDI6MjM6NTFQTSArMDMwMCwgT2xla3NhbmRyIHdyb3Rl
Ogo+IAo+IE9uIDA4LjA4LjE5IDE0OjAxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IAo+IEhp
LCBSb2dlci4KPiAKPiAKPiA+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAxOjUzOjIzUE0gKzAz
MDAsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+ID4gPiBGcm9tOiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gPiA+IAo+ID4gPiBEb24n
dCBza2lwIElPTU1VIG5vZGVzIHdoZW4gY3JlYXRpbmcgRFQgZm9yIERvbTAgaWYgSU9NTVUgaGFz
IGJlZW4KPiA+ID4gZm9yY2libHkgZGlzYWJsZWQgaW4gYm9vdGFyZ3MgKGUuZy4gImlvbW11PTAi
KSBpbiBvcmRlciB0byBsZXQKPiA+ID4gdGhlIElPTU1VIGJlIGFjY2Vzc2libGUgYnkgRE9NMC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiA+ID4gLS0tCj4gPiA+IEkgaGF2ZSBoZWFyZCB0aGVy
ZSBpcyBhICJwb3NzaWJsZSIgY2FzZSB3aGVuIHRoZSBJT01NVSBjb3VsZCBiZSBhY2Nlc3NpYmxl
IGJ5IERPTTAuCj4gPiA+IFNvLCBJIHRoaW5rLCBmb3IgdGhpcyB0byB3b3JrIHdlIG5lZWQgdG8g
Y3JlYXRlIGNvcnJlc3BvbmRpbmcgRFQgbm9kZXMgaW4gdGhlIERUCj4gPiA+IGF0IGxlYXN0Lgo+
ID4gZG9tMCBvbiBBUk0gYmVpbmcgYW4gYXV0b3RyYW5zbGF0ZWQgZ3Vlc3QgSSdtIG5vdCBzdXJl
IGhvdyBpdCdzIGdvaW5nCj4gPiB0byBwcm9ncmFtIHRoZSBETUEgcmVtYXBwaW5nIGluIHRoZSBp
b21tdSwgc2luY2UgaXQgZG9lc24ndCBrbm93IHRoZQo+ID4gbWZucyBvZiB0aGUgbWVtb3J5IGl0
IHVzZXMgYXQgYWxsLCBoZW5jZSBJIGRvbid0IHNlZSB0aGUgcG9pbnQgaW4KPiA+IGV4cG9zaW5n
IHRoZSBoYXJkd2FyZSBpb21tdSB0byBkb20wIHVubGVzcyB0aGVyZSdzIHNvbWUgZW11bGF0aW9u
IGRvbmUKPiA+IHRvIG1ha2UgZG9tMCBhYmxlIHRvIGFjY2VzcyBpdC4KPiAKPiBDdXJyZW50bHks
IERvbTAgb24gQVJNIGlzIGFsd2F5cyAxOjEgbWFwcGVkIChnZm4gPT0gbWZuKS4gSG93ZXZlciwg
SSBkb24ndAo+IHJlYWxseSBrbm93IGhvdyBsb25nIHRoaXMgYXNzdW1wdGlvbiBpdCBpcyBnb2lu
ZyB0byBiZSB0cnVlLgoKWWVzLCBJIGRpZG4ndCBoYWQgdGhpcyBpbiBtaW5kIHdoZW4gd3JpdGlu
ZyB0aGUgYWJvdmUgcmVwbHkuIFdpdGgKaWRlbnRpdHkgbWFwcGluZyBpbiBzZWNvbmQgc3RhZ2Ug
dHJhbnNsYXRpb24gaXQncyBpbmRlZWQgdHJ1ZSB0aGF0CmRvbTAgbWlnaHQgYmUgYWJsZSB0byBz
b21laG93IG1hbmFnZSBhbiBpb21tdSwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncwphIGdvb2QgaWRl
YSB0byByZWx5IG9uIHRoaXMgYm9kZ2UgKHRoZSBpZGVudGl0eSBtYXBwaW5ncyksIGFuZCBoZW5j
ZSBJCndvdWxkIGFkdmlzZSBhZ2FpbnN0IGV4cG9zaW5nIHRoZSBuYXRpdmUgaW9tbXUgdG8gZG9t
MC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
