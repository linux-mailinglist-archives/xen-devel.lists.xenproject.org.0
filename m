Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D397003C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:54:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXm8-0005ed-ED; Mon, 22 Jul 2019 12:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpXm6-0005eY-6h
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:50:42 +0000
X-Inumbo-ID: 4abe0792-ac7f-11e9-a1a6-07faf5d2c8ed
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4abe0792-ac7f-11e9-a1a6-07faf5d2c8ed;
 Mon, 22 Jul 2019 12:50:36 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 12:46:37 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 12:50:20 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 12:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8S3X87lPLiNChFwK/8ahCAgBMoZ9UGFgSpe06sUB504eKTdCEjK2iqRqe3eAeUMMugeX58ASW7ftB2KY4e9VQbeI78L13Q1LHAk7a9s5JPemJbmm6TVIQeATw5BQ4bI1Uz3YweQQu5+7Ode+70nAmGvtRghiRf8qbxUpKTolHXFcNamcXEVDjQmxmxd93HnYqGlW51VeCp9aCtu8pLv2OvbE5dODmc9Kvxg9/eEBOQXQTUy/nsRmWUT1hK/TTNkk6LeAyI3EfLR8QKVhuktfrD9bDYu98h5sCVqZe76CIoVQlVVFt1WEQw+hGa2Lxq3nL7ppjpJiXxBOArOYRXJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXFYzJjImpNG3ha7g45tA/xVfKREdt8D15+/KNgYZSM=;
 b=QXq91BQTGKsqVvvd1w5l1+OYyvKF4Ax68QO+3lhQUJzxBUeGZOQfXegjAXzoyzxW394xI0MsCGkrxwDIaortI127rHjAORs2tTueOHuSRRthhMUy8rjrvuhE/jjKsPMzOZvQ9XSc4pVbYmCu0fpXlVDdFJxUUq3p/SnFk/cCHdm8tXiKATixFQXAvbXV6k/d+HkdWU4WeMD60azYNfJzq+xQRL4euJJuHEoDNuS8oMzW0jjHMOuW5jXxTE+h/wsnb9Y54Jrumoxe3JzxYpAWzFhPn7QW6rCZOmI2A/Tuuth9QNbaahM30z9K0ePsrM84UzIKnoKntORs9eIm0EUCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3068.namprd18.prod.outlook.com (20.179.48.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 12:50:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 12:50:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
Thread-Index: AQHVO/ShZ1XycBFTpEyE5AJFB9blPabSHS6jgAAFboCAACoBB4AEU3oA
Date: Mon, 22 Jul 2019 12:50:20 +0000
Message-ID: <d713f04f-e6b6-b9b0-6bd3-a31e42c3f980@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <7eb213ad-94f1-6092-c670-3296aedf3f0e@suse.com>
 <cf6262df-917a-d253-c856-65e785e80939@citrix.com>
 <f1042832-2853-a9f9-1e1a-70af1481da83@suse.com>
 <1fc9a3f1-07a6-6897-6203-86014a77d265@citrix.com>
In-Reply-To: <1fc9a3f1-07a6-6897-6203-86014a77d265@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0344.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 902d09fc-17d6-4fb1-5e63-08d70ea32759
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3068; 
x-ms-traffictypediagnostic: DM6PR18MB3068:
x-microsoft-antispam-prvs: <DM6PR18MB3068578074D90C635CB102AAB3C40@DM6PR18MB3068.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(199004)(189003)(66446008)(64756008)(66556008)(66476007)(86362001)(80792005)(5660300002)(31696002)(446003)(66066001)(305945005)(4326008)(52116002)(25786009)(6436002)(68736007)(6116002)(6512007)(11346002)(3846002)(66946007)(7736002)(6486002)(2616005)(36756003)(71200400001)(71190400001)(476003)(478600001)(5024004)(386003)(6506007)(14444005)(256004)(2906002)(316002)(53936002)(6246003)(6916009)(99286004)(53546011)(31686004)(186003)(8676002)(102836004)(8936002)(54906003)(76176011)(486006)(26005)(81166006)(14454004)(229853002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3068;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y+SlkQMVRonZsTVhAS7BJ8dgY3tQmkm5fUU7AsxYG4vZLWBYE2bIGECcUYKff3bDu56Fybux8J38T+h8PXKSDkiWkoxQ7MPSUfJnJc/LUtgVkoziAEGD4gKvQFvqnZsL2rVrolMwvt05ttufWsgsHRnxSi36OuDFc2QKfJkReqTmXzwb5fLtYJF9oAPwTRZbeSDivSaC0RJibmW8ZKY+9wbFOURrNX/ceRgRTdE324c1uW3UEFHDwuu5QSjlGC8vyKPCY/z8Bm5xan7tZIoBejHHcChhCECeTgJ1lieAtEgoPvIGnQOoxZajfR+qVgjME4ZhZaiRaKNDWn8oM7+CJYdZpXsLv40OLZjM0kfOm5EnUHSPdgYu9f97GBtY40Dk7Q2M9burCslmHuls0/FyBruC7YzB+O2cqfVXx6UId9A=
Content-ID: <5B5DD18467491E439792D552539AEB63@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 902d09fc-17d6-4fb1-5e63-08d70ea32759
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 12:50:20.0749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3068
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
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

T24gMTkuMDcuMjAxOSAyMDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTkvMDcvMjAx
OSAxNzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxOS4wNy4yMDE5IDE3OjU2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE2LzA3LzIwMTkgMTc6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBBdCB0aGUgc2FtZSB0aW1lIHJlc3RyaWN0IGl0cyBzY29wZSB0byBqdXN0IHRo
ZSBzaW5nbGUgc291cmNlIGZpbGUNCj4+Pj4gYWN0dWFsbHkgdXNpbmcgaXQsIGFuZCBhYnN0cmFj
dCBhY2Nlc3NlcyBieSBpbnRyb2R1Y2luZyBhIHVuaW9uIG9mDQo+Pj4+IHBvaW50ZXJzLiAoQSB1
bmlvbiBvZiB0aGUgYWN0dWFsIHRhYmxlIGVudHJpZXMgaXMgbm90IHVzZWQgdG8gbWFrZSBpdA0K
Pj4+PiBpbXBvc3NpYmxlIHRvIFt3cm9uZ2x5LCBvbmNlIHRoZSAxMjgtYml0IGZvcm0gZ2V0cyBh
ZGRlZF0gcGVyZm9ybQ0KPj4+PiBwb2ludGVyIGFyaXRobWV0aWMgLyBhcnJheSBhY2Nlc3NlcyBv
biBkZXJpdmVkIHR5cGVzLikNCj4+Pj4NCj4+Pj4gQWxzbyBtb3ZlIGF3YXkgZnJvbSB1cGRhdGlu
ZyB0aGUgZW50cmllcyBwaWVjZW1lYWw6IENvbnN0cnVjdCBhIGZ1bGwgbmV3DQo+Pj4+IGVudHJ5
LCBhbmQgd3JpdGUgaXQgb3V0Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gSSdtIHN0aWxsIG5vdCBlbnRpcmVseSBjb252aW5j
ZWQgYnkgZXh0cmEgdW5pb24gYW5kIGNvbnRhaW5lcm9mKCksIGJ1dA0KPj4+IHRoZSByZXN1bHQg
bG9va3MgY29ycmVjdC4NCj4+IEFuZCBJJ20gc3RpbGwgb3BlbiB0byBnb2luZyB0aGUgb3RoZXIg
d2F5LCBpZiB5b3UncmUgY29udmluY2VkIHRoYXQNCj4+IGluIHVwZGF0ZV9pbnRyZW1hcF9lbnRy
eSgpIHRoaXMNCj4+DQo+PiAgICAgICBzdHJ1Y3QgaXJ0ZV9iYXNpYyBiYXNpYyA9IHsNCj4+ICAg
ICAgICAgICAuZmxkcyA9IHsNCj4+ICAgICAgICAgICAgICAgLnJlbWFwX2VuID0gdHJ1ZSwNCj4+
ICAgICAgICAgICAgICAgLmludF90eXBlID0gaW50X3R5cGUsDQo+PiAgICAgICAgICAgICAgIC5k
bSA9IGRlc3RfbW9kZSwNCj4+ICAgICAgICAgICAgICAgLmRlc3QgPSBkZXN0LA0KPj4gICAgICAg
ICAgICAgICAudmVjdG9yID0gdmVjdG9yLA0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH07DQo+
Pg0KPj4gKGFuZCBzaW1pbGFybHkgdGhlbiBmb3IgdGhlIDEyOC1iaXQgZm9ybSwgYW5kIG9mIGNv
dXJzZSAuZmxkcw0KPj4gaW5zZXJ0ZWQgYXQgb3RoZXIgdXNlIHNpdGVzKSBpcyBvdmVyYWxsIGJl
dHRlciB0aGFuIHRoZSBjdXJyZW50DQo+PiB2YXJpYW50Lg0KPiANCj4gSSd2ZSBqdXN0IGV4cGVy
aW1lbnRlZCB3aXRoIHRoZSBhdHRhY2hlZCBkZWx0YSBhbmQgaXQgZG9lcyBjb21waWxlIGluDQo+
IENlbnRPUyA2LCB3aGljaCBpcyB0aGUgdXN1YWwgY3VscHJpdCBmb3IgcHJvYmxlbXMgaW4gdGhp
cyBhcmVhLg0KDQpZZWFoLCB3aXRoIHRoZSAiZmxkcyIgaW4gcGxhY2UgdGhpbmdzIG91Z2h0IHRv
IChhbmQgZG8pIGJ1aWxkIGZpbmUgZm9yDQptZSB0b28gKGl0IHdhcywgYWZ0ZXIgYWxsLCB0aGUg
cXVlc3Rpb24gd2hldGhlciBpbnNlcnRpbmcgdGhhdA0KaW50ZXJtZWRpYXRlIGZpZWxkIHdvdWxk
IGJlIG1vcmUgb3IgbGVzcyB1Z2x5IHRoYW4gdGhlIGNvbnRhaW5lcl9vZigpDQoic29sdXRpb24i
KS4gSSd2ZSB0aGVyZWZvcmUgbW9zdGx5IHN3aXRjaGVkIHRvIHdoYXQgeW91J3ZlIHN1Z2dlc3Rl
ZC4NCkJ1dCBiZWZvcmUgcmUtcG9zdGluZyB3ZSBzaG91bGQgcmVhbGx5IHNldHRsZSBvbiB0aGUg
YmFycmllciBraW5kIHRvDQp1c2UgZm9yIHRoZSAxMjgtYml0IElSVEUgd3JpdGVzLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
