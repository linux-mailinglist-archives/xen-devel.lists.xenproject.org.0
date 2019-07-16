Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867086A330
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:46:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnI8H-0002S5-U1; Tue, 16 Jul 2019 07:44:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnI8G-0002Ry-4Z
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:44:16 +0000
X-Inumbo-ID: 813fe010-a79d-11e9-a869-abc8de52668f
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 813fe010-a79d-11e9-a869-abc8de52668f;
 Tue, 16 Jul 2019 07:44:14 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:40:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:43:59 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwN9khupkO4lzBlsbDBwu+0GoL8JPuodopaf7rNvmjPR0JGOD8WZ6SLat8AnNWT+Ou4FW4ETOtmkUQ79/qy46lqUEoZ3rTC+ecLECaEkh/lJrjeNW+jS8hXqrXlJ5CUX0X1aN686dm7TAscodfOHaYA3nu+vaYsMpuK5jzfeL4CkkX+vnAt1ROZegsPZcuOsguh/a4V6axBiZwb0ROXF393atTFKbU+bJCahv/o2TrE/B8+re8aD3xKul6fsLAXpQbWVQlZtY2f+4a6RpIjtIswFHxZmoHFhgA7NYCJUr9fLofsOx3c3279Uj3q3lG4EgaE490hWzIyFdffqlPTvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud45kFB1sTD7uOcirFyzxBEkTNuKMogmsu4IJRPXpSg=;
 b=Gigrt7/xVxxo/DxbyCPUJNGKqGJaP7E1DFXF74k6+yYI+mv09Z6sZQc81/QU2rrrUTQ5/s/cnmm0lDii11G08t2YgWkTIb5qrKDECS9ZHWnPVskLa3p82OFLiYdj1ZeeZAgfO/swdQWdK1iFY/lSrPMojBoKblBW90OlRV9VcScqeciIeCI74hT4UGFF/uZN1uhRcJpBCPzgjOvF71N66HTxEx0GaEsOWE8/tx0yWmY//1hhl1RpBJdTuOyFeKnal9TIGDTIBcxNXr+BzI9la0f3R2HuotrrFmwhoD7BbekhPIfC8VMsOP1HuI60M90AY9d+Rjlf8vtPWniQNKpCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:43:57 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:43:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 11/13] x86/IRQ: tighten vector checks
Thread-Index: AQHVO6o5tt4GSJMvYEi1iMuGZsabYw==
Date: Tue, 16 Jul 2019 07:43:57 +0000
Message-ID: <72140e85-8444-4a51-358e-2cc297f86249@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0031.eurprd05.prod.outlook.com
 (2603:10a6:4:67::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ecd320d-c684-4388-8244-08d709c15c39
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB2667A19818043CA6C5AFC9DCB3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j8ldokWxeZxamVNjdUeHoEt5oogxahVzHF6J6vS/mXggbsxgltjgN1ieJl8vKSE/RXoVa0FQVMXgTOvcpWqRQBkcgtcRJTMC66+VtfxSL6OU/MvReaXbnGnBlbu5+KZZHLqP91n98C0kPwUgKfmfuDaqbvo1gKwY8mSZDzajtgHe3uY0gnw9tLJzzO3FHmUR2HjMrF2Sm9Hfs25/w7JeohLDpXTGlaPich48Yd55s0YropxR0EGzUaTn+aReXctkGoJ5Oy1ZmxqQtOOcNzl2jx8+ZQ9NgneYY9I31HjUKb/MuT18AyQ7htmZ4Sg2sfnLmBhSDNAWQcST4+AMjgtCeBi5KWStWtirw/VYE3Skz+NTKMZHXKlT/OoBpalsYa2k4DZpAk3Q0BjumuFUwpS3Cmx+9ptFbf/xKbnT/cQqlzA=
Content-ID: <533BACDCA3EEDA419966E19599BBDA5C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecd320d-c684-4388-8244-08d709c15c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:43:57.7864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 11/13] x86/IRQ: tighten vector checks
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

