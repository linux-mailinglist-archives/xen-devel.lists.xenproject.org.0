Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77AA86726
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 18:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvlIo-0008Kl-8o; Thu, 08 Aug 2019 16:30:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uxjt=WE=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hvlIm-0008Kf-NJ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 16:30:08 +0000
X-Inumbo-ID: c861345d-b9f9-11e9-8980-bc764e045a96
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe42::612])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c861345d-b9f9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 16:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My2YIHaiP111xafbD0uvphFMxSSTy+7jlf91qAumkTYBXIspQyoJ4GgvMqrOxxyP+D5yIsnTv4TFVro4Pq40qvqqSi9X/onu8W9Gvfol5rpeqkoPLAPrji+B9tsaJ9meZL5uMIRMIPkwH53yumFr2qyGgo6xhLHDwyO43bsmVYCnsBjDexylReqTnnrM45v15mTCtB2IlimC9kFjuELkfnwjIebmp3dC5L+NEIKWSf48FORimU0A7ALV49RRZ4SnJAf11YF3uC/ib3gQpOp/+2h3QBtb2u+IgKe2JzkvYVnfjJEQQHr9oiELN5BnqugD44wMbtKVbt3Gnu3kBFIs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5q0DuNsu8Mbz5wvM5h12FKWKYqZsFHrAXtDv96m70c=;
 b=FytQEjfnleyljswl2xbaBIvVKHdxv2Gw9GcsomDaMJViZfxNMW7X8NryC4opv+nKWcDTeaqR4QxzG0Vx3scrUi0yTzInUf31WeT8WveX7irgaQMOycbQmOCeG0J4km9HFiw/VT9HFLq4QCnsNtcxtRVf+7EaA2RsoD5GzLdhY0fthRz+grTRUucCWOaOhFTiTvh/JTJBIizyUTh8CSgev0/R+cQuBGiNxaWG/tFWr8CC/RBuTHa1qeP1mmVZoW6WA7chDycFT7RFKMjwZKSJKKy8d3QPWKe96L6wlJ4Ox9SRShy5xcuNLHqjuV6EWwYbPaHxqHeMZB9HcM5elS7eww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5q0DuNsu8Mbz5wvM5h12FKWKYqZsFHrAXtDv96m70c=;
 b=o8fBTbFnZ/t7xYbU9Bc8b2ueh9KjHX71KpT6Xs65iAyKNNjo0YTvaETx0VSJMXan1OOnLhKxetodE6IjC/0LfO+DNadQxMUBcpkR617A9yNE/TyL6HpuLosR1vLDJ9IMxS5ZCIWidh7YD9cf2074Vqaew9yP0nyWoYvrnZKJV7U=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3179.namprd12.prod.outlook.com (20.179.104.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 16:30:06 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090%3]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 16:30:06 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v5 02/10] AMD/IOMMU: drop stray "else"
Thread-Index: AQHVTFgCXYhTGkQ9ZEGi3uYUlh/54KbxdF+A
Date: Thu, 8 Aug 2019 16:30:05 +0000
Message-ID: <20190808163002.GA17090@amd.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <06b8a3a1-8e24-3b77-2a21-7802f4fb19af@suse.com>
In-Reply-To: <06b8a3a1-8e24-3b77-2a21-7802f4fb19af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:805:8e::39) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf284995-5d3b-4c9c-9752-08d71c1dab8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3179; 
x-ms-traffictypediagnostic: DM6PR12MB3179:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3179B93F4EAEEDC076264712E5D70@DM6PR12MB3179.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(53936002)(7736002)(66476007)(66556008)(102836004)(305945005)(66946007)(8936002)(66446008)(8676002)(14444005)(256004)(6512007)(33656002)(386003)(64756008)(6246003)(81166006)(2616005)(81156014)(86362001)(478600001)(11346002)(6506007)(6916009)(316002)(4744005)(476003)(446003)(66066001)(6436002)(14454004)(3846002)(1076003)(486006)(5660300002)(25786009)(6486002)(229853002)(186003)(71190400001)(71200400001)(52116002)(76176011)(26005)(99286004)(54906003)(4326008)(2906002)(6116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3179;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QGH6+V7q6vPGo+s2sBMctE9DzI6KFie0rAQcV0pLJnG4igWjw98NM6PtR1uPe/mkw1m7GP3DwUUxVK48OPsWyK2wFtjW2naACnsEb0LGMzZi3r0hIrUKln/q1rijnvcJnasy7eZvadxWaD1E3ykMHgWJOJV1raDglN3YyccP2bbO+ozgN4+g2HAghvGJryPBkCrNFHZrs9tg1WmjGBqxZXj1IKMsSinF211DVEZbtWPdxh+KdEqQ/gg9ExLrWnB/6DBRUghn6D0mmt2qYEoB/X79C6kqDNHTTL8QEPwocfq9Kw4tX0ZhoMHvRTOMk+mnws736Kv3KX8DFn+cY2QbHKjVhNVPAYxFP6A3rEDZLAOpCD6UmcduvYVOsQCm+ZQ7a42ZOmRrcKy082dJ8T9tuU3//FMrNN/I9n+pYiuO3OI=
Content-ID: <F6EF3DA5D3997B4FA42B868030E3E8CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf284995-5d3b-4c9c-9752-08d71c1dab8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 16:30:06.0146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkuDFvxNG7GVlh4y6O5yrUoNWH4BQgrxSqsXokMIedYSJ9bKM2tASXkiPdhyJpHi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3179
Subject: Re: [Xen-devel] [PATCH v5 02/10] AMD/IOMMU: drop stray "else"
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDM6MDg6MTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGJsYW5rIGxpbmUgYmV0d2VlbiBpdCBhbmQgdGhlIHByaW9yIGlmKCkgY2xlYXJs
eSBpbmRpY2F0ZXMgdGhhdCB0aGlzCj4gd2FzIG1lYW50IHRvIGJlIGEgc3RhbmRhbG9uZSBpZigp
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFj
a2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjU6IE5l
dy4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+IEBA
IC0xNjYsOCArMTY2LDggQEAgc3RhdGljIGludCBfX2luaXQgaW92X2RldGVjdCh2b2lkKQo+ICAg
ICAgaWYgKCAhaW9tbXVfZW5hYmxlICYmICFpb21tdV9pbnRyZW1hcCApCj4gICAgICAgICAgcmV0
dXJuIDA7Cj4gLSAgICBlbHNlIGlmICggKGluaXRfZG9uZSA/IGFtZF9pb21tdV9pbml0X2ludGVy
cnVwdCgpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICA6IGFtZF9pb21tdV9pbml0KGZhbHNl
KSkgIT0gMCApCj4gKyAgICBpZiAoIChpbml0X2RvbmUgPyBhbWRfaW9tbXVfaW5pdF9pbnRlcnJ1
cHQoKQo+ICsgICAgICAgICAgICAgICAgICAgIDogYW1kX2lvbW11X2luaXQoZmFsc2UpKSAhPSAw
ICkKPiAgICAgIHsKPiAgICAgICAgICBwcmludGsoIkFNRC1WaTogRXJyb3IgaW5pdGlhbGl6YXRp
b25cbiIpOwo+ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+IAoKLS0gCkJyaWFuIFdvb2RzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
