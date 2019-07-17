Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A980A6B8F4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnfug-0000q6-4w; Wed, 17 Jul 2019 09:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnfuf-0000q1-D6
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:07:49 +0000
X-Inumbo-ID: 5642d77a-a872-11e9-bec8-e3cd9519e78e
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5642d77a-a872-11e9-bec8-e3cd9519e78e;
 Wed, 17 Jul 2019 09:07:46 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 09:07:43 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 09:07:31 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 09:07:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVjlCjEy+EoWz3nfyng/ViF7XeoVMhzycxJyUOxna6SXmECYZr4ly/GckZ8kUDOXShwItxfq4xJJqOkPfGgeRy8hdJg0cPKjhEnI7oObu8+xtAzlmUf8eutur2UJ8jwFkU45Jd6/6wS2pvD2tE7S3fIXaE5uK5d7QgYOa0XUCkzhEQ3C2dzWmfg39xM2/e8a+i/gANoDMsF+REI4j7TPjQlY7B/DvUYfqf5QyWa841BjcTI6zQ/9MQpK1L7ZjUbp0a/8vRTFFc712Gs4Ag8qC5HznFdm9pjIpJrJ61ecj2Kl37dVJaC3bmNfWC3rrCRFXI89rk/6g8AWgD1yvu5ToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wng67pIgFi4JK5NMBf7i91gPb5KsKTxR/TsZRlhpxw=;
 b=XDMjAM3qJYAmWI4YNy2jsgE4sVdVqptHDcfwcTjFUzRGpQ1rfBmackQGLCRw0iSQEqBUONZeab1IPA2c8gHOCpcyThObFAzM+Vvhcveicr+7bqLGxThuS4sSEZK2rqbOuxV7RyvFXZxoylfEwgqr8tEI22fjduYmdWsiL+Plhqa45fx7+1uxNmQnD/aFuHkr/bPF6pJM3uiJ1qGcl/8Vqtijxs0SRFpA+c9cDlRZNybCMqUivWu+8qbSFzWokn0Cl/g5QYzK+X+YYjPNfcTBbOEzlcLWp+zaYQx0GXiHYLUXay18xfgYRhAU0oYx5Dqqqbx8/q3ML8X5/XfW7c9sKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3162.namprd18.prod.outlook.com (10.255.172.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 09:07:29 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:07:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 4/5] x86: allow limiting the max C-state sub-state
Thread-Index: AQHVMZ+l48br4ffcsk28PZ/9fMg8ZKbNaATWgAEy1wA=
Date: Wed, 17 Jul 2019 09:07:29 +0000
Message-ID: <2255c675-bcb2-8e04-dcb1-5044628d324f@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <b5b7560a-2418-9df7-2062-3ba1f6f0152f@suse.com>
 <20190716144820.fgyplo5gnoishlfj@Air-de-Roger.citrite.net>
In-Reply-To: <20190716144820.fgyplo5gnoishlfj@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65efa08b-dfdc-464c-6145-08d70a9631f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3162; 
x-ms-traffictypediagnostic: DM6PR18MB3162:
x-microsoft-antispam-prvs: <DM6PR18MB31620EA9C942C69397A11632B3C90@DM6PR18MB3162.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(189003)(199004)(476003)(80792005)(2616005)(11346002)(446003)(36756003)(81166006)(486006)(6486002)(31686004)(66556008)(64756008)(66446008)(71190400001)(71200400001)(6436002)(5660300002)(86362001)(25786009)(4744005)(66946007)(66066001)(66476007)(6916009)(52116002)(6506007)(2906002)(8936002)(76176011)(54906003)(99286004)(386003)(14454004)(6246003)(316002)(3846002)(31696002)(53936002)(6116002)(6512007)(478600001)(4326008)(256004)(229853002)(305945005)(102836004)(26005)(186003)(8676002)(68736007)(81156014)(7736002)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3162;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oS5/PqIzoo6AScfoSI+XE0d5KFlIEcb4tlckvfNHRg5eOEUfdo6x2fD6R7/VCPEZwgv6TdPBj3jF1Jv3MpcuJ2dTGyyWc9zj5Z55wuYfZ7eqMGqJqCv8jfFlEFwxSSiju5rSH52zgRBuUMpVUI0dhLYCk2iJ/oT/FWj7nTod9g5VJL0nXgPfY5zy6AApBrc+dByD2ANU09nQb/yIGq4Bq84blXQB7Jt8efrgH0/baz7qtX7aAyLEgpDYrHtIHqQf18K/1CIKoX/hdu3lrCutEmm0/BgYKRtp0qE2xGl5lcjlk4/ao7xEzQPLf28hqzneoZTuD+VAVFpP4chRbErHve1f9vb1Tkhed7AXGaKcfkiv13klmWEqZB9XadINHqv/Z3eOCL5+qtKc3SWl4iNxfUvIvj7LevKVZ/svgd68XdM=
Content-ID: <1EE7887614C3B248ACC19B8E526B4C7E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65efa08b-dfdc-464c-6145-08d70a9631f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:07:29.6756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3162
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 4/5] x86: allow limiting the max C-state
 sub-state
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNjo0OCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDAzLCAyMDE5IGF0IDAxOjAzOjAyUE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
QEAgLTU5Miw3ICs2MDgsMTMgQEAgc3RhdGljIHZvaWQgYWNwaV9wcm9jZXNzb3JfaWRsZSh2b2lk
KQ0KPj4gICAgDQo+PiAgICAgICAgICAgIGRvIHsNCj4+ICAgICAgICAgICAgICAgIGN4ID0gJnBv
d2VyLT5zdGF0ZXNbbmV4dF9zdGF0ZV07DQo+PiAtICAgICAgICB9IHdoaWxlICggY3gtPnR5cGUg
PiBtYXhfc3RhdGUgJiYgLS1uZXh0X3N0YXRlICk7DQo+PiArICAgICAgICB9IHdoaWxlICggKGN4
LT50eXBlID4gbWF4X3N0YXRlIHx8DQo+PiArICAgICAgICAgICAgICAgICAgIGN4LT5lbnRyeV9t
ZXRob2QgPT0gQUNQSV9DU1RBVEVfRU1fTk9ORSB8fA0KPj4gKyAgICAgICAgICAgICAgICAgICAo
Y3gtPmVudHJ5X21ldGhvZCA9PSBBQ1BJX0NTVEFURV9FTV9GRkggJiYNCj4+ICsgICAgICAgICAg
ICAgICAgICAgIGN4LT50eXBlID09IG1heF9jc3RhdGUgJiYNCj4+ICsgICAgICAgICAgICAgICAg
ICAgIChjeC0+YWRkcmVzcyAmIE1XQUlUX1NVQlNUQVRFX01BU0spID4gbWF4X2NzdWJzdGF0ZSkp
ICYmDQo+PiArICAgICAgICAgICAgICAgICAgLS1uZXh0X3N0YXRlICk7DQo+PiArICAgICAgICAg
ICAgY3ggPSAmcG93ZXItPnN0YXRlc1tuZXh0X3N0YXRlXTsNCj4gDQo+IElzIHRoZSBsaW5lIGFi
b3ZlIGEgc3RyYXkgYWRkaXRpb24/IEl0IGlzIGF0IGxlYXN0IG5vdCBwcm9wZXJseQ0KPiBhbGln
bmVkIEFGQUlDVC4NCg0KT2gsIHllcywgdGhhdCdzIGEgcmUtYmFzaW5nIG1pc3Rha2UuIFRoYW5r
cyBmb3Igc3BvdHRpbmcuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
