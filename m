Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613078ADB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 13:49:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs47T-0004FH-Me; Mon, 29 Jul 2019 11:47:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs47S-0004FA-9b
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:47:10 +0000
X-Inumbo-ID: 92ae3d99-b1f6-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92ae3d99-b1f6-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 11:47:08 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 11:47:02 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 11:30:59 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 11:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaRsMc4VVracM1ueaSG+XOlzzDWkYANLZFWEY0+I+ZUQrm6M0HTEPcSotnzZD4JjsY7trihXUS34UrW5bN22EPs9/kbY83rRZpjC8xuRw/psvbat1LbEU78fxvGTI2Ya3iP8RQR3a2V2svqTJ6QU6sVDauQikU70IHC/bnUF76u5yfVLzmpEMHOQs9aOWdyghVZXo54uANjd2mp81kvWFk5dEajUC4aUgWlkKP4AAsGNiDQ3chIfbM6TWVs8iSv8wjomxtyZmbyEgDxXY9GF4VOpZ5uxZSaP8WAC8syl2zdMaBcsyRUNwjtvI1gdGDmUe1JwfV23wY0ZgWPCnpFV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+fvEmq3J36qR6hVysPfkto/BGPJj5KgflRU0n21SA4=;
 b=YRvoamS7jvdExh/Z2CRR7j/TUaL3K7WVGaSkMe6HQJo0SNmx+e/COGuQdvmjjwLvI/P2AUwKBCsxADDEglqP6CeiZHCDl97e0xMmaJ7UVFqO13shGt7+9fGJrn1lJDgOxsjCsTLwEfKvQ8ew8O6qGJoNGi8pPYKqmYUtCbz0fZZwkXz+Y7jM8jUXB5XvQrakmpb06d40uPxlOk5YFne5eYfXDnGQZKAuiA4JAdRlRUBpvntWtLnzh0SDIDhP1puRfBDenCVVcak5mOLlPpbWkIb/RTr9Q324d2tRFd28d6AnI0b7xKfgzmndEjibNXJ7gsAloqFbbDZOsGEIWIE42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3265.namprd18.prod.outlook.com (10.255.138.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Mon, 29 Jul 2019 11:30:55 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:30:54 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAAA2iAgAACSgCAAAxnAIAPT4MAgAA3mQA=
Date: Mon, 29 Jul 2019 11:30:54 +0000
Message-ID: <b56852e8-e7db-5185-552a-cd91f8821778@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
 <08ed1d56-b24b-66bd-34da-d0c329a2eecf@suse.com>
 <ded7b153-d2cd-15e1-93cc-9aaab2a06d95@bitdefender.com>
 <9a509cd8-d91a-036d-f949-f1c5d54059d6@bitdefender.com>
In-Reply-To: <9a509cd8-d91a-036d-f949-f1c5d54059d6@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0015.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaea1afc-87b3-478f-fa01-08d7141837e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3265; 
x-ms-traffictypediagnostic: BY5PR18MB3265:
x-microsoft-antispam-prvs: <BY5PR18MB3265467C7A3478A52226B67BB3DD0@BY5PR18MB3265.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(189003)(199004)(51444003)(256004)(14444005)(53936002)(4326008)(8676002)(66066001)(6512007)(6116002)(3846002)(81156014)(81166006)(80792005)(8936002)(6246003)(31686004)(2906002)(53546011)(6506007)(386003)(66446008)(76176011)(2616005)(486006)(11346002)(6436002)(446003)(71190400001)(71200400001)(229853002)(36756003)(5660300002)(6916009)(99286004)(316002)(7416002)(102836004)(476003)(86362001)(6486002)(478600001)(7736002)(305945005)(66946007)(64756008)(66556008)(66476007)(54906003)(68736007)(25786009)(26005)(186003)(31696002)(14454004)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3265;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tjs1sKlGLJVXKpi9081R4lxgKyptIzNO0GCn6KamGZrFeqTo+7Fd/hYF4Opg16GCCbGJEFTk7kK9jACHCKBXIQ4SejjM4EWhmcC3ROrt01okRrf7aAEt54ytS1nOJJAVkaUjOAKXzDZLuTnMqUISN7WdE1lhp6pq0mMbVnfs0ByEkz7gQHjGMH+w/dxMRf6dNXynY1Q93ONObOQ36ThKV6a9KWBGIu9wCmwf6QUUrMhaEys6krKX54zQSczOeyxHpSLt+bVkTPBxe3Zh7qc60E/baqBgwpSZYScJ/MKjc7v2I4QruLuyihNw47mS+SseL26QtR9UzajyjUSUxn7JyJYA1ukJbokPlyAa7Eife/TBeHSPqcxdaaaHdwufSEEpSnTEuae3KfGpJksVJP/A4rl6PwAKH9Hz86AFi1dda3g=
Content-ID: <82F28CEDFC02404CA603E81BD74F9965@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eaea1afc-87b3-478f-fa01-08d7141837e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:30:54.8498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3265
X-OriginatorOrg: suse.com
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxMDoxMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IA0K
PiANCj4gT24gMTkuMDcuMjAxOSAxNzoyMywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0KPj4gT24g
Ny8xOS8xOSA0OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wNy4yMDE5IDE1
OjMwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6DQo+Pj4+IE9uIDcvMTkvMTkgNDoxOCBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOS4wNy4yMDE5IDE0OjM0LCBBbGV4YW5kcnUgU3Rl
ZmFuIElTQUlMQSB3cm90ZToNCj4+Pj4+PiBPbiAxOC4wNy4yMDE5IDE1OjU4LCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4gT24gMDMuMDcuMjAxOSAxMjo1NiwgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgd3JvdGU6DQo+Pj4+Pj4+PiBBL0QgYml0IHdyaXRlcyAob24gcGFnZSB3YWxrcykgY2Fu
IGJlIGNvbnNpZGVyZWQgYmVuaWduIGJ5IGFuDQo+Pj4+Pj4+PiBpbnRyb3NwZWN0aW9uDQo+Pj4+
Pj4+PiBhZ2VudCwgc28gcmVjZWl2aW5nIHZtX2V2ZW50cyBmb3IgdGhlbSBpcyBhIHBlc3NpbWl6
YXRpb24uIFdlIHRyeQ0KPj4+Pj4+Pj4gaGVyZSB0bw0KPj4+Pj4+Pj4gb3B0aW1pemUgYnkgZml0
ZXJpbmcgdGhlc2UgZXZlbnRzIG91dC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQnV0IHlvdSBhZGQgdGhl
IHNlbmRpbmcgb2YgbW9yZSBldmVudHMgLSBob3cgZG9lcyAiZmlsdGVyIG91dCIgbWF0Y2gNCj4+
Pj4+Pj4gdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbj8NCj4+Pj4+Pg0KPj4+Pj4+IFRoZSBldmVu
dHMgYXJlIHNlbmQgb25seSBpZiB0aGVyZSBpcyBhIG1lbSBhY2Nlc3MgdmlvbGF0aW9uDQo+Pj4+
Pj4gdGhlcmVmb3JlIHdlDQo+Pj4+Pj4gYXJlIGZpbHRlcmluZyBhbmQgb25seSBzZW5kaW5nIHRo
ZSBldmVudHMgdGhhdCBhcmUgaW50ZXJlc3RpbmcgdG8NCj4+Pj4+PiBpbnRyb3NwZWN0aW9uLg0K
Pj4+Pj4NCj4+Pj4+IFdoZXJlIGlzIGl0IHRoYXQgeW91IHByZXZlbnQgYW55IGV2ZW50IGZyb20g
YmVpbmcgc2VudD8gQXMgc2FpZCwNCj4+Pj4+IHJlYWRpbmcgdGhlIHBhdGNoIEkgb25seSBzZWUg
bmV3IHNlbmRpbmcgc2l0ZXMgdG8gZ2V0IGFkZGVkLg0KPj4+Pg0KPj4+PiBJZiB3ZSBkb24ndCBl
bXVsYXRlLCB3ZSB3b3VsZCByZWNlaXZlIHRoZSBwYWdlLXdhbGstZ2VuZXJhdGVkIGV2ZW50cw0K
Pj4+PiBfYW5kXyB0aGUgdG91Y2hpbmctdGhlLXBhZ2UtdGhlLWluc3RydWN0aW9uLWlzLXRvdWNo
aW5nIGV2ZW50cy4NCj4+Pg0KPj4+IFNpbmNlIHRoZSBwYXRjaCBoZXJlIGFsdGVycyBlbXVsYXRp
b24gcGF0aHMgb25seSwgaG93IGRvIHlvdSBrbm93DQo+Pj4gd2hldGhlciB0byBlbXVsYXRlPyBJ
biBvcmRlciB0byBub3QgcmVjZWl2ZSB1bmR1ZSBldmVudHMgaXQgd291bGQNCj4+PiBzZWVtIHRv
IG1lIHRoYXQgeW91J2QgZmlyc3QgaGF2ZSB0byBpbnRlcmNlcHQgdGhlIGd1ZXN0IG9uIGluc25z
DQo+Pj4gb2YgaW50ZXJlc3QgLi4uIE92ZXJhbGwgSSB0aGluayB0aGF0IHRoZSBwYXRjaCBkZXNj
cmlwdGlvbiwgd2hpbGUNCj4+PiBpdCBoYXMgaW1wcm92ZWQsIGlzIHN0aWxsIGxhY2tpbmcgc3Vm
ZmljaWVudCBpbmZvcm1hdGlvbiBmb3IgYQ0KPj4+IHBlcnNvbiBsaWtlIG1lIChub3Qga25vd2lu
ZyBtdWNoIGFib3V0IHlvdXIgbW9uaXRvciB0b29scykgdG8gYmUNCj4+PiBhYmxlIHRvIHNlbnNp
Ymx5IHJldmlldyB0aGlzICh3aGljaCBpbmNsdWRlcyB1bmRlcnN0YW5kaW5nIHRoZQ0KPj4+IHBy
ZWNpc2Ugc2NlbmFyaW8geW91IHdhbnQgdG8gaW1wcm92ZSkuDQo+Pg0KPj4gSWYgdGhlIGhhcmR3
YXJlIGV4aXRzIGJlY2F1c2Ugb2YgYW4gRVBUIGZhdWx0IGNhdXNlZCBieSBhIHBhZ2Ugd2Fsaywg
d2UNCj4+IGVuZCB1cCBpbiBwMm1fbWVtX2FjY2Vzc19jaGVjaygpLCBhdCB3aGljaCBwb2ludCB3
ZSBuZWVkIHRvIGRlY2lkZSBpZiB3ZQ0KPj4gd2FudCB0byBzZW5kIG91dCBhIHZtX2V2ZW50IG9y
IG5vdC4NCj4+DQo+PiBJZiB3ZSB3ZXJlIHRvIHNlbmQgb3V0IHRoaXMgdm1fZXZlbnQsIGFuZCBp
dCB3b3VsZCB0aGVuIGJlIG1hZ2ljYWxseQ0KPj4gdHJlYXRlZCBzbyB0aGF0IHdlIGdldCB0byBh
Y3R1YWxseSBydW4gdGhlIGluc3RydWN0aW9uIGF0IFJJUCwgc2FpZA0KPj4gaW5zdHJ1Y3Rpb24g
bWlnaHQgYWxzbyBoaXQgYSBwcm90ZWN0ZWQgcGFnZSBhbmQgcHJvdm9rZSBhIHZtX2V2ZW50Lg0K
Pj4NCj4+IE5vdywgaWYgbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhLCB0aGVuIHdl
J3JlIGluIHRoZSBwYWdlIHdhbGsNCj4+IGNhc2UsIGFuZCBzbyBpbiB0aGlzIGNhc2Ugb25seSwg
YW5kIG9ubHkgaWYNCj4+IGQtPmFyY2gubW9uaXRvci5pbmd1ZXN0X3BhZ2VmYXVsdF9kaXNhYmxl
ZCBpcyB0cnVlLCB3ZSB3b3VsZCBjaG9vc2UgdG8NCj4+IGRvIHRoaXMgZW11bGF0aW9uIHRyaWNr
OiBlbXVsYXRlIF90aGVfcGFnZV93YWxrXyB3aGlsZSBpZ25vcmluZyB0aGUgRVBULA0KPj4gYnV0
IGRvbid0IGlnbm9yZSB0aGUgRVBUIGZvciB0aGUgZW11bGF0aW9uIG9mIHRoZSBhY3R1YWwgaW5z
dHJ1Y3Rpb24uDQo+Pg0KPj4gU28gd2hlcmUgaW4gdGhlIGZpcnN0IGNhc2Ugd2Ugd291bGQgaGF2
ZSAyIEVQVCBldmVudHMsIGluIHRoZSBzZWNvbmQgd2UNCj4+IG9ubHkgaGF2ZSBvbmUgKG9yIGlm
IHRoZSBpbnN0cnVjdGlvbiBhdCBSSVAgZG9lcyBub3QgdHJpZ2dlciBhbiBFUFQNCj4+IGV2ZW50
LCB3ZSB3b3VsZCBoYXZlIDEgZXZlbnQgaW4gdGhlIGZpcnN0IGNhc2UsIGFuZCBub25lIGluIHRo
ZSBzZWNvbmQpLg0KPj4gSGVuY2UgdGhlIGZpbHRlcmluZyBtZW50aW9uZWQuDQo+Pg0KPj4gU28g
dG8gYW5zd2VyIHlvdXIgcXVlc3Rpb246ICJob3cgZG8geW91IGtub3cgd2hldGhlciB0byBlbXVs
YXRlIiwgd2UgZG8NCj4+IHNvIG9ubHkgaWYgbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhf
Z2xhICYmDQo+PiBkLT5hcmNoLm1vbml0b3IuaW5ndWVzdF9wYWdlZmF1bHRfZGlzYWJsZWQuDQo+
Pg0KPj4gSSBob3BlIHRoaXMgY2xlYXJzIGl0IHVwIHNvbWV3aGF0Lg0KPj4NCj4gDQo+IFRvIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBuZWVkZWQgZm9yIHRoZSBuZXh0IHZlcnNpb24sIGFwYXJ0IGZy
b20gdGhlDQo+IGNvZGUgY2hhbmdlcywgaXMgdGhlIGRlc2NyaXB0aW9uIGdvb2Qgb3IgZG8gSSBo
YXZlIHRvIGFkZCBzb21ldGhpbmcgZWxzZT8NCg0KQXMgc2FpZCBpbiBhIHByaW9yIHJlcGx5LCBS
YXp2YW4ncyBleHBsYW5hdGlvbiBoYXMgaGVscGVkLiBJIGRvbid0IHRoaW5rDQp0aG91Z2ggdGhh
dCBpdCdzIHN1aXRhYmxlIGFzIGEgcGF0Y2ggZGVzY3JpcHRpb24gd2l0aG91dCBzb21lIGFkanVz
dG1lbnRzLg0KSSBmdXJ0aGVyIHNlZW0gdG8gcmVjYWxsIHRoYXQgSSBoYWQgYXNrZWQgZm9yIGEg
Y29uY3JldGUgZXhhbXBsZSB0byBiZQ0KbGFpZCBvdXQgaW4gdGhlIGRlc2NyaXB0aW9uLCBoaWdo
bGlnaHRpbmcgd2hhdCBleGFjdGx5IGluIHRoZSBvdmVyYWxsIGZsb3cNCnlvdXIgcGF0Y2ggbWVh
bnMgdG8gY2hhbmdlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
