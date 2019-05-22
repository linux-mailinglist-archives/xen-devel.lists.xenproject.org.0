Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE912652E
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 15:54:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTRdg-00028c-6F; Wed, 22 May 2019 13:50:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AhM0=TW=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hTRde-00028X-Ds
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:50:38 +0000
X-Inumbo-ID: 937db9fc-7c98-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::728])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 937db9fc-7c98-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbwHyjuT4SNt/6b8FhSwSUyNVdiVrPuSbjw/vpksi0Q=;
 b=IN8HWdEz/XoIN8wm8hEuvg9hy8KMxLsNSrTq2jBw12OBCGBSEtX+mOCVmwpSB7yWxAEgfhnGwcDZwwMlrExdCJr7rdR6VnJreo88kYiS3T6WxzWdCA/xF+785iYH2jIgme73oW3Rw1SAmhK1flZ+OZtbkRv9Ym7GHgyRYFSXFfk=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3502.eurprd02.prod.outlook.com (52.134.17.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 13:50:33 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1922.016; Wed, 22 May 2019
 13:50:33 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 2/2] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVDwtG9NQRMXonfUaGlUQCgO162qZ26xeAgABlYID//9eGgIAABI8A
Date: Wed, 22 May 2019 13:50:33 +0000
Message-ID: <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
 <608cae57-7a7a-6502-9c9a-439aa0b88f25@bitdefender.com>
 <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
In-Reply-To: <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:205::33)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6be755b5-560c-47d9-fa26-08d6debc75bb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3502; 
x-ms-traffictypediagnostic: VI1PR0202MB3502:|VI1PR0202MB3502:
x-microsoft-antispam-prvs: <VI1PR0202MB3502A10F29441D6C65397228AB000@VI1PR0202MB3502.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(136003)(376002)(189003)(199004)(4326008)(229853002)(11346002)(102836004)(6486002)(186003)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(446003)(25786009)(71200400001)(14454004)(36756003)(68736007)(6512007)(6436002)(476003)(6246003)(71190400001)(508600001)(2616005)(6916009)(31686004)(14444005)(54906003)(6116002)(486006)(53936002)(2906002)(256004)(3846002)(5660300002)(52116002)(316002)(7736002)(76176011)(86362001)(305945005)(99286004)(6506007)(66066001)(8936002)(8676002)(4744005)(26005)(81166006)(81156014)(386003)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3502;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0L3WDtF3SbMNhm24rzk6l1W+stdjjufv7bq94tIsvCynLjenWqQnAO9heIZFNGwotHY+yFBPJUTvCcUobgpfRQClIpZ1hTGa0UHLHF2p2Ypgf9zFH60TiOhkf0Jgz9UctHCWQMfXVjExSP5Gz41hFdyBr8xfUB2MtDlD76D5SY7/ppNV5aMsR8zH/zRoh7Nodieu4SaJwCEGKA55T6o85SvvBWJimoIK3k5Co/3H1mA4JSPLFm8SZDiZoaHxk7Hx/6Ofb8Qo1s4Tmnjg+4JEM9qRp/5/21hGW8zZdcgNZVCMyNIShvwVKPYiZ/LqXIK1ULHKvckMvT2PrAI96NdeUSPFSAB2+VxZ2tcZ8fIgRXasC+wvqMsIPgsuzqL2zCMcS490zhbg+QeYkikQdF6XJBwmUyN8f68ZBGYSyOsbhBc=
Content-ID: <F9FBEAAE223E2F40BE62E8206C1F1923@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be755b5-560c-47d9-fa26-08d6debc75bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 13:50:33.4398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3502
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+Pj4gRGVzcGl0ZSB3aGF0IHdhcyBzYWlkIGJlZm9yZSB5b3UncmUgc3RpbGwgZG9pbmcgdGhp
bmdzIGEgMm5kIHRpbWUNCj4+PiBoZXJlIGp1c3QgYmVjYXVzZSBvZiBodm1lbXVsX3NlbmRfdm1f
ZXZlbnQoKSdzIG5lZWRzLCBldmVuDQo+Pj4gaWYgdGhhdCBmdW5jdGlvbiBlbmRzIHVwIGJhaWxp
bmcgcmlnaHQgYXdheS4NCj4+DQo+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGluZ3MgYXJl
IGRvbmUgMiB0aW1lcy4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbj8NCj4gDQo+IFlvdSBhZGQgY29k
ZSBhYm92ZSB0aGF0IGV4aXN0cyBhbHJlYWR5IGluIF9faHZtZW11bF9yZWFkKCkuDQo+IEV2ZW4g
d29yc2UsIF9faHZtZW11bF9yZWFkKCkgbWF5IG5vdCBuZWVkIGNhbGxpbmcgYXQgYWxsLCBpbg0K
PiB3aGljaCBjYXNlIHRoZXJlJ3Mgbm8gKGVtdWxhdGVkKSBtZW1vcnkgYWNjZXNzIGFuZCBoZW5j
ZQ0KPiBpbW8gdGhlcmUgc2hvdWxkbid0IGJlIGFueSBldmVudC4gUGx1cywganVzdCBsaWtlIGlu
IHRoZQ0KPiBodm1lbXVsX2xpbmVhcl90b19waHlzKCkgY2FzZSB0aGVyZSBtYXkgYmUgYW4gZXhj
ZXB0aW9uDQo+IHJhaXNlZCBieSB0aGUgZnVuY3Rpb24sIHlldCBqdXN0IGxpa2UgdGhlcmUgeW91
IGFsc28gZGlzY2FyZCB0aGUNCj4gcmV0dXJuIHZhbHVlIHNheWluZyBzbyB3aXRob3V0IGFsc28g
emFwcGluZyB0aGUgZXhjZXB0aW9uLg0KPiANCg0KSXNuJ3QgaXQgc2FmZXIgdG8gbW92ZSB0aGUg
aHZtZW11bF9zZW5kX3ZtX2V2ZW50KCkgZm9ybSANCmh2bWVtdWxfaW5zbl9mZXRjaCgpIHRvIF9f
aHZtZW11bF9yZWFkKCk/DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
