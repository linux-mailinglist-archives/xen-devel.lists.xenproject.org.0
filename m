Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B45E1C0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:15:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicFO-0005du-Mr; Wed, 03 Jul 2019 10:12:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eYTC=VA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hicFN-0005do-Eh
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:12:17 +0000
X-Inumbo-ID: 08781dd1-9d7b-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08781dd1-9d7b-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:12:16 +0000 (UTC)
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
IronPort-SDR: YMfjygiprBdbhtRZqf5okpf3yl+QfjuSWhEIVCYVz+s7l96Rq2UgGm8uQoTjuBFQrmMSsiEXdP
 6+7aTL//kfSUkb1M9152VsovZ8/rLJaxe8TxUcY8ohbwKR+zNLR+jVAqGUmSUReR1HfBT/6abm
 pZbOxYGttJMRSXbzDZQ+eeGnqtKk5QJkR290Y9N6nEbe99FWb8bfckR15q6F7DAYAHMzC29QMw
 em/Z7VbyHyXPZkX/k9Q3IGeSqYx4eEurdj80F0acKxljtAak/ZuaZSSw9gnbSHT7HYpCcOSIdA
 AuM=
X-SBRS: 2.7
X-MesageID: 2565104
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2565104"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH 3/3] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVMPSe9OsDOCZHykO9MXy+EOUraKa4isoAgAAikhA=
Date: Wed, 3 Jul 2019 10:12:12 +0000
Message-ID: <081053cf1b104cdbb99f58965cacbd3f@AMSPEX02CL03.citrite.net>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-4-paul.durrant@citrix.com>
 <c9b1bae0-1baf-c633-006a-bd223b0f3743@suse.com>
In-Reply-To: <c9b1bae0-1baf-c633-006a-bd223b0f3743@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] xmalloc: add a Kconfig option to poison
 free pool memory
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMTowNw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAzLzNdIHhtYWxsb2M6IGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIHBvaXNvbiBmcmVlIHBv
b2wgbWVtb3J5DQo+IA0KPiBPbiAwMi4wNy4yMDE5IDE4OjM4LCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4gLS0tIGEveGVuL0tjb25maWcuZGVidWcNCj4gPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1
Zw0KPiA+IEBAIC0xMDUsNiArMTA1LDEzIEBAIGNvbmZpZyBERUJVR19UUkFDRQ0KPiA+ICAgCSAg
ZWl0aGVyIGRpcmVjdGx5IHRvIHRoZSBjb25zb2xlIG9yIGFyZSBwcmludGVkIHRvIGNvbnNvbGUg
aW4gY2FzZSBvZg0KPiA+ICAgCSAgYSBzeXN0ZW0gY3Jhc2guDQo+ID4NCj4gPiArY29uZmlnIFBP
T0xfUE9JU09ODQo+IA0KPiBNYXkgSSBzdWdnZXN0IHRoaXMgdG8gYmVjb21lIFhNRU1fUE9PTF9Q
T0lTT04sIHRvIHBhcmFsbGVsIHRoZSBuYW1lcw0KPiBvZiB0aGUgaW52b2x2ZWQgZnVuY3Rpb25z
Pw0KPiANCg0KU3VyZS4NCg0KPiA+IEBAIC0yNDAsNiArMjQ0LDEwIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBFWFRSQUNUX0JMT0NLKHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBp
bnQgZmwsDQo+ID4gICAgICAgICAgIH0NCj4gPiAgICAgICB9DQo+ID4gICAgICAgYi0+cHRyLmZy
ZWVfcHRyID0gKHN0cnVjdCBmcmVlX3B0cikge05VTEwsIE5VTEx9Ow0KPiA+ICsjaWZkZWYgQ09O
RklHX1BPT0xfUE9JU09ODQo+ID4gKyAgICBmb3IgKCBpID0gTUlOX0JMT0NLX1NJWkU7IGkgPCAo
Yi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSyk7IGkrKyApDQo+ID4gKyAgICAgICAgQVNTRVJUKGIt
PnB0ci5idWZmZXJbaV0gPT0gMHhBQSk7DQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfUE9PTF9QT0lT
T04gKi8NCj4gDQo+IE1heSBJIGZ1cnRoZXIgc3VnZ2VzdCB0aGF0IHdlIGNsb25lIExpbnV4J2Vz
IG1lbWNocl9pbnYoKSBmb3IgdGhpcw0KPiBwdXJwb3NlIChwZXJoYXBzIHdpdGggYSBtb3JlIHNp
bXBsaXN0aWMgaW1wbGVtZW50YXRpb24gYWxvbmcgdGhlDQo+IGxpbmVzIG9mIG1lbWNocigpKT8g
V2Ugc2hvdWxkIHRoZW4gYWxzbyB1c2UgaXQgaW4gY2hlY2tfb25lX3BhZ2UoKS4NCj4gDQoNClll
cywgdGhhdCBzb3VuZHMgbGlrZSBhIHdvcnRoeSB0aGluZyB0byBkby4NCg0KICBQYXVsDQoNCj4g
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
