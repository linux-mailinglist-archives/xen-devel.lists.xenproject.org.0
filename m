Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBE85B44
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:09:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcVk-00017n-QC; Thu, 08 Aug 2019 07:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvcVi-00017e-M8
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:06:54 +0000
X-Inumbo-ID: 0e8b80e0-b9ab-11e9-a723-27866e321d9d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e8b80e0-b9ab-11e9-a723-27866e321d9d;
 Thu, 08 Aug 2019 07:06:52 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:06:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:05:09 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:05:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMhehjFaen9K31Xk3bEtZV+mV8uEd7UsQ82gkl3v3NvpkdWkRXXOzESzXHe+ln5RasfOLaIzXN88CIqYcDi9CyjbOj4RMbE0p8TGtBl+eqB2HXaezYP73z9oeMzDWyFWnymwk37qrCrW7gjUExIC/AAs9tVw+VyDXqsSJ08uqFQmmYrlyM55TlIXR8t8RZwux5q05a+5yxh8JbN7ZkrOjU2nFph1RRxTs2eeIccc4kTakQqF2opymoTGzJ0ZadV+Lji7VA27QvwKQBB9rD92GIfOUp/PEoLbTST9J7P5duph2bWdpzYuHWj3fklY6aWHT/6Beg38tRr87DKT7ktlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dABkvVeFxsRihtNswh6Z8MgpMndoVk/5+JNbwFDPSJw=;
 b=X+GiXlfxXQEEM3FVOZGnkhzQZmoMrh4NhpCC+dNIKf7gPhNbLiu4fD3Yt5UV89K7CeB/67TeH569sRbJVqQu4Q2VL/HieJvsRnOdY3dpzpkHrbgeGBZFiGDepaxYf7wjX//36X1I6FeidbO6DscnOJf55b5rTBMQg7X2iI84sxbHWBUw0YXxYJ6+0tTgUPFxdE0W71KNYgk6GzsGMmi0gl3ew4n2mu3BuMKOWBV4z+MRxEvObe+S0onRVt2QbBgKnwT4lDOLzwbj2NA2UQtq2ONW20evMD7OTAaXdAec2voscOX8kKq+6tHPkrBwxfV5Ztz12a9/ohmc2JH4FwBc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2926.namprd18.prod.outlook.com (20.179.21.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 07:05:08 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:05:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Oleksandr <olekstysh@gmail.com>
Thread-Topic: [PATCH V2 3/6] [RFC] xen/common: Introduce _xrealloc function
Thread-Index: AQHVTbec/HxtyA8UA0eaMlcBWmBXEQ==
Date: Thu, 8 Aug 2019 07:05:08 +0000
Message-ID: <c11e9c93-e83b-906c-2a99-2a4580c5d797@suse.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com> <87sgqegji0.fsf@epam.com>
 <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
 <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
In-Reply-To: <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:205:1::16) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90ac813d-2e08-4223-a447-08d71bcebf16
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2926; 
x-ms-traffictypediagnostic: MN2PR18MB2926:
x-microsoft-antispam-prvs: <MN2PR18MB2926AAA70DBDAEF305C100B9B3D70@MN2PR18MB2926.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(189003)(199004)(6246003)(66446008)(7736002)(64756008)(86362001)(66946007)(66556008)(66476007)(31686004)(31696002)(6916009)(6512007)(6436002)(71200400001)(71190400001)(36756003)(25786009)(6486002)(11346002)(4744005)(5660300002)(53936002)(2616005)(446003)(229853002)(14444005)(486006)(476003)(7416002)(80792005)(2906002)(52116002)(53546011)(316002)(26005)(6506007)(81166006)(8936002)(256004)(305945005)(6116002)(386003)(76176011)(54906003)(81156014)(8676002)(3846002)(102836004)(4326008)(186003)(66066001)(478600001)(14454004)(99286004)(1411001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2926;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qrX5LbQ1A5hZK4HzM3dhFDHAHnneLVJeR8n+VeLNhnSEjbOjlRUJ/nhK9vjvgng867vH5zxkSlk8jEaffc5owKeKyut2vaONQ4kDVHri0+tsPfcl0nlx6Z1Y9DPJPx0BVLedU0mHo+4OIaV++qEz/y4cW63tae88C8gyn8JoWQvJy2XvP5YmMy2gPPggxzKAYCoHOcboHsvivBdEHAYYBoRamknzMTn5T0SXjhc2nDmVsE+8RTlGqePqpQErlnDDtk2gX3ShJghPAkIO7Cyej/HluNuZM0p87YHIheRfdjIkQY1j6JF/hi6C98XkqlTbJO56OUY19Tu0eWtUPm3awsDtZqPMpKd/o3RX7NhxsDkQLMvyxl6yqOdh7BVQzShOfGaFPmp7z9SRlgec6KZExTe6umLhyuosihnDwyMY2b0=
Content-ID: <8FFD3299879CD34E8679DB3A4DAE5252@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ac813d-2e08-4223-a447-08d71bcebf16
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:05:08.3077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08I6OpcrBXPMreUhfTXS7cvu02/AUyurodSIND2Vy1YWFZjJeaHr3TyWUUn71sDW+4lr11Xy4Qww9GkFec9bTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2926
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KEknbSBzb3JyeSBpZiB5b3UgcmVjZWl2ZSBkdXBsaWNhdGVzIG9mIHRoaXMsIGJ1dCBJJ3ZlIGdv
dCBhIHJlcGx5DQpiYWNrIGZyb20gb3VyIG1haWwgc3lzdGVtIHRoYXQgc2V2ZXJhbCBvZiB0aGUg
cmVjaXBpZW50cyBkaWQgbm90DQpoYXZlIHRoZWlyIGhvc3QgbmFtZXMgcmVzb2x2ZWQgY29ycmVj
dGx5IG9uIHRoZSBmaXJzdCBhdHRlbXB0LikNCg0KT24gMDcuMDguMjAxOSAyMDozNiwgT2xla3Nh
bmRyIHdyb3RlOg0KPj4gVGhlcmUncyBvbmUgbW9yZSB0aGluZyBmb3IgdGhlIHJlLWFsbG9jIGNh
c2UgdGhvdWdoIChiZXNpZGVzDQo+PiBjb3NtZXRpYyBhc3BlY3RzKTogVGhlIGluY29taW5nIHBv
aW50ZXIgc2hvdWxkIGFsc28gYmUgdmVyaWZpZWQNCj4+IHRvIGJlIG9mIGNvcnJlY3QgdHlwZS4N
Cj4gDQo+IEphbiwgaG93IHRoaXMgY291bGQgYmUgdGVjaG5pY2FsbHkgaW1wbGVtZW50ZWQsIG9y
IGFyZSB0aGVzZSBhbnkgZXhpc3RpbmcgZXhhbXBsZXMgaW4gWGVuPw0KDQpTZWUgeDg2J3MgY29w
eV90b19ndWVzdF9vZmZzZXQoKSwgZm9yIGV4YW1wbGUuIFRvIGdldCB0aGUgY29tcGlsZXINCnRv
IGVtaXQgYSB3YXJuaW5nIChhdCBsZWFzdCksIGEgKHR5cGljYWxseSBvdGhlcndpc2UgZGVhZCkN
CmNvbXBhcmlzb24gb2YgcG9pbnRlcnMgaXMgY29tbW9ubHkgdXNlZC4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
