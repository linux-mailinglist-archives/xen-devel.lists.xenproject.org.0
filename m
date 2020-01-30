Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A690814DA79
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:14:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8g6-0004uu-8r; Thu, 30 Jan 2020 12:12:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix8g4-0004uN-5U
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:12:08 +0000
X-Inumbo-ID: bb79c888-4359-11ea-8396-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb79c888-4359-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580386327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CMWbm383sCIznz4AqBXl/PyF+yqLkNQSsWnSNc2kbsc=;
 b=ZuIUZSdgWwVl7SUCpEzenm9HNSQUVP+yXOX84yFmT618F0Rcryzltxi7
 vZQvgbyDdDNkRFZprJrGKPaxS/nuGAwvCPkwVDW9I7vraWfkn9XPAGAcQ
 j8HxmpMRbyId3NswIgEjaWmdHe5AlU5c7Nb99V3/XBsKX1MvcmYgULK4s k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QvHO/Kr30qB/2l94Q2gXPGjR6ct2+MiQqOIFUwq21lHyeXsjbhh5bPA+qyz4DDtY7IkeMOYkDT
 RvLzLXg4bH4jHk0tTGd7ilEUhPI0bFEHWrgMNeA9JEA761JnX1v7h7gl9KeCgIGXGGwr6oNfRz
 KD38KsJshuapHRbppYJvc4vRDj/8VildwWPspwcDIRlAmo1qmRkh1ptfWWDUsWfGA4WEsN5gig
 JoO21xlVE+lQ6ntVS+O9yq093NykMLnZqouk8K88PuqFQ4YUXyD+ZsaNqwXF2IWEE8ciCWiK5c
 N1M=
X-SBRS: 2.7
X-MesageID: 11849689
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11849689"
Date: Thu, 30 Jan 2020 13:11:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130121159.GK4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <20200130104143.GH4679@Air-de-Roger>
 <20200130111821.zmzp7ykg4slqpa5y@debian>
 <20200130113947.GI4679@Air-de-Roger>
 <20200130114752.lmpvpgttcnadymqa@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130114752.lmpvpgttcnadymqa@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NDc6NTJBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAxMjozOTo0N1BNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6MTg6MjFBTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NDE6NDNBTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEphbiAyOSwgMjAy
MCBhdCAwODoyMDoyOVBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+ID4gSHlwZXItViB1
c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVybGF5IHBhZ2UgZm9yIGl0cyBoeXBlcmNhbGwgcGFn
ZS4gSXQKPiA+ID4gPiA+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdlIHRvIHRoZSBndWVzdCB3
aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+ID4gPiA+ID4gaXMgZW5hYmxlZC4gVGhh
dCBtZWFucyB3ZSBjYW4gdXNlIGEgcGFnZSB0aGF0IGlzIG5vdCBiYWNrZWQgYnkgcmVhbAo+ID4g
PiA+ID4gbWVtb3J5IGZvciBoeXBlcmNhbGwgcGFnZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVXNl
IHRoZSB0b3AtbW9zdCBhZGRyZXNzYWJsZSBwYWdlIGZvciB0aGF0IHB1cnBvc2UuIEFkanVzdCBl
ODIwIGNvZGUKPiA+ID4gPiA+IGFjY29yZGluZ2x5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBXZSBh
bHNvIG5lZWQgdG8gcmVnaXN0ZXIgWGVuJ3MgZ3Vlc3QgT1MgSUQgdG8gSHlwZXItVi4gVXNlIDB4
MyBhcyB0aGUKPiA+ID4gPiA+IHZlbmRvciBJRC4gRml4IHRoZSBjb21tZW50IGluIGh5cGVydi10
bGZzLmggd2hpbGUgYXQgaXQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IHY1Ogo+
ID4gPiA+ID4gMS4gdXNlIGh5cGVydmlzb3JfcmVzZXJ2ZV90b3BfcGFnZXMKPiA+ID4gPiA+IDIu
IGFkZCBhIG1hY3JvIGZvciBoeXBlcmNhbGwgcGFnZSBtZm4KPiA+ID4gPiA+IDMuIGFkZHJlc3Mg
b3RoZXIgbWlzYyBjb21tZW50cwo+ID4gPiA+ID4gCj4gPiA+ID4gPiB2NDoKPiA+ID4gPiA+IDEu
IFVzZSBmaXhtYXAKPiA+ID4gPiA+IDIuIEZvbGxvdyByb3V0aW5lcyBsaXN0ZWQgaW4gVExGUwo+
ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgeGVuL2FyY2gveDg2L2U4MjAuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrCj4gPiA+ID4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4gPiA+ID4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8ICA1ICsrLQo+ID4gPiA+ID4gIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICB8ICAzICsrCj4gPiA+ID4gPiAg
NCBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNo
L3g4Ni9lODIwLmMKPiA+ID4gPiA+IGluZGV4IDM4OTJjOWNmYjcuLjk5NjQzZjNlYTAgMTAwNjQ0
Cj4gPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4gPiA+ID4gPiArKysgYi94ZW4v
YXJjaC94ODYvZTgyMC5jCj4gPiA+ID4gPiBAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nIF9faW5pdCBmaW5kX21heF9wZm4odm9pZCkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4g
PiAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4gPiA+ID4gICAgICB1bnNpZ25lZCBsb25nIG1heF9w
Zm4gPSAwOwo+ID4gPiA+ID4gKyAgICB1bnNpZ25lZCBsb25nIHRvcF9wZm4gPSAoKDF1bGwgPDwg
cGFkZHJfYml0cykgLSAxKSA+PiBQQUdFX1NISUZUOwo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gICAg
ICBmb3IgKGkgPSAwOyBpIDwgZTgyMC5ucl9tYXA7IGkrKykgewo+ID4gPiA+ID4gICAgICAgICAg
dW5zaWduZWQgbG9uZyBzdGFydCwgZW5kOwo+ID4gPiA+ID4gQEAgLTM1Nyw2ICszNTgsMTAgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWF4X3Bmbih2b2lkKQo+ID4gPiA+ID4g
ICAgICAgICAgICAgIG1heF9wZm4gPSBlbmQ7Cj4gPiA+ID4gPiAgICAgIH0KPiA+ID4gPiA+ICAK
PiA+ID4gPiA+ICsgICAgdG9wX3BmbiAtPSBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3BhZ2VzKCk7
Cj4gPiA+ID4gPiArICAgIGlmICggbWF4X3BmbiA+PSB0b3BfcGZuICkKPiA+ID4gPiA+ICsgICAg
ICAgIG1heF9wZm4gPSB0b3BfcGZuOwo+ID4gPiA+IAo+ID4gPiA+IEhtLCBJJ20gbm90IHN1cmUg
SSBzZWUgdGhlIHBvaW50IG9mIHRoaXMuIFRoZSB2YWx1ZSByZXR1cm5lZCBieQo+ID4gPiA+IGZp
bmRfbWF4X3BmbiBpcyB0aGUgbWF4aW11bSBSQU0gYWRkcmVzcyBmb3VuZCBpbiB0aGUgbWVtb3J5
IG1hcCwgYnV0Cj4gPiA+ID4gdGhlIHBoeXNpY2FsIGFkZHJlc3MgeW91IGFyZSB1c2luZyB0byBt
YXAgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIGFsbW9zdAo+ID4gPiA+IGNlcnRhaW5seSBtdWNoIGhp
Z2hlciB0aGFuIHRoZSBtYXhpbXVtIGFkZHJlc3MgZm91bmQgaW4gdGhlIHBoeXNtYXAKPiA+ID4g
PiAoYW5kIGNlcnRhaW5seSBub3QgUkFNKSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aGF0J3Mg
dGhlIHBvaW50IG9mCj4gPiA+ID4gdGhpcy4KPiA+ID4gCj4gPiA+IFllcywgdGhlIGtleXdvcmQg
aXMgImFsbW9zdCBjZXJ0YWlubHkiLiA6LSkKPiA+ID4gCj4gPiA+IFRoaXMgaXMgZG9uZSBmb3Ig
Y29ycmVjdG5lc3MncyBzYWtlLiBJIGRvbid0IGV4cGVjdCBpbiBwcmFjdGljZSB0aGVyZQo+ID4g
PiB3b3VsZCBiZSBhIGNvbmZpZ3VyYXRpb24gdGhhdCBoYXMgdGhhdCBtdWNoIG1lbW9yeSwgYnV0
IGNvcnJlY3RuZXNzIGlzCj4gPiA+IHN0aWxsIGltcG9ydGFudC4KPiA+ID4gCj4gPiA+IEl0IGFs
c28gZ3VhcmRzIGFnYWluc3Qgd2VpcmQgY29uZmlndXJhdGlvbiBpbiB3aGljaCBtZW1vcnkgaXMg
cHV0IGludG8KPiA+ID4gdGhhdCBwYXJ0IG9mIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIGZv
ciB3aGF0ZXZlciByZWFzb24uIEkgZG9uJ3QKPiA+ID4ga25vdyB3aHkgYW55b25lIHdvdWxkIGRv
IHRoYXQsIGJ1dCBhZ2Fpbiwgd2Ugc2hvdWxkIGJlIHByZXBhcmVkIGZvcgo+ID4gPiB0aGF0Lgo+
ID4gPiAKPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gQWxzbyB5b3UgaGF2ZW4ndCBpbnRyb2R1Y2Vk
IGEgSHlwZXJWIGltcGxlbWVudGF0aW9uIG9mCj4gPiA+ID4gaHlwZXJ2aXNvcl9yZXNlcnZlX3Rv
cF9wYWdlcyBzbyBmYXIsIHNvIGl0J3MgaGFyZCB0byB0ZWxsIHRoZSBpbnRlbmQKPiA+ID4gPiBv
ZiB0aGlzLgo+ID4gPiAKPiA+ID4gRCdvaC4gVGhhdCB3YXMgc3VwcG9zZWQgdG8gYmUgaW4gdGhp
cyBwYXRjaC4gSSBndWVzcyBJIGZvcmdvdCB0byBjb21taXQKPiA+ID4gdGhhdCBodW5rIQo+ID4g
PiAKPiA+ID4gVGhhdCBmdW5jdGlvbiBmb3IgSHlwZXItViBpcyBnb2luZyB0byByZXR1cm4gMSAo
cGFnZSkuCj4gPiAKPiA+IEJ1dCB0aGF0IHdvdWxkIGxpa2VseSBiZSB3cm9uZywgdW5sZXNzIHRo
ZSBtZW1vcnkgbWFwIGhhcyBhIFJBTQo+ID4gcmVnaW9uIHRoYXQgZXhwYW5kcyB1cCB0byAoMSA8
PCBwYWRkcl9iaXRzKT8KPiA+IAo+ID4gT3IgZWxzZSB5b3UgYXJlIGp1c3QgcmVtb3ZpbmcgYSBw
YWdlIGZyb20gdGhlIGxhc3QgUkFNIHJlZ2lvbiBpbgo+ID4gdGhlIG1lbW9yeSBtYXAgZm9yIG5v
IHJlYXNvbi4gbWF4X3BmbiBpcyBhbG1vc3QgY2VydGFpbmx5IHdheSBiZWxvdyAoMQo+ID4gPDwg
cGFkZHJfYml0cykuCj4gPiAKPiAKPiBXaHk/IFRoZSBhZGp1c3RtZW50IHdpbGwgbm90IGJlIGFw
cGxpZWQgdW5sZXNzIFJBTSBvdmVybGFwcyB3aXRoIHRoYXQKPiByZXNlcnZlZCByZWdpb24uCgpP
aCwgT0ssIGZyb20geW91ciBwcmV2aW91cyByZXBseSBJIHVuZGVyc3Rvb2QgdGhhdApoeXBlcnZp
c29yX3Jlc2VydmVfdG9wX3BhZ2VzIHdvdWxkIHVuY29uZGl0aW9uYWxseSByZXR1cm4gMSBmb3IK
SHlwZXJWLCBzbyB0aGF0IHdvdWxkIGVuZCB1cCBhbHdheXMgc3VidHJhY3RpbmcgMSBwYWdlIGZy
b20gdGhlIGxhc3QKUkFNIHJlZ2lvbiwgZXZlbiB3aGVuIG5vdCBvdmVybGFwcGluZyB3aXRoICgx
IDw8IHBhZGRyX2JpdHMpLgoKPiAKPiA+IEkgdGhpbmsgd2hhdCB5b3UgbmVlZCBpcyBhIGhvb2sg
dGhhdCBtb2RpZmllcyB0aGUgbWVtb3J5IG1hcCBhbmQgYWRkcwo+ID4gYSByZXNlcnZlZCByZWdp
b24gYXQgKCgxIDw8IHBhZGRyX2JpdHMpIC0gUEFHRV9TSVpFKSBvZiBzaXplCj4gPiBQQUdFX1NJ
WkUuIFNlZSB3aGVyZSBwdl9zaGltX2ZpeHVwX2U4MjAgaXMgdXNlZCwgYW5kIEkgdGhpbmsgeW91
IHdhbnQKPiA+IHRvIG1ha2UgdGhpcyBhIGh5cGVydmlzb3IgaG9vayBhbmQgYWRkIHRoZSBIeXBl
clYgY29kZSB0byByZXNlcnZlIHRoZQo+ID4gaHlwZXJjYWxsIHBhZ2UgaW4gdGhlIGU4MjAgdGhl
cmUuCj4gCj4gVGhhdCB3b3JrcyBmb3IgbWUgdG9vLiBMZXQncyBzZWUgd2hhdCBvdGhlciBwZW9w
bGUgdGhpbmsuCgpJIHRoaW5rIHRoYXQncyB0aGUgc2FmZXN0IHdheSwgYXMgeW91IGNhbiBhc3N1
cmUgdGhlcmUncyBub3RoaW5nIGluCnRoZSByZWdpb24gdG8gYmUgdXNlZCBieSB0aGUgaHlwZXJj
YWxsIHBhZ2UsIGFuZCB5b3UgY2FuIGFjdHVhbGx5IG1hcmsKaXQgYXMgcmVzZXJ2ZWQgaW4gdGhl
IGU4MjAuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
