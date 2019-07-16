Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917F6ACF8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQV5-0003RL-3h; Tue, 16 Jul 2019 16:40:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQV2-0003Qk-Rd
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:40:20 +0000
X-Inumbo-ID: 65ef2567-a7e8-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65ef2567-a7e8-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:40:20 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:40:18 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:39:11 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDMukGVLmmwS520wABqeEj/aFicL0n8jvZWOb0mXa3dKkI3PBOx6VDSII+WWRWAZdQGZun9iHHAkOqV+d6f+63Wt2RQf2vfqEFiEjdnnatRfzY9Ye5mM86d3jRXwAJppli/zbJq3NDUc7Ge2ksPLDNvaiDE7AigvELERAUCcmbPENgUunrfukTH+XSnnGR0AyKsbfqLk9tOly1vC/AkRJrQ9KdEa6LrAqN8o54zIeXXvARddHTawPHi76/VcMIYRXOSwiEfQZ786tUhkxEcScvsQhIpj7KRObRTkoAHLSZFHI8aXJyvI4hoSw8A/0BCQQb+qZUgA8pM3lMQMhFN00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg83EnRe07r+jRjZ/qwIpCyfBh20KxWeQ/+c3Wzs1Lc=;
 b=VijdwysAAIaWGC8XPsJOi71cP5GTlSPnXh+Ryn5MYQwYZfZ3dGwUfWgBr8qgd5X1lUeibXCaDooE934Xeo4xSdfhIg8EQ4fQIu4qpCmfe2waXRHrjhOgoj13q0Ji33zCh7BZk+QGt0lahVhsP4H+GXDG8c2yYbDX65IErPbZdxcFwVRUOnIvJqA5CAkaBgg3AcKMiwoKiciqah6pFao9bBFqJDY+JcxWweyUJKzryOXSHT3VFG7VlKMoGq1w8Z2jX8aqY7HxlfdtgQir3UXRhylKoSUwa5SygC72DHfBHmsb1+kRtW6Ez5963GlQhrLJeIY6vk3+vmIS/T3zUlZ8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:39:10 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:39:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 09/14] AMD/IOMMU: split amd_iommu_init_one()
Thread-Index: AQHVO/T+l/L0RdzIkE6hk2D5aqFLVA==
Date: Tue, 16 Jul 2019 16:39:10 +0000
Message-ID: <5edb6957-62b2-6dc7-c873-e7b3c5794f89@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0012.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1694d6ea-3ea4-44a5-8e39-08d70a0c210a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB3164938EAC95B73AFA6BDD50B3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tkWIruv9oQVp1BJzJCyqmhqVLyxa3L3H8dlStP4MIbsh4d3XXQQH7Ep3D1hZmgRrSLV3O8xUCQrFbsFVfI339OvgIRjzovjh/jRwERJ7wa34zVbmtjOAYeY/Li3L/QuNZPtzsbJZm9UycNQChwRxsnSS9B7bZNa1A4sKUeo55O0VV7I6XmfT5O1K8KfgBVm9omj0nj3npkdRpUJ+WmQd8Y+lLbMmqzeM+G7i9cnFzArJYMJuv34yDe1KhorRNafbZxcq0GsIpW4ayynSLsENh+2GO3jBJqvqsXinAfYxNw4Ta7V+mE3YCdQJdFiZ8+AsLv2mm8XwNESyblrnjTm8QhlsXp9tJxTVVr/0Xxg3lFKqgdYunBSLnVPrUll5G7GbIR6vnZmAUgW1GePhf7e2hiThqs1EHSxu0XFItnyLOfU=
Content-ID: <1562B3732A22AE459B1176398EAC8B15@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1694d6ea-3ea4-44a5-8e39-08d70a0c210a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:39:10.8298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 09/14] AMD/IOMMU: split amd_iommu_init_one()
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFwcGluZyB0aGUgTU1JTyBzcGFjZSBhbmQgb2J0YWluaW5nIGZlYXR1cmUgaW5mb3JtYXRpb24g
bmVlZHMgdG8gaGFwcGVuDQpzbGlnaHRseSBlYXJsaWVyLCBzdWNoIHRoYXQgZm9yIHgyQVBJQyBz
dXBwb3J0IHdlIGNhbiBzZXQgWFRFbiBwcmlvciB0bw0KY2FsbGluZyBhbWRfaW9tbXVfdXBkYXRl
X2l2cnNfbWFwcGluZ19hY3BpKCkgYW5kDQphbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcGlu
ZygpLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpS
ZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0K
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KQEAgLTk3MCwxNCArOTcwLDYg
QEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhzdA0KICANCiAgc3RhdGlj
IGludCBfX2luaXQgYW1kX2lvbW11X2luaXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQ0K
ICB7DQotICAgIGlmICggbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KSAhPSAwICkNCi0gICAg
ICAgIGdvdG8gZXJyb3Jfb3V0Ow0KLQ0KLSAgICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOw0K
LQ0KLSAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5yYXcgKQ0KLSAgICAgICAgaW9tbXV2Ml9lbmFi
bGVkID0gMTsNCi0NCiAgICAgIGlmICggYWxsb2NhdGVfY21kX2J1ZmZlcihpb21tdSkgPT0gTlVM
TCApDQogICAgICAgICAgZ290byBlcnJvcl9vdXQ7DQogIA0KQEAgLTEyMDIsNiArMTE5NCwyMyBA
QCBzdGF0aWMgYm9vbF90IF9faW5pdCBhbWRfc3A1MTAwX2VycmF0dW0yDQogICAgICByZXR1cm4g
MDsNCiAgfQ0KICANCitzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZV9vbmUoc3Ry
dWN0IGFtZF9pb21tdSAqaW9tbXUpDQorew0KKyAgICBpbnQgcmMgPSBhbGxvY19pdnJzX21hcHBp
bmdzKGlvbW11LT5zZWcpOw0KKw0KKyAgICBpZiAoICFyYyApDQorICAgICAgICByYyA9IG1hcF9p
b21tdV9tbWlvX3JlZ2lvbihpb21tdSk7DQorICAgIGlmICggcmMgKQ0KKyAgICAgICAgcmV0dXJu
IHJjOw0KKw0KKyAgICBnZXRfaW9tbXVfZmVhdHVyZXMoaW9tbXUpOw0KKw0KKyAgICBpZiAoIGlv
bW11LT5mZWF0dXJlcy5yYXcgKQ0KKyAgICAgICAgaW9tbXV2Ml9lbmFibGVkID0gdHJ1ZTsNCisN
CisgICAgcmV0dXJuIDA7DQorfQ0KKw0KICBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KHZvaWQp
DQogIHsNCiAgICAgIHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11Ow0KQEAgLTEyMzIsNyArMTI0MSw3
IEBAIGludCBfX2luaXQgYW1kX2lvbW11X2luaXQodm9pZCkNCiAgICAgIHJhZGl4X3RyZWVfaW5p
dCgmaXZyc19tYXBzKTsNCiAgICAgIGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkNCiAgICAg
IHsNCi0gICAgICAgIHJjID0gYWxsb2NfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKTsNCisgICAg
ICAgIHJjID0gYW1kX2lvbW11X3ByZXBhcmVfb25lKGlvbW11KTsNCiAgICAgICAgICBpZiAoIHJj
ICkNCiAgICAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7DQogICAgICB9DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
