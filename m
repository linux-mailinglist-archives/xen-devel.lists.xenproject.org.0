Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F056FB94
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:46:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTv0-0003qe-4L; Mon, 22 Jul 2019 08:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpTuy-0003qZ-8r
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:43:36 +0000
X-Inumbo-ID: c7425908-ac5c-11e9-b1c3-1ff289d6f99e
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7425908-ac5c-11e9-b1c3-1ff289d6f99e;
 Mon, 22 Jul 2019 08:43:31 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 08:43:21 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 08:43:07 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 08:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAKzpMgwP9Kz3TBRdfE1XQvkstgHvhGeIAvHVSulCL96hd11nG2sW58gXeKxKMhpotrJRqnHDltmIPy5Rphw+r7q+dIp8rAAkWNnm3HUD/HpkvqmmBUKcOP6mxQuO/jUsz/dEJqtXSTdVE6qf2xlXCsgtYvxffmsko6lAKGA+6KAJNiCjoDftnal6M7Pjtvs2ccS9qJMHfwMcinRISoC28MrXrcLYxghJWPhelhDWV4urzikVAbKgXky/g76mScun6ge4I/C82IhjHrdvT9b5wji910P4yNF8UwlXAx0G1P4LjhsA7F0gzql/EBbLNtTrj0n4kCVibb8c+bfJINwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7FapuaD/MAWLLQgTLKygLeC4EE134le1RVGaarfnrw=;
 b=J7GWKS5m+MtDh3+SxGp/Q/tx/ouvtg4/9CHrsmt6y9jrRy2cMkENDEMbwUPUy1+hMv42YPOO859u3fExncfbp6aQEtRa2x4KXahk0XF5G2NFN8aJBlToLxOd6gaLhzezz1BtOE0Nb82eLj5Y7Snp4a6IB8dNRyvUsIlQpYsf2ysoCX4/VY8dolYs3XZZo49FOA2kHUbek/1XZaP3583UeJtmGbPt9Ciu91JQtSEKunwEqZHo2I4SKScvcaWK5ijvuaEaauHIHUsBgaQMIRnGKvP9w1LsI0UumclHXlPgoPFEk49MoeyNvKgMBjsFzatOAxICXbF+I9yTyclmZUHvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2522.namprd18.prod.outlook.com (20.179.105.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:43:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 08:43:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 11/14] AMD/IOMMU: adjust setup of internal interrupt
 for x2APIC mode
Thread-Index: AQHVO/UbJkaZtm8uukmP929dCLxvuabSN7F4gAQjVAA=
Date: Mon, 22 Jul 2019 08:43:06 +0000
Message-ID: <470e27a0-9a9e-7cd6-9d59-d0b4a4a5fc3a@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <f8421e6c-3553-7f98-ab20-a26f4dcf8ee1@suse.com>
 <19abc8e5-daae-d967-5c5e-03caccd03c96@citrix.com>
In-Reply-To: <19abc8e5-daae-d967-5c5e-03caccd03c96@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e660eb16-22b6-4e20-799b-08d70e809db1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2522; 
x-ms-traffictypediagnostic: DM6PR18MB2522:
x-microsoft-antispam-prvs: <DM6PR18MB252235DD2AC5CCD7E932A387B3C40@DM6PR18MB2522.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(80792005)(36756003)(31686004)(76176011)(6916009)(4326008)(66066001)(6116002)(3846002)(52116002)(5660300002)(14454004)(6436002)(6486002)(25786009)(316002)(81156014)(81166006)(8936002)(53936002)(2616005)(6246003)(7736002)(305945005)(66446008)(66476007)(66556008)(64756008)(66946007)(6512007)(476003)(11346002)(446003)(86362001)(71200400001)(71190400001)(6506007)(386003)(102836004)(53546011)(31696002)(229853002)(26005)(486006)(186003)(99286004)(8676002)(54906003)(2906002)(68736007)(478600001)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2522;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ufjlVHdgXxWn+3ZIKNmYTiUpmd0c6gNood46c+PHsuFKvJVWDu4wUx+wl6SG/XyDp2T5yG9pCBvJSqW2nQ/fen2MydCTbzSc2M/lXCX7cKPEEE1nySN4l2P6ISqhP61ZI1FRuI3fO+neGWfQu2q9kVp5eqVD7uF65Vi2Xsq3req3VSSEDhSWqisIFpNbZCI8GfP9uEtxEKUcY76AAJHmMR7OLMamapd0N3o1fkFY6zjtDdI4J6mr9mK3hPCzvZpu9ECfd73Z715ard4Lr6u0eON6wuMUngRLvXeuA7qlPAuChJgRQ3a3TQuJmJhDWwnKwa84Qe9GAIryvgLplTk8wbYHmfirGTe9Sk2qigkT38XuBSG7e/CrrOzqLb8STDdiTbYxmjQiIkyl1CKCRrTXDrks0tkr3FuZT+w4ZBe5lJ4=
Content-ID: <367E59A720A0414ABAE2AA60928FA6E4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e660eb16-22b6-4e20-799b-08d70e809db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:43:06.2210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2522
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 11/14] AMD/IOMMU: adjust setup of
 internal interrupt for x2APIC mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxOTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxNzozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vc3ZtL2FtZC1pb21tdS1kZWZzLmgNCj4+IEBAIC00MTYsNiArNDE2LDI1IEBAIHVuaW9uIGFt
