Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4C703AB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpa9G-00009l-Hh; Mon, 22 Jul 2019 15:22:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpa9F-00009b-Ar
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:22:45 +0000
X-Inumbo-ID: 898f7719-ac94-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 898f7719-ac94-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 15:22:43 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 15:22:31 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 15:22:25 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 15:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3AFU16iDgpK0PEmTzLcFdIfMgbM93P8Rr7bmO1AhwGUz26TUmr9cLdv4DDWwl2xo7+8nuvqRCHq22QRBwNgxhzp8N2Ds+FKMjl0m0fmd5mE+DOqi4p1Nb1OWm4ddRuHSDR5CkFnRagJc6YijPOoMfLawnjTcR3RjRZvgs1509uURCYa8YM5o4lA8mWFJE7Ur9GR06J+BcwedlYUIVS6r7ccOYZBd9vywMnOuYASWSAvqx9+5iWzxnkHqT6VdGm0faAV8Oar9+LCAtLDRXhIjLC2N1ZQf1EyprCk3bzuk1deoNhhM5upBuOOZk1jfBpdLLJzhbgweh3P7LgZUNIkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMGM74OYE1MV/vSmJ57hYjJOIvWJSJN53hfIvA2j7ps=;
 b=VjYjUxSca5QxHuO3913xtRFzLbzoWwxUf10d7DG+9CpbG2/JYR6AXBYxZCBpJAyTMkj0pq4DAqFVExUM4QWLzBKlisU4Zc4b3o3orPVruRUsyLa3nMqdW+mlpSL5YSn9jGy9le7T7RPQ8mNJrgNtDBMgkIErKA1lFJQrjP8SRWPL7onTBydfuFh2HV8o78+qqSIvVjJdTDYBBFMcz5A4wTdceDEKQOPhpTdDQHTCOqXyYeN0ZmOzTEUL+OMWmuzRLdtnDeIoYt5bJI5rTrA80OS1p+7BUAObXhE3iPuISFa7cGQ9jZPKSJ/k3NZrYj0T1nLVyi5lhKLgIcfKYN4/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3147.namprd18.prod.outlook.com (10.255.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 15:22:24 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 15:22:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 11/14] AMD/IOMMU: adjust setup of internal interrupt
 for x2APIC mode
Thread-Index: AQHVO/UbJkaZtm8uukmP929dCLxvuabSN7F4gAQjVACAAFSfnIAAGvCA
Date: Mon, 22 Jul 2019 15:22:23 +0000
Message-ID: <2ece234e-b91d-4a6b-1a51-4dd8750f5ad6@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <f8421e6c-3553-7f98-ab20-a26f4dcf8ee1@suse.com>
 <19abc8e5-daae-d967-5c5e-03caccd03c96@citrix.com>
 <470e27a0-9a9e-7cd6-9d59-d0b4a4a5fc3a@suse.com>
 <5ead25e8-d55d-1b4d-73f6-6048054adb15@citrix.com>
