Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A93863DC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:03:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvixs-0003mk-BA; Thu, 08 Aug 2019 14:00:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvixr-0003mc-01
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:00:23 +0000
X-Inumbo-ID: dab1c1f3-b9e4-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dab1c1f3-b9e4-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:00:21 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 14:00:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 13:51:12 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 13:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cb+gMM/hfz1ecyFkd816e8hoZnNvmtUu98KU+qNpC8bzsnituh8ZC38FF+kBErZZbL6QDs4HNX/t+UUVO1oNYSLNs9dy4SOtyBkrLRC0oizguNTLQWNkIxvRCC4gtB42eDMY15I6ORyECGtjq8opFXod1h8q7mguArZai/qZd9/auSKYeJaMLuF1e7lzVYRBYN+JXF+TOkFDjH/9RXRoFxUOO0ccBHhcBZVnoc6vWwv1mlxZl6En16EvkHW6xF0ymNTwOsdPzTCorHg9AHnNspwjDK4jjXyaTaxUpGqXD5gf64Fh6l9myDvWAIg/JbME4VcU6eYTJuv3ocmejdd1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obb1I9ZPpTa0RvlN0vC1ktwHVOVeZ+in+LnGaL+HSnA=;
 b=fQg9sjb0VlJzyFoJiHiFvsJq/qkdnRRQbB1DjvYzVRKVzJVmW+t/y2FJagF1mUIOu33dcf8X8APxhUMvdH6QQfmjrCf2bGe12EO0YDE4OWfnnR8nDgNR4EGCOkFqjjWg7UpF1Z/npOQ+WlofFVqXutIKKE+ZnvdkNfLo2Wv6fFMWhxjW7y27NPx4XXcZUQTPue+yzd0QpjCmNGJwV/XwXcSQ2hobgSrTmBjDn9TQXdTsJg30GMezvFInaHYQbkGWKPrRhjQGpcDwOa5ibVXHa3EVa5dGEblwinIx6UUFOPcUWtN7qyqCWLIOuhGN8RD8MDYWMZ+a15ZcU8VTVGVOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2813.namprd18.prod.outlook.com (20.179.21.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 13:51:11 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 13:51:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 1/4] xen/console: Don't treat NUL character as the end
 of the buffer
