Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF7134A0A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:03:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFdo-0007ma-9y; Wed, 08 Jan 2020 18:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipFdn-0007mU-0G
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:01:11 +0000
X-Inumbo-ID: d9261906-3240-11ea-b870-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9261906-3240-11ea-b870-12813bfff9fa;
 Wed, 08 Jan 2020 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578506469;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qOAbStXQwLhvUMHmF9CvIqhZTOB6eVh/TcPgT1Pv/Vw=;
 b=WPHpef8begZPK3++qp+OwY5SnIjCPjckoIVe2j4TsooZBkSVUWmkuOKO
 9BrkK/SUoiggBI4QcBLmF0XwSpbZB6YlHMZPobnqYQ3F2bQB8GhTosvon
 w/DrRr9ebiM8JnF0em2+QZ+ve36m3zxl4n0UdsmRPxqbAM+13KyTDcWb1 A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TA4Jx+BVaoq6npEzM0J5omWKVt3+b/OCQwhmboWIGULpkuUuor3ztQux3PDR72z9MMRbTRX8c3
 FEAsiXaC57xUNCens+FU0+E/uyi0TQ4Gryp7iwi0Y1cbfjVy8VEWfVJxKDcQKVjSDaT4t6KMhh
 cxLPr6M5N9uSA4hLw7b8vZpRVyG9ZFx7c80KRkTFIm6tmD+8Y3J1DKN2ygsSJ5iztZxb2GHqFr
 nuGh+5/wFC4WQhIul9qOr1cKv75tDKu9p6sAu4SNaNl9FKnvuVXc2OcP/ZqJjG4EZdrLC9ps0t
 P00=
