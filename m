Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46128CFE1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 11:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxpl0-0001xz-7y; Wed, 14 Aug 2019 09:39:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxpky-0001xt-1S
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 09:39:48 +0000
X-Inumbo-ID: 73decefe-be77-11e9-9643-e3d68d3f91f6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73decefe-be77-11e9-9643-e3d68d3f91f6;
 Wed, 14 Aug 2019 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565775587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QrhYUa90xRFNZmbM/weSfQU7ivEkCwy42jdV/HiNJa0=;
 b=PnwMdihbEwbhVGKq5lDS8S5dgvnFT7J9JzERmLbm2GbHLI1TrypY6swi
 zMCjUJUVkWo18wDSd8lTCSoH3/47un92yFEmUw3MmGdgY5v4LNJ11IFHN
 tOMKkGaKsSiktx6JuukG7PowQRBk+3lCgCJrwSiIceH+8HY290C5t7IEA o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 24bsryHZW43M9Pavwyl55Dsqc23qJj49O8R1C/+MGdPKRX5dOZurRwLMD4rhX39e5hv60Z+aFx
 92uwZ9YxhSvrRwcZTUXymVjVz3bRmDwpKhMoPeYpu/0lXMjO2ieUfcGx7sUGo3bjvQ7b8hweOl
 0IFLhzvxagTnat5LghtogkwAwnWFcVEn75yIdJGGrqfxOTvtbIdpf2Ac9r0iOfD7nAJ6ndZ5qS
 yEPP7iTa9vJH/DZ+RSfO+umsLzvodo1D/KoAEYIkOqcep6bRSoxA6o9pLOc9pcaZPK/a2ABkf9
 fBE=
X-SBRS: 2.7
X-MesageID: 4426667
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4426667"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVCAABIMcIACsp0g
Date: Wed, 14 Aug 2019 09:39:42 +0000
Message-ID: <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
In-Reply-To: <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, 'Julien
 Grall' <julien.grall@arm.com>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDEyIEF1Z3VzdCAyMDE5IDE3OjI2DQo+IFRvOiAnSmFuIEJldWxpY2gnIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gQ2M6ICdQZXRyZSBQaXJjYWxhYnUnIDxwcGlyY2FsYWJ1QGJpdGRl
