Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF26AC82
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnPyf-0008DE-1v; Tue, 16 Jul 2019 16:06:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnPyc-0008D9-OE
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:06:50 +0000
X-Inumbo-ID: b507cd25-a7e3-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b507cd25-a7e3-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:06:48 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:02:56 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:02:05 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNZ6HT75C0v0+1seTnmTZW/h+RtowZemBeFypOLYXLWK+R0KnneJmRK5i9diH8/L7RxBYzyVKEW6ImLu9e07Mo4vO0K7GGyMDOSrFqRyndXzxD/nVKITNdbkIpbxsIblnbm0+ZENargh2Jf1HESBjtXf+j02NV8MbnZ/0ZGXlgxKph/r5Y297CcYJDkQ3i2YKzowo4m9fJQNTDJ184Wluchhq/2yyq2+FODLb3OodhqhKisNRGuFV8NHWcQcUBEzvGQFZyT/8pseFZ7femnSGd3gnjopgOQBtmevohz7XLeydn1E8c8IUFDSVd2UMljh1I6euaxt2+yWgrsgElCYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CealdGfqW4R3jrkKkMaG6poW8g/XKDxDjeqhV89W/3I=;
 b=k7ELg4dXw8SCc2gAJuB/X43BIZBnUMSkMg1OEQdlpytJ5zmyZ6Figr4QhTmgqM9jJxoRyCcO08Nc2/QOSaMEJwIWAT/UBhPt9Qd+YTvAivC+Vg0iRsX2tPPYThBxjwBqUX79tnttKg1B/wKRPPRlqi7vGQnPHS+J+UNIUL9qfHBUPcbZFzfDX8Xz8NG5814bkp83L3ZyY3s5Z7W3OMrk0oB6jjmyHqpbMTnWh7MQ2KHc4wIy6FUdQBqNaG22/nsF0HrjQYalpRa//q+SN0RfN3uL+n1ah8ThRb0FqHjIhpj2jMNBFMheFxqOiePZHV9iVz7UiPup32qCOw5e1vvkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3274.namprd18.prod.outlook.com (10.255.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:02:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:02:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 02/10] AMD/IOMMU: use bit field for extended feature
 register
Thread-Index: AQHVMM8ahTOfdYIYMkGKpA4vuokia6bNffIA
Date: Tue, 16 Jul 2019 16:02:03 +0000
Message-ID: <dd86e00b-6ce5-48bb-0d25-2b4b410ecd3b@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DE87020000780023B97E@prv1-mh.provo.novell.com>
 <3d3ea9db-b6b9-67ec-e69b-676baeae7dde@citrix.com>
