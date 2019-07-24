Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96573358
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:07:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJl3-0008WH-Ch; Wed, 24 Jul 2019 16:04:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqJl1-0008W4-LP
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:04:47 +0000
X-Inumbo-ID: c0341f43-ae2c-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0341f43-ae2c-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 16:04:46 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 16:04:35 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 16:02:49 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 16:02:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsvcYv08ACeS/D/aX6sFejDAkieKJkpGePUgbzLfxbNC8AnTNO/dubfHvGASSW5ab9FZEhKTk6NCPYxvevT4uv31T+9IyvogwMK7v78mlXjAYeBVGwb7XTOVRZ/pyasjJ2dwhlorlbWXlOp7xeKB4grhwHVc/UjUiPt3kyGfj06S4SyZrEUI4bsumtHOwA6lbM9o3puzdr7gcM7QpizUpgKPmp2+GFpErT1V+4AV639htXubcsdLzto7gg6ePA4fml/EATLySQcOWLAEl+k0S7p+qRoHN8oQuhTAO2ouaTQQ39vxQkIf6Jvm4Oa1b5WOeZXSz4ouVOqOOLhtSnFB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ65ZswejsDRnOn7IwKPbcsqNGrSVrTiSQ74/pCCKsM=;
 b=cLTkloZ8ndEDIAO2vnrp+cOyLBruqVDrBvRF7JtJjB/vR5zunexBaB2YFjsb2llX+jxKZMZEQKenkAu6Ocl/j9IC+LW+r1WGhkmqDHGdIOc4T3RnD3ZuMXmoCZUrVBatsjR4V89nWkuX9lmMvUQobM3dQiagrPvjtfBJyZPgLbA7Z40aW8RiX6oLw6RaK2xyXM5zzwJYGcRD+mBJekZdvvfC3TyNjEJypX4dcjYC9WxNsT3PK4Y1kfFs/kTFaJp+2TrPFoiC2omqK/HIeviMR17se2HRXTWBVO3awSQ/9Gd8jjqWC+OE3UlVCXYCaMHfuq2bDc+u4UsFmEV3SPOZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3428.namprd18.prod.outlook.com (10.255.139.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 16:02:47 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 16:02:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v3 2/2] passthrough/amd: Clean iommu_hap_pt_share enabled
 code
Thread-Index: AQHVO85ldxcYQ2031kKt9Q4EX3zoBqbZ+tUA
Date: Wed, 24 Jul 2019 16:02:47 +0000
Message-ID: <214b8010-fd51-4b50-e04e-af5c8df088d2@suse.com>
References: <20190716120056.1723-1-aisaila@bitdefender.com>
 <20190716120056.1723-2-aisaila@bitdefender.com>
In-Reply-To: <20190716120056.1723-2-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0103.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::17) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 115fe11c-7452-4796-2cc7-08d710505f17
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3428; 
x-ms-traffictypediagnostic: BY5PR18MB3428:
x-microsoft-antispam-prvs: <BY5PR18MB342826F71E94CC8E359D3217B3C60@BY5PR18MB3428.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(199004)(189003)(6436002)(478600001)(2906002)(66476007)(31686004)(66446008)(66556008)(66946007)(64756008)(316002)(14444005)(256004)(6486002)(80792005)(486006)(71200400001)(229853002)(36756003)(6246003)(6916009)(66066001)(71190400001)(6512007)(53546011)(6506007)(53936002)(4326008)(7736002)(305945005)(186003)(76176011)(446003)(11346002)(68736007)(476003)(2616005)(25786009)(81156014)(81166006)(52116002)(54906003)(8676002)(31696002)(386003)(102836004)(86362001)(14454004)(99286004)(558084003)(26005)(5660300002)(3846002)(8936002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3428;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7GCwKud3h+u5OoXbRpiIn8LMwv8EOIXfgdmTefChB4nK+te2eL9lA2Qzxkys3iAIeF/xDNS4LXoE2Z5cjY2fCpur+4D9Lc/MWaqo7EG4aeJsFRT5Qukeg7yycjnJu18P5VocWOBwDFtaf+/GYc8+0UP+ywTKSf3ssT4f03AbabYhSnfk0BNh1N5qm2lJvgMiVx+hLkTP01SZ9wPy1psrBmnCX2MA0gEFYtZfiYTgsA4qYxf5YlCpM/jZ2Im5nH719kierkLJl0YMBsjO2xkawkruWLr5F5A6Z/jVW0zCF4niOcSHpMXX9QFYEAl8ixs0jmifamKLDFg44LBWeCwzoq8Px5fySVCsFXaIRKZ93Xrr7wB9N59khIpXNtGt4NLS33nmELWdlEHYhZzLL7Dqx+eCkJ9/BOg2KWaCfo3/PI8=
Content-ID: <A8BCBC0B699EFC408BCB78A321FFFC37@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 115fe11c-7452-4796-2cc7-08d710505f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 16:02:47.8105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3428
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/2] passthrough/amd: Clean
 iommu_hap_pt_share enabled code
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
Cc: "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNDowMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IEF0
IHRoaXMgbW9tZW50IElPTU1VIHB0IHNoYXJpbmcgaXMgZGlzYWJsZWQgYnkgY29tbWl0IFsxXS4N
Cj4gDQo+IFRoaXMgcGF0Y2ggY2xlYW5zIHRoZSB1bnJlYWNoYWJsZSBjb2RlIGdhcmRlZCBieSBp
b21tdV9oYXBfcHRfc2hhcmUuDQo+IA0KPiBbMV0gYzJiYTNkYjMxZWYyZDlmMWU0MGU3YjZjMTZj
ZjNiZTNkNjcxZDU1NQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
