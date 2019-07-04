Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B95FB46
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj41v-0005ZH-1b; Thu, 04 Jul 2019 15:52:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj41t-0005ZC-Dc
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 15:52:13 +0000
X-Inumbo-ID: 649f66bb-9e73-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 649f66bb-9e73-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 15:52:11 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 15:50:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 15:49:12 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 15:49:12 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3140.namprd18.prod.outlook.com (10.255.136.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 15:49:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 15:49:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
Thread-Index: AQHVMnuvDs7MuQLlgUGtrwp3AJHD/Ka6mw4A
Date: Thu, 4 Jul 2019 15:49:11 +0000
Message-ID: <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
In-Reply-To: <20190704151522.32639-1-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0028.eurprd06.prod.outlook.com
 (2603:10a6:10:100::41) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 564c4610-0821-4245-5b86-08d700972823
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3140; 
x-ms-traffictypediagnostic: BY5PR18MB3140:
x-microsoft-antispam-prvs: <BY5PR18MB3140E34397F736E976059F08B3FA0@BY5PR18MB3140.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(54906003)(66946007)(446003)(11346002)(6512007)(66476007)(31696002)(8936002)(72206003)(53546011)(386003)(6506007)(66556008)(80792005)(316002)(476003)(86362001)(6436002)(66446008)(2616005)(81156014)(2906002)(7736002)(73956011)(305945005)(81166006)(6916009)(229853002)(478600001)(486006)(71200400001)(64756008)(8676002)(5660300002)(71190400001)(99286004)(25786009)(107886003)(26005)(52116002)(6246003)(6116002)(68736007)(3846002)(102836004)(186003)(6486002)(4326008)(14454004)(66066001)(76176011)(36756003)(31686004)(4744005)(53936002)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3140;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PumNd3ni6/J6eRPMAQlWJk0mDM4krShKrGg0br45FshFazuf4AVlYjX3oQuDsgO89ANYyTwpZZC1+VPUw8vCZaN+DFJoZqr4IofOT0q3gdo16JhDR3QBK2i955aKLL6EzAWZkTZi0ocAdVk7M1zIp/VZ6JutIkOsXrH8gDqpTCQTnUfQRnFIVQZV1eaiyVUgw4J9zHLizUWfic89bDsVPBgjYThgcQB+Pk9ldETe8YbBOxCAdPdGw+r1AKDVWzyGjt7utobH9n/AuMLNDpVBy76QRlkQio8584QESnDEebNYy73gQRXwz0RaolQgNWd62Gtr1qn3CcelKW6xET5s3Hv/sPQtIycHRP0Crb25j4Jh58vAjanVj0BRlOydjvZNDRcita3AXjrycQfR5Qe/B54ashTEN97nf0X+Uwm52Qc=
Content-ID: <956276BE96BDBB418F591EEC44EC7C27@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 564c4610-0821-4245-5b86-08d700972823
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 15:49:11.2430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3140
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNzoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFRob3NlIG1hY3Jv
cyB3aGVyZSBpbnRyb2R1Y2VkIHdoZW4gYSBwcmVmaXggInhlbl8iIHdhcyBhZGRlZCB0bw0KPiBt
YixybWIsd21iLiBUaGVyZSBhcmUgZ2F0ZWQgb24gX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXywg
YnV0IHRoZXJlDQo+IGFyZSBub3QgcGFydCBvZiB0aGUgWGVuIGludGVyZmFjZS4gVXNlcnMgb2Yg
cmluZy5oIG5lZWRzIHRvIHByb3ZpZGUNCj4geGVuX1tyd10/bWIoKSBhbnl3YWkgYmVjYXVzZSBb
cnddP21iKCkgaXNuJ3QgbGlrZWx5IHRvIGV4aXN0Lg0KDQpJdCdzIG5vdCBjbGVhciB0byBtZSB3
aGF0IHlvdSB3YW50IHRvIGFjaGlldmU6DQoNCj4gQEAgLTQyLDE0ICs0OSw2IEBADQo+ICAgICog
YW5kIGdyYW50X3RhYmxlLmggZnJvbSB0aGUgWGVuIHB1YmxpYyBoZWFkZXJzLg0KPiAgICAqLw0K
PiAgIA0KPiAtI2luY2x1ZGUgIi4uL3hlbi1jb21wYXQuaCINCj4gLQ0KPiAtI2lmIF9fWEVOX0lO
VEVSRkFDRV9WRVJTSU9OX18gPCAweDAwMDMwMjA4DQo+IC0jZGVmaW5lIHhlbl9tYigpICBtYigp
DQo+IC0jZGVmaW5lIHhlbl9ybWIoKSBybWIoKQ0KPiAtI2RlZmluZSB4ZW5fd21iKCkgd21iKCkN
Cj4gLSNlbmRpZg0KDQpUaGV5J3JlIGFscmVhZHkgbm90IHBvbGx1dGluZyB0aGUgbmFtZSBzcGFj
ZSBmb3IgYW55IG1vZGVybiBjb25zdW1lci4NCkFuZCB5b3UncmUgcmlza2luZyB0byBicmVhayBv
bGQgdmVyYmF0aW0gdXNlcnMgb2YgdGhlIGhlYWRlci4gU3VjaA0KY29tcGF0aWJpbGl0eSBzdHVm
ZiBjYW4sIGluIG15IG9waW5pb24sIHNpbXBseSBuZXZlciBnbyBhd2F5Lg0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
