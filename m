Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9119D59E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 13:15:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKKIA-0004jG-DC; Fri, 03 Apr 2020 11:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV/t=5T=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jKKI9-0004jB-2k
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 11:15:17 +0000
X-Inumbo-ID: 647da05c-759c-11ea-bcf5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 647da05c-759c-11ea-bcf5-12813bfff9fa;
 Fri, 03 Apr 2020 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585912515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=shO6JaSi3oqiACck0/yfCwp+Cr7KmlMQMkq2hVSwc3E=;
 b=PflDSDI8flifUGx/34UgGl0HVxBS+T+url/pgLZCwpe0z8FlXbWA5zsj
 DKQby9X+2OO6Tpw8n0ABTmNPEk93tTu4AGH8a25QGiW/ggWD3vaVB7K1h
 pwoFaDImDNMR/59uG7mHBvTbFSikyOJbDPnIfsnh1bY9ndeujgPxaek1H A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y7B0TeHBRHwR4X5szP+x6PETEPnFd1vHE8bwbI7zo2KvOz3kO7CaPa26NT+ie+Ean3n2HEdvuv
 OslpPM0VNZ9yps32vbLc6AFfU81Iy4418HtrugzLnusgELvWUX3hkxD3/qUS9BPismwETJG2ez
 P74WgXWosoRYcI/bCgB4coRflxKCjuP88riD6WT4co1ws6rqhr0sX/kmTOHSk+JcMGBUsY5Iwi
 Av36ZYnZ11q0CfBCaBnyRlmsjABKO2NXTJc7cYzUiln1wFOEFKqE/mir5ZTCdrx+L2cmzO2W0P
 vc8=
X-SBRS: 2.7
X-MesageID: 15531447
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,339,1580792400"; d="scan'208";a="15531447"
From: George Dunlap <George.Dunlap@citrix.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWCRLu2U2EJ1WUk0i1KTanKYKpWqhmDBwAgADpHYCAACByAIAABG8AgAAEfwA=
Date: Fri, 3 Apr 2020 11:15:10 +0000
Message-ID: <6831C306-8BD3-4E7A-A45A-7B91E1616DC1@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
 <76A7BB45-6B4A-46F4-8AD7-9141B3BF9BC4@citrix.com>
 <017cfca3b079356abfcd829756af2fdb@kernel.org>
In-Reply-To: <017cfca3b079356abfcd829756af2fdb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <F539FB375EB0ED459AC7EEEB0B0AC27C@citrix.com>
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
 Julien Grall <julien@xen.org>, Wei Xu <xuwei5@hisilicon.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDMsIDIwMjAsIGF0IDExOjU5IEFNLCBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToNCj4gDQo+IEdlb3JnZSwNCj4gDQo+IE9uIDIwMjAtMDQtMDMgMTE6NDMs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4gT24gQXByIDMsIDIwMjAsIGF0IDk6NDcgQU0sIE1h
cmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IE9uIDIwMjAtMDQtMDIgMTk6
NTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gKCtNYXJjKQ0KPj4+IFRoYW5rcyBmb3IgbG9v
cGluZyBtZSBpbi4gRGVmaW5pdGVseSBhbiBpbnRlcmVzdGluZyByZWFkLCBidXQgYWxzbyBhIHZl
cnkNCj4+PiBwdXp6bGluZyBvbmUuDQo+PiBbc25pcF0NCj4+PiBOby4gTG93IGxhdGVuY3kgaXMg
YSB2ZXJ5IGRlc2lyYWJsZSB0aGluZywgYnV0IGl0IGRvZXNuJ3QgbWF0dGVyIGF0IGFsbCB3aGVu
DQo+Pj4geW91IGRvbid0IGV2ZW4gaGF2ZSBmdW5jdGlvbmFsIGNvcnJlY3RuZXNzLiBUbyB1c2Ug
bXkgZmF2b3VyaXRlIGNhciBhbmFsb2d5LA0KPj4+IGhhdmluZyBhIGJpZ2dlciBlbmdpbmUgZG9l
c24ndCBoZWxwIHdoZW4geW91J3JlIGFib3V0IHRvIGhpdCB0aGUgd2FsbCBhbmQNCj4+PiBoYXZl
IG5vIGJyZWFrcy4uLiBZb3UganVzdCBoaXQgdGhlIHdhbGwgZmFzdGVyLg0KPj4gW3NuaXBdDQo+
Pj4gcy9pbXByZWNpc2UvbWFzc2l2ZWx5IGluY29ycmVjdC8NCj4+IFtzbmlwXQ0KPj4+IFRoZXJl
IGlzIGp1c3Qgbm8gd2F5IEknbGwgZXZlciBhY2NlcHQgYSBjaGFuZ2UgdG8gdGhlIEdJQyBpbnRl
cnJ1cHQgc3RhdGUNCj4+PiBtYWNoaW5lIGZvciBMaW51eC4gRmVlbCBmcmVlIHRvIHRyeSBhbmQg
Y29udmluY2Ugb3RoZXIgT1MgbWFpbnRhaW5lcnMuDQo+PiBbc25pcF0NCj4+PiBJZiBJIHdhcyBz
b21lb25lIGRldmVsb3BpbmcgYSBwcm9kdWN0IHVzaW5nIFhlbi9BUk0sIEknZCBiZSB2ZXJ5IHdv
cnJpZWQNCj4+PiBhYm91dCB3aGF0IHlvdSBoYXZlIHdyaXR0ZW4gYWJvdmUuIEJlY2F1c2UgaXQg
cmVhbGx5IHJlYWRzICJ3ZSBkb24ndCBjYXJlDQo+Pj4gYWJvdXQgcmVsaWFiaWxpdHkgYXMgbG9u
ZyBhcyB3ZSBjYW4gc2hvdyBhbWF6aW5nIG51bWJlcnMiLiBJIHJlYWxseSBob3BlDQo+Pj4gaXQg
aXNuJ3Qgd2hhdCB5b3UgbWVhbi4NCj4+IFdoYXQncyBwdXp6bGluZyB0byBtZSwgaXMgdGhhdCB3
aGF0IGV2ZXJ5b25lIGVsc2UgaW4gdGhpcyB0aHJlYWQgaXMNCj4+IHRoYXQgd2hhdCBTdGVmYW5v
IGlzIHRyeWluZyB0byBkbyBpcyB0byBnZXQgWGVuIHRvIGJlIGhhdmUgbGlrZSBLVk0uDQo+IA0K
PiBTb3JyeSwgSSBkb24ndCBnZXQgd2hhdCB5b3UgbWVhbiBoZXJlLiBLVk0gYXQgbGVhc3QgYWlt
cyB0byBiZSBhcmNoaXRlY3R1cmFsbHkNCj4gY29tcGxpYW50LiBJcyBpdCBwZXJmZWN0PyBNb3N0
IHByb2JhYmx5IG5vdCwgYXMgd2UgZml4IGl0IGFsbCB0aGUgdGltZS4NCj4gDQo+IERlYWxpbmcg
d2l0aCB0aGUgYWN0aXZlIHJlZ2lzdGVycyBpcyBoYXJkLiBCdXQgYXMgZmFyIGFzIEkgY2FuIHNl
ZSwNCj4gd2UgZG8gZ2V0IHRoZW0gcmlnaHQuIERvIHdlIHNhY3JpZmljZSBsYXRlbmN5IG92ZXIg
Y29ycmVjdG5lc3M/IFllcy4NCj4gDQo+IEFuZCBpZiB5b3UgaGF2ZSBzcG90dGVkIGEgcHJvYmxl
bSBpbiB0aGUgd2F5IHdlIGhhbmRsZSB0aG9zZSwgcHJheSB0ZWxsLg0KPiANCj4+IEFyZSB0aGV5
IHdyb25nPyAgSWYgc28sIHdlIGNhbiBqdXN0IGRvIHdoYXRldmVyIExpbnV4IGRvZXMuICBJZiBu
b3QsDQo+PiB0aGVuIHlvdSBuZWVkIHRvIGZpcnN0IHR1cm4gYWxsIHlvdXIgaW1wcmVjYXRpb25z
IGFib3V0IGNvcnJlY3RuZXNzLA0KPj4gc21hc2hpbmcgaW50byB3YWxscywgY29uY2VybiBmb3Ig
dGhlIHNhbml0eSBvZiBtYWludGFpbmVycyBhbmQgc28gb24NCj4+IHRvd2FyZHMgeW91ciBvd24g
Y29kZSBmaXJzdC4NCj4gDQo+IEknbSByZWFsbHkgc29ycnksIGJ1dCB5b3Ugc2VlIHRvIGhhdmUg
dGhlIHdyb25nIGVuZCBvZiB0aGUgc3RpY2sgaGVyZS4NCj4gSSdtIG5vdCB0cnlpbmcgdG8gY29t
cGFyZSBYZW4gdG8gS1ZNIGF0IGFsbC4gSSdtIGNvbmNlcm5lZCBhYm91dCBvbmx5DQo+IGltcGxl
bWVudGluZyBvbmx5IGEgc21hbGwgcGFydCBvZiB0aGUgYXJjaGl0ZWN0dXJlLCBpZ25vcmluZyB0
aGUgcmVzdCwNCj4gYW5kIGxldHRpbmcgZ3Vlc3RzIGNyYXNoLCB3aGljaCBpcyB3aGF0IHdhcyBz
dWdnZXN0ZWQgaGVyZS4NCg0KVGhlIGN1cnJlbnQgc2l0dWF0aW9uIChhcyBJIHVuZGVyc3RhbmQg
aXQpIGlzIHRoYXQgWGVuIG5ldmVyIGltcGxlbWVudGVkIHRoaXMgZnVuY3Rpb25hbGl0eSBhdCBh
bGwuDQoNClN0ZWZhbm8gaGFzIGJlZW4gdHJ5aW5nIHRvIGNvbnZpbmNlIEp1bGllbiB0byBpbXBs
ZW1lbnQgdGhpcyByZWdpc3RlciBLVk3igJlzIHdheSwgd2hpY2ggaGFzIGdvb2QgbGF0ZW5jeSBp
biB0aGUgbWVkaWFuIGNhc2UsIGJ1dCBpbiBwYXJ0aWN1bGFyIGNvbmZpZ3VyYXRpb25zLCBoYXMg
YXJiaXRyYXJpbHkgYmFkIHdvcnN0LWNhc2UgbGF0ZW5jeSBmb3IgbXVsdGktdmNwdSBndWVzdHMu
ICBKdWxpZW4gdGhpbmtzIHdoYXQgS1ZNIGlzIGRvaW5nIGlzIHdyb25nIGFuZCBhZ2FpbnN0IHRo
ZSBzcGVjLCBhbmQgaGFzIGJlZW4gcmVmdXNpbmcgdG8gbGV0IHRoZSBwYXRjaGVzIGluLiANCg0K
SGUgaGFzIHByb3Bvc2VkIGFub3RoZXIgc3VnZ2VzdGlvbiB3aGljaCBpcyBjbG9zZXIgdG8gdGhl
IHNwZWMgaW4gdGVybXMgb2YgZnVuY3Rpb25hbGl0eSwgYW5kIGhhcyBib3VuZGVkIHdvcnN0LWNh
c2UgbGF0ZW5jeSwgYnV0IHdoaWNoIGhhcyB3b3JzZSBsYXRlbmN5IGFuZCB1bmNvbnRyb2xsYWJs
ZSBqaXR0ZXIgaW4gdGhlIG1lZGlhbiBjYXNlIChvciBhdCBsZWFzdCwgc28gU3RlZmFubyBiZWxp
ZXZlcykuDQoNCkFzIGEgY29tcHJvbWlzZSwgU3RlZmFubyBzdWdnZXN0ZWQgaW1wbGVtZW50aW5n
IEtWTeKAmXMgd2F5IGZvciBzaW5nbGUtdmNwdSBndWVzdHMuICBUaGlzIGlzIGEgc3RyaWN0IGlt
cHJvdmVtZW50IG92ZXIgdGhlIGN1cnJlbnQgc2l0dWF0aW9uLCBzaW5jZSBhdCBsZWFzdCBhIGxv
dCBvZiBuZXcgZ3Vlc3RzIHN0YXJ0IHdvcmtpbmcsIHdoaWxlIHRoZXkgaGFzaCBvdXQgd2hhdCB0
byBkbyBhYm91dCBtdWx0aS12Y3B1IGd1ZXN0cy4NCg0KTXkgcHJvcG9zYWwgaGFzIGJlZW4gdG8g
d29yayB3aXRoIEtWTSBkbyBkb2N1bWVudCB0aGlzIGRldmlhdGlvbiBmcm9tIHRoZSBzcGVjIGZv
ciBndWVzdHMgcnVubmluZyB2aXJ0dWFsaXplZC4gIA0KDQpTbyBpdOKAmXMgeW91IGhhdmUgaGF2
ZSB0aGUgd3JvbmcgZW5kIG9mIHRoZSBzdGljazsgeW91ciBjb250ZW1wdCBpcyBtaXNwbGFjZWQu
DQoNCklmIHlvdSBkb27igJl0IHRoaW5rIGl04oCZcyBhIGRldmlhdGlvbiwgdGhlbiBwbGVhc2Ug
aGVscCB1cyBjb252aW5jZSBKdWxpZW4sIHNvIHdlIGNhbiB0YWtlIFN0ZWZhbm/igJlzIHBhdGNo
IGFzLWlzLiAgT3IsIGlmIEp1bGllbiBjb252aW5jZXMgeW91IHRoYXQgS1ZNIGlzIGRldmlhdGlu
ZyBmcm9tIHRoZSBzcGVjLCB0aGVuIGxldOKAmXMgdHJ5IHRvIHdvcmsgdG9nZXRoZXIgdG8gc2Vl
IGhvdyB3ZSBjYW4gaW1wbGVtZW50IHRoZSBuZWNlc3NhcnkgZnVuY3Rpb25hbGl0eSBlZmZpY2ll
bnRseSBpbiBhIHZpcnR1YWxpemVkIGVudmlyb25tZW50Lg0KDQogLUdlb3JnZQ==

