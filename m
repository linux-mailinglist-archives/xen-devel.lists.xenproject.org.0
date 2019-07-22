Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE66FE12
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 12:47:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpVoI-0004Y5-9w; Mon, 22 Jul 2019 10:44:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irM9=VT=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hpVoG-0004Y0-TY
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 10:44:48 +0000
X-Inumbo-ID: b677609e-ac6d-11e9-90bb-db3f1bb30410
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.99]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b677609e-ac6d-11e9-90bb-db3f1bb30410;
 Mon, 22 Jul 2019 10:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkiJWzlEUGnxditbdURdR9Uls2zp+XrotSmfOwfczmftCGlH6+kSonYSi+xj3W2khRXLHKmcMJArY4Ryyx+a1iiTx1HJj6RdewV6o8SJPyqFBtVfdFA+QQ/84ko5gPQCknbMXfAANA0k1ioMEdF8cUalPt19HoLVPEuktsYeOfNL82J4zFAqTq4eoiHHlBd6y/IctLUpvRbLJXJznrBoEOoy1sEykSNtdtxP9ky7FsTE2k5YEqscXo+erq7BX5gTUQVNr0fUtp7rVtIrpxjqOkT/MvKKI8OMtPDO+CiTB1kALkUIgTUcOr1HY0mggQggCa7L8BDGn1Jg9BSHKje4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf4LN5PCyEFE8gDBIgKXiPqy6l14fa1OnvlZKHOviO4=;
 b=JRWRjGfEC0ah8eY5c83sLM3vSqCKqkGhMGmYbWnYDrcpwCbPik9Zokmy6vIOA7MS/3cu3ERzhIJ1qNkW9B3a4vC8/bNlz7kJBnQQCwN9YixCEb75FicOLmOM3KoANnqyoCJ2EtEBUszdFlqXpqIYD44SP5SAJMtNj0MyiC8EN1KWz4ljI7831T4pSmJdd3dAlMHczLxNHkNaSBojKZmiK9GSVB0aKiyCgMt6bMjhfL2ySTlDv4df+OGGi/+NYxNWrxOwY5GW/0i/WsavKATqGujxtrai6JjjqCe9/+OJdfvgyBlL+X0G2MS4TBdWeXpJrQUKHW4ZVlEzDb83IZbaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf4LN5PCyEFE8gDBIgKXiPqy6l14fa1OnvlZKHOviO4=;
 b=U3HD3SxpkQ2oDCjj3EHmSiEhiKSSs0ZVM206QYiVqdzSIbTLSWJNQEE8jep1pgpc4WImsbXmOeW4eHPiAWGk1pLYkYant1hVf+pMxMNJz055pwdowvmMGrNtAKMNPQPv52Sr1neoltLjbQ6GfqFlt9x4Frw/dehUAdsbG+4D7Ok=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4296.eurprd02.prod.outlook.com (20.177.114.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 10:44:40 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::b027:3d70:bb38:7b6c]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::b027:3d70:bb38:7b6c%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 10:44:40 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KAgAEtDgCAAAdBAIAAAR2AgAAxiYCAAA10AIAABbYAgAABeACAAAYkAIAATloAgAQUwgCAAC4ugA==
Date: Mon, 22 Jul 2019 10:44:40 +0000
Message-ID: <2ccb6a2c214e9fca79283333c313b3c3b1fc5910.camel@bitdefender.com>
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
 <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
 <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
 <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
 <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
 <96e2ece1-5460-52d5-d2a5-8123d8148441@suse.com>
 <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
 <954f247d-fff0-3a73-42e8-b8b64e126bc3@suse.com>