In-Reply-To: <3d3ea9db-b6b9-67ec-e69b-676baeae7dde@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::38) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db91368-70da-43d4-2f61-08d70a06f15d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3274; 
x-ms-traffictypediagnostic: DM6PR18MB3274:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB3274A99C329E97668238815BB3CE0@DM6PR18MB3274.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(199004)(189003)(55674003)(186003)(102836004)(476003)(6506007)(76176011)(386003)(53546011)(316002)(2616005)(52116002)(486006)(5660300002)(71200400001)(110136005)(11346002)(6486002)(99286004)(6306002)(6512007)(256004)(6246003)(6436002)(446003)(54906003)(4326008)(14444005)(53936002)(66476007)(64756008)(80792005)(66556008)(66446008)(66946007)(6116002)(36756003)(25786009)(229853002)(8676002)(478600001)(966005)(14454004)(68736007)(81166006)(81156014)(305945005)(26005)(31686004)(31696002)(71190400001)(86362001)(8936002)(3846002)(66066001)(2906002)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3274;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aJi7pMofNfYVnOge8Ut/McoAfpi9n17fGHNZQvRwBwqvq7DikAiVUOYPtXG8PbX6CyMonnJNL9I9dvYqpaWBJhe9JntvMAOp3OaaPAzPB5CVa6DxaIuMeA53Rb2ro1z4RB3FteVtjjATil6cs0NYWhnwgltH0dCmr/vr0mBHEL1bd0V+SWHCy91qb9Tfi8wbvFU4Q+SzUf1e8WAAcYy2d4MIOF8c2qzmRAjM5AuVwXt3WYXhYCeg6CSd46Pr/5I7XV78JoNf1ma8BnBfPYaxtICWZRV7gokyAqRjdCR3REcVEztRRYV/tsRtu970P9rU6Cs66otNi37646iNcodea7MgjwiAb7scUfGlWpBG2XsXwjKJbAkDIXUcLGNYFL5IpnT1KKzRN61lEC7b2RI6NOqifVp+4mPGLVKyiSEw4Is=
Content-ID: <CF70DB728E7F89468D152016B1AFFEFB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db91368-70da-43d4-2f61-08d70a06f15d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:02:03.3990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3274
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 02/10] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNDowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAgICAgICBwcmludGsoIkFNRC1WaTogSU9N
TVUgRXh0ZW5kZWQgRmVhdHVyZXM6XG4iKTsNCj4+ICAgDQo+PiAtICAgIHdoaWxlICggZmVhdHVy
ZV9zdHJbaV0gKQ0KPj4gKyNkZWZpbmUgTUFTSyhmbGQpICgodW5pb24gYW1kX2lvbW11X2V4dF9m
ZWF0dXJlcyl7IC5mbGRzLmZsZCA9IH4wIH0pLnJhdw0KPj4gKyNkZWZpbmUgRkVBVChmbGQsIHN0
cikgZG8geyBcDQo+PiArICAgIGlmICggTUFTSyhmbGQpICYgKE1BU0soZmxkKSAtIDEpICkgXA0K
Pj4gKyAgICAgICAgcHJpbnRrKCAiLSAiIHN0ciAiOiAlI3hcbiIsIGlvbW11LT5mZWF0dXJlcy5m
bGRzLmZsZCk7IFwNCj4+ICsgICAgZWxzZSBpZiAoIGlvbW11LT5mZWF0dXJlcy5yYXcgJiBNQVNL
KGZsZCkgKSBcDQo+PiArICAgICAgICBwcmludGsoICItICIgc3RyICJcbiIpOyBcDQo+PiArfSB3
aGlsZSAoIGZhbHNlICkNCj4gDQo+IFNhZGx5LCBDbGFuZyBkaXNsaWtlcyB0aGlzIGNvbnN0cnVj
dC4NCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94
ZW4vLS9qb2JzLzI0Mzc5NTA5NQ0KPiAoQ2xpY2sgb24gdGhlICJDb21wbGV0ZSBSYXciIGJ1dHRv
bikNCg0KSXQgaXQgcG9zc2libGUgdGhhdCB0aGlzIGhhcyBleHBpcmVkIGluIHRoZSBtZWFudGlt
ZT8gSSBjYW4ndCBzZWVtIHRvDQpiZSBhYmxlIHRvIGFjY2VzcyBpdC4gQnV0IHRoZW4sIHdpdGgg
d2hhdCB5b3Ugd3JpdGUgYmVsb3csIEkgcHJvYmFibHkNCmFsc28gaGF2ZSBlbm91Z2ggaW5mb3Jt
YXRpb24uDQoNCj4gaW9tbXVfZGV0ZWN0LmM6OTA6NTogZXJyb3I6IGltcGxpY2l0IHRydW5jYXRp
b24gZnJvbSAnaW50JyB0byBiaXRmaWVsZCBjaGFuZ2VzIHZhbHVlIGZyb20gLTEgdG8gMSBbLVdl
cnJvciwtV2JpdGZpZWxkLWNvbnN0YW50LWNvbnZlcnNpb25dDQo+ICAgICAgRkVBVChwcmVmX3N1
cCwgICAgICAgICAgICJQcmVmZXRjaCBQYWdlcyBDb21tYW5kIik7DQo+ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gaW9tbXVfZGV0ZWN0
LmM6ODQ6MTA6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0ZFQVQnDQo+ICAgICAgaWYgKCBN
QVNLKGZsZCkgJiAoTUFTSyhmbGQpIC0gMSkgKSBcDQo+ICAgICAgICAgICBefn5+fn5+fn4NCj4g
aW9tbXVfZGV0ZWN0LmM6ODI6NjQ6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ01BU0snDQo+
ICNkZWZpbmUgTUFTSyhmbGQpICgodW5pb24gYW1kX2lvbW11X2V4dF9mZWF0dXJlcyl7IC5mbGRz
LmZsZCA9IH4wIH0pLnJhdw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4NCj4gDQo+IA0KPiB3aGljaCBpcyBhIHNoYW1l
LsKgIEZ1cnRoZXJtb3JlLCBzd2l0Y2hpbmcgdG8gfigwdSkgd29uJ3Qgd29yayBlaXRoZXIsDQo+
IGJlY2F1c2UgdGhhdCB3aWxsIHRoZW4gZ2V0IGEgdHJ1bmNhdGlvbiB3YXJuaW5nLg0KPiANCj4g
Q2xldmVyIGFzIHRoaXMgdHJpY2sgaXMsIHRoaXMgaXMgd3JpdGUtb25jZSBjb2RlIGFuZCBpc24n
dCBnb2luZyB0bw0KPiBjaGFuZ2UgbW92aW5nIGZvcndhcmQuwqAgSSdkIGRvIGF3YXkgd2l0aCB0
aGUgY29tcGlsZS10aW1lIGNsZXZlcm5lc3MgYW5kDQo+IGhhdmUgc2ltcGxlIEZFQVQoKSBhbmQg
TUFTSygpIG1hY3JvcywgYW5kIHVzZSB0aGUgY29ycmVjdCBvbmUgYmVsb3cuDQoNCklmIG9ubHkg
SSBrbmV3IHdoYXQgeW91IG1lYW4gd2l0aCAic2ltcGxlIEZFQVQoKSBhbmQgTUFTSygpIG1hY3Jv
cyIuDQpJIGNhbid0IHRoaW5rIG9mIHZhcmlhbnRzIG5vdCByZXF1aXJpbmcgdG8gYWxzbyBpbnRy
b2R1Y2UgbGl0ZXJhbA0KbnVtYmVycyB0byB1c2UgYXMgY29uc3RhbnRzLiBJJ2xsIChub3QganVz
dCkgdGhlcmVmb3JlIHRyeSB0byBtb2RpZnkNCnRoZSBvcmlnaW5hbCBhcHByb2FjaCBzdWNoIHRo
YXQgaG9wZWZ1bGx5IHRoZXJlIHdvbid0IGJlIGFueSBvdmVyZmxvdw0KZGV0ZWN0ZWQgYW55bW9y
ZS4gSSBjYW4ndCBzZWUgYW55IHN1Y2ggaXNzdWUgd2l0aCB0aGUgY2xhbmcgSSB1c2UNCmFueXdh
eS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
