Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C67818E3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubn7-00069q-IB; Mon, 05 Aug 2019 12:08:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hubn6-00069j-Cx
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:08:40 +0000
X-Inumbo-ID: c1e04a66-b779-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c1e04a66-b779-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 12:08:38 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 12:08:33 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 12:08:01 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 12:08:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUivIlwfKrg6MkFKbzRKrQbqhDRqHt7Lgi05ihGfxVsJCteqqj6J4qQpmfBce3tP6kTulMu6D6Srksq4yaMTB6fIBhfu61Edv28YZZsjr6CQqB+0k/isBnJbCo7FEioDetR1oO48JpQFwJiZvkUEwIo+5uxZPsI9mBYmdEvApq4zfrETKYMag2A9n+FdrGhFNTVhaD7jr3Yx5ze0NC9T5VIls2GY7/FPn8m4bpPdX8cYa6AX3Y0/ECsIKcR1o7XCAAeBrqUtra5HweSVfGNz1fEyfut5fAmtR1EDRvJefVxDkf0z9ohM20lpRRylups7iIMlxzEDC/5Bb91xUmqAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91n8/oQJZAIroRMZyq1cqSJzUiihs3CCxMRbozY273M=;
 b=RhNwaxlqGxZ4jJo0CLKMqY8KkmP/YOxzCmb7pia6npD++4ONNINK3KH6bIF5LzEyxYAA9W+Ah71u6Vt7rpJ9H3BxKw6AxmlStQcRDUBP05UgH7mgumQ+eIzDU0YBVJ48pg9UbJRYhxNupRMl4HfmgiHpq4oiDBpW3A+2umEfJgo1jTfSD0DZNMhq0OlWydX+T4z5kpr4LxHa31LeP8lnHrJgD1E/iHG9eyMXiVaGsDKXhcgmWIB4cifmLAO1zeuPY8cyeygHM6xWMRDuWKnDklDWbVN0+GVWNrIhxcfTo6e5l/21Jj7VizfArObHEC8mwZSwrzzCATfCMUGcZT67fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3085.namprd18.prod.outlook.com (20.179.21.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 12:07:59 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 12:07:59 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 14/16] x86/microcode: Synchronize late microcode
 loading
