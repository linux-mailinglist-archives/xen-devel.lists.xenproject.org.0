Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F766EABF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXkL-000616-Vi; Fri, 19 Jul 2019 18:36:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXkK-000611-Ka
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:36:44 +0000
X-Inumbo-ID: 27b5341e-aa54-11e9-8980-bc764e045a96
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe52::607])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27b5341e-aa54-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/rLA6ihfqQnHOrkXrdG2E86AIljXO3O5zz5wnK4UzmSl/MK0DLogzlj2N+aYfx7g/z5ov7iUhFPLIIWG9+S6zd2c8SFBpHUSNnMEaQ9WCmevquCfnEe+ATqMndbSG80O/P9pnT9627pKqFvIYDr9PXG0qyTYDmszQ3LvigCGOdNq5ZuoO3BCR+uX3LkMgcqsGLHNiKNVBeqWdOq+n/mGoHZhJdD/JQbQ4DXr+0UnOulOA3iCSAGsORMePyYjCrBhqOb38R3Dw0xaof1zNHSIHMXKb/GBYY/P0MmAGSH191LBbMzMixGiuUfMZgu4NPCgJUGTxi+vavR8u2ns2EdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfANS4wSx2EwnHmZYcEtGzpQssINyLv13jORKiSfn+0=;
 b=ULjYC4TgaAerkDHm6crB4iTl0IYyaT+M2/mABrM9tmmsRaoQdOU/CYpKt8mDUz7V1GtSWbuQ79LIIK+gOKf+b6WLrHjuppulynxXOa55KcpRz+7QN4lA5j37GY20KGfuw19TI7IIliSc0mgyADswZycBM2zgJnAeqK/FEc5oP5Y7lEl+pdGogaC1SnJDuN9YH55Jj9KDAIHJH+/85yg7Mq1TCeYN6d/t/40c5eGOZZWBtSSwhAl6gfZsqRm07f1+QTuEpGrB+ECntGsOwWEAy+vfnbXPx/ccLzXtYysZPP3hplDQIZMlYWIlc6aPINuYcX7Kcnf7cnYR/BJAuQmVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfANS4wSx2EwnHmZYcEtGzpQssINyLv13jORKiSfn+0=;
 b=r6gKJyleTmFEmNQlZGj06oyHHStXc64r3yOY1XliU6yC9hWNeu5uILEt4hOllNGqLSor6WOtGEwh/hF+G5p0PuwYeepQRRKMk8Gx4eCJCnEJjxrlJYmhAERyDC58jzmscfOX8CzEeUqQBrw0k95wfDqoaPYdlS09p7/sbA34sC4=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3948.namprd12.prod.outlook.com (10.255.174.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:36:41 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:36:41 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 09/14] AMD/IOMMU: split amd_iommu_init_one()
Thread-Index: AQHVO/Up+mMK2rYsWEmGw2zAQbNEg6bSSeOA
Date: Fri, 19 Jul 2019 18:36:41 +0000
Message-ID: <20190719183638.GG4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <5edb6957-62b2-6dc7-c873-e7b3c5794f89@suse.com>
In-Reply-To: <5edb6957-62b2-6dc7-c873-e7b3c5794f89@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0139.namprd05.prod.outlook.com
 (2603:10b6:803:2c::17) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd2f32a0-612b-494b-fc47-08d70c780af7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3948; 
