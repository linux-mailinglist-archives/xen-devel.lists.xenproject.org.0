Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3364AB3A2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 10:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i699U-0005bR-VX; Fri, 06 Sep 2019 07:59:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i699T-0005bM-OK
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:59:27 +0000
X-Inumbo-ID: 3f0e8d6a-d07c-11e9-abeb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f0e8d6a-d07c-11e9-abeb-12813bfff9fa;
 Fri, 06 Sep 2019 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567756767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cLjg/+qcTPoUeMrk02guo0eNAXAxhwGPuQM8EFsEO9c=;
 b=Wb8qR0BuUoSWPVLtkkLBg5G/CtOzW9yRZOHgoHVNaOdK3lsEkqlUZjo+
 75HyFie6qxl/LgbzwErgZA0U6T5dxibNETgNrVecXF77F+CFCpKkm3KkJ
 4kvIN3wQMq5AI1keasZTRR2U9v8R73VXSBG78+CA+C9mppWDgseFGaW0h U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v6qgADc9QgK52VZnBz7uOd+QWjno3cKjagfn2JBDYkaUpnaGYQA4HCEW6yzfBRNMtURVl64KOP
 3YFTyyKLkNkInYTus/QgfNo/ij37Ci1Jyq0q2QF6r7+q1voezhX+maZ6VKObFHD2UlhvlY5owb
 Np+jSEznnpDr2qOudAQi/U5g0lAz8SDGRFI4632CrJSSAwDts+psn87RP078fx5DZuCueFQ39H
 mVeEn+zc7hwybj2172AIHrhOrnzPq1GWor6EuERl4VKWQf9wrxbBn7xOqrCmH7UlCN3DhceA6w
 YoU=
X-SBRS: 2.7
X-MesageID: 5226745
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5226745"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 5/6] iommu: tidy up iommu_use_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVYZ3AzSjvN0U2xkmkfDRbRrAE3qcdXiGAgADv4WA=
Date: Fri, 6 Sep 2019 07:59:21 +0000
Message-ID: <7eee48f521154ffebebda5a57f295867@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-6-paul.durrant@citrix.com>
 <c62facd8-ebce-7a28-9a6a-6fcbb1d6ec2b@arm.com>
