Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE0BE729
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEpZ-00022e-1S; Wed, 25 Sep 2019 21:28:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEpX-00022Y-8y
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 21:28:11 +0000
X-Inumbo-ID: 5ec4cf20-dfdb-11e9-963a-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.59]) by localhost (Halon) with ESMTPS
 id 5ec4cf20-dfdb-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aXk93I/ZHNb2RGr63x6xUaqohs2l5hUwKg1pJ3Wtls=;
 b=vbxVU/MaEBm5UJ61RxkjLbN7wkFrf8foSaxSPB+2hzocTNp0uRZ4cv0MeAK2HDiRfYki9RS4TFsN/TSn2d/oc80rpFok57n0cJB7/NUdYsK5RQp5Xan8+z+RUoSfIi8hdC28eqvBa1rDS0N3eJYP0XH5vBvKvYK4WzJ5zvWxOa8=
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by VI1PR08MB4015.eurprd08.prod.outlook.com (2603:10a6:803:e1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Wed, 25 Sep
 2019 21:28:05 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.23 via Frontend
 Transport; Wed, 25 Sep 2019 21:28:05 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 21:28:03 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 25 Sep 2019 21:28:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 317639400221af3e
X-CR-MTA-TID: 64aa7808
Received: from e0a0eaa93161.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AAAE9D5-353C-483A-824A-6B5E091855F3.1; 
 Wed, 25 Sep 2019 21:27:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0a0eaa93161.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 21:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KutX0iWcz+J1iJd2oL9pwFQkrTTRpahfF1rzNyuSNUFyMhg6iZALcrPwZUh6XK6SdYIQlRaZdBNcm9EdcovRV5tK/VZB/MYuN6oQfHbh+pBIZWEZM+LEfIzwaEhkBInXi9XsB2f3+T/PLPoo9HYFN6SSuYRo/vdtSk8PiWtF/3P6HAepKsPmWXKpfJ86tZnWD6bsJwpKPFvo9lHFn6T+aeJvvqJtO1+Trln6qLviJc0LR1OqMfKTDDwuyoajsKI6g9Sn771mX8Kzp+5U4fspXr2zBHNgmZUrgc3cXEDL/K/XRzEimAq8fEPOrA8TKEOlE5dJG364viN4U26sKzlhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aXk93I/ZHNb2RGr63x6xUaqohs2l5hUwKg1pJ3Wtls=;
 b=Yzmmf5o5wqhe04mObJn/sDUnkHHmhhl4SYLL93evydgoMY0ldxhAo4U0Y81w/vmpR0q8H5HbQ30kmyavgiern2WBUa+CvB69L/2f+eNp+t2+yYDZ3ObJ0LbXzdm8TZjtH8bGl2p3kpJ5wK6eDz5eyvIcfrvfDtoV83FNTcnFZb4DMEWtVaSpjg+CnakYeVxpLAA6Gu8PV6IluO5BuNl5nTwVDE+mMEx84CAOrT8rHSEdjtzsUZJp34ND+XingJ+pHNKySYA5zhVBM4epwfiN/Tnha47dvkMCuO9OmX0J0qQgi8JwMoYigGJ8FzwFbHuod5qtCxoD/0HFqp+z3tRF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aXk93I/ZHNb2RGr63x6xUaqohs2l5hUwKg1pJ3Wtls=;
 b=vbxVU/MaEBm5UJ61RxkjLbN7wkFrf8foSaxSPB+2hzocTNp0uRZ4cv0MeAK2HDiRfYki9RS4TFsN/TSn2d/oc80rpFok57n0cJB7/NUdYsK5RQp5Xan8+z+RUoSfIi8hdC28eqvBa1rDS0N3eJYP0XH5vBvKvYK4WzJ5zvWxOa8=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2479.eurprd08.prod.outlook.com (10.175.20.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 21:27:54 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 21:27:54 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 8/8] xen/arm: add dom0-less device assignment info to
 docs
Thread-Index: AQHVc9H7ak89SXeuSUyB7F4IAALr9qc86IeA
Date: Wed, 25 Sep 2019 21:27:54 +0000
Message-ID: <0b0bc9ea-38ca-b264-1288-3c217f786569@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-8-sstabellini@kernel.org>
In-Reply-To: <20190925184924.21691-8-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0109.eurprd05.prod.outlook.com
 (2603:10a6:207:2::11) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a2375ce0-b42b-4512-f63a-08d741ff3fe8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2479; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2479:|VI1PR0802MB2479:|VI1PR08MB4015:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4015105AA1FEEA2F8849EDEA80870@VI1PR08MB4015.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(486006)(476003)(2616005)(11346002)(316002)(229853002)(66556008)(6512007)(6436002)(66066001)(54906003)(6486002)(256004)(71200400001)(14454004)(31686004)(36756003)(8676002)(71190400001)(81166006)(8936002)(478600001)(6246003)(31696002)(81156014)(66946007)(66446008)(64756008)(5660300002)(4744005)(86362001)(76176011)(66476007)(4326008)(6116002)(3846002)(53546011)(52116002)(102836004)(26005)(386003)(6506007)(7736002)(99286004)(446003)(305945005)(6916009)(2906002)(25786009)(186003)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2479;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: UXi1E0vs/Iju2fTEe8oc7EaBqz5EIkzDnPP3OUyCyJSWEsH8yJyEgGf0YNroD8ohwyoznYbxoLg0jmpx1HU0py+tpUWW9o8bfSBVouDdpuoBeTehfJ9lInpSrFLI/2iPxWP1HIRwkpnUIKXTqek2M6sGdhs1w0wnSqHRMjGYnes6RVXW8auq4uasNXC0n7fDyY9vhd1T8DKh4RXca0F/bG9GB0kj5bSjrp5tmraDILcKKQ6GNIa1mrFzXs15acu6m116T9zYXjueGedqNG5zmAEjEEe9chbTZt3lIvfg4nUJOtKGZxmZj1LOS0tUsw5y9fnGBxmH5QHsDokwVZU0MY16q2uZ03e8a3JzvrM4U9Mlz5epNzHpEi24VV9nX5iO7YGWP7FvPiWVWEI3D61gRt4MXcsWyXax+ekJf98valU=
Content-ID: <D6EC15B9D2C51D438446FF8E02C9F28B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2479
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(478600001)(5660300002)(6246003)(2616005)(3846002)(6116002)(6512007)(486006)(99286004)(23676004)(2486003)(76176011)(31686004)(36906005)(54906003)(4744005)(386003)(6506007)(47776003)(26005)(126002)(476003)(14454004)(36756003)(102836004)(316002)(53546011)(81156014)(7736002)(356004)(31696002)(25786009)(305945005)(22756006)(6486002)(76130400001)(86362001)(26826003)(66066001)(63350400001)(8676002)(436003)(446003)(8936002)(336012)(81166006)(6862004)(50466002)(11346002)(229853002)(186003)(4326008)(107886003)(70586007)(2906002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4015;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e32b5ba0-085e-421d-f157-08d741ff39fb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB4015; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: /csdfJOlAQ7ALHd6vU2TenZmJbbNk6ybDczsq0tWMLzkTF8qZe8vzenBAEBJ+TNYxNKtNEhxL/kqOM1+CcjLzOzdbFbuTf08+ZNnK1g+HLybuOAWSK+AQj8rUqipcmKtQUdlncbNIOnb0kltuJ0zwI2LESB2D6cG6QY94/wBWRKYNEBCiNwm8SWhPf0a4pqq/Da9/etarWyIV2yuzCQlneOIkCATHxjcLj83xWNVQTeEt65qVfT4xKxaeYPwe5QFPfX4h09thnBzUc4koUTGLeLfTFgYBwdJ/veTBbxWTwilwsQcHKrGUxEV2fYLQdD9eOexznks1k3VjymxB52WvuSJgAdWkRhyClCSO60hqRH5HXqlCdb68vbrV7K/w+CqtoTy9cjmb5cvAP3D8ILkr1AWiObGnyniFLuXt/2brlU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 21:28:03.9884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2375ce0-b42b-4512-f63a-08d741ff3fe8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4015
Subject: Re: [Xen-devel] [PATCH v5 8/8] xen/arm: add dom0-less device
 assignment info to docs
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI1LzA5LzIwMTkgMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
Ky0gbnJfc3Bpcw0KPiArDQo+ICsgICAgT3B0aW9uYWwuIEEgMzItYml0IGludGVnZXIgc3BlY2lm
eWluZyB0aGUgbnVtYmVyIG9mIFNQSXMgKFNoYXJlZA0KPiArICAgIFBlcmlwaGVyYWwgSW50ZXJy
dXB0cykgdG8gYWxsb2NhdGUgZm9yIHRoZSBkb21haW4uIElmIG5yX3NwaXMgaXMNCj4gKyAgICBt
aXNzaW5nLCB0aGUgbWF4IG51bWJlciBvZiBTUElzIHN1cHBvcnRlZCBieSB0aGUgcGh5c2ljYWwg
R0lDIGlzDQo+ICsgICAgdXNlZC4NCg0KVGhpcyBpcyBub3QgY29ycmVjdCBhbnltb3JlIHdoZW4g
dnBsMDExIGlzIHNldC4NCg0KV2l0aCB0aGF0IGZpeGVkOg0KDQpBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbS4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFs
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
