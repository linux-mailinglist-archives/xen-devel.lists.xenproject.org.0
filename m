Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC5278CB9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5ay-0005Ui-CS; Mon, 29 Jul 2019 13:21:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5aw-0005UY-TG
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:21:42 +0000
X-Inumbo-ID: c240c396-b203-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c240c396-b203-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:21:41 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:21:27 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 13:02:43 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 13:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5bsyWKS09CyK+XXIGfeJJy/pv6XH2FEBIjYp18Dm3BZPxKK4SeAORglGmxmeSI3t0N07HzOq5WFUWM3Wj5dadcRfSYa4m4WvNzy+OiikcfFvw+lacvrcjFp7Y+OGAVoKcgFW0ONNWMm6LET1rGF+6OPnh0x6xgrp81YArlepg5OHF79d5jBzOKYkmQm5PmDMd4E7esU0/Jef539hypoIDxAyzHtgV0dA+JZCLMIGh033FZwwm8f4pEgrCeNEkDzOV+6gOrdr7jD24Mn24mKv6Sy3wxto+JuYFEnhe1Wwac8WLnsvoEFe+Kdx22AP3Lh21RcjxDGPuj5XuJTM2NOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaCubTQeP85dAvVKUxBItvUGNqHNYpVRy21ohAbdPCY=;
 b=fZOW+IQTSfgzrTb8nFVdSiJ8m2cu65gopMSKKGoRVN0LYL6YPCGM9890nQ7KvvAoSSxVseLjXhvFKWNvj2TZ4239RpUac9w1O4QCLFNi1jimEgx4lKnw88KYRvdLdDEggjIYIFWf/prJKWZc87bLyMNSRje4ECu9AH9pvH0+XcSKnbTC2gJoPppzScZfp8Vpb5n7kqlQIl8rxt6W0llc4pCLLJQvbABgzWFFi54OnIFvi1BJ1mtFGqRZdWKayT64RfwGiSxP2Nbx/AUUW2pEhiarp3Mu6EN/5JosVQ1DL2ln2MkV6FtSyP7k/1o/u041+7nB9yDjQyQ7F4AOL48VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 13:02:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 13:02:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAMhBoBgASM1gCAAAh2qIAAA3yA
