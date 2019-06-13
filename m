Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFAC44E52
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 23:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbXBC-0007kE-CK; Thu, 13 Jun 2019 21:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbXBA-0007k5-B1
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 21:22:40 +0000
X-Inumbo-ID: 5c8ebd30-8e21-11e9-ba68-2f179bc348b3
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c8ebd30-8e21-11e9-ba68-2f179bc348b3;
 Thu, 13 Jun 2019 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFJHeUnG94TyfFGY57Dzu7YeZLRe/hEnxqzBEF7S5cY=;
 b=nX39hfNh/JmSIJLk8vp7PMQ5s4A5XgfroIlnVz/4Y5Ln+6rYBHZ0epaU5NzO0eN1vAtr4Mp7fhk5f+J4gBWU2Ou5R/pvIRm39DHF83m2+EeKsQHUmV9d5B4v7oYgOloETY8P0T2oRNdUeTPHtQu2cicnij8rdj5hBdowCXZw+V4=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5233.eurprd08.prod.outlook.com (20.179.39.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 21:22:33 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 21:22:33 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH MM-PART3 v2 12/12] xen/arm: mm: Remove
 set_pte_flags_on_range()
Thread-Index: AQHVClECvxYLg/p9VE+TQO/7dOy8CaaYyzaAgAC7NgCAAInLgIAAN16A
Date: Thu, 13 Jun 2019 21:22:33 +0000
Message-ID: <4115c974-ef1b-314f-117b-aaf7b1c57fdb@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-13-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121535560.13737@sstabellini-ThinkPad-T480s>
 <9624343c-38ff-08bc-ec38-b46929a33843@arm.com>
 <alpine.DEB.2.21.1906131103280.13737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906131103280.13737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::20) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b368f1db-c24a-4a7d-bd0e-08d6f0453fc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5233; 
x-ms-traffictypediagnostic: AM0PR08MB5233:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB52335FCB62F807B6E06BDA0D80EF0@AM0PR08MB5233.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(11346002)(446003)(2616005)(44832011)(81166006)(81156014)(476003)(8676002)(8936002)(31686004)(486006)(6486002)(6436002)(72206003)(229853002)(14454004)(6512007)(478600001)(305945005)(7736002)(68736007)(31696002)(86362001)(6116002)(2906002)(53936002)(3846002)(5660300002)(66446008)(64756008)(66556008)(73956011)(4744005)(4326008)(66476007)(6916009)(25786009)(6246003)(66066001)(66946007)(54906003)(36756003)(71190400001)(71200400001)(99286004)(186003)(102836004)(386003)(6506007)(53546011)(26005)(52116002)(76176011)(14444005)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5233;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ilwz4LF3V3jsAV1Vk+LgDlO2TyEDaL2fbV8rZTaeXNPbW8m/7npn8pF88PauyS4eElkotBv1N//4X3mCEaiE9gsXc3vW7sGF8mZT6/iK9mY9vRDjBBbveV6Kzsmc7D1oFHl5wckakr8xhFjP+iD/5C2K0ZPcuF0nt3nVDCPHvJfBp3wvIRLcaNsJqJ6uZvqO1R1XudqOut2WT/3i5BCGCQ0fY6GFmZulFGmSYCoBbuCclzpSgxMR2gsidUorHaFllViV0O21ISOpu5HfacJC6CHUzsaj82O3OHpshTQo1yV3Y5ikO7pcU6Vcyjp3YJ/gCyQNP5Zfvc52NHn5mM223l8T3kLGA6GceCAiWwLIRh+USdG8t14/PR+imMeNxsAk76G4joEjpY3cFBnchuljh3bzHeJagvfnsgANeSCi6U4=
Content-ID: <EF308CC06C94CB4986EF0F0E4D616EAC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b368f1db-c24a-4a7d-bd0e-08d6f0453fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 21:22:33.5706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5233
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 12/12] xen/arm: mm: Remove
 set_pte_flags_on_range()
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
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEzLzA2LzIwMTkgMTk6MDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
VGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiANCj4gWWVzLCBvbiBzZWNv
bmQgdGhvdWdodCwgYSBCVUdfT04gaXMgZmluZSBoZXJlLiBUaGUgcmlzayBpcyBvbmx5IHdoZW4g
dGhlDQo+IEJVR19PTiBjb3VsZCBzb21laG93IGJlIHRyaWdnZXIgYnkgZ3Vlc3QgYmVoYXZpb3Is
IHdoaWNoIGlzIG5vdCB0aGUgY2FzZQ0KPiBoZXJlLg0KDQpBZ3JlZWQuIEkgdGhpbmsgd2UgYXJl
IHNhZmUgdG8gdXNlIEJVR19PTiguLi4pL3BhbmljIGluIGFueSBpbml0IA0KZnVuY3Rpb24uIEV2
ZXJ5d2hlcmUgZWxzZSwgd2Ugc2hvdWxkIHRoaW5rIHR3aWNlIGJlZm9yZSBhZGRpbmcgbmV3IG9u
ZS4NCg0KSSB3aWxsIHJlc3BpbiB0aGUgcGF0Y2ggYXMgZGlzY3Vzc2VkLg0KDQpDaGVlcnMsDQoN
Cj4gDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
