Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9F78D82
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6IA-0000M5-Os; Mon, 29 Jul 2019 14:06:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs6I8-0000M0-HB
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:06:20 +0000
X-Inumbo-ID: 0880b682-b20a-11e9-92ab-537f3405c60b
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0880b682-b20a-11e9-92ab-537f3405c60b;
 Mon, 29 Jul 2019 14:06:18 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 14:06:14 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 13:51:11 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 13:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq7teHUa9/3jzwy9svVO+JwbsKcBx91yCCBXtfOjvv8K4O0Y6Oj9twu5Ob42gC2PJyTPg7T/5o85LG8il8Y2kXAh2DPUZpWWaYsOy+rs7JpgR0aRXkcQjL3BBwOO3KvgSIcKUp0kv2m56vyhsh9OpENlpIgrzoT66Nxhj1fnMtzGtePqja37wNJ7cvfZUqgO1NUy6Avco1o+PYQMvUdIeGYMWxK9orLpln/e0ea/MisjqiIEKTl8MD9McFuycew1hJbQAX0P7Y9wkIqLj3V/MAHUkPm3tEBhI+nyzp46vwm9l7+igCC5iWcfA6YRCATh2VGYef3l/mluAka8VnyJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78RnuU+MIOAhRGawgAg8Gn7VtxCXQvB806xzBerniaA=;
 b=drT/fbdYEvIWZXo6VXukEeVm+iy0aQBH9mMnX1suUC9RERfzaQ+QGskDyf/jslQCGtpN6IRLKXqAI7FFyCV7QKtHZ1Jh0c+bPBgJgdirceHpehnJHHIRb34nFRbvDmOTjB/VQQbX+F/4me2MSNdt9aZiHwRq5z9l2K+lfJWaUR8ywG47p8Ylz7tCPpNt2asOFrRl6+aOpG1SnPbydEp2gnvvHw6culnl97oUv4WErHx24XgSg0OB1jm7dsBDiPyph8rVMYUDfYQaGUVXPDWcb0quMJ0ZY3Q/sOBvDnQ2oli2uubfxWkGBse2ueE8eLgbdH8SF9qd2QkCgDOGz55TYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3426.namprd18.prod.outlook.com (10.255.136.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 13:51:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 13:51:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent percpu data via
 Meltdown
Thread-Index: AQHVQ/FLGOl3AfgP2E20kStBm0Ng06bhoW4A
Date: Mon, 29 Jul 2019 13:51:08 +0000
Message-ID: <c72b3b9a-4e4a-2a6f-3d94-fedf56018b00@suse.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190726203222.4833-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0015.eurprd02.prod.outlook.com
 (2603:10a6:8:1::28) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee175276-b38d-41d7-cfe7-08d7142bcf29
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3426; 
x-ms-traffictypediagnostic: BY5PR18MB3426:
x-microsoft-antispam-prvs: <BY5PR18MB3426DB3BCAF2FA91B2F4B507B3DD0@BY5PR18MB3426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(53936002)(66946007)(31696002)(86362001)(66446008)(476003)(486006)(66476007)(8936002)(66556008)(64756008)(446003)(81166006)(6246003)(80792005)(229853002)(6512007)(2616005)(11346002)(8676002)(31686004)(26005)(316002)(52116002)(186003)(6436002)(76176011)(14454004)(6486002)(102836004)(478600001)(53546011)(54906003)(99286004)(6506007)(386003)(256004)(14444005)(25786009)(81156014)(2906002)(7736002)(4326008)(5660300002)(6916009)(71200400001)(3846002)(6116002)(66066001)(305945005)(71190400001)(68736007)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3426;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 75RAgu+Nmle0iYi8vRChQ5mPnyawp2WY73eKWq1zRIyn/xZkEHvRYdTaZBUbZjv3hAZAdz1vA+f3LoBloykDpQv2g+3m7VdGIJAHuCj8WQPlUeUmBA9ajM+SmduwWWifRcF8flToc3F014cEC+9ARB8Ml2ipJ7q9YCQ9VzYZCodvHMPVLeT04T+2CsxJDjlxQdcrUO3xhQQxP+a8H87hYiKK2oMmq3ne0DzXTyBNMkbyoi28SbALxGYmq6KffC28jwAkDTE8+S7taoYIA38dWK5ALklbNnHSOR0P+rEQ2WuQqhAQpafcs4fCI6q4gQDuw3Osq0V0LKmYKdDE6b2Xnt4vGzajUY24BCv+74ylcIdcMa7v6NyaStE37pozSAQoFTIgnKDO/wirhNBG/fsk3DFQGX959yF++hRpVwxQHG0=
Content-ID: <F7AD74252A14A741A847DA952667C0E6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee175276-b38d-41d7-cfe7-08d7142bcf29
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 13:51:08.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAyMjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlIFhQVEkgd29y
ayByZXN0cmljdGVkIHRoZSB2aXNpYmlsaXR5IG9mIG1vc3Qgb2YgbWVtb3J5LCBidXQgbWlzc2Vk
IGEgZmV3DQo+IGFzcGVjdHMgd2hlbiBpdCBjYW1lIHRvIHRoZSBUU1MuDQoNCk5vbmUgb2YgdGhl
c2Ugd2VyZSAibWlzc2VkIiBhZmFpciAtIHdlJ2QgYmVlbiBhd2FyZSwgYW5kIGFjY2VwdGVkIHRo
aW5ncw0KdG8gYmUgdGhlIHdheSB0aGV5IGFyZSBub3cgZm9yIHRoZSBmaXJzdCBzdGVwLiBSZW1l
bWJlciB0aGF0IGF0IHRoZSB0aW1lDQpYUFRJIHdhcyBjYWxsZWQgIlhQVEkgbGlnaHQiLCBpbiBh
bnRpY2lwYXRpb24gZm9yIHRoaXMgdG8ganVzdCBiZSBhDQp0ZW1wb3Jhcnkgc29sdXRpb24uDQoN
Cj4gR2l2ZW4gdGhhdCB0aGUgVFNTIGlzIGp1c3QgYW4gb2JqZWN0IGluIHBlcmNwdSBkYXRhLCB0
aGUgNGsgbWFwcGluZyBmb3IgaXQNCj4gY3JlYXRlZCBpbiBzZXR1cF9jcHVfcm9vdF9wZ3QoKSBt
YXBzIGFkamFjZW50IHBlcmNwdSBkYXRhLCBtYWtpbmcgaXQgYWxsDQo+IGxlYWthYmxlIHZpYSBN
ZWx0ZG93biwgZXZlbiB3aGVuIFhQVEkgaXMgaW4gdXNlLg0KPiANCj4gRnVydGhlcm1vcmUsIG5v
IGNhcmUgaXMgdGFrZW4gdG8gY2hlY2sgdGhhdCB0aGUgVFNTIGRvZXNuJ3QgY3Jvc3MgYSBwYWdl
DQo+IGJvdW5kYXJ5LiAgQXMgaXQgdHVybnMgb3V0LCBzdHJ1Y3QgdHNzX3N0cnVjdCBpcyBhbGln
bmVkIG9uIGl0cyBzaXplIHdoaWNoDQo+IGRvZXMgcHJldmVudCBpdCBzdHJhZGRsaW5nIGEgcGFn
ZSBib3VuZGFyeSwgYnV0IHRoaXMgd2lsbCBjZWFzZSB0byBiZSB0cnVlDQo+IG9uY2UgQ0VUIGFu
ZCBTaGFkb3cgU3RhY2sgc3VwcG9ydCBpcyBhZGRlZCB0byBYZW4uDQoNClBsZWFzZSBjYW4geW91
IHBvaW50IG1lIGF0IHRoZSBDRVQgYXNwZWN0IGluIGRvY3VtZW50YXRpb24gaGVyZT8gQWl1aQ0K
aXQncyBvbmx5IHRhc2sgc3dpdGNoZXMgd2hpY2ggYXJlIGFmZmVjdGVkLCBhbmQgaGVuY2Ugb25s
eSAzMi1iaXQgVFNTZXMNCndoaWNoIHdvdWxkIGdyb3cgKGFuZCBldmVuIHRoZW4gbm90IGVub3Vn
aCB0byBleGNlZWQgMTI4IGJ5dGVzKS4gRm9yDQp0aGUgcHVycG9zZXMgNjQtYml0IGhhcyB0aGVy
ZSBhcmUgTVNScyB0byBsb2FkIFNTUCBmcm9tLg0KDQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvcHJvY2Vzc29yLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaA0K
PiBAQCAtNDExLDcgKzQxMSw3IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX19td2FpdCh1
bnNpZ25lZCBsb25nIGVheCwgdW5zaWduZWQgbG9uZyBlY3gpDQo+ICAgI2RlZmluZSBJT0JNUF9C
WVRFUyAgICAgICAgICAgICA4MTkyDQo+ICAgI2RlZmluZSBJT0JNUF9JTlZBTElEX09GRlNFVCAg
ICAweDgwMDANCj4gICANCj4gLXN0cnVjdCBfX3BhY2tlZCBfX2NhY2hlbGluZV9hbGlnbmVkIHRz
c19zdHJ1Y3Qgew0KPiArc3RydWN0IF9fcGFja2VkIHRzc19zdHJ1Y3Qgew0KPiAgICAgICB1aW50
MzJfdCA6MzI7DQo+ICAgICAgIHVpbnQ2NF90IHJzcDAsIHJzcDEsIHJzcDI7DQo+ICAgICAgIHVp
bnQ2NF90IDo2NDsNCj4gQEAgLTQyNSw2ICs0MjUsNyBAQCBzdHJ1Y3QgX19wYWNrZWQgX19jYWNo
ZWxpbmVfYWxpZ25lZCB0c3Nfc3RydWN0IHsNCj4gICAgICAgLyogUGFkcyB0aGUgVFNTIHRvIGJl
IGNhY2hlbGluZS1hbGlnbmVkICh0b3RhbCBzaXplIGlzIDB4ODApLiAqLw0KPiAgICAgICB1aW50
OF90IF9fY2FjaGVsaW5lX2ZpbGxlclsyNF07DQo+ICAgfTsNCj4gK0RFQ0xBUkVfUEVSX0NQVShz
dHJ1Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOw0KDQpUYWtpbmcgcGF0Y2ggMSB0aGlzIGV4cGFu
ZHMgdG8NCg0KICAgICBfX0RFRklORV9QRVJfQ1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUucGFn
ZV9hbGlnbmVkIikgXA0KICAgICAgICAgICAgICAgICAgICAgIF9fYWxpZ25lZChQQUdFX1NJWkUp
LCBzdHJ1Y3QgdHNzX3N0cnVjdCwgX2luaXRfdHNzKTsNCg0KYW5kIHRoZW4NCg0KICAgICBfX3Nl
Y3Rpb24oIi5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCIpIF9fYWxpZ25lZChQQUdFX1NJWkUpDQog
ICAgIF9fdHlwZW9mX18oc3RydWN0IHRzc19zdHJ1Y3QpIHBlcl9jcHVfX2luaXRfdHNzOw0KDQp3
aGljaCBpcyBub3Qgd2hhdCB5b3Ugd2FudDogWW91IGhhdmUgYW4gb2JqZWN0IG9mIHNpemUNCnNp
emVvZihzdHJ1Y3QgdHNzX3N0cnVjdCkgd2hpY2ggaXMgUEFHRV9TSVpFIGFsaWduZWQuIEFmYWlj
dCB5b3UNCnRoZXJlZm9yZSBzdGlsbCBsZWFrIGV2ZXJ5dGhpbmcgdGhhdCBmb2xsb3dzIGluIHRo
ZSBzYW1lIHBhZ2UuIFRoZXJlDQp3YXMgYSByZWFzb24gZm9yIF9fY2FjaGVsaW5lX2FsaWduZWQn
cyBvcmlnaW5hbCBwbGFjZW1lbnQsIGFsYmVpdCBJDQphZ3JlZSB0aGF0IGl0IHdhcy9pcyBhZ2Fp
bnN0IHRoZSBpbnRlbnRpb24gb2YgaGF2aW5nIHRoZSBzdHJ1Y3QNCmRlZmluZSBhbiBpbnRlcmZh
Y2UgdG8gdGhlIGhhcmR3YXJlICh3aGljaCBkb2Vzbid0IGhhdmUgc3VjaCBhbg0KYWxpZ25tZW50
IHJlcXVpcmVtZW50KS4gUGVyaGFwcyB0aGUgc29sdXRpb24gaXMgYSB0d28tbGF5ZXINCmFwcHJv
YWNoOg0KDQpzdHJ1Y3QgX19hbGlnbmVkKFBBR0VfU0laRSkgeGVuX3RzcyB7DQogICAgIHN0cnVj
dCBfX3BhY2tlZCB0c3Nfc3RydWN0IHsNCiAgICAgICAgIC4uLg0KICAgICB9Ow0KfTsNCg0Kd2hl
cmUgdGhlIGlubmVyIHN0cnVjdHVyZSBkZXNjcmliZXMgdGhlIGhhcmR3YXJlIGludGVyZmFjZSBh
bmQgdGhlDQpjb250YWluaW5nIG9uZSBvdXIgb3duIHJlcXVpcmVtZW50KHMpLiBCdXQgcGVyc29u
YWxseSBJIGFsc28NCndvdWxkbid0IG1pbmQgcHV0dGluZyB0aGUgX19hbGlnbmVkKFBBR0VfU0la
RSkgcmlnaHQgb24gc3RydWN0DQp0c3Nfc3RydWN0LCB3aGVyZSBfX2NhY2hlbGluZV9hbGlnbmVk
IGhhcyBiZWVuIHNpdHRpbmcuDQoNCk9mIGNvdXJzZSBlaXRoZXIgYXBwcm9hY2ggZ29lcyBhZ2Fp
bnN0IHRoZSBpZGVhIG9mIGF2b2lkaW5nIHVzYWdlDQptaXN0YWtlcyAoYXMgcG9pbnRlZCBvdXQg
Ynkgb3RoZXJzIGluIHRoZSB2MSBkaXNjdXNzaW9uLCBpaXJjKToNClRoZXJlIGJldHRlciB3b3Vs
ZG4ndCBiZSBhIG5lZWQgdG8gZ2V0IHRoZSB0d28gInBhZ2UgYWxpZ25lZCINCmF0dHJpYnV0ZXMg
aW4gc3luYywgaS5lLiB0aGUgaW5zdGFudGlhdGlvbiBvZiB0aGUgc3RydWN0dXJlDQp3b3VsZCBi
ZXR0ZXIgZW5mb3JjZSB0aGUgcmVxdWVzdGVkIGFsaWdubWVudC4gSSd2ZSBub3QgdGhvdWdodA0K
dGhyb3VnaCB3aGV0aGVyIHRoZXJlJ3MgdHJpY2tlcnkgdG8gYWN0dWFsbHkgbWFrZSB0aGlzIHdv
cmssIGJ1dA0KSSdkIGhvcGUgd2UgY291bGQgYXQgdGhlIHZlcnkgbGVhc3QgZGV0ZWN0IHRoaW5n
cyBub3QgYmVpbmcgaW4NCnN5bmMgYXQgY29tcGlsZSB0aW1lLg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
