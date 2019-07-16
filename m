Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34266A34A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnICg-00034p-KF; Tue, 16 Jul 2019 07:48:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnICe-00034Z-RM
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:48:48 +0000
X-Inumbo-ID: 237091fe-a79e-11e9-b559-f3e1a453f59b
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 237091fe-a79e-11e9-b559-f3e1a453f59b;
 Tue, 16 Jul 2019 07:48:45 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:48:45 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:42:18 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTMiJ1LoXxnvDnYsP1gHDVUYXycChlEyoFXsvlSXCjRs7eFeN6xl4iQMhMLhcisSmFMLleStCRXA5tksGtYnzexMibHxPi3clyTytHcrEr9PxI+V0Jg+1wQiTqQubSPqWTmFzbQl2el8t6M5pqODJh1OLRDKKB61gmSeCwH+npjcoZ1OtNPqzibj9fw4ZEiWcCQOZiB63+4wQlm5Q74ufR0vuSdGzRyvxtXvNDpUVBq28n/+Q3hWp+P8k/G+fwFeUEvBpbwAtGIA8EWzxc2ca8CuanmAlS2xJI60yyTQN4wBHNwfkVksj/YVdXINk11X2xzJ8BPEx6QuwcFOYnoyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DLRyLVa47HeumEAIDYVDIcxrFhYKOx7Yr5EcFAH3bU=;
 b=BdapuSBL2ukZd7smOkwYH6WRchNgxSwtz7wPy5ffduYPzuScSRJIFNVt4qaXsjQOnidA843Grx3RIUqHToGQm4TW0catBL8dKpnCIk+b/X8mD4GrtWszRuM4wPvouBvh5VRR/w7RM4hy5ue8hlXW1mb9YX7DDgJS+RwxITWZcVRlCIITZmr65aJ0FHkH3lTTh9xMlMK/re/uPGFtb1lQzdYrk8qtd76BSGGXbVabRocCvOO4t+yy0XRCZvJy7x1kipEauCjRyxgOuJjXqaCosh6wGuWDudSPbUwvH9TUtP4/8qwSdR0VnT33YuLyHykwGVL/eYIu4FijDm+nC+iQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0052.namprd18.prod.outlook.com (20.178.229.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Tue, 16 Jul 2019 07:42:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:42:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 08/13] x86/IRQs: correct/tighten vector check in
 _clear_irq_vector()
Thread-Index: AQHVO6n9JfqMcyF04UemTlO4Z+Go5Q==
Date: Tue, 16 Jul 2019 07:42:16 +0000
Message-ID: <3980bf97-9e8e-01cf-deb9-526115bd1484@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0093.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::34) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0113760-5263-4e65-4c43-08d709c12014
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0052; 
x-ms-traffictypediagnostic: DM6SPR01MB0052:
x-microsoft-antispam-prvs: <DM6SPR01MB00520CC1FC2F225A8261E5B1B3CE0@DM6SPR01MB0052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(6116002)(6436002)(25786009)(478600001)(31686004)(6486002)(3846002)(86362001)(52116002)(8936002)(68736007)(8676002)(446003)(76176011)(386003)(102836004)(6506007)(186003)(31696002)(14454004)(2351001)(26005)(66556008)(66066001)(2616005)(11346002)(476003)(305945005)(71190400001)(2906002)(54906003)(6512007)(71200400001)(53936002)(2501003)(316002)(99286004)(66446008)(256004)(4326008)(7736002)(80792005)(66946007)(64756008)(486006)(36756003)(6916009)(5660300002)(81156014)(66476007)(81166006)(5640700003)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0052;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4WM3Z6mY10UUOepRfblN4INS5M17DCFkb17fyxR56TJ/lRF3W6U/n4F03vgckp15yIgzmu/I8hJYPgDaDShakdSA31TZf3kdQXyhkybzc7ObNvNNoRQ6t+y4d7FFK37L8WO38CNEiYAiTh86hBOy80rmow5vCFlJ6EkbpK8vgTE2VZIlX3Vdez51F/80c02AReJVPah7T0ZvzVv+t2f/QZNF5kI+ht+r56Knh/IeIDsz+QjBmvqwKKA1xjWB71stVm8Qdqp5XyEWEUklZ3E/brnha6m25iJuj/EpPPCuElF/V8aOo8FKxs/0yJvWQ9KD8ucZTQW5KMUt++eo7N8zGck7nMa7EALMFEV4Gkmoaunt1iwIbfIzcSClkZVy6uW9pEmnBNB7Dibmy/y6p4j1/6gGLuKtK5o1LGXCaC1MP80=
Content-ID: <4788586BF20E1045805F607301A61D4C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0113760-5263-4e65-4c43-08d709c12014
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:42:16.9812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0052
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 08/13] x86/IRQs: correct/tighten vector check
 in _clear_irq_vector()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYW55IHBhcnRpY3VsYXIgdmFsdWUgd2FzIHRvIGJlIGNoZWNrZWQgYWdhaW5zdCwgaXQgd291
bGQgbmVlZCB0byBiZQ0KSVJRX1ZFQ1RPUl9VTkFTU0lHTkVELg0KDQpSZXBvcnRlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNCkJlIG1vcmUgc3RyaWN0IHRo
b3VnaCBhbmQgdXNlIHZhbGlkX2lycV92ZWN0b3IoKSBpbnN0ZWFkLg0KDQpUYWtlIHRoZSBvcHBv
cnR1bml0eSBhbmQgYWxzbyBjb252ZXJ0IGxvY2FsIHZhcmlhYmxlcyB0byB1bnNpZ25lZCBpbnQu
DQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KLS0tDQp2MjogTmV3
Lg0KDQotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0K
QEAgLTI4MywxNCArMjgzLDEzIEBAIHZvaWQgZGVzdHJveV9pcnEodW5zaWduZWQgaW50IGlycSkN
CiAgDQogIHN0YXRpYyB2b2lkIF9jbGVhcl9pcnFfdmVjdG9yKHN0cnVjdCBpcnFfZGVzYyAqZGVz
YykNCiAgew0KLSAgICB1bnNpZ25lZCBpbnQgY3B1Ow0KLSAgICBpbnQgdmVjdG9yLCBvbGRfdmVj
dG9yLCBpcnEgPSBkZXNjLT5pcnE7DQorICAgIHVuc2lnbmVkIGludCBjcHUsIG9sZF92ZWN0b3Is
IGlycSA9IGRlc2MtPmlycTsNCisgICAgdW5zaWduZWQgaW50IHZlY3RvciA9IGRlc2MtPmFyY2gu
dmVjdG9yOw0KICAgICAgY3B1bWFza190IHRtcF9tYXNrOw0KICANCi0gICAgQlVHX09OKCFkZXNj
LT5hcmNoLnZlY3Rvcik7DQorICAgIEJVR19PTighdmFsaWRfaXJxX3ZlY3Rvcih2ZWN0b3IpKTsN
CiAgDQogICAgICAvKiBBbHdheXMgY2xlYXIgZGVzYy0+YXJjaC52ZWN0b3IgKi8NCi0gICAgdmVj
dG9yID0gZGVzYy0+YXJjaC52ZWN0b3I7DQogICAgICBjcHVtYXNrX2FuZCgmdG1wX21hc2ssIGRl
c2MtPmFyY2guY3B1X21hc2ssICZjcHVfb25saW5lX21hcCk7DQogIA0KICAgICAgZm9yX2VhY2hf
Y3B1KGNwdSwgJnRtcF9tYXNrKSB7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
