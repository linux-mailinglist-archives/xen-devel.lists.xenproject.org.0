Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B577A4E5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOcH-0000qw-61; Tue, 30 Jul 2019 09:40:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsOcF-0000qe-SX
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:40:19 +0000
X-Inumbo-ID: 03b55a82-b2ae-11e9-8810-4f757573f4aa
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03b55a82-b2ae-11e9-8810-4f757573f4aa;
 Tue, 30 Jul 2019 09:40:17 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:40:10 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:25:43 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvD6C5rcC1QOlXQm6FmPY/+jZSgdOznk9xSZtc+bmNvhVZzm+igCaTcf08IXgkrhdz6K9Q+QbogVMYUrSljnSVjtSCqW2GrAR9/59g+atGRy2ccbn1+mSTxXpRL84O4bNlP3K3yF9LZ0LDSeRVNnKlkhT4BYV816U9iYeiV5pDj308I5fcPXsrwWZ359YQSR8IO4Sx2ZMDbP9hOW3xh9OZuQwcyTrf0C/UHBCfvVezd4h9L5bnYj47cPkddUXkrht4efEhL7BukA6t8bAC2Dn7nCRsuBI5l246JHSA/9edffX5hf1CJD2S0P/NtGLIqUGghRUcSRusultVgUvjvUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuOmEbuFZEAmyUFfx8Ga+gl0RhxRuHwSJkSV3MFtve4=;
 b=Zbh8cDHt4bix22D1d0SuLXCFlcjY4/druOWUJ+Ng3uy8i/SeaJ/AvooMU6MzGCUfcVBQnrBdHnKWnPGNyLd/tbG4ohPYgVsQEFTJmRZNCKugmZA9smAXuuMYh9rrxPfjChMIYiqMoZlOouFfWyRa+692XHpM6asfu5MXzckDUuVOLLscHJ+WtozmiIwrbfvK4xEVkP+/Na1vLq02BXO7ZRmxHDJp7LxqpWhbNjKf908YBYFOosIyyBQy5uEwqAhmWsMtnvpWz0ETuJnmCxPBwhcKqf+JpDrE01PProGnj20HgjLCuzV7cbqyevDumJZhFGLXaTk/+EwsZogryoLxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3153.namprd18.prod.outlook.com (10.255.139.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 09:25:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:25:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQu6akvnjr7AS1UCxO+8m8M4Duqbi6UsAgAACVAA=
Date: Tue, 30 Jul 2019 09:25:42 +0000
Message-ID: <42eab6c8-0e11-e44a-5aa0-32c3c4244249@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-2-paul.durrant@citrix.com>
 <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
In-Reply-To: <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b2a74f6-1664-48fe-bd21-08d714cfe486
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3153; 
x-ms-traffictypediagnostic: BY5PR18MB3153:
x-microsoft-antispam-prvs: <BY5PR18MB315317F64C6F2F3E4B38BD02B3DC0@BY5PR18MB3153.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(4326008)(7416002)(80792005)(81166006)(81156014)(99286004)(7736002)(8676002)(71190400001)(6116002)(71200400001)(3846002)(86362001)(31696002)(68736007)(14454004)(25786009)(478600001)(2906002)(8936002)(6436002)(6916009)(6512007)(305945005)(6246003)(102836004)(26005)(446003)(53936002)(316002)(66066001)(186003)(4744005)(66946007)(36756003)(66556008)(53546011)(66476007)(476003)(76176011)(6486002)(229853002)(2616005)(52116002)(31686004)(486006)(386003)(6506007)(5660300002)(256004)(54906003)(11346002)(66446008)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3153;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qp/0gjjHohbjcbR+1o7UWOslUBHz+WGVHRx3dj2JK7oCX2ZySDJR8vYDcz9zKiVsPrgaM3BuIceOu+a6v/Idm8TgTrXHnwMlVzrt8AD83sudTg3ccUt4Vj90bnSdAld9GLC/0Wu1mV+CjnnvfEc8cYTmjH8pBQcJAJ+Ni/uXzoLYFaRmKufntYOgE7sabzGcv8/Z87bt5IYPwFQn79nfhEtsxmrhHXT1ViXJitzgh5PumCbBJf8byuDxQ/wALqKy9OWFHkm4pfH4EiczPSywVQ8vAGeOGgyTNIQUsFaUT/1g6dyuKuWCC8yWMG7GGur8xGuYzB1CWzaRuLFfBNF7xvurt0+4lVeVCRLRMsUfe3IivkuoyDreU3B+rkzKwCMhX9evx4MUsHJ1m2MyTBeNRnUipKpm3Tk12LKFV/BRCEs=
Content-ID: <EB1C9FD93A41644193A5148B1361DB21@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2a74f6-1664-48fe-bd21-08d714cfe486
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:25:42.2824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3153
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/6] domain: stash
 xen_domctl_createdomain flags in struct domain
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI1LjA3LjIwMTkg
MTU6MzksIFBhdWwgRHVycmFudCB3cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gQEAgLTMwNiw2ICszMDYs
NyBAQCBlbnVtIGd1ZXN0X3R5cGUgew0KPj4gICAgDQo+PiAgICBzdHJ1Y3QgZG9tYWluDQo+PiAg
ICB7DQo+PiArICAgIHVuc2lnbmVkIGludCAgICAgb3B0aW9uczsgICAgICAgICAvKiBjb3B5IG9m
IGNyZWF0ZWRvbWFpbiBmbGFncyAqLw0KPj4gICAgICAgZG9taWRfdCAgICAgICAgICBkb21haW5f
aWQ7DQo+PiAgICANCj4+ICAgICAgIHVuc2lnbmVkIGludCAgICAgbWF4X3ZjcHVzOw0KPiANCj4g
SSB3YXMgYWJvdXQgdG8gY29tbWl0IHRoaXMgd2hlbiBJIG5vdGljZWQgdGhlIHBsYWNlbWVudCBo
ZXJlOg0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIHByZXR0eSBnb29kIHRvIHJldGFpbiBkb21haW5f
aWQgYXMgdGhlDQo+IGZpcnN0IGZpZWxkLiBJJ2xsIGJlIGhhcHB5IHRvIG1ha2UgdGhhdCBhZGp1
c3RtZW50IHdoaWxlDQo+IGNvbW1pdHRpbmcsIGFzIGxvbmcgYXMgeW91IGFyZSBmaW5lIHdpdGgg
bWUgZG9pbmcgc28uDQoNCkFuZCBJIHJlYWxpemUgSSBzaG91bGQgaGF2ZSBzYWlkIHdoZXJlIEkn
ZCB3YW50IHRvIHB1dCBpdDogSQ0KdGhpbmsgaXQgd2FudHMgdG8gZ28gbmV4dCB0byBndWVzdF90
eXBlLCBzbyB0aGF0IG9uY2UgdGhhdA0KZmllbGQgZ29lcyBhd2F5IHN0cnVjdHVyZSBsYXlvdXQg
KGkuZS4gaG9sZXMgYW5kIG92ZXJhbGwgc2l6ZSkNCmlzIHRoZSBzYW1lIGFnYWluLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