In-Reply-To: <c62facd8-ebce-7a28-9a6a-6fcbb1d6ec2b@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOSAyMDozOA0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4g
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIChYZW4u
b3JnKSA8dGltQHhlbi5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgVm9sb2R5bXlyIEJh
YmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA1LzZdIGlvbW11
OiB0aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFj
cm9zDQo+IA0KPiBIaSBQYXVsLA0KPiANCj4gT24gOS8yLzE5IDM6NTAgUE0sIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPiBUaGVzIG1hY3JvcyByZWFsbHkgb3VnaHQgdG8gbGl2ZSBpbiB0aGUgY29t
bW9uIHhlbi9pb21tdS5oIGhlYWRlciByYXRoZXINCj4gPiB0aGVuIGJlaW5nIGRpc3RyaWJ1dGVk
IGFtb25nc3QgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGlvbW11IGhlYWRlcnMgYW5kDQo+ID4geGVu
L3NjaGVkLmguIFRoaXMgcGF0Y2ggbW92ZXMgdGhlbSB0aGVyZS4NCj4gPg0KPiA+IE5PVEU6IERp
c2FibGluZyAnc2hhcmVwdCcgaW4gdGhlIGNvbW1hbmQgbGluZSBpb21tdSBvcHRpb25zIHNob3Vs
ZCByZWFsbHkNCj4gPiAgICAgICAgYmUgaGFyZCBlcnJvciBvbiBBUk0gKGFzIG9wcG9zZWQgdG8g
anVzdCBiZWluZyBpZ25vcmVkKSwgc28gZGVmaW5lDQo+ID4gICAgICAgICdpb21tdV9oYXBfcHRf
c2hhcmUnIHRvIGJlIHRydWUgZm9yIEFSTSB0aGVuIHRoZW4gZ2F0ZSBwYXJzaW5nIHRoZQ0KPiA+
ICAgICAgICBjb21tYW5kIGxpbmUgb3B0aW9uIG9uICcjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFy
ZScuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPg0KPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4gLS0tDQo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4NCj4gPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+ID4g
Q2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+ID4gQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gPiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+IENjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4NCj4gPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPiBDYzogVm9sb2R5
bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiA+IENjOiAiUm9nZXIg
UGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+DQo+ID4gUHJldmlvdXNseSBw
YXJ0IG9mIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxOS0wNy9tc2cwMjI2Ny5odG1sDQo+ID4NCj4gPiB2NzoNCj4gPiAgIC0gUmUtd29yayB0
aGUgQVJNIGhhbmRsaW5nIG9mICdzaGFyZXB0JyBhcyBzdWdnZXN0ZWQgYnkgSmFuDQo+ID4gICAt
IE1ha2Ugc3VyZSB0aGF0IG5lZWRfaW9tbXVfcHRfc3luYygpIGFsd2F5cyBldmFsdWF0ZXMgaXRz
IGFyZ3VtZW50DQo+ID4gLS0tDQo+ID4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5j
IHwgIDggKysrKysrKy0NCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgfCAg
MyAtLS0NCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaCAgICAgfCAgNCAtLS0tDQo+
ID4gICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysr
KysrLQ0KPiA+ICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICB8ICA2IC0tLS0tLQ0K
PiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiA+IGluZGV4IDRmNzFkYjk1ZWEuLmFh
ZjNiOWZhYzAgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUu
Yw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gPiBAQCAtNDks
NyArNDksMTEgQEAgaW50OF90IF9faHdkb21faW5pdGRhdGEgaW9tbXVfaHdkb21fcmVzZXJ2ZWQg
PSAtMTsNCj4gPiAgICAqIGRlZmF1bHQgdW50aWwgd2UgZmluZCBhIGdvb2Qgc29sdXRpb24gdG8g
cmVzb2x2ZSBpdC4NCj4gPiAgICAqLw0KPiA+ICAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVf
aW50cG9zdDsNCj4gPiAtYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0g
MTsNCj4gPiArDQo+ID4gKyNpZm5kZWYgaW9tbXVfaGFwX3B0X3NoYXJlDQo+ID4gK2Jvb2wgX19y
ZWFkX21vc3RseSBpb21tdV9oYXBfcHRfc2hhcmUgPSB0cnVlOw0KPiA+ICsjZW5kaWYNCj4gPiAr
DQo+ID4gICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9kZWJ1ZzsNCj4gPiAgIGJvb2xfdCBf
X3JlYWRfbW9zdGx5IGFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgPSAxOw0KPiA+DQo+ID4gQEAg
LTEwMiw4ICsxMDYsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfaW9tbXVfcGFyYW0oY29u
c3QgY2hhciAqcykNCj4gPiAgICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoID0g
dmFsOw0KPiA+ICAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImRvbTAt
c3RyaWN0Iiwgcywgc3MpKSA+PSAwICkNCj4gPiAgICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3N0
cmljdCA9IHZhbDsNCj4gPiArI2lmbmRlZiBpb21tdV9oYXBfcHRfc2hhcmUNCj4gPiAgICAgICAg
ICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywgc3MpKSA+PSAw
ICkNCj4gPiAgICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IHZhbDsNCj4gPiArI2Vu
ZGlmDQo+ID4gICAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmggYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2lvbW11LmgNCj4gPiBpbmRleCAxNTc3ZTgzZDJiLi43N2E5NGIyOWVi
IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaA0KPiA+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaA0KPiA+IEBAIC0yMCw5ICsyMCw2IEBAIHN0cnVj
dCBhcmNoX2lvbW11DQo+ID4gICAgICAgdm9pZCAqcHJpdjsNCj4gPiAgIH07DQo+ID4NCj4gPiAt
LyogQWx3YXlzIHNoYXJlIFAyTSBUYWJsZSBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBJT01NVSAq
Lw0KPiA+IC0jZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgaXNfaW9tbXVfZW5hYmxlZChkKQ0K
PiA+IC0NCj4gPiAgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X2dldF9vcHModm9pZCk7
DQo+ID4gICB2b2lkIGlvbW11X3NldF9vcHMoY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzKTsN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2lvbW11LmgNCj4gPiBpbmRleCA1MDcxYWZkNmE1Li44NTc0MWY3Yzk2
IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaA0KPiA+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaA0KPiA+IEBAIC04NiwxMCArODYsNiBAQCBzdHJ1
Y3QgaW9tbXVfaW5pdF9vcHMgew0KPiA+DQo+ID4gICBleHRlcm4gY29uc3Qgc3RydWN0IGlvbW11
X2luaXRfb3BzICppb21tdV9pbml0X29wczsNCj4gPg0KPiA+IC0vKiBBcmUgd2UgdXNpbmcgdGhl
IGRvbWFpbiBQMk0gdGFibGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8NCj4gPiAtI2RlZmlu
ZSBpb21tdV91c2VfaGFwX3B0KGQpIFwNCj4gPiAtICAgIChoYXBfZW5hYmxlZChkKSAmJiBpc19p
b21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9wdF9zaGFyZSkNCj4gPiAtDQo+ID4gICB2b2lk
IGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9hcGljKHVuc2lnbmVkIGludCBhcGljLCB1bnNpZ25lZCBp
bnQgcmVnLCB1bnNpZ25lZCBpbnQgdmFsdWUpOw0KPiA+ICAgdW5zaWduZWQgaW50IGlvbW11X3Jl
YWRfYXBpY19mcm9tX2lyZSh1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWduZWQgaW50IHJlZyk7DQo+
ID4gICBpbnQgaW9tbXVfc2V0dXBfaHBldF9tc2koc3RydWN0IG1zaV9kZXNjICopOw0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oDQo+ID4gaW5kZXggNGI2ODcxOTM2Yy4uODdmOTEyOWI5OSAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5o
DQo+ID4gQEAgLTU1LDcgKzU1LDEzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbF90IGRmbl9lcShkZm5f
dCB4LCBkZm5fdCB5KQ0KPiA+ICAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFibGUsIGlvbW11X2Vu
YWJsZWQ7DQo+ID4gICBleHRlcm4gYm9vbF90IGZvcmNlX2lvbW11LCBpb21tdV92ZXJib3NlLCBp
b21tdV9pZ2Z4Ow0KPiA+ICAgZXh0ZXJuIGJvb2xfdCBpb21tdV9zbm9vcCwgaW9tbXVfcWludmFs
LCBpb21tdV9pbnRyZW1hcCwgaW9tbXVfaW50cG9zdDsNCj4gPiAtZXh0ZXJuIGJvb2xfdCBpb21t
dV9oYXBfcHRfc2hhcmU7DQo+ID4gKw0KPiA+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPiA+ICsjZGVm
aW5lIGlvbW11X2hhcF9wdF9zaGFyZSB0cnVlDQo+ID4gKyNlbHNlDQo+ID4gK2V4dGVybiBib29s
IGlvbW11X2hhcF9wdF9zaGFyZTsNCj4gPiArI2VuZGlmDQo+IA0KPiBJIGRvbid0IHBhcnRpY3Vs
YXJseSBsaWtlICNpZmRlZiBDT05GSUdfPEFSQ0g+IGluIGNvbW1vbiBoZWFkZXIuIEhvdw0KPiBh
Ym91dCBvdGhlciBhcmNoPyBJIGNhbiBzZWUgdHdvIHNvbHV0aW9uczoNCj4gDQo+IDEpIE1vdmUg
dGhlIGRlZmluZSBpbiBhc20vaW9tbXUuaC4gVGhpcyB3b3VsZCByZXF1aXJlIHRvIG1vdmUgdGhl
DQo+IGRlY2xhcmF0aW9uIGEgYml0IGxhdGVyIGFuZCB0aGVuIHByb3RlY3QgYXMgeW91IGRpZCBp
biBpb21tdS5jDQo+IDIpIFJlcGxhY2UgQ09ORklHX0FSTSB3aXRoIGEgbmV3IEtjb25maWcgc2Vs
ZWN0ZWQgYnkgQXJtIG9ubHkgc28gZmFyLg0KPiANCg0KSSBoYWQgd29uZGVyZWQgYWJvdXQgYSBL
Y29uZmlnIGJ1dCBJIGNhbid0IHJlYWxseSB0aGluayBvZiBhIGdvb2QgbmFtZS4gSG93IGFib3V0
IENPTkZJR19GT1JDRV9QVF9TSEFSRT8NCg0KICBQYXVsDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