X-SBRS: 2.7
X-MesageID: 11014206
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11014206"
Date: Wed, 8 Jan 2020 19:00:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200108180042.GT11756@Air-de-Roger>
References: <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDg6MzI6MjJBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgODowOCBBTSBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBEZWMgMzEsIDIw
MTkgYXQgMDk6MzY6MDFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIERlYyAzMSwgMjAxOSBhdCA5OjA4IEFNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCA4
OjExIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCAwODowMDoxN0FNIC0wNzAw
LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5
IGF0IDM6NDAgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMDU6
Mzc6MzhQTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24g
TW9uLCBEZWMgMzAsIDIwMTkgYXQgNToyMCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBIaSwK
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gT24gTW9uLCAzMCBEZWMgMjAxOSwg
MjA6NDkgVGFtYXMgSyBMZW5neWVsLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPiA+ID4gPj4gT24gTW9uLCBEZWMgMzAsIDIwMTkgYXQg
MTE6NDMgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gPiA+PiBCdXQga2VlcCBpbiBtaW5kIHRoYXQgdGhlICJmb3JrLXZtIiBjb21tYW5kIGV2ZW4g
d2l0aCB0aGlzIHVwZGF0ZQo+ID4gPiA+ID4gPiA+ID4gPj4gd291bGQgc3RpbGwgbm90IHByb2R1
Y2UgZm9yIHlvdSBhICJmdWxseSBmdW5jdGlvbmFsIiBWTSBvbiBpdHMgb3duLgo+ID4gPiA+ID4g
PiA+ID4gPj4gVGhlIHVzZXIgc3RpbGwgaGFzIHRvIHByb2R1Y2UgYSBuZXcgVk0gY29uZmlnIGZp
bGUsIGNyZWF0ZSB0aGUgbmV3Cj4gPiA+ID4gPiA+ID4gPiA+PiBkaXNrLCBzYXZlIHRoZSBRRU1V
IHN0YXRlLCBldGMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJTU8gdGhlIGRlZmF1bHQg
YmVoYXZpb3Igb2YgdGhlIGZvcmsgY29tbWFuZCBzaG91bGQgYmUgdG8gbGVhdmUgdGhlCj4gPiA+
ID4gPiA+ID4gb3JpZ2luYWwgVk0gcGF1c2VkLCBzbyB0aGF0IHlvdSBjYW4gY29udGludWUgdXNp
bmcgdGhlIHNhbWUgZGlzayBhbmQKPiA+ID4gPiA+ID4gPiBuZXR3b3JrIGNvbmZpZyBpbiB0aGUg
Zm9yayBhbmQgeW91IHdvbid0IG5lZWQgdG8gcGFzcyBhIG5ldyBjb25maWcKPiA+ID4gPiA+ID4g
PiBmaWxlLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQXMgSnVsaWVuIGFscmVhZHkgc2Fp
ZCwgbWF5YmUgSSB3YXNuJ3QgY2xlYXIgaW4gbXkgcHJldmlvdXMgcmVwbGllczoKPiA+ID4gPiA+
ID4gPiBJJ20gbm90IGFza2luZyB5b3UgdG8gaW1wbGVtZW50IGFsbCB0aGlzLCBpdCdzIGZpbmUg
aWYgdGhlCj4gPiA+ID4gPiA+ID4gaW1wbGVtZW50YXRpb24gb2YgdGhlIGZvcmstdm0geGwgY29t
bWFuZCByZXF1aXJlcyB5b3UgdG8gcGFzcyBjZXJ0YWluCj4gPiA+ID4gPiA+ID4gb3B0aW9ucywg
YW5kIHRoYXQgdGhlIGRlZmF1bHQgYmVoYXZpb3IgaXMgbm90IGltcGxlbWVudGVkLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gV2UgbmVlZCBhbiBpbnRlcmZhY2UgdGhhdCdzIHNhbmUsIGFu
ZCB0aGF0J3MgZGVzaWduZWQgdG8gYmUgZWFzeSBhbmQKPiA+ID4gPiA+ID4gPiBjb21wcmVoZW5z
aXZlIHRvIHVzZSwgbm90IGFuIGludGVyZmFjZSBidWlsdCBhcm91bmQgd2hhdCdzIGN1cnJlbnRs
eQo+ID4gPiA+ID4gPiA+IGltcGxlbWVudGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPSywg
c28gSSB0aGluayB0aGF0IHdvdWxkIGxvb2sgbGlrZSAieGwgZm9yay12bSA8cGFyZW50X2RvbWlk
PiIgd2l0aAo+ID4gPiA+ID4gPiBhZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoaW5ncyBsaWtlIG5h
bWUsIGRpc2ssIHZsYW4sIG9yIGEgY29tcGxldGVseQo+ID4gPiA+ID4gPiBuZXcgY29uZmlnLCBh
bGwgb2Ygd2hpY2ggYXJlIGN1cnJlbnRseSBub3QgaW1wbGVtZW50ZWQsICsgYW4KPiA+ID4gPiA+
ID4gYWRkaXRpb25hbCBvcHRpb24gdG8gbm90IGxhdW5jaCBRRU1VIGF0IGFsbCwgd2hpY2ggd291
bGQgYmUgdGhlIG9ubHkKPiA+ID4gPiA+ID4gb25lIGN1cnJlbnRseSB3b3JraW5nLiBBbHNvIGtl
ZXBpbmcgdGhlIHNlcGFyYXRlICJ4bCBmb3JrLWxhdW5jaC1kbSIKPiA+ID4gPiA+ID4gYXMgaXMu
IElzIHRoYXQgd2hhdCB3ZSBhcmUgdGFsa2luZyBhYm91dD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
IHRoaW5rIGZvcmstbGF1bmNoLXZtIHNob3VsZCBqdXN0IGJlIGFuIG9wdGlvbiBvZiBmb3JrLXZt
IChpZToKPiA+ID4gPiA+IC0tbGF1bmNoLWRtLW9ubHkgb3Igc29tZSBzdWNoKS4gSSBkb24ndCB0
aGluayB0aGVyZSdzIGEgcmVhc29uIHRvIGhhdmUKPiA+ID4gPiA+IGEgc2VwYXJhdGUgdG9wLWxl
dmVsIGNvbW1hbmQgdG8ganVzdCBsYXVuY2ggdGhlIGRldmljZSBtb2RlbC4KPiA+ID4gPgo+ID4g
PiA+IEl0J3MganVzdCB0aGF0IHRoZSBmb3JrLWxhdW5jaC1kbSBuZWVkcyB0aGUgZG9taWQgb2Yg
dGhlIGZvcmssIHdoaWxlCj4gPiA+ID4gdGhlIGZvcmstdm0gbmVlZHMgdGhlIHBhcmVudCdzIGRv
bWlkLiBCdXQgSSBndWVzcyB3ZSBjYW4gaW50ZXJwcmV0IHRoZQo+ID4gPiA+ICJkb21pZCIgcmVx
dWlyZWQgaW5wdXQgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHdoaWNoIHN1Yi1vcHRpb24gaXMK
PiA+ID4gPiBzcGVjaWZpZWQgZm9yIHRoZSBjb21tYW5kLiBMZXQncyBzZWUgaG93IGl0IHBhbnMg
b3V0Lgo+ID4gPgo+ID4gPiBIb3cgZG9lcyB0aGUgZm9sbG93aW5nIGxvb2sgZm9yIHRoZSBpbnRl
cmZhY2U/Cj4gPiA+Cj4gPiA+ICAgICB7ICJmb3JrLXZtIiwKPiA+ID4gICAgICAgJm1haW5fZm9y
a192bSwgMCwgMSwKPiA+ID4gICAgICAgIkZvcmsgYSBkb21haW4gZnJvbSB0aGUgcnVubmluZyBw
YXJlbnQgZG9taWQiLAo+ID4gPiAgICAgICAiW29wdGlvbnNdIDxEb21pZD4iLAo+ID4gPiAgICAg
ICAiLWggICAgICAgICAgICAgICAgICAgICAgICAgICBQcmludCB0aGlzIGhlbHAuXG4iCj4gPiA+
ICAgICAgICItTiA8bmFtZT4gICAgICAgICAgICAgICAgICAgIEFzc2lnbiBuYW1lIHRvIFZNIGZv
cmsuXG4iCj4gPiA+ICAgICAgICItRCA8ZGlzaz4gICAgICAgICAgICAgICAgICAgIEFzc2lnbiBk
aXNrIHRvIFZNIGZvcmsuXG4iCj4gPiA+ICAgICAgICItQiA8YnJpZGdlICAgICAgICAgICAgICAg
ICAgIEFzc2lnbiBicmlkZ2UgdG8gVk0gZm9yay5cbiIKPiA+ID4gICAgICAgIi1WIDx2bGFuPiAg
ICAgICAgICAgICAgICAgICAgQXNzaWduIHZsYW4gdG8gVk0gZm9yay5cbiIKPiA+Cj4gPiBJTU8g
SSB0aGluayB0aGUgbmFtZSBvZiBmb3JrIGlzIHRoZSBvbmx5IHVzZWZ1bCBvcHRpb24uIEJlaW5n
IGFibGUgdG8KPiA+IGFzc2lnbiBkaXNrcyBvciBicmlkZ2VzIGZyb20gdGhlIGNvbW1hbmQgbGlu
ZSBzZWVtcyBxdWl0ZSBjb21wbGljYXRlZC4KPiA+IFdoYXQgYWJvdXQgVk1zIHdpdGggbXVsdGlw
bGUgZGlza3M/IE9yIFZNcyB3aXRoIG11bHRpcGxlIG5pY3Mgb24KPiA+IGRpZmZlcmVudCBicmlk
Z2VzPwo+ID4KPiA+IEkgdGhpbmsgaXQncyBlYXNpZXIgZm9yIGJvdGggdGhlIGltcGxlbWVudGF0
aW9uIGFuZCB0aGUgdXNlciB0byBqdXN0Cj4gPiB1c2UgYSBjb25maWcgZmlsZSBpbiB0aGF0IGNh
c2UuCj4gCj4gSSBhZ3JlZSBidXQgaXQgc291bmRlZCB0byBtZSB5b3UgZ3V5cyB3YW50ZWQgdG8g
aGF2ZSBhICJjb21wbGV0ZSIKPiBpbnRlcmZhY2UgZXZlbiBpZiBpdCdzIHVuaW1wbGVtZW50ZWQu
IFRoaXMgaXMgd2hhdCBhIGNvbXBsZXRlCj4gaW50ZXJmYWNlIHdvdWxkIGxvb2sgdG8gbWUuCgpJ
IHdvdWxkIGFkZCB0aG9zZSBvcHRpb25zIGFmdGVyd2FyZHMgaWYgdGhlcmUncyBhIG5lZWQgZm9y
IHRoZW0uIEkgd2FzCm1haW5seSBjb25jZXJuZWQgYWJvdXQgaW50cm9kdWNpbmcgYSB0b3AgbGV2
ZWwgY29tbWFuZCAoaWU6IGZvcmstdm0pCnRoYXQgd291bGQgcmVxdWlyZSBjYWxsaW5nIG90aGVy
IGNvbW1hbmRzIGluIG9yZGVyIHRvIGdldCBhIGZ1bmN0aW9uYWwKZm9yay4gSSdtIG5vdCBzbyBj
b25jZXJuZWQgYWJvdXQgaGF2aW5nIGFsbCB0aGUgcG9zc2libGUgb3B0aW9ucwpsaXN0ZWQgbm93
LCBhcyBsb25nIGFzIHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIGZvcmstdm0gaXMgc29tZXRoaW5n
CnNhbmUgdGhhdCBwcm9kdWNlcyBhIHdvcmtpbmcgZm9yaywgZXZlbiBpZiBub3QgZnVsbHkgaW1w
bGVtZW50ZWQgYXQKdGhpcyBzdGFnZS4KCj4gPgo+ID4gPiAgICAgICAiLUMgPGNvbmZpZz4gICAg
ICAgICAgICAgICAgICBVc2UgY29uZmlnIGZpbGUgZm9yIFZNIGZvcmsuXG4iCj4gPiA+ICAgICAg
ICItUSA8cWVtdS1zYXZlLWZpbGU+ICAgICAgICAgIFVzZSBxZW11IHNhdmUgZmlsZSBmb3IgVk0g
Zm9yay5cbiIKPiA+ID4gICAgICAgIi0tbGF1bmNoLWRtICA8eWVzfG5vfGxhdGU+ICAgTGF1bmNo
IGRldmljZSBtb2RlbCAoUUVNVSkgZm9yIFZNIGZvcmsuXG4iCj4gPiA+ICAgICAgICItLWZvcmst
cmVzZXQgICAgICAgICAgICAgICAgIFJlc2V0IFZNIGZvcmsuXG4iCj4gPiA+ICAgICAgICItcCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIERvIG5vdCB1bnBhdXNlIFZNcyBhZnRlciBmb3JrLiIK
PiA+Cj4gPiBJIHRoaW5rIHRoZSBkZWZhdWx0IGJlaGF2aW91ciBzaG91bGQgYmUgdG8gbGVhdmUg
dGhlIG9yaWdpbmFsIFZNCj4gPiBwYXVzZWQgYW5kIHRoZSBmb3JrZWQgb25lIHJ1bm5pbmcsIGFu
ZCBoZW5jZSB0aGlzIHNob3VsZCBiZToKPiAKPiBUaGF0IGlzIHRoZSBkZWZhdWx0LiBJIGd1ZXNz
IHRoZSB0ZXh0IHNheWluZyBWTXMgd2FzIG5vdCBjb3JyZWN0bHkKPiB3b3JkZWQsIGl0IGp1c3Qg
bWVhbnMgZG9uJ3QgdW5wYXVzZSBmb3JrIGFmdGVyIGl0J3MgY3JlYXRlZC4gVGhlCj4gcGFyZW50
IHJlbWFpbnMgYWx3YXlzIHBhdXNlZC4KCkFjay4KCj4gPgo+ID4gICAgICAgICAiLXAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBMZWF2ZSBmb3JrZWQgVk0gcGF1c2VkLiIKPiA+ICAgICAgICAg
Ii11ICAgICAgICAgICAgICAgICAgICAgICAgICAgTGVhdmUgcGFyZW50IFZNIHVucGF1c2VkLiIK
PiAKPiBCdXQgeW91IHNob3VsZG4ndCB1bnBhdXNlIHRoZSBwYXJlbnQgVk0gYXQgYWxsLiBJdCBz
aG91bGQgcmVtYWluCj4gcGF1c2VkIGFzIGxvbmcgYXMgdGhlcmUgYXJlIGZvcmtzIHJ1bm5pbmcg
dGhhdCB3ZXJlIHNwbGl0IGZyb20gaXQuCj4gVW5wYXVzaW5nIGl0IHdpbGwgbGVhZCB0byBzdWJ0
bGUgYW5kIHVuZXhwbGFpbmFibGUgY3Jhc2hlcyBpbiB0aGUgZm9yawo+IHNpbmNlIHRoZSBmb3Jr
IG5vdyB3aWxsIHVzZSBwYWdlcyB0aGF0IGFyZSBmcm9tIGEgZGlmZmVyZW50IGV4ZWN1dGlvbgo+
IHBhdGguIFRlY2huaWNhbGx5IGluIHRoZSBmdXR1cmUgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
dW5wYXVzZSB0aGUgVk0KPiBidXQgaXQgcmVxdWlyZXMgdG8gZnVsbHkgcG9wdWxhdGUgdGhlIHBh
Z2V0YWJsZXMgaW4gYWxsIGZvcmtzIG1hZGUKPiBmcm9tIGl0IHdpdGggbWVtX3NoYXJlZCBlbnRy
aWVzIGFuZCBkZWR1cGxpY2F0ZSB0byB0aGUgZm9ya3MgYWxsIHRoZQo+IHBhZ2VzIHRoYXQncyBj
YW4ndCBiZSBiZSBzaGFyZWQuCgpPaCwgT0ssIHNpbmNlIEkgZGlkbid0IGxvb2sgYXQgdGhlIGlt
cGxlbWVudGF0aW9uIHlldCBJIGFzc3VtZWQgdGhhdAp0aGUgcGFyZW50IHdvdWxkIGFsc28gYmUg
c3dpdGNoZWQgdG8gdHJhcCBvbiBtZW1vcnkgd3JpdGVzLCBzbyB0aGF0CnlvdSBjb3VsZCBkdXBs
aWNhdGUgdGhlIHBhZ2VzIGJlZm9yZSB0aGUgcGFyZW50IHdyaXRlcyB0byB0aGVtLCBhbmQKaGVu
Y2UgdGhlIHBhcmVudCBjb3VsZCBiZSBsZWZ0IHJ1bm5pbmcuCgpBbnl3YXksIGxldCdzIGZvcmdl
dCBhYm91dCB0aGUgImxlYXZlIHBhcmVudCB1bnBhdXNlZCIgb3B0aW9uIHRoZW4uCgo+IFRoYXQg
d2FzIHdoYXQgSSBvcmlnaW5hbGx5IHRyaWVkIHRvCj4gZG8gYnV0IGl0IHdhcyBleHRyZW1lbHkg
c2xvdywgaGVuY2UgdGhlIGxhenktcG9wdWxhdGlvbiBvZiB0aGUKPiBwYWdldGFibGUgaW4gdGhl
IGZvcmtzLgo+IAo+ID4KPiA+ID4gICAgICAgIi1oICAgICAgICAgICAgICAgICAgICAgICAgICAg
UHJpbnQgdGhpcyBoZWxwLlxuIgo+ID4gPiAgICAgICAiLWQgICAgICAgICAgICAgICAgICAgICAg
ICAgICBFbmFibGUgZGVidWcgbWVzc2FnZXMuXG4iCj4gPiA+ICAgICB9LAo+ID4gPgo+ID4gPiBD
dXJyZW50bHkgdGhlIHBhcnRzIHRoYXQgYXJlIGltcGxlbWVudGVkIHdvdWxkIGxvb2sgbGlrZToK
PiA+ID4geGwgZm9yay12bSAtcCAtLWxhdW5jaC1kbSBubyA8cGFyZW50X2RvbWlkPgo+ID4gPiB4
bCBmb3JrLXZtIC1wIC0tbGF1bmNoLWRtIGxhdGUgLUMgPGNvbmZpZz4gLVEgPHFlbXUtc2F2ZS1m
aWxlPiA8Zm9ya19kb21pZD4KPiA+Cj4gPiBXaHkgZG8geW91IG5lZWQgYSBjb25maWcgZmlsZSBm
b3IgbGF1bmNoaW5nIHRoZSBRZW11IGRldmljZSBtb2RlbD8KPiA+IERvZXNuJ3QgdGhlIHNhdmUt
ZmlsZSBjb250YWluIGFsbCB0aGUgaW5mb3JtYXRpb24/Cj4gCj4gVGhlIGNvbmZpZyBpcyB1c2Vk
IHRvIHBvcHVsYXRlIHhlbnN0b3JlLCBub3QganVzdCBmb3IgUUVNVS4gVGhlIFFFTVUKPiBzYXZl
IGZpbGUgZG9lc24ndCBjb250YWluIHRoZSB4bCBjb25maWcuIFRoaXMgaXMgbm90IGEgZnVsbCBW
TSBzYXZlCj4gZmlsZSwgaXQgaXMgb25seSB0aGUgUUVNVSBzdGF0ZSB0aGF0IGdldHMgZHVtcGVk
IHdpdGgKPiB4ZW4tc2F2ZS1kZXZpY2VzLXN0YXRlLgoKVEJIIEkgdGhpbmsgaXQgd291bGQgYmUg
ZWFzaWVyIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UgbXkgcHJvcG9zYWwKYmVsb3csIHdoZXJlIHlv
dSB0ZWxsIHhsIHRoZSBwYXJlbnQgYW5kIHRoZSBmb3JrZWQgVk0gbmFtZXMgYW5kIHhsCmRvZXMg
dGhlIHJlc3QuIEV2ZW4gYmV0dGVyIHdvdWxkIGJlIHRvIG5vdCBoYXZlIHRvIHRlbGwgeGwgdGhl
IHBhcmVudApWTSBuYW1lIChzaW5jZSBJIGd1ZXNzIHRoaXMgaXMgYWxyZWFkeSB0cmFja2VkIGlu
dGVybmFsbHkgc29tZXdoZXJlPykuCgpBbnl3YXksIEknbSBub3QgZ29pbmcgdG8gaW5zaXN0IG9u
IHRoaXMgYnV0IHRoZSB3b3JrZmxvdyBvZiB0aGUgUWVtdQpmb3JraW5nIHNlZW1zIHRvIG5vdCBi
ZSB2ZXJ5IHVzZXIgZnJpZW5kbHkgdW5sZXNzIHlvdSBrbm93IGV4YWN0bHkgaG93CnRvIHVzZSBp
dC4KCj4gCj4gPgo+ID4gSSB0aGluayB5b3UgYWxzbyBuZWVkIHNvbWV0aGluZyBsaWtlOgo+ID4K
PiA+ICMgeGwgZm9yay12bSAtLWxhdW5jaC1kbSBsYXRlIDxwYXJlbnRfZG9taWQ+IDxmb3JrX2Rv
bWlkPgo+ID4KPiA+IFNvIHRoYXQgYSB1c2VyIGRvZXNuJ3QgbmVlZCB0byBwYXNzIGEgcWVtdS1z
YXZlLWZpbGU/Cj4gCj4gVGhpcyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBtZS4gVG8gbGF1
bmNoIFFFTVUgeW91IG5lZWQgdGhlIGNvbmZpZwo+IGZpbGUgdG8gd2lyZSB0aGluZ3MgdXAgY29y
cmVjdGx5LiBMaWtlIGluIG9yZGVyIHRvIGxhdW5jaCBRRU1VIHlvdQo+IG5lZWQgdG8gdGVsbCBp
dCB0aGUgbmFtZSBvZiB0aGUgVk0sIGRpc2sgcGF0aCwgZXRjLiB0aGF0IGFyZSBhbGwKPiBjb250
YWluZWQgaW4gdGhlIGNvbmZpZy4KCllvdSBjb3VsZCBnZXQgYWxsIHRoaXMgaW5mb3JtYXRpb24g
ZnJvbSB0aGUgcGFyZW50IFZNLCBJSVJDIGxpYnhsIGhhcwphIGpzb24gdmVyc2lvbiBvZiB0aGUg
Y29uZmlnLiBGb3IgZXhhbXBsZSBmb3IgbWlncmF0aW9uIHRoZXJlJ3Mgbm8KbmVlZCB0byBwYXNz
IGFueSBjb25maWcgZmlsZSwgc2luY2UgdGhlIGluY29taW5nIFZNIGNhbiBiZSByZWNyZWF0ZWQK
ZnJvbSB0aGUgZGF0YSBpbiB0aGUgc291cmNlIFZNLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
