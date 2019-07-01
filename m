Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A55BB22
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 14:02:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuyd-0006o3-WE; Mon, 01 Jul 2019 12:00:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuyc-0006eV-5u
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 12:00:06 +0000
X-Inumbo-ID: c27005da-9bf7-11e9-bda1-5701688e4a24
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c27005da-9bf7-11e9-bda1-5701688e4a24;
 Mon, 01 Jul 2019 12:00:03 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:59:45 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:57:28 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:57:28 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 11:57:27 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:57:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/6] x86: move INVPCID_TYPE_* to x86-defns.h
Thread-Index: AQHVMAQn0iMfDW9J7UmVK8PmECrSKg==
Date: Mon, 1 Jul 2019 11:57:27 +0000
Message-ID: <630dddd7-3467-9204-c9da-3b776dade6a8@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
In-Reply-To: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0033.eurprd05.prod.outlook.com
 (2603:10a6:6:14::46) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c589eb-ab22-4cdf-4be9-08d6fe1b4991
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB3267E76E6B4F9D0CA6C3AA2AB3F90@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(189003)(199004)(36756003)(68736007)(14454004)(8676002)(66556008)(6486002)(305945005)(31686004)(6916009)(2351001)(73956011)(52116002)(7736002)(66476007)(64756008)(66946007)(25786009)(478600001)(5660300002)(66066001)(53936002)(66446008)(476003)(99286004)(72206003)(2616005)(486006)(4326008)(6116002)(81156014)(3846002)(6436002)(81166006)(11346002)(5640700003)(86362001)(6506007)(102836004)(446003)(54906003)(6512007)(31696002)(26005)(186003)(80792005)(386003)(256004)(316002)(8936002)(76176011)(2501003)(71190400001)(71200400001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TMV2yhGuaimHNKiwcLXE+86zt9q3t7rs7KH2me+Kao9Orju4L6Jwg0vhkks8KpH1ByVBV/Plh0uC+ptdXA9rWoTPpAnUtgoyduThoe5luxaGzjqADCUyLv7bbEmInjimD4isyPbclClxAGRo/datraFHb483l/UmCaJz2gh3vkRa+OVWRKzmzQDm2bRK1I5HqwI9TwhuAh2QwlpTOUvZ52LG3iI3NMsyLN0BCMvWs4yjNXWOJTxzXYQW6mRjSr4jHZ7n1k0kDe8/lxhazrWhjBWnbCotqm6wvDpD9lz4FeqRn5H0Pw6joqQz8e5FrZMJ7HZLePA6/l5znnmPR1RQ6Yds99wPuXln5ry2BkVVs4ZYc8RxSaFJFX234lIF0NDMN86EtlfHbucku05FyT25yplJAxcv4eaSTjUTCfG42Xg=
Content-ID: <F90D3E6FB056A545A0592089BE5D6E64@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c589eb-ab22-4cdf-4be9-08d6fe1b4991
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:57:27.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 4/6] x86: move INVPCID_TYPE_* to x86-defns.h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXkgdGhlIGluc24gZW11bGF0b3IgY2FuIHRoZW4gdG9vIHVzZSB0aGUgI2RlZmluZS1z
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0N
CnYyOiBOZXcuDQoNCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW52cGNpZC5oDQorKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2ludnBjaWQuaA0KQEAgLTUsMTEgKzUsNiBAQA0KICANCiAgZXh0
ZXJuIGJvb2wgdXNlX2ludnBjaWQ7DQogIA0KLSNkZWZpbmUgSU5WUENJRF9UWVBFX0lORElWX0FE
RFIgICAgICAwDQotI2RlZmluZSBJTlZQQ0lEX1RZUEVfU0lOR0xFX0NUWFQgICAgIDENCi0jZGVm
aW5lIElOVlBDSURfVFlQRV9BTExfSU5DTF9HTE9CQUwgMg0KLSNkZWZpbmUgSU5WUENJRF9UWVBF
X0FMTF9OT05fR0xPQkFMICAzDQotDQogICNkZWZpbmUgSU5WUENJRF9PUENPREUgIi5ieXRlIDB4
NjYsIDB4MGYsIDB4MzgsIDB4ODJcbiINCiAgI2RlZmluZSBNT0RSTV9FQ1hfMDEgICAiLmJ5dGUg
MHgwMVxuIg0KICANCkBAIC0zOCwyNSArMzMsMjUgQEAgc3RhdGljIGlubGluZSB2b2lkIGludnBj
aWQodW5zaWduZWQgaW50DQogIC8qIEZsdXNoIGFsbCBtYXBwaW5ncyBmb3IgYSBnaXZlbiBQQ0lE
IGFuZCBhZGRyLCBub3QgaW5jbHVkaW5nIGdsb2JhbHMgKi8NCiAgc3RhdGljIGlubGluZSB2b2lk
IGludnBjaWRfZmx1c2hfb25lKHVuc2lnbmVkIGludCBwY2lkLCB1bnNpZ25lZCBsb25nIGFkZHIp
DQogIHsNCi0gICAgaW52cGNpZChwY2lkLCBhZGRyLCBJTlZQQ0lEX1RZUEVfSU5ESVZfQUREUik7
DQorICAgIGludnBjaWQocGNpZCwgYWRkciwgWDg2X0lOVlBDSURfVFlQRV9JTkRJVl9BRERSKTsN
CiAgfQ0KICANCiAgLyogRmx1c2ggYWxsIG1hcHBpbmdzIGZvciBhIGdpdmVuIFBDSUQsIG5vdCBp
bmNsdWRpbmcgZ2xvYmFscyAqLw0KICBzdGF0aWMgaW5saW5lIHZvaWQgaW52cGNpZF9mbHVzaF9z
aW5nbGVfY29udGV4dCh1bnNpZ25lZCBpbnQgcGNpZCkNCiAgew0KLSAgICBpbnZwY2lkKHBjaWQs
IDAsIElOVlBDSURfVFlQRV9TSU5HTEVfQ1RYVCk7DQorICAgIGludnBjaWQocGNpZCwgMCwgWDg2
X0lOVlBDSURfVFlQRV9TSU5HTEVfQ1RYVCk7DQogIH0NCiAgDQogIC8qIEZsdXNoIGFsbCBtYXBw
aW5ncywgaW5jbHVkaW5nIGdsb2JhbHMsIGZvciBhbGwgUENJRHMgKi8NCiAgc3RhdGljIGlubGlu
ZSB2b2lkIGludnBjaWRfZmx1c2hfYWxsKHZvaWQpDQogIHsNCi0gICAgaW52cGNpZCgwLCAwLCBJ
TlZQQ0lEX1RZUEVfQUxMX0lOQ0xfR0xPQkFMKTsNCisgICAgaW52cGNpZCgwLCAwLCBYODZfSU5W
UENJRF9UWVBFX0FMTF9JTkNMX0dMT0JBTCk7DQogIH0NCiAgDQogIC8qIEZsdXNoIGFsbCBtYXBw
aW5ncyBmb3IgYWxsIFBDSURzLCBleGNsdWRpbmcgZ2xvYmFscyAqLw0KICBzdGF0aWMgaW5saW5l
IHZvaWQgaW52cGNpZF9mbHVzaF9hbGxfbm9uZ2xvYmFscyh2b2lkKQ0KICB7DQotICAgIGludnBj
aWQoMCwgMCwgSU5WUENJRF9UWVBFX0FMTF9OT05fR0xPQkFMKTsNCisgICAgaW52cGNpZCgwLCAw
LCBYODZfSU5WUENJRF9UWVBFX0FMTF9OT05fR0xPQkFMKTsNCiAgfQ0KICANCiAgI2VuZGlmCS8q
IF9BU01fWDg2X0lOVlBDSURfSF8gKi8NCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2LWRl
Zm5zLmgNCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2LWRlZm5zLmgNCkBAIC0xMDgsNCAr
MTA4LDEyIEBADQogICAqLw0KICAjZGVmaW5lIFg4Nl9EUjdfREVGQVVMVCAgICAgICAgIDB4MDAw
MDA0MDAgIC8qIERlZmF1bHQgJWRyNyB2YWx1ZS4gKi8NCiAgDQorLyoNCisgKiBJbnZhbGlkYXRp
b24gdHlwZXMgZm9yIHRoZSBJTlZQQ0lEIGluc3RydWN0aW9uLg0KKyAqLw0KKyNkZWZpbmUgWDg2
X0lOVlBDSURfVFlQRV9JTkRJVl9BRERSICAgICAgMA0KKyNkZWZpbmUgWDg2X0lOVlBDSURfVFlQ
RV9TSU5HTEVfQ1RYVCAgICAgMQ0KKyNkZWZpbmUgWDg2X0lOVlBDSURfVFlQRV9BTExfSU5DTF9H
TE9CQUwgMg0KKyNkZWZpbmUgWDg2X0lOVlBDSURfVFlQRV9BTExfTk9OX0dMT0JBTCAgMw0KKw0K
ICAjZW5kaWYJLyogX19YRU5fWDg2X0RFRk5TX0hfXyAqLw0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
