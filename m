Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12406A349
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:51:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnICs-00038W-3T; Tue, 16 Jul 2019 07:49:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnICq-000389-Rk
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:49:00 +0000
X-Inumbo-ID: 2bed52b3-a79e-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bed52b3-a79e-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:48:59 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:48:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:42:54 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgvoSBFmMv7WGLh9/WaZFcOiVcFxrsq5ghLIfK3raBIII5BTzK9AVYCtC8YF4ACshsnZhp14TY5OvkdhdZepLlyv+RWgymbp0U1v6ar+SuDXSesHxEUM8Ur1Uy0GffHO3oQhIBDqHb0t53yXF0Di5JZB6H/ABP1kpTJ1g4VlYHu4qwt0oeEfDNHaOScbnDexredxIlVQ+xk3QlOWNxsu85RY2bGJqFiBXrm9C55ZrLL4m3myZOZXmx8fYMeO3hz1kEaD4Rat6jHBsbwbfz5P0YucRDMxxHySIJulLpo1424FFv0uEK2xEjrXnHrUj6fGPuSSAhrCW0dX267J6YeVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8hVC/1ezoY+R3ujgihcV7SxQy/qj+S2tXmHLjdKXNE=;
 b=fRKB8oeopJeueBu+bpOSXiQtBI2NNwez5DViiUO6B+ygppM8oRuOXZy0/nOeJXq5DZbIaSZw6VNOTBDPHGCg+SrUDc6faT5xpkUNpPqyFhbqQ2vd464G2RUV3KLINV7Tla7K9FWxddVLxPxiq6d4Q1yIWBmBFp6W/MA8qnc7gmD/AGAoZSZ/l94PQQE3zJQmeo6A4VNHXZEDFGCMZTKBWKrT8hTb5cJp9qFXS1hoCE2gsHwCojSBXwO3EtNVyOi5f2cGy1ISVMMgNgmBVhnuxHfI71mZWEXDkylYZVsdc3PTxs42rzyq5pLojIoGSM/I+Gaj9d5af+q2chpSJ9Q2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0052.namprd18.prod.outlook.com (20.178.229.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Tue, 16 Jul 2019 07:42:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:42:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 09/13] x86/IRQ: make fixup_irqs() skip unconnected
 internally used interrupts
Thread-Index: AQHVO6oTaUj7aNLMhEKbfLYrbqP/Jg==
Date: Tue, 16 Jul 2019 07:42:53 +0000
Message-ID: <2f1b85d5-f5a7-289c-c2d6-7f742d8caca5@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::31) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19ab2380-a2e3-4c2c-4efc-08d709c135d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0052; 
x-ms-traffictypediagnostic: DM6SPR01MB0052:
x-microsoft-antispam-prvs: <DM6SPR01MB00525A6A66A5485C4A9C44A8B3CE0@DM6SPR01MB0052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(6116002)(6436002)(25786009)(478600001)(31686004)(6486002)(3846002)(86362001)(52116002)(8936002)(68736007)(8676002)(446003)(76176011)(386003)(102836004)(6506007)(186003)(31696002)(14454004)(2351001)(26005)(66556008)(66066001)(2616005)(11346002)(476003)(305945005)(71190400001)(2906002)(54906003)(6512007)(71200400001)(53936002)(2501003)(316002)(99286004)(66446008)(256004)(4326008)(7736002)(80792005)(66946007)(64756008)(486006)(36756003)(6916009)(5660300002)(81156014)(66476007)(14444005)(81166006)(5640700003)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0052;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PKNtqYMwA6+ynxOIErAjg9K9DMdYQQ2OK5flTrnZQxOlcO5inblcZL8P43tgbHqsEschhfQAls1osDGzNYPwSHwQ4SXWQ4sisFV8V1K+mWtuH/xdfrhsMKbHU/yiBARfIvZNs1/LeZWVkwcexzYtKifCZ3DlehPE+J/yfTYusgk8r3k83OF+IrY3Znao/1Iy/+UYYgYqiL5ggsuQCeTq/+CfB3GBo5bEpr+gdhvFLwg9pwZ3gBPC8GCGydd9ohutysyXpI8smciKhkRjWo1sOSvgu+V3nnWaebPsxuce9KNwnnEkEk5RvNertaKVpo2FVHkjnQ4PzB1nNl6e+Ww77VXi/smNJp3EGduGbKG/N2Plf0OtGSvKXTaFGWFgn54X3ahXcwC9FUVLp6jY5GcavMttkthoWOrK6qUs3BQsygc=
Content-ID: <1026F4F78DF8AD44BA8CF1EE32742006@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ab2380-a2e3-4c2c-4efc-08d709c135d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:42:53.3773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0052
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 09/13] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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

U2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9uZSB0aW1l
IG9uZSwgYXZvaWQNCnRyaWdnZXJpbmcgaXQgYWxyZWFkeSBhdCBib290IHRpbWUgd2hlbiBwYXJr
aW5nIHNlY29uZGFyeSB0aHJlYWRzIGFuZA0KdGhlIHNlcmlhbCBjb25zb2xlIHVzZXMgYSAoc3Rp
bGwgdW5jb25uZWN0ZWQgYXQgdGhhdCB0aW1lKSBQQ0kgSVJRLg0KDQpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KLS0tIGEveGVuL2FyY2gveDg2L2lycS5jDQorKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMNCkBAIC0yNDcyLDggKzI0NzIsMjAgQEAgdm9pZCBmaXh1cF9p
cnFzKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgYg0KICAgICAgICAgIHZlY3RvciA9IGlycV90b192
ZWN0b3IoaXJxKTsNCiAgICAgICAgICBpZiAoIHZlY3RvciA+PSBGSVJTVF9ISVBSSU9SSVRZX1ZF
Q1RPUiAmJg0KICAgICAgICAgICAgICAgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1Ig
KQ0KKyAgICAgICAgew0KICAgICAgICAgICAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLmNwdV9t
YXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrLCBtYXNrKTsNCiAgDQorICAgICAgICAgICAgLyoNCisg
ICAgICAgICAgICAgKiBUaGlzIGNhbiBpbiBwYXJ0aWN1bGFyIGhhcHBlbiB3aGVuIHBhcmtpbmcg
c2Vjb25kYXJ5IHRocmVhZHMNCisgICAgICAgICAgICAgKiBkdXJpbmcgYm9vdCBhbmQgd2hlbiB0
aGUgc2VyaWFsIGNvbnNvbGUgd2FudHMgdG8gdXNlIGEgUENJIElSUS4NCisgICAgICAgICAgICAg
Ki8NCisgICAgICAgICAgICBpZiAoIGRlc2MtPmhhbmRsZXIgPT0gJm5vX2lycV90eXBlICkNCisg
ICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsN
CisgICAgICAgICAgICAgICAgY29udGludWU7DQorICAgICAgICAgICAgfQ0KKyAgICAgICAgfQ0K
Kw0KICAgICAgICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgKQ0KICAgICAg
ICAgIHsNCiAgICAgICAgICAgICAgLyogVGhlIGNsZWFudXAgSVBJIG1heSBoYXZlIGdvdCBzZW50
IHdoaWxlIHdlIHdlcmUgc3RpbGwgb25saW5lLiAqLw0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
