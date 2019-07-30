Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC27A82F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:24:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsR8d-0005c6-OT; Tue, 30 Jul 2019 12:21:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NuEK=V3=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hsR8c-0005bx-DQ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:21:54 +0000
X-Inumbo-ID: 9c5799f6-b2c4-11e9-9db4-8b4e2c435861
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.136]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c5799f6-b2c4-11e9-9db4-8b4e2c435861;
 Tue, 30 Jul 2019 12:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIMXCPxBF9cv5zjNknkWqE56PcNkh3Vu4/r8RSIw9mkVWqjjbXYYWq+jTDa5T38a33yMocVVAKWxGHimft2tZ6fMR6Rpxz3q6sQz05cQ2KKoCGwW16e2YOnbuNP1eSiZftK/YS+Giqv6KaRcOOQpSTknawh91rc+bReBfqbpszLzDUdwMdNzDIcNhNN+Iso0Vwtnj1YZbchm+CdzvsTLKIcYDGmm120qkHwRvM0WqHndS18T6NRpvTd6+giW6Er0kOFNfNINCPZR8JZERRAMoJ1zUZGxR1vz3F8hmXBUQJSV9Svz+c+zaN880LfEaZw7FeUWK+jKoSFTlI3E1RZ4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZFpI0puT0yB2MRCUIeffWKHtoE7nOfgvLx1vuJ5YcA=;
 b=dmC+aQW9+nVgiXJr1AQAk25ouC+RWqoi/5r3A9x8vhUC8RkY3p2qqgCWT4fyGDnsia7Q+N+Iuno3FUtB1xbPHhfh6NagK5LdziLIcNb3lo0eBVquBD8G0Ji+rj87M266gN5uDmZlLYvQfcW7elfSdQVJsIZfqcTwd7jlZYW+pRe+3RCO7RgO2tvqr2/JP4byWSVCfecxlSzAuirBvvgP+BcbVyXLmce6grtAyxInSmbfDxLsv+A5/ZjOR0ly1aPSkx5ZJAewHTKZB7/1W9boFkJRUNYWhH+BGAr6Bycsn+DR1OI3z0SitIidjzVq6pCW08TiZj75+2heC0/RW1zZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZFpI0puT0yB2MRCUIeffWKHtoE7nOfgvLx1vuJ5YcA=;
 b=CVLPoaqgMPSBfnr17oD6iWTU9JYLhYr9gnVF7/8Cov4oHvelU8yBZF9mK0VEBFXMUIGve681/B1EyoJTSubMEc2Yn7OsY0kpEQbDfpDMiS8m5OW3rLPytXUnDSgVTOwijHbE8OC12tycBv+rZfJ6nqsNQWs6ETkje1WZFzGco2I=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2960.eurprd02.prod.outlook.com (10.171.107.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Tue, 30 Jul 2019 12:21:49 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18%3]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:21:49 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAyrw4A=