In-Reply-To: <5ead25e8-d55d-1b4d-73f6-6048054adb15@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:6::37)
 To DM6PR18MB3401.namprd18.prod.outlook.com (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 488f76fb-f57c-4b2e-3622-08d70eb8659d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3147; 
x-ms-traffictypediagnostic: DM6PR18MB3147:
x-microsoft-antispam-prvs: <DM6PR18MB31478DC092140BD7B082C98BB3C40@DM6PR18MB3147.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(189003)(199004)(102836004)(305945005)(486006)(8936002)(14454004)(8676002)(81156014)(76176011)(6506007)(386003)(6916009)(3846002)(53546011)(7736002)(6116002)(26005)(476003)(52116002)(256004)(478600001)(446003)(316002)(2616005)(54906003)(11346002)(186003)(80792005)(4326008)(68736007)(5660300002)(229853002)(66066001)(53936002)(6246003)(71190400001)(71200400001)(31686004)(66446008)(66556008)(64756008)(66476007)(66946007)(86362001)(99286004)(81166006)(6436002)(31696002)(36756003)(25786009)(6486002)(2906002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3147;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7y/Zv7WK3gDpoxGaFN9u+sub0iEWBr2ozWd2xHyKMpoiSBCEimo/s6V6d2G2D5idB1+tfUmkblnM58BVLuVjyrYILItjKXBwufEOar/Z7tc2sHYbSvlpxiIjrvuqfXSfVFQ1iPOsUMhh5XvZuiShxPFOAbfBqlIAttfcgbcEBkAWUgl8eRQpQ2xMbqF2GDAX4s5eCic1j07dbTMLkuaH939kuyivDWgVHhvFU3Zy1zncAHtlcUSTo40PS/oOuHIMTuh6U23QR99uBMw+CH4CQSKLfqvN9SxdpESiCLk7H/XXRb8U2oMCLaKh6mSLa3HznhWglTcBP7EkbqnJUJi6nqfwwmThEFdnWTbcXyb7AU/r2eT8YVsN5FhLqPDGuFCWliZCCMZmgdAXJNdwjZRMncaYrnjopkgzXbn5M+cWjiA=
Content-ID: <2A4F85406A93E9479A3ACB5C3E3F3FBF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 488f76fb-f57c-4b2e-3622-08d70eb8659d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 15:22:24.0066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3147
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BrianWoods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNTo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjIvMDcvMjAx
OSAwOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOS4wNy4yMDE5IDE5OjMxLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE2LzA3LzIwMTkgMTc6MzksIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRl
ZnMuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRl
ZnMuaA0KPj4+PiBAQCAtNDE2LDYgKzQxNiwyNSBAQCB1bmlvbiBhbWRfaW9tbXVfZXh0X2ZlYXR1
cmVzIHsNCj4+Pj4gICAgICAgICB9IGZsZHM7DQo+Pj4+ICAgICB9Ow0KPj4+PiAgICAgDQo+Pj4+
ICsvKiB4MkFQSUMgQ29udHJvbCBSZWdpc3RlcnMgKi8NCj4+Pj4gKyNkZWZpbmUgSU9NTVVfWFRf
SU5UX0NUUkxfTU1JT19PRkZTRVQJCTB4MDE3MA0KPj4+PiArI2RlZmluZSBJT01NVV9YVF9QUFJf
SU5UX0NUUkxfTU1JT19PRkZTRVQJMHgwMTc4DQo+Pj4+ICsjZGVmaW5lIElPTU1VX1hUX0dBX0lO
VF9DVFJMX01NSU9fT0ZGU0VUCTB4MDE4MA0KPj4+PiArDQo+Pj4+ICt1bmlvbiBhbWRfaW9tbXVf
eDJhcGljX2NvbnRyb2wgew0KPj4+PiArICAgIHVpbnQ2NF90IHJhdzsNCj4+Pj4gKyAgICBzdHJ1
Y3Qgew0KPj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgOjI7DQo+Pj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBkZXN0X21vZGU6MTsNCj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IDo1Ow0KPj4+
PiArICAgICAgICB1bnNpZ25lZCBpbnQgZGVzdF9sbzoyNDsNCj4+Pj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IHZlY3Rvcjo4Ow0KPj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaW50X3R5cGU6MTsg
LyogRE0gaW4gSU9NTVUgc3BlYyAzLjA0ICovDQo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCA6
MTU7DQo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBkZXN0X2hpOjg7DQo+Pj4gQm9vbCBiaXRm
aWVsZHMgbGlrZSB5b3UndmUgZG9uZSBlbHNld2hlcmUgaW4gdjM/DQo+PiBJJ2QgYmVlbiBjb25z
aWRlcmluZyB0aGlzLCBidXQgZGVjaWRlZCBhZ2FpbnN0IGJlY2F1c2Ugb2YgLi4uDQo+Pg0KPj4g
K3N0YXRpYyB2b2lkIHNldF94MmFwaWNfYWZmaW5pdHkoc3RydWN0IGlycV9kZXNjICpkZXNjLCBj
b25zdCBjcHVtYXNrX3QgKm1hc2spDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgYW1kX2lvbW11ICpp
b21tdSA9IGRlc2MtPmFjdGlvbi0+ZGV2X2lkOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgZGVzdCA9
IHNldF9kZXNjX2FmZmluaXR5KGRlc2MsIG1hc2spOw0KPj4gKyAgICB1bmlvbiBhbWRfaW9tbXVf
eDJhcGljX2NvbnRyb2wgY3RybCA9IHt9Ow0KPj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0K
Pj4gKw0KPj4gKyAgICBpZiAoIGRlc3QgPT0gQkFEX0FQSUNJRCApDQo+PiArICAgICAgICByZXR1
cm47DQo+PiArDQo+PiArICAgIG1zaV9jb21wb3NlX21zZyhkZXNjLT5hcmNoLnZlY3RvciwgTlVM
TCwgJmlvbW11LT5tc2kubXNnKTsNCj4+ICsgICAgaW9tbXUtPm1zaS5tc2cuZGVzdDMyID0gZGVz
dDsNCj4+ICsNCj4+ICsgICAgY3RybC5kZXN0X21vZGUgPSBNQVNLX0VYVFIoaW9tbXUtPm1zaS5t
c2cuYWRkcmVzc19sbywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNJX0FE
RFJfREVTVE1PREVfTUFTSyk7DQo+PiArICAgIGN0cmwuaW50X3R5cGUgPSBNQVNLX0VYVFIoaW9t
bXUtPm1zaS5tc2cuZGF0YSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU0lf
REFUQV9ERUxJVkVSWV9NT0RFX01BU0spOw0KPj4NCj4+IC4uLiB0aGlzOiBXZSByZWFsbHkgbWVh
biBhIHZhbHVlIGNvcHkgaGVyZSwgbm90IGFuICJpcyB6ZXJvIiBvcg0KPj4gImlzIG5vbi16ZXJv
IiBvbmUuIEkgYWxzbyB0aGluayB0aGF0IGJvdGggZmllbGRzIGFyZSBub3Qgc3VpdGFibHkNCj4+
IG5hbWVkIGZvciBiZWluZyBib29sZWFuLiBJbiB0aGUgcmVjZW50IHJlLXdvcmsgb2Ygc3RydWN0
DQo+PiBJT19BUElDX3JvdXRlX2VudHJ5IChjYTkzMTBiMjRlKSBzaW1pbGFyIGZpZWxkcyBzaW1p
bGFybHkgd2VyZQ0KPj4gbGVmdCBhcyAidW5zaWduZWQgaW50Ii4gTVNJJ3Mgc3RydWN0IG1zZ19k
YXRhIGFsc28gZmFsbHMgaW50byB0aGUNCj4+IHNhbWUgY2F0ZWdvcnkuIEkgdGhpbmsgaWYgd2Ug
d2FudGVkIHRvIHN3aXRjaCB0byBib29sIGhlcmUsIHdlDQo+PiBzaG91bGQgZG8gc28gZXZlcnl3
aGVyZSBhdCB0aGUgc2FtZSB0aW1lIChhbG9uZyB3aXRoIHN1aXRhYmx5DQo+PiByZW5hbWluZyBm
aWVsZHMpLg0KPiANCj4gQXJjaGl0ZWN0dXJhbGx5LCBib3RoIG9mIHRoZXNlIGFyZSBzaW5nbGUt
Yml0IGZpZWxkcywgbm8/DQoNClN1cmUsIGJ1dCB3aXRoIHRoZSBuYW1lcyB3ZSBoYXZlIHRoZXJl
J3Mgbm8gb2J2aW91cyBpbmRpY2F0aW9uDQp3aGV0aGVyIHBoeXNpY2FsL2xvZ2ljYWwgYXJlIHJl
c3BlY3RpdmVseSB0cnVlIG9yIGZhbHNlLiBTYW1lDQoob3Igd29yc2UpIGZvciBmaXhlZC9sb3dl
c3QgcHJpb3JpdHksIHdoaWNoIGluIHRoZSBMQVBJQyBldmVuDQpoYXMgZnVydGhlciBhY2NvbXBh
bnlpbmcgdmFsdWVzIChpLmUuIGNvdWxkbid0IHBvc3NpYmx5IGJlIGJvb2wNCnRoZXJlIGF0IGFs
bCkuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
