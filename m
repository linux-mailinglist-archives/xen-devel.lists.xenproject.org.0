Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768267A9F9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:46:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSQd-0005DB-A7; Tue, 30 Jul 2019 13:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsSQb-0005Bo-KI
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:44:33 +0000
X-Inumbo-ID: 27afab00-b2d0-11e9-b5a9-579d4ebb19cc
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27afab00-b2d0-11e9-b5a9-579d4ebb19cc;
 Tue, 30 Jul 2019 13:44:30 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 13:44:29 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 13:38:31 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 13:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrK9htCvQMwSgFfbL5KzqAiP6xrG04+lVjqSW5+cuMUkN3W8IJ1gmosRIjxB3LU8lVbu8LvKvZSr+DZNJE81nDUPetLPsE6QPBJTl/XwSh+1eNkCxhpUn/0XjvQjqISVQ5qhtOuksOUDBllXGKatgAJQ2ptpK3TcP7ZKCKy1bwVmuege4NEU9zNOTTVe4h/is1m50bv4zSjrjmCANlAETYUDsTBpW6jqgNnxTksLHStHH8J56adP8rDqd9lKV7CPravj1gc9KHy6fcL7ZhIuJKBsZhG3j5fQKUnHsFE/+KyWM2o1lLdvDi0YKA1qHVj8ZfryhYFuz+wxkIwAs0msxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwlAt2OehTeo9mW3PbTVg+Dm93CezandTO5jJZvsKkI=;
 b=M6DwOUZQ8WzdYSKTo2CHZ6Bwbs2CPNvLgEomqbvSjS45c2+SUEEdhyM5oYoRusyg/JQVlppLXtYbrtkGxLbj6PB7Tz5JoRoa4gBllnfYolNJxL6ZRELOsbL3vypYfZAJ6kZm9ZnSSLh4DcCwTfpe3aSn4lTe6Z2QcHVPNLR3CJzv9vmGtzUTOmR6lTSIWHBbih+bXfog2Ae4SUrrrV2trw5Ek4JOr+JNL1Ldgr6tuK4WQY08yMnAKWx+TOk1Sz/n1fDRP2FYhtND1URRuSvV4mg81nMCHJ0hV9ZAgu9KzKO+WmaAOV8vZUu6dJVw1bhwTWnLj2XT7SihInV6774JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3139.namprd18.prod.outlook.com (10.255.136.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 13:38:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:38:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v4 1/2] common/grant_table: harden bound
 accesses
