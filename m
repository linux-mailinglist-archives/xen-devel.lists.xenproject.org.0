Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C1204D7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREhf-0002eI-Vf; Thu, 16 May 2019 11:37:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hREhd-0002eD-P4
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:37:37 +0000
X-Inumbo-ID: ffefe144-77ce-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::615])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ffefe144-77ce-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo1J5MdPiZngERnoQFv7iHCBWP+Btx/tkpCyXuOo4lM=;
 b=H24a9QPU8WLPh3lDvYsVGn60biESl27O8eVb6QhmGlFfok0qb+HO+lPgAYG80ssTF6TXssmQ5EpndHgA5x7VczdmPxj6lFPyhXoheE9cOPKVHeNs6Ihs+aGofebkpc//Pyh1VxUotvesOnSPPOdl+T76WCAyfvmyzqqKR/4nAyo=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4369.eurprd08.prod.outlook.com (20.179.34.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Thu, 16 May 2019 11:37:33 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:37:33 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Wei Liu <wei.liu2@citrix.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH] coverage: GCC coverage libfdt Makefile fix
Thread-Index: AQHVC9iGnOE/ASJ430a5sSg0xPj5sqZtnMIAgAADCgA=
Date: Thu, 16 May 2019 11:37:33 +0000
Message-ID: <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
In-Reply-To: <20190516112638.GX2798@zion.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0179.eurprd07.prod.outlook.com
 (2603:10a6:6:43::33) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d28fa60-2735-4887-5015-08d6d9f2e31a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4369; 
x-ms-traffictypediagnostic: AM0PR08MB4369:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4369CDF776EA530862502B6F800A0@AM0PR08MB4369.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(256004)(486006)(99286004)(8676002)(76176011)(229853002)(53936002)(5660300002)(81166006)(476003)(44832011)(11346002)(81156014)(2616005)(446003)(36756003)(14454004)(6436002)(6246003)(8936002)(2906002)(53546011)(52116002)(386003)(6506007)(6486002)(26005)(186003)(478600001)(66946007)(73956011)(66066001)(102836004)(31686004)(25786009)(6512007)(3846002)(54906003)(71200400001)(86362001)(4326008)(68736007)(110136005)(71190400001)(6116002)(316002)(31696002)(66446008)(66476007)(66556008)(64756008)(7736002)(305945005)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4369;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oqngLWnk3i1pX3/drmCve7otFj/BiyyOvGWzwf9V7ZF5KdFhUutJjgguUPON+i0UcoeGW0rO6lis9LEmBbTEiFanE10CSPuRWblm/M2/eOV3yvo5IvtJY1wPjvJQ4Gd1TbQ0ReFGZ1jOkEL0VT4DIceH+gHitLHyvBSBOiIPZBmft771Y4laFA9+LvDFxp3ksWftO17nLmeqDIRaRgm891TJo/kwahXAxtfbrc0ZNux1zLA+2vRY+84JFuYGuJP7iCpXwwKx97JmBYxb37CFfTlQB501H8VPFi9zizie36jcGCnIR1k6v/PnGHjRgm9sLgn5KexNmQ70blzy1uO3L8mg9ZkhG5fFsxxtTh6aVPMg9yPSiEjHsq7/7usMEjKVKg5LmkQ6bUMHdnHKNVCtMdQLoDfT00aF6IxOet1Muig=
Content-ID: <EA281503DA72F246AD7BCF3522AB3FBE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d28fa60-2735-4887-5015-08d6d9f2e31a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:37:33.7158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4369
Subject: Re: [Xen-devel] [PATCH] coverage: GCC coverage libfdt Makefile fix
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE2LzA1LzIwMTkgMTI6MjYsIFdlaSBMaXUgd3JvdGU6DQo+IE9uIFRodSwgTWF5IDE2
LCAyMDE5IGF0IDAyOjEzOjU0UE0gKzAzMDAsIFZpa3RvciBNaXRpbiB3cm90ZToNCj4+IFRoZSBw
YXRjaCByZXNvbHZlcyAneGVuY292JyBjcmFzaGVzIGluIGNhc2Ugb2YgQWFyY2g2NC4NCj4+DQo+
PiBBbGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJvb3QsDQo+PiBp
dCBtZWFucyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFu
eW1vcmUuDQo+PiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29tcGlsZXMgYW55IC5pbml0
IGJpbmFyeSB3aXRob3V0IGdjb3Ygb3B0aW9uLg0KPj4gVGhlIHByb2JsZW0gaXMgY29taW5nIGZy
b20gbGliZmR0Lg0KPj4gVGhlIGVudGlyZSBsaWJyYXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5n
Og0KPj4gJChPQkpDT1BZKSAkKGZvcmVhY2ggcywkKFNFQ1RJT05TKSwtLXJlbmFtZS1zZWN0aW9u
IC4kKHMpPS5pbml0LiQocykpICQ8ICRADQo+PiBTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBN
YWtlZmlsZSB0byBmaWx0ZXIgb3V0IGxpYmZkdC4NCj4+DQo+PiBSZXBvcnRlZC1ieTogVmlrdG9y
IE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+IFRlc3RlZC1ieTogVmlrdG9yIE1p
dGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IA0KPiBBbHRob3VnaCBJIHdvdWxkIGxpa2UgdG8g
YXNrIHlvdSB0byBhZGp1c3QgdGhlIHN1YmplY3QgdG8gYmUgbW9yZQ0KPiBzcGVjaWZpYzoNCj4g
DQo+ICAgIGNvdmVyYWdlOiBmaWx0ZXIgb3V0IGxpYmZkdC5vDQo+IA0KPiBpZiB5b3UgYWdyZWUs
IHRoaXMgY2FuIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZy4NCg0KVGhlcmUgYXJlIG1vcmUgdGhh
biB0aGF0IHRoZSB0aXRsZSB0byBmaXggb24gY29tbWl0LiBUaGUgU2lnbmVkLW9mZi1ieSANCmFu
ZCBkb2VzIG5vdCBtYXRjaCB0aGUgRnJvbSBmb3IgaW5zdGFuY2UuDQoNCkkgaW5pdGlhbGx5IHN1
Z2dlc3RlZCB0aGUgY2hhbmdlLCBzbyBTdWdnZXN0ZWQtYnkgd291bGQgYmUgbW9yZSANCnN1aXRh
YmxlLiBBbmQgdGhlbiBWaWt0b3IgbmVlZHMgdG8gYWRkIGhpcyBzaWduZWQtb2ZmLWJ5Lg0KDQpB
bHNvLCBjb3VsZCB3ZSBhbHNvIGZpeCBsaWJlbGYgYXQgdGhlIHNhbWUgdGltZT8NCg0KQ2hlZXJz
LA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
