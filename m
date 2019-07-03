Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28F5E3B6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 14:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hieEx-00004s-6O; Wed, 03 Jul 2019 12:19:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hieEv-0008WT-Fx
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 12:19:57 +0000
X-Inumbo-ID: dd5f16bf-9d8c-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd5f16bf-9d8c-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 12:19:56 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 12:19:34 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 12:18:46 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 12:18:46 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3169.namprd18.prod.outlook.com (10.255.139.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 12:18:45 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 12:18:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] IOMMU/x86: make page type checks consistent when
 mapping pages
Thread-Index: AQHVMZl1oVr/rIHCQkayQ81xVALqHQ==
Date: Wed, 3 Jul 2019 12:18:45 +0000
Message-ID: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0038.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab400fc-5f52-46bb-ce7c-08d6ffb097f4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3169; 
x-ms-traffictypediagnostic: BY5PR18MB3169:
x-microsoft-antispam-prvs: <BY5PR18MB3169F15919E93688CD05F748B3FB0@BY5PR18MB3169.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(199004)(189003)(14444005)(71200400001)(31696002)(476003)(64756008)(71190400001)(36756003)(486006)(8936002)(66476007)(66946007)(72206003)(66446008)(66556008)(25786009)(5660300002)(2351001)(256004)(86362001)(2616005)(73956011)(14454004)(31686004)(81166006)(81156014)(26005)(386003)(52116002)(6486002)(68736007)(6436002)(8676002)(2501003)(102836004)(99286004)(6506007)(478600001)(6116002)(2906002)(7736002)(66066001)(5640700003)(53936002)(80792005)(6916009)(186003)(4326008)(6512007)(316002)(54906003)(305945005)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3169;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LB9nZb3o65iIld5E7md3kcmPLkWQCZTJ55bJdKJYVkdPvtk2IkLR1Zy4MF+r5U5DO/7uefkwv5WXwFShysGYheQqETsGgZ8F4F0xw56Y8hsBPBXimVCssrJ6LDLqjIIyxD2bq8TPOvbQWOCGakb67hU6TAJaJ6gC/Y/UWNi3KLPr++3RwYHGhA5Yxboe5EqbbByjyDkpB9ek6/ePrwnPApNSMJgW/aVlARxdmPYID1kECYPQ+l35Em6LIe92+YjFRA0C5rFSvovpmoqu5DxXNLfACd+lk/k9imdc7R4fhKMckFGlMx+Z/MeT/R6j6q62Lg+xykRVdQokwRSqMgdk0r/JLpsk+4HJ0WckHilCMkba0Krsq0wSExZ2KIlPSOXeVsHccw8TZEnv6JsWz/9m0OG63qKDK0WblhcxoeKVhf8=
Content-ID: <487AF1EC392A3F48B46D25E841A78891@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab400fc-5f52-46bb-ce7c-08d6ffb097f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 12:18:45.0402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3169
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks consistent
 when mapping pages
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGN1cnJlbnRseSB0aHJlZSBtb3JlIG9yIGxlc3MgZGlmZmVyZW50IGNoZWNrczoN
Ci0gX2dldF9wYWdlX3R5cGUoKSBhZGp1c3RzIHRoZSBJT01NVSBtYXBwaW5ncyBhY2NvcmRpbmcg
dG8gdGhlIG5ldyB0eXBlDQogICBhbG9uZSwNCi0gYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3Rh
YmxlKCkgd2FudHMganVzdCB0aGUgdHlwZSB0byBiZQ0KICAgUEdUX3dyaXRhYmxlX3BhZ2UsDQot
IGlvbW11X2h3ZG9tX2luaXQoKSBhZGRpdGlvbmFsbHkgcGVybWl0cyBhbGwgb3RoZXIgdHlwZXMg
d2l0aCBhIHR5cGUNCiAgIHJlZmNvdW50IG9mIHplcm8uDQpUaGUgY2Fub25pY2FsIG9uZSBpcyBp
biBfZ2V0X3BhZ2VfdHlwZSgpLCBhbmQgYXMgb2YgWFNBLTI4OA0KYXJjaF9pb21tdV9wb3B1bGF0
ZV9wYWdlX3RhYmxlKCkgYWxzbyBoYXMgbm8gbmVlZCBhbnltb3JlIHRvIGRlYWwgd2l0aA0KUEdU
X25vbmUgcGFnZXMuIEluIHRoZSBQViBEb20wIGNhc2UsIGhvd2V2ZXIsIFBHVF9ub25lIHBhZ2Vz
IGFyZSBzdGlsbA0KbmVjZXNzYXJ5IHRvIGNvbnNpZGVyLCBzaW5jZSBpbiB0aGF0IGNhc2UgcGFn
ZXMgZG9uJ3QgZ2V0IGhhbmRlZCB0bw0KZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKS4gRnVydGhl
cm1vcmUsIHRoZSBmdW5jdGlvbiBzbyBmYXIgYWxzbw0KZXN0YWJsaXNoZWQgci9vIG1hcHBpbmdz
LCB3aGljaCBpcyBub3QgaW4gbGluZSB3aXRoIHRoZSBydWxlcyBzZXQgZm9ydGgNCmJ5IHRoZSBY
U0EtMjg4IGNoYW5nZS4NCg0KRm9yIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSgpIHRv
IG5vdCBlbmNvdW50ZXIgUEdUX25vbmUgcGFnZXMNCmFueW1vcmUgZXZlbiBpbiBjYXNlcyB3aGVy
ZSB0aGUgSU9NTVUgZ2V0cyBlbmFibGVkIGZvciBhIGRvbWFpbiBvbmx5DQp3aGVuIGl0IGlzIGFs
cmVhZHkgcnVubmluZywgcmVwbGFjZSB0aGUgSU9NTVUgZGVwZW5kZW5jeSBpbg0KZ3Vlc3RfcGh5
c21hcF9hZGRfZW50cnkoKSdzIGhhbmRsaW5nIG9mIFBWIGd1ZXN0cyB0byBjaGVjayBqdXN0IHRo
ZQ0Kc3lzdGVtIHdpZGUgc3RhdGUgaW5zdGVhZCBvZiB0aGUgZG9tYWluIHByb3BlcnR5Lg0KDQpV
bmZvcnR1bmF0ZWx5IChwYXJ0aWFsbHkpIHJlcGxhY2luZyB0aGUgaW9tbXVfbWFwKCkgY2FsbCBp
bg0KaW9tbXVfaHdkb21faW5pdCgpIGltcGxpZXMgcmVzdXJyZWN0aW5nIHRoZSBmbHVzaCBzdXBw
cmVzc2lvbiB0aGF0IGdvdA0KcHJldmlvdXNseSBlbGltaW5hdGVkLiBOb3RlIHRoYXQgdGhlIGNh
bGwgdG8gaW9tbXVfbWFwKCkgY2FuJ3QgYmUNCnJlbW92ZWQgYXQgdGhpcyBwb2ludCBpbiB0aW1l
IC0gRG9tMCdzIGluaXRpYWwgYWxsb2NhdGlvbiBnZXRzIGl0cyBwYWdlDQp0eXBlcyBzZXQgYmVm
b3JlIGlvbW11X2h3ZG9tX2luaXQoKSBydW5zLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCnYzOiBSZS1iYXNlLg0KdjI6IEZpeCBJT1RMQiBm
bHVzaGluZy4gRXhjbHVkZSBQVkguIFVzZSB0eXBlIHNhZmUgbG9jYWwgdmFyaWFibGVzLg0KDQot
LS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0K
QEAgLTgyOSwxMyArODI5LDEzIEBAIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uoc3RydWN0IGRvbWFp
biAqZCwNCiAgICAgICAgICAgKg0KICAgICAgICAgICAqIFJldGFpbiB0aGlzIHByb3BlcnR5IGJ5
IGdyYWJiaW5nIGEgd3JpdGFibGUgdHlwZSByZWYgYW5kIHRoZW4NCiAgICAgICAgICAgKiBkcm9w
cGluZyBpdCBpbW1lZGlhdGVseS4gIFRoZSByZXN1bHQgd2lsbCBiZSBwYWdlcyB0aGF0IGhhdmUg
YQ0KLSAgICAgICAgICogd3JpdGFibGUgdHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5KSwgYnV0IGEg
Y291bnQgb2YgMCAoc3VjaCB0aGF0DQotICAgICAgICAgKiBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5
cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhlIElPTU1VDQotICAgICAgICAgKiBlbnRy
eSkuDQorICAgICAgICAgKiB3cml0YWJsZSB0eXBlIChhbmQgYW4gSU9NTVUgZW50cnkgaWYgbmVj
ZXNzYXJ5KSwgYnV0IGEgY291bnQgb2YgMA0KKyAgICAgICAgICogKHN1Y2ggdGhhdCBhbnkgZ3Vl
c3QtcmVxdWVzdGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhlDQorICAgICAg
ICAgKiBJT01NVSBlbnRyeSkuDQogICAgICAgICAgICovDQogICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCAoMVVMIDw8IHBhZ2Vfb3JkZXIpOyArK2ksICsrcGFnZSApDQogICAgICAgICAgew0KLSAg
ICAgICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApDQorICAgICAgICAgICAgaWYg
KCAhaW9tbXVfZW5hYmxlZCApDQogICAgICAgICAgICAgICAgICAvKiBub3RoaW5nICovOw0KICAg
ICAgICAgICAgICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRh
YmxlX3BhZ2UpICkNCiAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOw0K
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW9tbXUuYw0KQEAgLTE5MiwyOCArMTkyLDQ2IEBAIHZvaWQgX19od2RvbV9p
bml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWMNCiAgICAgICAgICB1bnNpZ25lZCBpbnQgaSA9IDAs
IGZsdXNoX2ZsYWdzID0gMDsNCiAgICAgICAgICBpbnQgcmMgPSAwOw0KICANCisgICAgICAgIHRo
aXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIpID0gdHJ1ZTsNCisNCiAgICAgICAgICBwYWdl
X2xpc3RfZm9yX2VhY2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkNCiAgICAgICAgICB7DQotICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7DQot
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZm4gPSBtZm5fdG9fZ21mbihkLCBtZm4pOw0KLSAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBtYXBwaW5nID0gSU9NTVVGX3JlYWRhYmxlOw0KLSAgICAg
ICAgICAgIGludCByZXQ7DQotDQotICAgICAgICAgICAgaWYgKCAoKHBhZ2UtPnUuaW51c2UudHlw
ZV9pbmZvICYgUEdUX2NvdW50X21hc2spID09IDApIHx8DQotICAgICAgICAgICAgICAgICAoKHBh
Z2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX3R5cGVfbWFzaykNCi0gICAgICAgICAgICAgICAg
ICA9PSBQR1Rfd3JpdGFibGVfcGFnZSkgKQ0KLSAgICAgICAgICAgICAgICBtYXBwaW5nIHw9IElP
TU1VRl93cml0YWJsZTsNCi0NCi0gICAgICAgICAgICByZXQgPSBpb21tdV9tYXAoZCwgX2Rmbihk
Zm4pLCBfbWZuKG1mbiksIDAsIG1hcHBpbmcsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZmbHVzaF9mbGFncyk7DQotDQotICAgICAgICAgICAgaWYgKCAhcmMgKQ0KLSAgICAgICAgICAg
ICAgICByYyA9IHJldDsNCisgICAgICAgICAgICBzd2l0Y2ggKCBwYWdlLT51LmludXNlLnR5cGVf
aW5mbyAmIFBHVF90eXBlX21hc2sgKQ0KKyAgICAgICAgICAgIHsNCisgICAgICAgICAgICBjYXNl
IFBHVF9ub25lOg0KKyAgICAgICAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSApDQorICAg
ICAgICAgICAgICAgIHsNCisgICAgICAgICAgICAgICAgICAgIEFTU0VSVCghKHBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spKTsNCisgICAgICAgICAgICAgICAgICAgIGlm
ICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3BhZ2UpICkNCisgICAg
ICAgICAgICAgICAgICAgIHsNCisgICAgICAgICAgICAgICAgICAgICAgICBwdXRfcGFnZV9hbmRf
dHlwZShwYWdlKTsNCisgICAgICAgICAgICAgICAgICAgICAgICBmbHVzaF9mbGFncyB8PSBJT01N
VUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGU7DQorICAgICAgICAgICAgICAgICAgICB9DQor
ICAgICAgICAgICAgICAgICAgICBlbHNlIGlmICggIXJjICkNCisgICAgICAgICAgICAgICAgICAg
ICAgICByYyA9IC1FQlVTWTsNCisgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAg
ICAgICAgICB9DQorICAgICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLw0KKyAgICAgICAg
ICAgIGNhc2UgUEdUX3dyaXRhYmxlX3BhZ2U6DQorICAgICAgICAgICAgew0KKyAgICAgICAgICAg
ICAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21mbihwYWdlKTsNCisgICAgICAgICAgICAgICAgZGZu
X3QgZGZuID0gX2RmbihtZm5fdG9fZ21mbihkLCBtZm5feChtZm4pKSk7DQorICAgICAgICAgICAg
ICAgIGludCByZXQgPSBpb21tdV9tYXAoZCwgZGZuLCBtZm4sIDAsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlLA0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZmbHVzaF9mbGFncyk7DQorDQor
ICAgICAgICAgICAgICAgIGlmICggIXJjICkNCisgICAgICAgICAgICAgICAgICAgIHJjID0gcmV0
Ow0KKyAgICAgICAgICAgICAgICBicmVhazsNCisgICAgICAgICAgICB9DQorICAgICAgICAgICAg
fQ0KICANCiAgICAgICAgICAgICAgaWYgKCAhKGkrKyAmIDB4ZmZmZmYpICkNCiAgICAgICAgICAg
ICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KICAgICAgICAgIH0NCiAgDQorICAg
ICAgICB0aGlzX2NwdShpb21tdV9kb250X2ZsdXNoX2lvdGxiKSA9IGZhbHNlOw0KKw0KICAgICAg
ICAgIC8qIFVzZSB3aGlsZS1icmVhayB0byBhdm9pZCBjb21waWxlciB3YXJuaW5nICovDQogICAg
ICAgICAgd2hpbGUgKCBpb21tdV9pb3RsYl9mbHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpICkNCiAg
ICAgICAgICAgICAgYnJlYWs7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
