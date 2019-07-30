Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0B7A36F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNux-0003ez-2d; Tue, 30 Jul 2019 08:55:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNuu-0003em-W5
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:55:33 +0000
X-Inumbo-ID: c93f2887-b2a7-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c93f2887-b2a7-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:55:32 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:55:30 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:42:39 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUemOD76DllxH3GDX6kBuVh4vJ7hDHEAuG+oV5y/qqMPRnVfPnVJxHFSiEWVbnY+gZ3vtOYDoXjJFLcRJs15/FTH/wgvGa6ffcB8zoPAIv7bzCeqVUuCARTEUgU97Khm7QLh3BDXrOXHF9TOqvYsLUTph87MRWP4EKblIdQai37dYFhF6eB7eAu2GNOojlU5H8Y8MHIEOKJaE9tdJjVQL1GPg+ZJrhU7cTT7WLd8V769jxv/QIQVF4QmkhDYtqQRXUrEZJDBCnNxUwBZ/7OYRpy7KHal5I+pgTRx80kBu0xcpwrB3cA/jrMOQ2/cCxk6Hg725nbnHcWNl3D76flBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThhJjD7PAKQy1jD/Ix4I2z+WLZ31pQ6kCHEXaHMwKww=;
 b=ZFxzmshSDoWgB06z3oz861cf1mFFH303LuFsyXPilNfqwk0SR4y4CpkoDMreN8g2KgbMkRdi8AgVRjo92B3tV0O5RyRvhQsB4sMqGLJ6Ts9j0NmzMt30S7ID1+yhc9eNVydV7eb3F5xs/SLszXuCTvyjS170NEzLDyogYyneLc6FIBj1hIXzFqkqWWG9yaSsEcKlvtFT0brWiFwjL6fndUB2i2NinvsItIDPdqxMg8UwQoOZumyabq6cMqqs0cIvk9MNJ8/ew9RKiOR+OOShPB6vimKCmrpLAktGtxKM1iYMK36gBkLgX9jG9gS9o1RHlFP2niLweje3yS0h5NeMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 08:42:37 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:42:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 1/2] xen/link: Introduce .bss.percpu.page_aligned
Thread-Index: AQHVRjSGjfvYvY8Mj0+dnjT7dlU+s6bi2QqA
Date: Tue, 30 Jul 2019 08:42:37 +0000
Message-ID: <446e9293-2689-39cb-9086-19abd6702431@suse.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
 <20190729173843.21586-2-andrew.cooper3@citrix.com>
