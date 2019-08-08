Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2428655F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:13:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvk3e-0001YG-T8; Thu, 08 Aug 2019 15:10:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvk3c-0001YB-P7
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:10:24 +0000
X-Inumbo-ID: 9b1b161c-b9ee-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b1b161c-b9ee-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:10:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 15:10:00 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 15:01:57 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 15:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKMn/SrqqqZ2odHN0WOs/0Zsn0ECAsXp/h3XRYnqJZ2i318CBRaLQZOrups7aAYmhMqg8nF2IOqZ3Oii+ibacEFSDIjdCIbQ3AImBrjJqfIJsxFdBPE1wc+tXlglT7wFAeB0hJP5Ch9lX3+73ZJwVMizHFiFO8xxmsCrLAu0bgri7Uo6M3tVzA2PBAggli5OG60ek1kvTm8urrKQiZr4t+79/LT64Qh/UPvYyWiTfB7V35MJyoleiczyWFnBEmsGknUm2UV9zu4rT+Hdy0UBmFYK4kFyWoRW6i6e1vvr3YTNVVNnLY+4QATo+sJPhFW4OK2ChYSQeiNoj5R7CIht5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpXDb0cpjoMQ7wHmOkF4E/r764mu6leVcpJ90pq/mDA=;
 b=Y+I+4+a2z3s3+PbY7ZtWoni0jTtwTCtAsC6UzIjc7XbCxkv/MHWELjUnVmmLUL2+s3cT9SNL4ieOlEfkI8bZdEBZJ9F5EF7ICNTNbiQDEosaOBRZR2vToL6hW0XDTNRHVciCI0EJtuYiY+y531rSPnBgruS1r6Sl0eVRuCtDipgMMrOC1SkwTClUZ15vgEMuGskJk53RcDIUQghrkmOjIhYwXdfusaDNbMJGg019ceAZlMao43V309rmiy89EcXzb5WU6kmJ0X4GgjFr1bAL5JY5MykJpfUNHNJlPg1RMENOO3khfiKBuhuvzy7Cub6h4lUR2i0+3TjRhlxpOlGMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2365.namprd18.prod.outlook.com (20.179.82.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 15:01:55 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:01:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 1/4] xen/console: Don't treat NUL character as the end
 of the buffer
Thread-Index: AQHVS5HylAe3eE1UcUur5OQYZ6SMtKbxSYOAgAAFgJiAAA5CAA==
Date: Thu, 8 Aug 2019 15:01:55 +0000
Message-ID: <63961c42-9716-b563-4eae-0e9164e24367@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-2-julien.grall@arm.com>
 <1adc84d1-dc16-5390-a056-e67d8eb9ab95@suse.com>
 <d86b54ba-cf10-892b-b6a0-aa2a4f1e3a07@arm.com>