Date: Tue, 30 Jul 2019 12:21:49 +0000
Message-ID: <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
In-Reply-To: <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0102.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::18) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f08f4c01-e568-4e68-ed19-08d714e87ecb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2960; 
x-ms-traffictypediagnostic: VI1PR0202MB2960:|VI1PR0202MB2960:
x-microsoft-antispam-prvs: <VI1PR0202MB2960F2E24D58FA243EBB4ECAABDC0@VI1PR0202MB2960.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(6916009)(186003)(229853002)(99286004)(102836004)(2906002)(476003)(2616005)(52116002)(446003)(11346002)(5660300002)(8676002)(8936002)(31686004)(54906003)(7736002)(26005)(6506007)(6116002)(25786009)(76176011)(316002)(6486002)(3846002)(486006)(71190400001)(4326008)(36756003)(81166006)(53936002)(256004)(305945005)(14444005)(66556008)(66476007)(386003)(81156014)(66066001)(478600001)(6436002)(86362001)(68736007)(64756008)(6246003)(6512007)(14454004)(66446008)(66946007)(31696002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2960;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TAZS7iI/FrGHFYH2vByRCLGTjif7i6cPWi7mlE/G6sqvprVKSA3CYhB3oNjLDZDnvUx/QJgXoMwbCKbcbPfHr94OuylvHM+aVg/i3oPR0BKVGP15o2a4q5+j7SrYAXuO+6sOUwtC4DTo2WhvdbSZQg1c5p9BoAziEiU1/Xekfmnb7m0aKduqfXJ6PsuI9qR1GraAOJXLjsc3aJs3Zmp9Rx7XPaKH/RNMcZqdCSoF3kfn0fmiyJx+GBXVwRoLcDGbKLyL4Wut45p3zAfrVQ6EnsCpdqZQatxAwEuDWqg87mHCOJZWZjsQxnANY/g2gPLDtqZ9bdiuHi//ehr25pUUY/bijkfNTUwvDH9L8/GoFAKt2Esd3TgIfAl2mV8rODG4OWYT1Qscekp4pVC/namYuuKTsqSzeiy49lMvrHbEfec=
Content-ID: <17B9A956AD99D049B6CB66240E28E020@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08f4c01-e568-4e68-ed19-08d714e87ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:21:49.1078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2960
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+Pj4+PiBAQCAtNjI5LDYgKzY5NywxNCBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGlu
ZWFyX2FkZHIoDQo+Pj4+PiAgICAgICANCj4+Pj4+ICAgICAgICAgICAgICAgICAgIEFTU0VSVChw
Mm10ID09IHAybV9yYW1fbG9nZGlydHkgfHwgIXAybV9pc19yZWFkb25seShwMm10KSk7DQo+Pj4+
PiAgICAgICAgICAgICAgIH0NCj4+Pj4+ICsNCj4+Pj4+ICsgICAgICAgIGlmICggY3Vyci0+YXJj
aC52bV9ldmVudCAmJg0KPj4+Pj4gKyAgICAgICAgICAgIGN1cnItPmFyY2gudm1fZXZlbnQtPnNl
bmRfZXZlbnQgJiYNCj4+Pj4+ICsgICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50
KGFkZHIsIGdmbiwgcGZlYykgKQ0KPj4+Pj4gKyAgICAgICAgew0KPj4+Pj4gKyAgICAgICAgICAg
IGVyciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkpOw0KPj4+Pj4gKyAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPj4+Pj4gKyAgICAgICAgfQ0KPj4+Pg0KPj4+PiBEaWQgeW91IG5vdGljZSB0aGF0IHRo
ZXJlJ3MgYW4gaW1tZWRpYXRlIGV4aXQgZnJvbSB0aGUgbG9vcCBvbmx5DQo+Pj4+IGluIGNhc2Ug
dGhlIGxpbmVhciAtPiBwaHlzaWNhbCB0cmFuc2xhdGlvbiBmYWlscz8gVGhpcyBpcw0KPj4+PiBy
ZWxldmFudCBmb3IgcGFnZSBmYXVsdCBkZWxpdmVyeSBjb3JyZWN0bmVzcyBmb3IgYWNjZXNzZXMN
Cj4+Pj4gY3Jvc3NpbmcgcGFnZSBib3VuZGFyaWVzLiBJIHRoaW5rIHlvdSB3YW50IHRvIHVzZQ0K
Pj4+PiB1cGRhdGVfbWFwX2VycigpIGFuZCBkcm9wIHRoZSAiZ290byBvdXQiLiBJIGNhbid0IHJl
YWxseSBtYWtlIHVwDQo+Pj4NCj4+PiBCeSB1cGRhdGVfbWFwX2VycigpIGFyZSB5b3Ugc2F5aW5n
IHRvIGhhdmUgdGhlIGVyciB2YXIgYXNzaWduZWQgYW5kIHRoZW4NCj4+PiBkcm9wICJnb3RvIG91
dCI/IElmIHNvIGhvdyBkbyBJIGtlZXAgdGhlIGVyciBmcm9tIG15IGFjY2VzcyB2aW9sYXRpb24N
Cj4+PiB3aXRob3V0IGV4aXRpbmcgZnJvbSB0aGUgbG9vcD8NCj4+DQo+PiBDb3VudGVyIHF1ZXN0
aW9uOiBXaHkgZG8geW91IF9uZWVkXyB0byBrZWVwICJ5b3VyIiB2YWx1ZSBvZiBlcnI/DQo+PiBJ
ZiwganVzdCBhcyBhbiBleGFtcGxlLCB0aGVyZSdzIGdvaW5nIHRvIGJlIGEgI1BGIG9uIHRoZSBv
dGhlcg0KPj4gaGFsZiBvZiB0aGUgYWNjZXNzLCB0aGVuICJ5b3VyIiBhY2Nlc3MgdmlvbGF0aW9u
IGlzIG9mIG5vIGludGVyZXN0DQo+PiBhdCBhbGwuDQo+IA0KPiBZb3UgYXJlIHJpZ2h0LCB0aGVy
ZSBpcyBubyBuZWVkIHRvIGtlZXAgdGhlICJnb3RvIG91dCIgaGVyZS4gSXQgd2FzIGp1c3QNCj4g
Zm9yIG9wdGltaXphdGlvbiBpbiB0aGUgaWRlYSB0aGF0IHRoZXJlIGlzIG5vIG5lZWQgdG8gZG8g
ZnVydGhlciBzdGVwcw0KPiBidXQgSSBjYW4gZHJvcCB0aGUgImdvdG8gb3V0IiBhbmQgdGhlIGNv
ZGUgd2lsbCB3b3JrIHRoZSBzYW1lLg0KPiANCg0KVGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggZHJv
cHBpbmcgdGhlICJnb3RvIG91dCIuIElmIGV2ZXJ5dGhpbmcgZ29lcyBmaW5lIA0KdGhlbiBpdCB3
aWxsIHJldHVybiB0aGUgbWFwcGluZyBhbmQgSSBkb24ndCB3YW50IHRoYXQuIFRoaXMgY2FuIGJl
IA0Kc3RvcHBlZCBieSBjaGVja2luZyBpZiAoIGVyciApIGFmdGVyIHRoZSBsb29wIGFuZCBpdCBp
cyBub3QgbnVsbCB0aGVuIA0KZ290byBvdXQuIEFuZCBnb2luZyB3aXRoIHRoaXMgaWRlYSBJIGNh
biBpbml0ICplcnIgPSBOVUxMIGFuZCBkcm9wIHRoZSANCmVyciA9IE5VTEwgZnJvbSBodm1lbXVs
X21hcF9saW5lYXJfYWRkcigpLiBJcyB0aGlzIG9rIGZvciB0aGUgbmV4dCB2ZXJzaW9uPw0KDQpS
ZWdhcmRzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
