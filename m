Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FF7FDC5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:44:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZhB-0004mc-Q8; Fri, 02 Aug 2019 15:42:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZhA-0004mW-3j
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:42:16 +0000
X-Inumbo-ID: 189a4349-b53c-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 189a4349-b53c-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:42:14 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:42:11 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 15:40:56 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 15:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6FGWiaLJrAAppVw+jsyOgqdjdwkqvSjvx560zFTm2M/N6t/Rs1ccz27zCZaCoUf54TkZ0fgFPuGoV1KdZ3mJ593DFc4hjxwc0Ea6LeyhsLtdATnMajOhcKSShRFR2SQdBRop+Muj+VYliyej/NS7IrhfhWQD6xjzAntTIcNJIjNeK6qUQVuXyK8jxUdwcu6TT9C7Bm+X0DjugrwD7nHEmsat6nzUAGgbZMj7hfRF2zyV3HgSPTDymH0SVyn4HpHx7KvthWJsnqOs0pqNB9lRisdBlxHKG8wzAf0Cb3EV7AWmpaozWKPuduneDjA5aMXowU9IZkzSUL6mMQLA6kacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlLnlALvrrjJwn7GRt3aA5GiUVBhFUlddmc5wIf9HY8=;
 b=Qy+qBNjvqbw08A+etCYLxuMR5YvB0NpYpVkWrGbf87U+ZAKc3TFGx+bjzhdzm92d8szFMFZHIqeuSi2nGFa5g6N0nTqT61lG6JK1textDB3KVvhGujdBhVZlxT9rwRBapIYwhC7q8ZX5GvImubM4lYuBZD1nclI/ZoQQB1VDipVwQqgr7S8+4WTxEkQs+9U9fQQIyxl6dUBrIL4Fn4nJJq1q+l/jPchOSZLnAsnAhqMblsYuP8L4cSz9VXruY1C3kI8u6vYhbi7IYvUZ3x+un+G66c2vYZjb9zBMQIRFGR7zQ0RGOC7IEqIKpJH5AKGbQ/db+FgykdPYa2/6PdeSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2363.namprd18.prod.outlook.com (20.179.71.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 15:40:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 15:40:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 12/16] microcode: split out apply_microcode() from
 cpu_request_microcode()
