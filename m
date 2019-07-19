Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7C16EAC1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXmK-00067F-HD; Fri, 19 Jul 2019 18:38:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXmJ-00067A-9s
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:38:47 +0000
X-Inumbo-ID: 6f40df72-aa54-11e9-9eab-b3929346373b
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (unknown
 [40.107.71.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f40df72-aa54-11e9-9eab-b3929346373b;
 Fri, 19 Jul 2019 18:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwVof2Bjm6Q/pn+bwdDqNXyG9PEnscGsMoJ2ZjMmczoTbIuoM+OrPzKupQj5zspWitXrPd+vtFhEs/rdGTJuRINhKsbLFHfXo1dOJZHsL7d4Dpirl9H0e7VY0knxcHhW93+zzz3wuwgmkUzD+X3Z8GFHtTxBH/JY9V4tl9aGnQj9mqTfqTlsqlId+RhZnEogupGR2RtYYuaw3wlQ6rNPfK+o4uz03uO9ObajLZSTZlQFVqf7aFnLF0WVKZWHMvtRdK1PhePgd6BLjS2HcGnWIi0a+54v6lp3xZyJE5DJwZZ6V0jmZM14UFi37zgTs4OmKLzYzOQQDlZZLVB82f+tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUNztsdcvl8R5sMrdihEIgmkaKG7JJ+K/88cjEVRlN0=;
 b=hlrWmKH5kQCv+88tWlm6Th+kynQf0nPO2theQJshthuAtjGwgg9dTUX5OW6NJ1RS7KQAKDpHJN/blS/VXs/ZznJuXExbfKOgZiFRuVZ8mhLxbtG1AyP/fczE54AtSwLI8fJSHUF5suiWEHBkiswjAvjwL08FQejw5E7lD+TriXg31DR0UjZac+sXW777jmASilJAsmMnOSNsd9/KGP9m2mlE2ZF+yijl4DHQJvfZjvOXy+/cXxwcaQmfRJmD7w+6M0N3NC8Zt6M1imT4dbtz28mJmUhcmWKz6ziR/AYTWaH8hoITv783M1beVEiHZ3YmhCNXRtir8N3nRmKCW9zZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUNztsdcvl8R5sMrdihEIgmkaKG7JJ+K/88cjEVRlN0=;
 b=epsq6Z9fbdT6bMuJh1exE2FRztgkiB4ZiXB1Caua0FuDUOaRzjC22qG/CXZBXhfv6cO+e5cEHbe4WLWN9IHzvKPLfHD1nn+v906kB9xqr67wsj6ShclqfRmCAUP5c8kEQqtT2MrVeDMM4evyIyuDcHf6n6XT4tGQYBWSWuHDEpc=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3948.namprd12.prod.outlook.com (10.255.174.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:38:42 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:38:42 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 10/14] AMD/IOMMU: allow enabling with IRQ not yet set
 up
Thread-Index: AQHVO/U8BV63KFRAsUK1NOH3w2KsA6bSSnKA
Date: Fri, 19 Jul 2019 18:38:42 +0000
Message-ID: <20190719183839.GH4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <a2548d39-29c2-1afd-619d-ace67c4d61d6@suse.com>
In-Reply-To: <a2548d39-29c2-1afd-619d-ace67c4d61d6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN2PR01CA0063.prod.exchangelabs.com (2603:10b6:800::31) To
 DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 755aeeda-a9c8-4881-d0f6-08d70c7852b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3948; 
x-ms-traffictypediagnostic: DM6PR12MB3948:
x-microsoft-antispam-prvs: <DM6PR12MB3948B3EB7F18DC72CDCA8E25E5CB0@DM6PR12MB3948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(199004)(189003)(486006)(11346002)(26005)(102836004)(386003)(446003)(1076003)(186003)(476003)(54906003)(6506007)(2616005)(6436002)(52116002)(316002)(66066001)(66556008)(6486002)(99286004)(6512007)(76176011)(5660300002)(14444005)(71200400001)(53936002)(256004)(66446008)(4326008)(66476007)(6246003)(66946007)(64756008)(25786009)(229853002)(6916009)(33656002)(68736007)(36756003)(305945005)(81156014)(2906002)(71190400001)(7736002)(3846002)(86362001)(8936002)(478600001)(6116002)(8676002)(81166006)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3948;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yqUYLG5e9Qe9h7bOcyrdf/TzJwM2AsVAjmj7whdUCh5NKJ61f8q+OKTDTF4KrTjxIUPpsdYxyKUNfUw7kxrOJ7rPOd3IPXwGxCvsvjKik5v49ub62VcZJ4bdDHxp+gaMtQeGevrKFqehEZAaJ8SBf8KSTEW7/cQP853yNW0x/HSEPYAUNxANA5IDXz8Oh6gWKN7Gg388vHsh/n9jcnMx0p0ZYI8epTzJ4ngMQmUA1GjYWXU7Dgqh17uLB0QOz8iuf1bYiUpYy7okIkLyUbI58VaZSbLGWs1cpmPUN7iFArGISO2HLIfn1mi/3lxdOkGZFoDlGZEpSJBawLJ4PJQQpVvBiLjibOn8q3029YTi7NlAPMzjErizr8Nr3D/Gxkebr7TVHz2exU/83YdwBlOW28hfqzdJnbEEYhFvDz1Ap2s=
Content-ID: <9AF0B0782654BD4D9D22AA808B8CCC7C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755aeeda-a9c8-4881-d0f6-08d70c7852b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:38:42.0975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3948
Subject: Re: [Xen-devel] [PATCH v3 10/14] AMD/IOMMU: allow enabling with IRQ
 not yet set up
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6Mzk6MzRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRWFybHkgZW5hYmxpbmcgKHRvIGVudGVyIHgyQVBJQyBtb2RlKSByZXF1aXJlcyBkZWZl
cnJpbmcgb2YgdGhlIElSUQo+IHNldHVwLiBDb2RlIHRvIGFjdHVhbGx5IGRvIHRoYXQgc2V0dXAg
aW4gdGhlIHgyQVBJQyBjYXNlIHdpbGwgZ2V0IGFkZGVkCj4gc3Vic2VxdWVudGx5Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBCcmlh
biBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjM6IFJlLWJhc2UuCj4gCj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAtODE0LDcgKzgxNCw2
IEBAIHN0YXRpYyB2b2lkIGFtZF9pb21tdV9lcnJhdHVtXzc0Nl93b3JrYXIKPiAgIHN0YXRpYyB2
b2lkIGVuYWJsZV9pb21tdShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKPiAgIHsKPiAgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOwo+IC0gICAgc3RydWN0IGlycV9kZXNjICpkZXNjOwo+ICAgCj4g
ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5sb2NrLCBmbGFncyk7Cj4gICAKPiBAQCAt
ODM0LDE5ICs4MzMsMjcgQEAgc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9t
bQo+ICAgICAgIGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApCj4gICAgICAgICAg
IHJlZ2lzdGVyX2lvbW11X3Bwcl9sb2dfaW5fbW1pb19zcGFjZShpb21tdSk7Cj4gICAKPiAtICAg
IGRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNpLmlycSk7Cj4gLSAgICBzcGluX2xvY2soJmRl
c2MtPmxvY2spOwo+IC0gICAgc2V0X21zaV9hZmZpbml0eShkZXNjLCBOVUxMKTsKPiAtICAgIHNw
aW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsKPiArICAgIGlmICggaW9tbXUtPm1zaS5pcnEgPiAwICkK
PiArICAgIHsKPiArICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhp
b21tdS0+bXNpLmlycSk7Cj4gKwo+ICsgICAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7Cj4g
KyAgICAgICAgc2V0X21zaV9hZmZpbml0eShkZXNjLCBOVUxMKTsKPiArICAgICAgICBzcGluX3Vu
bG9jaygmZGVzYy0+bG9jayk7Cj4gKyAgICB9Cj4gICAKPiAgICAgICBhbWRfaW9tbXVfbXNpX2Vu
YWJsZShpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsKPiAgIAo+ICAgICAgIHNldF9pb21t
dV9odF9mbGFncyhpb21tdSk7Cj4gICAgICAgc2V0X2lvbW11X2NvbW1hbmRfYnVmZmVyX2NvbnRy
b2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7Cj4gLSAgICBzZXRfaW9tbXVfZXZlbnRf
bG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7Cj4gICAKPiAtICAgIGlm
ICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApCj4gLSAgICAgICAgc2V0X2lvbW11X3Bw
cl9sb2dfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsKPiArICAgIGlmICgg
aW9tbXUtPm1zaS5pcnEgPiAwICkKPiArICAgIHsKPiArICAgICAgICBzZXRfaW9tbXVfZXZlbnRf
bG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7Cj4gKwo+ICsgICAgICAg
IGlmICggaW9tbXUtPmZlYXR1cmVzLmZsZHMucHByX3N1cCApCj4gKyAgICAgICAgICAgIHNldF9p
b21tdV9wcHJfbG9nX2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7Cj4gKyAg
ICB9Cj4gICAKPiAgICAgICBpZiAoIGlvbW11LT5mZWF0dXJlcy5mbGRzLmd0X3N1cCApCj4gICAg
ICAgICAgIHNldF9pb21tdV9ndWVzdF90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01NVV9D
T05UUk9MX0VOQUJMRUQpOwo+IAoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
