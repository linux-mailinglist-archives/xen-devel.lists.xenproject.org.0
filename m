Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134178C5A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:11:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5OH-0003WR-S9; Mon, 29 Jul 2019 13:08:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5OF-0003WM-Kg
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:08:35 +0000
X-Inumbo-ID: f2338b08-b201-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f2338b08-b201-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:08:34 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:08:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 12:50:39 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 12:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wmw2Ncd4soPavSeBm9RF6mWj6g0+1Vy3Tnjbu5sFdhyGJRSL7aSAkjEN8kSuxZe9pTOpTgN+G3U1J3u8k+dHQsPm+ALkABioJm01VYjVb13dhlFsy2z2jJLzd4XQ4c+cbdyyjzFMmmzeCsWEDAeYz/s2zcP9QxdtUSR6Y2UJSHwJ+5i/3NZlW0Ich26yCyBZu5wiLGd1jKSCgeyVEVdXo03ZVErMLzp8C7XQt+mROsuooq2IxxuKbRiiPPXyRqnjP6/gsF/WpdwIFmYZwLvV8+ilO+V4TN8t+9pB5w5fE89HM03bsPpsIpX6+gKQJpbsGBz06Lj5T0VVnbHQrsmKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvVwpXl/uGbGW6vhgg/4yOh9mhTVQPqs90rGeyuzpfk=;
 b=K+YlzUYRF7gQ0Izl8KZp3ktfDjsCLNkYDxPsWTnolnWIWVolCndg0zsA5ejtyexixJc7VhalvrDvq52yl0B5OfnURkGqYo3U4RW4mrSvxhVIRcJl1GBLN09T2WUkYzVW2MJLM9kqgaLMo/vwl1ZUdFI5XUasT5dw7uhuA+13W61pFh67akzMetHg86gKIRMnPIEcSGo0NlQmUr+uokQpLV5dtsd3QyaMK3d9s4LBsIjBTfUe7g/yRXZFyenfHR0+eSO9jymkvADvbMBI0rcmLJRXbl8Q7J7F6c1k0+m+D1dqTDAHkJNNtpETQA/xubnjV7KdKzCD7s82jeG/mfEJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 12:50:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 12:50:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xen/percpu: Drop unused xen/percpu.h
 includes
Thread-Index: AQHVQ/Zh/YUAj+gdbkS2I/t6mSzgwabhTxScgABBaIA=
Date: Mon, 29 Jul 2019 12:50:38 +0000
Message-ID: <d2b5e44c-5190-fb94-3eb0-c4219a0ae853@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-3-andrew.cooper3@citrix.com>
 <20190729085548.ctmpyyg4la44pqhx@Air-de-Roger>
In-Reply-To: <20190729085548.ctmpyyg4la44pqhx@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:6:1::30)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d65e803-8e39-4edb-cddc-08d714235b29
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB32046B615B5C43AD04C58FD0B3DD0@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(199004)(189003)(3846002)(6116002)(486006)(256004)(5660300002)(86362001)(52116002)(76176011)(66476007)(4744005)(14454004)(386003)(6512007)(66946007)(31696002)(305945005)(36756003)(64756008)(66446008)(7736002)(66556008)(446003)(53936002)(4326008)(99286004)(6436002)(31686004)(229853002)(316002)(6916009)(6246003)(25786009)(8676002)(6486002)(8936002)(102836004)(26005)(2906002)(478600001)(11346002)(68736007)(2616005)(476003)(71190400001)(71200400001)(6506007)(53546011)(66066001)(186003)(54906003)(80792005)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C8im5KMnQVdwKBySHwyeIf7WWxSykQkJFKD7gQz9PBWGanIqbP96UjKjF8pJbsY+Urc0YSWjeDWztbXVJaleSdW4hg3cA1DiM+F/1yePDFK2dT1jHQgyTIiQ24CSEeX49bdKSmiDFSm5TzWdj52YCOmJ4ArXEi0zIvvw1Oqb0N2wQpp4rT5MQiAp2LS5sbgsyeyQo2LBwMk77Uhk0+8beVxlrszKq7pmoJx7vVbzhmjYgSZ4PG2gagR+dcCVJNgB7jReOm6ao+erZSDF4MP3t5XepX40Ix1n64+NVvLgE7e2l8ydgsIIJmQXr8KtePXrJCR1uU9pzoWmK3+iHxfpYgnnYtuhtnozZhq/Czu1eBkHlYcZRGoUAp7Rt7gZblGyRramjBL+qC9CXDatPoFFwr2olx7Qpxn8z9iLI4Eibcg=
Content-ID: <ED0D2D84F4E1644D8248A1C06039FF84@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d65e803-8e39-4edb-cddc-08d714235b29
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 12:50:38.4280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/4] xen/percpu: Drop unused xen/percpu.h
 includes
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
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxMDo1NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIEZyaSwg
SnVsIDI2LCAyMDE5IGF0IDEwOjA4OjUyUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+
PiBOb25lIG9mIHRoZXNlIGhlYWRlcnMgdXNlIGFueSBQRVJfQ1BVKCkgaW5mcmFzdHJ1Y3R1cmUu
DQo+Pg0KPj4geGVuL3J3bG9jay5oIGhvd2V2ZXIgZG9lcywgYW5kIHBpY2tlZCBpdCB1cCB0cmFu
c2l0aXZlbHkgdmlhIHhlbi9zcGlubG9jay5oLA0KPj4gc28gaW5jbHVkZSBpdCBwcm9wZXJseS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KDQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
