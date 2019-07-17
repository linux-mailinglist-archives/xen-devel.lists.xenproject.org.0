Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039266BF6E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 18:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnmPb-00024s-OV; Wed, 17 Jul 2019 16:04:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnmPa-00024n-JN
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:04:10 +0000
X-Inumbo-ID: 7212b0ee-a8ac-11e9-b007-f7e3f830f5a6
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7212b0ee-a8ac-11e9-b007-f7e3f830f5a6;
 Wed, 17 Jul 2019 16:04:07 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 16:03:39 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 16:02:56 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 16:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe5gmz8RGfxJlq0+KYNqUvoe7NwoFdZKDrsR+EyUPzgcrgf899HWgCyWnO21dQ0qnOHX3cOjWQbHas7U/2CCq8McWMF27uVRjNw4OMt29bod028C8dWvtspbl39B/YfaBxVxZ1a8EqOfucKUHZHqYrj0OehDYKpNyuzFICvOcssofiHylB+rep7Gu32QO0n3GjBUifLGmyNW2j8QnIpkq3ThneQmk+hJ3BE7Gthh6ps/VHel2812jKIPUB4R1o/ybqmnjUg3tlem8tjNR4k5/HPXNHNH7Rn4wT+cFpqcbI0RGbkEf3phYPPAmZ2/QivZlvgnQbUaq5c0EaimLEL7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yslL580Mkil9M70hJUBUralZXl+xHSCHvi6gp/y3nw=;
 b=P8XA6yHl7X6O5D+VsqIvh5g6HzI5p1jqASJXYY+02wtId8MD+IxLG7p7f0bJXToTzZErSUb/KVwh8hEPUCcHNUdt50vYjQVb8jlkaovb3E/5PMXfoOrRuWBWFIHfO09at6fF7Bv4G0yj0LFaE6RT2p8j3MbR4QNOEE3FwM3P+joeEk+U+fySj0SRd/w5t5xuZ1X+Ee2Q4snr7/aBebf7wVVKg7kQ2Mcdx5FohRR/XLpcVnKipKgdb/7A355iMvjz5tv18s1tgllSzfT4xXyxlXuFfUz5dh+LpsGqsG8Syvee63ohQX4IXHnnVNZhQGTiDROo9GVqjI820t19etFydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2683.namprd18.prod.outlook.com (20.179.107.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 16:02:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 16:02:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/vLAPIC: avoid speculative out of bounds accesses
Thread-Index: AQHVPLkYZF8+iP93okCS7B48MIFZhA==
Date: Wed, 17 Jul 2019 16:02:55 +0000
Message-ID: <8ef6318e-83ca-780d-8472-9f617eae4896@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::11)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c50ad6-7803-4db8-05ed-08d70ad03ab0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2683; 
x-ms-traffictypediagnostic: DM6PR18MB2683:
x-microsoft-antispam-prvs: <DM6PR18MB2683D6422B91D68CE0A2782DB3C90@DM6PR18MB2683.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(81156014)(31686004)(99286004)(256004)(6116002)(8936002)(3846002)(81166006)(14444005)(2351001)(2906002)(8676002)(68736007)(80792005)(25786009)(14454004)(316002)(2501003)(54906003)(486006)(31696002)(6506007)(102836004)(386003)(52116002)(4326008)(71190400001)(71200400001)(26005)(5660300002)(66066001)(66556008)(66946007)(66476007)(64756008)(66446008)(36756003)(86362001)(2616005)(476003)(186003)(478600001)(6512007)(6916009)(53936002)(6486002)(7736002)(305945005)(5640700003)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2683;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F9V2p9Gc/Ov9r8Ss1eA0TbH/UXBGTaWDC8ta6RjRZ/977tTZiQ8DftATGBaCd1XM8CSbqh5KgAe25J7nuQCpIVtAnFCCiKODiODbBuCEHCjexWxWQ31/BVFN+Y9Lqw2LudJ0rEufqjAkqgW921RvFKSTp4VhdpJlJtWRuoZWvST9DucQpw/HexQShW6eyrgt5VPE6A9PE1X9+itQc6RHvqErY27l/lftjrYGiBda0J7X5YeqZuq2mUgqLLZr2Wg6Ha1PBFwRPBUwVgkuzD2HCHbHA8u4TE7vBx+vZWCRdfpEJ1OvkCRwpDpVXmjonEYo9I38Swh52Fu6Br6cb609lqfg7YUveMbKhjQ09CT+qz/4A/uvUfw0esabJttX06ovOox2X/gwQJ7aCQnocbD5Ftwe5XRRkWBFRpFAX6nGgQA=
Content-ID: <65B436ADE4BBE043A10D8CBC04E2F00A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c50ad6-7803-4db8-05ed-08d70ad03ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:02:55.2622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2683
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2] x86/vLAPIC: avoid speculative out of bounds
 accesses
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

