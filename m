Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A973026
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 15:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHYB-0004UA-MH; Wed, 24 Jul 2019 13:43:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqHY9-0004U5-Vc
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 13:43:22 +0000
X-Inumbo-ID: ff384b4a-ae18-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff384b4a-ae18-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 13:43:20 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 13:43:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 13:40:36 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 13:40:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6rNykH74xmrJwuXD3zgsWfX+ci91l/GKtkpJ/jePClPHAzYO/PDKjKKnKE112twl7bpWY2pxmcSmYWTnuTHtnHtY2/kg0FR7cLdIHplSGuLYpkV1K+ZdMvW3CkOadLbDHsA1iv/6au0BB154EavfnE85iEOylejCfq+EtEEDdWPz8w26MOq/jojIOtolWMZpcTbwb6IxoZWV37zUy8TGJqELDEvkK5yGxbNlIVoE2WyMCl+46XUKWRc7bEMN2eooyz1d65IfuL9kNP7frRJSpQw58z5s+Z6hMAW10OIJfn9Dfv1O0oYrRkcv2JRz816c+SFxctvWTwP6D5pwocFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7et6zN6BoWaR/iD7ggIkpyxff03FwvotY2UX4LPKdQ=;
 b=MktgPKG6a9D+hBLp0v/RSSkMD5k4kNU2Avxl8+j6QPv7/XAu+e3sGnoL+HDStE1Zcdek0v1TJf3AdkITBW2tdqrX6r6eipxPP43sVY9WaOgDvld/mHEtwcEEQwQoa4C3WfwQx0vYmqgSm9URQ7qGfbAFEuU2javWjcn5deA1Px39e80nJzaLgkvRafyYCuJIGSoZ0XZMZpu8KLTlvgbogWm1iUt6lH6MUuxoKstG1clDUP7yUgEzGqyQrLjbJ+jzFnU4zFiIJIXnDwpYkl0WhfEVRzX59FL+ecT6ZdQx+teipcm33AUWF9iWwinwutAs0839MFYPmBkS+7kz72rP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3331.namprd18.prod.outlook.com (10.255.136.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 13:40:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 13:40:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 1/4] iommu / x86: move call to scan_pci_devices() out
 of vendor code
Thread-Index: AQHVO7+0vp5IFFxe40a9hOR1TZYA+abZ0zeA
Date: Wed, 24 Jul 2019 13:40:35 +0000
Message-ID: <b1e457b1-7e42-4c5f-d5ad-998d360c90c5@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-2-paul.durrant@citrix.com>
In-Reply-To: <20190716101657.23327-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0069.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f233f9b-b3fa-4dbd-c8fc-08d7103c815f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3331; 
x-ms-traffictypediagnostic: BY5PR18MB3331:
x-microsoft-antispam-prvs: <BY5PR18MB3331E95BF4645191E9028E39B3C60@BY5PR18MB3331.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(199004)(189003)(71200400001)(54906003)(31686004)(36756003)(14454004)(71190400001)(66066001)(80792005)(486006)(99286004)(81166006)(8676002)(81156014)(6486002)(68736007)(7736002)(476003)(31696002)(86362001)(6512007)(256004)(14444005)(305945005)(3846002)(316002)(2616005)(446003)(4744005)(229853002)(5660300002)(11346002)(6916009)(6116002)(76176011)(64756008)(26005)(4326008)(25786009)(186003)(6246003)(478600001)(66446008)(66556008)(52116002)(6436002)(53546011)(6506007)(8936002)(66476007)(386003)(102836004)(53936002)(2906002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3331;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1CI+mpoUVluZqfbe5nacJXqtwz6o8rrKTLm+Rf9HPuLgTwBg/Gle5ERVN3OwsJubMhlDGPjnKSHkASertlrnvMRRb3wU3gJzxD0s/3/aYITDWDAKg1lUz8+VFeQ2N40MRVOH9ark0RyQSeubmfDUqQYE8RZEJxhgHAohpmYOz2vxwmmq256YD5UhyUCjAsXVNhZfyYC7hAgTyuCzLSCw9qbqm0gKM7SVVB/bcMH4eVJHNIxDKcVVo+ucn/xyPVkQKWCFlqbPMfdpvUNCPdIaLbCEWoC91VV8SGrob76pj8Aivd77EPPfdXQIMq/cpP7o2+ET7beb6hy2cb6E5vl5FwdYsw6+CssN0cBrQSEsOhxj4lSdiaI6N1lI9c32sLpETd5ksW8MMKTUQLHv//My8/jdOxPnwvpz1MAGpQJtBG4=
Content-ID: <FD857603BD2D404A9283B00B2F75C6B1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f233f9b-b3fa-4dbd-c8fc-08d7103c815f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 13:40:35.3063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3331
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: KevinTian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvaW9tbXUuYw0KPiBAQCAtMjgsOSArMjgsMTUgQEAgc3RydWN0IGlvbW11X29wcyBf
X3JlYWRfbW9zdGx5IGlvbW11X29wczsNCj4gICANCj4gICBpbnQgX19pbml0IGlvbW11X2hhcmR3
YXJlX3NldHVwKHZvaWQpDQo+ICAgew0KPiArICAgIGludCByYzsNCj4gKw0KPiAgICAgICBpZiAo
ICFpb21tdV9pbml0X29wcyApDQo+ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gICANCj4g
KyAgICByYyA9IHNjYW5fcGNpX2RldmljZXMoKTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICAg
ICAgcmV0dXJuIHJjOw0KDQogRnJvbSBhbiBhYnN0cmFjdCBQT1YgSSdtIG5vdCBjb252aW5jZWQg
ZmFpbGluZyBJT01NVSBpbml0IGJlY2F1c2UNCmEgZmFpbGVkIGJ1cyBzY2FuIGlzIGFwcHJvcHJp
YXRlLiBCdXQgdGhlIG9ubHkgY3VycmVudGx5IHBvc3NpYmxlDQpmYWlsdXJlIGlzIC1FTk9NRU0s
IGluIHdoaWNoIGNhc2Ugd2UnZCBiZSBpbiBiaWdnZXIgdHJvdWJsZSBhbnl3YXkuDQpUaGVyZWZv
cmUNCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoZSBvdGhl
ciBxdWVzdGlvbiBvZiBjb3Vyc2UgaXMgaW4gaG93IGZhciB5b3UgY2FuIHNlbnNpYmx5IHVzZQ0K
dGhlIHJlc3VsdHMgb2YgdGhpcyAoaW5jb21wbGV0ZSkgYnVzIHNjYW4gbGF0ZXIgZHVyaW5nIElP
TU1VIGluaXQuDQpCdXQgaG9wZWZ1bGx5IHRoYXQnbGwgYmVjb21lIGNsZWFyIGZyb20gdGhlIHN1
YnNlcXVlbnQgcGF0Y2hlcy4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
