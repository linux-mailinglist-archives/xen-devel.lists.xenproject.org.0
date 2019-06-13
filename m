Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E943554
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 13:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbNPM-000586-4S; Thu, 13 Jun 2019 10:56:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fN67=UM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hbNPK-000581-E7
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 10:56:38 +0000
X-Inumbo-ID: e9306e26-8dc9-11e9-8948-4b8234c8315b
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.138]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9306e26-8dc9-11e9-8948-4b8234c8315b;
 Thu, 13 Jun 2019 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5U2yA6pR1BCAJ6JUxmcumn6Y6Uv+ghjiWnhiw3a83Y=;
 b=HjtDkKeFNSjDQPrgMLjhrEctUZZO17ytt9ayd0aO8wFyjpjQRgi3Kz96NSIP/vYK71YnXRbN0svOjEyXR0nSO7qtAV2ib5TCyjHgoZFyJZUPnLIxme+Bbos/Wd6ZHdbCnG+XpoV17h5mAbiXp9+UKGONvXZRrFL89yPVadb06C8=
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com (10.171.76.8) by
 DB6PR0202MB2792.eurprd02.prod.outlook.com (10.171.77.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 10:56:33 +0000
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::a93a:e9b7:a758:f16a]) by DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::a93a:e9b7:a758:f16a%4]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 10:56:33 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
Thread-Index: AQHUVbjCoU3/Z5RAskyU0VB8ghTOWKabAd4A
Date: Thu, 13 Jun 2019 10:56:33 +0000
Message-ID: <d541ca85-a0b0-79e9-d8cc-4b414ceb87c0@bitdefender.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
In-Reply-To: <20180926164741.13405-2-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0213.eurprd07.prod.outlook.com
 (2603:10a6:802:58::16) To DB6PR0202MB2917.eurprd02.prod.outlook.com
 (2603:10a6:4:b1::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10161d0d-f878-45c4-db56-08d6efedcc53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0202MB2792; 
x-ms-traffictypediagnostic: DB6PR0202MB2792:|DB6PR0202MB2792:
x-microsoft-antispam-prvs: <DB6PR0202MB279224F0B78C0014C7FEBAFBABEF0@DB6PR0202MB2792.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(376002)(366004)(136003)(53754006)(199004)(189003)(3846002)(31686004)(478600001)(14444005)(66446008)(64756008)(14454004)(31696002)(66946007)(36756003)(66556008)(73956011)(5660300002)(86362001)(256004)(2616005)(66476007)(11346002)(486006)(76176011)(446003)(71190400001)(71200400001)(66066001)(8676002)(8936002)(6506007)(386003)(81166006)(81156014)(476003)(6116002)(102836004)(53546011)(229853002)(99286004)(52116002)(68736007)(7736002)(305945005)(6246003)(54906003)(6512007)(316002)(110136005)(2501003)(6486002)(6436002)(186003)(2906002)(25786009)(107886003)(4326008)(53936002)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2792;
 H:DB6PR0202MB2917.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OF/GuOepC7EObfQr2yYNlSsIhXOXlCcNQuOie+/4NhKGu2UnjLRNsgqbBdwyOt20HEQERuFLis5uGMe2OeBpZMcAmG1ukzJSbMpQalF+3I7iO+2VDyyfzvrjJUG5XIdlt0wHd+jDUtrpKomfxLPLaUkI3Ig0F40HzNAsIcR+0CHSBw6kWUOcfJ/ot21EyxND5aGhtpWkyHA4t5CBIomfPE0ACJ+l1wQWQH3CCBioFUrLDj3cLBy/zXV2ZiG9svuJBl3svokxckrQIR/QZGWXdkEwLnGmC6Q2WGyOGuCXUV1/rkoiVRivuvLiMa3vp4qKDUV7+lUW044uktuqMxmaqZ7SkYztTimZLyUuWLiCOFCQB9y41ZSAmo0NxUHi7ve6WLPjE0LgsuomguhBXV2ZYwOU4/7QpfIApt55KIr//9M=
Content-ID: <15292BA319BF8149BC7DAAF930A43BB3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10161d0d-f878-45c4-db56-08d6efedcc53
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 10:56:33.8172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2792
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
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
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.lengyel@zentific.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI2LjA5LjIwMTggMTk6NDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IEZyb206IElz
YWlsYSBBbGV4YW5kcnUgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPiANCj4gVGhpcyBwYXRj
aCBhZGRzIGFjY2VzcyBjb250cm9sIGZvciBOUFQgbW9kZS4NCj4gDQo+IFRoZXJlIGFyZW7igJl0
IGVub3VnaCBleHRyYSBiaXRzIHRvIHN0b3JlIHRoZSBhY2Nlc3MgcmlnaHRzIGluIHRoZSBOUFQg
cDJtDQo+IHRhYmxlLCBzbyB3ZSBhZGQgYSByYWRpeCB0cmVlIHRvIHN0b3JlIGV4dHJhIGluZm9y
bWF0aW9uLg0KPiANCj4gRm9yIGVmZmljaWVuY3k6DQo+ICAgLSBPbmx5IGFsbG9jYXRlIHRoaXMg
cmFkaXggdHJlZSB3aGVuIHdlIGZpcnN0IHN0b3JlICJub24tZGVmYXVsdCINCj4gICAgIGV4dHJh
IGluZm9ybWF0aW9uDQo+IA0KPiAgIC0gUmVtb3ZlIGVudGlyZXMgd2hpY2ggbWF0Y2ggdGhlIGRl
ZmF1bHQgZXh0cmEgaW5mb3JtYXRpb24gcmF0aGVyDQo+ICAgICB0aGFuIGNvbnRpbnVpbmcgdG8g
c3RvcmUgdGhlbQ0KPiANCj4gICAtIEZvciBzdXBlcnBhZ2VzLCBvbmx5IHN0b3JlIGFuIGVudHJ5
IGZvciB0aGUgZmlyc3QgZ2ZuIGluIHRoZQ0KPiAgICAgc3VwZXJwYWdlLiAgVXNlIHRoZSBvcmRl
ciBvZiB0aGUgcDJtIGVudHJ5IGJlaW5nIHJlYWQgdG8gZGV0ZXJtaW5lDQo+ICAgICB0aGUgcHJv
cGVyIHBsYWNlIHRvIGxvb2sgaW4gdGhlIHJhZGl4IHRhYmxlLg0KPiANCj4gTW9kaWZ5IHAybV90
eXBlX3RvX2ZsYWdzKCkgdG8gYWNjZXB0IGFuZCBpbnRlcnByZXQgYW4gYWNjZXNzIHZhbHVlLA0K
PiBwYXJhbGxlbCB0byB0aGUgZXB0IGNvZGUuDQo+IA0KPiBBZGQgYSBzZXRfZGVmYXVsdF9hY2Nl
c3MoKSBtZXRob2QgdG8gdGhlIHAybS1wdCBhbmQgcDJtLWVwdCB2ZXJzaW9ucw0KPiBvZiB0aGUg
cDJtIHJhdGhlciB0aGFuIHNldHRpbmcgaXQgZGlyZWN0bHksIHRvIGRlYWwgd2l0aCBkaWZmZXJl
bnQNCj4gZGVmYXVsdCBwZXJtaXR0ZWQgYWNjZXNzIHZhbHVlcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IC0tLQ0K
PiBOQiwgdGhpcyBpcyBjb21waWxlLXRlc3RlZCBvbmx5Lg0KPiANCj4gY2MnaW5nIFBhdWwgYmVj
YXVzZSB0aGlzIGlzIGZ1bmN0aW9uYWxpdHkgaGUgbWF5IHdhbnQgYXQgc29tZSBwb2ludCBpbg0K
PiB0aGUgZnV0dXJlLg0KPiANCj4gSSdtIG5vdCBzdXJlIHdoeSB3ZSBvbmx5IGFsbG93ICdpbnQn
IHRvIGJlIHN0b3JlZCBpbiB0aGUgcmFkaXggdHJlZSwNCj4gYnV0IHRoYXQgdGhyb3dzIGF3YXkg
MzAtc29tZSBiaXRzIHdlIGNvdWxkIG90aGVyd2lzZSB1c2UuICBXZSBtaWdodA0KPiBjb25zaWRl
ciByZXZpc2luZyB0aGlzIGlmIHdlIHJ1biBvdXQgb2YgYml0cyBoZXJlLg0KPiANCj4gQ0M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENDOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4g
Q0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEB6ZW50aWZpYy5jb20+DQo+IENDOiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiBDQzogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KDQpIaSBhbGwsDQoNCkkga25vdyBpdCdz
IGJlZW4gc29tZSB0aW1lIGZyb20gdGhlIHN0YXJ0IG9mIHRoaXMgcGF0Y2ggYnV0IGNhbiB0aGlz
IA0KbW92ZSBmb3J3YXJkPyBBbnkgdGhvdWdodHMgb3IgYWNrcyBhcmUgYXBwcmVjaWF0ZWQuDQoN
ClRoYW5rcywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