In-Reply-To: <954f247d-fff0-3a73-42e8-b8b64e126bc3@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd84f8f2-a817-47d5-a08f-08d70e919971
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4296; 
x-ms-traffictypediagnostic: AM6PR02MB4296:|AM6PR02MB4296:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR02MB429611CAAECC9BBDBF9656B1D6C40@AM6PR02MB4296.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(13464003)(66066001)(110136005)(316002)(99286004)(256004)(14454004)(7416002)(53546011)(52116002)(386003)(102836004)(6506007)(4326008)(966005)(66946007)(5660300002)(76176011)(6246003)(68736007)(229853002)(86362001)(66446008)(64756008)(66556008)(66476007)(54906003)(6116002)(3846002)(6512007)(50226002)(2616005)(118296001)(446003)(11346002)(36756003)(6306002)(53936002)(476003)(8676002)(81156014)(2906002)(26005)(186003)(7736002)(6486002)(8936002)(71200400001)(71190400001)(478600001)(6436002)(25786009)(81166006)(486006)(305945005)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4296;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bDyVyXKzhRod6Ij0XxZrC1Dl/ndL5ZoihNLgiPzlsqn+0FsAhdqypNa8byJ45fDpIaqemxPz2WN0F52vI9nFHAZYpHLB3vHS4tCK8XKrKu3XhIv3DPaep1biulDyWfzjGhKlJv8v/ZHMY2W19ZLV0vU3dWtmuAwU3h0EwdTVJ/q0grQR/CJNQCitunNhZLO87Tmh4nlbCNlGYHB+l1MH0wMPy2yC3pUswyfb6x+jkbhoeZs0mc3I71cOSku3iT9lHKEeo8j1qI82raU0X/StR9TZoaSJD16GeUQtl4p71+KDm0/E9NA/gA+o96BHonup8HISrOurNuWrEwZ53LwR62rCJHH2iHomNY9AQBa2zCp0gVoeDDx++WrY23cOkDvlwWERm2lFaRbLSF+TTH5uIb9FTQrtbrC3GssioIS13mY=
Content-ID: <B56088F93D7EB647B4DBAB37164AD716@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd84f8f2-a817-47d5-a08f-08d70e919971
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 10:44:40.6110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4296
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDA3OjU5ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTkuMDcuMjAxOSAxOTo0MCwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gPiBP
biBGcmksIDIwMTktMDctMTkgYXQgMTI6NTkgKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
ID4gT24gMTkuMDcuMjAxOSAxNDozNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gPiA+IEZy
b206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPiA+ID4gPiBTZW50OiAxOSBK
dWx5IDIwMTkgMTM6MzINCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiAxOS4wNy4yMDE5IDE0OjEx
LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiA+ID4gPiA+IEZyb206IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJj
YWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KPiA+ID4gPiA+ID4gPiBTZW50OiAxOSBKdWx5IDIwMTkg
MTI6MjQNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNvcnJ5LCBteSBtaXN0YWtlLiBJ
IG1lYW50IHRvIHNheSBpdCdzIHNoYXJlZCB3aXRoIE1ELg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gTWFueSB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydCwNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gT2ssIGluIHRoYXQgY2FzZSBwbGVhc2Ugc2hhcmUgd2l0aCB0aGUgSUQgaW5zdGVh
ZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBCdXQgdGhhdCdzIGV4YWN0bHkgd2hhdCB3ZSB3YW50
IHRvIGF2b2lkOiBJZiBzaGFyaW5nIGF0IGFsbCwNCj4gPiA+ID4gPiB0aGVuDQo+ID4gPiA+ID4g
cGxlYXNlIHdpdGggdGhlIG1vcmUgcHJpdmlsZWdlZCBlbnRpdHkuDQo+ID4gPiA+IA0KPiA+ID4g
PiBXaHk/IFdlJ3JlIHRhbGtpbmcgSFZNIGd1ZXN0cyBvbmx5IGhlcmUgSUlVQyBzbyB0aGlzIGlz
DQo+ID4gPiA+IGVxdWl2YWxlbnQNCj4gPiA+ID4gdG8gSU9SRVEgc2VydmVyLi4uDQo+ID4gPiAN
Cj4gPiA+IE5vdCBzdXJlOiBUaGUgbWFpbiB2bV9ldmVudC5jIGZpbGVzIGxpdmUgaW4gY29tbW9u
LyBhbmQgYXJjaC94ODYvDQo+ID4gPiByZXNwZWN0aXZlbHksIHNvIEkgdGhvdWdodCBhdCBsZWFz
dCBhcmNoaXRlY3R1cmFsbHkgVk0gZXZlbnRzDQo+ID4gPiB3ZXJlDQo+ID4gPiBwb3NzaWJsZSBm
b3IgUFYgYXMgd2VsbC4gSWYgaXQncyBpbmRlZWQgSFZNLW9ubHksIHRoZW4gZm9sbG93aW5nDQo+
ID4gPiB0aGUgSU9SRVEgc2VydmVyIG1vZGVsIGluIGl0cyBlbnRpcmV0eSB3b3VsZCBvZiBjb3Vy
c2UgYmUgZmluZS4NCj4gPiANCj4gPiBJbiBvbmUgb2YgdGhlIHByZXZpb3VzIHZlcnNpb24gb2Yg
dGhlIHBhdGNoc2V0IHRoZXJlIHdhcyBhDQo+ID4gc3VnZ2VzdGlvbg0KPiA+IHRvIGltcGxlbWVu
dCB0aGUgbmV3IHZtX2V2ZW50IHRyYW5zcG9ydCB1c2luZyBJT1JFUSwgYnV0IGl0IHdhcw0KPiA+
IGRyb3BwZWQNCj4gPiAuDQo+ID4gDQo+ID4gDQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDQvbXNnMDAxNzMuaHRtbA0KPiANCj4gQW5k
IHZhbGlkbHkgc28gKGltbyksIG5vdCB0aGUgbGVhc3QgYmVjYXVzZSBvZiBhbHNvIGJlaW5nIEhW
TQ0KPiBzcGVjaWZpYy4NCj4gDQo+ID4gQWxzbywgdW5sZXNzIHRoZXJlIGlzbid0IGEgcHJvcGVy
IHdheSBhbGxvY2F0ZSB0aGUgbmVjZXNzYXJ5IHBhZ2VzLA0KPiA+IEkNCj4gPiB3b3VsZG4ndCBp
bnRyb2R1Y2UgYSBIVk0tb25seSBsaW1pdGF0aW9uIGJlY2F1c2UsIG90aGVyIHRoYW4gdGhlDQo+
ID4gSFZNDQo+ID4gcGFyYW0gdXNlZCB0byBrZWVwIHRyYWNrIG9mIHRoZSByaW5nIHBmbiwgdGhl
IHZtX2V2ZW50IG1lY2hhbmlzbSBpcw0KPiA+IHF1aXRlIGdlbmVyaWMuDQo+IA0KPiBCeSAid291
bGRuJ3QgaW50cm9kdWNlIiBkbyB5b3UgbWVhbiAid291bGRuJ3Qgd2FudCB0byBpbnRyb2R1Y2Ui
IG9yDQo+IGRvDQo+IHlvdSBtZWFuIHRvIHNheSB5b3UgaW4gZmFjdCB3b3VsZG4ndCBhbmQgSSdt
IG5vdCBzZWVpbmcgd2h5IHRoYXQgaXM/DQo+IA0KPiBKYW4NCg0KV2VsbCwgSSB0aGluayAiSSB3
b3VsZCBwcmVmZXIgbm90IHRvIiB3b3VsZCBoYXZlIGJlZW4gYmV0dGVyLiBUaGUgbWFpbg0KaWRl
ZWEgaXMgdGhhdCBJIHdvdWxkbid0IHdhbnQgdG8gYWRkIGEgbGltaXRhdGlvbiB0byB0aGUgYXBw
bGljYWJpbGl0eQ0Kb2YgdGhpcyBmZWF0dXJlIHVubGVzcyBpdCdzIHRoZSBvbmx5IHBvc3NpYmxl
IHNvbHV0aW9uLg0KDQpNYW55IHRoYW5rcyBmb3IgeW91ciBzdXBwb3J0LA0KUGV0cmUNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
