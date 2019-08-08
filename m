Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDE85BB2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvd0n-0003ab-3j; Thu, 08 Aug 2019 07:39:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvd0l-0003aO-A4
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:38:59 +0000
X-Inumbo-ID: 91e5174a-b9af-11e9-b231-f75fc594f9ec
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e5174a-b9af-11e9-b231-f75fc594f9ec;
 Thu, 08 Aug 2019 07:38:56 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:38:40 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:38:32 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx9F8vLJ28PJVu/fAutH4RRxdoKYRwxpdG+HjIhu1hCPwG+INEtcUa3wb5pnvCBRvPMB4pHKa/lE9R6xsaoj+GN5eVxsEOS9D6tEOoPefy1Weaob4SCXK+GGTflPY/bja8o1mjCirZjvq+zrdJdgI4u++K6EJwX+iqa9HWIbtPJLbnvjh1tydJWMEirMC+o4R8FNTcgsfXJL/bUz97uLMUirl7SLhilX7/BA09nRSi2PNVGhPpE1A//aDDLV3LWERWXYBTlbLfCOP3P+QId9lBrMze051oWsmA6n0i+kyyAMCve1KjManabbqe7E4qWEg/bx7QrfopxdrCctWz9fpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLAI4nCbQnK5Guae3Q+DYY1GaUuMvqGApWfG62rCYDk=;
 b=mkKJzGpuE+s9RRkfVw4P3JCKCgdFenrTg/J3puW9PUscMLEtvNnkDpnc5PSycoLoN9pGdv7DmLQFdE9v8uptP0SV6pEFGNJSAiPac57NKDrzNN2i4gFH2AkEznlXwGI9Bsrl8OtDLHFgrTPGdKOx//lSLdYoTOkTZSrQjJEqOuJ5+QXFp+1hS8wJTrg4Y7xWS0MLsf8VoS36VDPn62Ivod/WuRU/Jhm7b2c67U1Fq+MeNLvAekqH9sb3dYll4qwRndsf/YtyjQs808X6y33lcMTacX+rtXS90eGRK7qPjGAnca4PmG/tkWs/zk+CkmVGsUB1D3RggGeJVDxggZbtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 07:38:30 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:38:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH] EFI: add efi=mapbs option and parse efi= early
Thread-Index: AQHVTYDiJDDJv46naU6f+B83HbCEaabwbBnJgABxbAA=
Date: Thu, 8 Aug 2019 07:38:30 +0000
Message-ID: <bb6b5f3a-5732-0866-2644-3ce9d849b610@suse.com>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <20190808005205.GE3257@mail-itl>
In-Reply-To: <20190808005205.GE3257@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::34) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ccbecd0-73f3-483c-af5b-08d71bd368a0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3405; 
x-ms-traffictypediagnostic: MN2PR18MB3405:
x-microsoft-antispam-prvs: <MN2PR18MB3405F20DE42BA7FB5031A8CDB3D70@MN2PR18MB3405.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(189003)(199004)(64756008)(66476007)(66556008)(66446008)(5660300002)(66946007)(31696002)(76176011)(71190400001)(99286004)(86362001)(6116002)(6486002)(3846002)(256004)(25786009)(7736002)(478600001)(36756003)(8936002)(6916009)(305945005)(7416002)(71200400001)(66066001)(4744005)(52116002)(6246003)(53936002)(316002)(31686004)(229853002)(54906003)(2616005)(446003)(486006)(11346002)(4326008)(476003)(80792005)(102836004)(2906002)(6506007)(6512007)(53546011)(6436002)(386003)(186003)(81156014)(8676002)(26005)(81166006)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3405;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tmQfvGA0G+OSlseLpnf0h3vAZR7ZYhtK0gUNIyVpsy5PsbK5WfInMtOKgC9lrWzXxBp/YbbObFy2CfPjyRtNNOPyb2UOZIiOcD99jICEEeaG80Sz1j9b7x8icinjAmdjVBulSOcyAdNUy2h4luegVAGlT5fDn0TmNJzE5viTVzsIsW9UuQWuu+ydjFKvHSN9SSEV7Tm0SwxBIsHu3SHGBSyvlodBZ6UW9v0W88+JXgNKlxEJMdD9TMECwKirz66cNOiPY/1IREksh45HtweFtuy35QoEvkEaHsYUzjnF2sZVarfnyRi0FzIc38QRkyuOkORiNyx1U959O0JIRKwsDFKklu2kRiIqCmNaqS6znZ2v0u5NnhM3FSHWr7pkZqU1nDklxcOFA4bDG4qmhhRPOGDWTJbjtu7O8yxcB5igIb8=
x-ms-exchange-transport-forked: True
Content-ID: <B38247D48BA6144EAE2CF1E262CF64E1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccbecd0-73f3-483c-af5b-08d71bd368a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:38:30.6483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5I0tiVJGrtmESlMF/lNP5WwTU2C48pZik5ti/i/RYENfkjdctRdPF9wIZuX0qZt443l/cFaiL8qeUppTrIPHFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3405
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAwMjo1MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaA0KPj4gKysrIGIveGVuL2FyY2gv
eDg2L2VmaS9lZmktYm9vdC5oDQo+PiBAQCAtMzE1LDggKzMxNSwxMCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgZWZpX2FyY2hfaGFuZGxlX2NtZGxpbmUoQ0hBUjE2ICppbWFnZV9uYW1lLA0KPj4gICAg
ICAgICAgIG5hbWUucyA9ICJ4ZW4iOw0KPj4gICAgICAgcGxhY2Vfc3RyaW5nKCZtYmkuY21kbGlu
ZSwgbmFtZS5zKTsNCj4+ICAgDQo+PiAtICAgIGlmICggbWJpLmNtZGxpbmUgKQ0KPj4gKyAgICBp
ZiAoIG1iaS5jbWRsaW5lICkgew0KPj4gICAgICAgICAgIG1iaS5mbGFncyB8PSBNQklfQ01ETElO
RTsNCj4+ICsgICAgICAgIGVmaV9lYXJseV9wYXJzZV9jbWRsaW5lKG1iaS5jbWRsaW5lKTsNCj4g
DQo+IENvbXBpbGVyIGNvbXBsYWlucyBoZXJlLCBiZWNhdXNlIG1iaS5jbWRsaW5lIGlzIHUzMiAo
aW50IHZzIHBvaW50ZXIsIGFuZA0KPiBhbHNvIGEgZGlmZmVyZW50IHNpemUpLiBXaGF0IGlzIHRo
ZSBwcm9wZXIgd2F5IHRvIG1ha2UgY29tcGlsZXIgaGFwcHkNCj4gaGVyZT8gIihjb25zdCBjaGFy
ICopKHVpbnQ2NF90KSIgZG9lc24ndCBzZWVtcyByaWdodC4NCg0KV2VsbCwgaWYgdGhlIGNvbnZl
cnNpb24gdG8gYSBwb2ludGVyIGlzIGNvcnJlY3QgaGVyZSAoaS5lLg0KdGhlIHNwZWNpZmllZCBh
ZGRyZXNzIGhhcyBhIG1hcHBpbmcpLCB0aGVuDQooY29uc3QgY2hhciopKHVuc2lnbmVkIGxvbmcp
IHdvdWxkIGJlIHRoZSBjYW5vbmljYWwgd2F5IHRvDQpnbzsgdXNpbmcgdWludHB0cl90IHdvdWxk
IGFsc28gYmUgYW4gb3B0aW9uLCBidXQgd2UgbWFrZQ0KcHJldHR5IGxpdHRsZSB1c2Ugb2YgaXQu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
