Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92A19FC2B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLW0z-0003OK-SD; Mon, 06 Apr 2020 17:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LGem=5W=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jLW0y-0003OF-ST
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:58:28 +0000
X-Inumbo-ID: 377b2f20-7830-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377b2f20-7830-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586195908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b90tbljqrYl/NyUKv3eHvQxLAFAIcLjdWNjpd9IRw8A=;
 b=SPMiAEpub1kfPS3nt26t6vTddhsjQMx8d0CGH1DxMM70DASi1fi3RF5b
 jxBDrVSD1wcaCWJaPK82RGZGMzWOSvCMw0Vbxeck9dhbOlMY1pyzU7hQl
 d1f4oD05Q7GH3t08HNUJ2luvxqLR7Qv0pfSzpXgyEKVHhP0fIHl2fqAVN 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1eXr4NGxF1AI+Kv8PhvDt3xzc3eU8w2je92/qY9rMAQjP/lkBuPwh4hNSRxfDVxvUa4dobVmdL
 uSXcS03i1dIIH/pHJhjgIDKJYeLl+PzNSAJEuUJpEs2YWNjAMzpDCDDSURlyvymq9N/PSLoi//
 JAdUzdvePb3cRUHX8ksvZTVFNJ+OYk2u+alhX7qeGPwpyVXiPghcpEnCi6ISaUeDLqYtew/Eoi
 cSmqq2r4qP5JiTSUWQJiFlBwY+TWp8S6qlfpTHcWYJJIMZQgP1oYTEeGUH5/0b1OwyVon8/bVA
 Ess=
