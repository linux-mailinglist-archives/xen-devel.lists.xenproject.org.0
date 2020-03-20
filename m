Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF918D0AA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:25:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIXa-00085h-Mk; Fri, 20 Mar 2020 14:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFIXZ-00085c-UQ
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:22:25 +0000
X-Inumbo-ID: 376f85f8-6ab6-11ea-bd83-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 376f85f8-6ab6-11ea-bd83-12813bfff9fa;
 Fri, 20 Mar 2020 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584714144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GWO4ZlIWMYA4IMHhXX+LJLgoUFyzJ/bicvOz6pMGWRo=;
 b=Ax2ptF1+O0gbQoPZSIVUmnoP7686GTekgQBL0528u8b9jxTmTky+N81c
 +G6+VeP8FPSKoQwQPcOWRVQmayZ3r6E8rWwvinaFz+nEmpxO1/FBaP8kN
 5h2cUVQtyEG3L7158oEj/YLiEDgyvqZdL91YtBllY8tZ3O9XxmRtjQ8u2 s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z/rjOyOTe2ntP1oDSG/qsAeoTS9FUDnQulKlzz80FCkRefdrUWt5ddIIwnB9UUAdCcf0Orrmqm
 6otf97kVDyOOH1RvbzsEWYsoZTI+2B+hXvGpAy8VDjT3SMAykWO7oXIWW8JsD94KICXUTpLuRX
 91PGNTMxRn6Uv/YBDUh0cKWPpVO/BHDIh2wxNp/A+D0ynKDVmUiieHl0nPgbVsHMOxRxZoPUQG
 DSkWf41pXlUDnPNg09o6sveeW6X0xN5fhpGditsIr6VDiwk433o+TLOkA9gEG4y8ihu4aN0eVY
 QXA=
