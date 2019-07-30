Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156787AA08
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:47:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSRD-0005Wo-Lv; Tue, 30 Jul 2019 13:45:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsSRC-0005WT-Sk
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:45:10 +0000
X-Inumbo-ID: 3e982b89-b2d0-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e982b89-b2d0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:45:09 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 13:45:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 13:40:26 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 13:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g71Lphh9pUL4kiwVZhohbt0umReF4UU7mgxvH4PiUGIP4hIK9gDzHxGbd1Vpkngn+Dr1Bm/1gHC+M71bTn8Ubz/s1jjC/20iL58gDMS4w5vwknSUhy+AwGn/j7nRwqW06DRyQaI6SD9taQOPa3EYPEfCP+EuldIgUk/DlGH0DF/MdcNeLLKY9JU3L0Fn0cVgZZMoNemOuo+48hgxTna6kE/dSP1iQSNW6dgGcyelacWYqxPPPekiM0mK6cmdV4WcyOnxh1fBgWTmy1BV3+OMnWgkmTcwRayfHjWw09aOXZZNdyvqvcykJW4HuNu/icWAuevv4J5T8KgYu6lVsHmkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fXMbD66o3QX1orz3ZUfXd5WCNRdtV8excB9NgQwXvE=;
 b=OURu80gTJSmCsqHQIftNYkAF0QTsz1FkTS0mAGXKvhAssYRZPyhtU5sGEK8dBmoV3XSc0W0rsuabj+GrafLaY6KNogmjLz6DYGotQf3u6iHwLkqgWtiFZpKM8+ozLwjchhhWjbdxRmd/GFhCOx1S3fFoZExeNlmzzkYDYxiX1OL5+nDlBTQ6Yy5PYfILSQGuku4fA/vb5AsWzMhxZm4RmoXUrimE84Sx6dqbiY9tbWULMrgetuB259A4VvaBGM+lAnFNrAFufrE5JSTH3LnmsmX8KoAL1C72UzT+HGoRwifQ7EqCETfmOlnhDXww2XL1zsGSPrTlzIYx5ccepR5Gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3139.namprd18.prod.outlook.com (10.255.136.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 13:40:24 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:40:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v4 2/5] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVRtxWbYiD1jQJ/Ue4DR65/axJVA==
Date: Tue, 30 Jul 2019 13:40:24 +0000
Message-ID: <2ec1aa8f-19d0-5f19-9dcd-4cd352d12ce0@suse.com>
References: <20190730131852.20543-1-paul.durrant@citrix.com>
 <20190730131852.20543-3-paul.durrant@citrix.com>
In-Reply-To: <20190730131852.20543-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0002.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 103f041f-522d-4520-c854-08d714f37952
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3139; 
x-ms-traffictypediagnostic: BY5PR18MB3139:
x-microsoft-antispam-prvs: <BY5PR18MB3139BB3229447F084E21F248B3DC0@BY5PR18MB3139.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(68736007)(66476007)(80792005)(81166006)(5660300002)(52116002)(81156014)(8676002)(14454004)(6436002)(6116002)(6916009)(71200400001)(3846002)(25786009)(31696002)(71190400001)(7416002)(6512007)(86362001)(478600001)(8936002)(7736002)(53936002)(26005)(6246003)(53546011)(102836004)(66946007)(66066001)(186003)(2906002)(36756003)(4744005)(66446008)(446003)(476003)(6486002)(229853002)(2616005)(256004)(54906003)(486006)(76176011)(99286004)(6506007)(386003)(64756008)(4326008)(316002)(305945005)(11346002)(31686004)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3139;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TWnnpFFZJquNSAItZTXIvS6EHEu4C5teyG2d2GsoZadvXr+33cAdeWXCbUm80vJ6Kx1zJ+jMgymPIMuJ6wd5ooCo1kQLJ7V+VFmLBRu3yn5Me96LcSw36r974G6XGq56CZZKjMuilKa6WrJlWdKuO2q5J6GhFjH9xy1u6kg50WFeQ5yUKvoPiWDG/z3Cvh73Ulzd7bLBkWlnOrLYGU4k1TU2/qCuth8taOhzHPQ8XG9QPSXMa6vjhBL0ToU+o2r0prZFtLDr96wHBU2jXe3eQyC9mZTHjGIULtK7CZv1s5rR9kRKSj+TsPKkNsELZPcXvAls5aEvKkb0Rof8LRN7U27TuVQdBONWlbDsFyvY/FZFOe0GjxoizC/WIFYE/CG2ec0ZItdZxQ2mLgoDXGI8V2my+Yl8SuIbvyOsVKK/aDM=
Content-ID: <74FF2B1B02BAF14F85916FB3D6B8ADE3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 103f041f-522d-4520-c854-08d714f37952
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:40:24.3779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3139
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 2/5] x86/hvm/domain: remove the
 'hap_enabled' flag
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNToxOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGUgaGFwX2VuYWJs
ZWQoKSBtYWNybyBjYW4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGZlYXR1cmUgaXMgYXZhaWxhYmxl
DQo+IHVzaW5nIHRoZSBkb21haW4gJ29wdGlvbnMnOyB0aGVyZSBpcyBubyBuZWVkIGZvciBhIHNl
cGFyYXRlIGZsYWcuDQo+IA0KPiBOT1RFOiBGdXJ0aGVybW9yZSwgYnkgZXh0ZW5kaW5nIHNhbml0
aXppaW5nIG9mIHRoZSBkb21haW4gJ29wdGlvbnMnLCB0aGUNCj4gICAgICAgIG1hY3JvIGNhbiBi
ZSB0cmFuc2Zvcm1lZCBpbnRvIGFuIGlubGluZSBmdW5jdGlvbiBhbmQgcmUtbG9jYXRlZCB0bw0K
PiAgICAgICAgeGVuL3NjaGVkLmguIFRoaXMgYWxzbyBtYWtlcyBoYXBfZW5hYmxlZCgpIGNvbW1v
biwgdGh1cyBhbGxvd2luZw0KPiAgICAgICAgcmVtb3ZhbCBvZiBhbiB1Z2x5IGlmZGVmIENPTkZJ
R19YODYgZnJvbSB0aGUgY29tbW9uIGlvbW11IGNvZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
