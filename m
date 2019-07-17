Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC916B6C2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndW5-0004OA-1n; Wed, 17 Jul 2019 06:34:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndW3-0004O4-SS
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:34:15 +0000
X-Inumbo-ID: e2d4f17a-a85c-11e9-b9bd-4f4d16a73ac8
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2d4f17a-a85c-11e9-b9bd-4f4d16a73ac8;
 Wed, 17 Jul 2019 06:34:11 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:34:09 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:34:01 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxLSVdL/z2NO3u3FDCMV72PfJOx9I9omL++Jch1c6S0pHPbtRrJtdlvMx9eFxnZAhuLE4dI3aaZFFNCYxyHCqp5ni09p+WRyGiXLkyI1mtWaJ04+ahYxfuesXs0TFaO6V/yFFTySSr68net9q+P7+JfWQEz2iwnAo6B/xJuuiMG7MbxptXc3klsTV3lJkmjAcrZgUztF0EDOueaZYzAigO56eMI3IvxrPH9Piw7NlRn1qII6jWbUFVlksPu72iruDCoPeBAnyEHyZrYygAJ2fMngON6ZTqOHmzb+C9n+G3ahiI9QCk1nUQ5bqDOiSfuEpWoA1fYT+WMC2AoOw4a07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mBU05F6obfBjOBfw3ZfXbqJd+51EfjhW18r6Uj25RE=;
 b=ZRGENmOJMOBlB6ErAxvPsZoEWmvXiu3OO1gHZ7vHtP415NesLcWMwiKMEc4gv7wh5B4E6TEylzLLJdoCLp0zVMhoyphAZ0SGL7M2e1pAJxuaGy1ZYibYx0KzsvUW4EhmxqjZrFye3nh+IyPKPM3G/Hz2Sp/28KdKSdC0pIXc6MyElBv0G1DrQcV1I08tuPdE9DzY0JaAUepYz7HUGzPGduQvZM5GOngLfapOEvkdriCOQ/Xsrs34AX5s/VMGwR4JMsyuY2QC1tH6PT+EmXgo+qqnM7wfEzxt4x+QGUEyG2BM+Zu6ebCH8EeWJBSpqA28iiCfjoYNjnA8cexDZH3tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3196.namprd18.prod.outlook.com (10.255.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 06:34:00 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:34:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v10 02/13] x86emul: support of AVX512_IFMA insns
