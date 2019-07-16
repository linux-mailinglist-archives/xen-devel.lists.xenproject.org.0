Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D336A343
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnICH-0002zH-AI; Tue, 16 Jul 2019 07:48:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnICF-0002yk-LD
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:48:23 +0000
X-Inumbo-ID: 14ba738a-a79e-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14ba738a-a79e-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:48:21 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:48:20 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:40:58 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:40:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpTDzwK2L8TCOqyYzqTKkBPah+VL4a78lVqXvKMy23L8M4uiRaVsPMamzkaIVgO0ljZNrew16zR1ayBHjH8GEotrtk65aJtoT+vmzojN5aWZ/JeXri8sRCI91PmXs9BSCoxwLS3164t0Uf4TLJfKgGmLk4CgaHHSW+O9qnmDWHgQR3VhC74iq2MNJqUh63pkdwt31nUXKxCLdFC52UVtyyeZxiXC2PX5+KUY3kYlLAlU6aNGzPhnugi1RI0qy+vUDmemvMnVZbydca/Dgd5K9yz1g0g/r4Gv+hpQ68DtWT8c9JeHZHgu2WRpzQ90iAdE2fQrE4LZdd0KF5hlCC9ClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma06aoY4nak3zDqj07tDPotoYKZ79Aybw397VBzTmFY=;
 b=bWN1IEj3OKO4NQdMUqVS0loCFCcoA+G/Y6BRDYhPsirjYn3Emp8JKhIVgDHx3PHWZ8v6cO6ndohgi+URhbiWdHGUbYZQhZXKZ/6QjiClqdvvzG1cN6D2M55RQiegk1k/u6FWmbyazVu3yVQo2CnGxtVP4I2yOAunkrmx8jewxGbO4GNEm4tc/nZQZbRJJjnMn24SCJATXMna87uq0q7eGsX+aiC35uNriQwv9l5N+DCMukSNef+5GyJjURkfwBxXSc4InZ/8KpTyl9pmVrdQO+vf697reicDe2aXEv1vCWsvbcaYYjtkVvj9NomoI0OGvso6P9mkC1v2fTGeaJVtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:40:57 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:40:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ affinities to
 online CPUs
