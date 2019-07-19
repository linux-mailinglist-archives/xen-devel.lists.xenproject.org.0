Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991006E26C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOBP-0001ga-LY; Fri, 19 Jul 2019 08:24:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoOBO-0001gV-Lj
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:24:02 +0000
X-Inumbo-ID: 833d078b-a9fe-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 833d078b-a9fe-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:24:01 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 08:19:52 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 08:22:29 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 08:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9guZ5YV6/aCm1DVPtgUGvUqxkFVE1B2Hmb1sya9ZUIMQiNK3U4KWmvmnu4rfgU997iJYzUFp+Y49i7RWMdhLolhskQi8ErhIjRPUaiZHHkmWSU+V5JhVOXTI3VyG6zgnZTKirSNGzhJFDxt/s92aG+WG4rX3BQl6bZ/SbSaThNcjZWFVIDY1MR2GQhV+YaUnAoQnWnp3uKZI3xXy8sJF/koq1DVn4jF/vjcwc/RV3Necj3rsxI7HbC/k6GiHiKfuCHS9sFR7/SZrzl17JNPO+6usJaEVUUIhj0bk13v8DDj3xob6ge5bHptp/tvkjzKiFtLlgAUk//uZMKh7a4zLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrxE3Oz2/1KgyRJSQz+YPit0dBLCIEG+OhMylKrk9rg=;
 b=Id0Ll2KJ1rYa5VzUDT/R9plY0g+UeHhCVJSusTVHGHujr/jxCQRTCAY7R1mUjYz1pD6ld1qZYiBsOSUUeQrAGz/WbnDGZ2lISDdcM3OGMKe3R95aBZdAmWN98g+o3DQiWfr+RbbLfmhoO0BiFCCfif8gpZZeIeW7UJ4GLigkDZRgtWXxSCTDxphMlD0rDBkTG+34OhT+WxIWAdkIrXDmzquRTFFzRVogk/6birZI38d7IRrx9vnrEVmU0uLPaXyuR7Syq5cdyhJskk2OCZ1O4K8GF/uo8J/CAgS7ovj4l11EVjtyEOMUyC4KfNsaCqvcdLXnJ79CqETSO9inhIyxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3068.namprd18.prod.outlook.com (20.179.48.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 08:22:28 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 08:22:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOwNgAgAAfJACAAWdVAIABTcoAgAAJIgA=
Date: Fri, 19 Jul 2019 08:22:28 +0000
Message-ID: <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
In-Reply-To: <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0007.eurprd05.prod.outlook.com
 (2603:10a6:10:36::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23ea3c6c-b272-4eb2-635d-08d70c223ce2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3068; 
x-ms-traffictypediagnostic: DM6PR18MB3068:
x-microsoft-antispam-prvs: <DM6PR18MB30687253FD32DCDE55D6665BB3CB0@DM6PR18MB3068.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(186003)(8936002)(31686004)(53546011)(86362001)(4744005)(6486002)(81166006)(6436002)(7736002)(99286004)(102836004)(81156014)(54906003)(64756008)(66446008)(66476007)(256004)(316002)(305945005)(6506007)(386003)(66556008)(66946007)(14454004)(71190400001)(71200400001)(80792005)(6116002)(3846002)(53936002)(36756003)(6512007)(6246003)(5660300002)(7416002)(25786009)(66066001)(446003)(229853002)(76176011)(486006)(8676002)(6916009)(52116002)(478600001)(68736007)(2616005)(11346002)(4326008)(31696002)(476003)(2906002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3068;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cRizmYjCMAMz1Ae3OWVNuuG51za8O1tV9lLRdO76BcTeqBLOE4LyDNTUSdld7aHWt55TVpdmtPGULIuikb4uell9DXdu43AGGlomNUFC5T/v67shZstX1HRWLqb2FcMF2DUFYuzFx7YvdM8DVpT+0HhQDnQmQx0Ek6U5xU3Q04eTYr1qvjHth+a5W8mi/GgV5PJxy9KHyf9Rk+S78Uc3wYUCkQ8mQjSvyBCc54xu3YIXtmNI0apYFbKl9ToQWe1Meg2wJ+LvBFjJTgxyXePhTlxx6WxvsdwuhHS+IS2a+GKY2u0jWShvywKsvJv5KPSf3W+3BJfeiJezhqTKaSVWHKP2hdK69SVA6rfZ9lKJZ7Kmu25NF5OQAv5cl0CEqZopta1WNzwZLZjrcOIUAw+vh9Toc7JgDfV2NQjmykwqTyw=
Content-ID: <3677D25DE4BC9E4C9F5F2F00263CD336@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ea3c6c-b272-4eb2-635d-08d70c223ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 08:22:28.7864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3068
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAwOTo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogUGV0cmUg
T3ZpZGl1IFBJUkNBTEFCVSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+DQo+PiBTZW50OiAx
OCBKdWx5IDIwMTkgMTQ6NTkNCj4+DQo+PiBTbywgYXQgdGhpcyBwb2ludCB0aGUgbW9zdCBwcm9t
aXNpbmcgc29sdXRpb24gaXMgYWxsb2NhdGluZyB0aGUgbWVtb3J5DQo+PiBpbiBYRU4sIHNoYXJp
bmcgaXQgd2l0aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQgbWFwcGlu
Zw0KPj4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUgZmxh
Zw0KPj4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCBzZXQpDQo+IA0KPiBJZiB0aGF0IHBh
Z2UgaXMgc2hhcmVkIHdpdGggdGhlIElEIHRoZW4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25l
ZA0KPiBzaG91bGQgKm5vdCogYmUgc2V0LiBBbHNvLCB0aGF0IGZsYWcgaXMgYW4gJ291dCcgZmxh
Zy4uLiB0aGUgY2FsbGVyDQo+IGRvZXNuJ3QgZGVjaWRlIHdobyBvd25zIHRoZSByZXNvdXJjZS4N
Cg0KSSBoYWQgaW1wbGllZCB0aGF0IGl0J3MgcmVhbGx5IE1EIHRoYXQncyBtZWFudCBoZXJlLCBi
dXQgbWF5YmUgSSB3YXMNCndyb25nIGRvaW5nIHNvLg0KDQo+IFRCSCBJIHJlZ3JldCBldmVyIGlu
dHJvZHVjaW5nIHRoZSBmbGFnOyBpdCBjYXVzZWQgYSBsb3Qgb2YgcHJvYmxlbXMsDQo+IHdoaWNo
IGlzIHdoeSBpdCBpcyBubyBsb25nZXIgdXNlZC4NCg0KSXQncyBhIHRvb2xzIG9ubHkgaW50ZXJm
YWNlIC0gd2h5IGRvbid0IHdlIGRyb3AgdGhlIGZsYWcgaWYgeW91IG5vdw0KdGhpbmsgaXQgd2Fz
IGEgYmFkIGlkZWEgdG8gaW50cm9kdWNlIGl0Pw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
