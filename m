Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C15E2FF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:41:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidc3-0004wZ-PN; Wed, 03 Jul 2019 11:39:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hidc2-0004wU-RM
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:39:46 +0000
X-Inumbo-ID: 403a8388-9d87-11e9-9435-1b0d093b8060
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 403a8388-9d87-11e9-9435-1b0d093b8060;
 Wed, 03 Jul 2019 11:39:44 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 11:39:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 11:36:11 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 11:36:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3188.namprd18.prod.outlook.com (10.255.138.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 11:36:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 11:36:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFQ==
Date: Wed, 3 Jul 2019 11:36:10 +0000
Message-ID: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0065.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b257ce6d-764d-4e67-9b9a-08d6ffaaa55e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3188; 
x-ms-traffictypediagnostic: BY5PR18MB3188:
x-microsoft-antispam-prvs: <BY5PR18MB3188FAF2270CB383AE17EB31B3FB0@BY5PR18MB3188.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(478600001)(53936002)(81156014)(256004)(86362001)(71190400001)(80792005)(6916009)(8676002)(81166006)(31696002)(6512007)(25786009)(99286004)(4326008)(2906002)(14444005)(5660300002)(14454004)(68736007)(71200400001)(2501003)(2351001)(8936002)(6506007)(316002)(26005)(5640700003)(7736002)(52116002)(386003)(102836004)(54906003)(72206003)(6486002)(66556008)(64756008)(66446008)(73956011)(2616005)(66946007)(66476007)(6436002)(476003)(66066001)(6116002)(36756003)(486006)(186003)(3846002)(305945005)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3188;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vtOL5guX8NXaqQFO2iZFvlir5vvtlimFnHoj6m1zKjgMzib41xxvx8D2vOv7WJp2NmixVi2q5ocxAsNbzxookIH528y4VPqRDMaraYXXZcZLpN2jRFwukpI+ca4Q5VPfJAF5MsKZCGofkxVFauxg/ZC0PDJwaIvYYvYcF4qzJcKqI/51xSGsF2aAqdlhjUtYeHbHFvjRfMSB9tt6B9eVsgnXAbwt0ay5tJFguemkZND+3OIDN3nB86ehPWLq9Vt0ByrdO5nW69rH4uPX4G3XAD7i4lim59k5IqO2PqmWQJaCkVYTzmwgjcKenXTAZ9KhWDqtUBFwDP5JMPy3TPlgLl1/LjHQGyVFYJM98SZsp1w6KMRpMxTI+PNZ/1y5NKQiB8NCXvdEuedo2xsHaRYx9SWG3P+kkGb1VX4z0LZzYQ8=
Content-ID: <FE37AC395A53C947B805771535343069@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b257ce6d-764d-4e67-9b9a-08d6ffaaa55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:36:10.5686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3188
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkgb2YgdGhlIHR5cGUgY2FuJ3QgYmUgcmVwcmVzZW50
ZWQgaW4gSU9NTVUNCnBhZ2UgdGFibGUgZW50cmllcy4gTWFrZSBzdXJlIHRoZSByZXNwZWN0aXZl
IGNoZWNrcyAvIHRyYWNraW5nIGNhbid0DQpyYWNlLCBieSB1dGlsaXppbmcgdGhlIGRvbWFpbiBs
b2NrLiBUaGUgb3RoZXIgc2lkZXMgb2YgdGhlIHNoYXJpbmcvDQpwYWdpbmcvbG9nLWRpcnR5IGV4
Y2x1c2lvbiBjaGVja3Mgc2hvdWxkIHN1YnNlcXVlbnRseSBwZXJoYXBzIGFsc28gYmUNCnB1dCB1
bmRlciB0aGF0IGxvY2sgdGhlbi4NCg0KVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gY29u
dmVydCBuZWlnaGJvcmluZyBib29sX3QgdG8gYm9vbCBpbg0Kc3RydWN0IGh2bV9kb21haW4uDQoN
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCi0tLQ0KdjI6
IERvbid0IHNldCBwMm1fcmFtX3JvX3VzZWQgd2hlbiBmYWlsaW5nIHRoZSByZXF1ZXN0Lg0KDQot
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2RtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG0uYw0K
QEAgLTI1NSwxNiArMjU1LDMzIEBAIHN0YXRpYyBpbnQgc2V0X21lbV90eXBlKHN0cnVjdCBkb21h
aW4gKmQNCiAgDQogICAgICBtZW1fdHlwZSA9IGFycmF5X2luZGV4X25vc3BlYyhkYXRhLT5tZW1f
dHlwZSwgQVJSQVlfU0laRShtZW10eXBlKSk7DQogIA0KLSAgICBpZiAoIG1lbV90eXBlID09IEhW
TU1FTV9pb3JlcV9zZXJ2ZXIgKQ0KKyAgICBzd2l0Y2ggKCBtZW1fdHlwZSApDQogICAgICB7DQog
ICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzOw0KICANCisgICAgY2FzZSBIVk1NRU1faW9yZXFf
c2VydmVyOg0KICAgICAgICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkNCiAgICAgICAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOw0KICANCiAgICAgICAgICAvKiBEbyBub3QgY2hhbmdlIHRvIEhW
TU1FTV9pb3JlcV9zZXJ2ZXIgaWYgbm8gaW9yZXEgc2VydmVyIG1hcHBlZC4gKi8NCiAgICAgICAg
ICBpZiAoICFwMm1fZ2V0X2lvcmVxX3NlcnZlcihkLCAmZmxhZ3MpICkNCiAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQorDQorICAgICAgICBicmVhazsNCisNCisgICAgY2FzZSBIVk1NRU1f
cmFtX3JvOg0KKyAgICAgICAgLyogcDJtX3JhbV9ybyBjYW4ndCBiZSByZXByZXNlbnRlZCBpbiBJ
T01NVSBtYXBwaW5ncy4gKi8NCisgICAgICAgIGRvbWFpbl9sb2NrKGQpOw0KKyAgICAgICAgaWYg
KCBoYXNfaW9tbXVfcHQoZCkgKQ0KKyAgICAgICAgICAgIHJjID0gLUVYREVWOw0KKyAgICAgICAg
ZWxzZQ0KKyAgICAgICAgICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCA9IHRydWU7DQor
ICAgICAgICBkb21haW5fdW5sb2NrKGQpOw0KKw0KKyAgICAgICAgaWYgKCByYyApDQorICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KKw0KKyAgICAgICAgYnJlYWs7DQogICAgICB9DQogIA0KICAgICAg
d2hpbGUgKCBpdGVyIDwgZGF0YS0+bnIgKQ0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpAQCAtMTQ0OCwxNyAr
MTQ0OCwzNiBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqDQogICAg
ICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICFoZC0+cGxhdGZvcm1fb3BzICkNCiAgICAgICAgICBy
ZXR1cm4gMDsNCiAgDQotICAgIC8qIFByZXZlbnQgZGV2aWNlIGFzc2lnbiBpZiBtZW0gcGFnaW5n
IG9yIG1lbSBzaGFyaW5nIGhhdmUgYmVlbg0KLSAgICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFp
biAqLw0KLSAgICBpZiAoIHVubGlrZWx5KGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQg
fHwNCi0gICAgICAgICAgICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3Bh
Z2luZykgfHwNCisgICAgZG9tYWluX2xvY2soZCk7DQorDQorICAgIC8qDQorICAgICAqIFByZXZl
bnQgZGV2aWNlIGFzc2lnbm1lbnQgaWYgYW55IG9mDQorICAgICAqIC0gbWVtIHBhZ2luZw0KKyAg
ICAgKiAtIG1lbSBzaGFyaW5nDQorICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQ0KKyAgICAg
KiAtIGdsb2JhbCBsb2ctZGlydHkgbW9kZQ0KKyAgICAgKiBhcmUgaW4gdXNlIGJ5IHRoaXMgZG9t
YWluLg0KKyAgICAgKi8NCisgICAgaWYgKCB1bmxpa2VseSh2bV9ldmVudF9jaGVja19yaW5nKGQt
PnZtX2V2ZW50X3BhZ2luZykgfHwNCisjaWZkZWYgQ09ORklHX0hWTQ0KKyAgICAgICAgICAgICAg
ICAgIChpc19odm1fZG9tYWluKGQpICYmDQorICAgICAgICAgICAgICAgICAgIChkLT5hcmNoLmh2
bS5tZW1fc2hhcmluZ19lbmFibGVkIHx8DQorICAgICAgICAgICAgICAgICAgICBkLT5hcmNoLmh2
bS5wMm1fcmFtX3JvX3VzZWQpKSB8fA0KKyNlbmRpZg0KICAgICAgICAgICAgICAgICAgICBwMm1f
Z2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0KKyAgICB7DQorICAgICAgICBkb21h
aW5fdW5sb2NrKGQpOw0KICAgICAgICAgIHJldHVybiAtRVhERVY7DQorICAgIH0NCiAgDQogICAg
ICBpZiAoICFwY2lkZXZzX3RyeWxvY2soKSApDQorICAgIHsNCisgICAgICAgIGRvbWFpbl91bmxv
Y2soZCk7DQogICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsNCisgICAgfQ0KICANCiAgICAgIHJj
ID0gaW9tbXVfY29uc3RydWN0KGQpOw0KKyAgICBkb21haW5fdW5sb2NrKGQpOw0KICAgICAgaWYg
KCByYyApDQogICAgICB7DQogICAgICAgICAgcGNpZGV2c191bmxvY2soKTsNCi0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9kb21haW4uaA0KQEAgLTE1NiwxMCArMTU2LDExIEBAIHN0cnVjdCBodm1fZG9tYWluIHsNCiAg
DQogICAgICBzdHJ1Y3QgdmlyaWRpYW5fZG9tYWluICp2aXJpZGlhbjsNCiAgDQotICAgIGJvb2xf
dCAgICAgICAgICAgICAgICAgaGFwX2VuYWJsZWQ7DQotICAgIGJvb2xfdCAgICAgICAgICAgICAg
ICAgbWVtX3NoYXJpbmdfZW5hYmxlZDsNCi0gICAgYm9vbF90ICAgICAgICAgICAgICAgICBxZW11
X21hcGNhY2hlX2ludmFsaWRhdGU7DQotICAgIGJvb2xfdCAgICAgICAgICAgICAgICAgaXNfczNf
c3VzcGVuZGVkOw0KKyAgICBib29sICAgICAgICAgICAgICAgICAgIGhhcF9lbmFibGVkOw0KKyAg
ICBib29sICAgICAgICAgICAgICAgICAgIG1lbV9zaGFyaW5nX2VuYWJsZWQ7DQorICAgIGJvb2wg
ICAgICAgICAgICAgICAgICAgcDJtX3JhbV9yb191c2VkOw0KKyAgICBib29sICAgICAgICAgICAg
ICAgICAgIHFlbXVfbWFwY2FjaGVfaW52YWxpZGF0ZTsNCisgICAgYm9vbCAgICAgICAgICAgICAg
ICAgICBpc19zM19zdXNwZW5kZWQ7DQogIA0KICAgICAgLyoNCiAgICAgICAqIFRTQyB2YWx1ZSB0
aGF0IFZDUFVzIHVzZSB0byBjYWxjdWxhdGUgdGhlaXIgdHNjX29mZnNldCB2YWx1ZS4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