ZmVuZGVyLmNvbT47ICdTdGVmYW5vIFN0YWJlbGxpbmknIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsNCj4gJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgJ1JhenZhbiBDb2pvY2FydScgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+OyAnS29ucmFkIFJ6ZXN6dXRlayBXaWxrJw0KPiA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47DQo+IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5E
dW5sYXBAY2l0cml4LmNvbT47ICdKdWxpZW4gR3JhbGwnIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47
ICdUYW1hcyBLIExlbmd5ZWwnDQo+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyAnQWxleGFuZHJ1IElzYWlsYScNCj4gPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPjsgJ3hlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZycgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47DQo+ICdWb2xvZHlteXJCYWJjaHVrJyA8Vm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDMvNl0gcmVtb3ZlIGxhdGUg
KG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFtzbmlwXQ0KPiA+ID4NCj4gPiA+IE9uIDMwLjA3
LjIwMTkgMTU6NDQsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiA+ID4gTk9URTogVGhpcyBwYXRj
aCB3aWxsIGNhdXNlIGEgc21hbGwgYW1vdW50IG9mIGV4dHJhIHJlc291cmNlIHRvIGJlIHVzZWQN
Cj4gPiA+ID4gICAgICAgIHRvIGFjY29tbW9kYXRlIElPTU1VIHBhZ2UgdGFibGVzIHRoYXQgbWF5
IG5ldmVyIGJlIHVzZWQsIHNpbmNlIHRoZQ0KPiA+ID4gPiAgICAgICAgcGVyLWRvbWFpbiBJT01N
VSBmbGFnIGVuYWJsZSBmbGFnIGlzIGN1cnJlbnRseSBzZXQgdG8gdGhlIHZhbHVlDQo+ID4gPiA+
ICAgICAgICBvZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZSBmbGFnLiBBIHN1YnNlcXVlbnQgcGF0
Y2ggd2lsbCBhZGQgYW4NCj4gPiA+ID4gICAgICAgIG9wdGlvbiB0byB0aGUgdG9vbHN0YWNrIHRv
IGFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYgaWYgdGhlcmUgaXMNCj4gPiA+ID4gICAgICAgIG5v
IGludGVudGlvbiB0byBhc3NpZ24gcGFzc3Rocm91Z2ggaGFyZHdhcmUgdG8gdGhlIGRvbWFpbi4N
Cj4gPiA+DQo+ID4gPiBJbiBwYXJ0aWN1bGFyIGlmIHRoZSBkZWZhdWx0IG9mIHRoaXMgaXMgZ29p
bmcgdG8gYmUgInRydWUiIChJDQo+ID4gPiBkaWRuJ3QgbG9vayBhdCB0aGF0IHBhdGNoIHlldCwg
YnV0IHRoZSB3b3JkaW5nIGFib3ZlIG1ha2VzIG1lDQo+ID4gPiBhc3N1bWUgc28pLCBpbiBhdXRv
LWJhbGxvb25pbmcgbW9kZSB3aXRob3V0IHNoYXJlZCBwYWdlIHRhYmxlcw0KPiA+ID4gbW9yZSBt
ZW1vcnkgc2hvdWxkIGltbyBiZSBiYWxsb29uZWQgb3V0IG9mIERvbTAgbm93LiBJdCBoYXMNCj4g
PiA+IGFsd2F5cyBiZWVuIGEgYnVnIHRoYXQgSU9NTVUgcGFnZSB0YWJsZXMgd2VyZW4ndCBhY2Nv
dW50ZWQgZm9yLA0KPiA+ID4gYnV0IGl0IHdvdWxkIGJlY29tZSBldmVuIG1vcmUgcHJvbWluZW50
IHRoZW4uDQo+ID4NCj4gPiBVbHRpbWF0ZWx5LCBvbmNlIHRoZSB3aG9sZSBzZXJpZXMgaXMgYXBw
bGllZCwgdGhlbiBub3RoaW5nIG11Y2ggc2hvdWxkIGNoYW5nZSBmb3IgdGhvc2Ugc3BlY2lmeWlu
Zw0KPiA+IHBhc3N0aHJvdWdoIGgvdyBpbiBhbiB4bC5jZmcuIFRoZSBtYWluIGRpZmZlcmVuY2Ug
d2lsbCBiZSB0aGF0IGgvdyBjYW5ub3QgYmUgcGFzc2VkIHRocm91Z2ggdG8gYQ0KPiA+IGRvbWFp
biB0aGF0IHdhcyBub3Qgb3JpZ2luYWxseSBjcmVhdGVkIHdpdGggSU9NTVUgcGFnZXRhYmxlcy4N
Cj4gPiBXaXRoIHBhdGNoZXMgYXBwbGllZCB1cCB0byB0aGlzIHBvaW50IHRoZW4sIHllcywgZXZl
cnkgZG9tYWluIHdpbGwgZ2V0IElPTU1VIHBhZ2UgdGFibGVzLiBJIGd1ZXNzDQo+IEknbGwNCj4g
PiB0YWtlIGEgbG9vayBhdCB0aGUgYXV0by1iYWxsb29uaW5nIGNvZGUgYW5kIHNlZSB3aGF0IG5l
ZWRzIHRvIGJlIGRvbmUuDQo+ID4NCj4gDQo+IE9rLCBJJ3ZlIGhhZCBhIGxvb2suLi4NCj4gDQo+
IEkgY291bGQgbWFrZSBhIHJvdWdoIGNhbGN1bGF0aW9uIGluIGxpYnhsX2RvbWFpbl9uZWVkX21l
bW9yeSgpIGJhc2VkIG9uIHRoZSBkb21haW4ncyBtYXhfbWVta2IgYW5kIGFuDQo+IGFzc3VtcHRp
b24gb2YgYSA0IGxldmVsIHRyYW5zbGF0aW9uIHdpdGggNTEyIFBURXMgcGVyIGxldmVsLCBvciB3
b3VsZCBwcmVmZXIgc3VjaCBndWVzdGltYXRpb24gdG8gYmUNCj4gb3ZlcnJpZGFibGUgdXNpbmcg
YW4geGwuY2ZnIHBhcmFtZXRlciBpbiBhIGJyb2FkbHkgc2ltaWxhciB3YXkgdG8gc2hhZG93X21l
bWtiPw0KPiANCg0KSSB0aGluayBJJ20gZ29pbmcgdG8gc2F5IG5vIHRvIHRoaXMgYW55d2F5IHNp
bmNlLCBhcyB5b3Ugc2F5LCB0aGUgb3ZlcmhlYWQgYXMgbmV2ZXIgYmVlbiBhY2NvdW50ZWQgZm9y
IGFuZCBoYXZpbmcgdG8gbWFrZSBhc3N1bXB0aW9ucyBhYm91dCB0aGUgSU9NTVUgdGFibGUgc3Ry
dWN0dXJlIGlzIG5vdCB2ZXJ5IGF0dHJhY3RpdmUuIEdpdmVuIHRoYXQgYW55IGlzc3VlIGlzIGdv
aW5nIHRvIGJlIHRyYW5zaWVudCAoaS5lLiB1bnRpbCBwYXRjaCAjNiBpcyBjb21taXR0ZWQpIEkg
ZG9uJ3QgdGhpbmsgZml4aW5nIGF1dG8tYmFsbG9vbmluZyBvdWdodCB0byBiZSBpbiBzY29wZSBm
b3IgdGhpcyBzZXJpZXMuDQoNCiAgUGF1bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
