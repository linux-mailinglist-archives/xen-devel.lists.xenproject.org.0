Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB386CBAB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2Vi-0005DB-6Y; Thu, 18 Jul 2019 09:15:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho2Vg-0005D6-It
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:15:32 +0000
X-Inumbo-ID: 94814200-a93c-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94814200-a93c-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 09:15:30 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 09:15:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 09:15:17 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 09:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i49BNLYfRC3T7JzMi+/myuSTbl2N6ut8ZyixdzVd9CBra7f5a8cawGOcePsmW2vWtulG65DHMG73gpO7LTQWF1KukcBgBpaGAHbKVHlg5aFS19W+ZAnOywCXkn92ZSlqua63GFVuszyYjlM4dzEQKJDeNjn06ehagBP4DzTgUS0X7Bs7V0DNGHKtbPW5Hd/jT7JA/cP7H7AXlyR6faUO07CGSarzXWuBN24ysiBDNK+TcQghajXdLGoGXLRiXtRcSLZOKX+MGtvLweVnuFU4pFyw5COQ8cSavc1qmw17LPpRDhEhbP4JS1A8gKahw9GemJPQAFOl4yEnL7m9aoEK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScDBGuBLJlQXR/8FJasUvHk7gQIcXfH0XjLE1/A1w1M=;
 b=nVl9Xm8dAqc1f6lxf28pU7qhiop1AqL9hs+ejUiYU7eGeLAZKq7OAeRtdRzXMNGClwqI/NWgc/otdW4qf7IiuJyyoEEQLZToSxbHrxAYjw2eOiWIMlou9xPcTw936bY0qbIFPaq5znAREWxLJUgdGcLOPMQD0I3tyjjXvanoU0byQlVBnzhcXa1oZGNYDnHaD0Zhq/anbAAbhuWXNuqONhg2RBDPPwGcF8NoiuD3MvzhXvMrOxrc7mBdJt02HJLr7tHPktOabPPIFIEcb6aBcasGz6/TRnOYowYmOL6A80/oHk54M+IKRGiOHGKs1emAOnSKuaILAn93fAmcIIeRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2714.namprd18.prod.outlook.com (20.179.51.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 09:15:16 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:15:16 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhi6bN7RdMgAB5rACAAEe/loAAGskAgABeoF+AAPQ0AA==
Date: Thu, 18 Jul 2019 09:15:16 +0000
Message-ID: <8dedc87a-02fa-14d4-17b7-93178a4f2972@suse.com>
References: <1563217075.6815.14.camel@amazon.com>
 <60587685-fbe9-116a-72e8-413eb7e99063@citrix.com>
 <c9053dcf-7c24-58b5-171a-a410653833f5@suse.com>
 <44e0c48b-2cba-c3fa-0d99-c14b413f98e2@citrix.com>
 <ef9cc9b8-f8f1-b395-54a5-0c9d2e6715ef@suse.com>
 <0c16a41b-50d8-9d65-335b-cc6ebeb1fc4a@citrix.com>
In-Reply-To: <0c16a41b-50d8-9d65-335b-cc6ebeb1fc4a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:10:12::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c79102c-1bf7-43e4-99e8-08d70b60727b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2714; 
x-ms-traffictypediagnostic: DM6PR18MB2714:
x-microsoft-antispam-prvs: <DM6PR18MB27146C4578F8A6B137B7CD8CB3C80@DM6PR18MB2714.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(80792005)(7736002)(99286004)(66066001)(68736007)(305945005)(8936002)(316002)(52116002)(2616005)(561944003)(186003)(446003)(476003)(26005)(11346002)(102836004)(64756008)(14454004)(66556008)(6512007)(8676002)(81156014)(53936002)(386003)(54906003)(66946007)(66446008)(81166006)(2906002)(3846002)(6116002)(66476007)(36756003)(31696002)(25786009)(6486002)(478600001)(256004)(6916009)(86362001)(6436002)(71190400001)(229853002)(486006)(76176011)(71200400001)(5660300002)(53546011)(6506007)(31686004)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2714;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bN1uYBbjeu2TJPU32xJKdqqQDIFzIDxMesq9YEi/Cx55QYOiZomA/WHOlCw6XU8IvAJeUm9r7mfRZuC8Q5X3ay1h3CdkMz6psgJaZu3tKPVVKgaWLjmL/c35Zq0QZYGFYVC0sOzjZo+WfBMp3LAMCanO93aewT8qKbX0POUHgqj8lbx8D33Tn1ThliBP1KOwux0CSrPRgfSJgMXOVCo7O0hEDy6/rxviB/FRLE+T6K/DP7/eO80Ysg61ieCR5gvi3jquqf/HVhC4+E0dK81ZtNJA1AmiSMmJ++cdKvY2aTIy04GXgt+E7ObxQpEt0iC1zzqNbHnP9mawuxBOExbMGALHq8r05fk2Ft1Mf/MC2FnU2EbL6WpLgH3wnA4wpxdQkvsynOIQ7BSsydAerkEyRCeTw7Ze73cMwmNP2BUNugo=
Content-ID: <40D8674F8521E648AA150BA74A4AC199@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c79102c-1bf7-43e4-99e8-08d70b60727b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:15:16.3552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2714
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Leonard Foerster <foersleo@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAyMDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAxNDowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNy4wNy4yMDE5IDEzOjI2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IFdlIGRvIG5vdCB3YW50IHRvIGJlIGdyb3ZlbGxpbmcgYXJv
dW5kIGluIHRoZSBvbGQgWGVuJ3MgZGF0YXN0cnVjdHVyZXMsDQo+Pj4gYmVjYXVzZSB0aGF0IGFk
ZHMgYSBiaW5hcnkgQT0+QiB0cmFuc2xhdGlvbiB3aGljaCBpcw0KPj4+IHBlci1vbGQtdmVyc2lv
bi1vZi14ZW4sIG1lYW5pbmcgdGhhdCB5b3UgbmVlZCBhIGN1c3RvbSBidWlsZCBvZiBlYWNoDQo+
Pj4gdGFyZ2V0IFhlbiB3aGljaCBkZXBlbmRzIG9uIHRoZSBjdXJyZW50bHktcnVubmluZyBYZW4s
IG9yIGhhdmUgdG8NCj4+PiBtYWludGFpbiBhIG1hdHJpeCBvZiBvbGQgdmVyc2lvbnMgd2hpY2gg
d2lsbCBiZSBkZXBlbmRlbnQgb24gdGhlIGxvY2FsDQo+Pj4gY2hhbmdlcywgYW5kIHRoZXJlZm9y
ZSBub3Qgc3VpdGFibGUgZm9yIHVwc3RyZWFtLg0KPj4gTm93IHRoZSBxdWVzdGlvbiBpcyB3aGF0
IGFsdGVybmF0aXZlIHlvdSB3b3VsZCBzdWdnZXN0LiBCeSB5b3UNCj4+IHNheWluZyAidGhlIHBp
bm5lZCBzdGF0ZSBsaXZlcyBpbiB0aGUgbWlncmF0aW9uIHN0cmVhbSIsIEkgYXNzdW1lDQo+PiB5
b3UgbWVhbiB0byBpbXBseSB0aGF0IERvbTAgc3RhdGUgc2hvdWxkIGJlIGhhbmRlZCBmcm9tIG9s
ZCB0bw0KPj4gbmV3IFhlbiB2aWEgc3VjaCBhIHN0cmVhbSAobWludXMgcmF3IGRhdGEgcGFnZSBj
b250ZW50cyk/DQo+IA0KPiBZZXMsIGFuZCB0aGlzIGluIGV4cGxpY2l0bHkgaWRlbnRpZmllZCBp
biB0aGUgYnVsbGV0IHBvaW50IHNheWluZyAiV2UgZG8NCj4gb25seSByZWx5IG9uIGRvbWFpbiBz
dGF0ZSBhbmQgbm8gaW50ZXJuYWwgeGVuIHN0YXRlIi4NCj4gDQo+IEluIHByYWN0aWNlLCBpdCBp
cyBnb2luZyB0byBiZSBmYXIgbW9yZSBlZmZpY2llbnQgdG8gaGF2ZSBYZW4NCj4gc2VyaWFsaXNl
L2Rlc2VyaWFsaXNlIHRoZSBkb21haW4gcmVnaXN0ZXIgc3RhdGUgZXRjLCB0aGFuIHRvIGJvdW5j
ZSBpdA0KPiB2aWEgaHlwZXJjYWxscy7CoCBCeSB0aGUgdGltZSB5b3UncmUgZG9pbmcgdGhhdCBp
biBYZW4sIGFkZGluZyBkb20wIGFzDQo+IHdlbGwgaXMgdHJpdmlhbC4NCg0KU28gSSBtdXN0IGJl
IG1pc3Npbmcgc29tZSBjb250ZXh0IGhlcmU6IEhvdyBjb3VsZCBoeXBlcmNhbGxzIGNvbWUgaW50
bw0KdGhlIHBpY3R1cmUgYXQgYWxsIHdoZW4gaXQgY29tZXMgdG8gIm1pZ3JhdGluZyIgRG9tMD8N
Cg0KPj4+IFRoZSBpbi1ndWVzdCBldnRjaG4gZGF0YSBzdHJ1Y3R1cmUgd2lsbCBhY2N1bXVsYXRl
IGV2ZW50cyBqdXN0IGxpa2UgYQ0KPj4+IHBvc3RlZCBpbnRlcnJ1cHQgZGVzY3JpcHRvci7CoCBS
ZWFsIGludGVycnVwdHMgd2lsbCBxdWV1ZSBpbiB0aGUgTEFQSUMNCj4+PiBkdXJpbmcgdGhlIHRy
YW5zaXRpb24gcGVyaW9kLg0KPj4gWWVzLCB0aGF0J2xsIHdvcmsgYXMgbG9uZyBhcyBpbnRlcnJ1
cHRzIHJlbWFpbiBhY3RpdmUgZnJvbSBYZW4ncyBQT1YuDQo+PiBCdXQgaWYgdGhlcmUncyBjb25j
ZXJuIGFib3V0IGEgYmxhY2tvdXQgcGVyaW9kIGZvciBIVk0vUFZILCB0aGVuDQo+PiBzdXJlbHkg
dGhlcmUgd291bGQgYWxzbyBiZSBzdWNoIGZvciBQVi4NCj4gDQo+IFRoZSBvbmx5IGZpeCBmb3Ig
dGhhdCBpcyB0byByZWR1Y2UgdGhlIGxlbmd0aCBvZiB0aGUgYmxhY2tvdXQgcGVyaW9kLg0KPiBX
ZSBjYW4ndCBtYWdpY2FsbHkgaW5qZWN0IGludGVycnVwdHMgaGFsZiB3YXkgdGhyb3VnaCB0aGUg
eGVuLXRvLXhlbg0KPiB0cmFuc2l0aW9uLCBiZWNhdXNlIHdlIGNhbid0IHJ1biB2Y3B1cyBhdCB0
aGF0IHBvaW50IGluIHRpbWUuDQoNCkhlbmNlIERhdmlkJ3MgcHJvcG9zYWwgdG8gInJlLWluamVj
dCIuIFdlJ2QgaGF2ZSB0byByZWNvcmQgdGhlbSBkdXJpbmcNCnRoZSBibGFja291dCBwZXJpb2Qs
IGFuZCBpbmplY3Qgb25jZSBEb20wIGlzIGFsbCBzZXQgdXAgYWdhaW4uDQoNCj4+Pj4gUmUtdXNp
bmcgbGFyZ2UgZGF0YSBzdHJ1Y3R1cmVzIChvciBhcnJheXMgdGhlcmVvZikgbWF5IGFsc28gdHVy
biBvdXQNCj4+Pj4gdXNlZnVsIGluIHRlcm1zIG9mIGxhdGVuY3kgdW50aWwgdGhlIG5ldyBYZW4g
YWN0dWFsbHkgYmVjb21lcyByZWFkeSB0bw0KPj4+PiByZXN1bWUuDQo+Pj4gV2hlbiBpdCBjb21l
cyB0byBvcHRpbWlzaW5nIHRoZSBsYXRlbmN5LCB0aGVyZSBpcyBhIGZhaXIgYW1vdW50IHdlIG1p
Z2h0DQo+Pj4gYmUgYWJsZSB0byBkbyBhaGVhZCBvZiB0aGUgY3JpdGljYWwgcmVnaW9uLCBidXQg
SSBzdGlsbCB0aGluayB0aGlzIHdvdWxkDQo+Pj4gYmUgYmV0dGVyIGRvbmUgaW4gdGVybXMgb2Yg
YSAiY2xlYW4gc3RhcnQiIGluIHRoZSBuZXcgWGVuIHRvIHJlZHVjZQ0KPj4+IGJpbmFyeSBkZXBl
bmRlbmNlcy4NCj4+IExhdGVuY3kgYWN0dWFsbHkgaXMgb25seSBvbmUgYXNwZWN0IChhbGJlaXQg
dGhlIGxhcmdlciB0aGUgaG9zdCwgdGhlIG1vcmUNCj4+IHJlbGV2YW50IGl0IGlzKS4gU3VmZmlj
aWVudCBtZW1vcnkgdG8gaGF2ZSBib3RoIG9sZCBhbmQgbmV3IGNvcGllcyBvZiB0aGUNCj4+IGRh
dGEgc3RydWN0dXJlcyBpbiBwbGFjZSwgcGx1cyB0aGUgbWlncmF0aW9uIHN0cmVhbSwgaXMgYW5v
dGhlci4gVGhpcw0KPj4gd291bGQgZXNwZWNpYWxseSBiZWNvbWUgcmVsZXZhbnQgd2hlbiBldmVu
IERvbVUtcyB3ZXJlIHRvIHJlbWFpbiBpbg0KPj4gbWVtb3J5LCByYXRoZXIgdGhhbiBnZXR0aW5n
IHNhdmVkL3Jlc3RvcmVkLg0KPiANCj4gQnV0IHdlJ3JlIHN0aWxsIHRhbGtpbmcgYWJvdXQgc29t
ZXRoaW5nIHdoaWNoIGlzIG9uIGEgbXVsdGktTUIgc2NhbGUsDQo+IHJhdGhlciB0aGFuIG11bHRp
LUdCIHNjYWxlLg0KDQpPbiBtdWx0aS1UQiBzeXN0ZW1zIGZyYW1lX3RhYmxlW10gaXMgYSBtdWx0
aS1HQiB0YWJsZS4gQW5kIHdpdGggYm9vdCB0aW1lcw0Kb2Z0ZW4gc2NhbGluZyAocm91Z2hseSkg
d2l0aCBzeXN0ZW0gc2l6ZSwgbGl2ZSB1cGRhdGluZyBpcyAoSSBndWVzcykgYWxsDQp0aGUgbW9y
ZSBpbnRlcmVzdGluZyBvbiBiaWdnZXIgc3lzdGVtcy4NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
