Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A368747
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 12:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmyT9-0003R9-FO; Mon, 15 Jul 2019 10:44:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmyT8-0003R4-84
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 10:44:30 +0000
X-Inumbo-ID: 79d28860-a6ed-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79d28860-a6ed-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 10:44:28 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 10:44:13 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 10:43:57 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 10:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW/afKiybCCh/1IFjlo4o1gKsItaKIKvK7+oN843V1oC7P0x5+CX1Yn2rL9MFXmZtUBvy8Y2jC1P31+n/VAX74T/aWkJ7YJSiMh4ggfPLOd+EWsvqIFOXk68NRpo+FGy6aK5YX54eLNwfWAhTLxy86I8c1QB3J6XMVhpQyQQB/B5NdMXMh0PRyP/hqHozdj7TtH4kfC4H+zvC7H1mXuclwc1b85Gg0SHh2fc6kj+dV2lc0kwNbNzsRoxEamSL3HsOfMHNG8dHwyNlCiU2cn3mWZr2sk1tgnmhvu+eOqSGLGLG4RNLv6adBLaro4nMHsS5T2xANTRvFicUTL9HUAkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfWE0m5jgwjn4UMd5bLzeDQWJVHhPeTd031DiDA56eo=;
 b=c3oiWRKV5/ino0FRB01iaEr+c/1Rd/fXyXE7o2ygmf6kcCM6qhob0+2Au6CLfxh94rtCvNNAOHtKKpllj4/oR1Z++1TafkB7ZJCHvJWpvHYiXdNJ/Mq8a6y+YVEVmCmpYy8Atu8tKaRE3rsJRKJle9pjql7TUMvnXJzMfrif9fQOfo3F1xqxCuEDUC353YZMI1uOSxO87EjuPULw2NTrDCMoZdma6U+smJ3i+PpPzzXpTlaZwPNIH294/dEdl3V+WDtoGS/qu9S5lI5i3hkE0CeQXWNN0Qvt26zUcVIdD/iQpSBIGELkUh6OYRAygT46gLJanFtVNrcY+GbatQDcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2524.namprd18.prod.outlook.com (20.179.105.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 10:43:56 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 10:43:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2] xen/mm.h: add helper function to test-and-clear
 _PGC_allocated
Thread-Index: AQHVOu5JruoXiXL6K0+SvpwJHZPvbabLRrMAgAAngBCAAA/GAA==
Date: Mon, 15 Jul 2019 10:43:56 +0000
Message-ID: <cc854558-db7a-9098-6dc8-ca3936a18355@suse.com>
References: <20190715091756.39065-1-paul.durrant@citrix.com>
 <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
 <4a5720ffb5304255a58a83011bf02aa0@AMSPEX02CL03.citrite.net>
