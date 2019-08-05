Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890A816EF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 12:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hua6H-0006Ju-8i; Mon, 05 Aug 2019 10:20:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hua6F-0006Jp-Rz
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:20:19 +0000
X-Inumbo-ID: 9f00071a-b76a-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f00071a-b76a-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 10:20:18 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 10:20:11 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 10:19:56 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 10:19:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1svBSW8/zxkKkRsyf4YQZyhW/ijNSNXXW75uAfUMX6WIcSBPn2Js1eGaQ4ndkGHjJar6sqPc87zGaUyWv/YgW7GeI/UP9h/LAgtzLLWeMhEhcihkc7r7wpVIVz33Cmttaxt3Fu/tH4VuvhYNXGq6d1CW/AqUM+hRyS/kKHtodOwWdTBf2O2JrS2qhLP3ObbW9C4XKOE+eZEpHzlmD0ZbF8hz7GKOKGlCxe7SMmxINiXYaQ15jWcy7MldoeRmqHE1xyVvHBXbYE6X6R39+iUAzwk3i1bjUSZ15BHwpIqCiyLagmGm/G+R+jqFRuk7AaWyuykNfxGukajOYaDDJc/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HobMlxMgNTJ2Q43lmj4Iy8oOKS13AbNMgOHIiRfx6AQ=;
 b=TAi9aiRpfvlPZu/t6xjFDA0hUTALr/alVgYbUGNHlLEnnSKXI+L8o4ohFEpFnmIdyADZDjZgHBJ/k7g0RTmIHFVPrg1BgKyX+nEZ4aDsXMTQndT/48m2ZgyQfFpbfzNkOJFxuA6gsWc1GHOpScnKiSnQqsKBTZZDNswRm3WvK4BRFa47jJTbXl4j+ArE+W5X1G2DsJ534+oCof1HfdrPHSIvqRs4L5dxzvTfdILKERd70Ok5EP/QaBnsVSFE+9HPJEheMkV04g3g7elbjkC5KuKvt7XV/7G9n+EubRIq3VUqs2OADF02Qr7uoV8hmsdA1US1RTyTJGnbUW2PIILjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3037.namprd18.prod.outlook.com (20.179.81.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:19:54 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:19:54 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [Xen-devel] [PATCH v8 13/16] microcode: unify loading update
 during CPU resuming and AP wakeup
Thread-Index: AQHVSFKrA3gY1r4/5kKzYHipTShbSabsXgAA
Date: Mon, 5 Aug 2019 10:19:54 +0000
Message-ID: <d7413262-1443-8a74-275a-87bd352ff53e@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-14-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-14-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bba021cf-5113-4d87-bac5-08d7198e759a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3037; 
x-ms-traffictypediagnostic: MN2PR18MB3037:
x-microsoft-antispam-prvs: <MN2PR18MB3037DFFC775C13830D73616FB3DA0@MN2PR18MB3037.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(54094003)(6436002)(229853002)(6916009)(6486002)(8936002)(31686004)(86362001)(53936002)(8676002)(81166006)(81156014)(6246003)(6512007)(31696002)(80792005)(11346002)(66066001)(446003)(476003)(186003)(26005)(478600001)(486006)(14454004)(102836004)(36756003)(14444005)(71200400001)(71190400001)(256004)(305945005)(76176011)(15650500001)(386003)(7736002)(6506007)(2616005)(6116002)(3846002)(66446008)(66946007)(66476007)(5660300002)(25786009)(4326008)(64756008)(66556008)(316002)(53546011)(52116002)(2906002)(54906003)(99286004)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3037;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aPPMeUUAibucfyI4LCK8cKXAzE6F9ySwFDm7qX49rONICqLlAuN6qd1kwHQVlnXyy3uwMVGzeBsFffHgpNiciB2HS85vc9ZZOZ7Vi5Ej7qrbEWC+Mpvlq5QOPRViMO9ZO+/Rj/r/36NK/uLkU9r7+erR6DpnpB7hAU20zOgFGbrRFt6sA5SN3a6BPySGDS5cIftdGOGXzvZx57sQrym+3x+1dZpdYmNVeSZOF+rlLGlpvlO9enwopH6iyfHoDbxTV3Ab/PoOaZTFtaQpqS3Zxs4C9kb5UyrD0EGvk11o4KnOaInP2GmgK6hOVat+sFV7o6CcVVb4yUmwAREG6uM13CAEq4UTWnxdtvYYfSc7JCkF17rkWwTMRuEEeG1a/1zfMuGNvJ6v4EuWiKCvrUKqkLo84BRS3co/mNG21x+WTmc=
Content-ID: <ACD4F879D2F8A2488C3C452F48E52252@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bba021cf-5113-4d87-bac5-08d7198e759a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:19:54.6259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3037
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 13/16] microcode: unify loading update
 during CPU resuming and AP wakeup
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

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IEJvdGggYXJlIGxvYWRpbmcg
dGhlIGNhY2hlZCBwYXRjaC4gU2luY2UgQVBzIGNhbGwgdGhlIHVuaWZpZWQgZnVuY3Rpb24sDQo+
IG1pY3JvY29kZV91cGRhdGVfb25lKCksIGR1cmluZyB3YWtldXAsIHRoZSAnc3RhcnRfdXBkYXRl
JyBwYXJhbWV0ZXINCj4gd2hpY2ggb3JpZ2luYWxseSB1c2VkIHRvIGRpc3Rpbmd1aXNoIEJTUCBh
bmQgQVBzIGlzIHJlZHVuZGFudC4gU28gcmVtb3ZlDQo+IHRoaXMgcGFyYW1ldGVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4NCj4gLS0tDQo+IENo
YW5nZXMgaW4gdjg6DQo+ICAgLSBzcGxpdCBvdXQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2gNCj4g
LS0tDQo+ICAgeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICB8ICAyICstDQo+ICAgeGVu
L2FyY2gveDg2L21pY3JvY29kZS5jICAgICAgICB8IDM2ICsrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgICAgICAgICAgfCAgNSAr
LS0tLQ0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCAgNCArKy0tDQo+ICAg
NCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2Fj
cGkvcG93ZXIuYw0KPiBpbmRleCA0ZjIxOTAzLi4yNDc5OGQ1IDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC94ODYvYWNwaS9wb3dlci5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMN
Cj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkN
Cj4gICANCj4gICAgICAgY29uc29sZV9lbmRfc3luYygpOw0KPiAgIA0KPiAtICAgIG1pY3JvY29k
ZV9yZXN1bWVfY3B1KCk7DQo+ICsgICAgbWljcm9jb2RlX3VwZGF0ZV9vbmUoKTsNCj4gICANCj4g
ICAgICAgaWYgKCAhcmVjaGVja19jcHVfZmVhdHVyZXMoMCkgKQ0KPiAgICAgICAgICAgcGFuaWMo
Ik1pc3NpbmcgcHJldmlvdXNseSBhdmFpbGFibGUgZmVhdHVyZShzKVxuIik7DQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMN
Cj4gaW5kZXggZjBiMWUzOS4uY2JhZjEzZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L21p
Y3JvY29kZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYw0KPiBAQCAtMjA0LDI0
ICsyMDQsNiBAQCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX3BhcnNl
X2Jsb2IoY29uc3QgY2hhciAqYnVmLA0KPiAgICAgICByZXR1cm4gTlVMTDsNCj4gICB9DQo+ICAg
DQo+IC1pbnQgbWljcm9jb2RlX3Jlc3VtZV9jcHUodm9pZCkNCj4gLXsNCj4gLSAgICBpbnQgZXJy
Ow0KPiAtICAgIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmdGhpc19jcHUoY3B1X3NpZyk7
DQo+IC0NCj4gLSAgICBpZiAoICFtaWNyb2NvZGVfb3BzICkNCj4gLSAgICAgICAgcmV0dXJuIDA7
DQo+IC0NCj4gLSAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7DQo+IC0NCj4gLSAgICBl
cnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKHNpZyk7DQo+IC0gICAgaWYgKCBs
aWtlbHkoIWVycikgKQ0KPiAtICAgICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5hcHBseV9taWNy
b2NvZGUobWljcm9jb2RlX2NhY2hlKTsNCj4gLSAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211
dGV4KTsNCj4gLQ0KPiAtICAgIHJldHVybiBlcnI7DQo+IC19DQo+IC0NCj4gICB2b2lkIG1pY3Jv
Y29kZV9mcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXRjaCkN
Cj4gICB7DQo+ICAgICAgIG1pY3JvY29kZV9vcHMtPmZyZWVfcGF0Y2gobWljcm9jb2RlX3BhdGNo
LT5tYyk7DQo+IEBAIC00MDIsNyArMzg0LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IG1pY3JvY29k
ZV9pbml0KHZvaWQpDQo+ICAgfQ0KPiAgIF9faW5pdGNhbGwobWljcm9jb2RlX2luaXQpOw0KPiAg
IA0KPiAtaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdShib29sIHN0YXJ0X3Vw
ZGF0ZSkNCj4gKy8qIExvYWQgYSBjYWNoZWQgdXBkYXRlIHRvIGN1cnJlbnQgY3B1ICovDQo+ICtp
bnQgbWljcm9jb2RlX3VwZGF0ZV9vbmUodm9pZCkNCj4gK3sNCj4gKyAgICByZXR1cm4gbWljcm9j
b2RlX29wcyA/IG1pY3JvY29kZV91cGRhdGVfY3B1KE5VTEwpIDogMDsNCj4gK30NCg0KV2l0aCBi
b3RoIGNhbGxlcnMgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSwgSSB3b25kZXIgaWYgdGhlDQpm
dW5jdGlvbiBzaG91bGQgcmV0dXJuIHZvaWQuIEVsc2UgaXQgbWlnaHQgYmUgYmV0dGVyIChidXQg
SSdtDQpub3QgZW50aXJlbHkgY2VydGFpbikgZm9yIGl0IHRvIHJldHVybiAtRU9QTk9UU1VQUCBy
YXRoZXINCnRoYW4gMC4NCg0KPiArLyoNCj4gKyAqIEJTUCBjYWxscyB0aGlzIGZ1bmN0aW9uIHRv
IHBhcnNlIHVjb2RlIGJsb2IgYW5kIHRoZW4gYXBwbHkgYW4gdXBkYXRlLg0KPiArICovDQoNClRo
aXMgaXMgYSBzaW5nbGUgbGluZSBjb21tZW50LCBhbmQgaGVuY2Ugd2FudHMgaXRzIHN0eWxlDQpj
aGFuZ2VkIGFjY29yZGluZ2x5Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