ZF9pb21tdV9leHRfZmVhdHVyZXMgew0KPj4gICAgICAgIH0gZmxkczsNCj4+ICAgIH07DQo+PiAg
ICANCj4+ICsvKiB4MkFQSUMgQ29udHJvbCBSZWdpc3RlcnMgKi8NCj4+ICsjZGVmaW5lIElPTU1V
X1hUX0lOVF9DVFJMX01NSU9fT0ZGU0VUCQkweDAxNzANCj4+ICsjZGVmaW5lIElPTU1VX1hUX1BQ
Ul9JTlRfQ1RSTF9NTUlPX09GRlNFVAkweDAxNzgNCj4+ICsjZGVmaW5lIElPTU1VX1hUX0dBX0lO
VF9DVFJMX01NSU9fT0ZGU0VUCTB4MDE4MA0KPj4gKw0KPj4gK3VuaW9uIGFtZF9pb21tdV94MmFw
aWNfY29udHJvbCB7DQo+PiArICAgIHVpbnQ2NF90IHJhdzsNCj4+ICsgICAgc3RydWN0IHsNCj4+
ICsgICAgICAgIHVuc2lnbmVkIGludCA6MjsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkZXN0
X21vZGU6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCA6NTsNCj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBkZXN0X2xvOjI0Ow0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHZlY3Rvcjo4Ow0K
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IGludF90eXBlOjE7IC8qIERNIGluIElPTU1VIHNwZWMg
My4wNCAqLw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IDoxNTsNCj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBkZXN0X2hpOjg7DQo+IA0KPiBCb29sIGJpdGZpZWxkcyBsaWtlIHlvdSd2ZSBkb25l
IGVsc2V3aGVyZSBpbiB2Mz8NCg0KSSdkIGJlZW4gY29uc2lkZXJpbmcgdGhpcywgYnV0IGRlY2lk
ZWQgYWdhaW5zdCBiZWNhdXNlIG9mIC4uLg0KDQorc3RhdGljIHZvaWQgc2V0X3gyYXBpY19hZmZp
bml0eShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykNCit7DQor
ICAgIHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11ID0gZGVzYy0+YWN0aW9uLT5kZXZfaWQ7DQorICAg
IHVuc2lnbmVkIGludCBkZXN0ID0gc2V0X2Rlc2NfYWZmaW5pdHkoZGVzYywgbWFzayk7DQorICAg
IHVuaW9uIGFtZF9pb21tdV94MmFwaWNfY29udHJvbCBjdHJsID0ge307DQorICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3M7DQorDQorICAgIGlmICggZGVzdCA9PSBCQURfQVBJQ0lEICkNCisgICAgICAg
IHJldHVybjsNCisNCisgICAgbXNpX2NvbXBvc2VfbXNnKGRlc2MtPmFyY2gudmVjdG9yLCBOVUxM
LCAmaW9tbXUtPm1zaS5tc2cpOw0KKyAgICBpb21tdS0+bXNpLm1zZy5kZXN0MzIgPSBkZXN0Ow0K
Kw0KKyAgICBjdHJsLmRlc3RfbW9kZSA9IE1BU0tfRVhUUihpb21tdS0+bXNpLm1zZy5hZGRyZXNz
X2xvLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU0lfQUREUl9ERVNUTU9ERV9N
QVNLKTsNCisgICAgY3RybC5pbnRfdHlwZSA9IE1BU0tfRVhUUihpb21tdS0+bXNpLm1zZy5kYXRh
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TSV9EQVRBX0RFTElWRVJZX01PREVf
TUFTSyk7DQoNCi4uLiB0aGlzOiBXZSByZWFsbHkgbWVhbiBhIHZhbHVlIGNvcHkgaGVyZSwgbm90
IGFuICJpcyB6ZXJvIiBvcg0KImlzIG5vbi16ZXJvIiBvbmUuIEkgYWxzbyB0aGluayB0aGF0IGJv
dGggZmllbGRzIGFyZSBub3Qgc3VpdGFibHkNCm5hbWVkIGZvciBiZWluZyBib29sZWFuLiBJbiB0
aGUgcmVjZW50IHJlLXdvcmsgb2Ygc3RydWN0DQpJT19BUElDX3JvdXRlX2VudHJ5IChjYTkzMTBi
MjRlKSBzaW1pbGFyIGZpZWxkcyBzaW1pbGFybHkgd2VyZQ0KbGVmdCBhcyAidW5zaWduZWQgaW50
Ii4gTVNJJ3Mgc3RydWN0IG1zZ19kYXRhIGFsc28gZmFsbHMgaW50byB0aGUNCnNhbWUgY2F0ZWdv
cnkuIEkgdGhpbmsgaWYgd2Ugd2FudGVkIHRvIHN3aXRjaCB0byBib29sIGhlcmUsIHdlDQpzaG91
bGQgZG8gc28gZXZlcnl3aGVyZSBhdCB0aGUgc2FtZSB0aW1lIChhbG9uZyB3aXRoIHN1aXRhYmx5
DQpyZW5hbWluZyBmaWVsZHMpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
