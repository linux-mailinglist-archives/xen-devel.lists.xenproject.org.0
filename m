Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702611628C7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 15:45:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4454-0002lX-Rk; Tue, 18 Feb 2020 14:42:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zMfY=4G=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j4453-0002lQ-Js
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 14:42:33 +0000
X-Inumbo-ID: e4e15710-525c-11ea-aa99-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::71c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4e15710-525c-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 14:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOz2KcCk/1GXz5e5/f74D/cYTmwJXRqvcv//yacV4qkTuIjfqYo8QjT5+4aHsVsVmsGM0bAY8q146ibMnmOpDrsTlmFDhCC1YkjKlnuXP0Hwz+IvxSqN1AuONUp4sY8+VFQ7ktvEXPzU2rpaYkT90Z7+Q1Jj27CjaX1ZoNBVPkFoFItjixA0Su/6L9G3NZreZjuG4juigVDZHKEieA59Q8En8lmH1BSWuqqGS5BZ0POyE85NQTdV3zsy8VFnQe+i6VHZGqhFMoIbpjUpK9QkWZBkiXwZj+JHus3piJk0e3hXLy+UtBt4n5lldjosDPm9QuTKQ8qJIy+LBnr7UN42Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLnThX5kwchkX3wMNXchjtafTQaS5rwoeD62/wE5e84=;
 b=k5uTW384PUYXJ83GsJyPW3LtjOl+whHhG6+UdULuX0+yWsZ4pq0QDkhPjGYO1tcKLPBnBSDiNeIY7/Z8hmXoNQ9LPlLCWYv40JRoZrLvLfuqrw9MbN9vqB42T2QRIL8s36nlZdNmmn0JuqiqxLYVj+HYehpq0/ZZHFVMOFgzfJ7IJa8+TxUZqb9eCDjWm5cZ5SeiiPGegpv6ot8wHW90CAO8ou+272K8TJ68K9C5jbaqgIAkPNoTqPmTKSWpOCu96fs54yO29Xs4utnoHGDviOdJUk7RAEUiLkecJtsPho4H21SdClY8Rv+K89m1M/LA3J1IvgIlGj85uqb/2rrOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLnThX5kwchkX3wMNXchjtafTQaS5rwoeD62/wE5e84=;
 b=vKO3XyTNCOPj62ZAS4I4oX6thFfdcnBkNB8XMRhrkT5ncd0kV0xBRNSSEjnBVCbYkzOLo2wzB5YHHvjyZQzVmX21DFO0+QDoPEz9eZKApkoCbR7XRq0Goz8tdC7SixvMFm9ZsGE3a7TgwNWJ0hystwp8nZVKP3csqS4ZnCZ6VeE=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3157.eurprd02.prod.outlook.com (10.170.223.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 14:42:30 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 14:42:30 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25 via Frontend Transport; Tue, 18 Feb 2020 14:42:29 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V2] x86/altp2m: Hypercall to set altp2m view
 visibility
Thread-Index: AQHV124xlaiLFBXa8kCbjgVBTXJ5w6gfiiMAgAFPFACAAEs0gA==
Date: Tue, 18 Feb 2020 14:42:30 +0000
Message-ID: <1fd4b6fc-f380-ac8e-4b3d-394d48885fb7@bitdefender.com>
References: <20200130130649.14538-1-aisaila@bitdefender.com>
 <e20d6574-0e76-acf8-8b33-fb5a4fce7908@suse.com>
 <695f304c-2968-66fe-5a33-14c81d980d18@bitdefender.com>
