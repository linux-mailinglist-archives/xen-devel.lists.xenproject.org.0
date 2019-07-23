Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D9715E7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hprrK-0007fr-J1; Tue, 23 Jul 2019 10:17:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hprrI-0007fm-HG
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:17:24 +0000
X-Inumbo-ID: 0f37e56e-ad33-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f37e56e-ad33-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 10:17:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 10:17:11 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 10:15:35 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 10:15:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls8KXV9Jt9VbNOMbuEzRnwPCQ7yXm+8Hc/Ra526UgBvEThzyI5C0qK/qL5ZHUKPJI/LaERfAaSEYTzH2+3uYpg2CKYhQcxeYgurvT8jTLo6wKx+Qalwqf+DSNNOWqpylvAVRsPO3o+RXuMQzDrbqL+GNFKYDJ22cXTMxO6LBkCvQFS0iokAs28mUNjinSStJ01TC84b4lk2qJDpqQz3K5enJ6723Szkp5LDOUTGKPa2lXGtLo7kxRMltaHUDY0sCszglYYUky5p8mNwFJK8OcoISrAOpNaTLTRoy7tX3z4cd4POAzkfFrSgbVnpmu9Pvfbc7KK3HkCddZhj5zU3RrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQnA8xrsp2idUz4YvSm6FPENyf1F3thukBnTq3Vcld8=;
 b=hITW+Pf3LFnR+g0spjkehhcuoJiElixBB68b43ASK24uGH3YqYBzzVsHlWwvSGbuPAnfZX13IjSirrOhCg6T1bAs2Hba2WmL0/suCi1CR8peAX4txb0YDMJnBOMF1VmbKmZ8MKRo0H0YcluLXKiSTS9jOKeIXzN5CU8TFO1w0kCl0fKUmcKjQwYU/f0KtxhYdTJG5uQVZoTrKKzYcXdlG50cfMmQB8Vft70TXXVRNBxp+AeyiqFuGnAAF1szTS9tyEkySmukSStOH4LLTA3JpAn2b9vnSh8s1A8c3kYmCaVI0l/XtdHhHoWC6389Nsh5Nwpmrwt7zEMq+0e5C2bQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2828.namprd18.prod.outlook.com (20.179.51.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 10:15:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 10:15:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v4 3/6] pci: switch pci_conf_read32 to use pci_sbdf_t
Thread-Index: AQHVPjteQR3oEmN0jU2d9qO7/1J66abYAqAA
Date: Tue, 23 Jul 2019 10:15:35 +0000
Message-ID: <526d01d2-f7c5-b3a9-9947-db4d4e44347d@suse.com>
References: <20190719140724.69596-1-roger.pau@citrix.com>
 <20190719140724.69596-4-roger.pau@citrix.com>
In-Reply-To: <20190719140724.69596-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6777b14b-d087-4dea-9908-08d70f56b383
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2828; 
x-ms-traffictypediagnostic: DM6PR18MB2828:
x-microsoft-antispam-prvs: <DM6PR18MB28286B700E24F95A9246A4BEB3C70@DM6PR18MB2828.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(66556008)(25786009)(66946007)(66476007)(66446008)(64756008)(5660300002)(6486002)(6246003)(486006)(26005)(76176011)(53546011)(102836004)(6436002)(81156014)(186003)(31696002)(4326008)(229853002)(81166006)(53936002)(6512007)(8936002)(256004)(478600001)(71190400001)(71200400001)(316002)(68736007)(8676002)(3846002)(4744005)(80792005)(2906002)(6916009)(54906003)(14454004)(36756003)(66066001)(86362001)(6116002)(386003)(31686004)(6506007)(2616005)(476003)(446003)(11346002)(7736002)(52116002)(7416002)(305945005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2828;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y17fBXW7HBHycDeQ66Yp/UF4a1S3n3rtNtU4pRvF0OB0t5CCeTEand/Y4F74Evoc9iwZF1eZak1EhKwELCOjv+pNUIh+jWR7PBaUFb/apHcwUKiKQfETvKGgNjogpHqaduh3hOojgetzdsArzl3QWXXeDsHl69oeLmeAGS6UzxHr2L7szFW8zDVWR+3o+ojYUx8FJ349u7CaBGi6fq03iBk83r7d1ftoLnD+klGXl1w7o+XRhgezLt+04EYQ7WWNGYreTlFWc4bD1LrGjnSexJMqQxj506dFsguwONSKXvFfIIGPk+pv51UoF8La7y5w1nytxgJrbVbfGPkdoF1cL7OjP2rFnMfLpje5o/prEc5ejBCE6eGT6Nb/o22jQXH/JozZUI4l4kHTT2V+IckG44Ddu20muZAY5uNJD83EzS0=
Content-ID: <7D187405BB3CA84985B66BA9AAF3CD88@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6777b14b-d087-4dea-9908-08d70f56b383
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 10:15:35.1303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2828
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 3/6] pci: switch pci_conf_read32 to use
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNjowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGlzIHJlZHVj
ZXMgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXJzIG9mIHRoZSBmdW5jdGlvbiB0byB0d28sIGFuZA0K
PiBzaW1wbGlmaWVzIHNvbWUgb2YgdGhlIGNhbGxpbmcgc2l0ZXMuDQo+IA0KPiBXaGlsZSB0aGVy
ZSBjb252ZXJ0IHtJR0QvSU9IfV9ERVYgdG8gYmUgYSBwY2lfc2JkZl90IGl0c2VsZiBpbnN0ZWFk
IG9mDQo+IGEgZGV2aWNlIG51bWJlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBBY2tlZC1ieTogQnJpYW4gV29vZHMgPGJy
aWFuLndvb2RzQGFtZC5jb20+DQo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
CndpdGggb25lIGZ1cnRoZXIgcmVtYXJrIChlYXNpbHkgYWRkcmVzc2VkIHdoaWxlIGNvbW1pdHRp
bmcpOg0KDQo+IEBAIC0xMjgsOSArMTI4LDkgQEAgc3RhdGljIHZvaWQgX19pbml0IG1hcF9pZ2Rf
cmVnKHZvaWQpDQo+ICAgICAgIGlmICggaWdkX3JlZ192YSApDQo+ICAgICAgICAgICByZXR1cm47
DQo+ICAgDQo+IC0gICAgaWdkX21taW8gICA9IHBjaV9jb25mX3JlYWQzMigwLCAwLCBJR0RfREVW
LCAwLCBQQ0lfQkFTRV9BRERSRVNTXzEpOw0KPiArICAgIGlnZF9tbWlvICAgPSBwY2lfY29uZl9y
ZWFkMzIoSUdEX0RFViwgUENJX0JBU0VfQUREUkVTU18xKTsNCj4gICAgICAgaWdkX21taW8gPDw9
IDMyOw0KPiAtICAgIGlnZF9tbWlvICArPSBwY2lfY29uZl9yZWFkMzIoMCwgMCwgSUdEX0RFViwg
MCwgUENJX0JBU0VfQUREUkVTU18wKTsNCj4gKyAgICBpZ2RfbW1pbyAgKz0gcGNpX2NvbmZfcmVh
ZDMyKElHRF9ERVYsICBQQ0lfQkFTRV9BRERSRVNTXzApOw0KDQpUaGVyZSBsb29rcyB0byBiZSBh
IHN0cmF5IGJsYW5rIGluIGhlcmUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
