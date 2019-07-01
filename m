Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF405C0AA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyXZ-0002Bf-SW; Mon, 01 Jul 2019 15:48:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhyXY-0002Ba-Bh
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:48:24 +0000
X-Inumbo-ID: 9bb3914e-9c17-11e9-8059-7b3e70bb72c1
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bb3914e-9c17-11e9-8059-7b3e70bb72c1;
 Mon, 01 Jul 2019 15:48:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:48:11 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:46:16 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:46:16 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3186.namprd18.prod.outlook.com (10.255.137.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 15:46:14 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:46:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQA=
Date: Mon, 1 Jul 2019 15:46:14 +0000
Message-ID: <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
In-Reply-To: <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:6::22)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebe595ff-7861-46a6-ffd9-08d6fe3b3f68
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3186; 
x-ms-traffictypediagnostic: BY5PR18MB3186:
x-microsoft-antispam-prvs: <BY5PR18MB3186A02FD215DF323E2EA33CB3F90@BY5PR18MB3186.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(189003)(199004)(8676002)(229853002)(186003)(2906002)(102836004)(54906003)(256004)(6512007)(14444005)(71190400001)(66946007)(6506007)(66556008)(66476007)(6862004)(81156014)(3846002)(53936002)(52116002)(6116002)(71200400001)(486006)(6636002)(11346002)(305945005)(4326008)(81166006)(446003)(26005)(386003)(7416002)(31696002)(73956011)(64756008)(66446008)(2616005)(36756003)(476003)(68736007)(37006003)(5660300002)(6246003)(31686004)(6436002)(66066001)(7736002)(86362001)(6486002)(498600001)(8936002)(25786009)(72206003)(99286004)(14454004)(53546011)(76176011)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3186;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8dQHCXm48djz2xsKdVoehDTT2jgHYr3GLYSdBfbJUN4LaHIgyjWmkbQrJ8OKtILLqwPL4K3p5Xw6NnKh5serEv3UPi8TrXPSmbsb8lxO8LE4TyQGLMCMnS3c91AywuSmz5dYWd1vh/rIzxJYmFu1QB4UWwLsfRvMgNxfAKzE6U5aE54MweA0AmWvB621gCd1Kfm0l1H7FEMYgK7P3lcm+DwVf04qDQ/Uzbh6lf04fkQfICMap1lSSVVIqVsz5HxIHipLLV0ALM1l4czfqy2DPwNSOLrXnkCNFAYKtlBYujfwdEaBcqHVRlfB7Szw+V+hTUZud/Hy0lUWPVuIwsVa35RNtTeNxR04R3Xq6WHCvxsFtRxOVziSuU6ay6ZBka5JljrVmLZsbqW2gB0W5j4GVkoCl0vFxgfhcwXXmxTpgFs=
Content-ID: <80869D62E174CE40BAFAFA2A6F2FB3F9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe595ff-7861-46a6-ffd9-08d6fe3b3f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:46:14.5202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3186
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNzoxMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDEuMDcuMTkg
MTY6MDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMjguMDUuMTkgYXQgMTI6MzIsIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IEBAIC0xNTUsOCArMTU2LDggQEAgc3RhdGljIHZv
aWQgbm1pX21jZV9zb2Z0aXJxKHZvaWQpDQo+Pj4gwqDCoMKgwqDCoMKgICogU2V0IHRoZSB0bXAg
dmFsdWUgdW5jb25kaXRpb25hbGx5LCBzbyB0aGF0IHRoZSBjaGVjayBpbiB0aGUgaXJldA0KPj4+
IMKgwqDCoMKgwqDCoCAqIGh5cGVyY2FsbCB3b3Jrcy4NCj4+PiDCoMKgwqDCoMKgwqAgKi8NCj4+
PiAtwqDCoMKgIGNwdW1hc2tfY29weShzdC0+dmNwdS0+Y3B1X2hhcmRfYWZmaW5pdHlfdG1wLA0K
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdC0+dmNwdS0+Y3B1X2hhcmRf
YWZmaW5pdHkpOw0KPj4+ICvCoMKgwqAgY3B1bWFza19jb3B5KHN0LT52Y3B1LT5zY2hlZF91bml0
LT5jcHVfaGFyZF9hZmZpbml0eV90bXAsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0LT52Y3B1LT5zY2hlZF91bml0LT5jcHVfaGFyZF9hZmZpbml0eSk7DQo+Pg0KPj4g
QWl1aSB0aGlzIGFmZmVjdHMgYWxsIHZDUFUtcyBpbiB0aGUgdW5pdCwgd2hpY2ggaXMgdW5saWtl
bHkgdG8gYmUgd2hhdCB3ZQ0KPj4gd2FudCBoZXJlOiBUaGVyZSdzIG5vdyBvbmx5IG9uZSBjcHVf
aGFyZF9hZmZpbml0eV90bXAgZm9yIGFsbCB2Q1BVLXMNCj4+IGluIHRoZSB1bml0LCB5ZXQgZXZl
cnkgdkNQVSBpbiB0aGVyZSBtYXkgd2FudCB0byBtYWtlIHVzZSBvZiB0aGUNCj4+IGZpZWxkIGlu
IHBhcmFsbGVsLg0KPiANCj4gSG1tLCB5ZXMsIHdlJ2xsIG5lZWQgYSB1c2FnZSBiaXRtYXNrLg0K
PiANCj4gUGxlYXNlIG5vdGUgdGhhdCBhZmZlY3RpbmcgYWxsIHZjcHVzIGluIHRoZSB1bml0IGlz
IHBlciBkZXNpZ24uIFdpdGgNCj4gbXVsdGlwbGUgdmNwdXMgb2YgYSB1bml0IG5lZWRpbmcgdGhp
cyBmZWF0dXJlIGluIHBhcmFsbGVsIHRoZXJlIGlzIG5vDQo+IHdheSB0aGV5IGNhbiBoYXZlIGRp
ZmZlcmVudCBuZWVkcyByZWdhcmRpbmcgdGVtcG9yYXJ5IGFmZmluaXR5Lg0KDQpCdXQgaG93IHdp
bGwgdGhpcyB3b3JrPyBJLmUuIGhvdyB3aWxsIGFsbCB2Q1BVLXMgaW4gYSB1bml0IGdldA0KdGhl
aXIgdGVtcG9yYXJ5IGFmZmluaXR5IHBvaW50aW5nIHRvIHRoZSBvbmUgc3BlY2lmaWMgcENQVSBp
biBxdWVzdGlvbj8NCkl0J3Mgbm90IGp1c3QgdGhlICJhbGwgYXQgdGhlIHNhbWUgdGltZSIgdGhh
dCBJIGRvbid0IHNlZSB3b3JraW5nIGhlcmUsDQpJJ20gYWxzbyBoYXZpbmcgdHJvdWJsZSBzZWVp
bmcgaG93IHRoZSBwb3RlbnRpYWwgY3Jvc3MtY29yZSBvciBjcm9zcy0NCm5vZGUgbW92ZW1lbnQg
dGhhdCdzIGFwcGFyZW50bHkgbmVlZGVkIGhlcmUgd291bGQgZW5kIHVwIHdvcmtpbmcuIEknbQ0K
bm90IGdvaW5nIHRvIGV4Y2x1ZGUgdGhhdCB0aGUgc2V0IG9mIHBvc3NpYmxlIHBDUFUtcyBhIHZD
UFUgbmVlZHMgdG8NCm1vdmUgdG8gaGVyZSBpcyBzdGlsbCB3aXRoaW4gdGhlIHVuaXQsIGJ1dCB0
aGVuIEknZCBleHBlY3QgYXNzZXJ0aW9ucw0KdG8gdGhhdCBlZmZlY3QgdG8gYmUgYWRkZWQuDQoN
Cj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21h
aW4uYw0KPj4+IEBAIC0xMjUsMTEgKzEyNSw2IEBAIHN0YXRpYyB2b2lkIHZjcHVfaW5mb19yZXNl
dChzdHJ1Y3QgdmNwdSAqdikNCj4+PiDCoCBzdGF0aWMgdm9pZCB2Y3B1X2Rlc3Ryb3koc3RydWN0
IHZjcHUgKnYpDQo+Pj4gwqAgew0KPj4+IC3CoMKgwqAgZnJlZV9jcHVtYXNrX3Zhcih2LT5jcHVf
aGFyZF9hZmZpbml0eSk7DQo+Pj4gLcKgwqDCoCBmcmVlX2NwdW1hc2tfdmFyKHYtPmNwdV9oYXJk
X2FmZmluaXR5X3RtcCk7DQo+Pj4gLcKgwqDCoCBmcmVlX2NwdW1hc2tfdmFyKHYtPmNwdV9oYXJk
X2FmZmluaXR5X3NhdmVkKTsNCj4+PiAtwqDCoMKgIGZyZWVfY3B1bWFza192YXIodi0+Y3B1X3Nv
ZnRfYWZmaW5pdHkpOw0KPj4+IC0NCj4+PiDCoMKgwqDCoMKgIGZyZWVfdmNwdV9zdHJ1Y3Qodik7
DQo+Pj4gwqAgfQ0KPj4+IEBAIC0xNTMsMTIgKzE0OCw2IEBAIHN0cnVjdCB2Y3B1ICp2Y3B1X2Ny
ZWF0ZSgNCj4+PiDCoMKgwqDCoMKgIGdyYW50X3RhYmxlX2luaXRfdmNwdSh2KTsNCj4+PiAtwqDC
oMKgIGlmICggIXphbGxvY19jcHVtYXNrX3Zhcigmdi0+Y3B1X2hhcmRfYWZmaW5pdHkpIHx8DQo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqAgIXphbGxvY19jcHVtYXNrX3Zhcigmdi0+Y3B1X2hhcmRfYWZm
aW5pdHlfdG1wKSB8fA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgICF6YWxsb2NfY3B1bWFza192YXIo
JnYtPmNwdV9oYXJkX2FmZmluaXR5X3NhdmVkKSB8fA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgICF6
YWxsb2NfY3B1bWFza192YXIoJnYtPmNwdV9zb2Z0X2FmZmluaXR5KSApDQo+Pj4gLcKgwqDCoMKg
wqDCoMKgIGdvdG8gZmFpbDsNCj4+DQo+PiBTZWVpbmcgdGhlc2UsIEknbSBhY3R1YWxseSBoYXZp
bmcgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIGhvdyB5b3UgbWVhbg0KPj4gdG8gcmV0YWluIHRoZSB1
c2VyIHZpc2libGUgaW50ZXJmYWNlIGJlaGF2aW9yIGhlcmU6IElmIHlvdSBvbmx5IHN0b3JlIGFu
DQo+PiBhZmZpbml0eSBwZXIgc2NoZWQgdW5pdCwgdGhlbiBob3cgYXJlIHlvdSBtZWFuaW5nIHRv
IGhvbm9yIHRoZSB2Q1BVDQo+PiBncmFudWxhciByZXF1ZXN0cyBjb21pbmcgaW4/DQo+IA0KPiBX
aXRoIGNvcmUgc2NoZWR1bGluZyBpdCBpcyBvbmx5IHBvc3NpYmxlIHRvIHNldCAodmlydHVhbCkg
Y29yZQ0KPiBhZmZpbml0aWVzLiBXaGVuZXZlciBhbiBhZmZpbml0eSBvZiBhIHZjcHUgaXMgYmVp
bmcgc2V0IGl0IHdpbGwgc2V0IHRoZQ0KPiBhZmZpbml0eSBvZiB0aGUgd2hvbGUgdW5pdC4NCg0K
SG1tLCB0aGF0J3MgaW5kZWVkIHdoYXQgSSB3YXMgZGVkdWNpbmcsIGJ1dCBob3cgd2lsbCB3ZSBz
ZWxsIHRoaXMNCnRvIHBlb3BsZSBhY3R1YWxseSBmaWRkbGluZyB3aXRoIHZDUFUgYWZmaW5pdGll
cz8gSSBmb3Jlc2VlIGdldHRpbmcNCmJ1ZyByZXBvcnRzIHRoYXQgdGhlIHJlc3BlY3RpdmUgeGwg
Y29tbWFuZChzKSBkbyhlcyluJ3QgZG8gYW55bW9yZQ0Kd2hhdCBpdCB1c2VkIHRvIGRvLg0KDQo+
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgNCj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaA0KPj4+IEBAIC00MzgsMTEgKzQzOCwxMSBAQCBzdGF0aWMgaW5saW5l
IGNwdW1hc2tfdCogY3B1cG9vbF9kb21haW5fY3B1bWFzayhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
IMKgwqAgKiAqIFRoZSBoYXJkIGFmZmluaXR5IGlzIG5vdCBhIHN1YnNldCBvZiBzb2Z0IGFmZmlu
aXR5DQo+Pj4gwqDCoCAqICogVGhlcmUgaXMgYW4gb3ZlcmxhcCBiZXR3ZWVuIHRoZSBzb2Z0IGFu
ZCBoYXJkIGFmZmluaXR5IG1hc2tzDQo+Pj4gwqDCoCAqLw0KPj4+IC1zdGF0aWMgaW5saW5lIGlu
dCBoYXNfc29mdF9hZmZpbml0eShjb25zdCBzdHJ1Y3QgdmNwdSAqdikNCj4+PiArc3RhdGljIGlu
bGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQp
DQo+Pj4gwqAgew0KPj4+IC3CoMKgwqAgcmV0dXJuIHYtPnNvZnRfYWZmX2VmZmVjdGl2ZSAmJg0K
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCAhY3B1bWFza19zdWJzZXQoY3B1cG9vbF9kb21haW5f
Y3B1bWFzayh2LT5kb21haW4pLA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHYtPmNwdV9zb2Z0X2FmZmluaXR5KTsNCj4+PiArwqDCoMKg
IHJldHVybiB1bml0LT5zb2Z0X2FmZl9lZmZlY3RpdmUgJiYNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIWNwdW1hc2tfc3Vic2V0KGNwdXBvb2xfZG9tYWluX2NwdW1hc2sodW5pdC0+dmNwdS0+
ZG9tYWluKSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1bml0LT5jcHVfc29mdF9hZmZpbml0eSk7DQo+Pj4gwqAgfQ0KPj4NCj4+IE9r
YXksIGF0IHRoZSBtb21lbnQgdGhlcmUgbG9va3MgdG8gYmUgYSAxOjEgcmVsYXRpb25zaGlwIGJl
dHdlZW4gc2NoZWQNCj4+IHVuaXRzIGFuZCB2Q1BVLXMuIFRoaXMgd291bGQgLSBhdCB0aGlzIHBv
aW50IG9mIHRoZSBzZXJpZXMgLSBpbnZhbGlkYXRlIG1vc3QNCj4+IG15IGVhcmxpZXIgY29tbWVu
dHMuIEhvd2V2ZXIsIGluIHBhdGNoIDU3IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHVuaXQtPnZjcHUN
Cj4+IG1hcHBpbmcgd291bGQgZ2V0IGJyb2tlbiwgYW5kIEkgY2FuJ3Qgc2VlbSB0byBpZGVudGlm
eSBhbnkgb3RoZXIgcGF0Y2gNCj4+IHdoZXJlIHRoaXMgbWlnaHQgYmUgaGFwcGVuaW5nLiBMb29r
aW5nIGF0IHRoZSBnaXRodWIgYnJhbmNoIEkgYWxzbyBnZXQgdGhlDQo+PiBpbXByZXNzaW9uIHRo
YXQgdGhlIHN0cnVjdCB2Y3B1ICogcG9pbnRlciBvdXQgb2Ygc3RydWN0IHNjaGVkX3VuaXQgc3Vy
dml2ZXMNCj4+IHVudGlsIHRoZSBlbmQgb2YgdGhlIHNlcmllcywgd2hpY2ggZG9lc24ndCBzZWVt
IHJpZ2h0IHRvIG1lLg0KPiANCj4gSXQgaXMgcmlnaHQuIFRoZSB2Y3B1IHBvaW50ZXIgaW4gdGhl
IHNjaGVkX3VuaXQgaXMgcG9pbnRpbmcgdG8gdGhlIGZpcnN0DQo+IHZjcHUgb2YgdGhlIHVuaXQg
YXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLiBGdXJ0aGVyIHZjcHVzIGFyZSBmb3VuZCB2aWENCj4g
di0+bmV4dF9pbl9saXN0Lg0KDQpJJ20gYWZyYWlkIHRoaXMgc2V0cyB1cyB1cCBmb3IgbWlzdW5k
ZXJzdGFuZGluZyBhbmQgbWlzdXNlLiBJIGRvbid0DQp0aGluayB0aGVyZSBzaG91bGQgYmUgYSBz
dHJhaWdodCBzdHJ1Y3QgdmNwdSAqIG91dCBvZiBzdHJ1Y3Qgc2NoZWRfdW5pdC4NCg0KPj4+IEBA
IC05ODAsNyArOTc4LDcgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2h2bV92Y3B1KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQ0KPj4+IMKgIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19od2RvbV9waW5uZWRf
dmNwdShjb25zdCBzdHJ1Y3QgdmNwdSAqdikNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCByZXR1
cm4gKGlzX2hhcmR3YXJlX2RvbWFpbih2LT5kb21haW4pICYmDQo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY3B1bWFza193ZWlnaHQodi0+Y3B1X2hhcmRfYWZmaW5pdHkpID09IDEpOw0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwdW1hc2tfd2VpZ2h0KHYtPnNjaGVkX3VuaXQtPmNw
dV9oYXJkX2FmZmluaXR5KSA9PSAxKTsNCj4+PiDCoCB9DQo+Pg0KPj4gU2VlaW5nIHRoaXMgLSBo
b3cgaXMgcGlubmluZyAoYnkgY29tbWFuZCBsaW5lIG9wdGlvbiBvciBieSBEb20wDQo+PiBkb2lu
ZyB0aGlzIG9uIGl0c2VsZiB0cmFuc2llbnRseSkgZ29pbmcgdG8gd29yayB3aXRoIGNvcmUgc2No
ZWR1bGluZz8NCj4gDQo+IEluIHRoZSBlbmQgb25seSB0aGUgYml0IG9mIHRoZSBmaXJzdCB2Y3B1
IG9mIGEgdW5pdCB3aWxsIGJlIHNldCBpbiB0aGUNCj4gYWZmaW5pdHkgbWFza3MsIGFmZmVjdGlu
ZyBhbGwgdmNwdXMgb2YgdGhlIHVuaXQuDQoNCkknbSBjb25mdXNlZCAtIHdoYXQgImJpdCBvZiB0
aGUgZmlyc3QgdmNwdSBvZiBhIHVuaXQiIGFyZSB5b3UgcmVmZXJyaW5nDQp0bz8NCg0KVG8gZ2l2
ZSBhbiBleGFtcGxlIG9mIHdoYXQgSSBtZWFudCB3aXRoIG15IGVhcmxpZXIgcmVwbHk6IEhvdyBp
cyBEb20wDQpyZXF1ZXN0aW5nIGl0cyB2Q1BVIDUgdG8gYmUgcGlubmVkIHRvIHBDUFUgMyBnb2lu
ZyB0byBiZSBzYXRpc2ZpZWQsDQppbmRlcGVuZGVudCBvZiB0aGUgc2NoZWQgdW5pdCB0aGF0IHZD
UFUgNSBpcyBhc3NvY2lhdGVkIHdpdGg/IElzIHRoZQ0Kd2hvbGUgc2NoZWQgdW5pdCBnZXR0aW5n
IG1vdmVkIG92ZXIgdGhlbj8gSWYgc28sIHdoYXQgaWYgYW5vdGhlciB2Q1BVDQppbiB0aGUgc2Ft
ZSBzY2hlZCB1bml0IGF0IHRoZSBzYW1lIHRpbWUgcmVxdWVzdHMgdG8gYmUgcGlubmVkIHRvIHBD
UFUNCjE3LCBvbiBhIGRpZmZlcmVudCBub2RlL3NvY2tldD8NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
