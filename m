Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC0FFDA46
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:01:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVYNW-0007Sy-Ge; Fri, 15 Nov 2019 09:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1em=ZH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVYNV-0007St-Os
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 09:58:57 +0000
X-Inumbo-ID: 890026d8-078e-11ea-a261-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890026d8-078e-11ea-a261-12813bfff9fa;
 Fri, 15 Nov 2019 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573811935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cJJ3ZgeFN2MKZAtW8TX+SbdLrpZIVISSl2dK4L7zY8Q=;
 b=a6bKa/493MKNrY53K7mUmMlOreOKF83lWe4KtEsM4Hf/r7o1bkA+9Ywh
 rgKAfPoA2XYjdcS5qe5JVTWNBv3Ld/jCCvIfca9IQFDE8t6hoCbDQ1mlx
 fy7XtcPukEMiGiNFqbtfn8HVrgpoJXu665kQ+ph18eW+aNmGGXvxyN/WL A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zjxiNHYBZzk1dyJxUdGaBe7zOWWoH0dFYG4WOB8UU88Y/mZZG3+wO+dMB9MclPWbVHx4s5vvYs
 1+/3sxtja2gTGzZkJEqgArDJ2i25tDxQZqXRh0FC+8fAuuQttKIASs4eq7IiBg8zWSok3q5C/D
 OZSLj50mhI7Lbm9RVTg0xs5J2Yj4VrclFEgkJ48Df44Z+PU7mkYP56mg3aNczoj6CXfa/jEeXU
 dBaWuaEDSgSgCbw0c7oamqFBerxJ28G9FuqoOZlxgnaX7nuGZF9mfaKSZeqsZtTge0DKcWkdu8
 GGc=
X-SBRS: 2.7
X-MesageID: 8909508
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,307,1569297600"; 
   d="scan'208";a="8909508"
Date: Fri, 15 Nov 2019 10:58:45 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115095845.GG72134@Air-de-Roger>
References: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
 <20191114093820.GB72134@Air-de-Roger>
 <d0bb88b8-2cf6-c631-4f96-a90d921be850@suse.com>
 <20191114131229.GC72134@Air-de-Roger>
 <81190aab-fcec-d7fc-ec10-4da976268e7b@suse.com>
 <20191114181006.GF72134@Air-de-Roger>
 <8cd6678a-b9e7-171d-a584-7c5085dbb673@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cd6678a-b9e7-171d-a584-7c5085dbb673@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: fix clang .macro retention check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, JulienGrall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6NDQ6MjJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTQuMTEuMjAxOSAxOToxMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAxNCwgMjAxOSBhdCAwNDo1NjozNVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxNC4xMS4yMDE5IDE0OjEyLCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTI6NDM6MzNQTSArMDEwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBPbiAxNC4xMS4yMDE5IDEwOjM4LCBSb2dlciBQYXUgTW9ubsOpICB3cm90
