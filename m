Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032F8CFF0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 11:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxpo5-0002ji-4W; Wed, 14 Aug 2019 09:43:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxpo3-0002jb-T2
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 09:42:59 +0000
X-Inumbo-ID: e48cd70e-be77-11e9-93d4-335ad1b04a25
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e48cd70e-be77-11e9-93d4-335ad1b04a25;
 Wed, 14 Aug 2019 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565775775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=veMz34voqOY97jdqzICJNrJPeU6LiVyHsOy9sJvGOqM=;
 b=Rca5DrHZNcGz1BBiqsjCaz0Ab8AeznnnWxyWhxNSipvfMd7CYmxmRe8B
 3nX8+fRYWfucx7c5bXKKKyO4ICNUk1ktsHBE6XBCpssg3CKegGbKwp+rl
 Ms+ye+5coh80wWOItNnnWjg+IS/WnEBKsclCK6j4VnNo+lKF1AEoKrZ7V w=;
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
IronPort-SDR: JCPYrR322L3MpUY1/d2Cc2Qn2KjUmlTnBeBoYvpjKzpoxI39SvIRqzvFp1tYy5yKImYq5SVfak
 VboXE2EkU5O/iPaX8EmovpGn2+3IJF8ec8kVWoDW0szC7T76WB34Qg/EL+xigk7rPzk7DmCU7X
 +70OJhbQipIqylkHFlZnOYW5q1wNk+8+ZrAeiLCbqPN6K2RP3lgg2GPYL4+qH57NbT2SFPj8jr
 8XecHldmO6753O5VNnHgVs7yqhvT69hmNpbFDnnxVxdMaVMtoa2K31l4p7UW0YT2XXwRhZRZsa
 NqU=
X-SBRS: 2.7
X-MesageID: 4454216
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4454216"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH 4/6] make passthrough/pci.c:deassign_device() static
Thread-Index: AQHVRuOcIxDU2ySq8EKMuwIzCGE8CqbuLxAAgAxMTAA=
Date: Wed, 14 Aug 2019 09:42:52 +0000
Message-ID: <ef243a188b884f588a24c5f865caf971@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-5-paul.durrant@citrix.com>
 <b604bbcc-4476-9a3d-26fc-84303661c235@suse.com>
In-Reply-To: <b604bbcc-4476-9a3d-26fc-84303661c235@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/6] make
 passthrough/pci.c:deassign_device() static
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IEF1Z3VzdCAyMDE5IDE2OjU0DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC82XSBtYWtlIHBhc3N0aHJvdWdo
L3BjaS5jOmRlYXNzaWduX2RldmljZSgpIHN0YXRpYw0KPiANCj4gT24gMzAuMDcuMjAxOSAxNTo0
NCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoaXMgZnVuY3Rpb24gaXMgb25seSBldmVyIGNh
bGxlZCBmcm9tIHdpdGhpbiB0aGUgc2FtZSBzb3VyY2UgbW9kdWxlIGFuZA0KPiA+IHJlYWxseSBo
YXMgbm8gYnVzaW5lc3MgYmVpbmcgZGVjbGFyZWQgeGVuL2lvbW11LmguIFRoaXMgcGF0Y2ggcmVs
b2NhdGVzDQo+ID4gdGhlIGZ1bmN0aW9uIGFoZWFkIG9mIHRoZSBmaXJzdCBjYWxsZWQgYW5kIG1h
a2VzIGl0IHN0YXRpYy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiANCg0KVGhhbmtzDQoNCj4gQnV0IG9mIGNvdXJzZSBpdCB3b3VsZCBo
YXZlIGJlZW4gbmljZSBpZiBzb21lIG1pbmltYWwgYW5kIG9idmlvdXMNCj4gc3R5bGUgY29ycmVj
dGlvbnMgd2VyZSBkb25lIGF0IHRoZSBzYW1lIHRpbWU6DQoNCk9rLCBJJ2xsIGZvbGQgdGhlc2Ug
aW50byB2Mi4NCg0KICBQYXVsDQoNCj4gDQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPiA+IEBA
IC04ODksNiArODg5LDUyIEBAIHN0YXRpYyBpbnQgcGNpX2NsZWFuX2RwY2lfaXJxcyhzdHJ1Y3Qg
ZG9tYWluICpkKQ0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+DQo+ID4gKy8qIGNh
bGxlciBzaG91bGQgaG9sZCB0aGUgcGNpZGV2c19sb2NrICovDQo+ID4gK3N0YXRpYyBpbnQgZGVh
c3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4p
DQo+IA0KPiB1aW50PE4+X3QNCj4gDQo+ID4gK3sNCj4gPiArICAgIGNvbnN0IHN0cnVjdCBkb21h
aW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOw0KPiA+ICsgICAgc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSBOVUxMOw0KPiANCj4gc3RyYXkgaW5pdGlhbGl6ZXINCj4gDQo+ID4gKyAgICBpbnQgcmV0
ID0gMDsNCj4gPiArDQo+ID4gKyAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkNCj4gPiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICBBU1NFUlQocGNpZGV2c19s
b2NrZWQoKSk7DQo+ID4gKyAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzZWcs
IGJ1cywgZGV2Zm4pOw0KPiA+ICsgICAgaWYgKCAhcGRldiApDQo+ID4gKyAgICAgICAgcmV0dXJu
IC1FTk9ERVY7DQo+ID4gKw0KPiA+ICsgICAgd2hpbGUgKCBwZGV2LT5waGFudG9tX3N0cmlkZSAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZGV2Zm4gKz0gcGRldi0+cGhhbnRvbV9zdHJpZGU7
DQo+ID4gKyAgICAgICAgaWYgKCBQQ0lfU0xPVChkZXZmbikgIT0gUENJX1NMT1QocGRldi0+ZGV2
Zm4pICkNCj4gPiArICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgcmV0ID0gaGQtPnBs
YXRmb3JtX29wcy0+cmVhc3NpZ25fZGV2aWNlKGQsIGhhcmR3YXJlX2RvbWFpbiwgZGV2Zm4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV90
b19kZXYocGRldikpOw0KPiA+ICsgICAgICAgIGlmICggIXJldCApDQo+ID4gKyAgICAgICAgICAg
IGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJkJWQ6
IGRlYXNzaWduICUwNHg6JTAyeDolMDJ4LiV1IGZhaWxlZCAoJWQpXG4iLA0KPiA+ICsgICAgICAg
ICAgICAgICBkLT5kb21haW5faWQsIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5D
KGRldmZuKSwgcmV0KTsNCj4gDQo+IChsZXNzICJtaW5pbWFsIikgdXNlICVwZCAoYWxzbyBvbmNl
IG1vcmUgYmVsb3cpDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
