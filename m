Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979A6B6C1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:37:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndXf-0004jI-Is; Wed, 17 Jul 2019 06:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndXd-0004iy-S4
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:35:53 +0000
X-Inumbo-ID: 1de5d5a4-a85d-11e9-98e1-4baa1553c882
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1de5d5a4-a85d-11e9-98e1-4baa1553c882;
 Wed, 17 Jul 2019 06:35:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:35:48 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:35:28 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmDkHKsslspyYGQ+nJd+tk2rVTahexO9izNn3Lyr184PEJWnllcAoOATU3ZrhXNxCjvSQJEvAjaFsHgFoGQinDISEYxxPx9W2P1HrYh2uVQDcsOOEil0VvJsiXU6tUvA9uPxzpLvc9R7VVTgvNnQgPn8oSs+kS8QXSmSXGFLWVDg5m/waHxQVBqgeCcxicPYWy1X2uYE+H/4HiSLWbh/tfwlOXy7OiGsN4+v+TJFOduMUFfkx5f7H3quEj3SuYFTE/FLDEtlcEO/hOwgc6ibAEKfwSdudMXAJXcPGDZJD/2aD3noU6Cgu4FZp5/0bPGdImWVZqx72er73jpBmjaKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq+v+SFdIAcGCaWN3Tvk0iI+D8er81ZR2/yLRPPy1Fo=;
 b=Tw0o9pDvQOk3j8aQUdMkOTPbTJQKji34NoOCOprHk+K//OkpVuGpeW/JaqwQ6/bfcdL0mI4WuRBtWQMywLgbEh7y/1MOFhgJJQob1MZq6soRdqDgrRekeA9/wFgRAtRDOqwp3ngonFpiZ8S6+K5iVMN4i+LQ9s6+50XALt2m8lh03CZLD2QVfGuKFFWThTagOpbCfPSnsdlFpcgS1pzWdaCJQLfSWaBCSWkXHO+90lykurOVA8/rHU5xSwy39s6ixtHDjP6MrYc6pxPwZE1ebUg5yN3V0py8sJv7nTnQeEwzJBPjqloZZVW9pFRkV+EMzID8o08OsKDifPXu5W7S6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3196.namprd18.prod.outlook.com (10.255.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 06:35:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:35:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v10 06/13] x86emul: support AVX512_VNNI insns
Thread-Index: AQHVPGnScYcsl41MOUijOCji1FdrmA==
Date: Wed, 17 Jul 2019 06:35:27 +0000
Message-ID: <e33c6b41-fa00-1470-f5af-4c5b222db733@suse.com>
References: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
In-Reply-To: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0201CA0036.eurprd02.prod.outlook.com
 (2603:10a6:4:3f::46) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5557ee3-f468-4b74-792f-08d70a80f48d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3196; 
x-ms-traffictypediagnostic: DM6PR18MB3196:
x-microsoft-antispam-prvs: <DM6PR18MB31963412934A76796E2F2812B3C90@DM6PR18MB3196.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(6116002)(5660300002)(53936002)(31686004)(256004)(476003)(8936002)(66946007)(2616005)(446003)(81156014)(99286004)(486006)(11346002)(66066001)(6512007)(3846002)(478600001)(186003)(81166006)(4326008)(14444005)(54906003)(316002)(86362001)(7736002)(102836004)(8676002)(6506007)(36756003)(80792005)(68736007)(6916009)(2501003)(6486002)(26005)(76176011)(31696002)(386003)(64756008)(71200400001)(66446008)(6436002)(66476007)(25786009)(2906002)(66556008)(305945005)(14454004)(5640700003)(2351001)(71190400001)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3196;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 08TT4pffdGxCUjh7FxLCgw8UiLDTHUNdfDUQYzeg0M7xEFXl8Q2O1838n9MSdDqxJaOzFxD9QqaUnnMW6nVICLeYo2cM1OWHCvMoJztLtTOionTIQuRzgcIvEQgQZfljg6/f71uugulNhXfFgGONmY62vS9gvYcPoc76EHzAuGq6crUz4wEaxpJbwyIQQWZySUkTByCvnpnGZzDaLmlLJJnP6of9B5RBsfNJLQAFBc+nU2kzqhXwatxLU8j+HvQcjFTLuQxr1g9pfbsHrQHJg6sdkCW+5mX0FyNFqeyMjeSRrWPOUHQrlTLH/ys093k84QKD9dUywSLaavPHMGRiQZNhG/mC+/ly1u67+SyGlU3sJRESJavBfmGoHUkjMbI1mno8kNqNlgZEfbxlRBp056VKX+9s86Qb1x1mmNGcaeQ=
Content-ID: <AF1291D4006C414592D3B880DC8B551D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5557ee3-f468-4b74-792f-08d70a80f48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:35:27.2327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3196
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v10 06/13] x86emul: support AVX512_VNNI insns
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

