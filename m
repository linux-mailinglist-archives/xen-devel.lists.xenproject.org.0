Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF06486596
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkBO-0001sO-Dd; Thu, 08 Aug 2019 15:18:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvkBM-0001sJ-Ki
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:18:24 +0000
X-Inumbo-ID: c2ac9fa6-b9ef-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2ac9fa6-b9ef-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:18:23 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6YuCGAirnmdn7ullMu4zjeuwOS+G2+gsE4Wv2NNjCAlPZLsjmkP7r7h/ps8V3Z1VYEjb8Olr7r
 EQXDtBVtxLmgtGkkrRGn/R9ltKw96pi0di6CgX8jhy/z1lBqgfG4Pr+W+pSynprnkHP646Aj0F
 xSs7h3IzNeXclBLYfDa8nY70WHYpUXmJra5F0hi+YEXx8vNYO50ZBqRvuZmQoCehkhTMrCW4Rz
 tOuw4nHJW2xWSr+X7dg4DsjKg0uLnNi1SSb9DJGyMeR0MoNM0BaxN+PIEi2FvuQIOoIuoqetkS
 MIU=
X-SBRS: 2.7
X-MesageID: 4032590
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4032590"
Date: Thu, 8 Aug 2019 17:18:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808151815.nwup2kwu2qhm54ch@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
 <20190808132832.GU1242@perard.uk.xensource.com>
 <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
 <20190808142641.GX1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808142641.GX1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6MjY6NDFQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6NDQ6MjNQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDAyOjI4OjMyUE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBh
dCAwNTo1NDo1MVBNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+IE9uIE1v
biwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjM4UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3Rl
Ogo+ID4gPiA+ID4gUGNkRlNCQ2xvY2sgaXMgdXNlZCBieSBTZWNQZWlEeGVUaW1lckxpYkNwdSwg
dGhlIFRpbWVyTGliCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbi4gSXQgd2lsbCBhbHNvIGJlIHVz
ZWQgYnkgWGVuVGltZXJEeGUuIE92ZXJyaWRlCj4gPiA+ID4gPiBQY2RGU0JDbG9jayB0byBtYXRj
aCBYZW4gdkxBUElDIHRpbWVyIGZyZXF1ZW5jeS4KPiA+ID4gPiAKPiA+ID4gPiBJJ20ga2luZCBv
ZiBzdXJwcmlzZWQgdGhhdCBoaXMgaXMgbm90IGF1dG9tYXRpY2FsbHkgZGV0ZWN0ZWQ/Cj4gPiA+
ID4gCj4gPiA+ID4gSXMgaXQgYSBidWcgaW4gWGVuIG9yIGp1c3QgYWx3YXlzIGhhcmRjb2RlZCBv
biBPVk1GPwo+ID4gPiAKPiA+ID4gSXQncyBoYXJkY29kZWQuIFdoeSB3b3VsZCB5b3UgbmVlZCBh
dXRvIGRldGVjdGlvbiB3aGVuIHlvdSBhbHdheXMgcnVuIG9uCj4gPiA+IHRoZSBzYW1lIG1hY2hp
bmUgOy0pLgo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIHRoYXQncyBwYXJ0IG9mIHRoZSBIVk0vUFZI
IEFCSSBpbiBhbnkgd2F5LCBhbmQgaWYgeW91Cj4gPiBoYXJkY29kZSBpdCBpbiBPVk1GIGl0IHdv
dWxkIHByZXZlbnQgWGVuIGZyb20gY2hhbmdpbmcgdGhlIGZyZXF1ZW5jeQo+ID4gaW4gdGhlIGZ1
dHVyZSBpZiBzdWNoIG5lY2Vzc2l0eSBhcmlzZXMuIFdlIHNob3VsZCB0cnkgdG8gYXZvaWQgcGFp
bnRpbmcKPiA+IG91cnNlbHZlcyBpbnRvIGEgY29ybmVyIHdoZW4gcG9zc2libGUuCj4gPiAKPiA+
IERvZXNuJ3QgT1ZNRiBoYXZlIGEgd2F5IHRvIGdldCB0aGlzIGZyb20gdGhlIGhhcmR3YXJlIGl0
c2VsZj8KPiAKPiBTbyBFREtJSSBkb2Vzbid0IGhhdmUgdGhhdCBjYXBhYmlsaXR5LCBGU0JDbG9j
ayBpcyBhIGJ1aWxkIHRpbWUgdmFsdWUKPiBhbmQgY2FuJ3QgYmUgY2hhbmdlZCBhdCBydW4gdGlt
ZS4gQnV0IE9WTUYgKG9uIEtWTSBvciBIVk0pIGRvZXNuJ3QgdXNlCj4gdGhhdCB2YWx1ZSBhdCBh
bGwsIGl0IHVzZXMgdGhlIEFDUEkgdGltZXIgaW5zdGVhZC4KCkJ1dCBhZnRlciB5b3VyIHNlcmll
cyBib3RoIFBWSCBhbmQgSFZNIHdpbGwgdXNlIHRoZSBsYXBpYyB0aW1lcgppbnN0ZWFkIG9mIHRo
ZSBBQ1BJIHRpbWVyLCBhbmQgdGh1cyByZWx5IG9uIHRoZSB2YWx1ZSBvZiBGU0JDbG9jaz8KCj4g
V2UgY291bGQgdHJ5IHRvIGZpbmQgYSBiZXR0ZXIgd2F5IHRvIGdldCB0aW1lIGluIE92bWZYZW4g
d2l0aG91dAo+IGhhcmRjb2RpbmcgRlNCQ2xvY2ssIGJ1dCBtYXliZSBpbiBhIGZvbGxvdy11cC4K
ClllcyBwbGVhc2UuIEFzIHNhaWQgYWJvdmUgbGFwaWMgZnJlcXVlbmN5IGlzIG5vdCBwYXJ0IG9m
IHRoZSBBQkksIHNvCmlmIHdlIG5lZWQgdG8gdXNlIGl0IGxpa2UgdGhhdCBBUElDX0JVU19DWUNM
RV9OUyAoY3VycmVudGx5IGluCnZsYXBpYy5oKSB3b3VsZCBoYXZlIHRvIGJlIG1vdmVkIHRvIGEg
cHVibGljIGhlYWRlci4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
