Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C476F6E505
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 13:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQzR-00087o-Rr; Fri, 19 Jul 2019 11:23:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0GG/=VQ=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hoQzQ-00087j-F8
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 11:23:52 +0000
X-Inumbo-ID: ae697569-aa17-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.123]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae697569-aa17-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 11:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc2s54ufxQKRCLz5Rc30bO2cyeVOeWQffhc8qV4nBCFUI9RaHqlt7yOiDze/c7vaXAvyYEatm8puHHvHpKw5quDCS6KQQA6YHVPQhUEA6ku2sOvGH4Sbh9CIEVvhHMkZJ/eLE3ZRlG48KJaXfRB1J4MvS7bDAqyXEab2CNlUBAKTZpTWTOSyQ7OJB1FwWJdMo1UIJHmnJcL/NfzcpO1YuC9TYBuVyvy+OxmPBpp+vqX4EEeBzSDnpqiItvBqn2kgyQ8NXGeHb2xX/pFzCTfYR1VxKXEMaePu9Lpr6tMwfQVk1zvXifSMAy7Abi801TLh/BH5ZmkwfmBXe/LchdUWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+3ytj+3yNUcRgAPDaQEKmAh6MKV4RX+nSrTbxLI/Ac=;
 b=gqCz6t9d8YpshdApkEoC/BmXeDFZMCgk9EhEuDSqUi24aX5BLwzyxc7UVXfVUO+7vtVuFBUoya7+PbiassCmhwlmCTCwJbap5T7BGpRlgh8FdWSS6giRL9OQi2yPzd+G2JcayetYWjUVDn7EtzhRmnFGHcRPGlca8uzOov86g9GsXqL6YCYSfOj5jMAJ9tEtPILTIZ5jW4pW4iKTFaoHoXkQAzHeHFgzmNFmb9QKL55APh0Ys7yNYKgBXn33LJMiJpfc1gmswVEAFP/XA8ievdcPMMqXzlfLrUaxC0dCTyE6L0UvVTCko3tTzGnhqRlsrUo+B6pegIzq0+iWDMUQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+3ytj+3yNUcRgAPDaQEKmAh6MKV4RX+nSrTbxLI/Ac=;
 b=RwS19gDJsBVLX/8e3P2figaHQI9h7fYXy4tjVBJte3JeZ+8ezQvty0w+8gQOOxfiNFszLQkXU6AscWHwplnQDm/fgdQ/NT//8CsKALLVeQ9RF7z+LBPu5W0oD/y5iXexAU+NlfgwUpqRDCihIIDtklMqapEhGgWz0h7ALjOFX70=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB5014.eurprd02.prod.outlook.com (20.178.88.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 11:23:48 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 11:23:48 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KAgAEtDgCAAAdBAIAAAR2AgAAxiYA=
Date: Fri, 19 Jul 2019 11:23:47 +0000
Message-ID: <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
 <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
