Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A77A791
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQpq-0003mF-Fe; Tue, 30 Jul 2019 12:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQpo-0003m9-Nq
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:02:28 +0000
X-Inumbo-ID: e3fd2de6-b2c1-11e9-9097-0f683233cb03
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3fd2de6-b2c1-11e9-9097-0f683233cb03;
 Tue, 30 Jul 2019 12:02:24 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 12:02:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 11:59:29 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 11:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4tvAXWJqvCQSI8oM3JWYU0gd4zhRf3Vm2n5qJHeq8Kc5f+q5mqYO5kNORHWpKSaqyXl0uY7QV/pVWJMawZiDDIt0hi8X9ADQbJMO2QspJvOeLfO1s/lo+geZdvQveqw2IThJfLnDhbMfPihrywzpUruaRPQWbb7KrQhzGkx82D+2etuHC3JD4F0i8/nDBTo4aMqlD4Y4Xq4nNeN8ygN1fBzfMe7O3X88CBhFA4jyHPTHKs0kzsdw7z1EkQTUrgjsbBbFF1FKjs9RlLj+Zg1ajw9Ez2qoiaFDdW4vL0+hFWF3H3zVYSAgYLuY5nnddcoky6HmTEke5CDB9ZwkJ6XbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS9Mr8e8YZoyaWsjDr1J/LEew4Pj42aD7cm9d3K3qPw=;
 b=PcG/2R/n9KwBDDJrpyRLbyiu6IRvRE4necd/UVqWdidyOIrY68h/rOZM+c2zhGaRDKsP0BjFF3tfAoFa9zhcWuw/HfeJBJurPY8tpXzVrFTo6Xvq5jbGytpBtnmygq6HHFCqifQlKR2Fjql/2p7fltHu/i6HnnBr/K7ZPwuiWPJTEwFKl5FAqMIm1NLZW8dTt4OvP9Y5ALiPsPUZLz0f1zxNHPYar6HWy4njq+uHsudAz437FucUcPm4i7hwhYT6ZY58TSaujBuM6Q+Tweu55mTOEPhm1xZQut0Bbb9Hy9MbzcQOpv9srcGzC4o252U6+ZeH6Drd1M2DIshuAg5rzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3140.namprd18.prod.outlook.com (10.255.136.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 11:59:27 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:59:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 3/5] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVRrrSB+81RPU5GUuqFVso3AyrpKbjDvyA
Date: Tue, 30 Jul 2019 11:59:27 +0000
Message-ID: <885b9e4e-8ca8-c4d6-8f2b-a454cbddd6a5@suse.com>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
 <20190730093904.1794-4-paul.durrant@citrix.com>
In-Reply-To: <20190730093904.1794-4-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:10:72::17) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be81aaa6-58a9-4522-f3da-08d714e55f4c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3140; 
x-ms-traffictypediagnostic: BY5PR18MB3140:
x-microsoft-antispam-prvs: <BY5PR18MB3140D171754C2AD37C2080B4B3DC0@BY5PR18MB3140.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(71190400001)(31686004)(5660300002)(14454004)(2906002)(386003)(76176011)(36756003)(4744005)(80792005)(305945005)(102836004)(53546011)(6246003)(6116002)(7736002)(6512007)(316002)(71200400001)(99286004)(53936002)(3846002)(31696002)(11346002)(54906003)(6486002)(52116002)(25786009)(256004)(486006)(6436002)(2616005)(81156014)(81166006)(229853002)(186003)(6506007)(446003)(478600001)(86362001)(8936002)(66446008)(64756008)(26005)(8676002)(6916009)(66476007)(66556008)(66066001)(68736007)(4326008)(476003)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3140;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UxmPHJi8Vl0x3z88yBT4tmtwJFcgXmbnVURFpPyl663PIf9DNpHFBzlcs7R2hjve5uu0hv6l2ktCyyQbRDVStLyx0HZkjF6MErwICv+OW2+kopjP+7yYC+prE69gWVAvZvfJ5fE/zFRng1Xhk+zvCcjvM3X8ZlR/sFHoIF+KkPS/lH+BXx/6PhC3Nb/hlvFE6RPUPK1LIlKpSCHvfLTvbryY3rZcH1LLDFqbunUUeFR5HFeOKhl2+3WWemmgZYfz0wVJIAGFOIBQlgNuphCCbhIsLCWXwj7oOGl/au6hwIAGfu+oYjI3HWksnQnbCwANKL4c9uMcdgUBaaqgRjwyydUzuPXttiSub0BhknNESe+/d471+baiwJH47P9W0O5P5eVRxwkS4YHf7DyN2H/KEmg4ey5ULd+R+OLN0vt4iyk=
Content-ID: <AEC54F3517214A4C8D2132322DD99155@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: be81aaa6-58a9-4522-f3da-08d714e55f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:59:27.8217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3140
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/domain: remove the 'oos_off' flag
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

T24gMzAuMDcuMjAxOSAxMTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vY29t
bW9uL2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gQEAgLTMxMywxMSAr
MzEzLDE5IEBAIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2Rv
bWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykNCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ICAgICAgfQ0KPiAgDQo+IC0gICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NE
Rl9odm1fZ3Vlc3QpICYmDQo+IC0gICAgICAgICBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9D
REZfaGFwICkNCj4gKyAgICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2
bV9ndWVzdCkgKQ0KPiAgICAgIHsNCj4gLSAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIkhB
UCBlbmFibGVkIGZvciBub24tSFZNIGd1ZXN0XG4iKTsNCj4gLSAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ICsgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2hhcCAp
DQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJIQVAg
ZW5hYmxlZCBmb3Igbm9uLUhWTSBndWVzdFxuIik7DQo+ICsgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEl0
IGlzIG9ubHkgbWVhbmluZ2Z1bCBmb3IgWEVOX0RPTUNUTF9DREZfb29zX29mZiB0byBiZSBjbGVh
cg0KPiArICAgICAgICAgKiBmb3IgSFZNIGd1ZXN0cy4NCj4gKyAgICAgICAgICovDQo+ICsgICAg
ICAgIGNvbmZpZy0+ZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfb29zX29mZjsNCj4gICAgICB9DQoN
CkknbSBub3QgY29udmluY2VkIHRoaXMgbmVlZHMgdG8gYmUgaW4gY29tbW9uIGNvZGUsIGJ1dCBJ
IGFsc28NCmRvbid0IG1pbmQsIHNvDQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
