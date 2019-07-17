Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277686C11A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 20:45:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnosZ-0005Kn-Ir; Wed, 17 Jul 2019 18:42:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K2dS=VO=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hnosX-0005KZ-Av
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 18:42:13 +0000
X-Inumbo-ID: 96f3ad42-a8c2-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96f3ad42-a8c2-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 18:42:12 +0000 (UTC)
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
IronPort-SDR: KYsj0CCp+aEliXKYGaSEcVfEzro7tsb1Oog+OwBMCf3xBUWdIRhKgpGSS3T2LiiPobj5Uiu/wT
 vZzQry85YVSTaFGIYQ43CO4geZSLIyxcHLF2MVfEq8fhXCMXtbtZM7KXvkP4guZZ0mu4x/n6mw
 rnRDhcJ1Fho3khdeBojNdenADUVfzXaRXHhp3xH9fJzy6r4rsWGTa5kJ2k3P0UfvtvSm7qcjmE
 n+l6xvmsdjPmmSoTR0utCZlIb0qP7c8uzFCsok/SjqG/QOfgHIPHNkEFm1xZR/YkZ0asnctn8n
 els=
X-SBRS: 2.7
X-MesageID: 3192738
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,275,1559534400"; 
   d="scan'208";a="3192738"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, Petre Ovidiu PIRCALABU
 <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVPIeuvysw+S0SxESjjWmMYVkcbqbOwNgAgAAfJACAAETYAA==
Date: Wed, 17 Jul 2019 18:42:08 +0000
Message-ID: <449279104b9d4ac7a7d1b20566097ae7@AMSPEX02CL03.citrite.net>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
In-Reply-To: <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4+PiArICAgIH0NCj4gPj4+
ICsNCj4gPj4+ICsgICAgaWYgKCAhdm1fZXZlbnRfY2hlY2sodmVkKSApDQo+ID4+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgaWYgKCBmcmFtZSAhPSAwIHx8
IG5yX2ZyYW1lcyAhPSB0b19jaGFubmVscyh2ZWQpLT5ucl9mcmFtZXMgKQ0KPiA+Pj4gKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4+DQo+ID4+IElzIHRoZXJlIGEgcGFydGljdWxhciByZWFz
b24gZm9yIHRoaXMgYWxsLW9yLW5vdGhpbmcgbW9kZWw/DQo+ID4NCj4gPiBJJ3ZlIGFkZGVkIHRo
aXMgZXh0cmEgY2hlY2sgZHVlIHRvIHRoZSB3YXkgYWNxdWlyZV9yZXNvdXJjZSBpbnRlcmZhY2UN
Cj4gPiBpcyBkZXNpZ25lZC4gSW4gb3VyIGNhc2UsIHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkIGZy
b20NCj4gPiBYRU5fVk1fRVZFTlRfRU5BQkxFIGFuZCB0aGUgc2l6ZSBpcyBrbm93biBiZWZvcmVo
YW5kOiB0aGUgbnVtYmVyIG9mDQo+ID4gcGFnZXMgbmVlZGVkIHRvIHN0b3JlICh2Y3B1c19jb3Vu
dCAqIHNpemVvZiB2bV9ldmVudF9zbG90KSBieXRlcy4NCj4gPiBIb3dldmVyIHRoZSBhY3F1aXJl
X3Jlc291cmNlIG5lZWRzIGEgIm5yX2ZyYW1lcyIgcGFyYW1ldGVyIHdoaWNoIGlzDQo+ID4gY29t
cHV0ZWQgaW4gYSBzaW1pbGFyIG1hbm5lciBpbiB0aGUgbGlieGMgd3JhcHBlci4NCj4gDQo+IEht
bSwgbWF5YmUgSSdtIG5vdCB1cCB0byBkYXRlIGhlcmU6IFBhdWwsIGlzIHRoZSBnZW5lcmFsIHJl
c291cmNlDQo+IG9idGFpbmluZy9tYXBwaW5nIGxvZ2ljIGluZGVlZCBtZWFudCB0byBiZSBhbiBh
bGwtb3Itbm90aGluZyB0aGluZw0KPiBvbmx5Pw0KPiANCg0KTm90IHJlYWxseSwgbm8uIFRoZSBp
bnRlbnRpb24gaXMgdGhhdCBhbnkgc3Vic2VjdGlvbiBvZiB0aGUgcmVzb3VyY2Ugc3BhY2UgbWF5
IGJlIG1hcHBlZCwgc28gYXMgZnJhbWUgKyBucl9mcmFtZXMgZG9lc24ndCBleGNlZWQgdGhlIHNp
emUgb2YgdGhlIHNwYWNlIHRoZW4gdGhlcmUgc2hvdWxkIGJlIG5vIHJlYXNvbiB0byByZXR1cm4g
YW4gZXJyb3IuDQoNCiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