In-Reply-To: <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::32) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e788e580-925b-42be-b88a-08d70c3b916b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB5014; 
x-ms-traffictypediagnostic: AM6PR02MB5014:|AM6PR02MB5014:
x-microsoft-antispam-prvs: <AM6PR02MB501410BED2FC4F43EA695B30D6CB0@AM6PR02MB5014.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(366004)(136003)(396003)(13464003)(199004)(189003)(26005)(52116002)(229853002)(54906003)(6486002)(186003)(76176011)(110136005)(102836004)(8936002)(81156014)(6506007)(6436002)(50226002)(86362001)(446003)(14454004)(3846002)(53546011)(6116002)(478600001)(386003)(316002)(2906002)(81166006)(8676002)(11346002)(2616005)(476003)(4326008)(25786009)(256004)(486006)(68736007)(305945005)(99286004)(66946007)(66476007)(6246003)(66066001)(7736002)(7416002)(5660300002)(66446008)(64756008)(66556008)(71200400001)(71190400001)(36756003)(6512007)(53936002)(118296001)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5014;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MEd8gxLuwQsEmS3sjJxTSmttkNXr/fyx58NRsrR2tGJdDjA3Ir6Cc6T3/Ta5oMNSJmIUXKJL1/GPrG3piGe2nRgRt4M4USgRIqM1XL4CZc/rJDLaTKyRZQVP2hh9lut7CwoP3CzZLsg5q2XD32fbt+DUu+71pCg9dRVcyvU1+s8UfIv9khW38BDAfmvh6MGvm1H+LZKWAh20xvFjDBV5XNCRvpNO986lJVS85b11koig5Cqyagibf56DKCLFAw0xe1toPdQfROgvS4XZMPYuwBa4CXrn7C+9Mfw5DOPAB+t7fcvL4zMl5xffVdJLnbLaRV2wZkQGboSJQJ031+ww2r89npbHxeBtJrTxpCFIkO/untye/9WtfUYPzZNljKtjyLKcwjRWWX5iTYtr8msf45y/RnWydkUwY0kI5L8kw/0=
Content-ID: <4FADA5F67E39C34DBB80D5CCD1F1E472@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e788e580-925b-42be-b88a-08d70c3b916b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 11:23:47.9993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5014
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA3LTE5IGF0IDA4OjI2ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+DQo+ID4gU2VudDogMTkgSnVseSAyMDE5IDA5OjIyDQo+ID4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4gQ2M6ICdQZXRyZSBPdmlk
aXUgUElSQ0FMQUJVJyA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Ow0KPiA+IEp1bGllbkdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47DQo+ID4gQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPjsgUmF6dmFuIENvam9jYXJ1DQo+ID4gPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+OyBBbmRyZXcNCj4gPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDwNCj4gPiBHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBJYW4gSmFja3Nvbg0KPiA+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+ID4gU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
DQo+ID4gS29ucmFkUnplc3p1dGVrIFdpbGsNCj4gPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47DQo+ID4gVGltIChYZW4ub3Jn
KSA8dGltQHhlbi5vcmc+OyBXZWkgTGl1DQo+ID4gPHdsQHhlbi5vcmc+DQo+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwNy8xMF0gdm1fZXZlbnQ6IEFkZCB2bV9ldmVudF9uZyBpbnRlcmZhY2UN
Cj4gPiANCj4gPiBPbiAxOS4wNy4yMDE5IDA5OjU2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4g
PiA+IEZyb206IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIu
Y29tPg0KPiA+ID4gPiBTZW50OiAxOCBKdWx5IDIwMTkgMTQ6NTkNCj4gPiA+ID4gDQo+ID4gPiA+
IFNvLCBhdCB0aGlzIHBvaW50IHRoZSBtb3N0IHByb21pc2luZyBzb2x1dGlvbiBpcyBhbGxvY2F0
aW5nIHRoZQ0KPiA+ID4gPiBtZW1vcnkNCj4gPiA+ID4gaW4gWEVOLCBzaGFyaW5nIGl0IHdpdGgg
SUQgdXNpbmcgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCwgYW5kDQo+ID4gPiA+IG1hcHBpbmcN
Cj4gPiA+ID4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUg
ZmxhZw0KPiA+ID4gPiBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIHNldCkNCj4gPiA+IA0K
PiA+ID4gSWYgdGhhdCBwYWdlIGlzIHNoYXJlZCB3aXRoIHRoZSBJRCB0aGVuDQo+ID4gPiBYRU5N
RU1fcnNyY19hY3FfY2FsbGVyX293bmVkDQo+ID4gPiBzaG91bGQgKm5vdCogYmUgc2V0LiBBbHNv
LCB0aGF0IGZsYWcgaXMgYW4gJ291dCcgZmxhZy4uLiB0aGUNCj4gPiA+IGNhbGxlcg0KPiA+ID4g
ZG9lc24ndCBkZWNpZGUgd2hvIG93bnMgdGhlIHJlc291cmNlLg0KPiA+IA0KPiA+IEkgaGFkIGlt
cGxpZWQgdGhhdCBpdCdzIHJlYWxseSBNRCB0aGF0J3MgbWVhbnQgaGVyZSwgYnV0IG1heWJlIEkN
Cj4gPiB3YXMNCj4gPiB3cm9uZyBkb2luZyBzby4NCj4gPiANCj4gPiA+IFRCSCBJIHJlZ3JldCBl
dmVyIGludHJvZHVjaW5nIHRoZSBmbGFnOyBpdCBjYXVzZWQgYSBsb3Qgb2YNCj4gPiA+IHByb2Js
ZW1zLA0KPiA+ID4gd2hpY2ggaXMgd2h5IGl0IGlzIG5vIGxvbmdlciB1c2VkLg0KPiA+IA0KPiA+
IEl0J3MgYSB0b29scyBvbmx5IGludGVyZmFjZSAtIHdoeSBkb24ndCB3ZSBkcm9wIHRoZSBmbGFn
IGlmIHlvdSBub3cNCj4gPiB0aGluayBpdCB3YXMgYSBiYWQgaWRlYSB0byBpbnRyb2R1Y2UgaXQ/
DQo+IA0KPiBJIHdhcyBpbmRlZWQgdGhpbmtpbmcgSSBzaG91bGQgZmluZCBlbm91Z2ggdHVpdHMg
dG8gZG8gdGhhdCBpbiB0aGUNCj4gbmVhciBmdXR1cmUuDQo+IA0KPiAgIFBhdWwNCj4gDQo+ID4g
DQo+ID4gSmFuDQpTb3JyeSwgbXkgbWlzdGFrZS4gSSBtZWFudCB0byBzYXkgaXQncyBzaGFyZWQg
d2l0aCBNRC4gDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBvcnQsDQpQZXRyZQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
