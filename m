Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA882176
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:16:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufco-0002Ro-4Z; Mon, 05 Aug 2019 16:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hufcm-0002Rf-PY
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:14:16 +0000
X-Inumbo-ID: 097e39fa-b79c-11e9-b2bf-fb0ab464616a
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 097e39fa-b79c-11e9-b2bf-fb0ab464616a;
 Mon, 05 Aug 2019 16:14:13 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 16:13:59 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 16:11:32 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 16:11:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM39+VZ8OI6OGhQPy7uuZOdgmEv6si3aWPSfBEBhNMPjnfSHil0+zgmyXVtkQAp1tTjPonwQWZ7FolOMo9RUh28kAVgMatubqJQSuOfS2sg4S/3nd7AQmx8aD0mFOtT6Rw+ZYrybh/AwxFi/u6PHNXoKIFRkTl3qmXyhB4dkbNQjiHpP9db349vENqJ1yoTHFw6pKO4agAiDJSDho1JlHbT3rjSqWEN7QBus8Adn9zUnnte7yA9Aqf5cbd/Db40SJDV3qDR75maDSSaAiFQRtz+Jwrirm80lwYigyQFi+X/dQ9QgAChdhLsAG6/MxIu67Gnj/cdg9q48IVC5z2fIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxBl21AMLykKDO4cI8vN7os7oe1VrD4hPqeejrHaJ3U=;
 b=U1wN8Q3mMuJqouvhVnaTABO/PohvMo/KdK+iSFfk5pJIfITSVgph9Lqp9WGCXP97KYwn8RGzczrQGn/MF3M7ugCyPjVa4FGVAelxY3u400DSHxcqag6FrIXLvf9T0gMvf/FWJbDTc7vIm0czIxWoZbeDVFpwnVYEFz5Ldg1sXuGMHD1xkL0e0j6M/u1VV5GejJ4eH8F7m1T/ZtdY7bHhIbvcI6UiQnn1/eBNZo5kO4ua4VrpKRZm5734gKSh4jcrijcBur2einX5+7XoWDwiMHcQH4irkfSp3cKrKT2njPR63hPNIWfa1DuCQGUdHajCdRVAo9Rz30xpSMCsuBtk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2495.namprd18.prod.outlook.com (20.179.83.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Mon, 5 Aug 2019 16:11:30 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 16:11:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [Xen-devel] preparations for 4.12.1
Thread-Index: AQHVPj2SYnjK2Jp9JUOJM4bdl2JgJKbYtrALgAABqvWAAUq2m4ASwvVugAAGAIGAAAhaAA==
Date: Mon, 5 Aug 2019 16:11:30 +0000
Message-ID: <c1ae6aa5-1bad-de6d-f18b-963f61ec8cbc@suse.com>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
 <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
 <B92482B8-3A93-4085-9A6A-26D457261076@gmail.com>
 <23880.18663.729437.866196@mariner.uk.xensource.com>
 <20190805154040.GC20589@mail-itl>
In-Reply-To: <20190805154040.GC20589@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0060.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::37) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63396e5a-dd48-49dd-8678-08d719bf93d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2495; 
x-ms-traffictypediagnostic: MN2PR18MB2495:
x-microsoft-antispam-prvs: <MN2PR18MB24954EE022006814DDF2D7E5B3DA0@MN2PR18MB2495.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(189003)(80792005)(71190400001)(68736007)(6916009)(5660300002)(316002)(54906003)(486006)(81166006)(446003)(305945005)(66066001)(478600001)(25786009)(8676002)(81156014)(14454004)(186003)(256004)(66476007)(2616005)(86362001)(11346002)(66946007)(4744005)(31696002)(66446008)(476003)(66556008)(36756003)(64756008)(3846002)(31686004)(6486002)(53936002)(99286004)(6116002)(2906002)(229853002)(6512007)(6436002)(52116002)(386003)(71200400001)(53546011)(6506007)(76176011)(26005)(6246003)(102836004)(4326008)(7736002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2495;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cJETrMm9dQOw/tYUGHuikRFqZCQDOilcBO5ldls7u3rxgdlw6+ndDroFCFg0Xm8Rg9I5bWnEfLS8bYspBd26AETPHQzP/kf8AJDnk0IKzbNdd70s2W4KeR3XU5sCYOFqh6s/DhlsLrX8W5DNZusxV2hOFL3FvijaEcQGLk2/b5j6ZIoUBMdHOPjPBpkf5YsNa60/KVCg/UqRb5xy+w9dXa75fzhuTe6CGpk4BjAUA7KaSIuiSgCcwdF3k9gCiPegL0vpkqR8kuJJVL2/BHgU8eGsMVpM+qIHb+KYwntSsZOYPtPiY+rkCoW8p6jY6PgwQYcl+qrOV2TUPfrgUgX00GbOzFhqfc0McTVTygBXTyA7LwgjQdAMjDHGeCMANi2eRo/jkf+t91dFhbkLNV8wCLuZqnNdhipDfVurqkSfxjk=
Content-ID: <5F13152CBF9B454283D86CA3D37A4F90@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63396e5a-dd48-49dd-8678-08d719bf93d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 16:11:30.7913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2495
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roman Shaposhnik <roman@zededa.com>, Rich Persaud <persaur@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNzo0MCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4gT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDQ6MTk6MDNQTSArMDEwMCwgSWFuIEphY2tzb24g
d3JvdGU6DQo+Pj4+PiAibGlieGw6IGZpeCBwY2kgZGV2aWNlIHJlLWFzc2lnbmluZyBhZnRlciBk
b21haW4gcmVib290IjoNCj4+Pj4+IGNvbW1pdCAgYzE5NDM0ZDkyODRlOTNlNmY5YWFlYzlhNzBm
NWYzNjFhZGJmYWJhNg0KPj4NCj4+IFRoYW5rcyBhbGwuICBJIHB1c2hlZCB0aGlzIHRvIHN0YWdp
bmctNC4xMiB0b2RheS4NCj4+DQo+PiBUaGVyZSBhcmUgYSBjb3VwbGUgb2Ygb3RoZXIgdGhpbmdz
IHRoYXQgSSBzYXkgaW4gZ2l0IGxvZyB0aGF0IG1pZ2h0DQo+PiB3YXJyYW50IGEgYmFja3BvcnQs
IGFuZCBmb3Igd2hpY2ggSSdtIGhvcGluZyBJIGdldCByZXBsaWVzIHF1aWNrbHkuDQo+IA0KPiBJ
J2QgbGlrZSB0byBwcm9wb3NlICJ2aWRlbzogZml4IGhhbmRsaW5nIGZyYW1lYnVmZmVyIGxvY2F0
ZWQgYWJvdmUgNEdCIg0KPiA5Y2YxMWZkY2Q5MWZmOGU5Y2QwMzhmODMzNmNmMjFmMDcwMWU4Yjdi
IChzZWUgY29tbWl0IG1lc3NhZ2UgYWJvdXQgYQ0KPiBsaXR0bGUgY2hhbmdlIG5lZWRlZCBkdXJp
bmcgYmFja3BvcnQpLg0KDQpQbGVhc2UgZG9uJ3QgaGlqYWNrIChzdWIpdGhyZWFkczogSWFuIGlz
IHRhbGtpbmcgYWJvdXQgdG9vbHMgc2lkZQ0KYmFja3BvcnRzIGhlcmUuIFlvdSBzaG91bGQgaGF2
ZSByZXNwb25kZWQgdG8gbXkgaW5xdWlyeSBhdCB0aGUNCnJvb3Qgb2YgdGhpcyB0aHJlYWQuIFRo
aXMgd2lsbCBub3cgaGF2ZSB0byB3YWl0IGZvciA0LjEyLjIsIHVubGVzcw0KdGhlcmUgdHVybnMg
dXAgYW4gdXJnZW50IG5lZWQgdG8gcHVsbCBpbiBvdGhlciBoeXBlcnZpc29yIHNpZGUNCmNoYW5n
ZXMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
