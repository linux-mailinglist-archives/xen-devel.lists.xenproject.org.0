Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F877A322
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:32:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNUb-0001LT-I9; Tue, 30 Jul 2019 08:28:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNUa-0001LO-Gi
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:28:20 +0000
X-Inumbo-ID: fb534d4b-b2a3-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb534d4b-b2a3-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:28:18 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:28:14 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:22:55 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4NM5omuJvMVnv+t1wgvmKwD/yHft/fSM3qyuJkSx6Q+j0OVWTtERdH6pZVYqGjy89A4aiyQeKhCyol0NEp1CWig7jzRSPwm2vsROJP8woo0Zj79lXCoAg8suzrI96ZqT6/beFKV8YSa7lPobS13aVdxZAW1tFLsTxlVC1fQDYnZ67n1J7OFxOQzT3egYN9Yx5NK0nvzZMNFBdZxRSAo4DPB2CLQYlM7PUAtbpnbs7zosAckuTEnJoKLzLAl69/fx2EuSoJGNDfwUtY3Hr+DGooEmK7pLDq6x/zjzBHyleWA1R0dLgr4ayGhr1fGtn7k+aVFApGWWOmGUGvsmkVYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7klLcUgYy3/WSoyOcAYMbBMFaYvDbcypLENcdhdApA=;
 b=T9FFz7za8CiKePkXbtTWWufIoOdJojzwU10yh+9Tfp0zNgeh1nw0pxKYZxbdQ6w2UwycwOjyv2KdWq16G27ZTurgkPxjsO76/Rp7SJ3PC0SXZ7+emtE4GFmSNIQRkZmrz3z2kLsmxuIoFvoDlqM/sQIWaHrqe2zOHjjDuHR0eAhKElbOOhdCdFvpQPJ66MkLmfnkYj8rGuengBhoMteZYzzvw3fxOrqJm1PaBWLoFa+4CNnAfMaf153owJ3s6YaKlD/hgRd8qPfFWthY0vtld+CkS+TPzbHMJqO0rYnLh5ZISycI79cVCif1TRBx0qH+fv2CITTZ8o71q2bbE0Pz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3140.namprd18.prod.outlook.com (10.255.136.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 08:22:54 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:22:54 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: XCP-ng subproject proposal
Thread-Index: AQHVRq/8/9yJO8FqgEGRyMZ1hVn28Q==
Date: Tue, 30 Jul 2019 08:22:53 +0000
Message-ID: <7531fdc4-4f9e-11f8-5327-75afc9146a7a@suse.com>
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
 <DA30FA07-2D81-47C4-8A53-DAABF14B6749@xenproject.org>
In-Reply-To: <DA30FA07-2D81-47C4-8A53-DAABF14B6749@xenproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:6:14::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 321fc8a7-189c-4458-4bec-08d714c71e75
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3140; 
x-ms-traffictypediagnostic: BY5PR18MB3140:
x-microsoft-antispam-prvs: <BY5PR18MB3140FDA84AF2AF9760851205B3DC0@BY5PR18MB3140.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(199004)(189003)(53754006)(71190400001)(31686004)(5660300002)(14454004)(2906002)(386003)(76176011)(36756003)(4744005)(305945005)(80792005)(3480700005)(102836004)(53546011)(6246003)(6116002)(7736002)(6512007)(316002)(71200400001)(561944003)(99286004)(53936002)(3846002)(31696002)(11346002)(54906003)(6486002)(52116002)(25786009)(256004)(486006)(6436002)(229853002)(2616005)(81156014)(81166006)(186003)(478600001)(6506007)(446003)(86362001)(8936002)(66446008)(64756008)(6916009)(8676002)(66476007)(66556008)(66066001)(26005)(4326008)(68736007)(476003)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3140;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d06S9WL2jQpq1SuAKEU8fJK++TnHXmvxzcoudGHbvDlTxeXyWu+OYidUq5EYM2JgZXv6slJnqBFBOxYPSPAsqC3tENr2052mKGHxabCuFd87uPPT5c8nLFol6MzcGwvBibtACce5PhLmVrJrzsTZzvRieQRcZ7Ftk82W9KSUGtrGgROzkh3cD8U7Nx3i9Mxi3W9FWaEdI9DOWn03hiT7At1T76pRKO4XrkRj3PwVXx/1lZielWJvry/tB5jqePCU9EzDKCMZalZihbTinaIJVW+ywFpWZbKO4lGL5BJWfKwKAow6BTiYwfve+vHJshFgFUTTVMXjMD3AFyOHa8DBDgzVYbKBtZI90XZbsaLQguW6fyjdjxN8oJAXSZjdX9FS0RLDTrve1nuimKq2NVHa8mgaaF8Jc4DyP0qt9r1SVzo=
Content-ID: <31A65F1E4067664A80C3BB80422A83EF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 321fc8a7-189c-4458-4bec-08d714c71e75
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:22:53.9944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3140
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] XCP-ng subproject proposal
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <lambert.olivier@gmail.com>,
 Committers <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAyMDozOCwgTGFycyBLdXJ0aCB3cm90ZToNCj4gSGkgZXZlcnlvbmUsDQo+
IA0KPiBhZGRpbmcgY29tbWl0dGVycywgd2hvIHdvdWxkIG5lZWQgdG8gdm90ZSBmb3Igb3IgYWdh
aW5zdCB0aGUgcHJvcG9zYWwuIFRoZSB0aXRsZSBwcm9iYWJseSBkb2VzIG5vdCBuZWVkIGFuIFJG
Qywgd2hpY2ggaXMgd2h5IG5vLW9uZSBsb29rZWQgYXQgaXQgc28gZmFyDQo+IA0KPiBJIHRoaW5r
IHRoaXMgaXMgYSBncmVhdCBpZGVhIGFuZCBJIHdvdWxkIHdhbnQgdG8gd2VsY29tZSBYQ1Atbmcg
aW50byB0aGUgcHJvamVjdDogd2l0aCB0aGlzIGluIG1pbmQsIEkgdm90ZSArMQ0KDQorMQ0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
