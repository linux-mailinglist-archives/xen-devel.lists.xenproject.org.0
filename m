Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC573096
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHnT-0005Fl-6T; Wed, 24 Jul 2019 13:59:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rY0H=VV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqHnR-0005Fe-Hk
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 13:59:09 +0000
X-Inumbo-ID: 342c1b6e-ae1b-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 342c1b6e-ae1b-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 13:59:07 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cMPDqzLOkOY/7UkgRtWHMcmYmBfoQyadJBIhPWbN3+isz/Wp0YH7OZ9IGJIx3WulSKEpMTs+pw
 ZTDeRRomEm+Mdi/l9K8iB/cbD5AiP1mbzbBM0yQhj7pLgBQLiEhpG55QRxu9PY6WSX5mqxSsoM
 GBYdW4QmmSAhmP6g087D/0sdxPnPGWuFaB1ueeA/HRihPeUP5QegDMTXxeTLiN7hOU3tNPb7zV
 EgrPz13jL1pHDIm/mulYZSlN881bwOxoAEpfi1/bZLr7kN1QWFHuvMpcGEPlLkL24Mj/JFT+mV
 Ep0=
X-SBRS: 2.7
X-MesageID: 3458464
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3458464"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v3 1/4] iommu / x86: move call to scan_pci_devices() out
 of vendor code
Thread-Index: AQHVO7+fAlLo5iQDjUSLLYJrbYdMe6bZsbeAgAAl1oA=
Date: Wed, 24 Jul 2019 13:59:03 +0000
Message-ID: <cc142457eb414cc58b25d6039c605083@AMSPEX02CL03.citrite.net>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-2-paul.durrant@citrix.com>
 <b1e457b1-7e42-4c5f-d5ad-998d360c90c5@suse.com>
In-Reply-To: <b1e457b1-7e42-4c5f-d5ad-998d360c90c5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/4] iommu / x86: move call to
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI0IEp1bHkgMjAxOSAxNDo0MQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+OyBTdXJhdmVlIFN1
dGhpa3VscGFuaXQNCj4gPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEtldmluIFRpYW4NCj4gPGtldmluLnRp
YW5AaW50ZWwuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAxLzRdIGlvbW11IC8geDg2OiBtb3ZlIGNhbGwgdG8gc2Nhbl9wY2lfZGV2aWNlcygpIG91
dCBvZiB2ZW5kb3IgY29kZQ0KPiANCj4gT24gMTYuMDcuMjAxOSAxMjoxNiwgUGF1bCBEdXJyYW50
IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+
ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMNCj4gPiBAQCAtMjgs
OSArMjgsMTUgQEAgc3RydWN0IGlvbW11X29wcyBfX3JlYWRfbW9zdGx5IGlvbW11X29wczsNCj4g
Pg0KPiA+ICAgaW50IF9faW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQ0KPiA+ICAgew0K
PiA+ICsgICAgaW50IHJjOw0KPiA+ICsNCj4gPiAgICAgICBpZiAoICFpb21tdV9pbml0X29wcyAp
DQo+ID4gICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+DQo+ID4gKyAgICByYyA9IHNjYW5f
cGNpX2RldmljZXMoKTsNCj4gPiArICAgIGlmICggcmMgKQ0KPiA+ICsgICAgICAgIHJldHVybiBy
YzsNCj4gDQo+ICBGcm9tIGFuIGFic3RyYWN0IFBPViBJJ20gbm90IGNvbnZpbmNlZCBmYWlsaW5n
IElPTU1VIGluaXQgYmVjYXVzZQ0KPiBhIGZhaWxlZCBidXMgc2NhbiBpcyBhcHByb3ByaWF0ZS4g
QnV0IHRoZSBvbmx5IGN1cnJlbnRseSBwb3NzaWJsZQ0KPiBmYWlsdXJlIGlzIC1FTk9NRU0sIGlu
IHdoaWNoIGNhc2Ugd2UnZCBiZSBpbiBiaWdnZXIgdHJvdWJsZSBhbnl3YXkuDQo+IFRoZXJlZm9y
ZQ0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gVGhl
IG90aGVyIHF1ZXN0aW9uIG9mIGNvdXJzZSBpcyBpbiBob3cgZmFyIHlvdSBjYW4gc2Vuc2libHkg
dXNlDQo+IHRoZSByZXN1bHRzIG9mIHRoaXMgKGluY29tcGxldGUpIGJ1cyBzY2FuIGxhdGVyIGR1
cmluZyBJT01NVSBpbml0Lg0KPiBCdXQgaG9wZWZ1bGx5IHRoYXQnbGwgYmVjb21lIGNsZWFyIGZy
b20gdGhlIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCg0KVGhlIG9ubHkgdXNlLCBhdCB0aGUgbW9tZW50
LCBpcyBmb3IgZ3JvdXAgYXNzaWdubWVudC4uLiBidXQgSSBkbyBuZWVkIHRvIGNoZWNrIHRoYXQg
SSBoYXZlbid0IG1pc3NlZCBkb2luZyBncm91cCBhc3NpZ25tZW50IGZvciBzdWJzZXF1ZW50bHkg
YWRkZWQgZGV2aWNlcy4gSSBoYXZlIGEgZmVlbGluZyBJIGRpZCBtaXNzIGl0Lg0KDQogIFBhdWwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
