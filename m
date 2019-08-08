Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7B86143
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvh0F-0001HQ-NO; Thu, 08 Aug 2019 11:54:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvh0D-0001HC-Pe
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:54:41 +0000
X-Inumbo-ID: 44f17e24-b9d3-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44f17e24-b9d3-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 11:54:40 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 11:54:13 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 11:52:37 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 11:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8sx9czkqB22rMtTdlflC4UOVtWVJF0wFXTbSDnXFheutEENawNQwM0Cg3ok8gqN5kj2TnN/XeC6E0/Rpa09s0plsulI24KBzFmeU99089gjW1lfNwHZucXEp6dFrf3mmLExfkee7ZtZb/0LwJgMG7G4QB7SroSjmrNmPEO1+bRtdnSiGvyA0OkRgCTJLn/o1tVFBUZDbfG4iWvNt7/BJ320KGptIzRNXlMbDL1TijNF/Ud50eBs6BXmOACXNw4KIuMas3EvA5PhLwzIPVe2plO7ko12nUBFx5Dr82yaph9v69rRtF0zytw2ZqiMNQHGjQ2CjlGdUnIFpZj1cqHULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN6DNjHLLaWMvwBzNZ6gItoQlKVofn0rb+5eCMBobsU=;
 b=bcoCiEQ3qrLEMRmuLXOTjaguOC+ipCCVFQIeiljKMKekzM70Veu39ZCFzDgokDxey5ZLhrRu8NGLDob6HvW3fwQROFfJMIS7tW8JNQRRRibWieFIlEffXF0fHzN6vb6PgddNzL51hg8Ihf0KeuaQ5ChXElvixnG93h7cOlSk3iGhA8Hist4xp+Ns5m3aZatyayiqxgsARo6ppj+GKGkx6vVzVcgtWnTC+fCgRTIlPv1KhvdfYNhRAXRlhdQ3x3TiLBK17hmvHxffV3GcYIMFZciGFUeTWT48nJQ2LG9ktJaKQ2TdPFzTJYjxGSsxwccNlYreEeR8iQjVlceNG1KFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3439.namprd18.prod.outlook.com (10.255.239.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 11:52:34 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 11:52:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/4] xen/spinlocks: in debug builds store cpu holding the
 lock
Thread-Index: AQHVTSzXlrQ8kurvmUW1rudnDuQmCKbw9GCA///tid6AACvj3YAAF10A
Date: Thu, 8 Aug 2019 11:52:34 +0000
Message-ID: <bba50de4-8d36-318a-31e0-cd336a58c1a4@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
 <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
In-Reply-To: <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f28a7d-bcf1-40d4-21dd-08d71bf6e6c5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3439; 
x-ms-traffictypediagnostic: MN2PR18MB3439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB34398247DDCF874E22A55044B3D70@MN2PR18MB3439.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(189003)(199004)(4744005)(86362001)(7736002)(305945005)(6246003)(53936002)(6116002)(6486002)(31686004)(6916009)(2906002)(66946007)(229853002)(6512007)(3846002)(66446008)(5660300002)(66476007)(6436002)(66556008)(64756008)(8676002)(31696002)(186003)(81166006)(81156014)(8936002)(26005)(2616005)(99286004)(446003)(14454004)(11346002)(476003)(316002)(36756003)(486006)(54906003)(25786009)(71200400001)(71190400001)(478600001)(52116002)(66066001)(76176011)(102836004)(4326008)(6506007)(53546011)(256004)(386003)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3439;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GLuY9N7vUkTGk8h6BvwC892LRL/tzKiBO86ZCD2qGNFjdgzNtNZIjVlzqi3SSncXpBVdahAjSe70YbZN58tNT39unSO3VKquyJbtbnjZNrf6ZcNhRDIUjf4a2oM+jIgfseQe0Zlo19bM1Y5Y0HmJcm57TkMWFmDTiOjae7oCv+5NtoNircO7f2BqpbrXiSYhTL1UXAkmch6PokaUh8QKyLIDDPSXQ7Ej3vtGAsC58EvG7UumxtWbDDoC5sM8irYpeFhWXpxDHCDHQiFueQ2nBShyddmkVPCFagIDUWgt/QVNToPeA8rc8RK+D80DCgBBmqmhfEGxuzjljwLsi2P2s4rwIAr+e0BnzOweOkz0tmjVauyAlv6ZGy7x3JoQlyePuqWQoZpzhTc9y/q+wKfW5EoZdFj5V6xEdoLXUHNPxmg=
Content-ID: <D098CFD8E5E1FC49A5E278B3B3929C19@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f28a7d-bcf1-40d4-21dd-08d71bf6e6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 11:52:34.6236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cADAsq4Ix7dF5buLAZvfWXq7WZWiUn2tg84a62DvoFWOLECvjIvjjuVY9T5b3xP1BU+cbOITMhVEDbuhNTiQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3439
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMjoyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiAwOC8wOC8yMDE5
IDA4OjUxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDguMDguMTkgMDg6NTgsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA4LjIwMTkgMTY6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4gRG8gd2UgaGF2ZSBhbiBpbXBsaWVkIGFzc3VtcHRpb24gc29tZXdoZXJlIHRoYXQg
dW5zaWduZWQgc2hvcnQgaXMNCj4+PiBleGFjdGx5IDE2IGJpdHMgd2lkZT8gSSB0aGluayAidmFs
IiB3YW50cyB0byBiZSB1aW50MTZfdCBoZXJlIChhcw0KPj4+IHlvdSByZWFsbHkgbWVhbiAiZXhh
Y3RseSAxNiBiaXRzIiksIHRoZSB0d28gYm9vbGVhbiBmaWVsZHMgd2FudA0KPj4+IHRvIGJlIGJv
b2wsIGFuZCB0aGUgcmVtYWluaW5nIHR3byBvbmVzIHVuc2lnbmVkIGludC4NCj4+DQo+PiBCdXQg
dGhhdCB3b3VsZCBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgdW5pb24gdG8gNCBieXRlcyBpbnN0
ZWFkIG9mIDIuDQo+PiBTbyBhdCBsZWFzdCBwYWQgYW5kIGNwdSBtdXN0IGJlIHVuc2lnbmVkIHNo
b3J0IG9yIChiZXR0ZXIpIHVpbnQxNl90Lg0KPiANCj4gSG93IGFib3V0IGJvb2wgaXJxX3NhZmU6
MT8NCg0KVGhhdCdzIHdoYXQgSSBoYWQgc3VnZ2VzdGVkLCBpbmRlZWQuIErDvHJnZW4ncyByZXNw
b25zZSB3YXMgZm9yDQpteSAidW5zaWduZWQgaW50IiBzdWdnZXN0aW9uIHRvd2FyZHMgdGhlIHR3
byBub24tYm9vbGVhbiBmaWVsZHMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