X-SBRS: 2.7
X-MesageID: 15237662
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,352,1580792400"; d="scan'208";a="15237662"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWCRLu2U2EJ1WUk0i1KTanKYKpWqhmDBwAgAGf9wCAAAzcgIAEjVGA
Date: Mon, 6 Apr 2020 17:58:23 +0000
Message-ID: <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
In-Reply-To: <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <E71A56E852E3604E84BE9F44A5AA6055@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDMsIDIwMjAsIGF0IDk6MjcgUE0sIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsLm9zc0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAzIEFwciAyMDIwIGF0IDIw
OjQxLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0K
Pj4gDQo+PiBPbiBUaHUsIDIgQXByIDIwMjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBBcyB3
ZSBkaXNjdXNzZWQgb24gVHVlc2RheSwgdGhlIGNvc3QgZm9yIG90aGVyIHZDUFVzIGlzIG9ubHkg
Z29pbmcgdG8gYmUgYQ0KPj4+IHRyYXAgdG8gdGhlIGh5cGVydmlzb3IgYW5kIHRoZW4gYmFjayBh
Z2Fpbi4gVGhlIGNvc3QgaXMgbGlrZWx5IHNtYWxsZXIgdGhhbg0KPj4+IHJlY2VpdmluZyBhbmQg
Zm9yd2FyZGluZyBhbiBpbnRlcnJ1cHQuDQo+Pj4gDQo+Pj4gWW91IGFjdHVhbGx5IGFncmVlZCBv
biB0aGlzIGFuYWx5c2lzLiBTbyBjYW4geW91IGVubGlnaHRlbiBtZSBhcyB0byB3aHkNCj4+PiBy
ZWNlaXZpbmcgYW4gaW50ZXJydXB0IGlzIGEgbm90IHByb2JsZW0gZm9yIGxhdGVuY3kgYnV0IHRo
aXMgaXM/DQo+PiANCj4+IE15IGFuc3dlciB3YXMgdGhhdCB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0
IGFuIG9wZXJhdGluZyBzeXN0ZW0gY2FuDQo+PiBkaXNhYmxlIGludGVycnVwdHMsIGJ1dCBpdCBj
YW5ub3QgZGlzYWJsZSByZWNlaXZpbmcgdGhpcyBzcGVjaWFsIElQSS4NCj4gDQo+IEFuIE9TIGNh
biAqb25seSogZGlzYWJsZSBpdHMgb3duIGludGVycnVwdHMsIHlldCBpbnRlcnJ1cHRzIHdpbGwg
c3RpbGwNCj4gYmUgcmVjZWl2ZWQgYnkgWGVuIGV2ZW4gaWYgdGhlIGludGVycnVwdHMgYXJlIG1h
c2tlZCBhdCB0aGUgcHJvY2Vzc29yDQo+IChlLmcgbG9jYWxfaXJxX2Rpc2FibGUoKSkuDQo+IA0K
PiBZb3Ugd291bGQgbmVlZCB0byBkaXNhYmxlIGludGVycnVwdHMgb25lIGJ5IG9uZSBhcyB0aGUg
R0lDIGxldmVsICh1c2UNCj4gSUNFTkFCTEVSKSBpbiBvcmRlciB0byBub3QgcmVjZWl2ZSBhbnkg
aW50ZXJydXB0cy4gWWV0LCBYZW4gbWF5IHN0aWxsDQo+IHJlY2VpdmUgaW50ZXJydXB0cyBmb3Ig
b3BlcmF0aW9uYWwgcHVycG9zZXMgKGUuZyBzZXJpYWwsIGNvbnNvbGUsDQo+IG1haW50YWluYW5j
ZSBJUlEuLi4pLiBTbyB0cmFwIHdpbGwgaGFwcGVuLg0KDQpJIHRoaW5rIFN0ZWZhbm/igJlzIGFz
c2VydGlvbiBpcyB0aGF0IHRoZSB1c2VycyBoZSBoYXMgaW4gbWluZCB3aWxsIGJlIGNvbmZpZ3Vy
aW5nIHRoZSBzeXN0ZW0gc3VjaCB0aGF0IFJUIHdvcmtsb2FkcyBnZXQgYSBtaW5pbXVtIG51bWJl
ciBvZiBoeXBlcnZpc29yLXJlbGF0ZWQgaW50ZXJydXB0cyBwb3NzaWJsZS4gIE9uIGEgNC1jb3Jl
IHN5c3RlbSwgeW91IGNvdWxkICBoYXZlIG5vbi1SVCB3b3JrbG9hZHMgcnVubmluZyBvbiBjb3Jl
cyAwLTEsIGFuZCBSVCB3b3JrbG9hZHMgcnVubmluZyB3aXRoIHRoZSBOVUxMIHNjaGVkdWxlciBv
biBjb3JlcyAyLTMuICBJbiBzdWNoIGEgc3lzdGVtLCB5b3XigJlkIG9idmlvdXNseSBhcnJhbmdl
IHRoYXQgc2VyaWFsIGFuZCBtYWludGVuYW5jZSBJUlFzIGFyZSBkZWxpdmVyZWQgdG8gY29yZXMg
MC0xLg0KDQpKdWxpZW4sIEkgdGhpbmsgeW91ciBhcmd1bWVudCBhYm92ZSBhYm91dCBpbnRlcnJ1
cHRzIHNvbWV3aGF0IHVuZGVybWluZXMgeW91ciBwb2ludCBhYm91dCBkZWFkbG9jay4gIFlvdXIg
YmFzaWMgYXJndW1lbnQgaXMsIHRoYXQgYSBndWVzdCB3aWxsIGJlIGludGVycnVwdGVkIGJ5IFhl
biBxdWl0ZSBmcmVxdWVudGx5IGFueXdheSBmb3IgbG90cyBvZiByZWFzb25zOyBhZGRpbmcgb25l
IG1vcmUgdG8gdGhlIGxpc3Qgc2hvdWxkbuKAmXQgbWVhc3VyYWJseSBpbmNyZWFzZSB0aGUgaml0
dGVyLiAgQnV0IGlmIGl04oCZcyB0cnVlIHRoYXQgYSBndWVzdCB3aWxsIGJlIGludGVycnVwdGVk
IGJ5IFhlbiBmcmVxdWVudGx5LCB0aGVuIGRlYWRsb2NrIHNob3VsZG7igJl0IGJlIG11Y2ggb2Yg
YW4gaXNzdWU7IGFuZCBpbnNvZmFyIGFzIGRlYWRsb2NrIGlzIGFuIGlzc3VlLCBpdOKAmXMgYmVj
YXVzZSB0aGVyZSB3ZXJlIG5vIGludGVycnVwdHMg4oCUIGFuZCB0aHVzLCBhZGRpbmcgYW4gZXh0
cmEgSVBJIHdpbGwgaGF2ZSBhIHN0YXRpc3RpY2FsbHkgc2lnbmlmaWNhbnQgZWZmZWN0IG9uIGpp
dHRlci4NCg0KT24gdGhlIG90aGVyIGhhZCwgU3RlZmFub+KAmXMgYXJndW1lbnQgYWJvdXQgZGVh
ZGxvY2sgKGlmIEkgdW5kZXJzdGFuZCBoaW0gY29ycmVjdGx5KSBoYXMgYmVlbiB0aGF0IGd1ZXN0
cyBzaG91bGRu4oCZdCByZWFsbHkgYmUgc3Bpbm5pbmcgb24gdGhhdCByZWdpc3RlciBhbnl3YXku
ICBCdXQgaXQgc291bmRzIGZyb20gSnVsaWVu4oCZcyBvdGhlciBlbWFpbCB0aGF0IHBlcmhhcHMg
c3Bpbm5pbmcgb24gdGhlIHJlZ2lzdGVyIGlzIGV4YWN0bHkgd2hhdCBuZXdlciB2ZXJzaW9ucyBv
ZiBMaW51eCBkbyDigJQgc28gTGludXggd291bGQgY2VydGFpbmx5IGhhbmcgb24gc3VjaCBzeXN0
ZW1zIGlmIFN0ZWZhbm/igJlzIGFzc2VydGlvbiBhYm91dCB0aGUgbG93IG51bWJlciBvZiBYZW4t
cmVsYXRlZCBpbnRlcnJ1cHRzIGlzIHRydWUuDQoNCklmIHRoZSBsYXR0ZXIgaXMgdHJ1ZSwgdGhl
biBpdCBzb3VuZHMgbGlrZSBhZGRyZXNzaW5nIHRoZSBkZWFkbG9jayBpc3N1ZSB3aWxsIGJlIG5l
Y2Vzc2FyeT8gIEFuZCBzbyBlZmZvcnQgbmVlZHMgdG8gYmUgcHV0IHRvd2FyZHMgZmlndXJpbmcg
b3V0IGhvdyB0byBtaW5pbWl6ZSBqaXR0ZXIgZHVlIHRvIFhlbi1yZWxhdGVkIElQSXMuDQoNCldl
aSBYdSAvIFBlbmcgRmFuLCBhbnkgb3BpbmlvbnMgaGVyZT8NCg0KIC0gR2VvcmdlDQoNCg==