Thread-Index: AQHVO6nO1yIoPbw3sE+gj0c0leZLnQ==
Date: Tue, 16 Jul 2019 07:40:57 +0000
Message-ID: <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fed0775-c5fe-47b8-071a-08d709c0f088
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB266710056D20C00AF9C2555BB3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Noz3Hq2T8DnH+aRiWMQuphYZ0s/weTLGeum0Rkr7e2y+5kvTQUnu3i20uYAcGXj6FRJiLhLleIputy8urnYVULCdYNblYrRig0M1jwUvVyu86H7hoQgtvJyFL4fHnC7je7beWluvJI3+bjprOEtEvXgUflelCBTGfAPUMzT4jHlK8MCveNgwvIBpIOc1RQnLFA8nInT44wZm/QuJOTTcvwm9XputYV+CjXZGN3cpX7iBIlgXpXqVEaVZBIE3qVhKyIscoNNSRtgRQjfxFelrZY2irJeTxE/1EKN2YPCr5J1VppkycIHa4FKWObel042Je/MXY9S+KTuuhoCFqitPqYKH2XB89SXW6zvmW6Ui5ZR2ZMxnUFiCnsvsGVh9KY34i6MLWlw1RI3inU920IzuI8ceRW4Wq8dfGEhlpwwpGYI=
Content-ID: <B8886C2D55C10C428AB32F911C24DA67@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fed0775-c5fe-47b8-071a-08d709c0f088
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:40:57.2130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Brian Woods <brian.woods@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gbGluZSB3aXRoICJ4ODYvSVJROiBkZXNjLT5hZmZpbml0eSBzaG91bGQgc3RyaWN0bHkgcmVw
cmVzZW50IHRoZQ0KcmVxdWVzdGVkIHZhbHVlIiB0aGUgaW50ZXJuYWxseSB1c2VkIElSUShzKSBh
bHNvIHNob3VsZG4ndCBiZSByZXN0cmljdGVkDQp0byBvbmxpbmUgb25lcy4gTWFrZSBzZXRfZGVz
Y19hZmZpbml0eSgpIChzZXRfbXNpX2FmZmluaXR5KCkgdGhlbiBkb2VzDQpieSBpbXBsaWNhdGlv
bikgY29wZSB3aXRoIGEgTlVMTCBtYXNrIGJlaW5nIHBhc3NlZCAoanVzdCBsaWtlDQphc3NpZ25f
aXJxX3ZlY3RvcigpIGRvZXMpLCBhbmQgaGF2ZSBJT01NVSBjb2RlIHBhc3MgTlVMTCBpbnN0ZWFk
IG9mDQomY3B1X29ubGluZV9tYXAgKHdoZW4sIGZvciBWVC1kLCB0aGVyZSdzIG5vIE5VTUEgbm9k
ZSBpbmZvcm1hdGlvbg0KYXZhaWxhYmxlKS4NCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQp2NDogTmV3Lg0KDQotLS0gYS94ZW4vYXJjaC94ODYv
aXJxLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KQEAgLTc5NiwxOCArNzk2LDI2IEBAIHVu
c2lnbmVkIGludCBzZXRfZGVzY19hZmZpbml0eShzdHJ1Y3QgaXINCiAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7DQogICAgICBjcHVtYXNrX3QgZGVzdF9tYXNrOw0KICANCi0gICAgaWYgKCFjcHVt
YXNrX2ludGVyc2VjdHMobWFzaywgJmNwdV9vbmxpbmVfbWFwKSkNCisgICAgaWYgKCBtYXNrICYm
ICFjcHVtYXNrX2ludGVyc2VjdHMobWFzaywgJmNwdV9vbmxpbmVfbWFwKSApDQogICAgICAgICAg
cmV0dXJuIEJBRF9BUElDSUQ7DQogIA0KICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnZlY3Rvcl9s
b2NrLCBmbGFncyk7DQotICAgIHJldCA9IF9hc3NpZ25faXJxX3ZlY3RvcihkZXNjLCBtYXNrKTsN
CisgICAgcmV0ID0gX2Fzc2lnbl9pcnFfdmVjdG9yKGRlc2MsIG1hc2sgPzogVEFSR0VUX0NQVVMp
Ow0KICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsNCiAg
DQotICAgIGlmIChyZXQgPCAwKQ0KKyAgICBpZiAoIHJldCA8IDAgKQ0KICAgICAgICAgIHJldHVy
biBCQURfQVBJQ0lEOw0KICANCi0gICAgY3B1bWFza19jb3B5KGRlc2MtPmFmZmluaXR5LCBtYXNr
KTsNCi0gICAgY3B1bWFza19hbmQoJmRlc3RfbWFzaywgbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFz
ayk7DQorICAgIGlmICggbWFzayApDQorICAgIHsNCisgICAgICAgIGNwdW1hc2tfY29weShkZXNj
LT5hZmZpbml0eSwgbWFzayk7DQorICAgICAgICBjcHVtYXNrX2FuZCgmZGVzdF9tYXNrLCBtYXNr
LCBkZXNjLT5hcmNoLmNwdV9tYXNrKTsNCisgICAgfQ0KKyAgICBlbHNlDQorICAgIHsNCisgICAg
ICAgIGNwdW1hc2tfc2V0YWxsKGRlc2MtPmFmZmluaXR5KTsNCisgICAgICAgIGNwdW1hc2tfY29w
eSgmZGVzdF9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrKTsNCisgICAgfQ0KICAgICAgY3B1bWFz
a19hbmQoJmRlc3RfbWFzaywgJmRlc3RfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsNCiAgDQogICAg
ICByZXR1cm4gY3B1X21hc2tfdG9fYXBpY2lkKCZkZXN0X21hc2spOw0KLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2luaXQuYw0KQEAgLTg4OCw3ICs4ODgsNyBAQCBzdGF0aWMgdm9pZCBl
bmFibGVfaW9tbXUoc3RydWN0IGFtZF9pb21tDQogIA0KICAgICAgZGVzYyA9IGlycV90b19kZXNj
KGlvbW11LT5tc2kuaXJxKTsNCiAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQotICAgIHNl
dF9tc2lfYWZmaW5pdHkoZGVzYywgJmNwdV9vbmxpbmVfbWFwKTsNCisgICAgc2V0X21zaV9hZmZp
bml0eShkZXNjLCBOVUxMKTsNCiAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCiAgDQog
ICAgICBhbWRfaW9tbXVfbXNpX2VuYWJsZShpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsN
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQorKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KQEAgLTIxMzMsMTEgKzIxMzMsMTEgQEAgc3Rh
dGljIHZvaWQgYWRqdXN0X2lycV9hZmZpbml0eShzdHJ1Y3QgYQ0KICAgICAgY29uc3Qgc3RydWN0
IGFjcGlfcmhzYV91bml0ICpyaHNhID0gZHJoZF90b19yaHNhKGRyaGQpOw0KICAgICAgdW5zaWdu
ZWQgaW50IG5vZGUgPSByaHNhID8gcHhtX3RvX25vZGUocmhzYS0+cHJveGltaXR5X2RvbWFpbikN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IE5VTUFfTk9fTk9ERTsNCi0gICAgY29u
c3QgY3B1bWFza190ICpjcHVtYXNrID0gJmNwdV9vbmxpbmVfbWFwOw0KKyAgICBjb25zdCBjcHVt
YXNrX3QgKmNwdW1hc2sgPSBOVUxMOw0KICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjOw0KICAN
CiAgICAgIGlmICggbm9kZSA8IE1BWF9OVU1OT0RFUyAmJiBub2RlX29ubGluZShub2RlKSAmJg0K
LSAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cygmbm9kZV90b19jcHVtYXNrKG5vZGUpLCBjcHVt
YXNrKSApDQorICAgICAgICAgY3B1bWFza19pbnRlcnNlY3RzKCZub2RlX3RvX2NwdW1hc2sobm9k
ZSksICZjcHVfb25saW5lX21hcCkgKQ0KICAgICAgICAgIGNwdW1hc2sgPSAmbm9kZV90b19jcHVt
YXNrKG5vZGUpOw0KICANCiAgICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhkcmhkLT5pb21tdS0+bXNp
LmlycSk7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
