Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC915E1BE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicDn-0005Vm-97; Wed, 03 Jul 2019 10:10:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hicDl-0005Vg-8O
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:10:37 +0000
X-Inumbo-ID: 9814b75f-9d7a-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9814b75f-9d7a-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:10:35 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 10:09:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 09:56:42 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 09:56:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3233.namprd18.prod.outlook.com (10.255.137.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Wed, 3 Jul 2019 09:56:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 09:56:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH 2/3] xmalloc: don't evaluate ADD_REGION without holding
 the pool lock
Thread-Index: AQHVMPSuClHUQGWGbkumdd77q0hah6a4qUgA
Date: Wed, 3 Jul 2019 09:56:41 +0000
Message-ID: <89a07d9f-1c10-90f6-55aa-659a27641d7b@suse.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-3-paul.durrant@citrix.com>
In-Reply-To: <20190702163840.2107-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:6::46)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b46b1c7-f938-4a32-1b50-08d6ff9cbf3f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3233; 
x-ms-traffictypediagnostic: BY5PR18MB3233:
x-microsoft-antispam-prvs: <BY5PR18MB3233D953D78EB3E3A1F86457B3FB0@BY5PR18MB3233.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(189003)(199004)(31686004)(80792005)(6436002)(6486002)(229853002)(256004)(11346002)(2616005)(476003)(2906002)(7416002)(14444005)(446003)(72206003)(478600001)(53936002)(6246003)(6512007)(68736007)(66066001)(14454004)(25786009)(76176011)(7736002)(6916009)(5660300002)(73956011)(386003)(6506007)(71190400001)(8936002)(64756008)(486006)(66476007)(66946007)(66446008)(66556008)(102836004)(4326008)(52116002)(305945005)(81166006)(81156014)(8676002)(71200400001)(99286004)(53546011)(54906003)(86362001)(6116002)(31696002)(3846002)(26005)(316002)(36756003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3233;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x3dC8QeBHYj/GHGu303XgubZlD8cQtrBpqqc24bf6+/p4zgdu4V49SOjgHQKTIjbU4bjLUnGVfKnaRtnFL3wIV3u5h3deWjtDVO0itSJMGG83fkAUSBaBMhgGsl2NMKmfg5tcHcxLMjRvFDx/MlfGSNINCuPtl/LIdfvqhfz6odWmdJR09sx7ORlUFqlCbuMIqub3dtQQwc1vPLe5Ixt+u7nqKPmffeUh2HNzh3/YC4Gl5lbKso6SS0eBySf3iIzAiN4Zit2xEpzB6URnIBa5dIVNI2RaH/TLfRyOrwrbN51S1KCpgD6H4egRefLKGhKpKvSpFf99r2ZI6KP0wZyk7bNMejFvBazwHztOO0lkXHof5OfHSIDa9xvJH+gn70H3W1xB5xViF1mgg0MrVKcKa/Pt985uwddvvwS41Ff2R4=
Content-ID: <E78A82F0AABC5A4FB1DA5AE5B9F50A13@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b46b1c7-f938-4a32-1b50-08d6ff9cbf3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 09:56:41.1906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3233
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/3] xmalloc: don't evaluate ADD_REGION
 without holding the pool lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxODozOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vY29t
bW9uL3htYWxsb2NfdGxzZi5jDQo+ICsrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMNCj4g
QEAgLTM4MCwxOCArMzgwLDIyIEBAIHZvaWQgKnhtZW1fcG9vbF9hbGxvYyh1bnNpZ25lZCBsb25n
IHNpemUsIHN0cnVjdCB4bWVtX3Bvb2wgKnBvb2wpDQo+ICAgICAgaW50IGZsLCBzbDsNCj4gICAg
ICB1bnNpZ25lZCBsb25nIHRtcF9zaXplOw0KPiAgIA0KPiArICAgIHNwaW5fbG9jaygmcG9vbC0+
bG9jayk7DQo+ICAgICAgaWYgKCBwb29sLT5pbml0X3JlZ2lvbiA9PSBOVUxMICkNCj4gICAgICB7
DQo+ICsgICAgICAgc3Bpbl91bmxvY2soJnBvb2wtPmxvY2spOw0KPiAgICAgICAgIGlmICggKHJl
Z2lvbiA9IHBvb2wtPmdldF9tZW0ocG9vbC0+aW5pdF9zaXplKSkgPT0gTlVMTCApDQo+ICAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KPiArICAgICAgIHNwaW5fbG9jaygmcG9vbC0+bG9jayk7DQo+ICAg
ICAgICAgQUREX1JFR0lPTihyZWdpb24sIHBvb2wtPmluaXRfc2l6ZSwgcG9vbCk7DQo+IC0gICAg
ICAgcG9vbC0+aW5pdF9yZWdpb24gPSByZWdpb247DQo+ICsgICAgICAgLyogUmUtY2hlY2sgc2lu
Y2UgdGhlIGxvY2sgd2FzIGRyb3BwZWQgKi8NCj4gKyAgICAgICBpZiAoIHBvb2wtPmluaXRfcmVn
aW9uID09IE5VTEwgKQ0KPiArICAgICAgICAgICBwb29sLT5pbml0X3JlZ2lvbiA9IHJlZ2lvbjsN
Cj4gICAgICB9DQoNCkluc3RlYWQgb2YgdGhpcywgaG93IGFib3V0IGRlbGV0aW5nIHRoZSBpbml0
X3JlZ2lvbiBmaWVsZD8NCkl0J3Mgbm90IHJlYWxseSB1c2VkIGFueXdoZXJlLiBJJ20gbm90IGdv
aW5nIHRvIGV4Y2x1ZGUgdGhhdA0KZnVuY3Rpb25zIGxpa2UgRklORF9TVUlUQUJMRV9CTE9DSygp
IGV4cGVjdCBfc29tZV8gcmVnaW9uIHRvDQpiZSB0aGVyZSBpbiB0aGUgcG9vbCwgYnV0IHRoYXQg
c3RpbGwgd291bGRuJ3QgcmVxdWlyZQ0KdHJhY2tpbmcgd2hpY2ggb25lIHdhcyB0aGUgZmlyc3Qg
dG8gZ2V0IGFsbG9jYXRlZC4gQSBjaGVjaw0KbGlrZSB0aGF0IGluIHhtZW1fcG9vbF9kZXN0cm95
KCkgd291bGQgdGhlbiBkbyBoZXJlIHRvIG1ha2UNCnN1cmUgYXQgbGVhc3Qgb25lIHJlZ2lvbiBp
cyB0aGVyZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
