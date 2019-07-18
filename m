Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280206CDEC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5HC-0002k5-8K; Thu, 18 Jul 2019 12:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho5HA-0002jq-TZ
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:12:44 +0000
X-Inumbo-ID: 56efb556-a955-11e9-93f3-1b1188db7716
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56efb556-a955-11e9-93f3-1b1188db7716;
 Thu, 18 Jul 2019 12:12:42 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 12:08:48 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 12:09:50 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 12:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC7yc/R/TToKE4W4B88esM+pZsmpxJoA9hUJN8oHfWO/kZ8FmW9OpdP9Kv5m98AcaGSgSTcMLdPdy3ZiQzlC1F6aAazTc9Atk9cy0TSX5aqX7DLEZK56z4c+H9gzKaJeoRmlZdzCe/RUmrA0sDCifGYRGgBABbdyztFj2yolpBDC2DXq2/fXm6NNvg01dLxyVxenrY7adRGRryXeYb1zpuoNzDkHA4+PRg9601LVNkdMFkbT4p4xPvDFpmCkHwLKIcohINtfzfyillBXMp84wHjyuc1q3JtJt/1DUBO47qBdV0FpR/n1kAoDM+8doZ/bdx4zVzAtrOpwurEDq6THcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/77QCDKoT4OyA1szsNFhbW62rB9XBeXO6z6r+BHhLdQ=;
 b=m2ym+5JbMUuZoQ4pTlJpqDF36D8/qBUM1J8Tk+j6XaMKgNjN6eCw/A+X4cljjB5Iuzfr2WZHoS18v5tJOAsMJAsKaCoSRvIsL7sPqs0YV2d9aSGiQEFHeKiQT1zQzgNSjIujQBcTdfBH2fglkbL5dSYOFk+4/fXtrAZ+LQXMWOL6RnOyzt2s502N6dlFFn2EfiUFJ7mDV7G9pzwvslaZiADjBRM+QG7JdA9gBGF7XjnK4meGaMbB55KAY9+ZVTbZwIJJk/Mt+Pss8rR/o4xi/VLnMIQpkESbKF4rtuAa46qNviztQax1GOtBBkbFWpgg6KrfzKzd6SgN+rVwgWH6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2796.namprd18.prod.outlook.com (20.179.50.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 12:09:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 12:09:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop capability in
 CPUs with known errata
Thread-Index: AQHVPWGy1ek8AecLnECtUEoEAro4wg==
Date: Thu, 18 Jul 2019 12:09:49 +0000
Message-ID: <05257008-13e3-0d49-cd1d-6a8c9eee2ce5@suse.com>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
In-Reply-To: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0041.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d32ac17-4e91-4cf3-9b47-08d70b78d4d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2796; 
x-ms-traffictypediagnostic: DM6PR18MB2796:
x-microsoft-antispam-prvs: <DM6PR18MB2796A4DC3EDBF12AC133404BB3C80@DM6PR18MB2796.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(80792005)(478600001)(76176011)(14454004)(66066001)(8676002)(186003)(52116002)(31696002)(476003)(446003)(25786009)(7736002)(2616005)(68736007)(2906002)(6512007)(2501003)(11346002)(305945005)(26005)(6506007)(6436002)(31686004)(3846002)(6486002)(36756003)(386003)(4326008)(486006)(81156014)(316002)(54906003)(81166006)(66476007)(102836004)(256004)(71190400001)(6116002)(2351001)(86362001)(66946007)(66556008)(64756008)(66446008)(71200400001)(5660300002)(99286004)(6916009)(8936002)(53936002)(5640700003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2796;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LHHCNvFUA/OM4V3wbUXRvCYtwDkOrZ0E4PjPKbcdsG2WUSMpDnCTjmW10MXoEr7QYXeIA6gXiU0QwWhCG/QJMHmlx9zSm4fdGvO9fbz81tBgkrhimUzEH6z74LmOpvIQL1CJMPR98wzSTtF2t3W+lxxuPOiLrplMie+OhR0VKhNUNNMIVuajtxjJUKadHNXVr74KXa57ICq+97ktwIOh9dYlmeceLWBBTkWp5DkZLIRWvaEj42/2rpFOWArMDeM8TGxByWTKXJr+9Nrrx9OO4tg3U7nPNjzS9p4ORWUDP3UD2JYTYfS36qbxop89+lE8PffvmQhuLgyV7yhyqJeW++hU5LfmBgbFeIDdynkiaM4TrYlcyg2rS2q5dmDDoNagPrBdyUisb7yCxFQWOjzh+Fw6IjoRudV2ifFzc24drJA=
Content-ID: <C2181FCDD330AD4C808830E1F735CEA7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d32ac17-4e91-4cf3-9b47-08d70b78d4d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:09:49.1672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2796
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop
 capability in CPUs with known errata
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29t
Pg0KDQpQcm9jZXNzb3JzIHdoaWNoIGhhdmUgc2VsZi1zbm9vcGluZyBjYXBhYmlsaXR5IGNhbiBo
YW5kbGUgY29uZmxpY3RpbmcNCm1lbW9yeSB0eXBlIGFjcm9zcyBDUFVzIGJ5IHNub29waW5nIGl0
cyBvd24gY2FjaGUuIEhvd2V2ZXIsIHRoZXJlIGV4aXN0cw0KQ1BVIG1vZGVscyBpbiB3aGljaCBo
YXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0aWxsIGxlYWRzIHRvDQp1bnByZWRpY3Rh
YmxlIGJlaGF2aW9yLCBtYWNoaW5lIGNoZWNrIGVycm9ycywgb3IgaGFuZ3MuDQoNCkNsZWFyIHRo
aXMgZmVhdHVyZSBvbiBhZmZlY3RlZCBDUFVzIHRvIHByZXZlbnQgaXRzIHVzZS4NCg0KU3VnZ2Vz
dGVkLWJ5OiBBbGFuIENveCA8YWxhbi5jb3hAaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1ieTogUmlj
YXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPg0KW0xpbnV4
IGNvbW1pdCAxZTAzYmZmMzYwMDEwMWJkOTE1OGQwMDVlNDMxMzEzMmU1NWJkZWM4XQ0KDQpTdHJp
cCBZb25haCAtIGFzIHBlciBhcmsuaW50ZWwuY29tIGl0IGRvZXNuJ3QgbG9vayB0byBiZSA2NC1i
aXQgY2FwYWJsZS4NCkNhbGwgY2hlY2tfbWVtb3J5X3R5cGVfc2VsZl9zbm9vcF9lcnJhdGEoKSBv
bmx5IG9uIHRoZSBib290IENQVS4NCg0KUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KDQotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMNCisrKyBiL3hl
bi9hcmNoL3g4Ni9jcHUvaW50ZWwuYw0KQEAgLTE1LDYgKzE1LDMyIEBADQogICNpbmNsdWRlICJj
cHUuaCINCiAgDQogIC8qDQorICogUHJvY2Vzc29ycyB3aGljaCBoYXZlIHNlbGYtc25vb3Bpbmcg
Y2FwYWJpbGl0eSBjYW4gaGFuZGxlIGNvbmZsaWN0aW5nDQorICogbWVtb3J5IHR5cGUgYWNyb3Nz
IENQVXMgYnkgc25vb3BpbmcgaXRzIG93biBjYWNoZS4gSG93ZXZlciwgdGhlcmUgZXhpc3RzDQor
ICogQ1BVIG1vZGVscyBpbiB3aGljaCBoYXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0
aWxsIGxlYWRzIHRvDQorICogdW5wcmVkaWN0YWJsZSBiZWhhdmlvciwgbWFjaGluZSBjaGVjayBl
cnJvcnMsIG9yIGhhbmdzLiBDbGVhciB0aGlzDQorICogZmVhdHVyZSB0byBwcmV2ZW50IGl0cyB1
c2Ugb24gbWFjaGluZXMgd2l0aCBrbm93biBlcnJhdGFzLg0KKyAqLw0KK3N0YXRpYyB2b2lkIF9f
aW5pdCBjaGVja19tZW1vcnlfdHlwZV9zZWxmX3Nub29wX2VycmF0YSh2b2lkKQ0KK3sNCisJc3dp
dGNoIChib290X2NwdV9kYXRhLng4Nl9tb2RlbCkgew0KKwljYXNlIDB4MGY6IC8qIE1lcm9tICov
DQorCWNhc2UgMHgxNjogLyogTWVyb20gTCAqLw0KKwljYXNlIDB4MTc6IC8qIFBlbnJ5biAqLw0K
KwljYXNlIDB4MWQ6IC8qIER1bm5pbmd0b24gKi8NCisJY2FzZSAweDFlOiAvKiBOZWhhbGVtICov
DQorCWNhc2UgMHgxZjogLyogQXVidXJuZGFsZSAvIEhhdmVuZGFsZSAqLw0KKwljYXNlIDB4MWE6
IC8qIE5laGFsZW0gRVAgKi8NCisJY2FzZSAweDJlOiAvKiBOZWhhbGVtIEVYICovDQorCWNhc2Ug
MHgyNTogLyogV2VzdG1lcmUgKi8NCisJY2FzZSAweDJjOiAvKiBXZXN0bWVyZSBFUCAqLw0KKwlj
YXNlIDB4MmE6IC8qIFNhbmR5QnJpZGdlICovDQorCQlzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9G
RUFUVVJFX1NTKTsNCisJCWJyZWFrOw0KKwl9DQorfQ0KKw0KKy8qDQogICAqIFNldCBjYXBzIGlu
IGV4cGVjdGVkX2xldmVsbGluZ19jYXAsIHByb2JlIGEgc3BlY2lmaWMgbWFza2luZyBNU1IsIGFu
ZCBzZXQNCiAgICogY2FwcyBpbiBsZXZlbGxpbmdfY2FwcyBpZiBpdCBpcyBmb3VuZCwgb3IgY2xv
YmJlciB0aGUgTVNSIGluZGV4IGlmIG1pc3NpbmcuDQogICAqIElmIHByZXNldCwgcmVhZHMgdGhl
IGRlZmF1bHQgdmFsdWUgaW50byBtc3JfdmFsLg0KQEAgLTI1Niw4ICsyODIsMTEgQEAgc3RhdGlj
IHZvaWQgZWFybHlfaW5pdF9pbnRlbChzdHJ1Y3QgY3B1aQ0KICAJICAgIChib290X2NwdV9kYXRh
Lng4Nl9tYXNrID09IDMgfHwgYm9vdF9jcHVfZGF0YS54ODZfbWFzayA9PSA0KSkNCiAgCQlwYWRk
cl9iaXRzID0gMzY7DQogIA0KLQlpZiAoYyA9PSAmYm9vdF9jcHVfZGF0YSkNCisJaWYgKGMgPT0g
JmJvb3RfY3B1X2RhdGEpIHsNCisJCWNoZWNrX21lbW9yeV90eXBlX3NlbGZfc25vb3BfZXJyYXRh
KCk7DQorDQogIAkJaW50ZWxfaW5pdF9sZXZlbGxpbmcoKTsNCisJfQ0KICANCiAgCWN0eHRfc3dp
dGNoX2xldmVsbGluZyhOVUxMKTsNCiAgfQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