In-Reply-To: <d86b54ba-cf10-892b-b6a0-aa2a4f1e3a07@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0028.eurprd02.prod.outlook.com
 (2603:10a6:208:1::41) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28819b47-59cc-4b39-6289-08d71c115a80
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB2365; 
x-ms-traffictypediagnostic: MN2PR18MB2365:
x-microsoft-antispam-prvs: <MN2PR18MB236583A960780BD8D590CF51B3D70@MN2PR18MB2365.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(51444003)(4326008)(36756003)(54906003)(6116002)(316002)(229853002)(6916009)(3846002)(6486002)(2906002)(25786009)(80792005)(102836004)(14444005)(186003)(476003)(6506007)(53546011)(386003)(11346002)(2616005)(446003)(486006)(71200400001)(71190400001)(76176011)(52116002)(31686004)(31696002)(99286004)(66066001)(256004)(7416002)(7736002)(4744005)(26005)(86362001)(478600001)(64756008)(8676002)(81156014)(6246003)(8936002)(53936002)(14454004)(6512007)(81166006)(66476007)(6436002)(66946007)(66556008)(5660300002)(305945005)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2365;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LkWLYteojZ/AD6Co3HDVewFicyvn096AV7ruLGJwlaBtN3e1LAXqt7FnDzkZscs3ORJblYSn5g/v0tZ/ndKW2m+ptxrPz8lkt8/QLxJNcz+/QfXNl/XM78RRbdfB5lroFohRjFUbGAFNtlV8YkZtEzmszsm8DxDhD+yoHLs2EN0gwuwxz+JYPTtv4didAbNE8k6298N4r9Dyua2ei1yiyUywpoAaIKTV5BgC+cZKzK6CdjO70TVbLfn2hLb/Dge4i3sUasw1yOsw9iOfitQEm8PfKjPYVPLFrZ4cCTnKuAJsxc53DxSHFiy0mvq0UGoqUmHYXsQBw6ZOhfW0jrQcXOl61PIdWVMM1XQ6Xov61zaUC5B5O5sUKYQYEY8m6BeZZ2zA3hkHOGAUDbL0sOLVmu5ad+Dcmq7jHLTwC2jajw4=
x-ms-exchange-transport-forked: True
Content-ID: <D5DBCEB92064EE4D83237B057B001A06@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28819b47-59cc-4b39-6289-08d71c115a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:01:55.7098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yy3jlW8uf50MJ8lisBF2cESGy4p3xc6CoGcrdoLVapsYn/ZD5XOggHaLeY3jj/spAL7yLMcC0ioU1gZbVnGbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2365
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen/console: Don't treat NUL
 character as the end of the buffer
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxNjoxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiAwOC8wOC8yMDE5
IDE0OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA1LjA4LjIwMTkgMTU6MjksIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdmlkZW8uaA0KPj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi92aWRlby5oDQo+Pj4gQEAgLTEzLDExICsxMywxMSBAQA0KPj4+
IMKgI2lmZGVmIENPTkZJR19WSURFTw0KPj4+IMKgdm9pZCB2aWRlb19pbml0KHZvaWQpOw0KPj4+
IC1leHRlcm4gdm9pZCAoKnZpZGVvX3B1dHMpKGNvbnN0IGNoYXIgKik7DQo+Pj4gK2V4dGVybiB2
b2lkICgqdmlkZW9fcHV0cykoY29uc3QgY2hhciAqLCBzaXplX3QgbnIpOw0KPj4+IMKgdm9pZCB2
aWRlb19lbmRib290KHZvaWQpOw0KPj4+IMKgI2Vsc2UNCj4+PiDCoCNkZWZpbmUgdmlkZW9faW5p
dCgpwqDCoMKgICgodm9pZCkwKQ0KPj4+IC0jZGVmaW5lIHZpZGVvX3B1dHMocynCoMKgICgodm9p
ZCkwKQ0KPj4+ICsjZGVmaW5lIHZpZGVvX3B1dHMocywgbnIpwqDCoCAoKHZvaWQpMCkNCj4+DQo+
PiBXaGlsZSBJIGRvbid0IHRoaW5rIHRoZXJlJ3Mgb3Zlcmx5IG11Y2ggcmlzayBvZiAicyIgZ2V0
dGluZyBhbg0KPj4gYXJndW1lbnQgd2l0aCBzaWRlIGVmZmVjdHMgcGFzc2VkLCBJIHRoaW5rIHRo
YXQgZm9yICJuciIgdGhlDQo+PiByaXNrIGlzIHRoZXJlLiBNYXkgSSBhc2sgdGhhdCB5b3UgZXZh
bHVhdGUgYm90aCBoZXJlLCBqdXN0IGluDQo+PiBjYXNlPw0KPiANCj4gQXJlIHlvdSBoYXBweSB3
aXRoIHRoZSBmb2xsb3dpbmcgY29kZSAoTm90IHlldCBjb21waWxlZCEpOg0KPiANCj4gI2RlZmlu
ZSB2aWRlb19wdHVzKHMsIG5yKSAoKHZvaWQpKHMpLCAodm9pZCkobnIpKQ0KDQpXaXRoIHMvcHR1
cy9wdXRzLyAtIHN1cmUuIEEgc3RhdGljIGlubGluZSBtaWdodCBiZSBhbm90aGVyDQooZXZlbiBi
ZXR0ZXIpIG9wdGlvbi4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
