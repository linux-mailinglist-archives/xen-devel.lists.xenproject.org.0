Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05B6BCD3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 15:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnjk4-0005Ze-Ni; Wed, 17 Jul 2019 13:13:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnjk3-0005ZZ-3I
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 13:13:07 +0000
X-Inumbo-ID: 93089902-a894-11e9-817d-17c986b9e2ed
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93089902-a894-11e9-817d-17c986b9e2ed;
 Wed, 17 Jul 2019 13:13:05 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 13:12:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 13:12:14 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 13:12:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIQePpziqlRktuTW1LlG1RT3oQ70gsK/IQqWaK+EvnM3eDgdUMNG6PE8HlSzSsSk1IBJuU0WjN8b9SSKicHMErOgWGSKbRK3kOLHMsAWoG7kvSgOjXFo21CpRZTHjkkxzOr+N/GBT56qWsHmNwaGrtj41egZaGJLhrkYnF1L+od274fmUGu2VIisOooOORSTIYfIEj1z+7w5gn8EqwfTexRP4IZAOHwJwHEY1OJXjhNggS8KCXsIiVQU2z2xGp4DCcaCufaa33ZxbutQ+z9KJrMuCmox3PVxxC9XbE+20lpBuyHujJNzL8TSlwhtZcnXW7GkfjDISwWuEIT2MTLPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXFPqErP9fIGrdS9tXGtOnKF6wBmlu3tO/9iiIwhtqc=;
 b=njQFEULdgggprMLNqj2WSNIru9eJy18VLs9nWNmPg01u5eZB5UEt5rJM6XsTEocjVv/rCY0YzH9+0mLD/lj2P5rENflvYse99p/EH8QrzHBe36CPjvLg5z5levQSUn/PWIpB9KlV7jeErJsvkY2zxE3tc6AzGX2KvKsESpR+PohzWS204gCJ9gwpxSYRtA5OU4rfkg2zKnMzWA/mg4rdhErg5tfhKhh67wMqWPPACjliXA6r4EwDaeY6XKzhZuJ+3VfzVFzpp60u2rstMNf+HWsbXvzGQ7Ncfvgy/payGYzooGuvAnuEYxdmoBFLO285xhEdoYrm8rIvaaXDZZDhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3257.namprd18.prod.outlook.com (10.255.173.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Wed, 17 Jul 2019 13:12:13 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:12:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOuDAAgAAJLSyAAAkqAA==
Date: Wed, 17 Jul 2019 13:12:12 +0000
Message-ID: <e453ce9d-c0d4-b29a-a85c-2e83cf2f5c16@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <CABfawhkbVuBOYX2zcgFoompsR8YGv51nR3SrUoxEqL0SBjeejQ@mail.gmail.com>
In-Reply-To: <CABfawhkbVuBOYX2zcgFoompsR8YGv51nR3SrUoxEqL0SBjeejQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0198.eurprd07.prod.outlook.com
 (2603:10a6:6:42::28) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96abb5ae-c365-4d04-6efe-08d70ab861d4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3257; 
x-ms-traffictypediagnostic: DM6PR18MB3257:
x-microsoft-antispam-prvs: <DM6PR18MB325781067D8A00CE5A07DF47B3C90@DM6PR18MB3257.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(4326008)(486006)(53546011)(6506007)(4744005)(386003)(316002)(478600001)(76176011)(71190400001)(71200400001)(8676002)(2906002)(6512007)(186003)(66476007)(66946007)(476003)(6916009)(2616005)(31696002)(11346002)(446003)(6436002)(86362001)(6486002)(256004)(54906003)(102836004)(31686004)(6246003)(66066001)(64756008)(66446008)(66556008)(229853002)(26005)(14454004)(53936002)(68736007)(36756003)(80792005)(81166006)(305945005)(81156014)(99286004)(52116002)(5660300002)(7736002)(3846002)(6116002)(25786009)(7416002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3257;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xCCz78hR9nip8WxLVHSCqHAHtynIkBbfZv+f2mzdGK8FsDbFUn4dXogKvehHIp/2IZe7FwrqSvd1evjkRzmO3LE4C7ZEyAHUckXpXbhIzOyfS6GVSjdBjA9TB8Pqnj9r91+WsoOb8up7mQmovhmd8nF+09aYD0erqjE92Cba7F0FhEJvkcaGCC7kOotk5+HXxMRpX+cd7hpSn/lNLqRIsvVYMxuwj5Gsv8lmq3t/sCN2NvVQAp4yPr3Ecg06g5LjER3/Z6ckAX9C5yFMuoKL325z4OOo/vFWMCqd+QcDNlN9Y/rW2/Vj7Kn9N+lw/eO8muC2XeK53QxuMFrJR9yilf2/jwT18KhmsqDgGonSwQSMP6LJz6tCZeLe/Z2yZ+Un4esDweJZAwKSjUZ6jZKQTkHPt+ZAtkO6pxP8h66KCJo=
Content-ID: <C77FBECF38F73545BE6191641A22F9B6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 96abb5ae-c365-4d04-6efe-08d70ab861d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:12:12.8796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3257
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxNDozOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4gSSd2ZSBvbWl0
dGVkIGFsbCBzdHlsZSBjb21tZW50cyAoZm9ybWF0dGluZywgcGxhaW4gdnMgdW5zaWduZWQgaW50
DQo+PiBldGMpIC0gSSdkIGxpa2UgdG8gbGVhdmUgdGhhdCB0byB0aGUgVk0gZXZlbnQgbWFpbnRh
aW5lcnMuDQo+IA0KPiBEbyB3ZSBoYXZlIGFuIGF1dG9tYXRlZCB3YXkgdG8gY2hlY2sgZm9yIHN0
eWxlIGlzc3VlcywgbGlrZSBhc3R5bGU/DQoNCldlIGRvbid0OyB0aGVyZSBpcyBzb21lIHdvcmsg
dW5kZXJ3YXkgdG93YXJkcyB0aGF0LCBhZmFpYS4gQnV0IHRvDQpiZSBob25lc3QsIHBlb3BsZSBz
aG91bGQgYmUgbG9va2luZyBhdCB0aGVpciBjb2RlL3BhdGNoZXMgYmVmb3JlDQpzdWJtaXR0aW5n
LiBUaGVuIGl0IGF0IGxlYXN0IHdvdWxkIHR5cGljYWxseSBvbmx5IGJlIHZlcnkgZmV3IGlzc3Vl
cw0KZm9yIHJldmlld2VycyB0byBwb2ludCBvdXQuIEJ1dCB0aGVyZSB3ZXJlIHF1aXRlIGEgZmV3
IGhlcmUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