Thread-Index: AQHVS5HylAe3eE1UcUur5OQYZ6SMtKbxSYOA
Date: Thu, 8 Aug 2019 13:51:11 +0000
Message-ID: <1adc84d1-dc16-5390-a056-e67d8eb9ab95@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-2-julien.grall@arm.com>
In-Reply-To: <20190805132955.1630-2-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::28) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63cbe43c-e6e7-4025-b2ad-08d71c0778d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2813; 
x-ms-traffictypediagnostic: MN2PR18MB2813:
x-microsoft-antispam-prvs: <MN2PR18MB28139213BD87C7281F03CD20B3D70@MN2PR18MB2813.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:338;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(51444003)(80792005)(486006)(8936002)(7416002)(71190400001)(71200400001)(14454004)(14444005)(52116002)(102836004)(53936002)(305945005)(31686004)(256004)(7736002)(478600001)(54906003)(446003)(53546011)(386003)(11346002)(26005)(99286004)(186003)(81166006)(2616005)(5660300002)(8676002)(476003)(36756003)(66066001)(6436002)(76176011)(6512007)(6116002)(6246003)(6506007)(81156014)(31696002)(3846002)(2906002)(229853002)(316002)(25786009)(4326008)(6916009)(86362001)(66446008)(66476007)(64756008)(66556008)(66946007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2813;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6p/aHtp/ZGtb3B5GgZ9BVdWCFFhPVySOPWg5KqNI/A8mS1NUabkfR+TBRA30w+xKtyCUR40v7WdNZ4DoArwZr46OFxyrkoq7pDnwrKCYMzYUKLQOZqAsAIlaW1FbqnF06TQAfK3ehuLu4ME9yXzA4NXQtHnLCKtw9oVRnS9UnjVkJtEKDlQQmtXIZx5l7ic8OmhWf4dmzG/NBZmHBD4gDSsx+C2i6VGO434xPhlwaPH/WP15nlKyWydQcbobwS61c/RcxrhQFvpOGYp0m+y4OgwnpzCXXIQ8fh5eLi664HjTSGMQPLAFS6QhN2V97GHKncAvIxUrMlykC7j/APoZF6EVfbXi0o1sYm3Ili/kttVfvE30kn+dvgpM8KgNDci0/pmHYlpaB7T8x4y4GjOc77BZaPF3PYQ+N6e95KYqEiw=
Content-ID: <9CF3B3337BC8A849B2D97DA5FEF229F1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cbe43c-e6e7-4025-b2ad-08d71c0778d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 13:51:11.5353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +MGn0iWAmmOnVwC3H22E2H3p1FGULPr1zUyAsTcl5VzeTgUvJ5aSEcDDAK/FIU/W2kPWi5WqbcZxhT/ROJjcHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2813
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen/console: Don't treat NUL
 character as the end of the buffer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBAQCAtMTI2MSwxNCAr
MTI1OSwxNSBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQ0K
PiAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7
DQo+ICAgDQo+ICAgICAgdmFfc3RhcnQoYXJncywgZm10KTsNCj4gLSAgICB2c25wcmludGYoYnVm
LCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsNCj4gKyAgICBuciA9IHZzY25wcmludGYoYnVmLCBz
aXplb2YoYnVmKSwgZm10LCBhcmdzKTsNCj4gICAgICB2YV9lbmQoYXJncyk7DQo+ICANCj4gICAg
ICBpZiAoIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkNCj4gICAgICB7DQo+IC0gICAgICAg
IHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldSAiLCArK2NvdW50KTsNCj4gLSAg
ICAgICAgc2VyaWFsX3B1dHMoc2VyY29uX2hhbmRsZSwgY250YnVmKTsNCj4gLSAgICAgICAgc2Vy
aWFsX3B1dHMoc2VyY29uX2hhbmRsZSwgYnVmKTsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IG4g
PSBzbnByaW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUgIiwgKytjb3VudCk7DQoNCldo
aWxlIC0gZ2l2ZW4gdGhlIHNpemUgb2YgY250YnVmIC0gdGhlIGRpZmZlcmVuY2UgaXMgbW9zdGx5
DQpiZW5pZ24sIHlvdSB1c2luZyB2c2NucHJpbnRmKCkgYWJvdmUgY2FsbHMgZm9yIHlvdSBhbHNv
DQp1c2luZyBzY25wcmludGYoKSBoZXJlLg0KDQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92aWRl
by5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92aWRlby5oDQo+IEBAIC0xMywxMSArMTMsMTEg
QEANCj4gIA0KPiAgI2lmZGVmIENPTkZJR19WSURFTw0KPiAgdm9pZCB2aWRlb19pbml0KHZvaWQp
Ow0KPiAtZXh0ZXJuIHZvaWQgKCp2aWRlb19wdXRzKShjb25zdCBjaGFyICopOw0KPiArZXh0ZXJu
IHZvaWQgKCp2aWRlb19wdXRzKShjb25zdCBjaGFyICosIHNpemVfdCBucik7DQo+ICB2b2lkIHZp
ZGVvX2VuZGJvb3Qodm9pZCk7DQo+ICAjZWxzZQ0KPiAgI2RlZmluZSB2aWRlb19pbml0KCkgICAg
KCh2b2lkKTApDQo+IC0jZGVmaW5lIHZpZGVvX3B1dHMocykgICAoKHZvaWQpMCkNCj4gKyNkZWZp
bmUgdmlkZW9fcHV0cyhzLCBucikgICAoKHZvaWQpMCkNCg0KV2hpbGUgSSBkb24ndCB0aGluayB0
aGVyZSdzIG92ZXJseSBtdWNoIHJpc2sgb2YgInMiIGdldHRpbmcgYW4NCmFyZ3VtZW50IHdpdGgg
c2lkZSBlZmZlY3RzIHBhc3NlZCwgSSB0aGluayB0aGF0IGZvciAibnIiIHRoZQ0KcmlzayBpcyB0
aGVyZS4gTWF5IEkgYXNrIHRoYXQgeW91IGV2YWx1YXRlIGJvdGggaGVyZSwganVzdCBpbg0KY2Fz
ZT8NCg0KUHJlZmVyYWJseSB3aXRoIHRoZXNlIGFkanVzdG1lbnRzDQpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
