Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0C5CC0D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEBp-00015D-SW; Tue, 02 Jul 2019 08:31:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiEBn-000151-Ge
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:30:59 +0000
X-Inumbo-ID: b08f157d-9ca3-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b08f157d-9ca3-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 08:30:57 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:27:15 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:27:50 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:27:50 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3409.namprd18.prod.outlook.com (10.255.139.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 08:27:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 08:27:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQCAAPckdIAAF4MAgAAFi4CAAAOtAA==
Date: Tue, 2 Jul 2019 08:27:49 +0000
Message-ID: <948bef8c-79bb-a5e1-f510-91ce95c4082f@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <cbd5a52f-f9cb-2efe-0e62-22a58614e322@suse.com>
In-Reply-To: <cbd5a52f-f9cb-2efe-0e62-22a58614e322@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0001.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68b6e05d-b501-4df9-f0d0-08d6fec72b19
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3409; 
x-ms-traffictypediagnostic: BY5PR18MB3409:
x-microsoft-antispam-prvs: <BY5PR18MB3409C6982ADB0F6B5655862DB3F80@BY5PR18MB3409.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(189003)(199004)(229853002)(66446008)(478600001)(76176011)(71200400001)(71190400001)(31686004)(6246003)(6436002)(6486002)(36756003)(2906002)(6862004)(53936002)(6512007)(66066001)(4326008)(25786009)(26005)(68736007)(11346002)(102836004)(6116002)(66946007)(81156014)(8676002)(8936002)(64756008)(54906003)(52116002)(7736002)(316002)(305945005)(37006003)(99286004)(6636002)(73956011)(7416002)(3846002)(5660300002)(31696002)(80792005)(386003)(6506007)(53546011)(186003)(2616005)(446003)(72206003)(486006)(14454004)(66476007)(86362001)(476003)(81166006)(66556008)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3409;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zpOwsEEuQ5P578m7ZuIWc36knwlsl6HRxl5Cf/UDyVX1ppeDku4WH2zdCRqRdNFZwZXFPDcZPS9GSwlGp+ImdLlxVU3gCu8Zc+2U6H6O34yK4gi0AbQkxYpUelRY3Kgk5v8u2qJI30higKY5FrKhrnV0+mdLh/3k9ZgnDzMO8kQGoroTJLyAbkz7t3pxFge2Nn+28UDdtIzKGqdmZExPayEPqAU0YOnIKFAm6sHkjDRtEQIMO6ayfGAWMPT9H7V674qsbRcl1RaxuelNWNWm6zKk6eDigcruO4HNc8BblY1bIDQQbkvgzzrFGvTzINANoMjue8FoBNg1SSTCPgm9N38Cp2QbR01xbSBmq45lvxKZF6pgJ/CgHGAM+YdgWKTAKZTbgDKSsbmCtq8CsYVtz11GDwpUR6uVwhIvl/XUvhk=
Content-ID: <FDD2C391B72B3E4681150DFADC8ED910@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b6e05d-b501-4df9-f0d0-08d6fec72b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:27:49.6190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3409
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

T24gMDIuMDcuMjAxOSAxMDoxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDIuMDcuMTkg
MDk6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gQW5kIGFnYWluIC0gaWYgc29tZW9uZSBwaW5z
IGV2ZXJ5IHZDUFUgdG8gYSBzaW5nbGUgcENQVSwgdGhhdCBsYXN0DQo+PiBzdWNoIHBpbm5pbmcg
b3BlcmF0aW9uIHdpbGwgYmUgd2hhdCB0YWtlcyBsb25nIHRlcm0gZWZmZWN0LiBBaXVpIGFsbA0K
Pj4gdkNQVS1zIGluIHRoZSB1bml0IHdpbGwgdGhlbiBiZSBwaW5uZWQgdG8gdGhhdCBvbmUgcENQ
VSwgaS5lLg0KPj4gdGhleSdsbCBlaXRoZXIgYWxsIGNvbXBldGUgZm9yIHRoZSBvbmUgcENQVSdz
IHRpbWUsIG9yIG9ubHkgb25lIG9mDQo+PiB0aGVtIHdpbGwgZXZlciBnZXQgc2NoZWR1bGVkLg0K
PiANCj4gTm8sIHRoYXQncyBub3QgaG93IGl0IHdvcmtzLiBMZXRzIHNheSB3ZSBoYXZlIGEgc3lz
dGVtIHdpdGggdGhlDQo+IGZvbGxvd2luZyB0b3BvbG9neSBhbmQgY29yZSBzY2hlZHVsaW5nIGFj
dGl2ZToNCj4gDQo+IGNwdTA6IGNvcmUgMCwgdGhyZWFkIDANCj4gY3B1MTogY29yZSAwLCB0aHJl
YWQgMQ0KPiBjcHUyOiBjb3JlIDEsIHRocmVhZCAwDQo+IGNwdTM6IGNvcmUgMSwgdGhyZWFkIDEN
Cj4gDQo+IFRoZW4gYW55IGV2ZW4gbnVtYmVyZWQgdmNwdSB3aWxsIG9ubHkgZXZlciBiZSBzY2hl
ZHVsZWQgb24gY3B1MCBvciBjcHUyLA0KPiB3aGlsZSBhbnkgb2RkIG51bWJlcmVkIHZjcHUgd2ls
bCBvbmx5IHJ1biBvbiBjcHUxIG9yIGNwdTMuDQo+IA0KPiBTbyB2aXJ0dWFsIGNvcmVzIGdldCBz
Y2hlZHVsZWQgb24gcGh5c2ljYWwgY29yZXMuIFZpcnR1YWwgdGhyZWFkIDAgd2lsbA0KPiBvbmx5
IHJ1biBvbiBwaHlzaWNhbCB0aHJlYWQgMCBhbmQgdGhlIGFzc29jaWF0ZWQgdmlydHVhbCB0aHJl
YWQgMSB3aWxsDQo+IHJ1biBvbiB0aGUgYXNzb2NpYXRlZCBwaHlzaWNhbCB0aHJlYWQgMSBvZiB0
aGUgc2FtZSBwaHlzaWNhbCBjb3JlLg0KPiANCj4gUGlubmluZyBhIHZpcnR1YWwgdGhyZWFkIDEg
dG8gYSBwaHlzaWNhbCB0aHJlYWQgMCBpcyBub3QgcG9zc2libGUgKGluDQo+IHJlYWxpdHkgb25s
eSB0aGUgdmlydHVhbCBjb3JlIGlzIGJlaW5nIHBpbm5lZCB0byB0aGUgcGh5c2ljYWwgY29yZSku
DQoNCkJ1dCB0aGF0J3Mgd2hhdCBleGlzdGluZyBndWVzdHMgbWF5IGJlIGRvaW5nLiBZb3UgbWF5
IHdhbnQgdG8NCnRha2UgYSBsb29rIGF0IG91ciBvbGQsIG5vbi1wdm9wcyBrZXJuZWxzLCBpbiBw
YXJ0aWN1bGFyIHRoZQ0KZnVuY3Rpb25hbGl0eSBwcm92aWRlZCBieSB0aGVpciBkcml2ZXJzL3hl
bi9jb3JlL2RvbWN0bC5jLiBZZXMsDQp7c3lzLGRvbX1jdGwtcyBhcmVuJ3Qgc3VwcG9zZWQgdG8g
YmUgdXNlZCBieSB0aGUga2VybmVsLCBidXQgdG8NCmFjaGlldmUgdGhlIGludGVuZGVkIGVmZmVj
dHMgSSBzYXcgbm8gd2F5IGFyb3VuZCAoYWIpdXNpbmcgdGhlbS4NCihJIG1lYW4gdGhpcyB0byBi
ZSB0YWtlbiBhcyBhbiBleGFtcGxlIG9ubHkgLSBJIHJlYWxpemUgdGhhdCB0aGUNCmNvZGUgdGhl
cmUgd291bGRuJ3Qgd29yayBvbiBtb2Rlcm4gWGVuIHdpdGhvdXQgdXBkYXRpbmcsIGR1ZSB0bw0K
dGhlIHN5c2N0bC9kb21jdGwgaW50ZXJmYWNlIHZlcnNpb24gdGhhdCBuZWVkcyBzZXR0aW5nLikN
Cg0KPj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaA0KPj4+Pj4+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaA0KPj4+Pj4+PiBAQCAtNDM4LDExICs0MzgsMTEg
QEAgc3RhdGljIGlubGluZSBjcHVtYXNrX3QqIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soc3RydWN0
IGRvbWFpbiAqZCkNCj4+Pj4+Pj4gwqDCoMKgwqAgKiAqIFRoZSBoYXJkIGFmZmluaXR5IGlzIG5v
dCBhIHN1YnNldCBvZiBzb2Z0IGFmZmluaXR5DQo+Pj4+Pj4+IMKgwqDCoMKgICogKiBUaGVyZSBp
cyBhbiBvdmVybGFwIGJldHdlZW4gdGhlIHNvZnQgYW5kIGhhcmQgYWZmaW5pdHkgbWFza3MNCj4+
Pj4+Pj4gwqDCoMKgwqAgKi8NCj4+Pj4+Pj4gLXN0YXRpYyBpbmxpbmUgaW50IGhhc19zb2Z0X2Fm
ZmluaXR5KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4+PiArc3RhdGljIGlubGluZSBpbnQg
aGFzX3NvZnRfYWZmaW5pdHkoY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpDQo+Pj4+Pj4+
IMKgwqDCoCB7DQo+Pj4+Pj4+IC3CoMKgwqAgcmV0dXJuIHYtPnNvZnRfYWZmX2VmZmVjdGl2ZSAm
Jg0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWNwdW1hc2tfc3Vic2V0KGNwdXBvb2xf
ZG9tYWluX2NwdW1hc2sodi0+ZG9tYWluKSwNCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdi0+Y3B1X3NvZnRfYWZmaW5pdHkpOw0K
Pj4+Pj4+PiArwqDCoMKgIHJldHVybiB1bml0LT5zb2Z0X2FmZl9lZmZlY3RpdmUgJiYNCj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgICFjcHVtYXNrX3N1YnNldChjcHVwb29sX2RvbWFpbl9j
cHVtYXNrKHVuaXQtPnZjcHUtPmRvbWFpbiksDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuaXQtPmNwdV9zb2Z0X2FmZmluaXR5
KTsNCj4+Pj4+Pj4gwqDCoMKgIH0NCj4+Pj4+Pg0KPj4+Pj4+IE9rYXksIGF0IHRoZSBtb21lbnQg
dGhlcmUgbG9va3MgdG8gYmUgYSAxOjEgcmVsYXRpb25zaGlwIGJldHdlZW4gc2NoZWQNCj4+Pj4+
PiB1bml0cyBhbmQgdkNQVS1zLiBUaGlzIHdvdWxkIC0gYXQgdGhpcyBwb2ludCBvZiB0aGUgc2Vy
aWVzIC0gaW52YWxpZGF0ZSBtb3N0DQo+Pj4+Pj4gbXkgZWFybGllciBjb21tZW50cy4gSG93ZXZl
ciwgaW4gcGF0Y2ggNTcgSSBkb24ndCBzZWUgaG93IHRoaXMgdW5pdC0+dmNwdQ0KPj4+Pj4+IG1h
cHBpbmcgd291bGQgZ2V0IGJyb2tlbiwgYW5kIEkgY2FuJ3Qgc2VlbSB0byBpZGVudGlmeSBhbnkg
b3RoZXIgcGF0Y2gNCj4+Pj4+PiB3aGVyZSB0aGlzIG1pZ2h0IGJlIGhhcHBlbmluZy4gTG9va2lu
ZyBhdCB0aGUgZ2l0aHViIGJyYW5jaCBJIGFsc28gZ2V0IHRoZQ0KPj4+Pj4+IGltcHJlc3Npb24g
dGhhdCB0aGUgc3RydWN0IHZjcHUgKiBwb2ludGVyIG91dCBvZiBzdHJ1Y3Qgc2NoZWRfdW5pdCBz
dXJ2aXZlcw0KPj4+Pj4+IHVudGlsIHRoZSBlbmQgb2YgdGhlIHNlcmllcywgd2hpY2ggZG9lc24n
dCBzZWVtIHJpZ2h0IHRvIG1lLg0KPj4+Pj4NCj4+Pj4+IEl0IGlzIHJpZ2h0LiBUaGUgdmNwdSBw
b2ludGVyIGluIHRoZSBzY2hlZF91bml0IGlzIHBvaW50aW5nIHRvIHRoZSBmaXJzdA0KPj4+Pj4g
dmNwdSBvZiB0aGUgdW5pdCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuIEZ1cnRoZXIgdmNwdXMg
YXJlIGZvdW5kIHZpYQ0KPj4+Pj4gdi0+bmV4dF9pbl9saXN0Lg0KPj4+Pg0KPj4+PiBJJ20gYWZy
YWlkIHRoaXMgc2V0cyB1cyB1cCBmb3IgbWlzdW5kZXJzdGFuZGluZyBhbmQgbWlzdXNlLiBJIGRv
bid0DQo+Pj4+IHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhIHN0cmFpZ2h0IHN0cnVjdCB2Y3B1ICog
b3V0IG9mIHN0cnVjdCBzY2hlZF91bml0Lg0KPj4+DQo+Pj4gVGhhdCB3YXMgdGhlIG1vc3QgZWZm
ZWN0aXZlIHdheSB0byBkbyBpdC4gV2hhdCBhcmUgeW91IHN1Z2dlc3Rpbmc/DQo+Pg0KPj4gQW4g
YWN0dWFsIGxpc3QsIGkuZS4gd2l0aCBhIHN0cnVjdCBsaXN0X2hlYWQuIFRoYXQnbGwgbWFrZSBv
YnZpb3VzIHRoYXQNCj4+IG1vcmUgdGhhbiBvbmUgdkNQVSBtaWdodCBiZSBhc3NvY2lhdGVkIHdp
dGggYSB1bml0LiBUaGF0J3MgZXZlbiBtb3JlIHNvDQo+PiB0aGF0IHRoZSBhYmlsaXR5IHRvIGFz
c29jaWF0ZSBtb3JlIHRoYW4gb25lIGFwcGVhcnMgb25seSBxdWl0ZSBsYXRlIGluDQo+PiB0aGUg
c2VyaWVzLCBpLmUuIHRoZXJlIG1heSBiZSBmdXJ0aGVyIGluc3RhbmNlcyBsaWtlIHRoZSBjb2Rl
IGFib3ZlLCBhbmQNCj4+IGl0IHdvdWxkIHJlcXVpcmUgYSBjYXJlZnVsIGF1ZGl0IChyYXRoZXIg
dGhhbiB0aGUgY29tcGlsZXIgZmluZGluZyBzdWNoDQo+PiBpbnN0YW5jZSkgdG8gZGV0ZXJtaW5l
IGFsbCBwbGFjZXMgd2hlcmUgdXNpbmcgdGhlIGZpcnN0IHZDUFUgaW4gYSB1bml0DQo+PiBpc24n
dCByZWFsbHkgd2hhdCB3YXMgbWVhbnQuDQo+IA0KPiBUQkggSSBkb24ndCBzZWUgaG93IHRoaXMg
d291bGQgaGVscCBhdCBhbGwuDQo+IA0KPiBJbnN0ZWFkIG9mIHVzaW5nIHRoZSB2Y3B1IHBvaW50
ZXIgSSdkIGhhZCB0byB1c2UgdGhlIGxpc3QgaGVhZCBpbnN0ZWFkLg0KPiBXaHkgaXMgdGhhdCBk
aWZmZXJlbnQgdG8gYSBwbGFpbiBwb2ludGVyIHJlZ2FyZGluZyBmaW5kaW5nIHRoZSBwbGFjZXMN
Cj4gd2hlcmUgdXNpbmcgdGhlIGZpcnN0IHZjcHUgd2FzIHdyb25nPw0KDQpUYWtlIHRoZSBleGFt
cGxlIGFib3ZlOiBJcyBpdCBjb3JyZWN0IHRvIGFjdCBvbiBqdXN0IHRoZSBmaXJzdCB2Q1BVPw0K
SSBndWVzcyBfaGVyZV8gaXQgaXMsIGJ1dCB0aGUgc2FtZSBwYXR0ZXJuIGNvdWxkIGJlIGZvdW5k
IGVsc2V3aGVyZS4NCklmLCBmcm9tIHRoZSBiZWdpbm5pbmcsIHlvdSB1c2UgYSBjbGVhcmx5IGlk
ZW50aWZpYWJsZSBsaXN0IGNvbnN0cnVjdCwNCnRoZW4gaXQnbGwgYmUgb2J2aW91cyB0byB5b3Ug
YXMgdGhlIHdyaXRlciBhbmQgdG8gcmV2aWV3ZXJzIHRoYXQgYnkNCnRoZSBlbmQgb2YgdGhlIHNl
cmllcyB0aGVyZSBtYXkgYmUgbXVsdGlwbGUgZW50aXRpZXMgdGhhdCBuZWVkIGRlYWxpbmcNCndp
dGggLSB3ZSdkIHNlZSBsaXN0X2ZpcnN0KigpIG9yIGZvcl9lYWNoKigpIGNvbnN0cnVjdHMgcmln
aHQgYXdheQ0KKGFuZCB5b3Ugd291bGRuJ3QgYmUgYWJsZSB0byBjaXJjdW12ZW50IHRoZWlyIHVz
ZSBpbiBhIHdheSB0aGF0DQp3b3VsZG4ndCB0cmlnZ2VyICJkb24ndCBvcGVuLWNvZGUiIGNvbW1l
bnRzKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