Thread-Index: AQHVPGme1axw9Rbx3U6BAL8gaQc3fA==
Date: Wed, 17 Jul 2019 06:34:00 +0000
Message-ID: <cd492838-2635-b7d8-cafc-67d3d99d1c85@suse.com>
References: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
In-Reply-To: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0102CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:8::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 676b850a-ef02-4ad8-adb8-08d70a80c0ae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3196; 
x-ms-traffictypediagnostic: DM6PR18MB3196:
x-microsoft-antispam-prvs: <DM6PR18MB31969ED769DA8DA1069A0095B3C90@DM6PR18MB3196.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(6116002)(5660300002)(53936002)(31686004)(256004)(476003)(8936002)(66946007)(2616005)(446003)(81156014)(99286004)(486006)(11346002)(66066001)(6512007)(3846002)(478600001)(186003)(81166006)(4326008)(14444005)(54906003)(316002)(86362001)(7736002)(102836004)(8676002)(6506007)(36756003)(80792005)(68736007)(6916009)(2501003)(6486002)(26005)(76176011)(31696002)(386003)(64756008)(71200400001)(66446008)(6436002)(66476007)(25786009)(2906002)(66556008)(305945005)(14454004)(5640700003)(2351001)(71190400001)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3196;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FnacujvICMfJOXraogDKwugt6dSW5OUHODdIDWhCtByDYU/gjsEhoYnQgtaxC91r8nkl5vxe6xBgfTOJKLDpntNQJzUeylcEqrSLXIIztON7cGBU9dAbtbAUEtSVAKz9yYq6x6jFJSUV1PVyrOh4ziumbK0PrRR4dhS1Uf/aVj8VREIudR8cSknsEW64/tawAZvkjw6gUZs2kxlNAhZBKoXOP9bmRDSiktuLfxIraFCrd3BWjOt+nClC50YWKL45UUpQRow4mz7q1YOfVpgpkbHzuuy/t6YC+TvpivIKPXsNipURJ8bzc01xHBjax9uowToqF/YgFEiE5OaXx4igVjJXcxkjNiPWys7vqY2ELLKJgXijwvGzwC7Hmvo3xMYe4GRtaqRjbHymc2E08Fz2jvhqMMIRymD8ppe444RgCTA=
Content-ID: <62AE4259728512488849ABD326D1E363@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 676b850a-ef02-4ad8-adb8-08d70a80c0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:34:00.2228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3196
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v10 02/13] x86emul: support of AVX512_IFMA insns
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
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25jZSBhZ2FpbiB0YWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIGNvcnJlY3QgdGhlIChwdWJsaWMg
aW50ZXJmYWNlKSBuYW1lDQpvZiB0aGUgQVZYNTEyX0lGTUEgZmVhdHVyZSBmbGFnIHRvIG1hdGNo
IHRoZSBTRE0sIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQNCm5vIGV4dGVybmFsIGNvbnN1bWVyIGhh
cyBhY3R1YWxseSBiZWVuIHVzaW5nIHRoYXQgZmxhZyBzbyBmYXIuDQoNCkFzIGluIGEgZmV3IGNh
c2VzIGJlZm9yZSwgc2luY2UgdGhlIGluc25zIGhlcmUgYW5kIGluIHBhcnRpY3VsYXIgdGhlaXIN
Cm1lbW9yeSBhY2Nlc3MgcGF0dGVybnMgZm9sbG93IHRoZSB1c3VhbCBzY2hlbWUsIEkgZGlkbid0
IHRoaW5rIGl0IHdhcw0KbmVjZXNzYXJ5IHRvIGFkZCBhIGNvbnRyaXZlZCB0ZXN0IHNwZWNpZmlj
YWxseSBmb3IgdGhlbSwgYmV5b25kIHRoZQ0KRGlzcDggc2NhbGluZyBvbmUuDQoNClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KLS0tDQp2OTogUmUtYmFzZS4NCnY3
OiBSZWplY3QgRVZFWC5XPTAuDQp2NjogTmV3Lg0KDQotLS0gYS90b29scy90ZXN0cy94ODZfZW11
bGF0b3IvZXZleC1kaXNwOC5jDQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvZXZleC1k
aXNwOC5jDQpAQCAtNTQzLDYgKzU0MywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4
NTEyX2JpdGFsZ19hDQogICAgICBJTlNOKHBzaHVmYml0cW1iLCA2NiwgMGYzOCwgOGYsIHZsLCAg
YiwgdmwpLA0KICB9Ow0KICANCitzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyX2lmbWFf
YWxsW10gPSB7DQorICAgIElOU04ocG1hZGQ1Mmh1cSwgNjYsIDBmMzgsIGI1LCB2bCwgcSwgdmwp
LA0KKyAgICBJTlNOKHBtYWRkNTJsdXEsIDY2LCAwZjM4LCBiNCwgdmwsIHEsIHZsKSwNCit9Ow0K
Kw0KICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyX3ZibWlfYWxsW10gPSB7DQogICAg
ICBJTlNOKHBlcm1iLCAgICAgICAgIDY2LCAwZjM4LCA4ZCwgdmwsIGIsIHZsKSwNCiAgICAgIElO
U04ocGVybWkyYiwgICAgICAgNjYsIDBmMzgsIDc1LCB2bCwgYiwgdmwpLA0KQEAgLTkyOSw2ICs5
MzQsNyBAQCB2b2lkIGV2ZXhfZGlzcDhfdGVzdCh2b2lkICppbnN0ciwgc3RydWN0DQogICNkZWZp
bmUgY3B1X2hhc19hdng1MTJwZiBjcHVfaGFzX2F2eDUxMmYNCiAgICAgIFJVTihhdng1MTJwZiwg
NTEyKTsNCiAgICAgIFJVTihhdng1MTJfYml0YWxnLCBhbGwpOw0KKyAgICBSVU4oYXZ4NTEyX2lm
bWEsIGFsbCk7DQogICAgICBSVU4oYXZ4NTEyX3ZibWksIGFsbCk7DQogICAgICBSVU4oYXZ4NTEy
X3ZibWkyLCBhbGwpOw0KICAgICAgUlVOKGF2eDUxMl92cG9wY250ZHEsIGFsbCk7DQotLS0gYS90
b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2LWVtdWxhdGUuaA0KKysrIGIvdG9vbHMvdGVzdHMv
eDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgNCkBAIC0xMzcsNiArMTM3LDcgQEAgc3RhdGljIGlu
bGluZSBib29sIHhjcjBfbWFzayh1aW50NjRfdCBtYQ0KICAjZGVmaW5lIGNwdV9oYXNfYm1pMiAg
ICAgICBjcC5mZWF0LmJtaTINCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmYgICAoY3AuZmVhdC5h
dng1MTJmICAmJiB4Y3IwX21hc2soMHhlNikpDQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJkcSAg
KGNwLmZlYXQuYXZ4NTEyZHEgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KKyNkZWZpbmUgY3B1X2hhc19h
dng1MTJfaWZtYSAoY3AuZmVhdC5hdng1MTJfaWZtYSAmJiB4Y3IwX21hc2soMHhlNikpDQogICNk
ZWZpbmUgY3B1X2hhc19hdng1MTJlciAgKGNwLmZlYXQuYXZ4NTEyZXIgJiYgeGNyMF9tYXNrKDB4
ZTYpKQ0KICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyY2QgIChjcC5mZWF0LmF2eDUxMmNkICYmIHhj
cjBfbWFzaygweGU2KSkNCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmJ3ICAoY3AuZmVhdC5hdng1
MTJidyAmJiB4Y3IwX21hc2soMHhlNikpDQotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUv
eDg2X2VtdWxhdGUuYw0KKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRl
LmMNCkBAIC01MjEsNiArNTIxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBleHQwZjM4X3RhYmxl
IHsNCiAgICAgIFsweGFkXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3ZleHcsIC5kOHMg
PSBkOHNfZHEgfSwNCiAgICAgIFsweGFlXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2Zw
LCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHhhZl0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3Nj
YWxhcl92ZXh3LCAuZDhzID0gZDhzX2RxIH0sDQorICAgIFsweGI0IC4uLiAweGI1XSA9IHsgLnNp
bWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLmQ4cyA9IGQ4c192bCB9LA0KICAgICAgWzB4YjYg
Li4uIDB4YjhdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfZnAsIC5kOHMgPSBkOHNfdmwg
fSwNCiAgICAgIFsweGI5XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfc2NhbGFyX3ZleHcsIC5kOHMg
PSBkOHNfZHEgfSwNCiAgICAgIFsweGJhXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2Zw
LCAuZDhzID0gZDhzX3ZsIH0sDQpAQCAtMTg3NSw2ICsxODc2LDcgQEAgaW5fcHJvdG1vZGUoDQog
ICNkZWZpbmUgdmNwdV9oYXNfcmRzZWVkKCkgICAgICAoY3R4dC0+Y3B1aWQtPmZlYXQucmRzZWVk
KQ0KICAjZGVmaW5lIHZjcHVfaGFzX2FkeCgpICAgICAgICAgKGN0eHQtPmNwdWlkLT5mZWF0LmFk
eCkNCiAgI2RlZmluZSB2Y3B1X2hhc19zbWFwKCkgICAgICAgIChjdHh0LT5jcHVpZC0+ZmVhdC5z
bWFwKQ0KKyNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyX2lmbWEoKSAoY3R4dC0+Y3B1aWQtPmZlYXQu
YXZ4NTEyX2lmbWEpDQogICNkZWZpbmUgdmNwdV9oYXNfY2xmbHVzaG9wdCgpICAoY3R4dC0+Y3B1
aWQtPmZlYXQuY2xmbHVzaG9wdCkNCiAgI2RlZmluZSB2Y3B1X2hhc19jbHdiKCkgICAgICAgIChj
dHh0LT5jcHVpZC0+ZmVhdC5jbHdiKQ0KICAjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMnBmKCkgICAg
KGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMnBmKQ0KQEAgLTk0NTUsNiArOTQ1NywxMiBAQCB4ODZf
ZW11bGF0ZSgNCiAgICAgICAgICBicmVhazsNCiAgICAgIH0NCiAgDQorICAgIGNhc2UgWDg2RU1V
TF9PUENfRVZFWF82NigweDBmMzgsIDB4YjQpOiAvKiB2cG1hZGQ1Mmx1cSBbeHl6XW1tL21lbSxb
eHl6XW1tLFt4eXpdbW17a30gKi8NCisgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYz
OCwgMHhiNSk6IC8qIHZwbWFkZDUyaHVxIFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbXtrfSAq
Lw0KKyAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyX2lmbWEpOw0KKyAgICAg
ICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCFldmV4LncsIEVYQ19VRCk7DQorICAgICAgICBnb3Rv
IGF2eDUxMmZfbm9fc2FlOw0KKw0KICAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYz
OCwgMHhjNik6DQogICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweGM3KToN
CiAgICAgIHsNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZS5oDQorKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaA0KQEAgLTEwMSw2ICsxMDEsNyBAQA0KICAj
ZGVmaW5lIGNwdV9oYXNfYXZ4NTEyZHEgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9B
Vlg1MTJEUSkNCiAgI2RlZmluZSBjcHVfaGFzX3Jkc2VlZCAgICAgICAgICBib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfUkRTRUVEKQ0KICAjZGVmaW5lIGNwdV9oYXNfc21hcCAgICAgICAgICAgIGJv
b3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TTUFQKQ0KKyNkZWZpbmUgY3B1X2hhc19hdng1MTJfaWZt
YSAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0FWWDUxMl9JRk1BKQ0KICAjZGVmaW5lIGNw
dV9oYXNfYXZ4NTEyZXIgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9BVlg1MTJFUikN
CiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMmNkICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfQVZYNTEyQ0QpDQogICNkZWZpbmUgY3B1X2hhc19zaGEgICAgICAgICAgICAgYm9vdF9jcHVf
aGFzKFg4Nl9GRUFUVVJFX1NIQSkNCi0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9j
cHVmZWF0dXJlc2V0LmgNCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0
dXJlc2V0LmgNCkBAIC0yMTIsNyArMjEyLDcgQEAgWEVOX0NQVUZFQVRVUkUoQVZYNTEyRFEsICAg
ICAgNSozMisxNykgLw0KICBYRU5fQ1BVRkVBVFVSRShSRFNFRUQsICAgICAgICA1KjMyKzE4KSAv
KkEgIFJEU0VFRCBpbnN0cnVjdGlvbiAqLw0KICBYRU5fQ1BVRkVBVFVSRShBRFgsICAgICAgICAg
ICA1KjMyKzE5KSAvKkEgIEFEQ1gsIEFET1ggaW5zdHJ1Y3Rpb25zICovDQogIFhFTl9DUFVGRUFU
VVJFKFNNQVAsICAgICAgICAgIDUqMzIrMjApIC8qUyAgU3VwZXJ2aXNvciBNb2RlIEFjY2VzcyBQ
cmV2ZW50aW9uICovDQotWEVOX0NQVUZFQVRVUkUoQVZYNTEySUZNQSwgICAgNSozMisyMSkgLypB
ICBBVlgtNTEyIEludGVnZXIgRnVzZWQgTXVsdGlwbHkgQWRkICovDQorWEVOX0NQVUZFQVRVUkUo
QVZYNTEyX0lGTUEsICAgNSozMisyMSkgLypBICBBVlgtNTEyIEludGVnZXIgRnVzZWQgTXVsdGlw
bHkgQWRkICovDQogIFhFTl9DUFVGRUFUVVJFKENMRkxVU0hPUFQsICAgIDUqMzIrMjMpIC8qQSAg
Q0xGTFVTSE9QVCBpbnN0cnVjdGlvbiAqLw0KICBYRU5fQ1BVRkVBVFVSRShDTFdCLCAgICAgICAg
ICA1KjMyKzI0KSAvKkEgIENMV0IgaW5zdHJ1Y3Rpb24gKi8NCiAgWEVOX0NQVUZFQVRVUkUoQVZY
NTEyUEYsICAgICAgNSozMisyNikgLypBICBBVlgtNTEyIFByZWZldGNoIEluc3RydWN0aW9ucyAq
Lw0KLS0tIGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQ0KKysrIGIveGVuL3Rvb2xzL2dlbi1jcHVp
ZC5weQ0KQEAgLTI2MSw3ICsyNjEsNyBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOg0KICAg
ICAgICAgICMgKHdoaWNoIGluIHByYWN0aWNlIGRlcGVuZHMgb24gdGhlIEVWRVggcHJlZml4IHRv
IGVuY29kZSkgYXMgd2VsbA0KICAgICAgICAgICMgYXMgbWFzayByZWdpc3RlcnMsIGFuZCB0aGUg
aW5zdHJ1Y3Rpb25zIHRoZW1zZWx2ZXMuIEFsbCBmdXJ0aGVyDQogICAgICAgICAgIyBBVlg1MTIg
ZmVhdHVyZXMgYXJlIGJ1aWx0IG9uIHRvcCBvZiBBVlg1MTJGDQotICAgICAgICBBVlg1MTJGOiBb
QVZYNTEyRFEsIEFWWDUxMklGTUEsIEFWWDUxMlBGLCBBVlg1MTJFUiwgQVZYNTEyQ0QsDQorICAg
ICAgICBBVlg1MTJGOiBbQVZYNTEyRFEsIEFWWDUxMl9JRk1BLCBBVlg1MTJQRiwgQVZYNTEyRVIs
IEFWWDUxMkNELA0KICAgICAgICAgICAgICAgICAgICBBVlg1MTJCVywgQVZYNTEyVkwsIEFWWDUx
Ml80Vk5OSVcsIEFWWDUxMl80Rk1BUFMsDQogICAgICAgICAgICAgICAgICAgIEFWWDUxMl9WUE9Q
Q05URFFdLA0KICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
