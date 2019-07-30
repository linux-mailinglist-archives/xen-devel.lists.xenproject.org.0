Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D97AD4E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 18:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsUfJ-0000Np-TH; Tue, 30 Jul 2019 16:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsUfI-0000Mu-JT
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 16:07:52 +0000
X-Inumbo-ID: 235072e2-b2e4-11e9-b9f7-1f9860be840f
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 235072e2-b2e4-11e9-b9f7-1f9860be840f;
 Tue, 30 Jul 2019 16:07:47 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 16:07:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 15:51:26 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 15:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx0gVAcRzrKujf04NNdM2RxZIACcJBv7EKyGnp7qAfo4eL/iVlI264+bPxXOwHmWZNC0qjyY90xjs4xozTaDl+Qy15A+7SQMQLsozt5OnbiHbjQVkvm8/ywtXDoA45fNft5r7eG6/uTcg+7Nk16gsGJ9Wi8O0SRYwz3Zkmz6TXoEkHjV2a4MJLqQDsKxs8tZ7/l5ChOm7ZlpxgDtT1hN7VUS5g5+ScdJ2HSO+3DjM9Q1+4Oh7CK2kZSoalkQvTaeB6OxsKhoaDM2JuEHTaPVKN8sJTKCIP3zRLOOizXIj1tCn4IgVvmiwMUOpzxlqveJYS7ZQ7+GTZ4wBhHOmuX9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk0zZdBmwboBjio0W2JTAMerLeeSscqltdCyab2JbTk=;
 b=TAWSZ2D2okP6K3uWzs6FhkNeRURa8B572kQBb/AF8Cql71YmyZhEDQqkSPO7HkCVxpcCE5IR2qvJJk8dC2dty2zdEiTJPiROIHmiwc7FIPxnzIl7B6gGFQlcbd2Tb0EJ8uc14rQOWC2cPJqfunDk+Bc+XGbNZr9qEBIvF8cmRgyQObyoEWXHrCjslzA2YqlOJv37ycqTwte18i6MTWzUCuMxymHaBLkMKpLWJLElX71epRgwJGacyoU24V+DWEPZtoZ2jHAHKaWGMto7q6hKN7xuV2ueVS2RdN+lUBXaJiR4FzyibhdvQd/OwyJL0+yehHsYnO4vf1z9LHoRQCAAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3202.namprd18.prod.outlook.com (10.255.138.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 15:51:25 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 15:51:25 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Thread-Topic: [PATCH] tests/cpu-policy: fix format-overflow warning by null
 terminating strings
Thread-Index: AQHVQoNqxP3NLSDaSUO4Yjwj1hPOv6bjWDkA
Date: Tue, 30 Jul 2019 15:51:24 +0000
Message-ID: <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
In-Reply-To: <20190725005326.3553-1-christopher.w.clark@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0040.eurprd06.prod.outlook.com
 (2603:10a6:10:120::14) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad688338-b4be-4c35-663f-08d71505c6ad
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3202; 
x-ms-traffictypediagnostic: BY5PR18MB3202:
x-microsoft-antispam-prvs: <BY5PR18MB3202E9947F6DD5A02ADC416BB3DC0@BY5PR18MB3202.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(189003)(199004)(478600001)(5640700003)(66946007)(6486002)(6512007)(6436002)(8676002)(36756003)(6916009)(4326008)(229853002)(2501003)(66476007)(64756008)(66556008)(6246003)(316002)(66446008)(81166006)(81156014)(80792005)(53936002)(8936002)(25786009)(54906003)(68736007)(6506007)(102836004)(14454004)(386003)(26005)(1361003)(446003)(2351001)(31686004)(6116002)(3846002)(52116002)(71200400001)(71190400001)(2616005)(2906002)(11346002)(99286004)(53546011)(76176011)(186003)(7736002)(86362001)(66066001)(305945005)(31696002)(486006)(256004)(14444005)(5660300002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3202;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jA4pWTZRkWdTUoU2E2O3Gt97stvrBdET5c8ftCegu3H13FqVV2vWohVHPLyDRf+tgbHH2SBE8x3YxdE+WII5575Bipog45zZxMRGpkTvY/4/qkAslM+i2EbhfcvnQyRuVKxmQpzqeAIaRvX2i0UX/3cWxKmbkRBRm6icTReNruGDgfJqoADaz0Kdc/D2vaMUoba7Fx3+HvE16c7f+UGjMpnZsVKb8qJ9g76IJpBisb5r6N/yubBNv0kFmFm0lSoz64pNUSL1MOo94qgF+ktSyzRiACXpDgVQwVRXBMGIM2Xzm9IHX/H6o1ydcsHWP8Tqqa3QjUCY9EMLOiWRjfrhNranYgJaYz+t30CCQ5ACda/Fzy9iogXaowTVIuuTKYWqJevZmURUw1OBG2SxPoad6xdFJdZ9/IgYIneFceWk/og=
Content-ID: <B984987F08CED640A28F2B809E182A50@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad688338-b4be-4c35-663f-08d71505c6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 15:51:25.0265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3202
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
 Roger Pau Monne <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAwMjo1MywgY2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20gd3JvdGU6
DQo+IEZyb206IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNv
bT4NCj4gDQo+IGdjYyA5LjEuMCByZXBvcnRzOg0KPiANCj4gfCB0ZXN0LWNwdS1wb2xpY3kuYzo2
NDoxODogZXJyb3I6ICclLjEycycgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG5vdCBhIG51bC10ZXJt
aW5hdGVkIHN0cmluZyBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQ0KPiB8ICAgIDY0IHwgICAg
ICAgICAgICAgZmFpbCgiICBUZXN0ICclLjEycycsIGV4cGVjdGVkIHZlbmRvciAldSwgZ290ICV1
XG4iLA0KPiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IHwgdGVzdC1jcHUtcG9saWN5LmM6MjA6MTI6IG5v
dGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ2ZhaWwnDQo+IHwgICAgMjAgfCAgICAgcHJpbnRm
KGZtdCwgIyNfX1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAgICBcDQo+IHwgICAgICAgfCAgICAg
ICAgICAgIF5+fg0KPiB8IHRlc3QtY3B1LXBvbGljeS5jOjY0OjI3OiBub3RlOiBmb3JtYXQgc3Ry
aW5nIGlzIGRlZmluZWQgaGVyZQ0KPiB8ICAgIDY0IHwgICAgICAgICAgICAgZmFpbCgiICBUZXN0
ICclLjEycycsIGV4cGVjdGVkIHZlbmRvciAldSwgZ290ICV1XG4iLA0KPiB8ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fg0KPiB8IHRlc3QtY3B1LXBvbGljeS5jOjQ0Ojc6
IG5vdGU6IHJlZmVyZW5jZWQgYXJndW1lbnQgZGVjbGFyZWQgaGVyZQ0KPiB8ICAgIDQ0IHwgICAg
IH0gdGVzdHNbXSA9IHsNCj4gfCAgICAgICB8ICAgICAgIF5+fn5+DQoNCkluIG9yZGVyIHRvIHBv
c3NpYmx5IGNyZWF0ZSBhIGJ1ZyByZXBvcnQgYWdhaW5zdCBnY2MgSSd2ZSB0cmllZCB0aGlzOg0K
DQojaW5jbHVkZSA8c3RkaW8uaD4NCg0Kc3RydWN0IHMgew0KCWNoYXIgYWNbMTJdOw0KCWludCBp
Ow0KfTsNCg0Kdm9pZCB0ZXN0KGNvbnN0IHN0cnVjdCBzKnBzKSB7DQoJcHJpbnRmKCInJS4xMnMn
XG4iLCBwcy0+YWMpOw0KfQ0KDQpUaGVyZSdzIG5vIHdhcm5pbmcgaGVyZS4gQ291bGQgeW91IGNo
ZWNrIHdoZXRoZXIgdGhlIGNvbXBpbGVyIHdhcm5zIG9uDQp0aGF0IHNpbXBsZSB0ZXN0IGZvciB5
b3U/IElmIGl0IGRvZXMgLSBhcmUgd2UgdGFsa2luZyBhYm91dCBwbGFpbg0KdXBzdHJlYW0gOS4x
LjAgKGluIHdoaWNoIGNhc2UgSSdkIGJlIHJlYWxseSBwdXp6bGVkIGJ5IHRoZSBkaWZmZXJlbmNl
DQppbiBiZWhhdmlvcik/DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