In-Reply-To: <4a5720ffb5304255a58a83011bf02aa0@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7455505-b9ba-42b2-6c7f-08d70911561b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2524; 
x-ms-traffictypediagnostic: DM6PR18MB2524:
x-microsoft-antispam-prvs: <DM6PR18MB252410F58B09888A213CDAC3B3CF0@DM6PR18MB2524.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(189003)(199004)(76176011)(386003)(6506007)(4326008)(53546011)(66066001)(86362001)(52116002)(6436002)(31696002)(99286004)(25786009)(7736002)(5660300002)(71200400001)(2906002)(80792005)(486006)(6512007)(66946007)(102836004)(6916009)(476003)(68736007)(66446008)(64756008)(71190400001)(478600001)(6486002)(66476007)(66556008)(305945005)(229853002)(31686004)(14454004)(2616005)(11346002)(53936002)(446003)(7416002)(3846002)(6116002)(26005)(54906003)(186003)(36756003)(316002)(81166006)(81156014)(6246003)(8936002)(14444005)(256004)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2524;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eZao6X5lFGnswJIaSmWch3hKFRa5drA0q5jZ8MJczenyby2U0wqDSEdm5CjSPUsrXuKdS7VveAhccbDDShHS6Ci++gfM0pz01J2pDALZcqueAWiEToEmBws6WbQfYePGZqjnlo8dQaJkFDWAmOvBpSIeqLAKCZK3pQiAN74Gyn6dVYy0+F61GSPLe/r0xZ/7dpVBBG/17oTu8KsOXPI97JutifqRKlZ/ND2B52e4DqXGMb1yRgHUlhQ7O74JK9qtaQJZHcs5ef1kwgPZVsM+D6xymSLH6g+3jRhKGIPIpWQsXaVJDPiwudJf4hk66UP8los6Uu74CaxuOIOZGmZw7MEGkEdIBgyp/uzT3NnOX+jAt5krgCWIH0A+RxJO/pbMU2vJ4Zn52fdc7EHOI04JvSlpSEkUGMp3dbrIhCCwDtQ=
Content-ID: <F03C59B25B6856418EEA42509581C994@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7455505-b9ba-42b2-6c7f-08d70911561b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 10:43:56.0805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2524
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxMTo1MCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMTUgSnVseSAyMDE5IDEwOjI0DQo+
Pg0KPj4gT24gMTUuMDcuMjAxOSAxMToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+IFRoZSBf
UEdDX2FsbG9jYXRlZCBmbGFnIGlzIHNldCBvbiBhIHBhZ2Ugd2hlbiBpdCBpcyBhc3NpZ25lZCB0
byBhIGRvbWFpbg0KPj4+IGFsb25nIHdpdGggYW4gaW5pdGlhbCByZWZlcmVuY2UgY291bnQgb2Yg
YXQgbGVhc3QgMS4gVG8gY2xlYXIgdGhpcw0KPj4+ICdhbGxvY2F0aW9uJyByZWZlcmVuY2UgaXQg
aXMgbmVjZXNzYXJ5IHRvIHRlc3QtYW5kLWNsZWFyIF9QR0NfYWxsb2NhdGVkIGFuZA0KPj4+IHRo
ZW4gb25seSBkcm9wIHRoZSByZWZlcmVuY2UgaWYgdGhlIHRlc3QtYW5kLWNsZWFyIHN1Y2NlZWRz
LiBUaGlzIGlzIG9wZW4tDQo+Pj4gY29kZWQgaW4gbWFueSBwbGFjZXMuIEl0IGlzIGFsc28gdW5z
YWZlIHRvIHRlc3QtYW5kLWNsZWFyIF9QR0NfYWxsb2NhdGVkDQo+Pj4gdW5sZXNzIHRoZSBjYWxs
ZXIgaG9sZHMgYW4gYWRkaXRpb25hbCByZWZlcmVuY2UuDQo+Pj4NCj4+PiBUaGlzIHBhdGNoIGFk
ZHMgYSBoZWxwZXIgZnVuY3Rpb24sIHB1dF9wYWdlX2FsbG9jX3JlZigpLCB0byByZXBsYWNlIGFs
bCB0aGUNCj4+PiBvcGVuLWNvZGVkIHRlc3QtYW5kLWNsZWFyL3B1dF9wYWdlIG9jY3VycmVuY2Vz
IGFuZCBpbmNvcnBvcmF0ZXMgaW4gdGhhdCBhDQo+Pj4gQlVHX09OKCkgYW4gYWRkaXRpb25hbCBw
YWdlIHJlZmVyZW5jZSBub3QgYmVpbmcgaGVsZC4NCj4+DQo+PiBUaGlzIGxhc3Qgc2VudGVuY2Ug
cmVhZHMgc29tZXdoYXQgc3RyYW5nZSB0byBtZSAtIGFyZSB0aGVyZSB3b3Jkcw0KPj4gbWlzc2lu
ZyBhbmQvb3IgbWlzLW9yZGVyZWQ/DQo+IA0KPiBQZXJoYXBzIGl0IHJlYWRzIGJldHRlciBpZiAn
QlVHX09OKCknIGlzIHN1YnN0aXR1dGVkIHdpdGggJ0JVRygpIG9uJz8NCj4gSSBqdXN0IHdhbnRl
ZCB0byBleHByZXNzIHRoYXQgdGhlcmUgd2FzIGEgbmV3IGNoZWNrIGluIHRoZSBoZWxwZXINCj4g
ZnVuY3Rpb24gdGhhdCB0aGUgbmVjZXNzYXJ5IGFkZGl0aW9uYWwgcmVmZXJlbmNlIGlzIGhlbGQu
DQoNCkJ1dCB0aGVuIHN0aWxsIG1vcmUgbGlrZSAiLi4uIGluY29ycG9yYXRlcyBpbiBhIEJVRygp
IG9uIHRoYXQgYW4NCmFkZGl0aW9uYWwgLi4uIj8gQXQgd2hpY2ggcG9pbnQgaXQgaW1vIGNvdWxk
IGFzIHdlbGwgYmUgIi4uLg0KaW5jb3Jwb3JhdGVzIGluIGEgQlVHX09OKCkgdGhhdCBhbiBhZGRp
dGlvbmFsIC4uLiIgKGkuZS4ganVzdCBhDQp3b3JkIG9yZGVyIGNoYW5nZSBmcm9tIHlvdXIgb3Jp
Z2luYWwgc2VudGVuY2UpLiAoVGhlcmUncyB0aGVuDQpwZXJoYXBzIGFsc28gYW4gImlzIiBtaXNz
aW5nIGxhdGVyIGluIHRoZSBzZW50ZW5jZS4pDQoNCj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPj4NCj4+IFdpdGggdGhlIGNvbW1pdCBt
ZXNzYWdlIGFzcGVjdCBjbGFyaWZpZWQNCj4gDQo+IEkgYW0gaGFwcHkgZm9yIHlvdSB0byByZS13
b3JkIGl0IGlmIHlvdSBmZWVsIGl0IGlzIG5vdCBjbGVhci4NCg0KV2VsbCwgdGhlIHByb2JsZW0g
aXMgdGhhdCBJIGRvbid0IGZlZWwgd2VsbCBhZGp1c3Rpbmcgd2hhdCBhIG5hdGl2ZQ0KRW5nbGlz
aCBzcGVha2luZyBwZXJzb24gaGFzIHdyaXR0ZW4uDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