VXNlIHZhbGlkX2lycV92ZWN0b3IoKSByYXRoZXIgdGhhbiAiPiAwIi4NCg0KQWxzbyByZXBsYWNl
IGFuIG9wZW4tY29kZWQgdXNlIG9mIElSUV9WRUNUT1JfVU5BU1NJR05FRC4NCg0KU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQotLS0NCnYzOiBOZXcuDQoNCi0tLSBhL3hl
bi9hcmNoL3g4Ni9pcnEuYw0KKysrIGIveGVuL2FyY2gveDg2L2lycS5jDQpAQCAtMzQyLDcgKzM0
Miw3IEBAIHZvaWQgY2xlYXJfaXJxX3ZlY3RvcihpbnQgaXJxKQ0KICANCiAgaW50IGlycV90b192
ZWN0b3IoaW50IGlycSkNCiAgew0KLSAgICBpbnQgdmVjdG9yID0gLTE7DQorICAgIGludCB2ZWN0
b3IgPSBJUlFfVkVDVE9SX1VOQVNTSUdORUQ7DQogIA0KICAgICAgQlVHX09OKGlycSA+PSBucl9p
cnFzIHx8IGlycSA8IDApOw0KICANCkBAIC00NTIsMTUgKzQ1MiwxOCBAQCBzdGF0aWMgdm1hc2tf
dCAqaXJxX2dldF91c2VkX3ZlY3Rvcl9tYXNrDQogICAgICAgICAgICAgIGludCB2ZWN0b3I7DQog
ICAgICAgICAgICAgIA0KICAgICAgICAgICAgICB2ZWN0b3IgPSBpcnFfdG9fdmVjdG9yKGlycSk7
DQotICAgICAgICAgICAgaWYgKCB2ZWN0b3IgPiAwICkNCisgICAgICAgICAgICBpZiAoIHZhbGlk
X2lycV92ZWN0b3IodmVjdG9yKSApDQogICAgICAgICAgICAgIHsNCi0gICAgICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19JTkZPICJJUlEgJWQgYWxyZWFkeSBhc3NpZ25lZCB2ZWN0b3IgJWRcbiIs
DQorICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiSVJRJWQgYWxyZWFkeSBhc3Np
Z25lZCB2ZWN0b3IgJTAyeFxuIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICBpcnEsIHZlY3Rv
cik7DQogICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgICAgIEFTU0VSVCghdGVzdF9i
aXQodmVjdG9yLCByZXQpKTsNCiAgDQogICAgICAgICAgICAgICAgICBzZXRfYml0KHZlY3Rvciwg
cmV0KTsNCiAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgIGVsc2UgaWYgKCB2ZWN0b3IgIT0g
SVJRX1ZFQ1RPUl9VTkFTU0lHTkVEICkNCisgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19X
QVJOSU5HICJJUlElZCBtYXBwZWQgdG8gYm9ndXMgdmVjdG9yICUwMnhcbiIsDQorICAgICAgICAg
ICAgICAgICAgICAgICBpcnEsIHZlY3Rvcik7DQogICAgICAgICAgfQ0KICAgICAgfQ0KICAgICAg
ZWxzZSBpZiAoIElPX0FQSUNfSVJRKGlycSkgJiYNCkBAIC00OTEsNyArNDk0LDcgQEAgc3RhdGlj
IGludCBfYXNzaWduX2lycV92ZWN0b3Ioc3RydWN0IGlycQ0KICAgICAgdm1hc2tfdCAqaXJxX3Vz
ZWRfdmVjdG9ycyA9IE5VTEw7DQogIA0KICAgICAgb2xkX3ZlY3RvciA9IGlycV90b192ZWN0b3Io
aXJxKTsNCi0gICAgaWYgKCBvbGRfdmVjdG9yID4gMCApDQorICAgIGlmICggdmFsaWRfaXJxX3Zl
Y3RvcihvbGRfdmVjdG9yKSApDQogICAgICB7DQogICAgICAgICAgY3B1bWFza190IHRtcF9tYXNr
Ow0KICANCkBAIC01NTUsNyArNTU4LDcgQEAgbmV4dDoNCiAgICAgICAgICBjdXJyZW50X3ZlY3Rv
ciA9IHZlY3RvcjsNCiAgICAgICAgICBjdXJyZW50X29mZnNldCA9IG9mZnNldDsNCiAgDQotICAg
ICAgICBpZiAoIG9sZF92ZWN0b3IgPiAwICkNCisgICAgICAgIGlmICggdmFsaWRfaXJxX3ZlY3Rv
cihvbGRfdmVjdG9yKSApDQogICAgICAgICAgew0KICAgICAgICAgICAgICBjcHVtYXNrX2FuZChk
ZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaywNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKTsNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
