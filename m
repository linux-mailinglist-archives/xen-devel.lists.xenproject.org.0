Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D95F661
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 12:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiyhd-0004Pf-N5; Thu, 04 Jul 2019 10:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiyhc-0004Pa-BF
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 10:10:56 +0000
X-Inumbo-ID: ff80ecb6-9e43-11e9-bad0-6745a3837236
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff80ecb6-9e43-11e9-bad0-6745a3837236;
 Thu, 04 Jul 2019 10:10:51 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 10:07:12 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 10:09:10 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 10:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=hA4tFT1RUGPKdaVwoagv3HtC/PiCi7+0sT/vJdZmSKnvlX329pfsUVKFnLGpF3T+YIU56V1fofUg+7yBv2DXeiuDTd/abPJroAUFVUi+4zissyqj3zkfEqv/o9UR4GoLwuJHAi9fB3TnJrfprmIYHwB4AAKGJk0AR6gfvvoEWnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB+ojXgWpppJTVaj6SsD9h+AsAMyoVtzPmLcpsr2jDU=;
 b=mnuEcWE7HfnTD8AgvbOoOkzak9gPZ7PxFLAtDN6k1Wzanokv21/JehJlQcwxFhHIJcy8x/8WJGjdIMcMJZqyyuOVCLvshWZ8O2dKoEt14iwTRgAzEaZN/r0207wRiWWYrd4u60sKKNcrwp2BmDioXTgkMki2+3ekgZVJvut7aBE=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3187.namprd18.prod.outlook.com (10.255.137.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 4 Jul 2019 10:09:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 10:09:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFaa5AV1ggAEucACAAAMssIAACuWA
Date: Thu, 4 Jul 2019 10:09:08 +0000
Message-ID: <1d749d19-cad9-9d6b-27ef-b4abaa86ec97@suse.com>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
 <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
 <0f165d9f-6bfc-1ca0-648e-a64d05d204ed@suse.com>
 <ab4d8c58855c45ed855e27d1fa15972e@AMSPEX02CL03.citrite.net>
In-Reply-To: <ab4d8c58855c45ed855e27d1fa15972e@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0046.eurprd03.prod.outlook.com
 (2603:10a6:4:54::14) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27d23e57-80c3-4b48-52d5-08d70067a783
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3187; 
x-ms-traffictypediagnostic: BY5PR18MB3187:
x-microsoft-antispam-prvs: <BY5PR18MB31872A86D3621603572EB152B3FA0@BY5PR18MB3187.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(199004)(13464003)(189003)(486006)(71190400001)(446003)(71200400001)(66946007)(2616005)(11346002)(186003)(76176011)(256004)(66556008)(73956011)(99286004)(31696002)(102836004)(386003)(86362001)(53546011)(66066001)(229853002)(6506007)(26005)(478600001)(66476007)(476003)(14444005)(2501003)(36756003)(305945005)(6116002)(72206003)(81166006)(53936002)(31686004)(14454004)(6512007)(8936002)(6486002)(6436002)(80792005)(66446008)(316002)(7736002)(4326008)(81156014)(8676002)(25786009)(52116002)(3846002)(110136005)(6246003)(5660300002)(68736007)(64756008)(54906003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3187;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LkYoQ6NN+G1xyzGMlSGSih+cJHGr57mqf0nh5uskGE47gMH69BpUlynabLwBymYCecidNGSiJIRN9Nff9NF2NZaU1DPL/DfMbmFThC5WvHiZrT5vK2lGz+4nHJyfwXQ0Iraix3IPRI/VNOVkfPqUR4aOdfeGRxxyY6ccwEQT93MKOsehfjMM5QFapOaZ/7AoEQaV14HWNfAGrj/ugbyKE826Yp0Yr8hLVrB0MM+uXjhBGngNQ/Qjk75DYVlSP1BX0mmNS0CCusN88114rbDkyuT5TISpWjMD+ioOwmGTlSQ3C4NZyBqqAiSXuverSZpZXyZJTTr/0wMJc9VZdvUYxAnDyO0x6LdrGOLirXNrkk916EnUkrXMRPUhHoxYKJPwhwIT3kHb2aOprSv85P+QX7i80VHUVEaH9ER1q23kqT8=
Content-ID: <D63732253002244B8735CA3B404802C6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d23e57-80c3-4b48-52d5-08d70067a783
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 10:09:08.9966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3187
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxMTozNSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IFNlbnQ6IDA0IEp1bHkgMjAxOSAxMDoxOQ0KPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4+IENj
OiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+PiBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2Ml0geDg2L0hWTTogcDJtX3JhbV9ybyBpcyBpbmNvbXBhdGlibGUgd2l0aCBkZXZpY2Ug
cGFzcy10aHJvdWdoDQo+Pg0KPj4gT24gMDMuMDcuMjAxOSAxNzoyMiwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4+IFNlbnQ6IDAzIEp1bHkgMjAxOSAxMjozNg0K
Pj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+Pj4+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3Blcg0KPj4+PiA8QW5kcmV3LkNvb3BlcjNAY2l0
cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIHg4Ni9IVk06IHAybV9yYW1f
cm8gaXMgaW5jb21wYXRpYmxlIHdpdGggZGV2aWNlIHBhc3MtdGhyb3VnaA0KPj4+Pg0KPj4+PiBU
aGUgd3JpdGUtZGlzY2FyZCBwcm9wZXJ0eSBvZiB0aGUgdHlwZSBjYW4ndCBiZSByZXByZXNlbnRl
ZCBpbiBJT01NVQ0KPj4+PiBwYWdlIHRhYmxlIGVudHJpZXMuIE1ha2Ugc3VyZSB0aGUgcmVzcGVj
dGl2ZSBjaGVja3MgLyB0cmFja2luZyBjYW4ndA0KPj4+PiByYWNlLCBieSB1dGlsaXppbmcgdGhl
IGRvbWFpbiBsb2NrLiBUaGUgb3RoZXIgc2lkZXMgb2YgdGhlIHNoYXJpbmcvDQo+Pj4+IHBhZ2lu
Zy9sb2ctZGlydHkgZXhjbHVzaW9uIGNoZWNrcyBzaG91bGQgc3Vic2VxdWVudGx5IHBlcmhhcHMg
YWxzbyBiZQ0KPj4+PiBwdXQgdW5kZXIgdGhhdCBsb2NrIHRoZW4uDQo+Pj4+DQo+Pj4+IFRha2Ug
dGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGNvbnZlcnQgbmVpZ2hib3JpbmcgYm9vbF90IHRvIGJv
b2wgaW4NCj4+Pj4gc3RydWN0IGh2bV9kb21haW4uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYyOiBEb24n
dCBzZXQgcDJtX3JhbV9yb191c2VkIHdoZW4gZmFpbGluZyB0aGUgcmVxdWVzdC4NCj4+Pj4NCj4+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vZG0uYw0KPj4+PiBAQCAtMjU1LDE2ICsyNTUsMzMgQEAgc3RhdGljIGludCBzZXRfbWVtX3R5
cGUoc3RydWN0IGRvbWFpbiAqZA0KPj4+Pg0KPj4+PiAgICAgICAgIG1lbV90eXBlID0gYXJyYXlf
aW5kZXhfbm9zcGVjKGRhdGEtPm1lbV90eXBlLCBBUlJBWV9TSVpFKG1lbXR5cGUpKTsNCj4+Pj4N
Cj4+Pj4gLSAgICBpZiAoIG1lbV90eXBlID09IEhWTU1FTV9pb3JlcV9zZXJ2ZXIgKQ0KPj4+PiAr
ICAgIHN3aXRjaCAoIG1lbV90eXBlICkNCj4+Pj4gICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBmbGFnczsNCj4+Pj4NCj4+Pj4gKyAgICBjYXNlIEhWTU1FTV9pb3JlcV9z
ZXJ2ZXI6DQo+Pj4+ICAgICAgICAgICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkNCj4+Pj4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+Pj4NCj4+Pj4gICAgICAgICAgICAg
LyogRG8gbm90IGNoYW5nZSB0byBIVk1NRU1faW9yZXFfc2VydmVyIGlmIG5vIGlvcmVxIHNlcnZl
ciBtYXBwZWQuICovDQo+Pj4+ICAgICAgICAgICAgIGlmICggIXAybV9nZXRfaW9yZXFfc2VydmVy
KGQsICZmbGFncykgKQ0KPj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgICAgYnJlYWs7DQo+Pj4+ICsNCj4+Pj4gKyAgICBjYXNlIEhWTU1FTV9y
YW1fcm86DQo+Pj4+ICsgICAgICAgIC8qIHAybV9yYW1fcm8gY2FuJ3QgYmUgcmVwcmVzZW50ZWQg
aW4gSU9NTVUgbWFwcGluZ3MuICovDQo+Pj4+ICsgICAgICAgIGRvbWFpbl9sb2NrKGQpOw0KPj4+
PiArICAgICAgICBpZiAoIGhhc19pb21tdV9wdChkKSApDQo+Pj4+ICsgICAgICAgICAgICByYyA9
IC1FWERFVjsNCj4+Pj4gKyAgICAgICAgZWxzZQ0KPj4+PiArICAgICAgICAgICAgZC0+YXJjaC5o
dm0ucDJtX3JhbV9yb191c2VkID0gdHJ1ZTsNCj4+Pg0KPj4+IERvIHdlIHJlYWxseSB3YW50IHRo
aXMgdG8gYmUgYSBvbmUtd2F5IHRyaXA/IE9uIHRoZSBmYWNlIG9mIGl0LCBpdA0KPj4+IHdvdWxk
IHNlZW0gdGhhdCBrZWVwaW5nIGEgY291bnQgb2YgcDJtX3JhbV9ybyBlbnRyaWVzIHdvdWxkIGJl
IG1vcmUNCj4+PiBkZXNpcmFibGUgc3VjaCB0aGF0LCBvbmNlIHRoZSBsYXN0IG9uZSBpcyBnb25l
LCBkZXZpY2VzIGNhbiBiZQ0KPj4+IGFzc2lnbmVkIGFnYWluPw0KPj4NCj4+IFdlbGwsIGF0IHRo
aXMgcG9pbnQgSSdtIG5vdCByZWFsbHkgdXAgdG8gaW50cm9kdWNpbmcgYWNjb3VudGluZyBvZg0K
Pj4gdGhlIG51bWJlciBvZiB1c2VzIG9mIHAybV9yYW1fcm8uIFRoaXMgY291bGQgYmUgYSBmdXJ0
aGVyIHN0ZXAgdG8NCj4+IGJlIGRvbmUgaW4gdGhlIGZ1dHVyZSwgaWYgbmVjZXNzYXJ5Lg0KPj4N
Cj4+PiBJZiBub3QgbWF5YmUgaXQncyB0aW1lIHRvIGdvIGFsbCB0aGUgd2F5IGFuZCBtYWtlIGlv
bW11IHBhZ2UgdGFibGUNCj4+PiBjb25zdHJ1Y3Rpb24gcGFydCBvZiBkb21haW4gY3JlYXRlIGFu
ZCB0aGVuIHdlIHNpbXBsaWZ5IGEgbG90IG9mDQo+Pj4gY29kZSBhbmQgd2UgZG9uJ3QgbmVlZCBh
bnkgZmxhZy9yZWZjb3VudCBsaWtlIHRoaXMgYXQgYWxsLg0KPj4NCj4+IEkndmUgc2FpZCB0aGlz
IGJlZm9yZTogSSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgYSByZXF1aXJlbWVudCB0bw0KPj4g
a25vdyBhdCB0aGUgdGltZSBvZiB0aGUgY3JlYXRpb24gb2YgYSBWTSB3aGV0aGVyIGl0J2xsIGV2
ZW50dWFsbHkNCj4+IGhhdmUgYSBwYXNzLXRocm91Z2ggZGV2aWNlIGFzc2lnbmVkLiBGdXJ0aGVy
bW9yZSB5b3UgcmVhbGl6ZSB0aGF0DQo+PiB0aGlzIHN1Z2dlc3Rpb24gb2YgeW91cnMgaXMgY29u
dHJhcnkgdG8gd2hhdCB5b3UndmUgc2FpZCBmdXJ0aGVyIHVwOg0KPj4gVGhpcyB3YXkgeW91J2Qg
bWFrZSB0aGUgdHdvIHRoaW5ncyBleGNsdXNpdmUgb2Ygb25lIGFub3RoZXIgd2l0aG91dA0KPj4g
YW55IHJlY291cnNlLg0KPiANCj4gWWVzLCBJIHJlYWxpemUgdGhlIHN1Z2dlc3Rpb25zIGFyZSBj
b250cmFkaWN0b3J5LiBNeSBwb2ludCBpcyB0aGF0DQo+IGFkZGluZyBJT01NVSBwYWdlcyB0byBh
IHJ1bm5pbmcgZG9tYWluIGlzIHRyaWNreSBhbmQgbGVhZHMgdG8gaXNzdWVzDQo+IGxpa2UgdGhl
IG9uZSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZSB3aXRoIHRoZSByYW1fcm9fdXNlZCBmbGFnLg0K
PiBUaGUgd2hvbGUgc3Vic3lzdGVtIGlzIGluIG5lZWQgb2YgYW4gb3ZlcmhhdWwgYW55d2F5IHNv
IEkgZ3Vlc3MgdGhpcw0KPiBiYW5kLWFpZCBpcyBvayBmb3Igbm93Lg0KDQpUaGFua3MuIEkgd29u
ZGVyIHdoZXRoZXIgSSBtYXkgdHJhbnNsYXRlIHRoaXMgaW50byBSLWIgb3IgQS1iPw0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
