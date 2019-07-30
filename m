Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FF7A2C9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsN5k-00088n-PR; Tue, 30 Jul 2019 08:02:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsN5i-00088i-UE
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:02:38 +0000
X-Inumbo-ID: 6241c0b3-b2a0-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6241c0b3-b2a0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:02:37 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:02:33 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 07:55:04 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 07:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaY2POYY+u4iCEpLNmijyF+MPl1BVJx9ef22INaV9vxS2x9mLTPmVwBKV2AqAaA+/FlI6bAqoINbyT2A0Dm7wuuCkn33uDxGHmspnMsxJ9Vw3I9AEJN/56z7WubDlQzo2VCgWyuzWxYmE9TDQghoC0iMXrbvm8tslb6vMU84ZpPjNPZJC3RWJFcXWxFW9ioR7BNkh+E3WP8tn/5rDSyZ5BSCNkQEZqFnfp9wMKnEfG6brYf38vz9D4JD2vk75meLLDNoSqrZVeLReQe0YaQYKcT0rwEo+rXjum45phjSrwHar+2eEFTZ9Z80GtrYkisrEfmdMuAY5BKuT7DcqM+4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8S+uEcUON09sP2qjrAvxKSBqC00Ufh8ZkYr8R55d6s=;
 b=ZcPAtG21xRj90BqBc/6kAngkvxNeeBFHoA7KmxDQzbk6jiey4lOZ7ungIHJHDHAYDxAls1qzqdtEMdmTrYY3soZ12IQDQWIEzNn3PtZjf2M4uZZC0D497mmBB7FXNYLYhJsUx+UrliCX3ka5yzPs34rH2rz6MOtODD+dVakraoEgoMCiAcHu0OrD8b1OvcJF7QICW1lyd4drLUd7IayepK/MsisFpuvwH8+55ozFtIkrW+U3Xhc/XUNGcURz++0bN23e4TtASlGqISchV7Who7faJPi8/TfaLagczV3BVSDlAFB3VkTyHZZyF9uVPmurEDHI/8L3BRsn5hHErU6rXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3217.namprd18.prod.outlook.com (10.255.138.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 07:55:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 07:55:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
Thread-Index: AQHVRiQr6DrMZ4ncf0iQGv5Hre+VmqbhwEEAgAATXb6AAPg8AA==
Date: Tue, 30 Jul 2019 07:55:02 +0000
Message-ID: <0fcde4fe-fc59-316e-b53b-619bd18a27a3@suse.com>
References: <20190729154112.7644-1-ross.lagerwall@citrix.com>
 <d9cb90b9-1d58-9514-0f35-0c1dbb1476be@suse.com>
 <7dc7166d-dae2-45b2-4119-eda08f63cd83@citrix.com>
In-Reply-To: <7dc7166d-dae2-45b2-4119-eda08f63cd83@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:10:be::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 620662b9-3bf1-4a1b-fecf-08d714c33a1c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3217; 
x-ms-traffictypediagnostic: BY5PR18MB3217:
x-microsoft-antispam-prvs: <BY5PR18MB32175CC532B8EA7555FE8E18B3DC0@BY5PR18MB3217.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(199004)(189003)(53936002)(6246003)(31696002)(36756003)(8936002)(14454004)(25786009)(6436002)(81156014)(107886003)(99286004)(52116002)(81166006)(6916009)(8676002)(186003)(26005)(3846002)(6486002)(4326008)(6116002)(102836004)(229853002)(71190400001)(7736002)(5024004)(14444005)(305945005)(6512007)(66476007)(66066001)(446003)(86362001)(478600001)(486006)(2906002)(54906003)(316002)(66946007)(66446008)(64756008)(66556008)(386003)(53546011)(76176011)(80792005)(476003)(2616005)(31686004)(11346002)(256004)(71200400001)(6506007)(15650500001)(5660300002)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3217;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1YU9NhUAF4weMeSeQRSgJK97NR/dYJk4o42Ah2kHsZ+Zc+eix7hErsMomvnRhqRX+Ic7C5SLz3y7yJg1kRoIj11UcB/tToOwAakKNI6GtfloK1E6rBaig1uym+onV+U0VoybDReZFhYQrphr9JMaUD07D5xT8a9de16CLiDR6Ied23NHR/xDhGhfATb4SOSIZa28vKGocv2+vBtiPuVom9g/ydrERpj8MFnftKpWcgmcbkUBUK4/ZXpu7d7Hx2UT53x63NGS9Gn4ifRkd4ghty4HylzOCd4JuUhNLrGqxk8XTnFwBMP+b8v0TvnH8SuVilH+oKpsYPH6Y+hZA1uH4rnf8QZ11ng1c/bizfA+M7HdSziNbPk+LdZmnhA5OGmDVaCeQGUIFvELFEV4UWRTbSYhrNcpgV891QEsbRyH1hA=
Content-ID: <FBAD38FE1A6E344AB7FABDEC5E2B1BB2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 620662b9-3bf1-4a1b-fecf-08d714c33a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 07:55:02.4640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3217
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
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
Cc: Juergen Gross <JGross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxOTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMDcvMjAx
OSAxNjo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE3OjQxLCBSb3Nz
IExhZ2Vyd2FsbCB3cm90ZToNCj4+PiBXaGVuIHN1c3BlbmRpbmcvcmVzdW1pbmcgb3IgbWlncmF0
aW5nIHVuZGVyIFhlbiwgdGhlcmUgaXNuJ3QgbXVjaCBuZWVkDQo+Pj4gZm9yIHN1c3BlbmRpbmcg
YW5kIHJlc3VtaW5nIGFsbCB0aGUgYXR0YWNoZWQgZGV2aWNlcyBzaW5jZSB0aGUgWGVuL1FFTVUN
Cj4+PiBzaG91bGQgY29ycmVjdGx5IG1haW50YWluIHRoZSBoYXJkd2FyZSBzdGF0ZS4gRHJvcCB0
aGVzZSBjYWxscyBhbmQNCj4+PiByZXBsYWNlIHdpdGggbW9yZSBzcGVjaWZpYyBjYWxscyB0byBl
bnN1cmUgWGVuIGZyb250ZW5kIGRldmljZXMgYXJlDQo+Pj4gcHJvcGVybHkgcmVjb25uZWN0ZWQu
DQo+PiBJcyB0aGlzIHRydWUgZm9yIHRoZSBnZW5lcmFsIHBhc3MtdGhyb3VnaCBjYXNlIGFzIHdl
bGw/IFdoaWxlIG1pZ3JhdGlvbg0KPj4gbWF5IG5vdCBiZSAoZnVsbHkpIGNvbXBhdGlibGUgd2l0
aCBwYXNzLXRocm91Z2gsIGlpcmMgc2F2ZS9yZXN0b3JlIGlzLg0KPiANCj4gV2hhdCBnaXZlcyB5
b3UgdGhpcyBpbXByZXNzaW9uPw0KPiANCj4gTWlncmF0aW9uIGFuZCBzYXZlL3Jlc3RvcmUgYXJl
ICpsaXRlcmFsbHkqIHRoZSBzYW1lIHRoaW5nLCBleGNlcHQgdGhhdA0KPiBpbiBvbmUgY2FzZSB5
b3UncmUgcGlwaW5nIHRoZSBkYXRhIHRvL2Zyb20gZGlzaywgYW5kIGluIHRoZSBvdGhlciB5b3Un
cmUNCj4gcGlwaW5nIGl0IHRvIHRoZSBkZXN0aW5hdGlvbiBhbmQgcmVzdG9yaW5nIGl0IGltbWVk
aWF0ZWx5Lg0KPiANCj4gSWYgeW91IGxvb2sgYXQgdGhlIHRvb2xzdGFjayBjb2RlLCBpdCBpcyBh
bGwgaW4gdGVybXMgb2YgcmVhZGluZy93cml0aW5nDQo+IGFuIGZkIChpbmNsdWRpbmcgbGlieGwn
cyBBUEkpIHdoaWNoIGlzIGVpdGhlciBhIG5ldHdvcmsgc29ja2V0IG9yIGENCj4gZmlsZSwgYXMg
Y2hvc2VuIGJ5IHhsLg0KDQpTdXJlLiBUaGUgbWFpbiBkaWZmZXJlbmNlIGlzIHdoZXJlIHRoZSBy
ZXN0b3JlIGhhcHBlbnMgKGJ5IGRlZmF1bHQpOg0KRm9yIGxpdmUgbWlncmF0aW9uIEkgZXhwZWN0
IHRoaXMgdG8gYmUgb24gYSBkaWZmZXJlbnQgaG9zdCwgd2hlcmVhcw0KZm9yIGEgbm9uLWxpdmUg
cmVzdG9yZSBJJ2QgZXhwZWN0IHRoaXMgdG8gYmUgdGhlIHNhbWUgaG9zdC4gQW5kIGl0DQppcyBv
bmx5IHRoZSAic2FtZSBob3N0IiBjYXNlIHdoZXJlIG9uZSBjYW4gYXNzdW1lIHRoZSBzYW1lIHBo
eXNpY2FsDQpwaWVjZSBvZiBoYXJkd2FyZSB0byBiZSBhdmFpbGFibGUgYWdhaW4gZm9yIHBhc3Np
bmcgdGhyb3VnaCB0byB0aGlzDQpndWVzdC4gSW4gdGhlICJkaWZmZXJlbnQgaG9zdCIgY2FzZSBy
ZXN0b3JlIF9tYXlfIGJlIHBvc3NpYmxlLCB1c2luZw0KaWRlbnRpY2FsIGhhcmR3YXJlLiAoQW5k
IHllcywgaW4gdGhlICJzYW1lIGhvc3QiIGNhc2UgcmVzdG9yZSBtYXkNCmFsc28gYmUgaW1wb3Nz
aWJsZSwgaWYgdGhlIGhhcmR3YXJlIG1lYW53aGlsZSBoYXMgYmVlbiBhc3NpZ25lZCB0bw0KYW5v
dGhlciBndWVzdC4gQnV0IGFzIHNhaWQsIEknbSB0YWxraW5nIGFib3V0IHRoZSBkZWZhdWx0IGNh
c2UgaGVyZS4pDQoNCj4+IFdvdWxkIHFlbXUgcmVzdG9yZSBzdGF0ZSBvZiBwaHlzaWNhbCBQQ0kg
ZGV2aWNlcz8NCj4gDQo+IFdoYXQgc3RhdGUgd291bGQgUWVtdSBiZSBpbiBhIHBvc2l0aW9uIHRv
IGtub3cgYWJvdXQsIHdoaWNoIGlzbid0DQo+IGFscmVhZHkgcHJlc2VudCBpbiBRZW11J3MgZGF0
YWJsb2I/DQoNClRoYXQncyBhIHZhbGlkIChyaGV0b3JpY2FsKSBxdWVzdGlvbiwgYnV0IG5vdCBo
ZWxwaW5nIHRvIGFuc3dlciBtaW5lLg0KDQo+IFdoYXQgd2UgZG8gd2l0aCBncmFwaGljcyBjYXJk
cyBpcyB0byBtZXJnZSBYZW5zIGxvZ2RpcnR5IGJpdG1hcCwgd2l0aCBhDQo+IGRpcnR5IGxpc3Qg
cHJvdmlkZWQgYnkgdGhlIGNhcmQgaXRzZWxmLsKgIFRoaXMgbmVlZHMgYSBkZXZpY2Utc3BlY2lm
aWMNCj4ga25vd2xlZGdlLsKgIEluIGFkZGl0aW9uLCB0aGVyZSBpcyBhbiBvcGFxdWUgYmxvYiBv
ZiBkYXRhIHByb2R1Y2VkIGJ5IHRoZQ0KPiBzb3VyY2UgY2FyZCwgd2hpY2ggaXMgaGFuZGVkIHRv
IHRoZSBkZXN0aW5hdGlvbiBjYXJkLsKgIFRoYXQgYWxzbyBsaXZlcw0KPiBpbiB0aGUgc3RyZWFt
Lg0KPiANCj4gSW50ZWwncyBTY2FsYWJsZSBJT1Ygc3BlYyBpcyBhdHRlbXB0aW5nIHRvIHJhdGlv
bmFsaXNlIHRoaXMgYnkgaGF2aW5nIGENCj4gc3RhbmRhcmQgd2F5cyBvZiBnZXR0aW5nIGxvZ2Rp
cnR5IGFuZCAiaW50ZXJuYWwgc3RhdGUiIGluZm9ybWF0aW9uIG91dA0KPiBvZiBhIGRldmljZSwg
YnV0IGZvciB0aGUgbW9tZW50LCBpdCByZXF1aXJlcyBjdXN0b20gZGV2aWNlLWRyaXZlcg0KPiBz
cGVjaWZpYyBjb2RlIHRvIGRvIGFueXRoaW5nIG1pZ3JhdGlvbiByZWxhdGVkIHdpdGggcmVhbCBo
YXJkd2FyZS4NCg0KV2hpY2ggaXNuJ3QgdmVyeSBuaWNlLCBzaW5jZSBpdCBkb2Vzbid0IHNjYWxl
IHdlbGwgYXMgYSBtb2RlbC4NCg0KPiBBcyBmb3Igd2h5IGl0cyBzYWZlIHRvIGRvIGxpa2UgdGhp
cywgdGhlIGJlc3QgYXJndW1lbnQgaXMgdGhhdCB0aGlzIGlzDQo+IGhvdyBhbGwgb3RoZXIgdmVu
ZG9ycyBkbyBtaWdyYXRpb24sIGluY2x1ZGluZyBLVk0uwqAgWGVuIGlzIHRoZQ0KPiBvZGQtb25l
LW91dCB1c2luZyB0aGUgZnVsbCBTMyBwYXRoLg0KDQpTbyBob3cgZG8gImFsbCBvdGhlciB2ZW5k
b3JzIiBkZWFsIHdpdGggZGV2aWNlIHNwZWNpZmljIHN0YXRlPyBTbw0KZmFyIEkgd2FzIHVuZGVy
IHRoZSBpbXByZXNzaW9uIHRoYXQgdG8gZGVhbCB3aXRoIHRoaXMgaXMgcHJlY2lzZWx5DQp3aHkg
d2UgdXNlIHRoZSBTMyBsb2dpYyBpbiB0aGUga2VybmVsLg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
