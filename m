Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54B5E4D4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiexl-0004f9-9R; Wed, 03 Jul 2019 13:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiexj-0004ew-UB
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:06:15 +0000
X-Inumbo-ID: 548f691e-9d93-11e9-9437-771ce69894bc
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 548f691e-9d93-11e9-9437-771ce69894bc;
 Wed, 03 Jul 2019 13:06:12 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:06:11 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:01:49 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:01:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3393.namprd18.prod.outlook.com (10.255.136.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 13:01:48 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:01:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVMZ95Pg5KTi9KKk6xsZ3jj2BciA==
Date: Wed, 3 Jul 2019 13:01:48 +0000
Message-ID: <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
In-Reply-To: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::32)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bca7c7d-8d7b-4591-dc1d-08d6ffb69bc3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3393; 
x-ms-traffictypediagnostic: BY5PR18MB3393:
x-microsoft-antispam-prvs: <BY5PR18MB3393935AF844F096F7D49796B3FB0@BY5PR18MB3393.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(189003)(199004)(6512007)(316002)(476003)(36756003)(71190400001)(76176011)(54906003)(53936002)(4326008)(2501003)(80792005)(446003)(11346002)(31686004)(14444005)(256004)(26005)(5660300002)(99286004)(72206003)(2616005)(71200400001)(14454004)(486006)(186003)(305945005)(52116002)(68736007)(25786009)(2906002)(64756008)(73956011)(3846002)(66946007)(102836004)(66476007)(66066001)(6486002)(8676002)(81166006)(6916009)(386003)(81156014)(66556008)(6506007)(478600001)(31696002)(6436002)(66446008)(8936002)(7736002)(5640700003)(2351001)(86362001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3393;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /klbCjr5MVx+2x9rCTR6Fwd03Y7zJ5HF9ztumj1Vf90uhaD1PpjExgzBsB5OFFlhoEO7SKwkvJCuaga3an6+Q+6U5h5iK5A6pabWgdMChBtt75LqBXugpY4Ybp/ftBMf1xElGdj0zq5hOuLVWmPrC0rFFy1aVxUpkITHDUXyNFEdrocR8c4ArXU/JkAN8nQHvae512D8ruBfgl/sD3m4UpKZvfI6RS9+3B5s9WW19ao2cW/Rll9qti2devN7Y0SYJs7hCUwiWTm7OnCaEYttz2dtA06Hi/p9+omKzWzL1969rtuhO/a36qccQe6IVBj6IZnuJvVQ7uUrYthOTvrOSlwGyb+t4Yafcidc9juBA+sQtCrPXUKGj/oOH224XR81NOAaBTBhyznbPuTaDtzoonE+WrgHR6YNKchEuZ7qSv0=
Content-ID: <67CBFD6AE5019A419456A35A66782C37@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bca7c7d-8d7b-4591-dc1d-08d6ffb69bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:01:48.3917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3393
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgbGVhc3QgZm9yIG1vcmUgcmVjZW50IENQVXMsIGZvbGxvd2luZyB3aGF0IEJLREcgLyBQUFIg
c3VnZ2VzdCBmb3IgdGhlDQpCSU9TIHRvIHN1cmZhY2UgdmlhIEFDUEkgd2UgY2FuIG1ha2Ugb3Vy
c2VsdmVzIGluZGVwZW5kZW50IG9mIERvbTANCnVwbG9hZGluZyByZXNwZWN0aXZlIGRhdGEuDQoN
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCi0tLQ0KdjI6
IEhhbmRsZSBIeWdvbiBGYW0xOC4gU2V0IGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgKGZvciBGYW0x
NyBhbmQgSHlnb24NCiAgICAgRmFtMTggb25seSBmb3Igbm93KS4NCi0tLQ0KVEJEOiBXZSBtYXkg
d2FudCB0byB2ZXJpZnkgdGhhdCBITFQgaW5kZWVkIGlzIGNvbmZpZ3VyZWQgdG8gZW50ZXIgQ0M2
Lg0KVEJEOiBCcmlhbidzIHNlcmllcyBzcGVjaWZpZXMgLnRhcmdldF9yZXNpZGVuY3kgYXMgMTAw
MCBmb3IgQ0M2OyBtYXkNCiAgICAgIHdhbnQgdG8gZG8gc28gaGVyZSBhcyB3ZWxsLiBRdWVzdGlv
biB0aGVuIGlzIHdoZXRoZXIgdGhpcyB2YWx1ZSBpcw0KICAgICAgYWxzbyBzdWl0YWJsZSBmb3Ig
dGhlIG9sZGVyIGZhbWlsaWVzLg0KVEJEOiBJIGd1ZXNzIHdlIGNvdWxkIGV4dGVuZCB0aGlzIHRv
IGZhbWlsaWVzIG9sZGVyIHRoZW4gRmFtMTUgYXMgd2VsbC4NCg0KLS0tIGEveGVuL2FyY2gveDg2
L2FjcGkvY3B1X2lkbGUuYw0KKysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KQEAg
LTExMCw2ICsxMTAsOCBAQCBib29sZWFuX3BhcmFtKCJsYXBpY190aW1lcl9jMl9vayIsIGxvY2Fs
DQogIA0KICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKl9fcmVhZF9tb3N0bHkgcHJvY2Vz
c29yX3Bvd2Vyc1tOUl9DUFVTXTsNCiAgDQorc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IHZl
bmRvcl9vdmVycmlkZTsNCisNCiAgc3RydWN0IGh3X3Jlc2lkZW5jaWVzDQogIHsNCiAgICAgIHVp
bnQ2NF90IG1jMDsNCkBAIC0xMjE0LDYgKzEyMTYsOSBAQCBsb25nIHNldF9jeF9wbWluZm8odWlu
dDMyX3QgYWNwaV9pZCwgc3RyDQogICAgICBpZiAoIHBtX2lkbGVfc2F2ZSAmJiBwbV9pZGxlICE9
IGFjcGlfcHJvY2Vzc29yX2lkbGUgKQ0KICAgICAgICAgIHJldHVybiAwOw0KICANCisgICAgaWYg
KCB2ZW5kb3Jfb3ZlcnJpZGUgPiAwICkNCisgICAgICAgIHJldHVybiAwOw0KKw0KICAgICAgcHJp
bnRfY3hfcG1pbmZvKGFjcGlfaWQsIHBvd2VyKTsNCiAgDQogICAgICBjcHVfaWQgPSBnZXRfY3B1
X2lkKGFjcGlfaWQpOw0KQEAgLTEyODYsNiArMTI5MSwxMDMgQEAgbG9uZyBzZXRfY3hfcG1pbmZv
KHVpbnQzMl90IGFjcGlfaWQsIHN0cg0KICAgICAgcmV0dXJuIDA7DQogIH0NCiAgDQorc3RhdGlj
IHZvaWQgYW1kX2NwdWlkbGVfaW5pdChzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKnBvd2Vy
KQ0KK3sNCisgICAgdW5zaWduZWQgaW50IGksIG5yID0gMDsNCisgICAgY29uc3Qgc3RydWN0IGNw
dWluZm9feDg2ICpjID0gJmN1cnJlbnRfY3B1X2RhdGE7DQorICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCBlY3hfcmVxID0gQ1BVSUQ1X0VDWF9FWFRFTlNJT05TX1NVUFBPUlRFRCB8DQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQ1BVSUQ1X0VDWF9JTlRFUlJVUFRfQlJFQUs7DQorICAg
IGNvbnN0IHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9jeCAqY3ggPSBOVUxMOw0KKyAgICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4IGZhbTE3W10gPSB7DQorICAgICAgICB7DQor
ICAgICAgICAgICAgLnR5cGUgPSBBQ1BJX1NUQVRFX0MxLA0KKyAgICAgICAgICAgIC5lbnRyeV9t
ZXRob2QgPSBBQ1BJX0NTVEFURV9FTV9GRkgsDQorICAgICAgICAgICAgLmFkZHJlc3MgPSAwLA0K
KyAgICAgICAgICAgIC5sYXRlbmN5ID0gMSwNCisgICAgICAgIH0sDQorICAgICAgICB7DQorICAg
ICAgICAgICAgLnR5cGUgPSBBQ1BJX1NUQVRFX0MyLA0KKyAgICAgICAgICAgIC5lbnRyeV9tZXRo
b2QgPSBBQ1BJX0NTVEFURV9FTV9IQUxULA0KKyAgICAgICAgICAgIC5sYXRlbmN5ID0gNDAwLA0K
KyAgICAgICAgfSwNCisgICAgfTsNCisNCisgICAgaWYgKCBwbV9pZGxlX3NhdmUgJiYgcG1faWRs
ZSAhPSBhY3BpX3Byb2Nlc3Nvcl9pZGxlICkNCisgICAgICAgIHJldHVybjsNCisNCisgICAgaWYg
KCB2ZW5kb3Jfb3ZlcnJpZGUgPCAwICkNCisgICAgICAgIHJldHVybjsNCisNCisgICAgc3dpdGNo
ICggYy0+eDg2ICkNCisgICAgew0KKyAgICBjYXNlIDB4MTg6DQorICAgICAgICBpZiAoIGJvb3Rf
Y3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0hZR09OICkNCisgICAgICAgIHsNCisg
ICAgZGVmYXVsdDoNCisgICAgICAgICAgICB2ZW5kb3Jfb3ZlcnJpZGUgPSAtMTsNCisgICAgICAg
ICAgICByZXR1cm47DQorICAgICAgICB9DQorICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8NCisg
ICAgY2FzZSAweDE3Og0KKyAgICAgICAgaWYgKCBjcHVfaGFzX21vbml0b3IgJiYgYy0+Y3B1aWRf
bGV2ZWwgPj0gQ1BVSURfTVdBSVRfTEVBRiAmJg0KKyAgICAgICAgICAgICAoY3B1aWRfZWN4KENQ
VUlEX01XQUlUX0xFQUYpICYgZWN4X3JlcSkgPT0gZWN4X3JlcSApDQorICAgICAgICB7DQorICAg
ICAgICAgICAgY3ggPSBmYW0xNzsNCisgICAgICAgICAgICBuciA9IEFSUkFZX1NJWkUoZmFtMTcp
Ow0KKyAgICAgICAgICAgIGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgPSB0cnVlOw0KKyAgICAgICAg
ICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKyAgICAgICAgLyogZmFsbCB0aHJvdWdoICovDQorICAg
IGNhc2UgMHgxNToNCisgICAgY2FzZSAweDE2Og0KKyAgICAgICAgY3ggPSAmZmFtMTdbMV07DQor
ICAgICAgICBuciA9IEFSUkFZX1NJWkUoZmFtMTcpIC0gMTsNCisgICAgICAgIGJyZWFrOw0KKyAg
ICB9DQorDQorICAgIHBvd2VyLT5mbGFncy5oYXNfY3N0ID0gdHJ1ZTsNCisNCisgICAgZm9yICgg
aSA9IDA7IGkgPCBucjsgKytpICkNCisgICAgew0KKyAgICAgICAgaWYgKCBjeFtpXS50eXBlID4g
bWF4X2NzdGF0ZSApDQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICBwb3dlci0+c3RhdGVz
W2kgKyAxXSA9IGN4W2ldOw0KKyAgICAgICAgcG93ZXItPnN0YXRlc1tpICsgMV0uaWR4ID0gaSAr
IDE7DQorICAgICAgICBwb3dlci0+c3RhdGVzW2kgKyAxXS50YXJnZXRfcmVzaWRlbmN5ID0gY3hb
aV0ubGF0ZW5jeSAqIGxhdGVuY3lfZmFjdG9yOw0KKyAgICB9DQorDQorICAgIGlmICggaSApDQor
ICAgIHsNCisgICAgICAgIHBvd2VyLT5jb3VudCA9IGkgKyAxOw0KKyAgICAgICAgcG93ZXItPnNh
ZmVfc3RhdGUgPSAmcG93ZXItPnN0YXRlc1tpXTsNCisNCisgICAgICAgIGlmICggIXZlbmRvcl9v
dmVycmlkZSApDQorICAgICAgICB7DQorICAgICAgICAgICAgaWYgKCAhYm9vdF9jcHVfaGFzKFg4
Nl9GRUFUVVJFX0FSQVQpICkNCisgICAgICAgICAgICAgICAgaHBldF9icm9hZGNhc3RfaW5pdCgp
Ow0KKw0KKyAgICAgICAgICAgIGlmICggIWxhcGljX3RpbWVyX2luaXQoKSApDQorICAgICAgICAg
ICAgew0KKyAgICAgICAgICAgICAgICB2ZW5kb3Jfb3ZlcnJpZGUgPSAtMTsNCisgICAgICAgICAg
ICAgICAgY3B1aWRsZV9pbml0X2NwdShwb3dlci0+Y3B1KTsNCisgICAgICAgICAgICAgICAgcmV0
dXJuOw0KKyAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICBpZiAoICFwbV9pZGxlX3NhdmUg
KQ0KKyAgICAgICAgICAgIHsNCisgICAgICAgICAgICAgICAgcG1faWRsZV9zYXZlID0gcG1faWRs
ZTsNCisgICAgICAgICAgICAgICAgcG1faWRsZSA9IGFjcGlfcHJvY2Vzc29yX2lkbGU7DQorICAg
ICAgICAgICAgfQ0KKw0KKyAgICAgICAgICAgIGRlYWRfaWRsZSA9IGFjcGlfZGVhZF9pZGxlOw0K
Kw0KKyAgICAgICAgICAgIHZlbmRvcl9vdmVycmlkZSA9IDE7DQorICAgICAgICB9DQorICAgIH0N
CisgICAgZWxzZQ0KKyAgICAgICAgdmVuZG9yX292ZXJyaWRlID0gLTE7DQorfQ0KKw0KICB1aW50
MzJfdCBwbXN0YXRfZ2V0X2N4X25yKHVpbnQzMl90IGNwdWlkKQ0KICB7DQogICAgICByZXR1cm4g
cHJvY2Vzc29yX3Bvd2Vyc1tjcHVpZF0gPyBwcm9jZXNzb3JfcG93ZXJzW2NwdWlkXS0+Y291bnQg
OiAwOw0KQEAgLTE0MzIsOCArMTUzNCw4IEBAIHN0YXRpYyBpbnQgY3B1X2NhbGxiYWNrKA0KICAg
ICAgaW50IHJjID0gMDsNCiAgDQogICAgICAvKg0KLSAgICAgKiBPbmx5IGhvb2sgb24gQ1BVX1VQ
X1BSRVBBUkUgYmVjYXVzZSBhIGRlYWQgY3B1IG1heSB1dGlsaXplIHRoZSBpbmZvDQotICAgICAq
IHRvIGVudGVyIGRlZXAgQy1zdGF0ZS4NCisgICAgICogT25seSBob29rIG9uIENQVV9VUF9QUkVQ
QVJFIC8gQ1BVX09OTElORSBiZWNhdXNlIGEgZGVhZCBjcHUgbWF5IHV0aWxpemUNCisgICAgICog
dGhlIGluZm8gdG8gZW50ZXIgZGVlcCBDLXN0YXRlLg0KICAgICAgICovDQogICAgICBzd2l0Y2gg
KCBhY3Rpb24gKQ0KICAgICAgew0KQEAgLTE0NDIsNiArMTU0NCwxMyBAQCBzdGF0aWMgaW50IGNw
dV9jYWxsYmFjaygNCiAgICAgICAgICBpZiAoICFyYyAmJiBjcHVpZGxlX2N1cnJlbnRfZ292ZXJu
b3ItPmVuYWJsZSApDQogICAgICAgICAgICAgIHJjID0gY3B1aWRsZV9jdXJyZW50X2dvdmVybm9y
LT5lbmFibGUocHJvY2Vzc29yX3Bvd2Vyc1tjcHVdKTsNCiAgICAgICAgICBicmVhazsNCisNCisg
ICAgY2FzZSBDUFVfT05MSU5FOg0KKyAgICAgICAgaWYgKCAoYm9vdF9jcHVfZGF0YS54ODZfdmVu
ZG9yICYNCisgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04p
KSAmJg0KKyAgICAgICAgICAgICBwcm9jZXNzb3JfcG93ZXJzW2NwdV0gKQ0KKyAgICAgICAgICAg
IGFtZF9jcHVpZGxlX2luaXQocHJvY2Vzc29yX3Bvd2Vyc1tjcHVdKTsNCisgICAgICAgIGJyZWFr
Ow0KICAgICAgfQ0KICANCiAgICAgIHJldHVybiAhcmMgPyBOT1RJRllfRE9ORSA6IG5vdGlmaWVy
X2Zyb21fZXJybm8ocmMpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
