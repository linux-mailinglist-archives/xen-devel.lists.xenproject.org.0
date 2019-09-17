Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B38B4F85
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 15:41:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iADgV-0002rv-1D; Tue, 17 Sep 2019 13:38:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CyFt=XM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iADgT-0002rG-9J
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 13:38:21 +0000
X-Inumbo-ID: 69826896-d950-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69826896-d950-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568727500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y9NIp4TYEY65XUMp05dZxATugiZviwVFBBCiHpdBItw=;
 b=ZzHzDYf3ctaXR/fa20cg/kv4mIDcVGNwbLLuLP1jSHQsFB0pL+m1gx8A
 bt4KfrKzcfjS7eoxjsitcuvcNZPCh1K9AfJ6kifjHVqH1zsIIrH6A8vhf
 zGQcPkiCaumsgJ+Cij1GqO3m6dXQ4Bcedl+S3Pmf7OUZtgSIKcD5LzzHj k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 17FnX4X+Ra4vM2hW83yaCWOffg535BXvdpOaIXlyfdzXSlx0xnhuzif9L9ITZl1A1TpHw5dPHH
 wjg9RnQOLp+pSYCf9i5NeGnQcj5IX2h8jDgmeJ5hX8RyuTnQ2p77EhkZ9mKscR2EG4jRQCIITh
 57vMxpiXpcb/+whwR4OPm9+qCQigwzqazP5ntGLms+Q/IGHxGetaiavfoSs3KIWzqJRcPw0VMU
 RKmQolEHh/yuN7OGFc38fvElWp+mt/k8zXxLtgdPY1b/dAB+sPkZBrLZaVVhwZx68bMp9V7zv5
 IwQ=
X-SBRS: 2.7
X-MesageID: 5975166
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,516,1559534400"; 
   d="scan'208";a="5975166"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
Thread-Index: AQHVbR9++bfXxouIhUeVJ1WnPk72p6cvz94g///k4wCAACrUoA==
Date: Tue, 17 Sep 2019 13:38:15 +0000
Message-ID: <a9259168c184420cbec4d49724e11f44@AMSPEX02CL03.citrite.net>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
 <d337fda7232b4b099e16de5615c68558@AMSPEX02CL03.citrite.net>
 <f7092f79-d858-d2c7-a44d-de722358247c@suse.com>
In-Reply-To: <f7092f79-d858-d2c7-a44d-de722358247c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/9] x86/HVM: move NOFLUSH handling out
 of hvm_set_cr3()
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BorisOstrovsky <boris.ostrovsky@oracle.com>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE3IFNlcHRlbWJlciAyMDE5IDE0OjAzDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPjsgQW5kcmV3DQo+IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBN
b25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamlt
YUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47DQo+IEJvcmlz
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT47IFBhdWwgRHVycmFudCA8cGF1
bEB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2
ZWxdIFtQQVRDSCB2MiA0LzldIHg4Ni9IVk06IG1vdmUgTk9GTFVTSCBoYW5kbGluZyBvdXQgb2Yg
aHZtX3NldF9jcjMoKQ0KPiANCj4gT24gMTcuMDkuMjAxOSAxNDo0NSwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnBy
b2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gNCj4gPj4gU2VudDogMTcgU2VwdGVt
YmVyIDIwMTkgMDc6MTUNCj4gPj4NCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRl
LmMNCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCj4gPj4gQEAgLTIwODAs
NiArMjA4MCw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZV9jcigNCj4gPj4gICAgICBIVk1U
UkFDRV9MT05HXzJEKENSX1dSSVRFLCByZWcsIFRSQ19QQVJfTE9ORyh2YWwpKTsNCj4gPj4gICAg
ICBzd2l0Y2ggKCByZWcgKQ0KPiA+PiAgICAgIHsNCj4gPj4gKyAgICAgICAgYm9vbCBub2ZsdXNo
Ow0KPiA+PiArDQo+ID4NCj4gPiBJIHNhaWQgdGhpcyBiZWZvcmUuLi4gSSB0aGluayB0aGUgdGln
aHRlciBjYXNlLXNjb3BlIGlzIGJldHRlci4NCj4gDQo+IEkgcmVjYWxsIHlvdSBzYXlpbmcgc28s
IGJ1dCBJIGRvbid0IHJlY2FsbCB5b3UgYWN0dWFsbHkgbWFraW5nIHRoaXMgYQ0KPiByZXF1aXJl
bWVudCB0byBnZXQgeW91ciBhY2suDQo+IA0KPiA+IENvc21ldGljYWxseSBpdCBtYXkgbG9vayBh
IGxpdHRsZSBvZGQsIGJ1dCBzdXJlbHkgaXQgZ2l2ZXMgdGhlDQo+ID4gY29tcGlsZXIgYSBiZXR0
ZXIgY2hhbmNlIHRvIG9wdGltaXplPw0KPiANCj4gSSBkb24ndCB0aGluayBzbyAtIHRoZXkncmUg
cHJldHR5IGdvb2QgdG8gbGltaXQgdGhlIGxpZmUgcmFuZ2Ugb2YNCj4gdmFyaWFibGVzIChhdCBs
ZWFzdCBpbiBub3Qgb3Zlcmx5IGhhaXJ5IGZ1bmN0aW9ucykgdGhlc2UgZGF5cy4gVGhlDQo+IG1v
cmUgbmFycm93IHNjb3BlcyB3ZSBvZnRlbiBhc2sgZm9yIGFyZSBtb3JlIGZvciB0aGUgcmVhZGVy
IHRvDQo+IGVhc2lseSBrbm93IHdoYXQgdGhlIGludGVuZGVkIHVzYWdlIHJhbmdlIG9mIGEgdmFy
aWFibGUgaXMuDQoNCk9rLiBJJ20gbm90IGdvaW5nIHRvIGluc2lzdCwgYnV0IEkgd291bGQgc3Rp
bGwgcHJlZmVyIGNhc2Utc2NvcGUgaGVyZS4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8
cGF1bEB4ZW4ub3JnPg0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
