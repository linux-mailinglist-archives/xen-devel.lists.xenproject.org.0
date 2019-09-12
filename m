Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1FB10E3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:16:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Pqx-0002U7-Ip; Thu, 12 Sep 2019 14:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8Pqv-0002Ts-PK
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:13:41 +0000
X-Inumbo-ID: 8513e662-d567-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8513e662-d567-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568297620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a5dEXmOWQC9SGbEtdTFAWFCVYrcAV9IWwQcPw8xlagc=;
 b=ZVjtAaaoEPi1wdK7WjI2pNEHS5uqBFB4kDaiAttMp86xKb6qRG2kxx94
 hwP7JdHRxFXGIM4KdsAtDYCTOpXIlUO+LR+KmWueOgsFrS73fpJ6LVprg
 8EZP+1TzVKhsKhBQD64xhkbatGCoL0wzw2MMvA3dgi1SkrRFboGCz6qJz k=;
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
IronPort-SDR: o+ZAGh5SCtTcgkyOlwSBaV6ZUUKRq4qtbFWLhGRyb1bXk/Ee7gKJP/5lnh/UyfgQqeBDfs8Rug
 OErVYjMl2+fziz66xCWj0YqswRuYXClsv0P/DCNSv7gUdrJlJCC/OATxMGa1T0duFVZCl9/FiS
 ju2JavZV98U7Z9Uyd7XEUnD/tcI3SCSXEh/b0mLDzinFBeRw25wZ0GtrsXGZtrHSz+etf+igLv
 8RFtKi6bQt7+GbjxMVax+ymwPICS+U5U6PqbT3rOvRH3asuvrLElRYj+2rlWJc7aqRd4+lX3xi
 cY0=
X-SBRS: 2.7
X-MesageID: 5777624
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5777624"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v9 3/6] sysctl / libxl: report whether IOMMU/HAP page
 table sharing is supported
Thread-Index: AQHVaVu2GSc9488Xt0+NIqHKq1T8zacn4PqAgAAkKHD//+J1gIAALbqQ
Date: Thu, 12 Sep 2019 14:13:35 +0000
Message-ID: <6349067663c64720ade240a5edf6bff0@AMSPEX02CL03.citrite.net>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-4-paul.durrant@citrix.com>
 <7cd00313-8d28-708b-23b1-4f6b0ff89cdf@suse.com>
 <db42dfe903484b948cd82ad5d2a46844@AMSPEX02CL03.citrite.net>
 <9db1e764-e19e-a3fc-7d51-515d5625682f@suse.com>
