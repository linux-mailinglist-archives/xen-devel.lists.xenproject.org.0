Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D6A14FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Giz-0007EZ-Jw; Thu, 29 Aug 2019 09:28:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3Giy-0007Dh-3y
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:28:12 +0000
X-Inumbo-ID: 4fbcf41f-ca3f-11e9-ae63-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fbcf41f-ca3f-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567070889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ELQ21ACQfV+5+EqAqxXUIXx9cX+re6trTVCjrirq4Gw=;
 b=ayd+1e4AZK1aLiP/IGyDIP+nJY7CpFXYdDhJjzlgrM/ZpQq6jWc24ywb
 p/ua3CDgtNOsV4hrisfkVEv0VPoHtpGctAW4WhhoCR61NaRzEgakbg03B
 y6NeZys3izlV3TpBQlLQP23rv27bACNcbXW4K00apVBZnhOIQi2NP1sO8 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9yNiuxP7+ZnFZQBAvjIQejh8/bhb3TiAAPuHCZsRCP1ZaCgz5y+xOH2TzhZmXRpUNYf2i2CTAP
 jFpkWHbUU4bB2159lJLxq+GeTgXyYI9r8ZfRCyvZ3DjA6ldww2CxHaI7AoMJZnslUlldRWJuPH
 89t6yBLW8iGy+CnDHED7FEI9f0Cxuay/WZSyEv41qT30b2TRwmUQyjbvO0gY4n791E/UIj8a8p
 osfhsiexipePbhUAx+U03/gEinIuc+QQSbWU+6yr6p3kUwwIFjU2LcKQIPdWZ/8KF/H6UDw0eu
 /Sw=
X-SBRS: 2.7
X-MesageID: 4919893
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4919893"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVCAFvMsgIADYoRw
Date: Thu, 29 Aug 2019 09:28:04 +0000
Message-ID: <cbcd5e11b8f344cbbfabf432a0a41af3@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <1cf99941-56db-6906-4689-6027912dabf0@suse.com>
In-Reply-To: <1cf99941-56db-6906-4689-6027912dabf0@suse.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Isaila <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IEF1Z3VzdCAyMDE5IDA4OjQ2DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogSnVsaWVuR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPjsgQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+OyBQZXRyZSBQaXJjYWxhYnUNCj4gPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsgQW5kcmV3IENvb3Blcg0K
PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFZvbG9keW15ckJhYmNodWsN
Cj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGFtYXMgSyBM
ZW5neWVsDQo+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BB
VENIIDMvNl0gcmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBh
Z2UgdGFibGVzDQo+IA0KPiBPbiAxMi4wOC4yMDE5IDE3OjQxLCBQYXVsIER1cnJhbnQgd3JvdGU6
DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDog
MDcgQXVndXN0IDIwMTkgMTE6MzINCj4gPj4NCj4gPj4gT24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1
bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4gQEAgLTYyNSw4ICs1NDgsNyBAQCBzdGF0aWMgdm9pZCBp
b21tdV9kdW1wX3AybV90YWJsZSh1bnNpZ25lZCBjaGFyIGtleSkNCj4gPj4+ICAgICAgICBvcHMg
PSBpb21tdV9nZXRfb3BzKCk7DQo+ID4+PiAgICAgICAgZm9yX2VhY2hfZG9tYWluKGQpDQo+ID4+
PiAgICAgICAgew0KPiA+Pj4gLSAgICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgfHwN
Cj4gPj4+IC0gICAgICAgICAgICAgZG9tX2lvbW11KGQpLT5zdGF0dXMgPCBJT01NVV9TVEFUVVNf
aW5pdGlhbGl6ZWQgKQ0KPiA+Pj4gKyAgICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSAp
DQo+ID4+PiAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPj4NCj4gPj4gV2h5IGRvIHlvdSBk
cm9wIHRoZSBod2RvbSBjaGVjayBoZXJlPw0KPiA+DQo+ID4gQmVjYXVzZSBpc19pb21tdV9lbmFi
bGVkKCkgZm9yIHRoZSBoL3cgZG9tYWluIHdpbGwgYWx3YXlzIGJlIHRydWUgaWYNCj4gPiBpb21t
dV9lbmFibGVkIGlzIHRydWUsIHNvIG5vIG5lZWQgZm9yIGEgc3BlY2lhbCBjYXNlLg0KPiANCj4g
QnV0IHRoZSBlZmZlY3Qgb2YgdGhlIGV4dHJhIGNoZWNrIHdhcyB0byBfc2tpcF8gRG9tMC4gSWYg
eW91IG1lYW4gdG8NCj4gY2hhbmdlIHRoaXMsIHRoZW4geW91IHNob3VsZCBzYXkgc28gKGFuZCB3
aHkpIGluIHRoZSBkZXNjcmlwdGlvbi4NCj4gDQoNCkFoLCB5ZXMsIGl0IGRvZXMgc3RpbGwgbmVl
ZCB0byByZW1haW4uDQoNCiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
