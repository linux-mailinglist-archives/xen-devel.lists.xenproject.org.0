Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AF6BC2D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 14:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hniol-0000cK-Cx; Wed, 17 Jul 2019 12:13:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnioj-0000cF-L0
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 12:13:53 +0000
X-Inumbo-ID: 5670762a-a88c-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.128]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5670762a-a88c-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 12:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bn3G2BXmihIRDpZpO1TL4GrCkpBGllUjxGbXdKBJwMC+OuyX4574jwI0y73ZMnmmGulh3uu61A6Io76TNhRlnzyXNe7G3wW9AL8wK6/Lpn4KHmrBj7oPL9u8hKNH1xtwsjpLkRF10aSNQazdHWsYFzJmsTJxPlo7UwOGZLpygkkorj3S2oWfIyTTXz1lJIEnKN2s2JMBxwGofPA5x/WnDYI+KhX9jwdVmqV1c9uLokhWEAxBX3LxoKUWnAiDnAIsQ/Xjtn9XmJaGsunaDqpn4Lg0q1iOBvfJxwrp8PMlgNjtEhMghOrffCabbcvHc46bl/q+0bvAjoJkHo8QnmcY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTP71D6H9c74H46M7bhClQD4nHkPGjE2Sxj/q8M+bxc=;
 b=Le4/Fez5jtcV9aNPcGO6dF4GGiLpGpEBTsBWMkx7CWaiDKAhTU7AJMcnlqdIZia6QiRe8FiUT6LyaQITaLjzfAMBZxzAvD5HHrunmDzmbWUR90Awv5pZaRB0g588jTiZz5MGdXbinxAytsddF4/atGV3/AcWLM2I7T515pv0HQQ8ed1CEoe50t/xaogY3GDaGaTiCeqyOvTIYSqC7lSvIWe8Hg+y3XNVKwBVeU11N1LzxZMhH5H/oFUXsAeVBEuM7BseSSZtw9DEx2VYY+d1a6D8JDpLFFpw/t4t1JGM2alKsHs/h9184KJcC+bNaT49t+vpoCR7DTRv/9dceCmYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTP71D6H9c74H46M7bhClQD4nHkPGjE2Sxj/q8M+bxc=;
 b=Ki9+wcvj/encdgnUPJr2AVfNyr5y/BlDksXOycdjHlINWyXh6Q/iNui/bJxTMNokJAJcu1jyFwxaWDrGWusIgjXOhzDS0ee2bZ8keZx5IXhJwC2182vNazjBZ+4Y3gZRpajwKaPN4DoV2xKzoryeQWPILeLMfCIP3xTy0NXSFNw=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB5078.eurprd02.prod.outlook.com (20.178.88.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 12:13:49 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 12:13:49 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabNvraAgAD7ggA=
Date: Wed, 17 Jul 2019 12:13:49 +0000
Message-ID: <52c8711c7bb1d4996012a611fdcb48cb4b9c3e5b.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <CABfawhmwc1Be6Fdt_stEhn+ydZwiE1d-wX8d7WG+vXS2+C2d8g@mail.gmail.com>
In-Reply-To: <CABfawhmwc1Be6Fdt_stEhn+ydZwiE1d-wX8d7WG+vXS2+C2d8g@mail.gmail.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::27) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7cfbe71-b5e7-4844-51b0-08d70ab0398b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB5078; 
x-ms-traffictypediagnostic: AM6PR02MB5078:|AM6PR02MB5078:
x-microsoft-antispam-prvs: <AM6PR02MB5078D3F4A1F286B419C99C31D6C90@AM6PR02MB5078.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(136003)(376002)(189003)(199004)(66066001)(6436002)(229853002)(7416002)(26005)(4326008)(99286004)(186003)(107886003)(118296001)(6512007)(53936002)(6246003)(256004)(6506007)(81166006)(478600001)(81156014)(25786009)(3846002)(6116002)(2616005)(8936002)(6916009)(476003)(446003)(11346002)(6486002)(50226002)(7736002)(86362001)(68736007)(305945005)(316002)(8676002)(71190400001)(54906003)(71200400001)(2906002)(36756003)(5660300002)(52116002)(102836004)(76176011)(386003)(66476007)(66556008)(66446008)(53546011)(14444005)(64756008)(486006)(66946007)(14454004)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5078;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nRwMOr0qm4cJ5S77Q/T31plGTRYXZmxJVdRVHlHAcnklPRDlYB/6RUKkTxEiXDt3YC1ZvhnCvQHbOGxWN98ay3rUcNpENM6O6pP2OONbkh9GGfwQmsqh90SSU1xFxtWMAxxMDqEPML2OcViqfCHBohfafPDmvVfn+2XSJVJAddTfd7fqetuGsg+j2sfMZMnKgbrq+pqxNNVirgH+l+F2Q7mMykV1Kj5kW5q0Ab7yiP/DtJYt+mV/g5/CYFme7LpaB8qzQyqJfvD+YlTTbUUe9HCGyy2RWNzTOjHPDKCAv0/wwEjLyIsQCUXHctp8qVLCI2Zpp8CRBbY9Oxh1w5VHZ2DzE7T1aigPm+ZXYspvDd/9dRHSFn1lABKMdT8aTvUtp4AXtre8KmUbJym3etMx10IJGDkWgKrupLsZSFLHF+c=
Content-ID: <5500CFDC1E2AF441832609F7B87D88F1@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cfbe71-b5e7-4844-51b0-08d70ab0398b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 12:13:49.4686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5078
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDE1OjEzIC0wNjAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDExOjA2IEFNIFBldHJlIFBpcmNhbGFidQ0KPiA8
cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEluIGhpZ2ggdGhy
b3VnaHB1dCBpbnRyb3NwZWN0aW9uIHNjZW5hcmlvcyB3aGVyZSBsb3RzIG9mIG1vbml0b3INCj4g
PiB2bV9ldmVudHMgYXJlIGdlbmVyYXRlZCwgdGhlIHJpbmcgYnVmZmVyIGNhbiBmaWxsIHVwIGJl
Zm9yZSB0aGUNCj4gPiBtb25pdG9yDQo+ID4gYXBwbGljYXRpb24gZ2V0cyBhIGNoYW5jZSB0byBo
YW5kbGUgYWxsIHRoZSByZXF1ZXN0cyB0aHVzIGJsb2NraW5nDQo+ID4gb3RoZXIgdmNwdXMgd2hp
Y2ggd2lsbCBoYXZlIHRvIHdhaXQgZm9yIGEgc2xvdCB0byBiZWNvbWUgYXZhaWxhYmxlLg0KPiA+
IA0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBhIGRpZmZlcmVudCBtZWNoYW5pc20g
dG8gaGFuZGxlDQo+ID4gc3luY2hyb25vdXMNCj4gPiB2bV9ldmVudCByZXF1ZXN0cyAvIHJlc3Bv
bnNlcy4gQXMgZWFjaCBzeW5jaHJvbm91cyByZXF1ZXN0IHBhdXNlcw0KPiA+IHRoZQ0KPiA+IHZj
cHUgdW50aWwgdGhlIGNvcnJlc3BvbmRpbmcgcmVzcG9uc2UgaXMgaGFuZGxlZCwgaXQgY2FuIGJl
IHN0b3JlZA0KPiA+IGluDQo+ID4gYSBzbG90dGVkIG1lbW9yeSBidWZmZXIgKG9uZSBwZXIgdmNw
dSkgc2hhcmVkIGJldHdlZW4gdGhlDQo+ID4gaHlwZXJ2aXNvciBhbmQNCj4gPiB0aGUgY29udHJv
bGxpbmcgZG9tYWluLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8
cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+DQo+IA0KPiBTbyB0aGlzIGlzIHF1aXRlIGEgbGFy
Z2UgcGF0Y2gsIHBlcmhhcHMgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNwbGl0DQo+IGl0DQo+IGlu
dG8gYSBoeXBlcnZpc29yLXNpZGUgcGF0Y2ggYW5kIHRoZW4gYSB0b29sc3RhY2stc2lkZSBvbmUu
IEFsc28sDQo+IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8ga2VlcCB0aGUgdHdvIGltcGxlbWVudGF0
aW9ucyBpbiBzZXBhcmF0ZSBmaWxlcw0KPiB3aXRoaW4gWGVuIChpZS4gY29tbW9uL3ZtX2V2ZW50
LmMgYW5kIHZtX2V2ZW50X25nLmMpPw0KPiANCj4gVGFtYXMNCkkgdGhvdWdodCBhYm91dCBoYXZp
bmcgMiBzZXBhcmF0ZSBwYXRjaGVzLCBvbmUgZm9yIGh5cGVydmlzb3IgYW5kIG9uZQ0KZm9yIGxp
YnhjLCBidXQgbXkgbWFpbiBjb25jZXJuIHdhcyBub3QgdG8gYnJlYWsgImdpdCBiaXNlY3QiKEkn
bSBub3QNCnN1cmUgaWYgdGhlcmUgYXJlIGFueSB0ZXN0cyAob3RoZXIgdGhhbiB0aGUgYnVpbGQp
IHdoaWNoIG5lZWQgdG8gcGFzcykuDQpUaGUgImZsYWdzIiBmaWVsZCB3YXMgYWRkZWQgdG8gdm1f
ZXZlbnRfb3AsIGFuZCwgaWYgaXQncyBub3QgbWFudWFsbHkNCnNldCBieSB0aGUgY2FsbGVyLCBh
biBpbnZhbGlkIHZhbHVlIG1pZ2h0IGJlIHBhc3NlZCB0byBYRU4gKGUuZy4NCnhjX3ZtX2V2ZW50
X2NvbnRyb2wpLg0KDQpJbml0aWFsbHkgdGhlIG5ldyBpbnRlcmZhY2Ugd2FzIGNvbnRhaW5lZCBp
biBhIHNlcGFyYXRlIGZpbGUgKGhhcyBpdCdzDQpvd24gZG9tY3RsKSBidXQgSSd2ZSBjb3BpZWQg
aXQgdG8gdm1fZXZlbnQgYmVjYXVzZSBJIHdhbnRlZCB0byBoYXZlIGFsbA0Kbm9uLWludGVyZmFj
ZSBmdW5jdGlvbnMgc3RhdGljLiAoZS5nLiB0aGUgImVuYWJsZSIgZnVuY3Rpb25zIGZvciBib3Ro
DQp0cmFuc3BvcnRzIGFuZCB2bV9ldmVudF9oYW5kbGVfcmVzcG9uc2UpLiBIb3dldmVyLCBJIHdp
bGwgbG9vayBpbnRvDQp0aGlzIGFnYWluLCBhbmQsIGlmIEkgY2FuIGZpbmQgYSBjbGVhbiB3YXkg
dG8gbWluaW1pemUgdGhlDQpkZXBlbmRlbmNpZXMsIEkgd2lsbCBzcGxpdCBpdCBhZ2Fpbi4NCg0K
TWFueSB0aGFua3MsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
