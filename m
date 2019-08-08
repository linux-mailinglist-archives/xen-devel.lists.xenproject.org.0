Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D386063
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvg0O-0004cm-29; Thu, 08 Aug 2019 10:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvg0N-0004ch-4S
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:50:47 +0000
X-Inumbo-ID: 58f56e24-b9ca-11e9-8acd-238fd5d7338f
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58f56e24-b9ca-11e9-8acd-238fd5d7338f;
 Thu, 08 Aug 2019 10:50:42 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 10:50:25 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 10:49:16 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 10:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8ypWjxiIGsI9ybOqbzrvnbovkXP9eBvG4BXPrL80Vuz32Wr7JZjas9sP82cuTK+iLPWhW1Kp9jWQeCgMJ9TAcMtG8ATR+FzU86G43iRLXhu/bUgjZ9Z0UoSAGZzDZG46ViQxSuTga1FFdrtmwDhvA7EiiDC6u3e4JkT7bmxmJ0rEcPnmCDrB4VklF2UDkXWLQOzoQW7F5QgPk2pF23BbNUxOgRz2gGmZcBYzseNjNZyliNSYzaYJoke5zlSKCd7eUGmQPtxu2J9hGKGBYUumATtAe3ki+CqwI7Vy6Qy2dkJFcvHQqpiqiejIdzWD1D6USksNiLtRU+EjGunoCShcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukUm026BzIk6klYZprn+smx/6H3yT6zA0G8gQ3X06WE=;
 b=FDUvQFWSiZULvGVHVJTX6qXQqXzRUf9na2k5l0e8t1T+pSmpi1QZMSqEXUQ/nFDSqcLKAM0JYoan/2lY03fXxBagr9VIG2sLPaikYKkJ+avbCQl0R4uDSPBAj0vfIkBcO78J9S+aVyIUWzf7bOGkfa+ov3uo0gzJtvlr+EJv37++2NiaGV8VXsE4K378nzWGjpBdgLxnBVkd5SGm3rcOzRw60+8imIV+LBAQzcoNCZXDGMF6wog4LixfhVWgTrrg1T/rsHoLW5jbPbIh/R1+uTMl76QikP41ezRJLdtztgh2psodkObNvmpwxUUfWQ/nUZyhcpZe8+XUTyjIH42flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2543.namprd18.prod.outlook.com (20.179.81.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 8 Aug 2019 10:49:15 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 10:49:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: Terminology for "guest" - Was: [PATCH] docs/sphinx: Introduction
Thread-Index: AQHVTVg9HA+V/L6GaUOhZY0QYGP536bw6jIAgAAF3ZyAAAWxgIAAArPRgAAar4A=
Date: Thu, 8 Aug 2019 10:49:15 +0000
Message-ID: <c2654c96-3236-70ae-70cb-581cfa193aff@suse.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
In-Reply-To: <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0026.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::39) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddf60970-7521-44c5-34a9-08d71bee0e36
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB2543; 
x-ms-traffictypediagnostic: MN2PR18MB2543:
x-microsoft-antispam-prvs: <MN2PR18MB254382895D3813A0A47CAA8FB3D70@MN2PR18MB2543.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(54906003)(7736002)(14444005)(256004)(99286004)(305945005)(229853002)(4326008)(80792005)(31686004)(71190400001)(66066001)(6246003)(2906002)(3846002)(5660300002)(478600001)(6116002)(81156014)(316002)(8676002)(71200400001)(25786009)(8936002)(6486002)(446003)(11346002)(2616005)(476003)(53936002)(486006)(52116002)(86362001)(6436002)(31696002)(6916009)(36756003)(26005)(386003)(53546011)(102836004)(6506007)(66946007)(186003)(66476007)(66556008)(64756008)(66446008)(6512007)(76176011)(81166006)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2543;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IQK4JvVU7y9PjYrXKdIHcmtcRAMzgbYVTUveoQUCX3ZceYmR0jkNPJyZkYJGccaJe1KOCVHADDxyIUQYioKkR1qMHeKRoEMmc69m1MqhrtEF/pvBQfHJop5i0GXqMKGXPnrd/NVisurh9JzpLX/bC8NBuCrdlcIKvIn8QtEew2SPfJ34CnAGUcQYjBjDGIHeDgth9gbdQjBasMfA2A7BB9HwCD7WPXWFXQuZqExO7q22siUoQw80G+NWcxRxpoN5MQ72Tl33uF3Apb2MjqaQz3s9Z+khRrWz710VlKDQfhtaJ9Oz0mO32X17Po4PHySDGEqVauSI8krKoAsZ3JL559BfECK7XMHj3v/xlMM1fLz74cGAc01sq7Ayx11ut2diLiC/POmoELG1OSS3UM3u6iXTSX19sUEOqGwHYrH9LUE=
Content-ID: <F2A02859A1DB4E40ACD1D0EB33DEAF5B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf60970-7521-44c5-34a9-08d71bee0e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 10:49:15.2393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xcaIa3jYUZpb7Tb8dNt3oghvW9RIxcwAOtSgWO26Jo7vqrX8op4Ctbh+RZtdXELbLCNCvivyWFExgFF0MNH1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2543
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMToxMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBKYW4sDQo+IA0K
PiBPbiAwOC8wOC8yMDE5IDEwOjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA4LjA4LjIw
MTkgMTA6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMDgvMDgvMjAxOSAwNzoyMiwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA3LjA4LjIwMTkgMjE6NDEsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+PiArKysgYi9kb2NzL2dsb3NzYXJ5
LnJzdA0KPj4+Pj4gQEAgLTAsMCArMSwzNyBAQA0KPj4+Pj4gK0dsb3NzYXJ5DQo+Pj4+PiArPT09
PT09PT0NCj4+Pj4+ICsNCj4+Pj4+ICsuLiBUZXJtcyBzaG91bGQgYXBwZWFyIGluIGFscGhhYmV0
aWNhbCBvcmRlcg0KPj4+Pj4gKw0KPj4+Pj4gKy4uIGdsb3NzYXJ5OjoNCj4+Pj4+ICsNCj4+Pj4+
ICvCoMKgIGNvbnRyb2wgZG9tYWluDQo+Pj4+PiArwqDCoMKgwqAgQSA6dGVybTpgZG9tYWluYCwg
Y29tbW9ubHkgZG9tMCwgd2l0aCB0aGUgcGVybWlzc2lvbiBhbmQNCj4+Pj4+IHJlc3BvbnNpYmls
aXR5DQo+Pj4+PiArwqDCoMKgwqAgdG8gY3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBv
biB0aGUgc3lzdGVtLg0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqAgZG9tYWluDQo+Pj4+PiArwqDCoMKg
wqAgQSBkb21haW4gaXMgWGVuJ3MgdW5pdCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5l
cmFsbHkgaGFzDQo+Pj4+PiBhdCB0aGUNCj4+Pj4+ICvCoMKgwqDCoCBtaW5pbXVtIHNvbWUgUkFN
IGFuZCB2aXJ0dWFsIENQVXMuDQo+Pj4+PiArDQo+Pj4+PiArwqDCoMKgwqAgVGhlIHRlcm1zIDp0
ZXJtOmBkb21haW5gIGFuZCA6dGVybTpgZ3Vlc3RgIGFyZSBjb21tb25seSB1c2VkDQo+Pj4+PiAr
wqDCoMKgwqAgaW50ZXJjaGFuZ2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQg
dGhpbmdzLg0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqDCoMKgIEEgZ3Vlc3QgaXMgYSBzaW5nbGUgdmly
dHVhbCBtYWNoaW5lLg0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqDCoMKgIENvbnNpZGVyIHRoZSBjYXNl
IG9mIGxpdmUgbWlncmF0aW9uIHdoZXJlLCBmb3IgYSBwZXJpb2Qgb2YNCj4+Pj4+IHRpbWUsIG9u
ZQ0KPj4+Pj4gK8KgwqDCoMKgIGd1ZXN0IHdpbGwgYmUgY29tcHJpc2VkIG9mIHR3byBkb21haW5z
LCB3aGlsZSBpdCBpcyBpbiB0cmFuc2l0Lg0KPj4+Pj4gKw0KPj4+Pj4gK8KgwqAgZG9taWQNCj4+
Pj4+ICvCoMKgwqDCoCBUaGUgbnVtZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmluZyA6dGVybTpg
ZG9tYWluYC7CoCBJdCBpcw0KPj4+Pj4gdW5pcXVlIHRvIGENCj4+Pj4+ICvCoMKgwqDCoCBzaW5n
bGUgaW5zdGFuY2Ugb2YgWGVuLCB1c2VkIGFzIHRoZSBpZGVudGlmaWVyIGluIHZhcmlvdXMgQVBJ
cywNCj4+Pj4+IGFuZCBpcw0KPj4+Pj4gK8KgwqDCoMKgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2Vx
dWVudGlhbGx5IGZyb20gMC4NCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgIGd1ZXN0DQo+Pj4+PiArwqDC
oMKgwqAgU2VlIDp0ZXJtOmBkb21haW5gDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgeW91IHdhbnQgdG8g
bWVudGlvbiB0aGUgdXN1YWwgZGlzdGluY3Rpb24gaGVyZTogRG9tMCBpcywNCj4+Pj4gd2hpbGUg
YSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuDQo+Pj4NCj4+PiBUbyBi
ZSBob25lc3QsIEkgaGFkIHRvdGFsbHkgZm9yZ290dGVuIGFib3V0IHRoYXQuwqAgSSBndWVzcyBu
b3cgaXMgdGhlDQo+Pj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1YmxpYy4NCj4+Pg0K
Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIHdheSBpdCBjdXJyZW50bHkgZ2V0cyB1c2VkIGhhcyBhIGNs
ZWFyIG9yIGNvaGVyZW50IHNldA0KPj4+IG9mIHJ1bGVzLCBiZWNhdXNlIEkgY2FuJ3QgdGhpbmsg
b2YgYW55IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1c2VkLg0KPj4+DQo+Pj4gRWl0aGVy
IHRoZXJlIGFyZSBhIGNsZWFyIGFuZCBjb2hlcmVudCAoYW5kIHNpbXBsZSEpIHNldCBvZiBydWxl
cyBmb3INCj4+PiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hpY2ggcG9pbnQgdGhleSBj
YW4gbGl2ZSBoZXJlIGluIHRoZQ0KPj4+IGdsb3NzYXJ5LCBvciB0aGUgZnV6enkgd2F5IGl0IGlz
IGN1cnJlbnQgdXNlZCBzaG91bGQgY2Vhc2UuDQo+Pg0KPj4gV2hhdCdzIGZ1enp5IGFib3V0IERv
bTAgbm90IGJlaW5nIGEgZ3Vlc3QgKGR1ZSB0byBiZWluZyBhIHBhcnQgb2YgdGhlDQo+PiBob3N0
IGluc3RlYWQpPw0KPiBEb20wIGlzIG5vdCBwYXJ0IG9mIHRoZSBob3N0IGlmIHlvdSBhcmUgdXNp
bmcgYW4gaGFyZHdhcmUgZG9tYWluLg0KDQpJdCdzIHN0aWxsIHRoZSBjb250cm9sIGRvbWFpbiB0
aGVuLCBhbmQgaGVuY2Ugc3RpbGwgcGFydCBvZiB0aGUgaG9zdC4NCg0KPiBJIGFjdHVhbGx5IHRo
b3VnaHQgd2UgcmVuYW1lZCBldmVyeXRoaW5nIGluIFhlbiBmcm9tIERvbTAgdG8gaHdkb20NCj4g
dG8gYXZvaWQgdGhlIGNvbmZ1c2lvbi4NCg0KQXMgdG8gdmFyaWFibGUgbmFtaW5nIC0gbW9zdGx5
LCBJIHRoaW5rLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
