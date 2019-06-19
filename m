Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD864BE3E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:31:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hddSR-0000LH-Om; Wed, 19 Jun 2019 16:29:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3it4=US=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hddSQ-0000LC-VU
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 16:29:11 +0000
X-Inumbo-ID: 5d228eb4-92af-11e9-8980-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::61a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d228eb4-92af-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1X4A+KmJVSRJm0lFXHdw5n9Xye71JQf+qJmAh8H868=;
 b=GYawGvGWAkqB5Stog9GYw34h4kZl7pblpX+kXA76kxPUM4KvkTo2RIb1kA/natvdMEYb+ADgYZHI8yUv3bPlZaqEJRe3Q/359Qok6dl7W0+3XIpp7t1jD2zfGbmoDa00KcSCjPx+jjxii/KA/4LHNlERCtZcm0xJzCukMYkgYws=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3562.namprd12.prod.outlook.com (20.178.199.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Wed, 19 Jun 2019 16:29:07 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 16:29:07 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu devices to
 Xen"
Thread-Index: AQHVGgxUC+nKk5wj3EapjZxECnn/96ajRCCA
Date: Wed, 19 Jun 2019 16:29:07 +0000
Message-ID: <20190619162904.GI20907@amd.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
In-Reply-To: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR02CA0126.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::28) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4616daaf-6648-47f2-7d7e-08d6f4d34069
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3562; 
x-ms-traffictypediagnostic: DM6PR12MB3562:
x-microsoft-antispam-prvs: <DM6PR12MB35624ABAAD9423A014E92E09E5E50@DM6PR12MB3562.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:51;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(8936002)(66556008)(86362001)(5660300002)(7736002)(66946007)(6116002)(99286004)(54906003)(71190400001)(66476007)(71200400001)(6246003)(316002)(14444005)(386003)(1076003)(476003)(26005)(446003)(2616005)(11346002)(486006)(2906002)(6506007)(52116002)(4744005)(76176011)(102836004)(36756003)(186003)(25786009)(14454004)(53936002)(6512007)(81156014)(73956011)(3846002)(6916009)(6436002)(256004)(229853002)(68736007)(6486002)(8676002)(72206003)(64756008)(66066001)(66446008)(305945005)(33656002)(81166006)(4326008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3562;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6gwLPhUtAYzQ1ebTgaMGjOZ9XJ9yOcwwjYwwWTDTfd35iS2kWG6IebnEOY29vHi0yPYDqGm7VwfAYQ4SDvU1P7eQ7L+3OCtqia5wSX70fgDAMec7UqNcFivAhNdSr2Ie2TP6T9PdnIgMnrdONybu5PIVechyuO7dASuvGbLMYgLQyyOcnBS73J0pF/L3RdiORxEhw1IZ80flsfffbbCaUOiYQBLX4BxLDOkU3IVbBVI/Oq1FJ8s1BkAP/UIHseuv2nsneyIMq1muhGmuHtC3Lzo1pJaVxPltfPnoq+nolAbXPXUgXJxzYrS2wQUtozu5j+lYVe+/63g0bKebPu0yCqw1AdXjie7Mj/cfkYLm0H31MSDnaAdrp0aMfEGApAwnFicyxKZRCLK9lwGr1m+Ph3JU98ebW/lXHnr5KeWp+iA=
Content-ID: <2D741B641F33A342A31AA391DD249201@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4616daaf-6648-47f2-7d7e-08d6f4d34069
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 16:29:07.7514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3562
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
YjZiZDAyYjdhODc3ZjlmYWMyZGU2OWU2NGQ4MjQ1ZDU2ZjkyYWIyNS4gVGhlIGNoYW5nZQo+IHdh
cyByZWR1bmRhbnQgd2l0aCBhbWRfaW9tbXVfZGV0ZWN0X29uZV9hY3BpKCkgYWxyZWFkeSBjYWxs
aW5nCj4gcGNpX3JvX2RldmljZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1k
LmNvbT4KCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAtMTAy
MSw4ICsxMDIxLDYgQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcHByX2xvZyhzdAo+
IAo+ICBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUoc3RydWN0IGFtZF9pb21t
dSAqaW9tbXUpCj4gIHsKPiAtICAgIHBjaV9oaWRlX2RldmljZShpb21tdS0+c2VnLCBQQ0lfQlVT
KGlvbW11LT5iZGYpLCBQQ0lfREVWRk4yKGlvbW11LT5iZGYpKTsKPiAtCj4gICAgICBpZiAoIG1h
cF9pb21tdV9tbWlvX3JlZ2lvbihpb21tdSkgIT0gMCApCj4gICAgICAgICAgZ290byBlcnJvcl9v
dXQ7Cj4gCj4gCj4gCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