X-SBRS: 2.7
X-MesageID: 14354759
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14354759"
Date: Fri, 20 Mar 2020 15:22:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200320142214.GX24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDI6MTY6NDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDMuMjAyMCAxMDowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA4OjIxOjE5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE5LjAzLjIwMjAgMjA6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+Pj4gT24g
MTkvMDMvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+IE9uIFRodSwg
TWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+
Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+Pj4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MjE6MjNQTSArMDAw
MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+Pj4+PiDCoCA+PiBXaHkgY2FuJ3QgeW91IGtlZXAg
Zmx1c2hfdGxiX21hc2soKSBoZXJlPwo+ID4+Pj4+Pgo+ID4+Pj4+PiBCZWNhdXNlIGZpbHRlcmVk
X2ZsdXNoX3RsYl9tYXNrIGlzIHVzZWQgaW4gcG9wdWxhdGVfcGh5c21hcCwgYW5kCj4gPj4+Pj4+
IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3
YXJlLgo+ID4+Pj4+Cj4gPj4+Pj4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5ZXQgZXhwbGFp
biBtZSB3aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPiA+Pj4+PiB1cGRhdGVkIHNv
IGl0IGZsdXNoIHRoZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4KPiA+Pj4+Cj4gPj4+PiBDdXJyZW50
IGJlaGF2aW9yIHByZXZpb3VzIHRvIHRoaXMgcGF0Y2ggaXMgdG8gZmx1c2ggdGhlIEFTSURzIG9u
Cj4gPj4+PiBldmVyeSBUTEIgZmx1c2guCj4gPj4+Pgo+ID4+Pj4gZmx1c2hfdGxiX21hc2sgaXMg
dG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBwbGFjZXMgd2hlcmUgdGhlcmUncyBubwo+ID4+Pj4g
bmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcgYXNzaXN0ZWQgZmx1
c2hlcyAoYnkgTDApCj4gPj4+PiB3aGVuIHJ1bm5pbmcgbmVzdGVkLCBzaW5jZSB0aG9zZSBhc3Np
c3RlZCBmbHVzaGVzIHBlcmZvcm1lZCBieSBMMAo+ID4+Pj4gZG9uJ3QgZmx1c2ggdGhlIEwyIGd1
ZXN0cyBUTEJzLgo+ID4+Pj4KPiA+Pj4+IEkgY291bGQga2VlcCBjdXJyZW50IGJlaGF2aW9yIGFu
ZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNvIGZsdXNoaW5nIHRoZQo+ID4+Pj4gQVNJRHMsIGJ1
dCB0aGF0IHNlZW1zIHdyb25nIGFzIHRoZSBmdW5jdGlvbiBkb2Vzbid0IGhhdmUgYW55dGhpbmcg
aW4KPiA+Pj4+IGl0J3MgbmFtZSB0aGF0IHN1Z2dlc3RzIGl0IGFsc28gZmx1c2hlcyB0aGUgaW4t
Z3Vlc3QgVExCcyBmb3IgSFZNLgo+ID4+Pgo+ID4+PiBJIGFncmVlIHRoZSBuYW1lIGlzIGNvbmZ1
c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1wbGVtZW50YXRpb24gdG8gdW5kZXJzdGFuZCB3
aGF0IGl0IGRvZXMuCj4gPj4+Cj4gPj4+IEhvdyBhYm91dCByZW5hbWluZyAob3IgaW50cm9kdWNp
bmcpIHRoZSBmdW5jdGlvbiB0byBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrKCkgb3IgZmx1c2hf
dGxiX2FsbF9ndWVzdHNfY3B1bWFzaygpKSA/Cj4gPj4KPiA+PiBBbmQgdGhpcyB3b3VsZCB0aGVu
IGZsdXNoIF9vbmx5XyBndWVzdCBUTEJzPwo+ID4gCj4gPiBObywgSSB0aGluayBmcm9tIEp1bGll
bidzIHByb3Bvc2FsIChpZiBJIHVuZGVyc3Rvb2QgaXQgY29ycmVjdGx5KQo+ID4gZmx1c2hfdGxi
X2FsbF9ndWVzdHNfbWFzayB3b3VsZCBkbyB3aGF0IGZsdXNoX3RsYl9tYXNrIGN1cnJlbnRseSBk
b2VzCj4gPiBwcmV2aW91cyB0byB0aGlzIHBhdGNoIChmbHVzaCBYZW4ncyBUTEJzICsgSFZNIEFT
SURzKS4KPiA+IAo+ID4+Pj4gSSB3b3VsZCByYXRoZXIgcHJlZmVyIHRoZSBkZWZhdWx0IHRvIGJl
IHRvIG5vdCBmbHVzaCB0aGUKPiA+Pj4+IEFTSURzLCBzbyB0aGF0IHVzZXJzIG5lZWQgdG8gc3Bl
Y2lmeSBzbyBieSBwYXNzaW5nIHRoZSBmbGFnIHRvCj4gPj4+PiBmbHVza19tYXNrLgo+ID4+PiBU
aGF0J3MgeDg2IGNob2ljZS4gRm9yIGNvbW1vbiwgSSB3b3VsZCByYXRoZXIgbm8gaW50cm9kdWNl
IHRob3NlIGZsYWdzIHVudGlsIHdlIGhhdmUgYW5vdGhlciBhcmNoIHRoYXQgbWFrZSB1c2Ugb2Yg
aXQuCj4gPj4KPiA+PiBUaGUgZmxhZ3Mgc2hvdWxkIHBlcmhhcHMgaW5kZWVkIHJlbWFpbiB4ODYt
c3BlY2lmaWMsIGJ1dCBzdWl0YWJsZQo+ID4+IHdyYXBwZXJzIHVzYWJsZSBmcm9tIGNvbW1vbiBj
b2RlIHNob3VsZCBleGlzdCAoYXMgeW91IHN1Z2dlc3QKPiA+PiBiZWxvdykuCj4gPiAKPiA+IEkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIHJlIG5hbWluZywgYXJlIHlvdSBPSyB3aXRoIHRo
ZSBuYW1lcwo+ID4gcHJvcG9zZWQgYWJvdmU/Cj4gCj4gV2VsbCwgbm8gLSBpbW8gYSBmdW5jdGlv
biBuYW1lZCBlLmcuIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSBpcwo+IG5vdCBzdXBw
b3NlZCB0byBmbHVzaCBhbnkgaG9zdCBUTEJzLiBCdXQgSSdsbCBhbHNvIHJlcGx5IHRvIEp1bGll
bidzCj4gc3Vic2VxdWVudCByZXBseSBpbiBhIG1pbnV0ZS4KCkl0IHNlZW1zIGxpa2UgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGZsdXNoX3RsYl9tYXNrIG9uIEFSTSBhbmQgeDg2CmFscmVhZHkgaGFz
IGRpZmZlcmVudCBtZWFuaW5ncywgYXMgdGhlIEFSTSBvbmUgb25seSBmbHVzaGVzIGd1ZXN0cwpU
TEJzIGJ1dCBub3QgWGVuJ3Mgb25lLgoKQWx0ZXJuYXRpdmVseSBJIGNvdWxkIGNvZGUgdGhpcyBh
czoKCnN0YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayh1aW50MzJfdCB0
bGJmbHVzaF90aW1lc3RhbXApCnsKICAgIGNwdW1hc2tfdCBtYXNrOwoKICAgIGNwdW1hc2tfY29w
eSgmbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsKICAgIHRsYmZsdXNoX2ZpbHRlcigmbWFzaywgdGxi
Zmx1c2hfdGltZXN0YW1wKTsKICAgIGlmICggIWNwdW1hc2tfZW1wdHkoJm1hc2spICkKICAgIHsK
ICAgICAgICBwZXJmY19pbmNyKG5lZWRfZmx1c2hfdGxiX2ZsdXNoKTsKI2lmIENPTkZJR19YODYK
ICAgICAgICAvKgogICAgICAgICAqIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrIGlzIHVzZWQgYWZ0
ZXIgbW9kaWZ5aW5nIHRoZSBwMm0gaW4KICAgICAgICAgKiBwb3B1bGF0ZV9waHlzbWFwLCBYZW4g
bmVlZHMgdG8gdHJpZ2dlciBhbiBBU0lEIHRpY2tsZSBhcyB0aGlzIGlzIGEKICAgICAgICAgKiBy
ZXF1aXJlbWVudCBvbiBBTUQgaGFyZHdhcmUuCiAgICAgICAgICovCiAgICAgICAgZmx1c2hfbWFz
aygmbWFzaywgRkxVU0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiNlbHNlCiAgICAgICAg
Zmx1c2hfdGxiX21hc2soJm1hc2spOwojZW5kaWYKICAgIH0KfQoKQW5kIHdlIGNhbiBzZWUgbGF0
ZXIgYWJvdXQgZ2V0dGluZyByaWQgb2YgdGhlIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrCmNhbGxz
IGluIHBvcHVsYXRlX3BoeXNtYXAgYW5kIGFsbG9jX2hlYXBfcGFnZXMgaWYgdGhleSBhcmUgcmVh
bGx5CnVubmVlZGVkLCB3aGljaCB3aWxsIGFsbG93cyB1cyB0byBnZXQgcmlkIG9mIHRoZSBmdW5j
dGlvbiBhbHRvZ2V0aGVyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