In-Reply-To: <9db1e764-e19e-a3fc-7d51-515d5625682f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v9 3/6] sysctl / libxl: report whether
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, DavidScott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE0OjI4DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogSnVsaWVuR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IEFudGhvbnkgUGVyYXJkDQo+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQ2hy
aXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxh
cA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29u
QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2ls
aw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IERhdmlkU2NvdHQgPGRhdmVAcmVjb2lsLm9y
Zz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAzLzZdIHN5c2N0bCAvIGxpYnhsOiByZXBvcnQgd2hl
dGhlciBJT01NVS9IQVAgcGFnZSB0YWJsZSBzaGFyaW5nIGlzIHN1cHBvcnRlZA0KPiANCj4gT24g
MTIuMDkuMjAxOSAxNToxOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE0OjA0DQo+ID4+IFRvOiBQYXVsIER1cnJh
bnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiA+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJk
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQ2hyaXN0aWFuIExpbmRpZw0KPiA+PiA8Y2hy
aXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBj
aXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1
dGVrIFdpbGsNCj4gPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBEYXZpZFNjb3R0IDxkYXZl
QHJlY29pbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUNCj4gPj4g
PHdsQHhlbi5vcmc+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgMy82XSBzeXNjdGwgLyBs
aWJ4bDogcmVwb3J0IHdoZXRoZXIgSU9NTVUvSEFQIHBhZ2UgdGFibGUgc2hhcmluZyBpcw0KPiBz
dXBwb3J0ZWQNCj4gPj4NCj4gPj4gT24gMTIuMDkuMjAxOSAxMzoxNywgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3N5c2N0bC5jDQo+ID4+PiArKysgYi94ZW4v
YXJjaC9hcm0vc3lzY3RsLmMNCj4gPj4+IEBAIC0xNSw2ICsxNSw5IEBADQo+ID4+PiAgdm9pZCBh
cmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkNCj4gPj4+ICB7
DQo+ID4+PiAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSB8
IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7DQo+ID4+PiArDQo+ID4+PiArICAgIGlmICggaW9tbXVf
ZW5hYmxlZCAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQ0KPiA+Pj4gKyAgICAgICAgcGktPmNhcGFi
aWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOw0KPiA+Pj4g
IH0NCj4gPj4NCj4gPj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBkb25lIGluIGNvbW1vbiBjb2Rl
Lg0KPiA+Pg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jDQo+ID4+PiArKysgYi94
ZW4vYXJjaC94ODYvc3lzY3RsLmMNCj4gPj4+IEBAIC0xNjQsNyArMTY0LDEyIEBAIHZvaWQgYXJj
aF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpDQo+ID4+PiAgICAg
IGlmICggSVNfRU5BQkxFRChDT05GSUdfUFYpICkNCj4gPj4+ICAgICAgICAgIHBpLT5jYXBhYmls
aXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX3B2Ow0KPiA+Pj4gICAgICBpZiAoIGh2bV9oYXBf
c3VwcG9ydGVkKCkgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiAgICAgICAgICBwaS0+Y2FwYWJpbGl0
aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7DQo+ID4+PiArDQo+ID4+PiArICAgICAgICBp
ZiAoIGlvbW11X2VuYWJsZWQgJiYgaW9tbXVfaGFwX3B0X3NoYXJlICkNCj4gPj4+ICsgICAgICAg
ICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRf
c2hhcmU7DQo+ID4+PiArICAgIH0NCj4gPj4+ICB9DQo+ID4+DQo+ID4+IEFuZCBpZiBpdCdzIGlt
cG9ydGFudCB0byBub3QgaGF2ZSB0aGUgYml0IHNldCB3aGVuICFodm1faGFwX3N1cHBvcnRlZCgp
LA0KPiA+DQo+ID4gLi4uYW5kIHRoYXQncyB3aGF0IGl04oCZcyBub3QgaW4gY29tbW9uIGNvZGUu
Li4gdGhlcmUgaXMgbm8gaHZtX2hhcF9zdXBwb3J0ZWQoKSBmb3IgQXJtDQo+ID4NCj4gPj4gdGhl
biBpb21tdV9oYXBfcHRfc2hhcmUgc2hvdWxkIGJlIGNsZWFyZWQgaW4gX19pbml0IGNvZGUgaW4g
dGhpcyBjYXNlLg0KPiA+DQo+ID4gVGhhdCB3b3VsZCBoYXZlIGJlZW4gYW4gYWx0ZXJuYXRpdmUg
YXBwcm9hY2ggaWYgeW91J2Qgbm90IHdhbnRlZA0KPiA+IGl0ICNkZWZpbmVkIGluIHBhdGNoICM1
LiAoWWVzIGl0J3MgYSBsYXRlciBwYXRjaCBpbiB0aGUgc2VyaWVzLA0KPiA+IGJ1dCB0aGlzIG9u
ZSBpcyBsYXRlciBjaHJvbm9sb2dpY2FsbHkgYW5kIEkgZGlkbid0IHdhbnQgdG8NCj4gPiBpbnZh
bGlkYXRlIHRoZSBvdGhlciBwYXRjaC4pDQo+ID4gSSBjb3VsZCBwZXJoYXBzIGltcGxlbWVudCBo
dm1faGFwX3N1cHBvcnRlZCgpIGZvciBBcm0/DQo+IA0KPiBXZWxsLCBpbXBsZW1lbnRpbmcgaXQg
Zm9yIEFybSBpcyBhbiBvcHRpb24gKGF0IHdoaWNoIHBvaW50DQo+IFhFTl9TWVNDVExfUEhZU0NB
UF9oYXAgY291bGQgYWxzbyBtb3ZlIHRvIGNvbW1vbiBjb2RlKS4gQnV0DQo+IHBlcnNvbmFsbHkg
SSdkIGFkdmlzZSBhZ2FpbnN0IHByb3ZpZGluZyBtb3JlIHN0dWJzIHRoYW4NCj4gbmVjZXNzYXJ5
IG9uIEFybS4gSSBtYXkgbm90IHVuZGVyc3RhbmQgeW91ciByZW1hcmsgcmVnYXJkaW5nDQo+IHBh
dGNoIDU6IFRoZXJlJ3Mgbm8gcHJvYmxlbSB3aXRoIGlvbW11X2hhcF9wdF9zaGFyZSBub3cgYmVp
bmcNCj4gYSAjZGVmaW5lIG9uIEFybSAtIHdoZXRoZXIgdGhlIHN5c3RlbSBpcyBIVk0gY2FwYWJs
ZSBpcyBhbg0KPiB4ODYgc3BlY2lmaWMgZGVjaXNpb24gYW55d2F5LCBhbmQgaGVuY2UgdGhlIGNs
ZWFyaW5nIG9mIHRoZQ0KPiBmbGFnIGNvdWxkIG9jY3VyIGUuZy4gaW4gaHZtX2VuYWJsZSgpIHdo
ZW4gaXQgYmFpbHMgZWFybHkuDQo+IEFuZCBidHcuLCB3aXRoICFDT05GSUdfSFZNIGl0IGNvdWxk
IGJlIGEgI2RlZmluZSBvbiB4ODYgYXMNCj4gd2VsbCwganVzdCB0byAiZmFsc2UiIHRoZW4uDQoN
Ck9rLCBJIGhhZCBhc3N1bWVkIHlvdSBtZWFudCB0byBjbGVhciBpdCBjb21tb24gY29kZSB0b28u
IEJ1dCwgeWVzLCBjbGVhcmluZyBpdCBpbiB4ODYgY29kZSB3b3VsZCBpbmRlZWQgd29yayBhbmQg
SSdsbCBzZWUgYWJvdXQgdGhlICFDT05GSUdfSFZNIGRlZmluaXRpb24uDQoNCiAgUGF1bA0KDQo+
IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