Thread-Index: AQHVRtj90XYoVpwrQku2OrPMiAgfMabjKmoA
Date: Tue, 30 Jul 2019 13:38:30 +0000
Message-ID: <1687791e-0c6a-5fc0-36f1-e8429e829590@suse.com>
References: <1564492503-22716-1-git-send-email-nmanthey@amazon.de>
 <1564492503-22716-2-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1564492503-22716-2-git-send-email-nmanthey@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:10:110::18) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7856e95-d7e0-4bdc-ef55-08d714f33548
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3139; 
x-ms-traffictypediagnostic: BY5PR18MB3139:
x-microsoft-antispam-prvs: <BY5PR18MB3139E4BDA8D15C3B812AA6CDB3DC0@BY5PR18MB3139.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(68736007)(66476007)(80792005)(81166006)(5660300002)(52116002)(81156014)(8676002)(14454004)(6436002)(6116002)(6916009)(71200400001)(3846002)(25786009)(31696002)(71190400001)(7416002)(6512007)(86362001)(478600001)(8936002)(7736002)(53936002)(26005)(6246003)(53546011)(102836004)(66946007)(66066001)(186003)(2906002)(36756003)(66446008)(14444005)(446003)(476003)(6486002)(229853002)(2616005)(256004)(54906003)(486006)(76176011)(99286004)(6506007)(386003)(64756008)(4326008)(316002)(305945005)(11346002)(31686004)(66556008)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3139;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ujyqU8aPlAMSBvAFcMORWXPZ1oYYxsy8nN/s/IvzPHOInnVTkDaJ1aXhk9B1ImS3jf1lu4l3wrtzF/4nSJZzGF0M5Oswh901fuSMJFPagcMw5kS1i2Vk98r904ycXJ4XWqOdTdztTPBjACMAksVhzV/e6X3t/KvxJFpCuFpw+HmFPFSKpTKOMyrr0lbKadRPw1BoFKP4xRFjc/dg1vhHoUHmrCpT585S0SxWlmm9HSC6EU7jmWCBN/pzWS0Al3ZkuQfroOTy3//TzxerV1BxSpBRrsJz29cAhV74jdmsH4UpDt5iDyHC+wzGkklOCzD205UL+BSiFfYel3n3gAP6jMl4JceQb0hWs0kelEc4WclLhhVRAX6DGMs+z02i2QhUC0YEglkBRePMsuNvl/qpK6x2hT97tF3B5OWIJbN9ANI=
Content-ID: <6F64D99DFCCF314890BCA0EE0031157B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e7856e95-d7e0-4bdc-ef55-08d714f33548
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:38:30.2024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3139
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v4 1/2] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNToxNSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBHdWVzdHMgY2Fu
IGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxl
ZA0KPiBkYXRhIHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkg
bG9hZHMgYWZ0ZXIgYm91bmQNCj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMsIHdlDQo+IHVzZSB0aGUgYXJyYXlfaW5kZXhf
bm9zcGVjIG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybw0KPiBibG9ja19zcGVj
dWxhdGlvbi4gTm90ZSwgdGhlIGJsb2NrX3NwZWN1bGF0aW9uIG1hY3JvIGlzIHVzZWQgb24gYWxs
DQo+IHBhdGggaW4gc2hhcmVkX2VudHJ5X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcy4gVGhp
cyB3YXksIGFmdGVyIGENCj4gY2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVj
a3MgdGhhdCBoYXBwZW5lZCBiZWZvcmUgYmVjb21lDQo+IGFyY2hpdGVjdHVyYWwgdmlzaWJsZSwg
c28gdGhhdCBubyBhZGRpdGlvbmFsIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQNCj4gZm9yIGNvcnJl
c3BvbmRpbmcgYXJyYXkgYWNjZXNzZXMuIEFzIHRoZSB3YXkgd2UgaW50cm9kdWNlIGFuIGxmZW5j
ZQ0KPiBpbnN0cnVjdGlvbiBtaWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRh
aW4gdmFsdWVzIGZyb20NCj4gbWVtb3J5IG11bHRpcGxlIHRpbWVzLCB3ZSB0cnkgdG8gYXZvaWQg
c3BlY3VsYXRpdmVseSBjb250aW51aW5nDQo+IGV4ZWN1dGlvbiB3aXRoIHN0YWxlIHJlZ2lzdGVy
IGRhdGEgYnkgbW92aW5nIHJlbGV2YW50IGRhdGEgaW50bw0KPiBmdW5jdGlvbiBsb2NhbCB2YXJp
YWJsZXMuDQo+IA0KPiBTcGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4gY2Fz
ZSBvbmUgb2YgdGhlIGZvbGxvd2luZw0KPiBwcm9wZXJ0aWVzIGlzIHRydWU6DQo+ICAgLSBwYXRo
IGNhbm5vdCBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0DQo+ICAgLSBwYXRoIGRvZXMgbm90IHJl
dHVybiB0byB0aGUgZ3Vlc3QNCj4gICAtIHBhdGggZG9lcyBub3QgcmVzdWx0IGluIGFuIG91dC1v
Zi1ib3VuZCBhY2Nlc3MNCj4gDQo+IE9ubHkgdGhlIGNvbWJpbmF0aW9uIG9mIHRoZSBhYm92ZSBw
cm9wZXJ0aWVzIGFsbG93cyB0byBhY3R1YWxseSBsZWFrDQo+IGNvbnRpbnVvdXMgY2h1bmtzIG9m
IG1lbW9yeS4gVGhlcmVmb3JlLCB3ZSBvbmx5IGFkZCB0aGUgcGVuYWx0eSBvZg0KPiBwcm90ZWN0
aXZlIG1lY2hhbmlzbXMgaW4gY2FzZSBhIHBvdGVudGlhbCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQNCj4gYWNjZXNzIG1hdGNoZXMgYWxsIHRoZSBhYm92ZSBwcm9wZXJ0aWVzLg0KPiANCj4gVGhp
cyBjb21taXQgYWRkcmVzc2VzIG9ubHkgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIHdob3NlIGluZGV4
IGlzDQo+IGRpcmVjdGx5IGNvbnRyb2xsZWQgYnkgdGhlIGd1ZXN0LCBhbmQgdGhlIGluZGV4IGlz
IGNoZWNrZWQgYmVmb3JlLg0KPiBQb3RlbnRpYWwgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIHRoYXQg
YXJlIGNhdXNlZCBieSBzcGVjdWxhdGl2ZWx5DQo+IGV2YWx1YXRpbmcgdGhlIHZlcnNpb24gb2Yg
dGhlIGN1cnJlbnQgdGFibGUgYXJlIG5vdCBhZGRyZXNzZWQgaW4gdGhpcw0KPiBjb21taXQuIEhl
bmNlLCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmQgYWNjZXNzZXMgbWlnaHQgc3RpbGwgYmUNCj4g
cG9zc2libGUsIGZvciBleGFtcGxlIGluIGdudHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbiwgd2hl
biBjYWxsaW5nDQo+IGdudHRhYl9ncm93X3RhYmxlLCB0aGUgYXNzZXJ0aW9uIHRoYXQgdGhlIGdy
YW50IHRhYmxlIHZlcnNpb24gZXF1YWxzDQo+IHR3byBtaWdodCBub3QgaG9sZCB1bmRlciBzcGVj
dWxhdGlvbi4NCj4gDQo+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5n
IGVmZm9ydC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlA
YW1hem9uLmRlPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICB2MzogIERyb3AgY29uZGl0aW9uIHRvIG5vdCBm
aXggZGVmZWN0cyBpbiBjb21taXQgbWVzc2FnZS4NCj4gICAgICAgICBDb3B5IGluIHJldmlld2Vk
LWJ5Lg0KDQpBY2NvcmRpbmcgdG8gdGhpcyAod2hpY2ggYWl1aSBtZWFucyB2NCkgdGhlcmUgYXJl
IG5vIGNvZGUgY2hhbmdlcw0KY29tcGFyZWQgdG8gdjMuIEF0IHRoZSByaXNrIG9mIGFubm95aW5n
IHlvdSwgdGhpcyBkb2Vzbid0IGZpdCB3ZWxsDQp3aXRoIG1lIGhhdmluZyBzYWlkICJhbmQgdGhl
biBwZXJoYXBzIG1ha2UgY2hhbmdlcyB0byBhIGZldyBtb3JlDQpwYXRocyIgYWxvbmdzaWRlIHRo
ZSBvcHRpb24gb2YgZG9pbmcgdGhpcyByZW1vdmFsIGluIHJlcGx5IHRvIHYzLg0KQWZ0ZXIgYWxs
IHlvdSd2ZSBub3cgZHJvcHBlZCBhIGNvbmRpdGlvbiBmcm9tIHdoYXQgaXMgY292ZXJlZCBieQ0K
Ik9ubHkgdGhlIGNvbWJpbmF0aW9uIG9mIC4uLiIsIGFuZCBoZW5jZSB0aGVyZSdzIGEgd2lkZXIg
c2V0IG9mDQpwYXRocyB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgZml4ZWQuIEl0IHdhcyBmb3IgdGhp
cyByZWFzb24gdGhhdCBhcw0KdGhlIG90aGVyIGFsdGVybmF0aXZlIEkgZGlkIHN1Z2dlc3QgdG8g
c2ltcGx5IHdlYWtlbiB0aGUgd29yZGluZw0Kb2YgdGhlIGl0ZW0geW91J3ZlIG5vdyBkcm9wcGVk
LiBJT1cgSSdtIGFmcmFpZCBteSBSLWIgaXMgbm90DQphcHBsaWNhYmxlIHRvIHY0Lg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