x-ms-traffictypediagnostic: DM6PR12MB3948:
x-microsoft-antispam-prvs: <DM6PR12MB394851CE533E1F9BA23D6E3BE5CB0@DM6PR12MB3948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(199004)(189003)(486006)(11346002)(26005)(102836004)(386003)(446003)(1076003)(186003)(476003)(54906003)(6506007)(2616005)(6436002)(52116002)(316002)(66066001)(66556008)(6486002)(99286004)(6512007)(76176011)(5660300002)(14444005)(71200400001)(53936002)(256004)(66446008)(4326008)(66476007)(6246003)(66946007)(64756008)(25786009)(229853002)(6916009)(33656002)(68736007)(36756003)(305945005)(81156014)(2906002)(71190400001)(7736002)(3846002)(86362001)(8936002)(478600001)(6116002)(8676002)(81166006)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3948;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gzu2/quw/iYA38jojawO9pgEczTY5lr9+bXj7co0A/JvpP8t4UH37+VrEFTpICZUhpmQquxirF2lSsTsNFtH48YJwEreEc3vUkvI2UdGHbEuuZYDtmr9OfG30cfw/ViLo0FYqicsXZT/BMDfun742KWkyjMsEHjHm5IIs5YEPT4b75X1nQ1vWBJo352eh0WMaCCAGKiRv52qrSzgIQrjuS0/tOTo4KjXk8qidcCEZ2lQBR+OkA9nlihJdwyVwKUYrt2pnK7zwSBNS+bWTnMAceGBVDykO02qWds4ShZ5S2oJIEAMbJDBus6TwoB6ith0XL0M0K1Q5O60l0fw1+OTqBDAvAlGyXOhHIKXPwWRwTO3iSDewAmmccPuByRoEj6eypu9SWlx9L0BWGFOVw/FsFuHHzGTVCk5SDuJNZYfiuA=
Content-ID: <9B60C1D851F1934BBEF6A53CEFBB4A2A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2f32a0-612b-494b-fc47-08d70c780af7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:36:41.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3948
Subject: Re: [Xen-devel] [PATCH v3 09/14] AMD/IOMMU: split
 amd_iommu_init_one()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods, 
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6Mzk6MTBQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTWFwcGluZyB0aGUgTU1JTyBzcGFjZSBhbmQgb2J0YWluaW5nIGZlYXR1cmUgaW5mb3Jt
YXRpb24gbmVlZHMgdG8gaGFwcGVuCj4gc2xpZ2h0bHkgZWFybGllciwgc3VjaCB0aGF0IGZvciB4
MkFQSUMgc3VwcG9ydCB3ZSBjYW4gc2V0IFhURW4gcHJpb3IgdG8KPiBjYWxsaW5nIGFtZF9pb21t
dV91cGRhdGVfaXZyc19tYXBwaW5nX2FjcGkoKSBhbmQKPiBhbWRfaW9tbXVfc2V0dXBfaW9hcGlj
X3JlbWFwcGluZygpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAtOTcwLDE0ICs5NzAs
NiBAQCBzdGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0Cj4gICAKPiAgIHN0
YXRpYyBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0X29uZShzdHJ1Y3QgYW1kX2lvbW11ICppb21t
dSkKPiAgIHsKPiAtICAgIGlmICggbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KSAhPSAwICkK
PiAtICAgICAgICBnb3RvIGVycm9yX291dDsKPiAtCj4gLSAgICBnZXRfaW9tbXVfZmVhdHVyZXMo
aW9tbXUpOwo+IC0KPiAtICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLnJhdyApCj4gLSAgICAgICAg
aW9tbXV2Ml9lbmFibGVkID0gMTsKPiAtCj4gICAgICAgaWYgKCBhbGxvY2F0ZV9jbWRfYnVmZmVy
KGlvbW11KSA9PSBOVUxMICkKPiAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7Cj4gICAKPiBAQCAt
MTIwMiw2ICsxMTk0LDIzIEBAIHN0YXRpYyBib29sX3QgX19pbml0IGFtZF9zcDUxMDBfZXJyYXR1
bTIKPiAgICAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IF9faW5pdCBhbWRf
aW9tbXVfcHJlcGFyZV9vbmUoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCj4gK3sKPiArICAgIGlu
dCByYyA9IGFsbG9jX2l2cnNfbWFwcGluZ3MoaW9tbXUtPnNlZyk7Cj4gKwo+ICsgICAgaWYgKCAh
cmMgKQo+ICsgICAgICAgIHJjID0gbWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KTsKPiArICAg
IGlmICggcmMgKQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAgICBnZXRfaW9tbXVfZmVh
dHVyZXMoaW9tbXUpOwo+ICsKPiArICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLnJhdyApCj4gKyAg
ICAgICAgaW9tbXV2Ml9lbmFibGVkID0gdHJ1ZTsKPiArCj4gKyAgICByZXR1cm4gMDsKPiArfQo+
ICsKPiAgIGludCBfX2luaXQgYW1kX2lvbW11X2luaXQodm9pZCkKPiAgIHsKPiAgICAgICBzdHJ1
Y3QgYW1kX2lvbW11ICppb21tdTsKPiBAQCAtMTIzMiw3ICsxMjQxLDcgQEAgaW50IF9faW5pdCBh
bWRfaW9tbXVfaW5pdCh2b2lkKQo+ICAgICAgIHJhZGl4X3RyZWVfaW5pdCgmaXZyc19tYXBzKTsK
PiAgICAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApCj4gICAgICAgewo+IC0gICAgICAg
IHJjID0gYWxsb2NfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKTsKPiArICAgICAgICByYyA9IGFt
ZF9pb21tdV9wcmVwYXJlX29uZShpb21tdSk7Cj4gICAgICAgICAgIGlmICggcmMgKQo+ICAgICAg
ICAgICAgICAgZ290byBlcnJvcl9vdXQ7Cj4gICAgICAgfQo+IAoKLS0gCkJyaWFuIFdvb2RzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