In-Reply-To: <20190729173843.21586-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::20) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6456fcbb-3749-43e4-f8ab-08d714c9dff4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB3282C5365D69160BBC5F40EDB3DC0@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(68736007)(64756008)(316002)(80792005)(81156014)(81166006)(4326008)(14454004)(8676002)(6116002)(71200400001)(3846002)(31696002)(86362001)(6436002)(2906002)(6512007)(71190400001)(478600001)(6916009)(8936002)(25786009)(66946007)(305945005)(53936002)(26005)(5660300002)(446003)(6246003)(53546011)(102836004)(66066001)(186003)(2616005)(36756003)(66556008)(52116002)(476003)(6486002)(54906003)(11346002)(229853002)(66446008)(256004)(486006)(76176011)(99286004)(6506007)(386003)(66476007)(7736002)(31686004)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hl6X9d/lNduOVqDSgTZc8OLiuThC53SbEJj/boyx83TfLYPD8tULDf9qFzeU73LlNaBchXeMkJl++K7AMqREUCv3IOwlgjtnmG/xPs82e8+VoNY3GQJC03eAEBBHQBn4UT/QWB694YdodXhPAOQMfAjqU6XFpa9t5l65AWalGdBh7MNXuFOZU+/NoY4OPNOEy19D7X1YO5YGoUNe/3sOfknksTiPCCjrpBqC0ytb/7HRUojW8K/CWENtGb2+5iu/AAcvQCZwQbEpcHiQ+bvTtyE5icOJX9SjQ0A0IDZR9z6FrgFu0u3AMztLdfNYES9WaloAcvkPf/3J6be5cb2GSwEC9Ham5z/Zvgt/8cTeuijD2o3tLZELeDc3bsHN8E8pDOExaKRbotPYv9ovi5UNDGTne7QkUijH7U8wWaI/0Nc=
Content-ID: <08F472A5A2DA3848A5505518FF7A6A9E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6456fcbb-3749-43e4-f8ab-08d714c9dff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:42:37.6529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxOTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IEBAIC0y
OTMsMTQgKzI5MywxNyBAQCBTRUNUSU9OUw0KPiAgICAgICAgIF9fYnNzX3N0YXJ0ID0gLjsNCj4g
ICAgICAgICAqKC5ic3Muc3RhY2tfYWxpZ25lZCkNCj4gICAgICAgICAqKC5ic3MucGFnZV9hbGln
bmVkKikNCj4gLSAgICAgICAqKC5ic3MpDQo+IC0gICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9C
WVRFUyk7DQo+ICsgICAgICAgLiA9IEFMSUdOKFBBR0VfU0laRSk7DQo+ICAgICAgICAgX19wZXJf
Y3B1X3N0YXJ0ID0gLjsNCj4gKyAgICAgICAqKC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCkNCj4g
KyAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCg0KQnV0IHRoaXMgZ29lcyB0b28gZmFyOiBX
aGF0IHdlIHdhbnQgaXMgZm9yIHRoZSBUU1MgdG8gb2NjdXB5IGEgZnVsbA0KcGFnZSwgbm90IGZv
ciB3aGF0ZXZlciByYW5kb20gb3RoZXIgcGFnZS1hbGlnbmVkIG9iamVjdCBlbmRzIHVwDQpsYXN0
IGhlcmUgKHNob3VsZCBhbnkgZXZlcnkgYXBwZWFyKS4gSWYgeW91IHdhbnQgdG8gZWZmZWN0IHRo
aXMNCnZpYSBsaW5rZXIgc2NyaXB0IChyYXRoZXIgdGhhbiBDIGFycmFuZ2VtZW50cyksIHRoZW4g
anVzdCBsaWtlIHRoZQ0KQ1BVMCBzdGFjayBJIHRoaW5rIHdlIHdhbnQgYSBkZWRpY2F0ZWQgc2Vj
dGlvbiBjb250YWluaW5nIF9qdXN0Xw0KdGhlIFRTUy4gKEhhdmluZyBzYWlkIHRoYXQgSSByZWFs
aXplIHRoYXQgLmJzcy5zdGFja19hbGlnbmVkIGlzbid0DQpyZWFsbHkgYSBnb29kIG5hbWUgZm9y
IGEgZGVkaWNhdGVkIHNlY3Rpb24uIEl0J3MganVzdCB0aGF0IHdlDQpvYnZpb3VzbHkgd2FudCB0
aGUgc3RhY2sgdG8gb2NjdXB5IGl0cyBlbnRpcmUgU1RBQ0tfU0laRSByYW5nZS4gT2YNCmNvdXJz
ZSB3ZSBjb3VsZCBwdXQgb3Vyc2VsdmVzIG9uIHRoZSBwb3NpdGlvbiB0aGF0DQouYnNzLnBlcmNw
dS5wYWdlX2FsaWduZWQgdG9vIF9pc18gYSBkZWRpY2F0ZWQgc2VjdGlvbiBkZXNwaXRlIGl0cw0K
bmFtZSwgYnV0IGlmIHlvdSBtZWFuIGl0IHRvIGJlIGxpa2UgdGhhdCB0aGVuIGl0IHdvdWxkIGJl
IG5pY2UgZm9yDQp0aGUgZGVzY3JpcHRpb24gdG8gYWN0dWFsbHkgc2F5IHNvLikNCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