Thread-Index: AQHVSFKxe9TG4/M45Uuu/98IT/ohCqboAK8A
Date: Fri, 2 Aug 2019 15:40:55 +0000
Message-ID: <2c758b76-8f01-f8d0-1fc9-95b164e111b3@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-13-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-13-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::35) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02f1bd6e-3531-4f97-3396-08d7175fce97
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2363; 
x-ms-traffictypediagnostic: DM6PR18MB2363:
x-microsoft-antispam-prvs: <DM6PR18MB2363B307B63B683A0A1DAF5CB3D90@DM6PR18MB2363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(189003)(199004)(486006)(102836004)(52116002)(53546011)(53936002)(11346002)(2616005)(446003)(6512007)(6436002)(6486002)(386003)(476003)(76176011)(6506007)(2906002)(229853002)(68736007)(31686004)(4326008)(54906003)(81156014)(25786009)(71200400001)(71190400001)(81166006)(316002)(80792005)(6246003)(8936002)(7736002)(478600001)(6116002)(3846002)(256004)(14444005)(8676002)(305945005)(26005)(99286004)(14454004)(86362001)(36756003)(186003)(66556008)(64756008)(66946007)(31696002)(66446008)(5660300002)(66476007)(6916009)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2363;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: thJ5dbgQ2xRRvhaz06XbZkghAL4g3uH3YQRdlGq3wi4rFjSkZfzIVYkeyslXAmTGtpI72kaFHrp6yqSusi+FOCn6tbXLIJ191q6wbdax57qU1R0QFQge2p9BNYwe/5pn1JvnfG/mT3k+oLgdacjHAk20j68YZqrxHfmw9vz9veb3CZIjq1vf1tcKYtxtKmmYlSkze8Y+NncC+j/CRf0i75fDkA+GVDny3AufUNCqu0pM3vG/Je+XUHXZTbQ3U7IdXm5EJJN7DUCTmMUqh3Wpet8tp5EZijqwQrwQ+u83HmStXDbZGEcPHZAX1BiW1RvGej98dLmNd+ai1zaGoqDKr60bh2IqfzQCBlSDlRXrWeYlk605LGNzbbaCHDAv2zGcHOy5EeNE8wiaT0brU2sk82ooZLxmmyDKZYRDfRm/rqg=
Content-ID: <3449AB74624CA047A828B0452A2C0AA4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f1bd6e-3531-4f97-3396-08d7175fce97
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:40:55.4070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2363
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 12/16] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMNCj4gQEAgLTE4
OSwxMiArMTg5LDIwIEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWljcm9jb2RlX211dGV4KTsN
Cj4gICANCj4gICBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgY3B1X3NpZ25hdHVyZSwgY3B1X3NpZyk7
DQo+ICAgDQo+IC1zdHJ1Y3QgbWljcm9jb2RlX2luZm8gew0KPiAtICAgIHVuc2lnbmVkIGludCBj
cHU7DQo+IC0gICAgdWludDMyX3QgYnVmZmVyX3NpemU7DQo+IC0gICAgaW50IGVycm9yOw0KPiAt
ICAgIGNoYXIgYnVmZmVyWzFdOw0KPiAtfTsNCj4gKy8qDQo+ICsgKiBSZXR1cm4gYSBwYXRjaCB0
aGF0IGNvdmVycyBjdXJyZW50IENQVS4gSWYgdGhlcmUgYXJlIG11bHRpcGxlIHBhdGNoZXMsDQo+
ICsgKiByZXR1cm4gdGhlIG9uZSB3aXRoIHRoZSBoaWdoZXN0IHJldmlzaW9uIG51bWJlci4gUmV0
dXJuIGVycm9yIElmIG5vDQo+ICsgKiBwYXRjaCBpcyBmb3VuZCBhbmQgYW4gZXJyb3Igb2NjdXJz
IGR1cmluZyB0aGUgcGFyc2luZyBwcm9jZXNzLiBPdGhlcndpc2UNCj4gKyAqIHJldHVybiBOVUxM
Lg0KPiArICovDQo+ICtzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX3Bh
cnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGxlbikNCg0KQnR3IC0geW91J2QgaGF2
ZSBsZXNzIGlzc3VlcyB3aXRoIGxpbmUgbGVuZ3RoIGlmIHlvdSBvbWl0dGVkIHRoZQ0KIm1pY3Jv
Y29kZV8iIHByZWZpeCBmcm9tIHN0YXRpYyBmdW5jdGlvbnMuDQoNCj4gQEAgLTI1MCw0OSArMjUx
LDg4IEBAIGJvb2wgbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNo
ICpwYXRjaCkNCj4gICAgICAgcmV0dXJuIHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlu
dCBtaWNyb2NvZGVfdXBkYXRlX2NwdShjb25zdCB2b2lkICpidWYsIHNpemVfdCBzaXplKQ0KPiAr
LyoNCj4gKyAqIExvYWQgYSBtaWNyb2NvZGUgdXBkYXRlIHRvIGN1cnJlbnQgQ1BVLg0KPiArICoN
Cj4gKyAqIElmIG5vIHBhdGNoIGlzIHByb3ZpZGVkLCB0aGUgY2FjaGVkIHBhdGNoIHdpbGwgYmUg
bG9hZGVkLiBNaWNyb2NvZGUgdXBkYXRlDQo+ICsgKiBkdXJpbmcgQVBzIGJyaW5ndXAgYW5kIENQ
VSByZXN1bWluZyBmYWxscyBpbnRvIHRoaXMgY2FzZS4NCj4gKyAqLw0KPiArc3RhdGljIGludCBt
aWNyb2NvZGVfdXBkYXRlX2NwdShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkN
Cj4gICB7DQo+IC0gICAgaW50IGVycjsNCj4gLSAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3By
b2Nlc3Nvcl9pZCgpOw0KPiAtICAgIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmcGVyX2Nw
dShjcHVfc2lnLCBjcHUpOw0KPiArICAgIGludCBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0
X2NwdV9pbmZvKCZ0aGlzX2NwdShjcHVfc2lnKSk7DQo+ICsNCj4gKyAgICBpZiAoIHVubGlrZWx5
KGVycikgKQ0KPiArICAgICAgICByZXR1cm4gZXJyOw0KPiAgIA0KPiAgICAgICBzcGluX2xvY2so
Jm1pY3JvY29kZV9tdXRleCk7DQo+ICAgDQo+IC0gICAgZXJyID0gbWljcm9jb2RlX29wcy0+Y29s
bGVjdF9jcHVfaW5mbyhzaWcpOw0KPiAtICAgIGlmICggbGlrZWx5KCFlcnIpICkNCj4gLSAgICAg
ICAgZXJyID0gbWljcm9jb2RlX29wcy0+Y3B1X3JlcXVlc3RfbWljcm9jb2RlKGJ1Ziwgc2l6ZSk7
DQo+ICsgICAgaWYgKCBwYXRjaCApDQo+ICsgICAgew0KPiArICAgICAgICAvKg0KPiArICAgICAg
ICAgKiBJZiBhIHBhdGNoIGlzIHNwZWNpZmllZCwgaXQgc2hvdWxkIGhhcyBuZXdlciByZXZpc2lv
biB0aGFuDQo+ICsgICAgICAgICAqIHRoYXQgb2YgdGhlIHBhdGNoIGNhY2hlZC4NCj4gKyAgICAg
ICAgICovDQo+ICsgICAgICAgIGlmICggbWljcm9jb2RlX2NhY2hlICYmDQo+ICsgICAgICAgICAg
ICAgbWljcm9jb2RlX29wcy0+Y29tcGFyZV9wYXRjaChwYXRjaCwgbWljcm9jb2RlX2NhY2hlKSAh
PSBORVdfVUNPREUgKQ0KDQpXaGlsZSBJIHNlZSB0aGF0IHlvdSd2ZSB0YWtlbiBjYXJlIG9mIHRo
ZSBvbmUgY2FzZSBpbiBJbnRlbCBzcGVjaWZpYw0KY29kZSwgdGhpcyBpcyBhZ2FpbiBhIGNhc2Ug
d2hlcmUgSSBkb24ndCB0aGluayB5b3UgY2FuIHZhbGlkbHkgY2FsbA0KdGhpcyBob29rIGluIHRo
ZSBJbnRlbCBjYXNlLiBBbGJlaXQgbWF5YmUgaXQgaXMgb2theSwgcHJvdmlkZWQgdGhhdA0KdGhl
IGNhbGxlciBoYXMgYWxyZWFkeSB2ZXJpZmllZCBpdCBhZ2FpbnN0IHRoZSBDUFUgc2lnbmF0dXJl
LiBUaGVuDQphZ2FpbiBJIHdvbmRlciB3aHkgdGhpcyBjaGVjayBnZXRzIGRvbmUgaGVyZSByYXRo
ZXIgdGhhbiBpbiB0aGUNCmNhbGxlciAobmV4dCB0byB0aGF0IG90aGVyIGNoZWNrKSBhbnl3YXku
IEFmYWljcyB0aGlzIHdheSB5b3UnZA0KYWxzbyBhdm9pZCByZS1jaGVja2luZyBvbiBldmVyeSBD
UFUgYSBDUFUtaW5kZXBlbmRlbnQgcHJvcGVydHkuDQoNCj4gLXN0YXRpYyBsb25nIGRvX21pY3Jv
Y29kZV91cGRhdGUodm9pZCAqX2luZm8pDQo+ICtzdGF0aWMgbG9uZyBkb19taWNyb2NvZGVfdXBk
YXRlKHZvaWQgKnBhdGNoKQ0KPiAgIHsNCj4gLSAgICBzdHJ1Y3QgbWljcm9jb2RlX2luZm8gKmlu
Zm8gPSBfaW5mbzsNCj4gLSAgICBpbnQgZXJyb3I7DQo+IC0NCj4gLSAgICBCVUdfT04oaW5mby0+
Y3B1ICE9IHNtcF9wcm9jZXNzb3JfaWQoKSk7DQo+ICsgICAgdW5zaWduZWQgaW50IGNwdTsNCj4g
ICANCj4gLSAgICBlcnJvciA9IG1pY3JvY29kZV91cGRhdGVfY3B1KGluZm8tPmJ1ZmZlciwgaW5m
by0+YnVmZmVyX3NpemUpOw0KPiAtICAgIGlmICggZXJyb3IgKQ0KPiAtICAgICAgICBpbmZvLT5l
cnJvciA9IGVycm9yOw0KPiArICAgIC8qIHN0b3JlIHRoZSBwYXRjaCBhZnRlciBhIHN1Y2Nlc3Nm
dWwgbG9hZGluZyAqLw0KDQpOaXQ6IENvbW1lbnRzIHNob3VsZCBzdGFydCB3aXRoIGFuIHVwcGVy
Y2FzZSBsZXR0ZXIuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
