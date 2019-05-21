Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D0248DB
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 09:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSyzx-0005R4-61; Tue, 21 May 2019 07:15:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwKE=TV=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hSyzv-0005Qz-Gj
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 07:15:43 +0000
X-Inumbo-ID: 3d22b789-7b98-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::70f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d22b789-7b98-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ8whV13mOugv+U/nz6rxtT8twVwH3F59cHg4pmR+bk=;
 b=Ag7MO60BTSXt2efUZJns+iJsDsbbC5Crcem+OskXk/fPojAWUdOapNZWrN28Am/3WthZRa105zoNh8lE4Av+z2ZHW8wxmLt1M7mCYNpS7mmzY8gJV7FZBpqtdcuUVhSv/kr0qjPhjmPzq7HIa05QL9NZknve2ueEFPgE6JrIgpY=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3582.eurprd02.prod.outlook.com (52.134.11.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 07:15:38 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 07:15:38 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
Thread-Index: AQHU+qnahqk7Qfv5gU6tW7kXrs6RHqZLY84AgAFy0QCADHDhgP//0PEAgBw8MoA=
Date: Tue, 21 May 2019 07:15:38 +0000
Message-ID: <3f0aa0e2-4a25-9d98-06ce-724882715d23@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
 <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
 <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
 <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
In-Reply-To: <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9909d1f-2114-435d-179b-08d6ddbc2000
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3582; 
x-ms-traffictypediagnostic: VI1PR0202MB3582:|VI1PR0202MB3582:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0202MB3582C3E57CBF776F9DFA96D6AB070@VI1PR0202MB3582.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(396003)(136003)(346002)(189003)(199004)(8676002)(73956011)(6916009)(186003)(53936002)(6486002)(66556008)(6436002)(102836004)(66446008)(64756008)(66476007)(66066001)(66946007)(81166006)(7736002)(8936002)(305945005)(68736007)(6306002)(11346002)(81156014)(6506007)(386003)(6512007)(53546011)(478600001)(25786009)(446003)(71200400001)(71190400001)(31686004)(36756003)(52116002)(3846002)(6116002)(99286004)(486006)(2616005)(476003)(5660300002)(4744005)(86362001)(966005)(4326008)(76176011)(6246003)(316002)(14454004)(2906002)(26005)(31696002)(256004)(229853002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3582;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I1PGR9rCxbWwxDV0ZqDdUGiASjWx9XrQeujqlgXK7yf0GolcPV4bLlmccPKusPZ2dVFiwtyOl/Ow4p+HbkUcfHoNcBZdqPrkKqGI0MACfBj4ucbHVoquGqgduS3W/kBEqkEbhI/lH0g/8/m2PGwAAvvjpD5zsORhD4g4fXTzHcS+enAGs46lmbMq7j/HLLNRpRXZlZpJBtFvrx/1vz0TXNKwv+heJPWQ9vgnZtTQwiu+0citq5OL9hW3K+R/iMMbwQRvDjhKs0YQ/lFtReiyC4Y48Yq6Mr8P+oxiXt/OqP+QbHs73iWVsFaOG52IZFP8ZGx44Ux5QrHTl2XR+nlRU2y3NHfN9aHCPfcXNqyfDdMoqqPy7+l3KW7RIzWpdHVAn4YBG4qwvFrAu58q7Y/WBT0OibsAJCW+9HhrS6HjaXQ=
Content-ID: <65C6590AAEC44D4A9A59480E5A8BA187@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9909d1f-2114-435d-179b-08d6ddbc2000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 07:15:38.3734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3582
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLA0KDQpEaWQgeW91IGhhdmUgdGltZSB0byBsb29rIGF0IHRoaXMgcGF0Y2g/DQoN
ClJlZ2FyZHMsDQpBbGV4DQoNCk9uIDAzLjA1LjIwMTkgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+PiBPbiAwMy4wNS4xOSBhdCAwOTo1MywgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3
cm90ZToNCj4+IE9uIDI1LjA0LjIwMTkgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IEl0
IGlzIGFuIGlzc3VlIGFueXdheSB0aGF0IGEgY2hhbmdlIGlzDQo+Pj4gbWFkZSB3aXRob3V0IHNh
eWluZyB3aHkgdGhlIG5ldyBiZWhhdmlvciBwcmVmZXJhYmxlIG92ZXINCj4+PiB0aGUgY3VycmVu
dCBvbmUuDQo+Pg0KPj4gU28gaXMgdGhlcmUgYSB3YXkgdG8gY29udGludWUgd2l0aCB0aGlzPw0K
PiANCj4gV2h5IG5vdCAtIEkndmUgbm90IHNhaWQgSSdtIGFnYWluc3QsIEkndmUganVzdCBhc2tl
ZCBmb3IgYW4gaW1wcm92ZWQNCj4gZGVzY3JpcHRpb24uIE9mIGNvdXJzZSwgaWYgaXQgdHVybnMg
b3V0IHRoZSBjaGFuZ2UgaXMgZG9uZSAianVzdCBpbg0KPiBjYXNlIiwgSSdtIG5vdCBzdXJlIEkg
c2VlIG11Y2ggdmFsdWUuIEJ1dCBhcyB5b3Ugc2F5LCBpdCdzIGZpcnN0IGFuZA0KPiBmb3JlbW9z
dCBHZW9yZ2UgdG8ganVkZ2UuDQo+IA0KPiBKYW4NCj4gDQo+IA0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcg
bGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