ZToKPiA+Pj4+PiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwNjowMTo0MFBNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L1J1bGVzLm1rCj4gPj4+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+ID4+Pj4+PiBAQCAtODIsNiArNjQsNiBA
QCAkKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsIi5pbmNsdWRlCj4gPj4+Pj4+ICAjIENo
ZWNrIHdoZXRoZXIgY2xhbmcga2VlcHMgLm1hY3JvLXMgYmV0d2VlbiBhc20oKS1zOgo+ID4+Pj4+
PiAgIyBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTM2MTEwCj4gPj4+Pj4+
ICAkKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsXAo+ID4+Pj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgIi5tYWNybyBGT09cbi5lbmRtXCIpOyBhc20gdm9sYXRpbGUgKFwiLm1hY3JvIEZP
T1xuLmVuZG0iLFwKPiA+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICIubWFjcm8gRk9PXG4u
ZW5kbSIkJChjbG9zZSk7IGFzbSB2b2xhdGlsZSAkJChvcGVuKSIubWFjcm8gRk9PXG4uZW5kbSIs
XAo+ID4+Pj4+Cj4gPj4+Pj4gVGhhbmtzLCB3aGlsZSBoZXJlIGNvdWxkIHlvdSBhbHNvIHJlcGxh
Y2UgdGhlICdcbicgd2l0aCBhICc7Jz8gJ1xuJwo+ID4+Pj4+IGRvZXNuJ3Qgd29yayBwcm9wZXJs
eSBhbmQgZ2l2ZXMgbWUgdGhlIGZvbGxvd2luZyBlcnJvcjoKPiA+Pj4+Pgo+ID4+Pj4+IDxzdGRp
bj46MTozMjogZXJyb3I6IG1pc3NpbmcgdGVybWluYXRpbmcgJyInIGNoYXJhY3RlciBbLVdlcnJv
ciwtV2ludmFsaWQtcHAtdG9rZW5dCj4gPj4+Pj4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxl
ICggICIubWFjcm8gRk9PCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiA+Pj4+PiA8c3RkaW4+OjE6MzI6IGVycm9yOiBleHBlY3RlZCBzdHJpbmcgbGl0ZXJhbCBpbiAn
YXNtJwo+ID4+Pj4+IDxzdGRpbj46Mzo2OiBlcnJvcjogbWlzc2luZyB0ZXJtaW5hdGluZyAnIicg
Y2hhcmFjdGVyIFstV2Vycm9yLC1XaW52YWxpZC1wcC10b2tlbl0KPiA+Pj4+PiAuZW5kbSIgKTsg
fQo+ID4+Pj4+ICAgICAgXgo+ID4+Pj4+IDxzdGRpbj46MzoxMjogZXJyb3I6IGV4cGVjdGVkICcp
Jwo+ID4+Pj4+IC5lbmRtIiApOyB9Cj4gPj4+Pj4gICAgICAgICAgICBeCj4gPj4+Pj4gPHN0ZGlu
PjoxOjI5OiBub3RlOiB0byBtYXRjaCB0aGlzICcoJwo+ID4+Pj4+IHZvaWQgXyh2b2lkKSB7IGFz
bSB2b2xhdGlsZSAoICAiLm1hY3JvIEZPTwo+ID4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCj4gPj4+Pj4gPHN0ZGluPjozOjEyOiBlcnJvcjogZXhwZWN0ZWQgJ30nCj4gPj4+Pj4g
LmVuZG0iICk7IH0KPiA+Pj4+PiAgICAgICAgICAgIF4KPiA+Pj4+PiA8c3RkaW4+OjE6MTQ6IG5v
dGU6IHRvIG1hdGNoIHRoaXMgJ3snCj4gPj4+Pj4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxl
ICggICIubWFjcm8gRk9PCj4gPj4+Pj4gICAgICAgICAgICAgIF4KPiA+Pj4+Cj4gPj4+PiBTbyB0
aGlzIG11c3QgYmUgeWV0IGFub3RoZXIgaXNzdWUgLSBJIGRpZCBzcGVjaWZpY2FsbHkgbG9vayBh
dCB0aGUgd2hhdAo+ID4+Pj4gZ2V0cyBoYW5kZWQgdG8gdGhlIGNvbXBpbGVyLCBhbmQgSSBkaWQg
bm90IHNlZSB0aGUgYWJvdmUuIEkgd29uZGVyCj4gPj4+PiB3aGV0aGVyIHRoYXQncyBhbHNvIHJl
bGF0ZWQgdG8gdGhlIFwiIHRoYXQgSSBmb3VuZCBuZWNlc3NhcnkgdG8gZHJvcCAtCj4gPj4+PiB3
aXRoIHdoYXQgeW91IHNheSBJJ2QgZXhwZWN0IHRoZSB1bi1lc2NhcGVkIGRvdWJsZSBxdW90ZXMg
d29uJ3Qgd29yawo+ID4+Pj4gZm9yIHlvdS4KPiA+Pj4KPiA+Pj4gQUZBSUsgdGhvc2Ugd29yayBm
aW5lLgo+ID4+Pgo+ID4+Pj4gSSBzdXBwb3NlIHRob3VnaCB0aGlzIHVuLWVzY2FwaW5nIChvciBu
b3QpIGhhcHBlbnMgYXQgYSBsZXZlbAo+ID4+Pj4gb3RoZXIgdGhhbiB0aGUgY29tcGlsZXIsIGku
ZS4gZWl0aGVyIGEgZGlmZmVyZW5jZSBpbiBzaGVsbCBvciBpbiBtYWtlCj4gPj4+PiBiZWhhdmlv
ci4KPiA+Pj4KPiA+Pj4gTWF5YmUsIEknbSBub3QgYW4gZXhwZXJ0IG9uIHNoZWxscyBvciBtYWtl
ZmlsZXMuIFRoaXMgdGltZSBJJ3ZlIHRlc3RlZAo+ID4+PiB3aXRoIERlYmlhbiA5LjUgaW5zdGVh
ZCBvZiBGcmVlQlNELCBzbyBpdCdzIGxpa2VseSB0aGF0IHdoYXQgd2FzIHRoZXJlCj4gPj4+IHdv
cmtlZCBmaW5lIG9uIEZyZWVCU0Qgd2hpY2ggSSdtIHF1aXRlIHN1cmUgd2FzIHdoYXQgSSB0ZXN0
aW5nIGFnYWluc3QKPiA+Pj4gYmFjayB3aGVuIEkgYWRkZWQgdGhpcyBjaGVjay4KPiA+Pj4KPiA+
Pj4gVGhpcyBpcyB3aGF0IEkgdXNlZCB0byB0ZXN0Ogo+ID4+Pgo+ID4+PiBHTlUgTWFrZSA0LjEK
PiA+Pj4gR05VIGJhc2gsIHZlcnNpb24gNC40LjEyKDEpLXJlbGVhc2UgKHg4Nl82NC1wYy1saW51
eC1nbnUpCj4gPj4+Cj4gPj4+IE5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIG90aGVyIHV0aWxp
dGllcyBpbnZvbHZlZCBpbiB0aGlzIGJlaGF2aW9yLgo+ID4+Pgo+ID4+Pj4gSU9XIEkgZG9uJ3Qg
dGhpbmsganVzdCByZXBsYWNpbmcgXG4gYnkgOyB3aWxsIGRvLgo+ID4+Pgo+ID4+PiBJIGNhbiBn
aXZlIHlvdXIgcGF0Y2ggYSB0cnkgd2l0aCBGcmVlQlNELCBidXQgdGhhdCdzIG5vdCBnb2luZyB0
bwo+ID4+PiBleHBsYWluIHRoZSBkaWZmZXJlbnQgYmVoYXZpb3IgSSdtIGFmcmFpZC4KPiA+Pgo+
ID4+IExldCdzIGFwcHJvYWNoIHRoaXMgYSBkaWZmZXJlbnQgd2F5LiBCZWxvdyBpcyBhIGRlYnVn
Z2luZyBwYXRjaAo+ID4+IChzaW1pbGFyIHRvIHNvbWV0aGluZyBJIGRpZCB1c2UgeWVzdGVyZGF5
KS4gV2l0aCBteSBwYXRjaCBhbmQgeW91cnMKPiA+PiBvbiB0b3AgKGJ1dCB3aXRoIHRoZSBcbiBy
ZXN0b3JlZCBmb3IgdGhlIHB1cnBvc2VzIGhlcmUsIGFuZCB3aXRoCj4gPj4gdGhlIGJsb2NrIGlu
c2VydGVkIGZpcnN0IGluIHRoZSBpZmVxKCwpIGl0IGdldHMgbW92ZWQgdG8pIEkgZ2V0IGluCj4g
Pj4gLmFzLWluc24uMQo+ID4+Cj4gPj4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggIi5l
cXUgXCJ4XCIsMSIgKTsgfQo+ID4+IHZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICIuTDA6
XG4uTDE6XG4uc2tpcCAoLkwxIC0gLkwwKSIgKTsgfQo+ID4+IHZvaWQgXyh2b2lkKSB7IGFzbSB2
b2xhdGlsZSAoICIuaW5jbHVkZSBcImFzbS9pbmRpcmVjdF90aHVua19hc20uaFwiIiApOyB9Cj4g
Pj4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFjcm8gRk9PXG4uZW5kbSIpOyBh
c20gdm9sYXRpbGUgKCIubWFjcm8gRk9PXG4uZW5kbSIgKTsgfQo+ID4gCj4gPiBUaGUgZm9sbG93
aW5nIGRhdGEgaXMgZnJvbSBEZWJpYW4gR05VL0xpbnV4IDkuNSAoc3RyZXRjaCksIEkgaGF2ZW4n
dAo+ID4gdHJpZWQgb24gRnJlZUJTRCBidXQgdGhpcyBvdXRwdXQgaXMgYWxyZWFkeSBkaWZmZXJl
bnQgZnJvbSB3aGF0IHlvdQo+ID4gZ2V0Lgo+ID4gCj4gPiBTbyB0aGlzIGlzIHdoYXQgSSBoYXZl
IGluIC5hcy1pbnNuLjEgKHRoZSByZWxldmFudCBwYXJ0KToKPiA+IAo+ID4gdm9pZCBfKHZvaWQp
IHsgYXNtIHZvbGF0aWxlICggIi5lcXUgXCJ4XCIsMSIgKTsgfQo+ID4gdm9pZCBfKHZvaWQpIHsg
YXNtIHZvbGF0aWxlICggImludnBjaWQgKCVyYXgpLCVyYXgiICk7IH0KPiA+IHZvaWQgXyh2b2lk
KSB7IGFzbSB2b2xhdGlsZSAoICAiLmlmICgoMSA+IDApIDwgMCk7IC5lcnJvciBcIlwiOy5lbmRp
ZiIgKTsgfQo+ID4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIuTDE6IC5MMjogLm5v
cHMgKC5MMiAtIC5MMSksOSIgKTsgfQo+ID4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICgg
Ii5MMDoKPiA+IC5MMToKPiA+IC5za2lwICguTDEgLSAuTDApIiApOyB9Cj4gPiB2b2lkIF8odm9p
ZCkgeyBhc20gdm9sYXRpbGUgKCAiLmluY2x1ZGUgXCJhc20vaW5kaXJlY3RfdGh1bmtfYXNtLmhc
IiIgKTsgfQo+ID4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFjcm8gRk9PCj4g
PiAuZW5kbSIpOyBhc20gdm9sYXRpbGUgKCIubWFjcm8gRk9PCj4gPiAuZW5kbSIgKTsgfQo+ID4g
Cj4gPiBTbyBteSBtYWtlL3NoZWxsL3doYXRldmVyIGlzIGV4cGFuZGluZyB0aGUgXG4uCj4gCj4g
U28gdG8gdGVsbCBhcGFydCBtYWtlIGFuZCBzaGVsbCAtIHdoYXQgZG9lcyBhIHBsYWluCj4gCj4g
ZWNobyAnIi5MMDpcbi5MMTpcbi5za2lwICguTDEgLSAuTDApIicKPiAKPiBwcm9kdWNlIGZvciB5
b3U/CgojIGVjaG8gJyIuTDA6XG4uTDE6XG4uc2tpcCAoLkwxIC0gLkwwKSInCiIuTDA6XG4uTDE6
XG4uc2tpcCAoLkwxIC0gLkwwKSIKClNvIGl0IHNlZW1zIFxuIGlzIG5vdCBleHBhbmRlZC4KCj4g
QWxzbywgdW5sZXNzIHlvdSBwYXNzIC1zIHRvIG1ha2UsIHlvdSBvdWdodCB0byBiZQo+IGFibGUg
dG8gc2VlIHdoYXQgbWFrZSBhY3R1YWxseSBwYXNzZXMgdG8gZWNoby4KPiAKPiBPbiB0aGUgcG9z
aXRpdmUgc2lkZSB0aGUgXCIgaW5zdGFuY2VzIGRvbid0IGdldCBjaGFuZ2VkLCB3aGljaCBtYWtl
cwo+IGl0IGV2ZW4gbW9yZSBvZiBhIG15c3RlcnkgaG93IHRoZSAubWFjcm8gcmV0ZW50aW9uIGNo
ZWNrIHdvdWxkIGhhdmUKPiB3b3JrZWQgb3JpZ2luYWxseS4KCklJUkMgSSB0ZXN0ZWQgdGhhdCBv
biBGcmVlQlNEIGluc3RlYWQgb2YgRGViaWFuLCB3aGljaCBtaWdodCBoYXZlIGEKZGlmZmVyZW50
IGJlaGF2aW9yLiBJIHdpbGwgdGVzdCB0aGUgcmVzdWx0aW5nIHBhdGNoZXMgb24gRnJlZUJTRCBh
bHNvCnRvIGVuc3VyZSB0aGV5IHdvcmsgY29ycmVjdGx5LgoKPiBUaGlzIHdvdWxkIHRoZW4gc3Vn
Z2VzdCB0aGF0IHdlIGNvdWxkIGdldCBhd2F5Cj4gd2l0aCBzaW1wbHkgcmVwbGFjaW5nIHRoZSBc
biB3aXRoIDsgYXMgeW91IGRpZCBpbiB5b3VyIHBhdGNoIChhbmQgSQo+IHNob3VsZCB0aGVuIGZv
bGxvdyBzdWl0IGluIG1pbmUpLgoKSSBjYW4gdGVzdCB0aGF0IG9uIERlYmlhbiBhbmQgRnJlZUJT
RCwgYnV0IEknbSBzdGlsbCBxdWl0ZSBwdXp6bGVkIGJ5CnRoaXMgZGlmZmVyZW50IGJlaGF2aW9y
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
