Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F93B1C8E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 13:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8k3e-000638-67; Fri, 13 Sep 2019 11:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8k3c-000632-He
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 11:48:08 +0000
X-Inumbo-ID: 5a38379e-d61c-11e9-b76c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a38379e-d61c-11e9-b76c-bc764e2007e4;
 Fri, 13 Sep 2019 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568375287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UuD6pgc97e4fBktvYhqZdlwPpo2bf5oNp3MEWUAmK8M=;
 b=YWXWQMS+azonkeEJv2LFbzb2GNYPgwseXl5xkClLSJ1sced0saD4sMq5
 opRGPDRQ4Hc/VFof3KHBP7vatej9gDaKmzAVmiuVEAASySI01Abj11Ony
 DFrO34IHcoAoDkl35MO9zPYpFaUevT+wtU7aFVo9GKJ/bV0cszuSi+Zek o=;
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
IronPort-SDR: 0mA/n+CSzE62SfoBMqcldgFKOturEVycyhtGwAwgk0wawVZ3CbKVFANiIHLvnmn/hZmDaHOuTt
 UpcBBJpAIVlW5b9XV4ymVwmZnWcVF5Lt9NSE4L6Mf3YWUwCcE+ebYpe+YGp05bzUt6veM6/1wI
 fjKABdJ7A2FALOpkNQNtRNPR/AYsbO9WMj6Bx9n3Pgkbrrq5VS/doUdX/BXo9o/Vph51YLV0aa
 Bai/VT75gE1eRJ6JkcYo57JlLji4uuydHWbAGkRAf5br3nrmy92qGsl8s33Nh3hio+vCZaBGJj
 keU=
X-SBRS: 2.7
X-MesageID: 5776087
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5776087"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v11.1 3/6] sysctl / libxl: report whether IOMMU/HAP page
 table sharing is supported
Thread-Index: AQHVaiPWsY0upY3KjUqZUIdUedXUHKcpfKww
Date: Fri, 13 Sep 2019 11:47:52 +0000
Message-ID: <1f1fbba50d5b4dbd812f90b17d69c457@AMSPEX02CL03.citrite.net>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
In-Reply-To: <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 David Scott <dave@recoil.org>, Anthony
 Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEzIFNlcHRlbWJlciAyMDE5IDEyOjEwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJl
dw0KPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IENocmlzdGlhbiBMaW5kaWcNCj4gPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPjsNCj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgRGF2aWQNCj4g
U2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2Vp
TGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjExLjEgMy82XSBzeXNjdGwgLyBs
aWJ4bDogcmVwb3J0IHdoZXRoZXIgSU9NTVUvSEFQIHBhZ2UgdGFibGUgc2hhcmluZyBpcyBzdXBw
b3J0ZWQNCj4gDQo+IFRoaXMgcGF0Y2ggZGVmaW5lcyBhIG5ldyBiaXQgcmVwb3J0ZWQgaW4gdGhl
IGh3X2NhcCBmaWVsZCBvZiBzdHJ1Y3QNCj4geGVuX3N5c2N0bF9waHlzaW5mbyB0byBpbmRpY2F0
ZSB3aGV0aGVyIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBzaGFyaW5nIG9mDQo+IEhBUCBwYWdlIHRh
YmxlcyAoaS5lLiB0aGUgUDJNKSB3aXRoIHRoZSBJT01NVS4gVGhpcyBpbmZvcm1zIHRoZSB0b29s
c3RhY2sNCj4gd2hldGhlciB0aGUgZG9tYWluIG5lZWRzIGV4dHJhIG1lbW9yeSB0byBzdG9yZSBk
aXNjcmV0ZSBJT01NVSBwYWdlIHRhYmxlcw0KPiBvciBub3QuDQo+IA0KPiBOT1RFOiBUaGlzIHBh
dGNoIG1ha2VzIHN1cmUgaW9tbXVfaGFwX3B0X3NoYXJlZCBpcyBjbGVhciBpZiBIQVAgaXMgbm90
DQo+ICAgICAgIHN1cHBvcnRlZCBvciB0aGUgSU9NTVUgaXMgZGlzYWJsZWQsIGFuZCBkZWZpbmVz
IGl0IHRvIGZhbHNlIGlmDQo+ICAgICAgICFDT05GSUdfSFZNLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBBY2tlZC1ieTogQ2hyaXN0aWFu
IExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KLi4ud2l0aCBvbmUgb2JzZXJ2
YXRpb24uLi4NCg0KW3NuaXBdDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiBAQCAtNDksNyAr
NDksMTEgQEAgaW50OF90IF9faHdkb21faW5pdGRhdGEgaW9tbXVfaHdkb21fcmVzZQ0KPiAgICog
ZGVmYXVsdCB1bnRpbCB3ZSBmaW5kIGEgZ29vZCBzb2x1dGlvbiB0byByZXNvbHZlIGl0Lg0KPiAg
ICovDQo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9pbnRwb3N0Ow0KPiAtYm9vbF90IF9f
cmVhZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0gMTsNCj4gKw0KPiArI2lmbmRlZiBpb21t
dV9oYXBfcHRfc2hhcmUNCj4gK2Jvb2wgX19yZWFkX21vc3RseSBpb21tdV9oYXBfcHRfc2hhcmUg
PSB0cnVlOw0KPiArI2VuZGlmDQo+ICsNCj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2Rl
YnVnOw0KPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgYW1kX2lvbW11X3BlcmRldl9pbnRyZW1hcCA9
IDE7DQo+IA0KPiBAQCAtMTAyLDggKzEwNiwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9p
b21tdV9wYXJhbShjb25zDQo+ICAgICAgICAgICAgICBpb21tdV9od2RvbV9wYXNzdGhyb3VnaCA9
IHZhbDsNCj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20wLXN0
cmljdCIsIHMsIHNzKSkgPj0gMCApDQo+ICAgICAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3Qg
PSB2YWw7DQo+ICsjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQ0KPiAgICAgICAgICBlbHNlIGlm
ICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNoYXJlcHQiLCBzLCBzcykpID49IDAgKQ0KPiAgICAg
ICAgICAgICAgaW9tbXVfaGFwX3B0X3NoYXJlID0gdmFsOw0KPiArI2VuZGlmDQo+ICAgICAgICAg
IGVsc2UNCj4gICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsNCj4gDQoNCldpdGggdGhpcyBjaGFu
Z2UgdGhlcmUgd2lsbCBiZSBhIGNvbW1hbmQgbGluZSBwYXJzZSBlcnJvciBpZiAnbm8tc2hhcmVw
dCcgaXMgcGFzc2VkIG9uIHRoZSBjb21tYW5kIGxpbmUgdG8gYSBoeXBlcnZpc29yIGJ1aWx0IHdp
dGhvdXQgQ09ORklHX0hWTS4gSSBkb24ndCBrbm93IHdoZXRoZXIgeW91IHJlYWxseSB3YW50IHRo
YXQgYmVoYXZpb3VyLCB3aGljaCBpcyB3aHkgbXkgcGF0Y2ggZGlkOg0KDQpAQCAtMTAzLDcgKzEw
NywxNCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9pb21tdV9wYXJhbShjb25zdCBjaGFyICpz
KQ0KICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20wLXN0cmljdCIs
IHMsIHNzKSkgPj0gMCApDQogICAgICAgICAgICAgaW9tbXVfaHdkb21fc3RyaWN0ID0gdmFsOw0K
ICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywgc3Mp
KSA+PSAwICkNCisgICAgICAgIHsNCisjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQ0KICAgICAg
ICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IHZhbDsNCisjZWxzZQ0KKyAgICAgICAgICAgIGlm
ICh2YWwgIT0gaW9tbXVfaGFwX3B0X3NoYXJlKQ0KKyAgICAgICAgICAgICAgICByYyA9IC1FSU5W
QUw7DQorI2VuZGlmDQorICAgICAgICB9DQogICAgICAgICBlbHNlDQogICAgICAgICAgICAgcmMg
PSAtRUlOVkFMOw0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