Date: Mon, 29 Jul 2019 13:02:41 +0000
Message-ID: <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
In-Reply-To: <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0055.eurprd03.prod.outlook.com
 (2603:10a6:5:2a::32) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5cf43d1-72c0-40df-f593-08d714250a52
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR18MB336364963856EFB43B8CEC0BB3DD0@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(186003)(14444005)(52116002)(6436002)(8676002)(81156014)(66066001)(256004)(6486002)(76176011)(71200400001)(71190400001)(8936002)(26005)(81166006)(53936002)(966005)(7416002)(102836004)(478600001)(6246003)(386003)(6506007)(53546011)(446003)(36756003)(11346002)(31686004)(68736007)(99286004)(305945005)(7736002)(6306002)(6512007)(66476007)(486006)(5660300002)(476003)(229853002)(14454004)(25786009)(86362001)(66556008)(66446008)(64756008)(66946007)(316002)(6916009)(2906002)(54906003)(80792005)(3846002)(2616005)(31696002)(6116002)(4326008)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l1Oqon6DSIysceD+RzItnNUXIZo5QouBvEUG9ToLDsxWa9dDYN35453xK1aymXMn+7rAcwThizCanA2GSCZq+m/qwPMyp8kOxbzlhieL/AxkhEIHhZiWruptGW5QRuaJppvHXhMmGoxXdsm8N0WIGMxRMVCAQ2AYGC8s/Z9VUhH6JM3AVnA7t8OyY4uh5UpW4oFUkYjZUKzUkqPr05XHIp08cQ8rVyCcF5d0uE29SbScfW05o8f+ESz/GUSOzM2sRD1czvH1z9QPyUij85N5kE7mcfDe2SWGzqNj28npK9LHh9kbJSNXjy5/CDTZNZ5H9ELnmPYbA//5Klu2x5vDF7ZoOYd0xsUCC5e99wn35wAWbx/fh+HapvtoJ03Q295vwSjD+4s8qBq53JihgOyrK9Cln2BgLeVzHN0elcs2HGk=
Content-ID: <896D3272F972A044B618D2F5801F330B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cf43d1-72c0-40df-f593-08d714250a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 13:02:41.7358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBKYW4sDQo+IA0K
PiBPbiA3LzI5LzE5IDE6MTkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjYuMDcuMjAx
OSAxNjo0OSwgVmlrdG9yIE1pdGluIHdyb3RlOg0KPj4+IEhpIEp1bGllbiwgQWxsLA0KPj4+DQo+
Pj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNjo0NCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGkgVGFtYXMsDQo+Pj4+DQo+Pj4+IE9u
IDcvMTgvMTkgNDoxNCBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCBK
dWwgMTgsIDIwMTkgYXQgOTowMiBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToNCj4+Pj4+Pg0KPj4+Pj4+IEhpIFRhbWFzLA0KPj4+Pj4+DQo+Pj4+Pj4gQWRkaW5n
IExhcnMsIEFydGVtIGFuZCBJdXJpaS4gSXVyaWkgaGFzIGJlZW4gd29ya2luZyBvbiBhIHZlcnNp
b24gZm9yDQo+Pj4+Pj4gY2xhbmctZm9ybWF0IHJlY2VudGx5Lg0KPj4+Pj4+DQo+Pj4+Pj4gT24g
Ny8xOC8xOSAzOjQzIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4+Pj4+IFVzaW5nIGFz
dHlsZSAoaHR0cDovL2FzdHlsZS5zb3VyY2Vmb3JnZS5uZXQpIGNhbiBncmVhdGx5IHJlZHVjZSB0
aGUgb3ZlcmhlYWQgb2YNCj4+Pj4+Pj4gbWFudWFsbHkgY2hlY2tpbmcgYW5kIGFwcGx5aW5nIHN0
eWxlLWZpeGVzIHRvIHNvdXJjZS1jb2RlLiBUaGUgaW5jbHVkZWQNCj4+Pj4+Pj4gLmFzdHlsZXJj
IGlzIHRoZSBjbG9zZXN0IGFwcHJveGltYXRpb24gb2YgdGhlIGVzdGFibGlzaGVkIFhlbiBzdHls
ZSAoaW5jbHVkaW5nDQo+Pj4+Pj4+IHN0eWxlcyBub3QgZm9ybWFsbHkgc3BlbGxlZCBvdXQgYnkg
Q09ESU5HX1NUWUxFIGJ1dCBjb21tb25seSByZXF1ZXN0ZWQpLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBD
aGVja2luZyB0aGUgY29tbWVudCBzdHlsZXMgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXV0b21h
dGlvbi4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSW5jb3Jwb3JhdGluZyBYZW4ncyBleGNlcHRpb24gdG8g
dGhlIGRvLXdoaWxlIHN0eWxlIGlzIG9ubHkgcGFydGlhbGx5IHBvc3NpYmxlLA0KPj4+Pj4+PiB0
aHVzIGEgY2hhbmdlIGlzIHByb3Bvc2VkIHRvIHRoZSBDT0RJTkdfU1RZTEUgb2YgbW92aW5nIHRo
ZSBicmFjZSBmcm9tICJkbyB7Ig0KPj4+Pj4+PiB0byB0aGUgbmV4dCBsaW5lLg0KPj4+Pj4+Pg0K
Pj4+Pj4+PiBNb3N0IG9mIFhlbidzIGNvZGUtYmFzZSBpcyBub24tY29uZm9ybWluZyBhdCB0aGUg
bW9tZW50OiAyODkgZmlsZXMgcGFzcw0KPj4+Pj4+PiB1bmNoYW5nZWQsIDg3NiBoYXZlIHNvbWUg
c3R5bGUgaXNzdWUNCj4+Pj4+Pj4NCj4+Pj4+Pj4gSWRlYWxseSB3ZSBjYW4gc2xvd2x5IG1pZ3Jh
dGUgdGhlIGVudGlyZSBjb2RlLWJhc2UgdG8gYmUgY29uZm9ybWluZywgdGh1cw0KPj4+Pj4+PiBl
bGltaW5hdGluZyB0aGUgbmVlZCBvZiBkaXNjdXNzaW5nIGFuZCBlbmZvcmNpbmcgc3R5bGUgaXNz
dWVzIG1hbnVhbGx5IG9uIHRoZQ0KPj4+Pj4+PiBtYWlsaW5nbGlzdC4NCj4+Pj4+Pg0KPj4+Pj4+
IEkgcXVpdGUgbGlrZSB0aGUgaWRlYSBvZiBhbiBhdXRvbWF0aWMgY29kaW5nIHN0eWxlIGNoZWNr
ZXIuIEhvd2V2ZXIsIGl0DQo+Pj4+Pj4gaXMgYSBiaXQgY29uY2VybmluZyB0aGF0IG5vdCBldmVu
IGEgMS8zIG9mIHRoZSBmaWxlcyBhcmUgYWJsZSB0byBwYXNzDQo+Pj4+Pj4gdGhlIGNvZGluZyBz
dHlsZSB5b3Ugc3VnZ2VzdC4gQ291bGQgeW91IGV4cGxhaW4gd2hldGhlciB0aGlzIGlzIGJlY2F1
c2UNCj4+Pj4+PiB0aGUgZmlsZXMgZG9lcyBub3QgYWxyZWFkeSBmb2xsb3cgWGVuIGNvZGluZyBz
dHlsZSBvciBpcyBpdCBqdXN0IHRoZQ0KPj4+Pj4+IGRpZmZlcmVuY2Ugd2l0aCBhc3R5bGU/DQo+
Pj4+Pj4NCj4+Pj4+PiBXaGF0IGFyZSB0aGUgbWFpbiBzdHlsZSBpc3N1ZXM/DQo+Pj4+Pg0KPj4+
Pj4gTG9va3MgbGlrZSBhIGxvdCBvZiBmaWxlcyB0aGF0IGRvbid0IGZvbGxvdyB0aGUgWGVuIGNv
ZGluZyBzdHlsZQ0KPj4+Pj4gYXMtaXMuIEFsaWdubWVudCBpc3N1ZXMgc2VlbSB0byBtZSB0byBi
ZSB0aGUgbW9zdCBjb21tb24gZXJyb3JzLiBTZWUNCj4+Pj4+IHRoZSBmdWxsIGRpZmYgaGVyZToN
Cj4+Pj4+DQo+Pj4+PiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90a2xlbmd5ZWwvYzVjYWMxNGEw
ZDU3ZjExOWRkNzc0N2ExYmU2ZmIyNjANCj4+Pj4+DQo+Pj4+PiBXZSBjYW4gcGVyaGFwcyB0dW5l
IHNvbWUgYXNwZWN0cyBvZiBpdCB3ZSBkaXNhZ3JlZSB3aXRoIHRoZSBhc3R5bGUNCj4+Pj4+IGdl
bmVyYXRlZCBzdHlsZSBhbmQgdHJ5IHRvIG92ZXJyaWRlIGl0LiBJIGRpZCBteSBiZXN0IHRvIG1h
a2UgaXQNCj4+Pj4+IGNvbmZvcm0gdG8gdGhlIGV4aXN0aW5nIFhlbiBzdHlsZSBidXQgY2VydGFp
bmx5IHRoZXJlIGNvdWxkIGJlIG90aGVyDQo+Pj4+PiB0d2Vha3MgbWFkZSB0byByZWR1Y2UgdGhl
IGNodXJuLg0KPj4+Pg0KPj4+PiBJIHRoaW5rIHdlIGRlZmluaXRlbHkgd2FudCB0byBhdm9pZCBj
aHVybiBhcyB0aGlzIGlzIGdvaW5nIHRvIHRha2UgYSBsb3QNCj4+Pj4gb2YgdGltZSB0byBmaXgg
YWxsIHRoZSBwbGFjZXMgdG8gdGhlIG5ldyBpbmRlbnRhdGlvbi4NCj4+Pj4NCj4+Pj4gR29pbmcg
dGhyb3VnaCB0aGUgZGlmZiBJIGNhbiBzZWUgbWFqb3IgZGlmZmVyZW5jZXMgd2l0aCB0aGUgWGVu
IENvZGluZw0KPj4+PiBzdHlsZSBhbmQgYWxzbyB3aGF0IGxvb2tzIGxpa2UgaW5jb25zaXN0ZW5j
aWVzIGZyb20gdGhlIHRvb2xzIGl0c2VsZjoNCj4+Pj4gwqDCoMKgwqAgLSBMaW5lIDU4OiBUaGlz
IGlzIGZhaXJseSBjb21tb24gdG8gaW5kZW50IHRoZSBwYXJhbWV0ZXJzIGFzIGl0IGlzDQo+Pj4+
IHRvZGF5LiBCdXQgdGhlbiBvbiBsaW5lIDE1OC8yNzIgaXQgaW5kZW50cyBhcyB3ZSBkbyB0b2Rh
eS4gU28gSSBhbSBub3QNCj4+Pj4gc3VyZSB3aGF0IHRoZSBleHBlY3RlZCBjb2Rpbmcgc3R5bGUg
ZnJvbSB0aGUgdG9vbHMuDQo+Pj4+IMKgwqDCoMKgIC0gTGluZSA2NzogSSBiZWxpZXZlIEphbiBy
ZXF1ZXN0IHRoZSBzcGFjZSBiZWZvcmUgbGFiZWwNCj4+PiBTZWVtcyBhZ3JlZWQgbm90IHRvIGFk
ZCB0aGUgc3BhY2VzIGJlZm9yZSBsYWJlbC4gUmlnaHQ/DQo+Pg0KPj4gQ2VydGFpbmx5IG5vdCwg
YWZhaWEuIEkgd2lsbCBvYmplY3QgdG8gYW55IHdyaXR0ZW4gZG93biBydWxlIGRpc2FsbG93aW5n
DQo+PiBsZWFkaW5nIGJsYW5rKHMpIGFsdG9nZXRoZXIuIEkgd2lsbCBhcmd1ZSBmb3IgbWFraW5n
IG1hbmRhdG9yeSBhdCBsZWFzdA0KPj4gb25lIGJsYW5rIG9mIGluZGVudGF0aW9uLg0KPiANCj4g
Q29kaW5nIHN0eWxlIGFyZSBhIG1hdHRlciBvZiB0YXN0ZS4gSWYgZXZlcnlvbmUgaXMgZ29pbmcg
dG8gc2F5ICJJIHdhbnQNCj4gdGhpcyBpbiB0aGUgY29kaW5nIHN0eWxlIiwgdGhlbiB3ZSBhcmUg
Z29pbmcgdG8gc3BlbmQgY291bnRsZXNzIG9mIGhvdXJzDQo+IGJpa2Utc2hlZGRpbmcuIFRoaXMg
aXMgbm90IGhvdyB3ZSBzaG91bGQgdXNlIG91ciBhbHJlYWR5IGxpbWl0ZWQgdGltZS4NCg0KSSBh
Z3JlZSB3aXRoIHdoYXQgeW91IHNheSBpbiBnZW5lcmFsLCBidXQgbm90IGluIHRoaXMgc3BlY2lm
aWMgY2FzZTogSSd2ZQ0KZXhwbGFpbmVkIHdoeSB0aGUgbGVhZGluZyBibGFuayhzKSBhcmUgd2Fu
dGVkIGhlcmUuIFRoaXMgaXMgbm90IGJlY2F1c2Ugb2YNCm15IHRhc3RlLCBidXQgYmVjYXVzZSBv
ZiBoZWxwaW5nIHdpdGggcGF0Y2ggcmV2aWV3Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
