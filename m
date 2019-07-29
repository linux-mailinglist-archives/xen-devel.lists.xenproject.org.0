Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E778F7C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7fZ-0007nn-3m; Mon, 29 Jul 2019 15:34:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs7fX-0007nh-FU
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:34:35 +0000
X-Inumbo-ID: 5be57be4-b216-11e9-b491-b72aeaf6b582
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5be57be4-b216-11e9-b491-b72aeaf6b582;
 Mon, 29 Jul 2019 15:34:32 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:34:30 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:13:51 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuufQmnxbd/JCV5CI/Peje6EUnq32foMWS9xo3RbBHPNPylz2BtucR/0SdDbV5ZMlpGrzjCDUKEUOeWaqxKPH65DgVRfoQ4384JvFNIxTB3dZHirszRkqp9SXUgx/1ZJaPdNpf81MXoEWjnr4CHvM6hQqcLNYw82Vz1fpDBxaFf01xfLBbmlFf8CzZ90qfcoHbpQJ1/+RdL0bieA21O7noe/G5iMGxptKAaGEcEWI9hdeetdFKVkDMIAnTQ88Sb7nsu77mTyOI76s1y+xjjlp5iya4qcyJx34a1QdncEgzfUqJE0+ylD7ra6i6F0lCm0j+3nPxGHYSVxwsaTjRV51Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYlMYtqkzNkH3ZWTS3r2nD7Te2u5+eLRDZQbP2Fg3sE=;
 b=CFccWTrIbXzvA+xljDsrD9X4fX7Jvq3xh4nNRWCt3xx1K6bQ5XF2PJQfHONwAqP1NatXuvi0iafkvIPEYiyt0zuJ+/7Fd9anJJvYs3on+WH+L7dddITqEHICLF+Ekfd8rTg/Tbq31ZoWpFgTz12zyV1NxZNcR30tNiQuaqkoQteK+yskuRJ3/i9f5Xi+SlwcLQ6vJkMsf5SvAdhRxvQZ8+EPWvpQxNvfu5xVFk1aSOBqyFEHR3aqpUFze+9vsn6ueafMgbDj0RHII6oiLj0UpFRod+cRYyHLxnuUrEQZpYlpqfm6lrVFqa/YPoMYJw9cKqUPdkj0Nro9shp6DZ7NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:13:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:13:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2 4/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVQu50nBwcI3lUmEKPPlnGNTy8pabhuo0A
Date: Mon, 29 Jul 2019 15:13:49 +0000
Message-ID: <1126a1d6-1467-f180-a9ad-9a62a19ecac8@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-5-paul.durrant@citrix.com>
In-Reply-To: <20190725133920.40673-5-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0093.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47174eed-dcb9-4087-9f5d-08d714375c00
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB3410880B3380E949D2BB0E31B3DD0@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(199004)(189003)(2616005)(476003)(4326008)(36756003)(11346002)(305945005)(26005)(31686004)(186003)(486006)(316002)(6246003)(5660300002)(478600001)(446003)(66066001)(6916009)(14454004)(53546011)(6506007)(53936002)(80792005)(25786009)(54906003)(6512007)(3846002)(6116002)(4744005)(386003)(52116002)(102836004)(76176011)(81156014)(81166006)(8936002)(8676002)(66946007)(6486002)(6436002)(7736002)(68736007)(229853002)(14444005)(71190400001)(31696002)(71200400001)(86362001)(256004)(66446008)(64756008)(66556008)(2906002)(66476007)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LpEAyZp+Jc3LHhwMGtpFLpeWjlOrpBvpdlgL2lPwf5PjG4MPgSnFgURCO4cxeh+CVux/rNuDsAAIXzwcdvg/EJ0KK8kvtSNRaX0TZHx1CzXb2CJqD6RiBarqTjKSFNaIglU726c4lEu5ZG/rqizSdDJU5VCJ0/3fS0VRXDW3Wlax0K97GxiSY0evYQGSIge2FC+vQac93vOZXSjFXaN8d/KbkhY0XXBJi+LR5SvPDMH2c5dQW1qdJwjNDpYglGpnx/sv8Mwmu8UPRqUsHq2vbGAefpe1Vg9zlnyO0y13+iyEKYVlwxfL+BUA16Z4gp5pd6tU8CAjrwjG3CNc3CCnIt9AxTW27Msfi/mR0se/vseZRzAQKXWWE+0jHFDGsndlBoWHeSRE3z+611WzvwPKxN4W75JodKVyUMt/uXIxbvo=
Content-ID: <2F84339AB89A1A4C949C21141CEFB10F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47174eed-dcb9-4087-9f5d-08d714375c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:13:49.7484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, GeorgeDunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBAQCAtMjUyMyw3ICsy
NTIyLDcgQEAgc3RhdGljIHZvaWQgc2hfdXBkYXRlX3BhZ2luZ19tb2RlcyhzdHJ1Y3QgdmNwdSAq
dikNCj4gICAjaWYgKFNIQURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRfT1VUX09GX1NZTkMpDQo+
ICAgICAgIC8qIFdlIG5lZWQgdG8gY2hlY2sgdGhhdCBhbGwgdGhlIHZjcHVzIGhhdmUgcGFnaW5n
IGVuYWJsZWQgdG8NCj4gICAgICAgICogdW5zeW5jIFBUcy4gKi8NCj4gLSAgICBpZiAoIGlzX2h2
bV9kb21haW4oZCkgJiYgIWQtPmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfb2ZmICkNCj4gKyAgICBp
ZiAoIGlzX2h2bV9kb21haW4oZCkgJiYgIShkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfb29z
X29mZikgKQ0KDQpBZmFpY3MgdGhpcyBpcyB0aGUgb25seSBldmFsdWF0aW9uIG9mIHRoZSBmbGFn
LCBpLmUuIGl0J3MgSFZNDQpzcGVjaWZpYy4gSW4gd2hpY2ggY2FzZXMgaXQgc2hvdWxkIHByb2Jh
Ymx5IGZvbGxvdyB0aGUgbW9kZWwNCm91dGxpbmVkIGZvciBwYXRjaCAzLCBhdCB3aGljaCBwb2lu
dCB0aGUgaXNfaHZtX2RvbWFpbigpIGhlcmUNCmJlY29tZXMgcmVkdW5kYW50IChpLmUuIGNvdWxk
IGJlIGRlbW90ZWQgdG8gYW4gQVNTRVJUKCkgaW5zaWRlDQp0aGUgaWYoKSkuDQoNCkphbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