Thread-Index: AQHVSFKr3nOgmxjRgEC58Iy/dUUpk6bsfDOA
Date: Mon, 5 Aug 2019 12:07:59 +0000
Message-ID: <3eab0be7-fa54-d34b-c0a8-d6e7452cee9d@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-15-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-15-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0029.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::42) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27f62482-cf28-45b7-6398-08d7199d8ef2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3085; 
x-ms-traffictypediagnostic: MN2PR18MB3085:
x-microsoft-antispam-prvs: <MN2PR18MB3085CF55B586E0A741637A7DB3DA0@MN2PR18MB3085.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(6246003)(386003)(14444005)(6436002)(11346002)(446003)(229853002)(52116002)(99286004)(26005)(2616005)(256004)(186003)(4326008)(80792005)(2906002)(478600001)(66066001)(14454004)(486006)(3846002)(6116002)(64756008)(36756003)(66446008)(66556008)(66476007)(66946007)(6916009)(31686004)(76176011)(8936002)(31696002)(25786009)(86362001)(7736002)(305945005)(5660300002)(81156014)(8676002)(81166006)(68736007)(7416002)(476003)(6486002)(71200400001)(71190400001)(53936002)(6506007)(54906003)(102836004)(6512007)(53546011)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3085;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6cLMETeEsTheRSR9U3u8QFuRN3DSf8RnIYMKozT8yyy9J986t/BFFRsvwPC2tynkiX+FmC2RX9fPexuaZuYNNdnuZnSiCgmaOEjTSJqxHiSFF9zS5VPN5+Qw1rCzSTnU6SLsPeRr5d1tv2EU9wDd3eXfIUVdya0dT+dF2tWbJh47Iy8MEceBWmy0xg5GRDR6+hf//jnETGj7A3J25lfweBbRonLTCf96iyWNpkYZuhOJ47NJX4HPCJSFqOnHjmCOqqx+y+05mb1INxTFUyoszTMqXFFAEzB40WwI0dVIfaOta2tqpgqFVHH5j2pfGBoSFdBsvu2aO6LFXkcWTXPfvdX03VhRtDo2IwArW6MlmswT/O0fPAVzyKIIwd1gaxoO+yDKAZi6WytoN2qESGbcVG6stnmSky/SuOliJpH32Bk=
Content-ID: <FA90A71BEC0AF24E8C3C2CE9F4863329@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f62482-cf28-45b7-6398-08d7199d8ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 12:07:59.7193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3085
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 14/16] x86/microcode: Synchronize late
 microcode loading
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
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IEBAIC0yODMsMzcgKzM0NSwx
MDUgQEAgc3RhdGljIGludCBtaWNyb2NvZGVfdXBkYXRlX2NwdShjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpwYXRjaCkNCj4gICAgICAgcmV0dXJuIGVycjsNCj4gICB9DQo+ICAgDQo+IC1z
dGF0aWMgbG9uZyBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKnBhdGNoKQ0KPiArc3RhdGljIGlu
dCBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKnBhdGNoKQ0KPiAgIHsNCj4gLSAgICB1bnNpZ25l
ZCBpbnQgY3B1Ow0KPiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7
DQo+ICsgICAgdW5zaWduZWQgaW50IGNwdV9uciA9IG51bV9vbmxpbmVfY3B1cygpOw0KPiArICAg
IGludCByZXQ7DQo+ICAgDQo+IC0gICAgLyogc3RvcmUgdGhlIHBhdGNoIGFmdGVyIGEgc3VjY2Vz
c2Z1bCBsb2FkaW5nICovDQo+IC0gICAgaWYgKCAhbWljcm9jb2RlX3VwZGF0ZV9jcHUocGF0Y2gp
ICYmIHBhdGNoICkNCj4gKyAgICAvKiBNYXJrIGxvYWRpbmcgYW4gdWNvZGUgaXMgaW4gcHJvZ3Jl
c3MgKi8NCj4gKyAgICBjbXB4Y2hnKCZsb2FkaW5nX3N0YXRlLCBMT0FESU5HX0VYSVRFRCwgTE9B
RElOR19FTlRFUkVEKTsNCj4gKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X2NhbGxpbl9t
YXApOw0KPiArICAgIHJldCA9IHdhaXRfZm9yX2NvbmRpdGlvbih3YWl0X2NwdV9jYWxsaW4sICh2
b2lkICopKHVuc2lnbmVkIGxvbmcpY3B1X25yLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBNSUNST0NPREVfQ0FMTElOX1RJTUVPVVRfVVMpOw0KDQpPbmUgbW9yZSBtaW5vciByZXF1
ZXN0IC0ganVzdCBsaWtlIHlvdSBkbyBoZXJlLCAuLi4NCg0KPiArICAgIGlmICggcmV0ICkNCj4g
ICAgICAgew0KPiAtICAgICAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7DQo+IC0gICAg
ICAgIG1pY3JvY29kZV91cGRhdGVfY2FjaGUocGF0Y2gpOw0KPiAtICAgICAgICBzcGluX3VubG9j
aygmbWljcm9jb2RlX211dGV4KTsNCj4gLSAgICAgICAgcGF0Y2ggPSBOVUxMOw0KPiArICAgICAg
ICBjbXB4Y2hnKCZsb2FkaW5nX3N0YXRlLCBMT0FESU5HX0VOVEVSRUQsIExPQURJTkdfQUJPUlRF
RCk7DQo+ICsgICAgICAgIHJldHVybiByZXQ7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICBpZiAo
IG1pY3JvY29kZV9vcHMtPmVuZF91cGRhdGUgKQ0KPiAtICAgICAgICBtaWNyb2NvZGVfb3BzLT5l
bmRfdXBkYXRlKCk7DQo+ICsgICAgLyoNCj4gKyAgICAgKiBMb2FkIG1pY3JvY29kZSB1cGRhdGUg
b24gb25seSBvbmUgbG9naWNhbCBwcm9jZXNzb3IgcGVyIGNvcmUsIG9yIGluDQo+ICsgICAgICog
QU1EJ3MgdGVybSwgb25lIGNvcmUgcGVyIGNvbXB1dGUgdW5pdC4gVGhlIG9uZSB3aXRoIHRoZSBs
b3dlc3QgdGhyZWFkDQo+ICsgICAgICogaWQgYW1vbmcgYWxsIHNpYmxpbmdzIGlzIGNob3NlbiB0
byBwZXJmb3JtIHRoZSBsb2FkaW5nLg0KPiArICAgICAqLw0KPiArICAgIGlmICggKGNwdSA9PSBj
cHVtYXNrX2ZpcnN0KHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkpICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGFuaWNrZWQgPSAwOw0KPiArICAgICAg
ICBib29sIG1vbml0b3I7DQo+ICsgICAgICAgIHVuc2lnbmVkIGludCBkb25lOw0KPiArICAgICAg
ICB1bnNpZ25lZCBsb25nIHRpY2sgPSAwOw0KPiAgIA0KPiAtICAgIGNwdSA9IGNwdW1hc2tfbmV4
dChzbXBfcHJvY2Vzc29yX2lkKCksICZjcHVfb25saW5lX21hcCk7DQo+IC0gICAgaWYgKCBjcHUg
PCBucl9jcHVfaWRzICkNCj4gLSAgICAgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9j
cHUoY3B1LCBkb19taWNyb2NvZGVfdXBkYXRlLCBwYXRjaCk7DQo+ICsgICAgICAgIHJldCA9IG1p
Y3JvY29kZV9vcHMtPmFwcGx5X21pY3JvY29kZShwYXRjaCk7DQo+ICsgICAgICAgIGlmICggIXJl
dCApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUyOw0KPiAg
IA0KPiAtICAgIC8qIEZyZWUgdGhlIHBhdGNoIGlmIG5vIENQVSBoYXMgbG9hZGVkIGl0IHN1Y2Nl
c3NmdWxseS4gKi8NCj4gLSAgICBpZiAoIHBhdGNoICkNCj4gLSAgICAgICAgbWljcm9jb2RlX2Zy
ZWVfcGF0Y2gocGF0Y2gpOw0KPiArICAgICAgICAgICAgYXRvbWljX2luYygmY3B1X3VwZGF0ZWQp
Ow0KPiArICAgICAgICAgICAgLyogUHJvcGFnYXRlIHJldmlzaW9uIG51bWJlciB0byBhbGwgc2li
bGluZ3MgKi8NCj4gKyAgICAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUyLCBwZXJfY3B1KGNwdV9z
aWJsaW5nX21hc2ssIGNwdSkpDQo+ICsgICAgICAgICAgICAgICAgcGVyX2NwdShjcHVfc2lnLCBj
cHUyKS5yZXYgPSB0aGlzX2NwdShjcHVfc2lnKS5yZXY7DQo+ICsgICAgICAgIH0NCj4gICANCj4g
LSAgICByZXR1cm4gMDsNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogVGhlIGZpcnN0IENQ
VSByZWFjaGluZyBoZXJlIHdpbGwgbW9uaXRvciB0aGUgcHJvZ3Jlc3MgYW5kIGVtaXQNCj4gKyAg
ICAgICAgICogd2FybmluZyBtZXNzYWdlIGlmIHRoZSBkdXJhdGlvbiBpcyB0b28gbG9uZyAoZS5n
LiA+MSBzZWNvbmQpLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgbW9uaXRvciA9ICFhdG9t
aWNfaW5jX3JldHVybigmY3B1X291dCk7DQo+ICsgICAgICAgIGlmICggbW9uaXRvciApDQo+ICsg
ICAgICAgICAgICB0aWNrID0gcmR0c2Nfb3JkZXJlZCgpOw0KPiArDQo+ICsgICAgICAgIC8qIFdh
aXRpbmcgZm9yIGFsbCBjb3JlcyBvciBjb21wdXRpbmcgdW5pdHMgZmluaXNoaW5nIHVwZGF0ZSAq
Lw0KPiArICAgICAgICBkb25lID0gYXRvbWljX3JlYWQoJmNwdV9vdXQpOw0KPiArICAgICAgICB3
aGlsZSAoIHBhbmlja2VkICYmIGRvbmUgIT0gbnJfY29yZXMgKQ0KPiArICAgICAgICB7DQo+ICsg
ICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICogRHVyaW5nIGVhY2ggdGltZW91dCBpbnRl
cnZhbCwgYXQgbGVhc3QgYSBDUFUgaXMgZXhwZWN0ZWQgdG8NCj4gKyAgICAgICAgICAgICAqIGZp
bmlzaCBpdHMgdXBkYXRlLiBPdGhlcndpc2UsIHNvbWV0aGluZyBnb2VzIHdyb25nLg0KPiArICAg
ICAgICAgICAgICoNCj4gKyAgICAgICAgICAgICAqIE5vdGUgdGhhdCBSRFRTQyAoaW4gd2FpdF9m
b3JfY29uZGl0aW9uKCkpIGlzIHNhZmUgZm9yIHRocmVhZHMgdG8NCj4gKyAgICAgICAgICAgICAq
IGV4ZWN1dGUgd2hpbGUgd2FpdGluZyBmb3IgY29tcGxldGlvbiBvZiBsb2FkaW5nIGFuIHVwZGF0
ZS4NCj4gKyAgICAgICAgICAgICAqLw0KPiArICAgICAgICAgICAgaWYgKCB3YWl0X2Zvcl9jb25k
aXRpb24oJndhaXRfY3B1X2NhbGxvdXQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodm9pZCAqKSh1bnNpZ25lZCBsb25nKShkb25lICsgMSksDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNSUNST0NPREVfVVBEQVRFX1RJTUVPVVRfVVMpICYm
DQoNCi4uLiBjb3VsZCB5b3UgcGxlYXNlIG9taXQgdGhlIHJlZHVuZGFudCAmIG9uIHRoZSBmaXJz
dCBhcmd1bWVudCBoZXJlPw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
