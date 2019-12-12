Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5C11C962
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 10:39:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifKuT-0000zL-1A; Thu, 12 Dec 2019 09:37:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbca=2C=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ifKuR-0000zG-9A
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 09:37:23 +0000
X-Inumbo-ID: fce54972-1cc2-11ea-8cfe-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.90]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fce54972-1cc2-11ea-8cfe-12813bfff9fa;
 Thu, 12 Dec 2019 09:37:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch6647C4zkl+Fcb5l9Lt5yw+QDJu3EXPWqEmCmYxkQY1hVq7eTyIvCCfcR5VcczvnjM067/zI9lARSgi661vt1snkSR/TlzgsRX3RRlF+DDJHE6yP2M7NjzjoGtOyCkLyTO0bcNcIxEx1HyySxIpG2tolJMT7ldaMLgZNS7txBBlEcz1VsxKI3Csa3Rus1w6IVdajQWFcNc6+S4l8iu3j3bQFDI15n4gISYcBF2FBEhfMkSXake77trEVC9lrwcbUCuAsD5LNzzMw96QMcPm3nSumf8ndCRsfBjly0dgBBnPkcVxp4hcj51wiARNPnp/T7SNVLfGnv2a8N6Mru/uEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZeHIvSsZWKbwVRLBkdfFD76v7kb27hymzkHuThOPNU=;
 b=lsQyRuAxD7LCX41hxxBdD+OWhdpM0vWS9eAOZnjB0MlYeVgR0FmSz1l8n8P6XYWP9rrLF5O+C6iXUxQMnrBSeVD4wNPjJMx28/pnS8dZpYDaEOQymqUrZe4YmP72ajJ/6gz/xUuO8UR06/33QvYSCbVSALOJowLAJPuEcLkbtc39x0Ppnb5LJcIiLImnK0ubA/VoAyMMMS9hu+fB+A9wZNRnwjsL+wSK0GMzqOqqT35K/hQC8AMfrAa2nmvALobNeC9csk5ykIHOV29Zht/IUzuMfI+uQM4a8mVxeR1UadZEVsAPtogj1UbYmxEiLbn4iq3nOtl0LJ9jkT4GzrSxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZeHIvSsZWKbwVRLBkdfFD76v7kb27hymzkHuThOPNU=;
 b=icLVU2S7FGqAWdb7JuNuC3Q0Tnuzzc0DmlivnFNyw6mmqCUsPQRSy3VTrr+mhOijfhtfW/Jzufwk8u0JTzGE+CAynFxq3wRNh1dxapyKJpuFDeuTJ8jgJmHFh+MSGCXrPljj8D5t/pfJAYQkljwssPaiYpeDLYt4BVk/FsBChl4=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5076.eurprd02.prod.outlook.com (20.178.22.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Thu, 12 Dec 2019 09:37:15 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 09:37:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V3 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVoHyqPG/1qImaik2u7wxoJD4v56etUuGAgAkLngA=
Date: Thu, 12 Dec 2019 09:37:15 +0000
Message-ID: <5816f5cc-2206-11f8-78e4-6b2310257720@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <09ce09b7-78ae-03bd-1600-2d25ccbff85d@citrix.com>
In-Reply-To: <09ce09b7-78ae-03bd-1600-2d25ccbff85d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::22) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9b1cd35-e73b-4e1e-b9c3-08d77ee6dfba
x-ms-traffictypediagnostic: AM0PR02MB5076:|AM0PR02MB5076:|AM0PR02MB5076:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB507677D435D97F789A6FA01AAB550@AM0PR02MB5076.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(107886003)(6512007)(66946007)(66446008)(66476007)(64756008)(66556008)(316002)(110136005)(54906003)(71200400001)(6486002)(2616005)(478600001)(53546011)(8676002)(6506007)(4326008)(31696002)(36756003)(5660300002)(81156014)(81166006)(8936002)(31686004)(2906002)(7416002)(186003)(52116002)(26005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5076;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: porAtuAaQ21E2DFXBG85LPpXf2YNwoSiY4ZX3vRSxKj2R6iE4I7VVQJOGdFjYbjHBxvb5YgL0nvN5vkjy9eUSfxLIg8Yj6Yx5p9KkJfdcQ4XbmZ9l+9uKUQtBeW/mrn/s73WDo+hhIgKfHvxiqL6Q+kjZuwoQDgf66eiVAHbD1PFMADHCdkEzPypjgEoyvjC+FFzShzxb46/aAwQBv8q0ilk259+QC4ofC4nJAuvA6csWGJsMRVN8yXBsxiEPnmy2OS0GCKyGv05rTn2EteMbei6h5EakUIDbV83hvnCgob/Fv/6Gn7+HhFl3Y24Pt8xSSTWPH5/wi0IwP86TiRCZslAZ/fjI3ZXe60I6rm7DWr2KREwaEQY/2F1uxVhWLJfN0BN4qVUtStGiL2U9pFBVCvuGooovRKqtAnsujSzZU4/rzGDOnWvHmJmfvZ2B8OG
Content-ID: <DC0B5B4D7A5C6E44B730EA5C3C9492C3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b1cd35-e73b-4e1e-b9c3-08d77ee6dfba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 09:37:15.8308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxHbqG94rOc52KSmFvHNaFJaeJNAGJ1+P1T7Qc5Em7FSZ5vxOz7HOoQjtLgJDHg4kz4nr4MutN8yPhjEGsVWGjK3A4L+HS8xLYcW6zzBpAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5076
Subject: Re: [Xen-devel] [PATCH V3 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LjEyLjIwMTkgMTc6MjksIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDExLzIx
LzE5IDM6MDIgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4gQnkgZGVmYXVs
dCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuDQo+PiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgaHlw
ZXJjYWxsLCB4Y19hbHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwNCj4+IHRvIHNldCBhIHJh
bmdlIG9mIHN2ZSBiaXRzLg0KPj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJha2UgaW4gY2FzZQ0KPj4gb2YgYSBlcnJvciBhbmQgaXQg
aXMgZG9pbmcgYSBiZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUNCj4+IGdp
dmVuIHJhbmdlLiBBIGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBo
YXZlDQo+PiBwcmVlbXB0aW9uIG9uIGJpZyByYW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+IA0KPiBUaGVyZSdz
IHNvbWV0aGluZyBzdHJhbmdlbHkgZGVmb3JtZWQgaW4geW91ciBtYWlsIHRoYXQgbWFrZXMgaXQg
aGFyZCBmb3INCj4gbWUgdG8gYXBwbHkgdGhlIHBhdGNoZXMgdG8gbXkgdHJlZSwgYW5kIEknbSBu
b3Qgc3VyZSB3aHkuDQo+IA0KPiBJdCBzZWVtcyB0aGUgY29yZSBtYWlsIGlzIGJhc2U2NC1lbmNy
eXB0ZWQ7IGFuZCB0aGF0ICppbnNpZGUqIHRoYXQNCj4gYmFzZTY0IGVuY3J5cHRpb24gaXMgYSBi
dW5jaCBvZiBXaW5kb3dzLXN0eWxlIGxpbmVmZWVkcy4gIFRoZSByZXN1bHQgaXMNCj4gdGhhdCB3
aGVuIEkgdHJ5IHRvIGRvd25sb2FkIHlvdXIgc2VyaWVzIGFuZCBhcHBseSBpdCB3aXRoIGdpdC1h
bSwgSSBnZXQNCj4gbG9hZHMgb2YgcmVqZWN0ZWQgaHVua3Mgd2l0aCAiXk0iIGF0IHRoZSBlbmQg
b2YgdGhlbS4NCj4gDQo+IFNvbWV0aW1lcyBJJ3ZlIGJlZW4gYWJsZSB0byB3b3JrIGFyb3VuZCB0
aGlzIGJ5IGdvaW5nIG9uIHBhdGNoZXcub3JnL1hlbg0KPiBhbmQgZ2V0dGluZyBhbiBtYm94IGZy
b20gdGhlcmU7IGJ1dCBpdCBkb2Vzbid0IHNlZW0gdG8gaGF2ZSB5b3VyIHNlcmllcw0KPiAocGVy
aGFwcyBiZWNhdXNlIGl0IGRvZXNuJ3QgaGF2ZSBhIGNvdmVyIGxldHRlcikuDQo+IA0KPiBMb29r
aW5nIGF0IHRoZSBoZWFkZXJzLCBpdCBzZWVtcyB0aGlzIGlzIGNvbWluZyBmcm9tIGdpdCBpdHNl
bGYuICBEbyB5b3UNCj4gcGVyaGFwcyBoYXZlICJ0cmFuc2ZlckVuY29kaW5nIiBzZXQgdG8gImJh
c2U2NCI/ICBJZiBzbywgY2hhbmNlIHlvdQ0KPiBjb3VsZCB0cnkgc2V0dGluZyBpdCB0byAnYXV0
bycsIGFuZCBzZXR0aW5nICdhc3N1bWU4Yml0RW5jb2RpbmcgPSB0cnVlIj8NCg0KSSBkaWRuJ3Qg
aGF2ZSBhbnl0aGluZyBzZXQgZm9yIHRyYW5zZmVyRW5jb2RpbmcgaW4gLmdpdGNvbmZpZyBidXQg
SSBjYW4gc2V0DQogICAgICAgICBhc3N1bWU4Yml0RW5jb2RpbmcgPSB5ZXMNCiAgICAgICAgIHRy
YW5zZmVyRW5jb2RpbmcgPSA4Yml0DQoNCmZvciB0aGUgZnV0dXJlLg0KDQpTb3JyeSBmb3IgdGhl
IGluY29udmVuaWVuY2UuDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