QXJyYXkgaW5kZXhlcyB1c2VkIGluIHRoZSBNU1IgcmVhZC93cml0ZSBlbXVsYXRpb24gZnVuY3Rp
b25zIGFzIHdlbGwgYXMNCnRoZSBkaXJlY3QgVk1YIC8gQVBJQy1WIGhvb2sgYXJlIGRlcml2ZWQg
ZnJvbSBndWVzdCBjb250cm9sbGVkIHZhbHVlcy4NClJlc3RyaWN0IHRoZWlyIHJhbmdlcyB0byBs
aW1pdCB0aGUgc2lkZSBlZmZlY3RzIG9mIHNwZWN1bGF0aXZlDQpleGVjdXRpb24uDQoNCkFsb25n
IHRoZXNlIGxpbmVzIGFsc28gY29uc3RyYWluIHRoZSB2bGFwaWNfbHZ0X21hc2tbXSBhY2Nlc3Mu
DQoNClJlbW92ZSB0aGUgdW51c2VkIHZsYXBpY19sdnRfe3ZlY3RvcixkbX0oKSBpbnN0ZWFkIG9m
IGFkanVzdGluZyB0aGVtLg0KDQpUaGlzIGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRl
bmluZyBlZmZvcnQuDQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCi0tLQ0KdjI6IERyb3AgY2hhbmdlcyB0byB2bGFwaWNfbW1pb197cmVhZCx3cml0ZX0o
KS4gRHJvcA0KICAgICBWTEFQSUNfT0ZGU0VUX01BU0soKS4gQWxzbyB0d2VhayBndWVzdF93cm1z
cl94MmFwaWMoKS4NCg0KLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYw0KKysrIGIveGVu
L2FyY2gveDg2L2h2bS92bGFwaWMuYw0KQEAgLTIzLDYgKzIzLDcgQEANCiAgI2luY2x1ZGUgPHhl
bi9kb21haW4uaD4NCiAgI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPg0KICAjaW5jbHVkZSA8
eGVuL2V2ZW50Lmg+DQorI2luY2x1ZGUgPHhlbi9ub3NwZWMuaD4NCiAgI2luY2x1ZGUgPHhlbi90
cmFjZS5oPg0KICAjaW5jbHVkZSA8eGVuL2xpYi5oPg0KICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+
DQpAQCAtNjUsMTIgKzY2LDYgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCB2bGFwaWNfbHZ0
X21hcw0KICAgICAgIExWVF9NQVNLDQogIH07DQogIA0KLSNkZWZpbmUgdmxhcGljX2x2dF92ZWN0
b3IodmxhcGljLCBsdnRfdHlwZSkgICAgICAgICAgICAgICAgICAgICBcDQotICAgICh2bGFwaWNf
Z2V0X3JlZyh2bGFwaWMsIGx2dF90eXBlKSAmIEFQSUNfVkVDVE9SX01BU0spDQotDQotI2RlZmlu
ZSB2bGFwaWNfbHZ0X2RtKHZsYXBpYywgbHZ0X3R5cGUpICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCi0gICAgKHZsYXBpY19nZXRfcmVnKHZsYXBpYywgbHZ0X3R5cGUpICYgQVBJQ19NT0RFX01B
U0spDQotDQogICNkZWZpbmUgdmxhcGljX2x2dHRfcGVyaW9kKHZsYXBpYykgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQogICAgICAoKHZsYXBpY19nZXRfcmVnKHZsYXBpYywgQVBJQ19M
VlRUKSAmIEFQSUNfVElNRVJfTU9ERV9NQVNLKSBcDQogICAgICAgPT0gQVBJQ19USU1FUl9NT0RF
X1BFUklPRElDKQ0KQEAgLTY3Niw3ICs2NzEsNyBAQCBpbnQgZ3Vlc3RfcmRtc3JfeDJhcGljKGNv
bnN0IHN0cnVjdCB2Y3B1DQogICAgICB9Ow0KICAgICAgY29uc3Qgc3RydWN0IHZsYXBpYyAqdmxh
cGljID0gdmNwdV92bGFwaWModik7DQogICAgICB1aW50NjRfdCBoaWdoID0gMDsNCi0gICAgdWlu
dDMyX3QgcmVnID0gbXNyIC0gTVNSX1gyQVBJQ19GSVJTVCwgb2Zmc2V0ID0gcmVnIDw8IDQ7DQor
ICAgIHVpbnQzMl90IHJlZyA9IG1zciAtIE1TUl9YMkFQSUNfRklSU1QsIG9mZnNldDsNCiAgDQog
ICAgICAvKg0KICAgICAgICogVGhlIHJlYWQgc2lkZSBsb29rcyBhcyBpZiBpdCBtaWdodCBiZSBz
YWZlIHRvIHVzZSBvdXRzaWRlIG9mIGN1cnJlbnQNCkBAIC02ODYsOSArNjgxLDE0IEBAIGludCBn
dWVzdF9yZG1zcl94MmFwaWMoY29uc3Qgc3RydWN0IHZjcHUNCiAgICAgIEFTU0VSVCh2ID09IGN1
cnJlbnQpOw0KICANCiAgICAgIGlmICggIXZsYXBpY194MmFwaWNfbW9kZSh2bGFwaWMpIHx8DQot
ICAgICAgICAgKHJlZyA+PSBzaXplb2YocmVhZGFibGUpICogOCkgfHwgIXRlc3RfYml0KHJlZywg
cmVhZGFibGUpICkNCisgICAgICAgICAocmVnID49IHNpemVvZihyZWFkYWJsZSkgKiA4KSApDQor
ICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047DQorDQorICAgIHJlZyA9IGFycmF5X2lu
ZGV4X25vc3BlYyhyZWcsIHNpemVvZihyZWFkYWJsZSkgKiA4KTsNCisgICAgaWYgKCAhdGVzdF9i
aXQocmVnLCByZWFkYWJsZSkgKQ0KICAgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsN
CiAgDQorICAgIG9mZnNldCA9IHJlZyA8PCA0Ow0KICAgICAgaWYgKCBvZmZzZXQgPT0gQVBJQ19J
Q1IgKQ0KICAgICAgICAgIGhpZ2ggPSAodWludDY0X3QpdmxhcGljX3JlYWRfYWxpZ25lZCh2bGFw
aWMsIEFQSUNfSUNSMikgPDwgMzI7DQogIA0KQEAgLTg2Nyw3ICs4NjcsNyBAQCB2b2lkIHZsYXBp
Y19yZWdfd3JpdGUoc3RydWN0IHZjcHUgKnYsIHVuDQogICAgICBjYXNlIEFQSUNfTFZURVJSOiAg
ICAgICAvKiBMVlQgRXJyb3IgUmVnICovDQogICAgICAgICAgaWYgKCB2bGFwaWNfc3dfZGlzYWJs
ZWQodmxhcGljKSApDQogICAgICAgICAgICAgIHZhbCB8PSBBUElDX0xWVF9NQVNLRUQ7DQotICAg
ICAgICB2YWwgJj0gdmxhcGljX2x2dF9tYXNrWyhyZWcgLSBBUElDX0xWVFQpID4+IDRdOw0KKyAg
ICAgICAgdmFsICY9IGFycmF5X2FjY2Vzc19ub3NwZWModmxhcGljX2x2dF9tYXNrLCAocmVnIC0g
QVBJQ19MVlRUKSA+PiA0KTsNCiAgICAgICAgICB2bGFwaWNfc2V0X3JlZyh2bGFwaWMsIHJlZywg
dmFsKTsNCiAgICAgICAgICBpZiAoIHJlZyA9PSBBUElDX0xWVDAgKQ0KICAgICAgICAgIHsNCkBA
IC05NTcsNyArOTU3LDcgQEAgc3RhdGljIGludCB2bGFwaWNfbW1pb193cml0ZShzdHJ1Y3QgdmNw
dQ0KICBpbnQgdmxhcGljX2FwaWN2X3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQg
b2Zmc2V0KQ0KICB7DQogICAgICBzdHJ1Y3QgdmxhcGljICp2bGFwaWMgPSB2Y3B1X3ZsYXBpYyh2
KTsNCi0gICAgdWludDMyX3QgdmFsID0gdmxhcGljX2dldF9yZWcodmxhcGljLCBvZmZzZXQpOw0K
KyAgICB1aW50MzJfdCB2YWwgPSB2bGFwaWNfZ2V0X3JlZyh2bGFwaWMsIG9mZnNldCAmIH4weGYp
Ow0KICANCiAgICAgIGlmICggdmxhcGljX3gyYXBpY19tb2RlKHZsYXBpYykgKQ0KICAgICAgew0K
QEAgLTEwNTMsNyArMTA1Myw3IEBAIGludCBndWVzdF93cm1zcl94MmFwaWMoc3RydWN0IHZjcHUg
KnYsIHUNCiAgICAgICAgICB9DQogICAgICB9DQogIA0KLSAgICB2bGFwaWNfcmVnX3dyaXRlKHYs
IG9mZnNldCwgbXNyX2NvbnRlbnQpOw0KKyAgICB2bGFwaWNfcmVnX3dyaXRlKHYsIGFycmF5X2lu
ZGV4X25vc3BlYyhvZmZzZXQsIFBBR0VfU0laRSksIG1zcl9jb250ZW50KTsNCiAgDQogICAgICBy
ZXR1cm4gWDg2RU1VTF9PS0FZOw0KICB9DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
