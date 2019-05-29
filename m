Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040C2DE39
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:32:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVydH-0003Xo-Lv; Wed, 29 May 2019 13:28:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hVydG-0003Xf-1J
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:28:42 +0000
X-Inumbo-ID: ab8d6204-8215-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab8d6204-8215-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 13:28:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: kb6TPVOP1YJRc/iCccrGw99h3QCAJj21/57pFfhgEYW5K93pZA5c0nnZ24swpVMx+CzBSWcPX9
 5jsDGB4lH3+fBtU9donXHcN50Vzooiezw+C/A3rJQZVeCgHPhTOk93fvhT0mVRGAxo1QWdg/H7
 5WVzWGS8Iplgh6YSs6jBEBBBY55TekOu6fjC8re9g5C+7l1LBDLanR7W6jttbdAcUdjEkHD1bw
 +7apXkTNzh7qzKRhY11Chgj/XVmSYXJLf6bIoJLoaZ+2m14CKZCYaLuObLUS9uZuOX51lcrZxZ
 Z7A=
X-SBRS: 2.7
X-MesageID: 1042799
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1042799"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/hvm/hpet: avoid 'small' time diff test on resume
Thread-Index: AQHVFh/NLn9cTGTOSEiqgEoW+PnZTqaCGAoA
Date: Wed, 29 May 2019 13:27:03 +0000
Message-ID: <4319e6a0879a4f6484c643fa8d8c68b1@AMSPEX02CL03.citrite.net>
References: <20190529130948.5314-1-paul.durrant@citrix.com>
In-Reply-To: <20190529130948.5314-1-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/hvm/hpet: avoid 'small' time diff test
 on resume
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0
bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4gU2VudDogMjkgTWF5IDIwMTkgMTQ6MTANCj4g
VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47
IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIXSB4ODYvaHZtL2hwZXQ6IGF2b2lkICdzbWFsbCcgdGltZSBkaWZmIHRlc3Qg
b24gcmVzdW1lDQo+IA0KPiBJdCBhcHBlYXJzIHRoYXQgZXZlbiA2NC1iaXQgdmVyc2lvbnMgb2Yg
V2luZG93cyAxMCwgd2hlbiBub3QgdXNpbmcgc3l0aC0NCj4gZXRpYyB0aW1lcnMsIHdpbGwgdXNl
IDMyLWJpdCBIUEVUIG5vbi1wZXJpb2RpYyB0aW1lcnMuIFRoZXJlIGlzIGEgdGVzdA0KPiBpbiBo
cGV0X3NldF90aW1lcigpLCBzcGVjaWZpYyB0byAzMi1iaXQgdGltZXJzLCB0aGF0IHRyaWVzIHRv
IGRpc2FtYmlndWF0ZQ0KPiBiZXR3ZWVuIGEgY29tcGFyYXRvciB2YWx1ZSB0aGF0IGlzIGluIHRo
ZSBwYXN0IGFuZCBvbmUgdGhhdCBpcyBzdWZmaWNpZW50bHkNCj4gZmFyIGluIHRoZSBmdXR1cmUg
dGhhdCBpdCB3cmFwcy4gVGhpcyBpcyBkb25lIGJ5IGFzc3VtaW5nIHRoYXQgdGhlIGRlbHRhDQo+
IGJldHdlZW4gdGhlIG1haW4gY291bnRlciBhbmQgY29tcGFyYXRvciB3aWxsIGJlICdzbWFsbCcg
WzFdLCBpZiB0aGUNCg0KU29ycnksIGZvcmdvdCB0aGUgcmVmLiBJJ2xsIHNlbmQgdjIuDQoNCiAg
UGF1bA0KDQo+IGNvbXBhcmF0b3IgdmFsdWUgaXMgaW4gdGhlIHBhc3QuIFVuZm9ydHVuYXRlbHks
IG1vcmUgb2Z0ZW4gdGhhbiBub3QsIHRoaXMNCj4gaXMgbm90IHRoZSBjYXNlIGlmIHRoZSB0aW1l
ciBpcyBiZWluZyByZS1zdGFydGVkIGFmdGVyIGEgbWlncmF0ZSBhbmQgc28NCj4gdGhlIHRpbWVy
IGlzIHNldCB0byBmaXJlIGZhciBpbiB0aGUgZnV0dXJlIChpbiBleGNlc3Mgb2YgYSBtaW51dGUg
aW4NCj4gc2V2ZXJhbCBvYnNlcnZlZCBjYXNlcykgcmF0aGVyIHRoZW4gc2V0IHRvIGZpcmUgaW1t
ZWRpYXRlbHkuIFRoaXMgaGFzIGENCj4gcmF0aGVyIG9kZCBzeW1wdG9tIHdoZXJlIHRoZSBndWVz
dCBjb25zb2xlIGlzIGFsaXZlIGVub3VnaCB0byBiZSBhYmxlIHRvDQo+IGRlYWwgd2l0aCBtb3Vz
ZSBwb2ludGVyIHJlLXJlbmRlcmluZywgYnV0IGFueSBrZXlib2FyZCBhY3Rpdml0eSBvciBtb3Vz
ZQ0KPiBjbGlja3MgeWllbGQgbm8gcmVzcG9uc2UuDQo+IA0KPiBUaGlzIHBhdGNoIHNpbXBseSBh
ZGRzIGEgYm9vbGVhbiBhcmd1bWVudCB0byBocGV0X3NldF90aW1lcigpIHNvIHRoYXQgdGhlDQo+
ICdzbWFsbCcgdGltZSB0ZXN0IGlzIG9taXR0ZWQgd2hlbiB0aGUgZnVuY3Rpb24gaXMgY2FsbGVk
IHRvIHJlc3RhcnQgdGltZXJzDQo+IG9uIHJlc3VtZSwgYW5kIHRodXMgYW55IG5lZ2F0aXZlIGRl
bHRhIGNhdXNlcyBhIHRpbWVyIHRvIGZpcmUgaW1tZWRpYXRlbHkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiAtLS0NCj4gQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBD
YzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IEkgbm90
aWNlIHRoYXQgd2Ugc2VlbWluZ2x5IGRvbid0IGhhbmRsZSBtYWluIGNvdW50ZXIgd3JhcCBpbiB0
aGUgSFBFVCBjb2RlLg0KPiBUaGUgc3BlYy4gc2F5cyB0aGF0IHRpbWVycyBzaG91bGQgZmlyZSBh
dCB0aGUgcG9pbnQgdGhlIGNvdW50ZXIgd3JhcHMgYXQgdGhlDQo+IHRpbWVyJ3Mgd2lkdGguIEkg
dGhpbmsgdGhlIG5lZWQgZm9yIHRoZSAnc21hbGwnIHRpbWUgdGVzdCB3b3VsZCBnbyBhd2F5IGlm
DQo+IHRoaXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhhdCdzIGZvciBhbm90aGVyIGRheS4NCj4g
LS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL2hwZXQuYyB8IDEzICsrKysrKysrLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9ocGV0LmMgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQu
Yw0KPiBpbmRleCBhOTE2NzU4MTA2Li40OTI1Nzk4NmI1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2hwZXQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYw0KPiBAQCAt
MjMzLDcgKzIzMyw3IEBAIHN0YXRpYyB2b2lkIGhwZXRfdGltZXJfZmlyZWQoc3RydWN0IHZjcHUg
KnYsIHZvaWQgKmRhdGEpDQo+ICAjZGVmaW5lICBIUEVUX1RJTllfVElNRV9TUEFOICAoKGgtPnN0
aW1lX2ZyZXEgPj4gMTApIC8gU1RJTUVfUEVSX0hQRVRfVElDSykNCj4gDQo+ICBzdGF0aWMgdm9p
ZCBocGV0X3NldF90aW1lcihIUEVUU3RhdGUgKmgsIHVuc2lnbmVkIGludCB0biwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGd1ZXN0X3RpbWUpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50NjRfdCBndWVzdF90aW1lLCBib29sIHJlc3VtZSkNCj4gIHsN
Cj4gICAgICB1aW50NjRfdCB0bl9jbXAsIGN1cl90aWNrLCBkaWZmOw0KPiAgICAgIHVuc2lnbmVk
IGludCBpcnE7DQo+IEBAIC0yNzMsMTAgKzI3MywxMyBAQCBzdGF0aWMgdm9pZCBocGV0X3NldF90
aW1lcihIUEVUU3RhdGUgKmgsIHVuc2lnbmVkIGludCB0biwNCj4gICAgICAgKiBEZXRlY3QgdGlt
ZSB2YWx1ZXMgc2V0IGluIHRoZSBwYXN0LiBUaGlzIGlzIGhhcmQgdG8gZG8gZm9yIDMyLWJpdA0K
PiAgICAgICAqIGNvbXBhcmF0b3JzIGFzIHRoZSB0aW1lciBkb2VzIG5vdCBoYXZlIHRvIGJlIHNl
dCB0aGF0IGZhciBpbiB0aGUgZnV0dXJlDQo+ICAgICAgICogZm9yIHRoZSBjb3VudGVyIGRpZmZl
cmVuY2UgdG8gd3JhcCBhIDMyLWJpdCBzaWduZWQgaW50ZWdlci4gV2UgZnVkZ2UNCj4gLSAgICAg
KiBieSBsb29raW5nIGZvciBhICdzbWFsbCcgdGltZSB2YWx1ZSBpbiB0aGUgcGFzdC4NCj4gKyAg
ICAgKiBieSBsb29raW5nIGZvciBhICdzbWFsbCcgdGltZSB2YWx1ZSBpbiB0aGUgcGFzdC4gSG93
ZXZlciwgaWYgd2UNCj4gKyAgICAgKiBhcmUgcmVzdW1pbmcgZnJvbSBzdXNwZW5kLCB0cmVhdCBh
bnkgd3JhcCBhcyBwYXN0IHNpbmNlIHRoZSB2YWx1ZQ0KPiArICAgICAqIGlzIHVubGlrZWx5IHRv
IGJlICdzbWFsbCcuDQo+ICAgICAgICovDQo+ICAgICAgaWYgKCAoaW50NjRfdClkaWZmIDwgMCAp
DQo+IC0gICAgICAgIGRpZmYgPSAodGltZXJfaXNfMzJiaXQoaCwgdG4pICYmICgtZGlmZiA+IEhQ
RVRfVElOWV9USU1FX1NQQU4pKQ0KPiArICAgICAgICBkaWZmID0gKHRpbWVyX2lzXzMyYml0KGgs
IHRuKSAmJiAoLWRpZmYgPiBIUEVUX1RJTllfVElNRV9TUEFOKSAmJg0KPiArICAgICAgICAgICAg
ICAgICFyZXN1bWUpDQo+ICAgICAgICAgICAgICA/ICh1aW50MzJfdClkaWZmIDogMDsNCj4gDQo+
ICAgICAgZGVzdHJveV9wZXJpb2RpY190aW1lKCZoLT5wdFt0bl0pOw0KPiBAQCAtNTQ3LDcgKzU1
MCw3IEBAIHN0YXRpYyBpbnQgaHBldF93cml0ZSgNCj4gICAgICB7DQo+ICAgICAgICAgIGkgPSBm
aW5kX2ZpcnN0X3NldF9iaXQoc3RhcnRfdGltZXJzKTsNCj4gICAgICAgICAgX19jbGVhcl9iaXQo
aSwgJnN0YXJ0X3RpbWVycyk7DQo+IC0gICAgICAgIGhwZXRfc2V0X3RpbWVyKGgsIGksIGd1ZXN0
X3RpbWUpOw0KPiArICAgICAgICBocGV0X3NldF90aW1lcihoLCBpLCBndWVzdF90aW1lLCBmYWxz
ZSk7DQo+ICAgICAgfQ0KPiANCj4gICN1bmRlZiBzZXRfc3RvcF90aW1lcg0KPiBAQCAtNjkyLDcg
KzY5NSw3IEBAIHN0YXRpYyBpbnQgaHBldF9sb2FkKHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21h
aW5fY29udGV4dF90ICpoKQ0KPiAgICAgIGlmICggaHBldF9lbmFibGVkKGhwKSApDQo+ICAgICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgSFBFVF9USU1FUl9OVU07IGkrKyApDQo+ICAgICAgICAgICAg
ICBpZiAoIHRpbWVyX2VuYWJsZWQoaHAsIGkpICkNCj4gLSAgICAgICAgICAgICAgICBocGV0X3Nl
dF90aW1lcihocCwgaSwgZ3Vlc3RfdGltZSk7DQo+ICsgICAgICAgICAgICAgICAgaHBldF9zZXRf
dGltZXIoaHAsIGksIGd1ZXN0X3RpbWUsIHRydWUpOw0KPiANCj4gICAgICB3cml0ZV91bmxvY2so
JmhwLT5sb2NrKTsNCj4gDQo+IC0tDQo+IDIuMjAuMS4yLmdiMjFlYmI2NzENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
