Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AA7187F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:46:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpu9z-0001bE-JX; Tue, 23 Jul 2019 12:44:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpu9y-0001b5-EE
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:44:50 +0000
X-Inumbo-ID: a4e913ce-ad47-11e9-8f58-876a3221499b
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4e913ce-ad47-11e9-8f58-876a3221499b;
 Tue, 23 Jul 2019 12:44:46 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 12:44:39 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 12:42:18 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 12:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYljSu6QzZfqEkOyYsGedDKqJRKx1snRQFnTFLmvoJ/U1oWixvKrgySB+VrYWUb+D5MbcNZLFGfq1zQDzBxRZHSgEQpU10mvisESuCPjWgr7kKqNCBVsBVflVf1lRTkLy5pHe8MuSlvHzZZ9161GQ8ZdjKr3mQE/U3eYUeZxwPfkw5Fp5Xc4nf6u6kBxlCj2XOMPY3OQ9WYKqOse56lwrWJGTHiYZKVUXcOA9zXk5eWNkyTAL2I0uiBEdOQIRHOdW6U72/nFPDL1YD7l3eGWwjvsAZJvAw23niPinBcers2Dxv7KzbLYOkxYNv62CR6UpXOD28+gtpLY9ibAtFe4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adph6QXg4oTSMVksiUqZWdaND1j37Wq/sQtaxAWtmks=;
 b=X0U9AnT1ev+4OxpdSZt79T9ElnN7MWPEBreE3ojScoYk3BBXx46QLQ0q1o4nVpN9u9wIRoUWKYtR8XeqyTMrbSg7Td3GTLEFOBYB1RLdgay4vzzP2++eXGxqIYsK3DlAClIVKRtLE0fwV3Zeb7f6Czx8QFezbGFjiqKH1shP3rztvr0ms3XQ0Vcd3BcGbq0HOEjb05ewWw9Ygwc6LZwSscV6ms61zpMF5OMSzOvfxt43l9EkFkpaCPI86H7Vm7mO3t0tc8TRVencFP8EBLjQFSTrKeSw9AWJixNEXe/595EyIjWYweZY7GKYy9dJKXoEtBCIi7xdAC3uHfU0LvFeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3195.namprd18.prod.outlook.com (10.255.172.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 12:42:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 12:42:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 2/2] xen: merge temporary vcpu pinning scenarios
