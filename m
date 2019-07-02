Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A975CA39
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiDg0-0005Sx-I4; Tue, 02 Jul 2019 07:58:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiDfy-0005Sq-P9
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 07:58:06 +0000
X-Inumbo-ID: f95d2abc-9c9e-11e9-a156-c747c60a2644
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f95d2abc-9c9e-11e9-a156-c747c60a2644;
 Tue, 02 Jul 2019 07:58:01 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 07:57:06 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 07:54:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 07:54:51 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 07:54:50 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 07:54:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQCAAPckdIAAF4MA
Date: Tue, 2 Jul 2019 07:54:50 +0000
Message-ID: <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
In-Reply-To: <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::22) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8231b953-8561-4154-abc2-08d6fec28f48
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB3107D6984AB1CC05264D8CA5B3F80@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(199004)(189003)(486006)(72206003)(66946007)(36756003)(71190400001)(476003)(2616005)(2906002)(11346002)(5660300002)(229853002)(446003)(14454004)(66066001)(14444005)(71200400001)(256004)(8676002)(37006003)(316002)(7736002)(54906003)(66556008)(80792005)(305945005)(64756008)(66476007)(6116002)(86362001)(81166006)(3846002)(66446008)(68736007)(81156014)(386003)(53546011)(6506007)(102836004)(76176011)(53936002)(4326008)(6246003)(6436002)(478600001)(6636002)(26005)(31686004)(8936002)(186003)(25786009)(7416002)(99286004)(52116002)(6862004)(31696002)(73956011)(6512007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5X3TLrSCOpJgISVDZUvfF0VYVG52UY8YrSuz5cojp0sng2oPw8EG/nJLoNOLFDJS6+D0mhB7VqUG5gQwcm+sdXnZZTfPo3x0RbYjL5wYPez0u5pmuTQv1cW7qyfnqQdvxdH88bF2xvq5twHI1Wm/BAETx2CRK+qMbtlkA0hEW9Rly8/pmZjYx+Jv+LP+wonLUkNtVptT1ANk0yiizB5soQOwYo8aml8o270QNH6SGhK2JzIUR8YqG8nGetkiRQoj21wZY0Ad40xu8aYE/VCQ761B2N032LTBqV6WYtpfy5F08Rc1seYtxC9gNnUk1nkc1vvWB6ID+7Zk7U0/9yj3CSCigXMn8Dp4unPPEKotAcooQMQKYAW/zR2aRFKbO3ZJU9gWV6RCLGNiucyH2bw/VnMURmAgWue2lyiwmsUJCfE=
Content-ID: <898B9DC208375E49AACBEB049FD55ECB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8231b953-8561-4154-abc2-08d6fec28f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 07:54:50.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3107
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

T24gMDIuMDcuMjAxOSAwODozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDEuMDcuMTkg
MTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDcuMjAxOSAxNzoxMCwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiBPbiAwMS4wNy4xOSAxNjowOCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToN
Cj4+Pj4+IEBAIC0xNTUsOCArMTU2LDggQEAgc3RhdGljIHZvaWQgbm1pX21jZV9zb2Z0aXJxKHZv
aWQpDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqIFNldCB0aGUgdG1wIHZhbHVlIHVuY29uZGl0aW9u
YWxseSwgc28gdGhhdCB0aGUgY2hlY2sgaW4gdGhlIGlyZXQNCj4+Pj4+IMKgwqDCoMKgwqDCoMKg
ICogaHlwZXJjYWxsIHdvcmtzLg0KPj4+Pj4gwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4+IC3CoMKg
wqAgY3B1bWFza19jb3B5KHN0LT52Y3B1LT5jcHVfaGFyZF9hZmZpbml0eV90bXAsDQo+Pj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3QtPnZjcHUtPmNwdV9oYXJkX2FmZmlu
aXR5KTsNCj4+Pj4+ICvCoMKgwqAgY3B1bWFza19jb3B5KHN0LT52Y3B1LT5zY2hlZF91bml0LT5j
cHVfaGFyZF9hZmZpbml0eV90bXAsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3QtPnZjcHUtPnNjaGVkX3VuaXQtPmNwdV9oYXJkX2FmZmluaXR5KTsNCj4+Pj4NCj4+
Pj4gQWl1aSB0aGlzIGFmZmVjdHMgYWxsIHZDUFUtcyBpbiB0aGUgdW5pdCwgd2hpY2ggaXMgdW5s
aWtlbHkgdG8gYmUgd2hhdCB3ZQ0KPj4+PiB3YW50IGhlcmU6IFRoZXJlJ3Mgbm93IG9ubHkgb25l
IGNwdV9oYXJkX2FmZmluaXR5X3RtcCBmb3IgYWxsIHZDUFUtcw0KPj4+PiBpbiB0aGUgdW5pdCwg
eWV0IGV2ZXJ5IHZDUFUgaW4gdGhlcmUgbWF5IHdhbnQgdG8gbWFrZSB1c2Ugb2YgdGhlDQo+Pj4+
IGZpZWxkIGluIHBhcmFsbGVsLg0KPj4+DQo+Pj4gSG1tLCB5ZXMsIHdlJ2xsIG5lZWQgYSB1c2Fn
ZSBiaXRtYXNrLg0KPj4+DQo+Pj4gUGxlYXNlIG5vdGUgdGhhdCBhZmZlY3RpbmcgYWxsIHZjcHVz
IGluIHRoZSB1bml0IGlzIHBlciBkZXNpZ24uIFdpdGgNCj4+PiBtdWx0aXBsZSB2Y3B1cyBvZiBh
IHVuaXQgbmVlZGluZyB0aGlzIGZlYXR1cmUgaW4gcGFyYWxsZWwgdGhlcmUgaXMgbm8NCj4+PiB3
YXkgdGhleSBjYW4gaGF2ZSBkaWZmZXJlbnQgbmVlZHMgcmVnYXJkaW5nIHRlbXBvcmFyeSBhZmZp
bml0eS4NCj4+DQo+PiBCdXQgaG93IHdpbGwgdGhpcyB3b3JrPyBJLmUuIGhvdyB3aWxsIGFsbCB2
Q1BVLXMgaW4gYSB1bml0IGdldA0KPj4gdGhlaXIgdGVtcG9yYXJ5IGFmZmluaXR5IHBvaW50aW5n
IHRvIHRoZSBvbmUgc3BlY2lmaWMgcENQVSBpbiBxdWVzdGlvbj8NCj4gDQo+IFRoZSBfdW5pdF8g
aXMgcGlubmVkLCBzbyBhbGwgdGhlIHZjcHVzIGluIHRoYXQgdW5pdCBhcmUgcGlubmVkLCB0b28u
DQoNClllcywgYnV0IC4uLg0KDQo+PiBJdCdzIG5vdCBqdXN0IHRoZSAiYWxsIGF0IHRoZSBzYW1l
IHRpbWUiIHRoYXQgSSBkb24ndCBzZWUgd29ya2luZyBoZXJlLA0KPj4gSSdtIGFsc28gaGF2aW5n
IHRyb3VibGUgc2VlaW5nIGhvdyB0aGUgcG90ZW50aWFsIGNyb3NzLWNvcmUgb3IgY3Jvc3MtDQo+
PiBub2RlIG1vdmVtZW50IHRoYXQncyBhcHBhcmVudGx5IG5lZWRlZCBoZXJlIHdvdWxkIGVuZCB1
cCB3b3JraW5nLiBJJ20NCj4gDQo+IFRoZSB1bml0IGlzIG1vdmVkIHRvIGFub3RoZXIgY29yZSB2
aWEgbm9ybWFsIHNjaGVkdWxpbmcgbWVjaGFuaXNtcy4gQXMNCj4gc3dpdGNoaW5nIGNvbnRleHQg
aXMgc3luY2hyb25pemVkIChzZWUgcGF0Y2ggMzUpIGFsbCB2Y3B1cyBvZiBhIHVuaXQgYXJlDQo+
IG1vdmVkIHRvZ2V0aGVyLg0KDQouLi4gdGhleSBtYXkgZ2V0IHBpbm5lZCB0byBkaWZmZXJlbnQg
cENQVS1zIG9yIGFsbCB0aGUgc2FtZSBwQ1BVIGhlcmUuDQpCb3RoIGNhc2VzIG5lZWQgdG8gd29y
aywgYW5kIEknbSBjdXJyZW50bHkgbm90IHNlZWluZyBob3cgdGhhdCB3b3VsZA0KYmUgYWNoaWV2
ZWQuDQoNCj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4+ICsrKyBiL3hlbi9j
b21tb24vZG9tYWluLmMNCj4+Pj4+IEBAIC0xMjUsMTEgKzEyNSw2IEBAIHN0YXRpYyB2b2lkIHZj
cHVfaW5mb19yZXNldChzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4+IMKgwqAgc3RhdGljIHZvaWQgdmNw
dV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4gwqDCoCB7DQo+Pj4+PiAtwqDCoMKgIGZy
ZWVfY3B1bWFza192YXIodi0+Y3B1X2hhcmRfYWZmaW5pdHkpOw0KPj4+Pj4gLcKgwqDCoCBmcmVl
X2NwdW1hc2tfdmFyKHYtPmNwdV9oYXJkX2FmZmluaXR5X3RtcCk7DQo+Pj4+PiAtwqDCoMKgIGZy
ZWVfY3B1bWFza192YXIodi0+Y3B1X2hhcmRfYWZmaW5pdHlfc2F2ZWQpOw0KPj4+Pj4gLcKgwqDC
oCBmcmVlX2NwdW1hc2tfdmFyKHYtPmNwdV9zb2Z0X2FmZmluaXR5KTsNCj4+Pj4+IC0NCj4+Pj4+
IMKgwqDCoMKgwqDCoCBmcmVlX3ZjcHVfc3RydWN0KHYpOw0KPj4+Pj4gwqDCoCB9DQo+Pj4+PiBA
QCAtMTUzLDEyICsxNDgsNiBAQCBzdHJ1Y3QgdmNwdSAqdmNwdV9jcmVhdGUoDQo+Pj4+PiDCoMKg
wqDCoMKgwqAgZ3JhbnRfdGFibGVfaW5pdF92Y3B1KHYpOw0KPj4+Pj4gLcKgwqDCoCBpZiAoICF6
YWxsb2NfY3B1bWFza192YXIoJnYtPmNwdV9oYXJkX2FmZmluaXR5KSB8fA0KPj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqAgIXphbGxvY19jcHVtYXNrX3Zhcigmdi0+Y3B1X2hhcmRfYWZmaW5pdHlfdG1w
KSB8fA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgIXphbGxvY19jcHVtYXNrX3Zhcigmdi0+Y3B1
X2hhcmRfYWZmaW5pdHlfc2F2ZWQpIHx8DQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAhemFsbG9j
X2NwdW1hc2tfdmFyKCZ2LT5jcHVfc29mdF9hZmZpbml0eSkgKQ0KPj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIGdvdG8gZmFpbDsNCj4+Pj4NCj4+Pj4gU2VlaW5nIHRoZXNlLCBJJ20gYWN0dWFsbHkgaGF2
aW5nIHRyb3VibGUgdW5kZXJzdGFuZGluZyBob3cgeW91IG1lYW4NCj4+Pj4gdG8gcmV0YWluIHRo
ZSB1c2VyIHZpc2libGUgaW50ZXJmYWNlIGJlaGF2aW9yIGhlcmU6IElmIHlvdSBvbmx5IHN0b3Jl
IGFuDQo+Pj4+IGFmZmluaXR5IHBlciBzY2hlZCB1bml0LCB0aGVuIGhvdyBhcmUgeW91IG1lYW5p
bmcgdG8gaG9ub3IgdGhlIHZDUFUNCj4+Pj4gZ3JhbnVsYXIgcmVxdWVzdHMgY29taW5nIGluPw0K
Pj4+DQo+Pj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgaXQgaXMgb25seSBwb3NzaWJsZSB0byBzZXQg
KHZpcnR1YWwpIGNvcmUNCj4+PiBhZmZpbml0aWVzLiBXaGVuZXZlciBhbiBhZmZpbml0eSBvZiBh
IHZjcHUgaXMgYmVpbmcgc2V0IGl0IHdpbGwgc2V0IHRoZQ0KPj4+IGFmZmluaXR5IG9mIHRoZSB3
aG9sZSB1bml0Lg0KPj4NCj4+IEhtbSwgdGhhdCdzIGluZGVlZCB3aGF0IEkgd2FzIGRlZHVjaW5n
LCBidXQgaG93IHdpbGwgd2Ugc2VsbCB0aGlzDQo+PiB0byBwZW9wbGUgYWN0dWFsbHkgZmlkZGxp
bmcgd2l0aCB2Q1BVIGFmZmluaXRpZXM/IEkgZm9yZXNlZSBnZXR0aW5nDQo+PiBidWcgcmVwb3J0
cyB0aGF0IHRoZSByZXNwZWN0aXZlIHhsIGNvbW1hbmQocykgZG8oZXMpbid0IGRvIGFueW1vcmUN
Cj4+IHdoYXQgaXQgdXNlZCB0byBkby4NCj4gDQo+IFRoZSBuZXcgYmVoYXZpb3IgbXVzdCBiZSBk
b2N1bWVudGVkLCBzdXJlLg0KDQpEb2N1bWVudGF0aW9uIGlzIGp1c3Qgb25lIGFzcGVjdC4gT2Z0
ZW4gZW5vdWdoIHBlb3BsZSBvbmx5IHJlYWQgZG9jcw0Kd2hlbiB3YW50aW5nIHRvIGludHJvZHVj
ZSBuZXcgZnVuY3Rpb25hbGl0eSwgd2hpY2ggSSBjb25zaWRlciBhIGZhaXINCm1vZGVsLiBTdWNo
IHBlb3BsZSB3aWxsIGJlIGNhdWdodCBieSBzdXJwcmlzZSB0aGF0IHRoZSBwaW5uaW5nDQpiZWhh
dmlvciBkb2VzIG5vdCB3b3JrIHRoZSBzYW1lIHdheSBhbnltb3JlLg0KDQpBbmQgYWdhaW4gLSBp
ZiBzb21lb25lIHBpbnMgZXZlcnkgdkNQVSB0byBhIHNpbmdsZSBwQ1BVLCB0aGF0IGxhc3QNCnN1
Y2ggcGlubmluZyBvcGVyYXRpb24gd2lsbCBiZSB3aGF0IHRha2VzIGxvbmcgdGVybSBlZmZlY3Qu
IEFpdWkgYWxsDQp2Q1BVLXMgaW4gdGhlIHVuaXQgd2lsbCB0aGVuIGJlIHBpbm5lZCB0byB0aGF0
IG9uZSBwQ1BVLCBpLmUuDQp0aGV5J2xsIGVpdGhlciBhbGwgY29tcGV0ZSBmb3IgdGhlIG9uZSBw
Q1BVJ3MgdGltZSwgb3Igb25seSBvbmUgb2YNCnRoZW0gd2lsbCBldmVyIGdldCBzY2hlZHVsZWQu
DQoNCj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oDQo+Pj4+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaA0KPj4+Pj4gQEAgLTQzOCwxMSArNDM4LDExIEBAIHN0
YXRpYyBpbmxpbmUgY3B1bWFza190KiBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHN0cnVjdCBkb21h
aW4gKmQpDQo+Pj4+PiDCoMKgwqAgKiAqIFRoZSBoYXJkIGFmZmluaXR5IGlzIG5vdCBhIHN1YnNl
dCBvZiBzb2Z0IGFmZmluaXR5DQo+Pj4+PiDCoMKgwqAgKiAqIFRoZXJlIGlzIGFuIG92ZXJsYXAg
YmV0d2VlbiB0aGUgc29mdCBhbmQgaGFyZCBhZmZpbml0eSBtYXNrcw0KPj4+Pj4gwqDCoMKgICov
DQo+Pj4+PiAtc3RhdGljIGlubGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29uc3Qgc3RydWN0
IHZjcHUgKnYpDQo+Pj4+PiArc3RhdGljIGlubGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29u
c3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpDQo+Pj4+PiDCoMKgIHsNCj4+Pj4+IC3CoMKgwqAg
cmV0dXJuIHYtPnNvZnRfYWZmX2VmZmVjdGl2ZSAmJg0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgICFjcHVtYXNrX3N1YnNldChjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHYtPmRvbWFpbiksDQo+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2LT5jcHVfc29mdF9hZmZpbml0eSk7DQo+Pj4+PiArwqDCoMKgIHJldHVybiB1bml0LT5zb2Z0
X2FmZl9lZmZlY3RpdmUgJiYNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhY3B1bWFza19z
dWJzZXQoY3B1cG9vbF9kb21haW5fY3B1bWFzayh1bml0LT52Y3B1LT5kb21haW4pLA0KPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5p
dC0+Y3B1X3NvZnRfYWZmaW5pdHkpOw0KPj4+Pj4gwqDCoCB9DQo+Pj4+DQo+Pj4+IE9rYXksIGF0
IHRoZSBtb21lbnQgdGhlcmUgbG9va3MgdG8gYmUgYSAxOjEgcmVsYXRpb25zaGlwIGJldHdlZW4g
c2NoZWQNCj4+Pj4gdW5pdHMgYW5kIHZDUFUtcy4gVGhpcyB3b3VsZCAtIGF0IHRoaXMgcG9pbnQg
b2YgdGhlIHNlcmllcyAtIGludmFsaWRhdGUgbW9zdA0KPj4+PiBteSBlYXJsaWVyIGNvbW1lbnRz
LiBIb3dldmVyLCBpbiBwYXRjaCA1NyBJIGRvbid0IHNlZSBob3cgdGhpcyB1bml0LT52Y3B1DQo+
Pj4+IG1hcHBpbmcgd291bGQgZ2V0IGJyb2tlbiwgYW5kIEkgY2FuJ3Qgc2VlbSB0byBpZGVudGlm
eSBhbnkgb3RoZXIgcGF0Y2gNCj4+Pj4gd2hlcmUgdGhpcyBtaWdodCBiZSBoYXBwZW5pbmcuIExv
b2tpbmcgYXQgdGhlIGdpdGh1YiBicmFuY2ggSSBhbHNvIGdldCB0aGUNCj4+Pj4gaW1wcmVzc2lv
biB0aGF0IHRoZSBzdHJ1Y3QgdmNwdSAqIHBvaW50ZXIgb3V0IG9mIHN0cnVjdCBzY2hlZF91bml0
IHN1cnZpdmVzDQo+Pj4+IHVudGlsIHRoZSBlbmQgb2YgdGhlIHNlcmllcywgd2hpY2ggZG9lc24n
dCBzZWVtIHJpZ2h0IHRvIG1lLg0KPj4+DQo+Pj4gSXQgaXMgcmlnaHQuIFRoZSB2Y3B1IHBvaW50
ZXIgaW4gdGhlIHNjaGVkX3VuaXQgaXMgcG9pbnRpbmcgdG8gdGhlIGZpcnN0DQo+Pj4gdmNwdSBv
ZiB0aGUgdW5pdCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuIEZ1cnRoZXIgdmNwdXMgYXJlIGZv
dW5kIHZpYQ0KPj4+IHYtPm5leHRfaW5fbGlzdC4NCj4+DQo+PiBJJ20gYWZyYWlkIHRoaXMgc2V0
cyB1cyB1cCBmb3IgbWlzdW5kZXJzdGFuZGluZyBhbmQgbWlzdXNlLiBJIGRvbid0DQo+PiB0aGlu
ayB0aGVyZSBzaG91bGQgYmUgYSBzdHJhaWdodCBzdHJ1Y3QgdmNwdSAqIG91dCBvZiBzdHJ1Y3Qg
c2NoZWRfdW5pdC4NCj4gDQo+IFRoYXQgd2FzIHRoZSBtb3N0IGVmZmVjdGl2ZSB3YXkgdG8gZG8g
aXQuIFdoYXQgYXJlIHlvdSBzdWdnZXN0aW5nPw0KDQpBbiBhY3R1YWwgbGlzdCwgaS5lLiB3aXRo
IGEgc3RydWN0IGxpc3RfaGVhZC4gVGhhdCdsbCBtYWtlIG9idmlvdXMgdGhhdA0KbW9yZSB0aGFu
IG9uZSB2Q1BVIG1pZ2h0IGJlIGFzc29jaWF0ZWQgd2l0aCBhIHVuaXQuIFRoYXQncyBldmVuIG1v
cmUgc28NCnRoYXQgdGhlIGFiaWxpdHkgdG8gYXNzb2NpYXRlIG1vcmUgdGhhbiBvbmUgYXBwZWFy
cyBvbmx5IHF1aXRlIGxhdGUgaW4NCnRoZSBzZXJpZXMsIGkuZS4gdGhlcmUgbWF5IGJlIGZ1cnRo
ZXIgaW5zdGFuY2VzIGxpa2UgdGhlIGNvZGUgYWJvdmUsIGFuZA0KaXQgd291bGQgcmVxdWlyZSBh
IGNhcmVmdWwgYXVkaXQgKHJhdGhlciB0aGFuIHRoZSBjb21waWxlciBmaW5kaW5nIHN1Y2gNCmlu
c3RhbmNlKSB0byBkZXRlcm1pbmUgYWxsIHBsYWNlcyB3aGVyZSB1c2luZyB0aGUgZmlyc3QgdkNQ
VSBpbiBhIHVuaXQNCmlzbid0IHJlYWxseSB3aGF0IHdhcyBtZWFudC4NCg0KT25jZSB0aGUgbGlz
dCBhcHByb2FjaCB3YXMgZW5mb3JjZWQsIGluIGEgc2Vjb25kIHN0ZXAgd2UgbWlnaHQgdGhlbg0K
ZGlzY3VzcyB3aGV0aGVyIHRoZSBsaXN0IG1hbmFnZW1lbnQgaXMgdG9vIG11Y2ggb3ZlcmhlYWQs
IGFuZCBoZW5jZQ0Kd2hldGhlciBwZXJoYXBzIHRvIHN3aXRjaCB0byB0aGUgc2ltcGxlciBtb2Rl
bCB5b3UncmUgdXNpbmcgcmlnaHQgbm93Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