In-Reply-To: <695f304c-2968-66fe-5a33-14c81d980d18@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af407feb-22e0-4617-0025-08d7b480c820
x-ms-traffictypediagnostic: DB6PR02MB3157:|DB6PR02MB3157:
x-microsoft-antispam-prvs: <DB6PR02MB3157E2A379769CE0A67F2826AB110@DB6PR02MB3157.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(39850400004)(366004)(396003)(189003)(199004)(186003)(16526019)(5660300002)(66946007)(26005)(66476007)(316002)(66556008)(66446008)(64756008)(2906002)(16576012)(54906003)(6486002)(478600001)(7416002)(4744005)(86362001)(81156014)(8676002)(52116002)(6666004)(2616005)(956004)(6916009)(4326008)(81166006)(31686004)(8936002)(71200400001)(31696002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3157;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dbUCENAImaMXmTSgnrZYY4hroGx2RXJwKtCCxFiG517bJo7kUQrc3wUBorooKTatYCghGm3JuzSVAKJ4JwEA19WfFzAYq4B9j8X8RTv0FY4rSNzFB4EF2jdRruWL3koXlPNle/E2MgRZq50yfl5ny9YstTzHH8YdHYIZ/0NURTJgeL82i2nwt761qwfjvDIJDrcn18X/ZVVfJGfjy9Fwy+px6BrO7xlgbkVFIet8FznwbcojPbAZg4kSdjpnFdRzrp7KTplrjRxSR7MvpjlstcGikK0Lm2gp63UP8lHvFKG4XcjpBQ5DojIsY8tCo2RALir85woSP2+/ffDlSUcbk3tt6Z820zs7FiHVnNSMxS2wWSZ7V1SZ+DR91pe1GRKBWUBbwzhti6wwJh4W/WTrwrlFHYqU+8u9KotZE46zhwv0CC3BZkTHcqZFA+aWMr/U
x-ms-exchange-antispam-messagedata: k+S+v+PNrHUdxwvlS3u4adUVw0+6UmpzsTQ1UktoTstUbfDx1GQ8j+qNmkby1cIypMhXT5CRGbyrLHGk4E18eMeEb1mkb830+QPW74yr+MFm/mr72meSHYx1jj6s77jCsqPfVQdAzLewnAtl2eV3ug==
x-ms-exchange-transport-forked: True
Content-ID: <F7E7DE77F272EA4E94C50B1CC9B12E44@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af407feb-22e0-4617-0025-08d7b480c820
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 14:42:30.4997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hYdCHv6xjvG5tQlGeWc9N7h4c1qYq3z+0eV298xw2rIWwV0is+MkQ4JZFxyY4UVDUvrIaEtQMs2jANhwPKyMJONp3qdIr6d0G/1rWu24Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3157
Subject: Re: [Xen-devel] [PATCH V2] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYw0KPj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9oYXAvaGFwLmMNCj4+PiBAQCAtNDg4LDggKzQ4OCwxNyBAQCBpbnQgaGFwX2VuYWJs
ZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkNCj4+PiAgICAgICAgICAgICAgICBnb3RvIG91
dDsNCj4+PiAgICAgICAgICAgIH0NCj4+PiAgICANCj4+PiArICAgICAgICBpZiAoIChkLT5hcmNo
LmFsdHAybV93b3JraW5nX2VwdHAgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKSkgPT0gTlVMTCApDQo+
Pj4gKyAgICAgICAgew0KPj4+ICsgICAgICAgICAgICBydiA9IC1FTk9NRU07DQo+Pj4gKyAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KPj4+ICsgICAgICAgIH0NCj4+DQo+PiBJc24ndCB0aGVyZSBhIHBy
ZS1leGlzdGluZyBlcnJvciBoYW5kbGluZyBpc3N1ZSBoZXJlIHdoaWNoIHlvdQ0KPj4gd2lkZW4s
IGluIHRoYXQgbGF0ZXIgZW5jb3VudGVyZWQgZXJyb3JzIGRvbid0IGNhdXNlIGNsZWFuIHVwDQo+
PiBvZiB3aGF0IGhhZCBhbHJlYWR5IHN1Y2NlZWRlZCBiZWZvcmU/DQo+IA0KPiBJdCBzZWVtcyBu
b24gb2YgdGhlIGVycm9ycyBwZXJmb3JtIGEgY2xlYW51cC4gSXQgbWlnaHQgYmUgYmV0dGVyIHRv
IGhhdmUNCj4gYSBnZW5lcmFsIGNsZWFudXAgZG9uZSBhdCAib3V0OiIgaWYgKCAhcnYgKSBhbmQg
dGhlbiBjaGVjayB3aGF0IHNob3VsZA0KPiBiZSAicDJtX3RlYXJkb3duKCkiIG9yICJmcmVlX3hl
bmhlYXBfcGFnZSgpIi4NCj4gDQoNCkkndmUgbG9va2VkIGFyb3VuZCBmb3IgdGhpcyBhbmQgaXQg
aXMgaGFuZGxlZCBpbiBhcmNoX2RvbWFpbl9jcmVhdGUoKS4NCklmIGh2bV9kb21haW5faW5pdGlh
bGlzZSgpIGZhaWxzIHRoZW4gcGFnaW5nX2ZpbmFsX3RlYXJkb3duKCkgaXMgY2FsbGVkIA0KYW5k
IGluIHRoZSBlbmQgaGFwX2ZpbmFsX3RlYXJkb3duKCkgdGFrZXMgY2FyZSBvZiBjbGVhbmluZyB1
cC4NCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