Thread-Index: AQHVQTgCmOXaxQxPLUKxvpzXZTTLrabYJaWA
Date: Tue, 23 Jul 2019 12:42:17 +0000
Message-ID: <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
In-Reply-To: <20190723092056.15045-3-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d15c5740-c0c3-46fa-83bb-08d70f6b31f5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3195; 
x-ms-traffictypediagnostic: DM6PR18MB3195:
x-microsoft-antispam-prvs: <DM6PR18MB3195AD844A6B4CEE7F6348AAB3C70@DM6PR18MB3195.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(189003)(199004)(68736007)(6246003)(36756003)(81166006)(81156014)(6862004)(31686004)(4326008)(66446008)(66476007)(66946007)(64756008)(71200400001)(66556008)(53936002)(71190400001)(8936002)(102836004)(6506007)(229853002)(52116002)(2906002)(53546011)(478600001)(66066001)(76176011)(186003)(386003)(6636002)(305945005)(2616005)(86362001)(8676002)(3846002)(476003)(25786009)(446003)(6116002)(5660300002)(14444005)(11346002)(80792005)(14454004)(7416002)(316002)(486006)(256004)(6512007)(31696002)(7736002)(99286004)(6486002)(37006003)(6436002)(54906003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3195;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zm+bfd7KR6wy2eGHTzQ6XuCaaj5cpCf+mJjv6rNxhT9GwL/tLxv5DVq+W0Tsv8eNh9HUDt5jy9VglAsgInlkRelNwNt8uNUq9Z5PLgVA0suOwAffojVMNGgXQLB86hwWiPV06VsXUoBbDW23/mrzaVtJvt7PZ+k/cszGjMXDUFnHbhznABNCEp9E9IBq9wt3lL47JWKeqsg8hCqXpRtb8RIRSr6VOtWJuNs4Izo65isJaF0OuujeFQ8DUAx8XlC/fgb1y5LhqTVvLghB6HTNLJk3UR1pHeZZiUGAvzGPCltbD02LG4+/l9cOpUMCXbYGm3EoSbvzw0P64BXFfg1aIteZTdDp0xVZAAJunNak/V60/PxJBF8vRsDTcRw8siZkkoLW90fYJO0fQaxw2UvU/1eWOMzW5jZ+vN0XDM3BTWw=
Content-ID: <5F20FEC39DE9A94AA53E122ADB824C60@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c5740-c0c3-46fa-83bb-08d70f6b31f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 12:42:17.2154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3195
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxMToyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVG9kYXkgdGhlcmUg
YXJlIHRocmVlIHNjZW5hcmlvcyB3aGljaCBhcmUgcGlubmluZyB2Y3B1cyB0ZW1wb3JhcmlseSB0
bw0KPiBhIHNpbmdsZSBwaHlzaWNhbCBjcHU6DQo+IA0KPiAtIE5NSS9NQ0UgaW5qZWN0aW9uIGlu
dG8gUFYgZG9tYWlucw0KPiAtIHdhaXRfZXZlbnQoKSBoYW5kbGluZw0KPiAtIHZjcHVfcGluX292
ZXJyaWRlKCkgaGFuZGxpbmcNCj4gDQo+IEVhY2ggb2YgdGhvc2UgY2FzZXMgYXJlIGhhbmRsZWQg
aW5kZXBlbmRlbnRseSB0b2RheSB1c2luZyB0aGVpciBvd24NCj4gdGVtcG9yYXJ5IGNwdW1hc2sg
dG8gc2F2ZSB0aGUgb2xkIGFmZmluaXR5IHNldHRpbmdzLg0KDQpBbmQgd2hhdCBndWFyYW50ZWVz
IHRoYXQgbm8gdHdvIG9mIHRoZW0gd2lsbCBiZSBpbiB1c2UgYXQgdGhlIHNhbWUgdGltZT8NCllv
dSBkb24ndCBldmVuIG1lbnRpb24gLi4uDQoNCj4gVGhlIHRocmVlIGNhc2VzIGNhbiBiZSBjb21i
aW5lZCBhcyB0aGUgdHdvIGxhdHRlciBjYXNlcyB3aWxsIG9ubHkgcGluDQo+IGEgdmNwdSB0byB0
aGUgcGh5c2ljYWwgY3B1IGl0IGlzIGFscmVhZHkgcnVubmluZyBvbiwgd2hpbGUNCj4gdmNwdV9w
aW5fb3ZlcnJpZGUoKSBpcyBhbGxvd2VkIHRvIGZhaWwuDQoNCi4uIHRoZSBOTUkvI01DIGluamVj
dGlvbiBjYXNlIGhlcmUgKGRlc3BpdGUgdGhlIHVzZSBvZiAidGhlIHR3byIgYW5kDQoid2hpbGUi
IGdpdmluZyB0aGUgaW1wcmVzc2lvbikuIE9yIChsb29raW5nIGF0IHRoZSBhY3R1YWwgY29kZSkg
ZGlkIHlvdQ0KbWVhbiAiZm9ybWVyIiBpbnN0ZWFkIG9mICJsYXR0ZXIiPyBCdXQgaWYgc28gLSBp
ZCB0aGF0IHRydWU/DQp2LT5wcm9jZXNzb3IgZ2V0cyBsYXRjaGVkIGludG8gc3QtPnByb2Nlc3Nv
ciBiZWZvcmUgcmFpc2luZyB0aGUgc29mdGlycSwNCmJ1dCBjYW4ndCB0aGUgdkNQVSBiZSBtb3Zl
ZCBlbHNld2hlcmUgYnkgdGhlIHRpbWUgdGhlIHNvZnRpcnEgaGFuZGxlcg0KYWN0dWFsbHkgZ2Fp
bnMgY29udHJvbD8gSWYgdGhhdCdzIG5vdCBwb3NzaWJsZSAoYW5kIGlmIGl0J3Mgbm90IG9idmlv
dXMNCndoeSwgYW5kIGFzIHlvdSBjYW4gc2VlIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUpLCB0aGVu
IEkgdGhpbmsgYSBjb2RlDQpjb21tZW50IHdhbnRzIHRvIGJlIGFkZGVkIHRoZXJlLg0KDQpJbmRl
cGVuZGVudCBvZiB0aGF0IGludHJvZHVjaW5nIG5ldyBmYWlsdXJlIGNhc2VzIGZvciB2Y3B1X3Bp
bl9vdmVycmlkZSgpDQppc24ndCByZWFsbHkgbmljZS4gVGhlbiBhZ2FpbiBhbnkgdHdvIHJhY2lu
Zy9jb25mbGljdGluZyBwaW5uaW5nIGF0dGVtcHRzDQpjYW4ndCByZXN1bHQgaW4gYW55dGhpbmcg
Z29vZC4NCg0KTmV2ZXJ0aGVsZXNzIC0gbmljZSBpZGVhLCBzbyBhIGZldyBtaW5vciBjb21tZW50
cyBvbiB0aGUgY29kZSBhcyB3ZWxsLCBpbg0KdGhlIGhvcGUgdGhhdCBteSBwb2ludCBhYm92ZSBj
YW4gYmUgYWRkcmVzc2VkLg0KDQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYw0KPiArKysg
Yi94ZW4vY29tbW9uL3NjaGVkdWxlLmMNCj4gQEAgLTExMDYsNDcgKzExMDYsNTggQEAgdm9pZCB3
YXRjaGRvZ19kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgICAgICAga2ls
bF90aW1lcigmZC0+d2F0Y2hkb2dfdGltZXJbaV0pOw0KPiAgIH0NCj4gICANCj4gLWludCB2Y3B1
X3Bpbl9vdmVycmlkZShzdHJ1Y3QgdmNwdSAqdiwgaW50IGNwdSkNCj4gK2ludCB2Y3B1X3NldF90
bXBfYWZmaW5pdHkoc3RydWN0IHZjcHUgKnYsIGludCBjcHUsIHVpbnQ4X3QgcmVhc29uKQ0KDQpJ
J2QgZmluZCBpdCBwcmV0dHkgbmljZSBpZiBhdCB0aGlzIG9jY2FzaW9uIHRoZSB0eXBlIG9mICJj
cHUiIHdhcw0KY2hhbmdlZCB0byAidW5zaWduZWQgaW50IiwgdXNpbmcgVUlOVF9NQVggb3IgTlJf
Q1BVUyBpbnN0ZWFkIG9mIC0xDQpmb3IgdGhlICJyZW1vdmUgb3ZlcnJpZGUiIGNhc2UuDQoNCkkn
ZCBhbHNvIHByZWZlciBpZiB5b3UgZGlkbid0IHVzZSAidG1wIiBhcyBhbiBpbmZpeCBoZXJlLiBN
YWtlIGl0DQoidGVtcG9yYXJ5IiwgInRyYW5zaWVudCIsIG9yIHNvbWUgc3VjaC4gUGVyaGFwcyBl
dmVuIG9taXQgInNldCIsDQp0aGUgbW9yZSB0aGF0IHRoZSBmdW5jdGlvbiBtYXkgYWxzbyBjbGVh
ciBpdC4NCg0KPiBAQCAtMTgyLDMwICsxNzgsMjQgQEAgc3RhdGljIHZvaWQgX19wcmVwYXJlX3Rv
X3dhaXQoc3RydWN0IHdhaXRxdWV1ZV92Y3B1ICp3cXYpDQo+ICAgc3RhdGljIHZvaWQgX19maW5p
c2hfd2FpdChzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdikNCj4gICB7DQo+ICAgICAgIHdxdi0+
ZXNwID0gTlVMTDsNCj4gLSAgICAodm9pZCl2Y3B1X3NldF9oYXJkX2FmZmluaXR5KGN1cnJlbnQs
ICZ3cXYtPnNhdmVkX2FmZmluaXR5KTsNCj4gKyAgICB2Y3B1X3NldF90bXBfYWZmaW5pdHkoY3Vy
cmVudCwgLTEsIFZDUFVfQUZGSU5JVFlfV0FJVCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgY2hl
Y2tfd2FrZXVwX2Zyb21fd2FpdCh2b2lkKQ0KPiAgIHsNCj4gLSAgICBzdHJ1Y3Qgd2FpdHF1ZXVl
X3ZjcHUgKndxdiA9IGN1cnJlbnQtPndhaXRxdWV1ZV92Y3B1Ow0KPiArICAgIHN0cnVjdCB2Y3B1
ICpjdXJyID0gY3VycmVudDsNCj4gKyAgICBzdHJ1Y3Qgd2FpdHF1ZXVlX3ZjcHUgKndxdiA9IGN1
cnItPndhaXRxdWV1ZV92Y3B1Ow0KPiAgIA0KPiAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmd3F2
LT5saXN0KSk7DQo+ICAgDQo+ICAgICAgIGlmICggbGlrZWx5KHdxdi0+ZXNwID09IE5VTEwpICkN
Cj4gICAgICAgICAgIHJldHVybjsNCj4gICANCj4gLSAgICAvKiBDaGVjayBpZiB3ZSB3b2tlIHVw
IG9uIHRoZSB3cm9uZyBDUFUuICovDQo+IC0gICAgaWYgKCB1bmxpa2VseShzbXBfcHJvY2Vzc29y
X2lkKCkgIT0gd3F2LT53YWtldXBfY3B1KSApDQo+ICsgICAgLyogQ2hlY2sgaWYgd2UgYXJlIHN0
aWxsIHBpbm5lZC4gKi8NCj4gKyAgICBpZiAoIHVubGlrZWx5KCEoY3Vyci0+YWZmaW5pdHlfYnJv
a2VuICYgVkNQVV9BRkZJTklUWV9XQUlUKSkgKQ0KPiAgICAgICB7DQo+IC0gICAgICAgIC8qIFJl
LXNldCBWQ1BVIGFmZmluaXR5IGFuZCByZS1lbnRlciB0aGUgc2NoZWR1bGVyLiAqLw0KPiAtICAg
ICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7DQo+IC0gICAgICAgIGNwdW1hc2tfY29w
eSgmd3F2LT5zYXZlZF9hZmZpbml0eSwgY3Vyci0+Y3B1X2hhcmRfYWZmaW5pdHkpOw0KPiAtICAg
ICAgICBpZiAoIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoY3VyciwgY3B1bWFza19vZih3cXYtPndh
a2V1cF9jcHUpKSApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19FUlIsICJVbmFibGUgdG8gc2V0IHZjcHUgYWZmaW5pdHlcbiIpOw0KPiAtICAgICAgICAgICAg
ZG9tYWluX2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7DQo+IC0gICAgICAgIH0NCj4gLSAgICAgICAg
d2FpdCgpOyAvKiB0YWtlcyB1cyBiYWNrIGludG8gdGhlIHNjaGVkdWxlciAqLw0KPiArICAgICAg
ICBnZHByaW50ayhYRU5MT0dfRVJSLCAidmNwdSBhZmZpbml0eSBsb3N0XG4iKTsNCj4gKyAgICAg
ICAgZG9tYWluX2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7DQo+ICAgICAgIH0NCg0KUGxlYXNlIHVz
ZSBjdXJyIGluIGZhdm9yIG9mIGN1cnJlbnQuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
