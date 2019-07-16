Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFD6A776
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLe0-0004e7-U9; Tue, 16 Jul 2019 11:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnLdz-0004e0-OB
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:29:15 +0000
X-Inumbo-ID: eea13bd0-a7bc-11e9-a0fd-53a751080fa5
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eea13bd0-a7bc-11e9-a0fd-53a751080fa5;
 Tue, 16 Jul 2019 11:29:12 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 11:29:11 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 11:27:20 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 11:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ/JBz4/ZFptuxwJrI4nw9QAqpq7U5jqJwGa7VZVwYI80LkWDWdzLQNyUG/l6ujtcha7NgYECscOQE045933XRM4riDTEAPO7U8jyrFT6Qb/VVdMZdcHqvNg7YTZwlSUvrIZcULvtwLifZMgkz3UX9ZlT9TXXZiF4QnYuroQZ9SjO+KmTehY3JYEgrUIghirXUUYf7zue0BZuVK0xdCNmHfVcsX+FtKWc3s0bAL02appSnr9MmigwTm/0Z4neSZ3ca6ErzYp6lrIYtzY2iA574lf61Gxbned8M1mYQXpU5X/pm6HYIt/03mCwMaVtinC7Qntj4+opWlkeFeCFakkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe3HOd3K6TjBRw7Mizb3pswzp/hso3ARi18x+rzlbt4=;
 b=EHYiG1PVjOKU5o4ZSvPXlXgEwba1Obz5T3VXGBScy5cUQ7wNEh0fTuOS/c9INTz9k01ewNYMMrK4Xa4KtV68wJogXG/rCVZ9BI6NG5tOvrryG7g4XBTSlYl3rZeIqFlseaxz7G9ycgVpsfQ/k/lmbQ4IBX/iG1DwoB9dbfwEjKQNdzuJbPfoWv57B2ewlfcswij0zW7PLQYuXvlxJa5JIDPYfbDfNb0i39ujXth45RL2vhbhoZrlaR8KIYTelSqkpPRd5pKygAiXM0Is/recMOS70P6dDPX1sZxBsZtal5oHMXnHB3J1GXgdESKhcZ7fp42lZFokXgbs1/LB/UEvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3388.namprd18.prod.outlook.com (10.255.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 11:27:18 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 11:27:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] mm.h: fix BUG_ON() condition in
 put_page_alloc_ref()
Thread-Index: AQHVO8aSoxPbUDtNTECkzLAP8Y27u6bNG0aA
Date: Tue, 16 Jul 2019 11:27:18 +0000
Message-ID: <37e448cb-aa88-3663-3d4c-487691fd7981@suse.com>
References: <20190716110550.19086-1-paul.durrant@citrix.com>
In-Reply-To: <20190716110550.19086-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0902CA0028.eurprd09.prod.outlook.com
 (2603:10a6:6:2::41) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d5fdff3-e05d-4674-c630-08d709e08fd5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3388; 
x-ms-traffictypediagnostic: DM6PR18MB3388:
x-microsoft-antispam-prvs: <DM6PR18MB33880F22B2FA7B9741FB65BEB3CE0@DM6PR18MB3388.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(26005)(102836004)(386003)(25786009)(53546011)(99286004)(476003)(446003)(31686004)(11346002)(14454004)(6506007)(76176011)(66556008)(2616005)(8676002)(186003)(4326008)(6436002)(6486002)(66476007)(64756008)(53936002)(54906003)(66946007)(66446008)(52116002)(6512007)(6246003)(316002)(2906002)(3846002)(6116002)(486006)(81166006)(229853002)(71200400001)(71190400001)(81156014)(66066001)(6916009)(68736007)(7416002)(36756003)(8936002)(256004)(305945005)(5660300002)(80792005)(478600001)(31696002)(4744005)(7736002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3388;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YekfbwLmS3hlvzv+ovrWjRftAixiLXk42/2kWcfxBXmStcUSY5o3F7cKtZSATMjoobF6nPCbqTAvu381xgXRkzUX5JjCk/nrVfatyiegES1CBYiaz33eoAJZWvxr8CNH280oLwFoOrFpvcABzjgummg+I/nQBXPXqTp9hOt+KJxR/M1jImViuDqkC/qicXmPcyFGygivyZIQ7hqM97Ax5APcfL7xB3lIID/IO45ijwjEiEkFOuWQTYw3/PeyQ2Ny8tSphpsdC8vMMJWTGHIsjGaF+6LyWZsXsNtR00iuBMG+Iye9SYhaxlDdWDxizQY/BzfgWHBryIygPn0w/RwHglqVFlEwCnSdt71p+ktNhYwpNK1fCsrpwzs8wHZcSbrOAecBvvYNkNbnLaRTjhVOH6zGC6dsKhn28ZGyw5usVZg=
Content-ID: <FDBB79036E4B934B8831670A3612B479@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5fdff3-e05d-4674-c630-08d709e08fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 11:27:18.8849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3388
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] mm.h: fix BUG_ON() condition in
 put_page_alloc_ref()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMzowNSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGUgQlVHX09OKCkg
d2FzIG1pc3BsYWNlZCB3aGVuIHRoaXMgZnVuY3Rpb24gd2FzIGludHJvZHVjZWQgaW4gY29tbWl0
DQo+IGVjODNmODI1ICJtbS5oOiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHRlc3QtYW5kLWNsZWFy
IF9QR0NfYWxsb2NhdGVkIi4NCj4gSXQgd2lsbCBmaXJlIGluY29ycmVjdGx5IGlmIF9QR0NfYWxs
b2NhdGVkIGlzIGFscmVhZHkgY2xlYXIgb24gZW50cnkuIFRodXMNCj4gaXQgc2hvdWxkIGJlIG1v
dmVkIGFmdGVyIHRoZSBpZiBzdGF0ZW1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQpBbmQgaW5kZWVkIEkgc2hvdWxkIGhh
dmUgbm90aWNlZCBkdXJpbmcgcmV2aWV3LiBUaGFua3MuDQoNClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQphbmQgaW4gaXQgZ29lcy4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
