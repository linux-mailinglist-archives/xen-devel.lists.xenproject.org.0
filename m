Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D146BE7C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 16:45:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnl7d-0004KM-HL; Wed, 17 Jul 2019 14:41:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnl7c-0004KH-Au
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 14:41:32 +0000
X-Inumbo-ID: f68894d4-a8a0-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.119]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f68894d4-a8a0-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 14:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QddiCtsuf5WaHSy+9Z/GrgT2Mb6+Wd2cFev+xGEmCVDFn2JmOi6vFfkxvp7AXegrgxz6HFKpc+/PqBZow27FfqxTj378dt5dbBGj6+B/teUmIlIF4EwXBSb7ivPomBLHDRws82oN8SvpaD8NcT95zTNR0u1QeBFf90FIC7V328GNzl8tSexDCFwIyPQg4Qmy1TS0+I2NBLf14CJlxh7KZVumPsPBegFbGcR1TzDvosrDj2TVLpJQ/rTM94shKTeFmvqhoDY5TcGuK4UeeC9CUau6aJVgXcwmX8E9Z9v7q7cfpgs04nzGeYb5ddVQxGpS3+rLsRvBXMTtcNM8emiDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOz+P0y3UOHNWOQj137JDJsXU4cx/rT2UNdOjQ+eqxA=;
 b=lg8E2arOH2ngOoeoO7Ye9L+C5yHQiPSfinBZLrdO6HI8Ns83bOPodcvkU1JE6FJLMh0ko6nOKoG3B2K+KSGag7881b7BhwKChS1x7FTBU35FaCJHmC9gBdUu6r8dmb98Nx0YsQY+SY+oaKh739lEYe4rLbkCTbjAcmEP6AIQxyam6sFUCHHvptKK+W1YhfX2mmUOWLoMTRngCjJZy20VD4tI6dccvCASnHsUf9RCFcpS5IaOPwIV0XHvaNWReKxc2qaFgfs3OxtH+KPmZCDsllFT3inNqPadY1cdHHNb/cqcTfpgR0/2NVWFEMEFHXAUNEWR2IJOv4Xi2vvpVUwSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOz+P0y3UOHNWOQj137JDJsXU4cx/rT2UNdOjQ+eqxA=;
 b=To0rodGJ4LNCr7z5VMsXcAlxD6gS7dF/GQ9w46kzd/Um66ouiQhPXLuCSTyUD/x6j9EOhpaeWDhgWVwZRqC3psVu7HdzInZpFUEt0nXHzD0SOG7WkzrC4gIQ68Ld3T5ITu4ZlywWw40nSi3BYaiI1gGLI/aIxbtYNGvaVEH98zw=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4549.eurprd02.prod.outlook.com (20.177.196.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 14:41:28 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 14:41:28 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4A=
Date: Wed, 17 Jul 2019 14:41:28 +0000
Message-ID: <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
In-Reply-To: <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::16) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 545a34bb-bc8e-4ed2-c740-08d70ac4d9c9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4549; 
x-ms-traffictypediagnostic: AM6PR02MB4549:|AM6PR02MB4549:
x-microsoft-antispam-prvs: <AM6PR02MB4549DE1CC87947FC66F709EDD6C90@AM6PR02MB4549.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(55674003)(8676002)(386003)(6506007)(53546011)(68736007)(7736002)(8936002)(99286004)(66446008)(102836004)(66476007)(66556008)(64756008)(66946007)(7416002)(52116002)(316002)(66066001)(11346002)(118296001)(446003)(476003)(86362001)(229853002)(25786009)(478600001)(5660300002)(2616005)(53936002)(6246003)(6486002)(14454004)(26005)(256004)(186003)(14444005)(2906002)(6916009)(6116002)(71190400001)(71200400001)(81156014)(54906003)(305945005)(50226002)(81166006)(3846002)(76176011)(6512007)(6436002)(4326008)(36756003)(486006)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4549;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V1e07NxUQYEhuZ0kJi/G0GL8Gbamy/qqDmCFp88y5HlcPAvdkjF5gpr3szKHyqCyJ3t8iXbPq1ESaBd5VG6+a8TCHq5UUEmT0y90hlFX8QfwNR5f742VwBVPx7HA8vxAJc/sgOIqekQDtIBuajYbWqOK6K0eFXymseJJ3GyBWAMJMMK2JKNJPkryjs9Jifa6P6bdDBes2mRvOV0/7TtS7EJxoExxpTFbjU64cslTH0cFfRcnQslFrHVnMME7+1/1qQzwIQKbbV0AJKNJds5DaCJHnnvc8vhEIEyb1IjVsOFWQQ1sUYfJur3Xbj0ymceA2nn8dVNNpYDyl4/jQ/Z92Ide6MrvxBx5y49MrV6f5pK7twwiOFt6JKNZnaixpMtzH10l/npgmrI0/pLNYq1rMHUW3dmi/yRkDbi7ySIW97Q=
Content-ID: <E1A90C934F0CBA42AEA86C456AED0340@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545a34bb-bc8e-4ed2-c740-08d70ac4d9c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 14:41:28.2540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4549
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDEwOjA2ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiA+ICtzdGF0aWMg
dm9pZCB2bV9ldmVudF9jaGFubmVsc19mcmVlX2J1ZmZlcihzdHJ1Y3QNCj4gPiB2bV9ldmVudF9j
aGFubmVsc19kb21haW4gKmltcGwpDQo+ID4gICB7DQo+ID4gLSAgICB2bV9ldmVudF9yaW5nX3Jl
c3VtZSh0b19yaW5nKHYtPmRvbWFpbi0+dm1fZXZlbnRfbW9uaXRvcikpOw0KPiA+ICsgICAgaW50
IGk7DQo+ID4gKw0KPiA+ICsgICAgdnVubWFwKGltcGwtPnNsb3RzKTsNCj4gPiArICAgIGltcGwt
PnNsb3RzID0gTlVMTDsNCj4gPiArDQo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGltcGwtPm5y
X2ZyYW1lczsgaSsrICkNCj4gPiArICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShtZm5fdG9fcGFn
ZShpbXBsLT5tZm5baV0pKTsNCj4gPiAgIH0NCj4gDQo+IFdoYXQgZ3VhcmFudGVlcyB0aGF0IHRo
ZXJlIGFyZSBubyBtYXBwaW5ncyBsZWZ0IG9mIHRoZSBwYWdlcyB5b3UgZnJlZQ0KPiBoZXJlPyBT
aGFyaW5nIHBhZ2VzIHdpdGggZ3Vlc3RzIGlzIChzbyBmYXIpIGFuIChhbG1vc3QpIGlycmV2ZXJz
aWJsZQ0KPiBhY3Rpb24sIGkuZS4gdGhleSBtYXkgZ2VuZXJhbGx5IG9ubHkgYmUgZnJlZWQgdXBv
biBkb21haW4NCj4gZGVzdHJ1Y3Rpb24uDQo+IFNlZSBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNf
ZnJhbWVzKCkgZm9yIGEgY2FzZSB3aGVyZSB3ZSBhY3R1YWxseQ0KPiBtYWtlIGFuIGF0dGVtcHQg
YXQgZnJlZWluZyBzdWNoIHBhZ2VzIChidXQgd2hlcmUgd2UgZmFpbCB0aGUgcmVxdWVzdA0KPiBp
biBjYXNlIHJlZmVyZW5jZXMgYXJlIGxlZnQgaW4gcGxhY2UpLg0KPiANCkkndmUgdGVzdGVkIG1h
bnVhbGx5IDIgY2FzZXMgYW5kIHRoZXkgYm90aCB3b3JrIChubyBjcmFzaGVzKToNCjE6IGludHJv
c3BlY3RlZCBkb21haW4gc3RhcnRzIC0+IG1vbml0b3Igc3RhcnRzIC0+IG1vbml0b3Igc3RvcHMg
LT4NCmRvbWFpbiBzdG9wcw0KMjogaW50cm9zcGVjdGVkIGRvbWFpbiBzdGFydHMgLT4gbW9uaXRv
ciBzdGFydHMgLT4gZG9tYWluIHN0b3BzIC0+DQptb25pdG9yIHN0b3BzLg0KSG93ZXZlciwgSSB3
aWxsIHRha2UgYSBjbG9zZXIgbG9vayBhdCBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVz
DQphbmQgcG9zdCBhIGZvbGxvdyB1cCBlbWFpbC4NCg0KPiBGdXJ0aGVybW9yZSwgaXMgdGhlcmUg
YW55IGd1YXJhbnRlZSB0aGF0IHRoZSBwYWdlcyB5b3UgZnJlZSBoZXJlDQo+IHdlcmUgYWN0dWFs
bHkgYWxsb2NhdGVkPyAtPm5yX2ZyYW1lcyBnZXRzIHNldCBhaGVhZCBvZiB0aGUgYWN0dWFsDQo+
IGFsbG9jYXRpb24uDQo+IA0Kdm1fZXZlbnRfY2hhbm5lbHNfZnJlZV9idWZmZXIgaXMgY2FsbGVk
IG9ubHkgZnJvbQ0Kdm1fZXZlbnRfY2hhbm5lbHNfZGlzYWJsZS4gVGhlIGxhdHRlciBpcyBjYWxs
ZWQgb25seSBpZiB2bV9ldmVudF9jaGVjaw0Kc3VjY2VlZHMgKCB2bV9ldmVudF9jbGVhbnVwIGFu
ZCB2bV9ldmVudF9kb21jdGwvVk1fRVZFTlRfRElTQUJMRSkuDQp2bV9ldmVudF9jaGVjayB3aWxs
IG9ubHkgcmV0dXJuIHRydWUgaWYgdm1fZXZlbnRfZW5hYmxlIHN1Y2NlZWRzLg0KDQo+ID4gK2lu
dCB2bV9ldmVudF9uZ19nZXRfZnJhbWVzKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBp
ZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmcmFtZSwg
dW5zaWduZWQgaW50DQo+ID4gbnJfZnJhbWVzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICB4ZW5fcGZuX3QgbWZuX2xpc3RbXSkNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IHZtX2V2
ZW50X2RvbWFpbiAqdmVkOw0KPiA+ICsgICAgaW50IGk7DQo+ID4gKw0KPiA+ICsgICAgc3dpdGNo
IChpZCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICBjYXNlIFhFTl9WTV9FVkVOVF9UWVBFX01PTklU
T1I6DQo+ID4gKyAgICAgICAgdmVkID0gZC0+dm1fZXZlbnRfbW9uaXRvcjsNCj4gPiArICAgICAg
ICBicmVhazsNCj4gPiArDQo+ID4gKyAgICBkZWZhdWx0Og0KPiA+ICsgICAgICAgIHJldHVybiAt
RU5PU1lTOw0KPiANCj4gVmFyaW91cyBvdGhlciBlcnJvciBjb2RlcyBtaWdodCBiZSBmaW5lIGhl
cmUsIGJ1dCBFTk9TWVMgaXMgbm90DQo+IChkZXNwaXRlIHByZS1leGlzdGluZyBtaXN1c2UgZWxz
ZXdoZXJlIGluIHRoZSB0cmVlKS4NCg0Kdm1fZXZlbnRfZG9tY3RsIGFsc28gcmV0dXJucyAtRU5P
U1lTIGlmIHRoZSB0eXBlIGlzIG5laXRoZXINClhFTl9WTV9FVkVOVF9UWVBFX1BBR0lORywgWEVO
X1ZNX0VWRU5UX1RZUEVfTU9OSVRPUiwgbm9yDQpYRU5fVk1fRVZFTlRfVFlQRV9TSEFSSU5HLiBJ
J3ZlIGp1c3QgZm9sbG93ZWQgdGhlIGV4aXN0aW5nIGNvbnZlbnRpb24uDQoNCj4gDQo+ID4gKyAg
ICB9DQo+ID4gKw0KPiA+ICsgICAgaWYgKCAhdm1fZXZlbnRfY2hlY2sodmVkKSApDQo+ID4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBmcmFtZSAhPSAwIHx8
IG5yX2ZyYW1lcyAhPSB0b19jaGFubmVscyh2ZWQpLT5ucl9mcmFtZXMgKQ0KPiA+ICsgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPiANCj4gSXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiBmb3Ig
dGhpcyBhbGwtb3Itbm90aGluZyBtb2RlbD8NCg0KSSd2ZSBhZGRlZCB0aGlzIGV4dHJhIGNoZWNr
IGR1ZSB0byB0aGUgd2F5IGFjcXVpcmVfcmVzb3VyY2UgaW50ZXJmYWNlDQppcyBkZXNpZ25lZC4g
SW4gb3VyIGNhc2UsIHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkIGZyb20NClhFTl9WTV9FVkVOVF9F
TkFCTEUgYW5kIHRoZSBzaXplIGlzIGtub3duIGJlZm9yZWhhbmQ6IHRoZSBudW1iZXIgb2YNCnBh
Z2VzIG5lZWRlZCB0byBzdG9yZSAodmNwdXNfY291bnQgKiBzaXplb2Ygdm1fZXZlbnRfc2xvdCkg
Ynl0ZXMuDQpIb3dldmVyIHRoZSBhY3F1aXJlX3Jlc291cmNlIG5lZWRzIGEgIm5yX2ZyYW1lcyIg
cGFyYW1ldGVyIHdoaWNoIGlzDQpjb21wdXRlZCBpbiBhIHNpbWlsYXIgbWFubmVyIGluIHRoZSBs
aWJ4YyB3cmFwcGVyLiANClRoaXMgY2hlY2sgb25seSB2ZXJpZmllcyB0aGF0IHVzZXJzcGFjZSBp
cyBub3Qgc2VuZGluZyBhbiBpbnZhbGlkDQpwYXJhbWV0ZXIgKHVzaW5nIGFuIEFTU0VSVCBpbiB0
aGlzIGNhc2Ugd291bGQgaGF2ZSBiZWVuIG92ZXJraWxsDQpiZWNhdXNlIGl0IHdvdWxkIGNyYXNo
IHRoZSB3aG9sZSBoeXBlcnZpc29yKQ0KDQo+IA0KPiA+ICsgICAgc3Bpbl9sb2NrKCZ2ZWQtPmxv
Y2spOw0KPiA+ICsNCj4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgdG9fY2hhbm5lbHModmVkKS0+
bnJfZnJhbWVzOyBpKysgKQ0KPiA+ICsgICAgICAgIG1mbl9saXN0W2ldID0gbWZuX3godG9fY2hh
bm5lbHModmVkKS0+bWZuW2ldKTsNCj4gPiArDQo+ID4gKyAgICBzcGluX3VubG9jaygmdmVkLT5s
b2NrKTsNCj4gDQo+IFdoYXQgaXMgdGhlIGxvY2tpbmcgZ29vZCBmb3IgaGVyZT8gWW91IG9idmlv
dXNseSBjYW4ndCBiZSBhZnJhaWQgb2YNCj4gdGhlIHZhbHVlcyBiZWNvbWluZyBzdGFsZSwgYXMg
dGhleSBzdXJlbHkgd291bGQgYmUgYnkgdGhlIHRpbWUgdGhlDQo+IGNhbGxlciBnZXRzIHRvIHNl
ZSB0aGVtIChpZiB0aGV5IGNhbiBnbyBzdGFsZSBpbiB0aGUgZmlyc3QgcGxhY2UpLg0KVGhhbmtz
IGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIHJlbW92ZSB0aGUgbG9jayBpbiB0aGUgbmV4
dA0KcGF0Y2hzZXQgaXRlcmF0aW9uLg0KPiANCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
ZG9tY3RsLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiBAQCAt
MzgsNyArMzgsNyBAQA0KPiA+ICAgI2luY2x1ZGUgImh2bS9zYXZlLmgiDQo+ID4gICAjaW5jbHVk
ZSAibWVtb3J5LmgiDQo+ID4gICANCj4gPiAtI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9W
RVJTSU9OIDB4MDAwMDAwMTENCj4gPiArI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJT
SU9OIDB4MDAwMDAwMTINCj4gDQo+IFRoaXMgbG9va3MgdG8gYmUgbmVlZGVkIG9ubHkgYmVjYXVz
ZSBvZiAuLi4NCj4gDQo+ID4gQEAgLTc4MSwxMiArNzgxLDIwIEBAIHN0cnVjdCB4ZW5fZG9tY3Rs
X2dkYnN4X2RvbXN0YXR1cyB7DQo+ID4gICBzdHJ1Y3QgeGVuX2RvbWN0bF92bV9ldmVudF9vcCB7
DQo+ID4gICAgICAgdWludDMyX3QgICAgICAgb3A7ICAgICAgICAgICAvKiBYRU5fVk1fRVZFTlRf
KiAqLw0KPiA+ICAgICAgIHVpbnQzMl90ICAgICAgIHR5cGU7ICAgICAgICAgLyogWEVOX1ZNX0VW
RU5UX1RZUEVfKiAqLw0KPiA+ICsgLyogVXNlIHRoZSBORyBpbnRlcmZhY2UgKi8NCj4gPiArI2Rl
ZmluZSBfWEVOX1ZNX0VWRU5UX0ZMQUdTX05HX09QICAgICAgICAgMA0KPiA+ICsjZGVmaW5lIFhF
Tl9WTV9FVkVOVF9GTEFHU19OR19PUCAgICAgICAgICAoMVUgPDwNCj4gPiBfWEVOX1ZNX0VWRU5U
X0ZMQUdTX05HX09QKQ0KPiA+ICsgICAgdWludDMyX3QgICAgICAgZmxhZ3M7DQo+IA0KPiAuLi4g
dGhpcyBhZGRpdGlvbi4gSXMgdGhlIG5ldyBmaWVsZCByZWFsbHkgd2FycmFudGVkIGhlcmU/IENh
bid0DQo+IHlvdSBlLmcuIHNpbXBseSBkZWZpbmUgYSBuZXcgc2V0IG9mIG9wcyAoZS5nLiBieSBz
ZXR0aW5nIHRoZWlyDQo+IGhpZ2ggYml0cyk/DQo+IA0KWW91IGFyZSByaWdodC4gQWN0dWFsbHkg
b25seSBhIG5ldyBvcCBpcyBuZWVkZWQgKGUuZy4NClhFTl9WTV9FVkVOVF9OR19FTkFCTEUpLg0K
VGhlIG9ubHkgbmVlZGVkIGFkaXRpb24gaXMgdGhlIHZjcHVfaWQgZm9yIHRoZSByZXN1bWUgb3As
IGluIG9yZGVyIHRvDQpzcGVjaWZ5IHRoZSB2Y3B1IHdoaWNoIHdpbGwgaGFuZGxlIHRoZSByZXF1
ZXN0IGluIGNhc2Ugb2YgdGhlDQoiY2hhbm5lbHMiIHZtX2V2ZW50IHRyYW5zcG9ydC4gSG93ZXZl
ciwgdGhpcyB3aWxsIG5vdCBhZmZlY3QgdGhlDQpkb21jdGwncyBvZmZzZXRzIGhlbmNlIHRoZSBp
bnRlcmZhY2UgdmVyc2lvbiBpbmNyZW1lbnQgaXMgbm90IHJlcXVpcmVkLg0KSSB3aWxsIGNoYW5n
ZSB0aGlzIGluIHRoZSBuZXh0IHBhdGNoc2V0IGl0ZXJhdGlvbi4NCg0KPiBJJ3ZlIG9taXR0ZWQg
YWxsIHN0eWxlIGNvbW1lbnRzIChmb3JtYXR0aW5nLCBwbGFpbiB2cyB1bnNpZ25lZCBpbnQNCj4g
ZXRjKSAtIEknZCBsaWtlIHRvIGxlYXZlIHRoYXQgdG8gdGhlIFZNIGV2ZW50IG1haW50YWluZXJz
Lg0KSSB3aWxsIGNoZWNrIGFnYWluIHRoZSBwYXRjaCBmb3Igc3R5bGUgZXJyb3JzLCBidXQgaW4g
dGhlIG1lYW50aW1lLCBpZg0Kc29tZXRoaW5nIHN0YW5kcyBvdXQsIHBsZWFzZSBsZXQgbWUga25v
dyBhbmQgSSB3aWxsIGZpeCBpdCBhc2FwLg0KPiANCj4gSmFuDQoNCk1hbnkgdGhhbmtzIGZvciB5
b3VyIHN1cHBvcnQsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
