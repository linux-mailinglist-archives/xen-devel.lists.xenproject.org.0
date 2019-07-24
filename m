Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B756731C4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIKa-0008Oi-GI; Wed, 24 Jul 2019 14:33:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqIKZ-0008Oa-It
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:33:23 +0000
X-Inumbo-ID: fc398607-ae1f-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc398607-ae1f-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 14:33:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 14:33:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 14:29:42 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 14:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbriqHToC6YcmRagNkvd6AgMo7bqLqWDFXOfdeWEj9iLahj6WXPztP/6Sv9npkihhmareLhTqNYu4Mcn+d4s8NIsGU/Fzn4w5wMNCGP5nqI/oEfCxrXlpbQ78+ov/MpeP3/JEcJKIZwhjcdj5ARmRyVtMZrB1pWQW/z93Rws8Rox4thf1kf7TTVOEx20y13Xt/jOHKeXv3PDAPjUiGxBDt5DLtCIhDQaGcUj0u0W3RTcxKNbclLWKzn9FhsYviZ3eZpatRc6ZSEhmRnYzbYf6cVdQPYZoaAW8zphB8Ze362sMkV+ksUqqv0AtQYlOFocsdafZVF0TudEKac+GDHe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NkwCkZf1um+6L5zZVe5FGC8TQOMLrQwFg0gMwEg3h8=;
 b=AHySSzyehetY64UUgWv5fjrPatldXZ4asN40ZChtEGTvkO7NWES5gtMA2BESzh+iNOBTT2SWEwCdWOC5CHNxTpNOQfovvXWzospK3GpWGxwkozZ4UWyXQ/fk+i5m0u2uC6/Tx/fymYUSNC4wUMUpQDwKI4cCOIkuGDA3UXET5dTFcQ+OO0yGzd3hnGNV0seFI05q0PbRf2/qX2bW6IxP7p/WSGsS5+Ol/P/D7C0ll7f32kv3XoHasDH06VrabrA2GnWeeL1jgPB/EKxGyOl7GAr2FNe8rfPwZbbTu89UMJ4bjN+NwkNnUhS3k6o7Mm7jRuFnHSMzhDEXI3DTuQPy1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Wed, 24 Jul 2019 14:29:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 14:29:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 3/4] iommu: introduce iommu_groups
