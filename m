Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DB6EA50
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:42:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWrY-00013z-NU; Fri, 19 Jul 2019 17:40:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0GG/=VQ=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hoWrW-00010d-P6
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:40:06 +0000
X-Inumbo-ID: 3e0065b3-aa4c-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.91]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e0065b3-aa4c-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 17:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDoLpEOW0cRvoImKglEoiRU78Nb7KCIag/8swbYy1GDQ1dJD8zI9DxDppyDZN3kePyz9G9ItjRysh7wm1qrFs8p68eeHiPcfFiyn3VyhYdu7B/EL0hPP3XNltmnUmv5iN5BGkK3h1mfoB4UglbfYvTBLhhlqXSs1wKTs0pSPkGynYqKHUUz64y9MBQO0sjX2vE6tR07M/6Q9r1Y5B3F8QRSUvkjRIwxk6W/FEdKk8U6JhiDyPzipnJoHWeQLIlxGnbuaAK3QeBYRNPchZ+5Vnh9Btcv+mSTktwrcFiNK61r5giXDI9fXlvPY2mD21m0Wt45SvmVM9HbGPQFCV3+6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anb5crB2T3TsrnoF2u6Hjovbd0yjFj79l8Pey8hOQIs=;
 b=ABFVJYZUTy6CWDAZorLuQp9kvVQ/qRASus7MkWhQ0xm0llo2zaKhujueFfcZ5RH8oEkjk+m0EsdErGCxVjOKELmGEW6mdF+WdM2G6fZ2Upth8xBt1tcP2czEO8XPIhUdJs+iG6euj5bGISwz55taV7EfwYrFEEk20gC2TLDBOa7bfue0MHVZ3vm4sgqk81IlHOZYi8v1egQBkUoP0M37eL1od9jbI6LmbY+8cbtW7a5fNTIg9anXCewUe+pUAHHuL5SKnIqSenHnb2chEzzY9kiKTpC35NtQHPk31dhke81Y0WKT4dOOoATTex0Mr3zdjtJ4d5x1KYX0k6NSH5qr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anb5crB2T3TsrnoF2u6Hjovbd0yjFj79l8Pey8hOQIs=;
 b=do9S1yY7BEqsYmhHXC/xx9wVM8+ZKy43JZBmMv+od8Qd3EdEcMbnPOL76DUM3q/HBsXQKFneK/IDAhIWvmtmBvOqq+XWbaoSZ9SGqGtjyzXLK5OthKJXe2IqHwEwUNhbuJnMc/nCRSBoL1fbyoI7m3fAv8IezFjiCGEc1kDXlAQ=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4648.eurprd02.prod.outlook.com (20.177.196.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 17:40:03 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 17:40:02 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KAgAEtDgCAAAdBAIAAAR2AgAAxiYCAAA10AIAABbYAgAABeACAAAYkAIAATloA
Date: Fri, 19 Jul 2019 17:40:02 +0000
Message-ID: <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
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
In-Reply-To: <96e2ece1-5460-52d5-d2a5-8123d8148441@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::20) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f362aa1c-8ddc-46ca-10d6-08d70c7020e1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4648; 
x-ms-traffictypediagnostic: AM6PR02MB4648:|AM6PR02MB4648:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR02MB4648FCE409F3C34B1D4A276AD6CB0@AM6PR02MB4648.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(136003)(376002)(366004)(13464003)(189003)(199004)(446003)(7736002)(118296001)(50226002)(66476007)(11346002)(6246003)(6512007)(6306002)(36756003)(86362001)(7416002)(66556008)(6436002)(305945005)(476003)(2616005)(66946007)(64756008)(66446008)(2906002)(5660300002)(66066001)(14454004)(8676002)(186003)(102836004)(53546011)(6506007)(386003)(52116002)(26005)(486006)(478600001)(71200400001)(229853002)(25786009)(316002)(76176011)(99286004)(54906003)(110136005)(8936002)(81166006)(81156014)(6116002)(3846002)(68736007)(53936002)(966005)(71190400001)(4326008)(256004)(6486002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4648;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9nRGsW7sGePoDkHo3M0guxfSqhahYy33IMFfE8jy9OBJsyT9S+k0pai0Nx1pSHHr9iOthDdP554/oenF1Zkg6nMJHvDO2mWmIBLKobqAWUIFuJxzfcKJak6Gn+gXBJBfm+upcDx65idWUWQRUdJc0FN3Wu6Vv8RrIxa18m3Es4VkG1D5i0F1trQ486oTnaLJpFFKCz9ailwppFizpEkbJsJP5dGOnrEDnOGYckV8MmMkrUfsjMPnOMNXinhT3Gu7NdF2VdbkzdFhRpNankLsGP/EgP5SJ10osI3SyXSQooM14nnfb9TB5mKrX1JRhOII23tm3n6NGWTs8GqmMQuJsGjFOv6lDoa9LG39yv5MQ9EWra0BCiqUqE8PPA+sKnCv5yxzXRhglAB5H0zKuDOUJ0y1VgC3RWLdRSzJYcEh4JQ=
Content-ID: <580DE8876CC528499813C1A00427A573@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f362aa1c-8ddc-46ca-10d6-08d70c7020e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:40:02.8423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4648
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

T24gRnJpLCAyMDE5LTA3LTE5IGF0IDEyOjU5ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTkuMDcuMjAxOSAxNDozNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gRnJvbTogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+ID4gU2VudDogMTkgSnVseSAyMDE5IDEz
OjMyDQo+ID4gPiANCj4gPiA+IE9uIDE5LjA3LjIwMTkgMTQ6MTEsIFBhdWwgRHVycmFudCB3cm90
ZToNCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206
IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KPiA+
ID4gPiA+IFNlbnQ6IDE5IEp1bHkgMjAxOSAxMjoyNA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNv
cnJ5LCBteSBtaXN0YWtlLiBJIG1lYW50IHRvIHNheSBpdCdzIHNoYXJlZCB3aXRoIE1ELg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IE1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBvcnQsDQo+ID4gPiA+
IA0KPiA+ID4gPiBPaywgaW4gdGhhdCBjYXNlIHBsZWFzZSBzaGFyZSB3aXRoIHRoZSBJRCBpbnN0
ZWFkLg0KPiA+ID4gDQo+ID4gPiBCdXQgdGhhdCdzIGV4YWN0bHkgd2hhdCB3ZSB3YW50IHRvIGF2
b2lkOiBJZiBzaGFyaW5nIGF0IGFsbCwgdGhlbg0KPiA+ID4gcGxlYXNlIHdpdGggdGhlIG1vcmUg
cHJpdmlsZWdlZCBlbnRpdHkuDQo+ID4gDQo+ID4gV2h5PyBXZSdyZSB0YWxraW5nIEhWTSBndWVz
dHMgb25seSBoZXJlIElJVUMgc28gdGhpcyBpcyBlcXVpdmFsZW50DQo+ID4gdG8gSU9SRVEgc2Vy
dmVyLi4uDQo+IA0KPiBOb3Qgc3VyZTogVGhlIG1haW4gdm1fZXZlbnQuYyBmaWxlcyBsaXZlIGlu
IGNvbW1vbi8gYW5kIGFyY2gveDg2Lw0KPiByZXNwZWN0aXZlbHksIHNvIEkgdGhvdWdodCBhdCBs
ZWFzdCBhcmNoaXRlY3R1cmFsbHkgVk0gZXZlbnRzIHdlcmUNCj4gcG9zc2libGUgZm9yIFBWIGFz
IHdlbGwuIElmIGl0J3MgaW5kZWVkIEhWTS1vbmx5LCB0aGVuIGZvbGxvd2luZw0KPiB0aGUgSU9S
RVEgc2VydmVyIG1vZGVsIGluIGl0cyBlbnRpcmV0eSB3b3VsZCBvZiBjb3Vyc2UgYmUgZmluZS4N
Cj4gDQo+IEphbg0KDQpJbiBvbmUgb2YgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBhdGNo
c2V0IHRoZXJlIHdhcyBhIHN1Z2dlc3Rpb24NCnRvIGltcGxlbWVudCB0aGUgbmV3IHZtX2V2ZW50
IHRyYW5zcG9ydCB1c2luZyBJT1JFUSwgYnV0IGl0IHdhcyBkcm9wcGVkDQouDQoNCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNC9tc2cw
MDE3My5odG1sDQoNCkFsc28sIHVubGVzcyB0aGVyZSBpc24ndCBhIHByb3BlciB3YXkgYWxsb2Nh
dGUgdGhlIG5lY2Vzc2FyeSBwYWdlcywgSQ0Kd291bGRuJ3QgaW50cm9kdWNlIGEgSFZNLW9ubHkg
bGltaXRhdGlvbiBiZWNhdXNlLCBvdGhlciB0aGFuIHRoZSBIVk0NCnBhcmFtIHVzZWQgdG8ga2Vl
cCB0cmFjayBvZiB0aGUgcmluZyBwZm4sIHRoZSB2bV9ldmVudCBtZWNoYW5pc20gaXMNCnF1aXRl
IGdlbmVyaWMuDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBvcnQsDQpQZXRyZQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