QWxvbmcgdGhlIGxpbmVzIG9mIHRoZSA0Rk1BUFMgY2FzZSwgY29udmVydCB0aGUgNFZOTklXLWJh
c2VkIHRhYmxlDQplbnRyaWVzIHRvIGEgZGVjb2RlciBhZGp1c3RtZW50LiBCZWNhdXNlIG9mIHRo
ZSBjdXJyZW50IHNoYXJpbmcgb2YgdGFibGUNCmVudHJpZXMgYmV0d2VlbiBkaWZmZXJlbnQgKGlt
cGxpZWQpIG9wY29kZSBwcmVmaXhlcyBhbmQgd2l0aCB0aGUgc2FtZQ0KbWFqb3Igb3Bjb2RlcyBi
ZWluZyB1c2VkIGZvciB2cDRkcHdzc2R7LHN9LCB3aGljaCBoYXZlIGEgZGlmZmVyZW50DQptZW1v
cnkgb3BlcmFuZCBzaXplIGFuZCBkaWZmZXJlbnQgRGlzcDggc2NhbGluZywgdGhlIHByZS1leGlz
dGluZyB0YWJsZQ0KZW50cmllcyBnZXQgY29udmVydGVkIHRvIGEgZGVjb2RlciBvdmVycmlkZS4g
VGhlIHRhYmxlIGVudHJpZXMgd2lsbCBub3cNCnJlcHJlc2VudCB0aGUgaW5zbnMgaGVyZSwgaW4g
bGluZSB3aXRoIG90aGVyIHRhYmxlIGVudHJpZXMgcHJlZmVyYWJseQ0KcmVwcmVzZW50aW5nIHRo
ZSBwcmVmaXgtNjYgaW5zbnMuDQoNCkFzIGluIGEgZmV3IGNhc2VzIGJlZm9yZSwgc2luY2UgdGhl
IGluc25zIGhlcmUgYW5kIGluIHBhcnRpY3VsYXIgdGhlaXINCm1lbW9yeSBhY2Nlc3MgcGF0dGVy
bnMgZm9sbG93IHRoZSB1c3VhbCBzY2hlbWUsIEkgZGlkbid0IHRoaW5rIGl0IHdhcw0KbmVjZXNz
YXJ5IHRvIGFkZCBhIGNvbnRyaXZlZCB0ZXN0IHNwZWNpZmljYWxseSBmb3IgdGhlbSwgYmV5b25k
IHRoZQ0KRGlzcDggc2NhbGluZyBvbmUuDQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KLS0tDQp2OTogUmUtYmFzZS4gRXhwbGFpbiBuZWVkIGZvciBkZWNvZGVy
IHNwZWNpYWwgY2FzZS4NCnY4OiBSZS1iYXNlLg0Kdjc6IE5ldy4NCg0KLS0tIGEvdG9vbHMvdGVz
dHMveDg2X2VtdWxhdG9yL2V2ZXgtZGlzcDguYw0KKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxh
dG9yL2V2ZXgtZGlzcDguYw0KQEAgLTU4MCw2ICs1ODAsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB0ZXN0IGF2eDUxMl92Ym1pMl9hbA0KICAgICAgSU5TTihwc2hyZHcsICAgIDY2LCAwZjNhLCA3
MiwgdmwsICB3LCB2bCksDQogIH07DQogIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVzdCBhdng1
MTJfdm5uaV9hbGxbXSA9IHsNCisgICAgSU5TTihwZHBidXNkLCAgNjYsIDBmMzgsIDUwLCB2bCwg
ZCwgdmwpLA0KKyAgICBJTlNOKHBkcGJ1c2RzLCA2NiwgMGYzOCwgNTEsIHZsLCBkLCB2bCksDQor
ICAgIElOU04ocGRwd3NzZCwgIDY2LCAwZjM4LCA1MiwgdmwsIGQsIHZsKSwNCisgICAgSU5TTihw
ZHB3c3NkcywgNjYsIDBmMzgsIDUzLCB2bCwgZCwgdmwpLA0KK307DQorDQogIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgdGVzdCBhdng1MTJfdnBvcGNudGRxX2FsbFtdID0gew0KICAgICAgSU5TTihwb3Bj
bnQsIDY2LCAwZjM4LCA1NSwgdmwsIGRxLCB2bCkNCiAgfTsNCkBAIC05NTksNSArOTY2LDYgQEAg
dm9pZCBldmV4X2Rpc3A4X3Rlc3Qodm9pZCAqaW5zdHIsIHN0cnVjdA0KICAgICAgUlVOKGF2eDUx
Ml9pZm1hLCBhbGwpOw0KICAgICAgUlVOKGF2eDUxMl92Ym1pLCBhbGwpOw0KICAgICAgUlVOKGF2
eDUxMl92Ym1pMiwgYWxsKTsNCisgICAgUlVOKGF2eDUxMl92bm5pLCBhbGwpOw0KICAgICAgUlVO
KGF2eDUxMl92cG9wY250ZHEsIGFsbCk7DQogIH0NCi0tLSBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVs
YXRvci94ODYtZW11bGF0ZS5oDQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IveDg2LWVt
dWxhdGUuaA0KQEAgLTE0NCw2ICsxNDQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGNyMF9tYXNr
KHVpbnQ2NF90IG1hDQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJ2bCAgKGNwLmZlYXQuYXZ4NTEy
dmwgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyX3ZibWkgKGNw
LmZlYXQuYXZ4NTEyX3ZibWkgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0KICAjZGVmaW5lIGNwdV9oYXNf
YXZ4NTEyX3ZibWkyIChjcC5mZWF0LmF2eDUxMl92Ym1pMiAmJiB4Y3IwX21hc2soMHhlNikpDQor
I2RlZmluZSBjcHVfaGFzX2F2eDUxMl92bm5pIChjcC5mZWF0LmF2eDUxMl92bm5pICYmIHhjcjBf
bWFzaygweGU2KSkNCiAgI2RlZmluZSBjcHVfaGFzX2F2eDUxMl9iaXRhbGcgKGNwLmZlYXQuYXZ4
NTEyX2JpdGFsZyAmJiB4Y3IwX21hc2soMHhlNikpDQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJf
dnBvcGNudGRxIChjcC5mZWF0LmF2eDUxMl92cG9wY250ZHEgJiYgeGNyMF9tYXNrKDB4ZTYpKQ0K
ICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyXzR2bm5pdyAoY3AuZmVhdC5hdng1MTJfNHZubml3ICYm
IHhjcjBfbWFzaygweGU2KSkNCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11
bGF0ZS5jDQorKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYw0KQEAg
LTQ3OSw3ICs0NzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV4dDBmMzhfdGFibGUgew0KICAg
ICAgWzB4NGRdID0geyAuc2ltZF9zaXplID0gc2ltZF9zY2FsYXJfdmV4dywgLmQ4cyA9IGQ4c19k
cSB9LA0KICAgICAgWzB4NGVdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfZnAsIC50d29f
b3AgPSAxLCAuZDhzID0gZDhzX3ZsIH0sDQogICAgICBbMHg0Zl0gPSB7IC5zaW1kX3NpemUgPSBz
aW1kX3NjYWxhcl92ZXh3LCAuZDhzID0gZDhzX2RxIH0sDQotICAgIFsweDUyIC4uLiAweDUzXSA9
IHsgLnNpbWRfc2l6ZSA9IHNpbWRfMTI4LCAuZDhzID0gNCB9LA0KKyAgICBbMHg1MCAuLi4gMHg1
M10gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQsIC5kOHMgPSBkOHNfdmwgfSwNCiAg
ICAgIFsweDU0IC4uLiAweDU1XSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ludCwgLnR3
b19vcCA9IDEsIC5kOHMgPSBkOHNfdmwgfSwNCiAgICAgIFsweDU4XSA9IHsgLnNpbWRfc2l6ZSA9
IHNpbWRfb3RoZXIsIC50d29fb3AgPSAxLCAuZDhzID0gMiB9LA0KICAgICAgWzB4NTldID0geyAu
c2ltZF9zaXplID0gc2ltZF9vdGhlciwgLnR3b19vcCA9IDEsIC5kOHMgPSAzIH0sDQpAQCAtMTg5
MCw2ICsxODkwLDcgQEAgaW5fcHJvdG1vZGUoDQogICNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEydmwo
KSAgICAoY3R4dC0+Y3B1aWQtPmZlYXQuYXZ4NTEydmwpDQogICNkZWZpbmUgdmNwdV9oYXNfYXZ4
NTEyX3ZibWkoKSAoY3R4dC0+Y3B1aWQtPmZlYXQuYXZ4NTEyX3ZibWkpDQogICNkZWZpbmUgdmNw
dV9oYXNfYXZ4NTEyX3ZibWkyKCkgKGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMl92Ym1pMikNCisj
ZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl92bm5pKCkgKGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMl92
bm5pKQ0KICAjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl9iaXRhbGcoKSAoY3R4dC0+Y3B1aWQtPmZl
YXQuYXZ4NTEyX2JpdGFsZykNCiAgI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdnBvcGNudGRxKCkg
KGN0eHQtPmNwdWlkLT5mZWF0LmF2eDUxMl92cG9wY250ZHEpDQogICNkZWZpbmUgdmNwdV9oYXNf
cmRwaWQoKSAgICAgICAoY3R4dC0+Y3B1aWQtPmZlYXQucmRwaWQpDQpAQCAtMzE3OSw2ICszMTgw
LDggQEAgeDg2X2RlY29kZSgNCiAgDQogICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBiICkNCiAg
ICAgICAgICAgICAgICAgIHsNCisgICAgICAgICAgICAgICAgLyogdnA0ZHB3c3NkeyxzfSBuZWVk
IHNwZWNpYWwgY2FzaW5nICovDQorICAgICAgICAgICAgICAgIGNhc2UgMHg1MjogY2FzZSAweDUz
Og0KICAgICAgICAgICAgICAgICAgLyogdjRmeyxufW1hZGR7cCxzfXMgbmVlZCBzcGVjaWFsIGNh
c2luZyAqLw0KICAgICAgICAgICAgICAgICAgY2FzZSAweDlhOiBjYXNlIDB4OWI6IGNhc2UgMHhh
YTogY2FzZSAweGFiOg0KICAgICAgICAgICAgICAgICAgICAgIGlmICggZXZleC5wZnggPT0gdmV4
X2YyICkNCkBAIC05Mzk0LDYgKzkzOTcsMTQgQEAgeDg2X2VtdWxhdGUoDQogICAgICAgICAgICAg
IGF2eDUxMl92bGVuX2NoZWNrKHRydWUpOw0KICAgICAgICAgIGdvdG8gc2ltZF96bW07DQogIA0K
KyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDUwKTogLyogdnBkcGJ1c2Qg
W3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovDQorICAgIGNhc2UgWDg2RU1VTF9PUENf
RVZFWF82NigweDBmMzgsIDB4NTEpOiAvKiB2cGRwYnVzZHMgW3h5el1tbS9tZW0sW3h5el1tbSxb
eHl6XW1te2t9ICovDQorICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4NTIp
OiAvKiB2cGRwd3NzZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8NCisgICAgY2Fz
ZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg1Myk6IC8qIHZwZHB3c3NkcyBbeHl6XW1t
L21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8NCisgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9o
YXZlKGF2eDUxMl92bm5pKTsNCisgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihldmV4Lncs
IEVYQ19VRCk7DQorICAgICAgICBnb3RvIGF2eDUxMmZfbm9fc2FlOw0KKw0KICAgICAgY2FzZSBY
ODZFTVVMX09QQ19FVkVYX0YyKDB4MGYzOCwgMHg5YSk6IC8qIHY0Zm1hZGRwcyBtMTI4LHptbSsz
LHptbXtrfSAqLw0KICAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYX0YyKDB4MGYzOCwgMHhhYSk6
IC8qIHY0Zm5tYWRkcHMgbTEyOCx6bW0rMyx6bW17a30gKi8NCiAgICAgICAgICBob3N0X2FuZF92
Y3B1X211c3RfaGF2ZShhdng1MTJfNGZtYXBzKTsNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
Y3B1ZmVhdHVyZS5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWZlYXR1cmUuaA0KQEAg
LTExMSw2ICsxMTEsNyBAQA0KICAvKiBDUFVJRCBsZXZlbCAweDAwMDAwMDA3OjAuZWN4ICovDQog
ICNkZWZpbmUgY3B1X2hhc19hdng1MTJfdmJtaSAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJF
X0FWWDUxMl9WQk1JKQ0KICAjZGVmaW5lIGNwdV9oYXNfYXZ4NTEyX3ZibWkyICAgIGJvb3RfY3B1
X2hhcyhYODZfRkVBVFVSRV9BVlg1MTJfVkJNSTIpDQorI2RlZmluZSBjcHVfaGFzX2F2eDUxMl92
bm5pICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQVZYNTEyX1ZOTkkpDQogICNkZWZpbmUg
Y3B1X2hhc19hdng1MTJfYml0YWxnICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0FWWDUxMl9C
SVRBTEcpDQogICNkZWZpbmUgY3B1X2hhc19hdng1MTJfdnBvcGNudGRxIGJvb3RfY3B1X2hhcyhY
ODZfRkVBVFVSRV9BVlg1MTJfVlBPUENOVERRKQ0KICAjZGVmaW5lIGNwdV9oYXNfcmRwaWQgICAg
ICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9SRFBJRCkNCi0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCisrKyBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCkBAIC0yMjksNiArMjI5LDcgQEAgWEVOX0NQVUZF
QVRVUkUoVU1JUCwgICAgICAgICAgNiozMisgMikgLw0KICBYRU5fQ1BVRkVBVFVSRShQS1UsICAg
ICAgICAgICA2KjMyKyAzKSAvKkggIFByb3RlY3Rpb24gS2V5cyBmb3IgVXNlcnNwYWNlICovDQog
IFhFTl9DUFVGRUFUVVJFKE9TUEtFLCAgICAgICAgIDYqMzIrIDQpIC8qISAgT1MgUHJvdGVjdGlv
biBLZXlzIEVuYWJsZSAqLw0KICBYRU5fQ1BVRkVBVFVSRShBVlg1MTJfVkJNSTIsICA2KjMyKyA2
KSAvKkEgIEFkZGl0aW9uYWwgQVZYLTUxMiBWZWN0b3IgQnl0ZSBNYW5pcHVsYXRpb24gSW5zdHJz
ICovDQorWEVOX0NQVUZFQVRVUkUoQVZYNTEyX1ZOTkksICAgNiozMisxMSkgLypBICBWZWN0b3Ig
TmV1cmFsIE5ldHdvcmsgSW5zdHJzICovDQogIFhFTl9DUFVGRUFUVVJFKEFWWDUxMl9CSVRBTEcs
IDYqMzIrMTIpIC8qQSAgU3VwcG9ydCBmb3IgVlBPUENOVFtCLFddIGFuZCBWUFNIVUZCSVRRTUIg
Ki8NCiAgWEVOX0NQVUZFQVRVUkUoQVZYNTEyX1ZQT1BDTlREUSwgNiozMisxNCkgLypBICBQT1BD
TlQgZm9yIHZlY3RvcnMgb2YgRFcvUVcgKi8NCiAgWEVOX0NQVUZFQVRVUkUoUkRQSUQsICAgICAg
ICAgNiozMisyMikgLypBICBSRFBJRCBpbnN0cnVjdGlvbiAqLw0KLS0tIGEveGVuL3Rvb2xzL2dl
bi1jcHVpZC5weQ0KKysrIGIveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQ0KQEAgLTI2Myw3ICsyNjMs
NyBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOg0KICAgICAgICAgICMgQVZYNTEyIGZlYXR1
cmVzIGFyZSBidWlsdCBvbiB0b3Agb2YgQVZYNTEyRg0KICAgICAgICAgIEFWWDUxMkY6IFtBVlg1
MTJEUSwgQVZYNTEyX0lGTUEsIEFWWDUxMlBGLCBBVlg1MTJFUiwgQVZYNTEyQ0QsDQogICAgICAg
ICAgICAgICAgICAgIEFWWDUxMkJXLCBBVlg1MTJWTCwgQVZYNTEyXzRWTk5JVywgQVZYNTEyXzRG
TUFQUywNCi0gICAgICAgICAgICAgICAgICBBVlg1MTJfVlBPUENOVERRXSwNCisgICAgICAgICAg
ICAgICAgICBBVlg1MTJfVk5OSSwgQVZYNTEyX1ZQT1BDTlREUV0sDQogIA0KICAgICAgICAgICMg
QVZYNTEyIGV4dGVuc2lvbnMgYWN0aW5nIG9uIHZlY3RvcnMgb2YgYnl0ZXMvd29yZHMgYXJlIG1h
ZGUNCiAgICAgICAgICAjIGRlcGVuZGVudHMgb2YgQVZYNTEyQlcgKGFzIHRvIHJlcXVpcmluZyB3
aWRlciB0aGFuIDE2LWJpdCBtYXNrDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