Thread-Index: AQHVO7+5rqBhdjdwYEadjO/an1ZP4qbZ4O0A
Date: Wed, 24 Jul 2019 14:29:40 +0000
Message-ID: <033d6fa8-a384-d302-b07a-b1677b76de8c@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-4-paul.durrant@citrix.com>
In-Reply-To: <20190716101657.23327-4-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:10:be::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 381a1dc3-b874-4c05-85af-08d710435c9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3315; 
x-ms-traffictypediagnostic: BY5PR18MB3315:
x-microsoft-antispam-prvs: <BY5PR18MB331537C74DC5E7BA2BD2D0FEB3C60@BY5PR18MB3315.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(76176011)(4326008)(6246003)(68736007)(52116002)(102836004)(31686004)(25786009)(186003)(7416002)(6436002)(2906002)(2616005)(446003)(8676002)(80792005)(11346002)(476003)(26005)(81166006)(81156014)(478600001)(6486002)(36756003)(3846002)(53546011)(305945005)(8936002)(386003)(6506007)(6512007)(53936002)(64756008)(66446008)(71200400001)(99286004)(66946007)(229853002)(256004)(14444005)(66476007)(14454004)(6116002)(71190400001)(66556008)(5660300002)(6916009)(66066001)(486006)(31696002)(54906003)(316002)(86362001)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3315;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ty3ZBT18MpEJneOhzyKpYesQne32Unf5HNrQdSg2MxqNASVvucyRwjvSt5KVWugVyBQDhU+k2Ckk9SNYqDt1tEpy9VoqCWbpxEEnQ30Lm4hS/uOkW0EAmmO7JOJC1yJSdeUt7zt1BnwngdtzlPVxm30uHKtTqYAQqWQhaSbCWKCKpU4qiaVnRopm1cL+qy92Pd++Jodt7M26JKZXiV4d/Nx0bb8YlAN73TUB30zKwUcgxmF47KbLHYCM01oLB3VR3nMFPPs0g7MOhPLRgIlieEHLxRV/nSjUKnpZ8snufJN8ySaHCgrx/lFlgNDtCO1IHd0lI2dWwNcJwe2YhoYvE3NniAqdkKOQKdwEgrgsT4PI0xYQxpPbiRVsvr2rNXCex4rDzZ7moSX0bNiufjJqbihzFu1EZPC5GDgnDRG6gB4=
Content-ID: <A8B84783DEDA5048BBEB14BCEA7D6492@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 381a1dc3-b874-4c05-85af-08d710435c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:29:40.0277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3315
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 3/4] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9NYWtlZmlsZQ0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9NYWtlZmlsZQ0KPiBAQCAtNCw2ICs0LDcgQEAgc3ViZGlyLSQoQ09ORklHX1g4NikgKz0geDg2
DQo+ICBzdWJkaXItJChDT05GSUdfQVJNKSArPSBhcm0NCj4gIA0KPiAgb2JqLXkgKz0gaW9tbXUu
bw0KPiArb2JqLSQoQ09ORklHX0hBU19QQ0kpICs9IGdyb3Vwcy5vDQoNCkkgYXNzdW1lIHRoaXMg
ZGVwZW5kZW5jeSBvbiBQQ0kgaXMgdGVtcG9yYXJ5LCBhcyB0aGVyZSdzIG5vdGhpbmcNCmluaGVy
ZW50bHkgdHlpbmcgZ3JvdXBpbmcgb2YgZGV2aWNlcyB0byBQQ0kgKGFmYWljdCk/DQoNCj4gK2lu
dCBpb21tdV9ncm91cF9hc3NpZ24oc3RydWN0IHBjaV9kZXYgKnBkZXYsIHZvaWQgKmFyZykNCj4g
K3sNCj4gKyAgICBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMgPSBpb21tdV9nZXRfb3BzKCk7
DQo+ICsgICAgaW50IGlkOw0KPiArICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JwOw0KPiArDQo+
ICsgICAgaWYgKCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkNCj4gKyAgICAgICAgcmV0dXJu
IDA7DQoNCldpdGggeW91IG1ha2luZyBncm91cHMgbWFuZGF0b3J5IChpLmUuIGV2ZW4gc29saXRh
cnkgZGV2aWNlcyBnZXR0aW5nDQpwdXQgaW4gYSBncm91cCksIHNob3VsZG4ndCB0aGlzIGJlIC1F
T1BOT1RTVVBQLCBtYXliZSBhY2NvbXBhbmllZCBieQ0KQVNTRVJUX1VOUkVBQ0hBQkxFKCk/DQoN
Cj4gKyAgICBpZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9pZChwZGV2LT5zZWcsIHBkZXYtPmJ1
cywgcGRldi0+ZGV2Zm4pOw0KPiArICAgIGlmICggaWQgPCAwICkNCj4gKyAgICAgICAgcmV0dXJu
IC1FTk9EQVRBOw0KPiArDQo+ICsgICAgZ3JwID0gZ2V0X2lvbW11X2dyb3VwKGlkKTsNCj4gKyAg
ICBpZiAoICFncnAgKQ0KPiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArICAgIGlm
ICggaW9tbXVfdmVyYm9zZSApDQo+ICsgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQXNzaWdu
ICUwNHg6JTAyeDolMDJ4LiV1IC0+IElPTU1VIGdyb3VwICV4XG4iLA0KPiArICAgICAgICAgICAg
ICAgcGRldi0+c2VnLCBwZGV2LT5idXMsIFBDSV9TTE9UKHBkZXYtPmRldmZuKSwNCj4gKyAgICAg
ICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgZ3JwLT5pZCk7DQoNCkknbSBub3Qgb3Zl
cmx5IGhhcHB5IGFib3V0IHRoaXMgbmV3IGxvZ2dpbmc6IE9uIG1vZGVybiBzeXN0ZW1zIGENCmRl
YnVnIGxldmVsIHJ1biBpcyBhbHJlYWR5IHJhdGhlciB2ZXJib3NlIGFib3V0IFBDSSBkZXZpY2Vz
LA0Kc2ltcGx5IGJlY2F1c2UgdGhlcmUgYXJlIHNvIG1hbnkuIElmIG15IGhvcGUgdG8gbm90IHNl
ZSBpbmRpdmlkdWFsDQpkZXZpY2VzIHB1dCBpbiBncm91cHMgaXMgbm90IGdvaW5nIHRvIGJlIGZ1
bGZpbGxlZCwgY2FuIHdlIGF0IGxlYXN0DQp0cnkgdG8gY29tZSB0byBzb21lIGFncmVlbWVudCB0
aGF0IGNlcnRhaW4gZGV2aWNlcyB3aGljaCBjYW4ndA0Kc2Vuc2libHkgYmUgcGFzc2VkIHRocm91
Z2ggd29uJ3QgYmUgYXNzaWduZWQgZ3JvdXBzIChhbmQgaGVuY2UNCndvbid0IHByb2R1Y2Ugb3V0
cHV0IGhlcmUpPyBBIGdyb3VwLWxlc3MgZGV2aWNlIHRoZW4gd291bGQNCmF1dG9tYXRpY2FsbHkg
YmUgdW5hYmxlIHRvIGhhdmUgaXRzIG93bmVyIGNoYW5nZWQuDQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
