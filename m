Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1245CC79
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:16:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEq0-0004x6-EP; Tue, 02 Jul 2019 09:12:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiEpz-0004x1-N6
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:12:31 +0000
X-Inumbo-ID: 2e5fd002-9ca9-11e9-aaa1-bf21ec8cfc58
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e5fd002-9ca9-11e9-aaa1-bf21ec8cfc58;
 Tue, 02 Jul 2019 09:12:29 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 09:10:20 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 09:05:25 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 09:05:25 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3123.namprd18.prod.outlook.com (10.255.139.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 09:05:23 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 09:05:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQCAAPckdIAAF4MAgAAFi4CAAAOtAIAABMaAgAAFuoA=
Date: Tue, 2 Jul 2019 09:05:23 +0000
Message-ID: <5302284d-bb1d-0df6-f853-86bb21645269@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <cbd5a52f-f9cb-2efe-0e62-22a58614e322@suse.com>
 <948bef8c-79bb-a5e1-f510-91ce95c4082f@suse.com>
 <64f37be6-1dd4-60fb-fe23-d9d4e9e3cf63@suse.com>
In-Reply-To: <64f37be6-1dd4-60fb-fe23-d9d4e9e3cf63@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0082.eurprd03.prod.outlook.com
 (2603:10a6:10:72::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45feb1f2-3147-4c2d-fe79-08d6fecc6a96
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3123; 
x-ms-traffictypediagnostic: BY5PR18MB3123:
x-microsoft-antispam-prvs: <BY5PR18MB3123D205AB4AAFF87B1931A8B3F80@BY5PR18MB3123.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(189003)(199004)(7416002)(305945005)(72206003)(8936002)(52116002)(478600001)(186003)(11346002)(68736007)(31696002)(2616005)(6246003)(25786009)(8676002)(6116002)(6486002)(86362001)(2906002)(5660300002)(81166006)(6436002)(64756008)(76176011)(102836004)(80792005)(3846002)(53546011)(386003)(6506007)(256004)(71200400001)(14444005)(71190400001)(6512007)(6636002)(37006003)(316002)(81156014)(99286004)(486006)(229853002)(476003)(73956011)(66066001)(6862004)(53936002)(14454004)(66476007)(66446008)(54906003)(7736002)(26005)(66946007)(446003)(66556008)(31686004)(4326008)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3123;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Sr/AGPF02lU/SsxCIUSbcM3Yd4tOV9c/gAGa1LqLAiAjwmqv486/gZqGOqSjGui06wi8OtRGoNdfEYWq1bTVLZ4EPSnxxmHDMrjZQ0MKOIkbOBotHu4YF8MiotzuSEJYTya3EpnQFXecMLodl60CTZn74Gt+YuzVRJpFSQgs8/ciPzBhkt169XQBjsYIGJyBIYr5qw/kux/myySGvr11WFkv7Zsp+lsEK2azcBj9RY1uVbMcA4HO6ImAP3OOI7ToVQTwCrp5788CbVN5/qRdyXoIVX654JM5+0TrDAzraTf9lzMqMXoYj9KcCIdKvS1lC9xtsAiIkGENolDBNTI6DgUmRAHoDjYbe5NZ9vbsuYDkurJ2xdJHQxPmnVzoY+ChXEPi/WbBzRboLhjtMDfnIVcjVY6q/bv0cXiMqyjQfFM=
Content-ID: <6802B57C3C907B46BF15A0CB701C7D6D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45feb1f2-3147-4c2d-fe79-08d6fecc6a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 09:05:23.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3123
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

T24gMDIuMDcuMjAxOSAxMDo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDIuMDcuMTkg
MTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDIuMDcuMjAxOSAxMDoxNCwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiBPbiAwMi4wNy4xOSAwOTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+IEFuZCBhZ2FpbiAtIGlmIHNvbWVvbmUgcGlucyBldmVyeSB2Q1BVIHRvIGEgc2luZ2xl
IHBDUFUsIHRoYXQgbGFzdA0KPj4+PiBzdWNoIHBpbm5pbmcgb3BlcmF0aW9uIHdpbGwgYmUgd2hh
dCB0YWtlcyBsb25nIHRlcm0gZWZmZWN0LiBBaXVpIGFsbA0KPj4+PiB2Q1BVLXMgaW4gdGhlIHVu
aXQgd2lsbCB0aGVuIGJlIHBpbm5lZCB0byB0aGF0IG9uZSBwQ1BVLCBpLmUuDQo+Pj4+IHRoZXkn
bGwgZWl0aGVyIGFsbCBjb21wZXRlIGZvciB0aGUgb25lIHBDUFUncyB0aW1lLCBvciBvbmx5IG9u
ZSBvZg0KPj4+PiB0aGVtIHdpbGwgZXZlciBnZXQgc2NoZWR1bGVkLg0KPj4+DQo+Pj4gTm8sIHRo
YXQncyBub3QgaG93IGl0IHdvcmtzLiBMZXRzIHNheSB3ZSBoYXZlIGEgc3lzdGVtIHdpdGggdGhl
DQo+Pj4gZm9sbG93aW5nIHRvcG9sb2d5IGFuZCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlOg0KPj4+
DQo+Pj4gY3B1MDogY29yZSAwLCB0aHJlYWQgMA0KPj4+IGNwdTE6IGNvcmUgMCwgdGhyZWFkIDEN
Cj4+PiBjcHUyOiBjb3JlIDEsIHRocmVhZCAwDQo+Pj4gY3B1MzogY29yZSAxLCB0aHJlYWQgMQ0K
Pj4+DQo+Pj4gVGhlbiBhbnkgZXZlbiBudW1iZXJlZCB2Y3B1IHdpbGwgb25seSBldmVyIGJlIHNj
aGVkdWxlZCBvbiBjcHUwIG9yIGNwdTIsDQo+Pj4gd2hpbGUgYW55IG9kZCBudW1iZXJlZCB2Y3B1
IHdpbGwgb25seSBydW4gb24gY3B1MSBvciBjcHUzLg0KPj4+DQo+Pj4gU28gdmlydHVhbCBjb3Jl
cyBnZXQgc2NoZWR1bGVkIG9uIHBoeXNpY2FsIGNvcmVzLiBWaXJ0dWFsIHRocmVhZCAwIHdpbGwN
Cj4+PiBvbmx5IHJ1biBvbiBwaHlzaWNhbCB0aHJlYWQgMCBhbmQgdGhlIGFzc29jaWF0ZWQgdmly
dHVhbCB0aHJlYWQgMSB3aWxsDQo+Pj4gcnVuIG9uIHRoZSBhc3NvY2lhdGVkIHBoeXNpY2FsIHRo
cmVhZCAxIG9mIHRoZSBzYW1lIHBoeXNpY2FsIGNvcmUuDQo+Pj4NCj4+PiBQaW5uaW5nIGEgdmly
dHVhbCB0aHJlYWQgMSB0byBhIHBoeXNpY2FsIHRocmVhZCAwIGlzIG5vdCBwb3NzaWJsZSAoaW4N
Cj4+PiByZWFsaXR5IG9ubHkgdGhlIHZpcnR1YWwgY29yZSBpcyBiZWluZyBwaW5uZWQgdG8gdGhl
IHBoeXNpY2FsIGNvcmUpLg0KPj4NCj4+IEJ1dCB0aGF0J3Mgd2hhdCBleGlzdGluZyBndWVzdHMg
bWF5IGJlIGRvaW5nLiBZb3UgbWF5IHdhbnQgdG8NCj4+IHRha2UgYSBsb29rIGF0IG91ciBvbGQs
IG5vbi1wdm9wcyBrZXJuZWxzLCBpbiBwYXJ0aWN1bGFyIHRoZQ0KPj4gZnVuY3Rpb25hbGl0eSBw
cm92aWRlZCBieSB0aGVpciBkcml2ZXJzL3hlbi9jb3JlL2RvbWN0bC5jLiBZZXMsDQo+PiB7c3lz
LGRvbX1jdGwtcyBhcmVuJ3Qgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUga2VybmVsLCBidXQg
dG8NCj4+IGFjaGlldmUgdGhlIGludGVuZGVkIGVmZmVjdHMgSSBzYXcgbm8gd2F5IGFyb3VuZCAo
YWIpdXNpbmcgdGhlbS4NCj4+IChJIG1lYW4gdGhpcyB0byBiZSB0YWtlbiBhcyBhbiBleGFtcGxl
IG9ubHkgLSBJIHJlYWxpemUgdGhhdCB0aGUNCj4+IGNvZGUgdGhlcmUgd291bGRuJ3Qgd29yayBv
biBtb2Rlcm4gWGVuIHdpdGhvdXQgdXBkYXRpbmcsIGR1ZSB0bw0KPj4gdGhlIHN5c2N0bC9kb21j
dGwgaW50ZXJmYWNlIHZlcnNpb24gdGhhdCBuZWVkcyBzZXR0aW5nLikNCj4gDQo+IEZpcnN0IC0g
c3BlYWtpbmcgb2YgImd1ZXN0cyIgaXMgYSBsaXR0bGUgYml0IG1pc2xlYWRpbmcgaGVyZS4gVGhp
cyBpcw0KPiByZXN0cmljdGVkIHRvIGRvbTAuDQo+IA0KPiBTbyB3aGVuIHlvdSB3YW50IHRvIHVz
ZSBzdWNoIGEgZG9tMCBrZXJuZWwgd2l0aCBYZW4gNC4xMyBvciBsYXRlciB5b3UnZA0KPiBuZWVk
IHRvIHN0YXkgd2l0aCBjcHUgc2NoZWR1bGluZy4gQW55IHJlY2VudCBrZXJuZWwgd2lsbCBydW4g
anVzdCBmaW5lDQo+IGFzIGRvbTAgd2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlLg0KDQpSaWdo
dCwgYnV0IHN1Y2ggcmVjZW50IGtlcm5lbHMgaGF2ZSAoYWZhaWN0KSBubyBzb2x1dGlvbiB0byBz
b21lIG9mDQp0aGUgcHJvYmxlbXMgdGhhdCB0aGUgKGFiKXVzZSBvZiB0aGUge3N5cyxkb219Y3Rs
LXMgd2VyZSBtZWFudCB0bw0KYWRkcmVzcy4NCg0KPj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC1pZi5oDQo+Pj4+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlm
LmgNCj4+Pj4+Pj4+PiBAQCAtNDM4LDExICs0MzgsMTEgQEAgc3RhdGljIGlubGluZSBjcHVtYXNr
X3QqIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soc3RydWN0IGRvbWFpbiAqZCkNCj4+Pj4+Pj4+PiDC
oMKgwqDCoMKgICogKiBUaGUgaGFyZCBhZmZpbml0eSBpcyBub3QgYSBzdWJzZXQgb2Ygc29mdCBh
ZmZpbml0eQ0KPj4+Pj4+Pj4+IMKgwqDCoMKgwqAgKiAqIFRoZXJlIGlzIGFuIG92ZXJsYXAgYmV0
d2VlbiB0aGUgc29mdCBhbmQgaGFyZCBhZmZpbml0eSBtYXNrcw0KPj4+Pj4+Pj4+IMKgwqDCoMKg
wqAgKi8NCj4+Pj4+Pj4+PiAtc3RhdGljIGlubGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29u
c3Qgc3RydWN0IHZjcHUgKnYpDQo+Pj4+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGhhc19zb2Z0
X2FmZmluaXR5KGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQ0KPj4+Pj4+Pj4+IMKgwqDC
oMKgIHsNCj4+Pj4+Pj4+PiAtwqDCoMKgIHJldHVybiB2LT5zb2Z0X2FmZl9lZmZlY3RpdmUgJiYN
Cj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWNwdW1hc2tfc3Vic2V0KGNwdXBvb2xf
ZG9tYWluX2NwdW1hc2sodi0+ZG9tYWluKSwNCj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2LT5jcHVfc29mdF9hZmZpbml0eSk7
DQo+Pj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gdW5pdC0+c29mdF9hZmZfZWZmZWN0aXZlICYmDQo+
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgICFjcHVtYXNrX3N1YnNldChjcHVwb29sX2Rv
bWFpbl9jcHVtYXNrKHVuaXQtPnZjcHUtPmRvbWFpbiksDQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5pdC0+Y3B1X3NvZnRf
YWZmaW5pdHkpOw0KPj4+Pj4+Pj4+IMKgwqDCoMKgIH0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBPa2F5
LCBhdCB0aGUgbW9tZW50IHRoZXJlIGxvb2tzIHRvIGJlIGEgMToxIHJlbGF0aW9uc2hpcCBiZXR3
ZWVuIHNjaGVkDQo+Pj4+Pj4+PiB1bml0cyBhbmQgdkNQVS1zLiBUaGlzIHdvdWxkIC0gYXQgdGhp
cyBwb2ludCBvZiB0aGUgc2VyaWVzIC0gaW52YWxpZGF0ZSBtb3N0DQo+Pj4+Pj4+PiBteSBlYXJs
aWVyIGNvbW1lbnRzLiBIb3dldmVyLCBpbiBwYXRjaCA1NyBJIGRvbid0IHNlZSBob3cgdGhpcyB1
bml0LT52Y3B1DQo+Pj4+Pj4+PiBtYXBwaW5nIHdvdWxkIGdldCBicm9rZW4sIGFuZCBJIGNhbid0
IHNlZW0gdG8gaWRlbnRpZnkgYW55IG90aGVyIHBhdGNoDQo+Pj4+Pj4+PiB3aGVyZSB0aGlzIG1p
Z2h0IGJlIGhhcHBlbmluZy4gTG9va2luZyBhdCB0aGUgZ2l0aHViIGJyYW5jaCBJIGFsc28gZ2V0
IHRoZQ0KPj4+Pj4+Pj4gaW1wcmVzc2lvbiB0aGF0IHRoZSBzdHJ1Y3QgdmNwdSAqIHBvaW50ZXIg
b3V0IG9mIHN0cnVjdCBzY2hlZF91bml0IHN1cnZpdmVzDQo+Pj4+Pj4+PiB1bnRpbCB0aGUgZW5k
IG9mIHRoZSBzZXJpZXMsIHdoaWNoIGRvZXNuJ3Qgc2VlbSByaWdodCB0byBtZS4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gSXQgaXMgcmlnaHQuIFRoZSB2Y3B1IHBvaW50ZXIgaW4gdGhlIHNjaGVkX3VuaXQg
aXMgcG9pbnRpbmcgdG8gdGhlIGZpcnN0DQo+Pj4+Pj4+IHZjcHUgb2YgdGhlIHVuaXQgYXQgdGhl
IGVuZCBvZiB0aGUgc2VyaWVzLiBGdXJ0aGVyIHZjcHVzIGFyZSBmb3VuZCB2aWENCj4+Pj4+Pj4g
di0+bmV4dF9pbl9saXN0Lg0KPj4+Pj4+DQo+Pj4+Pj4gSSdtIGFmcmFpZCB0aGlzIHNldHMgdXMg
dXAgZm9yIG1pc3VuZGVyc3RhbmRpbmcgYW5kIG1pc3VzZS4gSSBkb24ndA0KPj4+Pj4+IHRoaW5r
IHRoZXJlIHNob3VsZCBiZSBhIHN0cmFpZ2h0IHN0cnVjdCB2Y3B1ICogb3V0IG9mIHN0cnVjdCBz
Y2hlZF91bml0Lg0KPj4+Pj4NCj4+Pj4+IFRoYXQgd2FzIHRoZSBtb3N0IGVmZmVjdGl2ZSB3YXkg
dG8gZG8gaXQuIFdoYXQgYXJlIHlvdSBzdWdnZXN0aW5nPw0KPj4+Pg0KPj4+PiBBbiBhY3R1YWwg
bGlzdCwgaS5lLiB3aXRoIGEgc3RydWN0IGxpc3RfaGVhZC4gVGhhdCdsbCBtYWtlIG9idmlvdXMg
dGhhdA0KPj4+PiBtb3JlIHRoYW4gb25lIHZDUFUgbWlnaHQgYmUgYXNzb2NpYXRlZCB3aXRoIGEg
dW5pdC4gVGhhdCdzIGV2ZW4gbW9yZSBzbw0KPj4+PiB0aGF0IHRoZSBhYmlsaXR5IHRvIGFzc29j
aWF0ZSBtb3JlIHRoYW4gb25lIGFwcGVhcnMgb25seSBxdWl0ZSBsYXRlIGluDQo+Pj4+IHRoZSBz
ZXJpZXMsIGkuZS4gdGhlcmUgbWF5IGJlIGZ1cnRoZXIgaW5zdGFuY2VzIGxpa2UgdGhlIGNvZGUg
YWJvdmUsIGFuZA0KPj4+PiBpdCB3b3VsZCByZXF1aXJlIGEgY2FyZWZ1bCBhdWRpdCAocmF0aGVy
IHRoYW4gdGhlIGNvbXBpbGVyIGZpbmRpbmcgc3VjaA0KPj4+PiBpbnN0YW5jZSkgdG8gZGV0ZXJt
aW5lIGFsbCBwbGFjZXMgd2hlcmUgdXNpbmcgdGhlIGZpcnN0IHZDUFUgaW4gYSB1bml0DQo+Pj4+
IGlzbid0IHJlYWxseSB3aGF0IHdhcyBtZWFudC4NCj4+Pg0KPj4+IFRCSCBJIGRvbid0IHNlZSBo
b3cgdGhpcyB3b3VsZCBoZWxwIGF0IGFsbC4NCj4+Pg0KPj4+IEluc3RlYWQgb2YgdXNpbmcgdGhl
IHZjcHUgcG9pbnRlciBJJ2QgaGFkIHRvIHVzZSB0aGUgbGlzdCBoZWFkIGluc3RlYWQuDQo+Pj4g
V2h5IGlzIHRoYXQgZGlmZmVyZW50IHRvIGEgcGxhaW4gcG9pbnRlciByZWdhcmRpbmcgZmluZGlu
ZyB0aGUgcGxhY2VzDQo+Pj4gd2hlcmUgdXNpbmcgdGhlIGZpcnN0IHZjcHUgd2FzIHdyb25nPw0K
Pj4NCj4+IFRha2UgdGhlIGV4YW1wbGUgYWJvdmU6IElzIGl0IGNvcnJlY3QgdG8gYWN0IG9uIGp1
c3QgdGhlIGZpcnN0IHZDUFU/DQo+PiBJIGd1ZXNzIF9oZXJlXyBpdCBpcywgYnV0IHRoZSBzYW1l
IHBhdHRlcm4gY291bGQgYmUgZm91bmQgZWxzZXdoZXJlLg0KPj4gSWYsIGZyb20gdGhlIGJlZ2lu
bmluZywgeW91IHVzZSBhIGNsZWFybHkgaWRlbnRpZmlhYmxlIGxpc3QgY29uc3RydWN0LA0KPj4g
dGhlbiBpdCdsbCBiZSBvYnZpb3VzIHRvIHlvdSBhcyB0aGUgd3JpdGVyIGFuZCB0byByZXZpZXdl
cnMgdGhhdCBieQ0KPj4gdGhlIGVuZCBvZiB0aGUgc2VyaWVzIHRoZXJlIG1heSBiZSBtdWx0aXBs
ZSBlbnRpdGllcyB0aGF0IG5lZWQgZGVhbGluZw0KPj4gd2l0aCAtIHdlJ2Qgc2VlIGxpc3RfZmly
c3QqKCkgb3IgZm9yX2VhY2gqKCkgY29uc3RydWN0cyByaWdodCBhd2F5DQo+PiAoYW5kIHlvdSB3
b3VsZG4ndCBiZSBhYmxlIHRvIGNpcmN1bXZlbnQgdGhlaXIgdXNlIGluIGEgd2F5IHRoYXQNCj4+
IHdvdWxkbid0IHRyaWdnZXIgImRvbid0IG9wZW4tY29kZSIgY29tbWVudHMpLg0KPiANCj4gV291
bGQgeW91IGJlIGZpbmUgd2l0aCBqdXN0IHJlbmFtaW5nIHRoZSBwb2ludGVyIHRvICJ2Y3B1X2xp
c3QiPw0KPiBUaGlzIHdvdWxkIGF2b2lkIHRoZSBuZWVkIHRvIGludHJvZHVjZSBhbm90aGVyIHZj
cHUgbGlzdCBpbiBzdHJ1Y3QgdmNwdQ0KPiBhbmQgSSBjb3VsZCByZS11c2UgdGhlIGFscmVhZHkg
ZXhpc3RpbmcgbGlzdCBhcyB0b2RheS4NCg0KV2VsbCwgeWVzLCB0aGlzIHdvdWxkIGF0IGxlYXN0
IG1ha2Ugb2J2aW91cyBhdCB1c2Ugc2l0ZXMgdGhhdCB0aGVyZQ0KbWF5IGJlIG1vcmUgdGhhbiBv
bmUgb2YgdGhlbS4NCg0KPiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBJIG5hbWVkIHRoZSBwb2lu
dGVyIGp1c3QgInZjcHUiIGluIG9yZGVyIHRvDQo+IGF2b2lkIGxvdHMgb2YgcmVmb3JtYXR0aW5n
IGR1ZSB0byBsb25nZXIgbGluZXMsIHRob3VnaC4NCg0KSSBjYW4gYXBwcmVjaWF0ZSB0aGlzIGFz
cGVjdCwgYnV0IGFzIHNhaWQgSSdtIGFmcmFpZCBpdCB3b3VsZCBiZQ0KbWlzbGVhZGluZyAoYW5k
IHBvdGVudGlhbGx5IGludml0aW5nIGZvciBtaXMtdXNlKS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
