Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42520BE742
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEr0-00027t-F1; Wed, 25 Sep 2019 21:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEqy-00027k-QD
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 21:29:40 +0000
X-Inumbo-ID: 9420edca-dfdb-11e9-963a-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.51]) by localhost (Halon) with ESMTPS
 id 9420edca-dfdb-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGJq75SSSv+PjC6y1Kj6JZ9KEMnAZTL0+GeCXzEyrjw=;
 b=Njtp3CQxEqlqnSLaFze8Zd1Zhczb6fKLqnRurHSf4KSv+IxwOeilaahkYcfnulYHp5epqGKsW5/ehLHxYj4+vngAGVIlGUnaY1Z1hF+HQ8Pp9IFaBE+g7+th4uwc+9XTiVuopD0q5BbCNG5U7lgKkNs/k3u75074JVnCIO0QuUM=
Received: from VI1PR08CA0095.eurprd08.prod.outlook.com (2603:10a6:800:d3::21)
 by VI1PR08MB5359.eurprd08.prod.outlook.com (2603:10a6:803:12e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Wed, 25 Sep
 2019 21:29:36 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0095.outlook.office365.com
 (2603:10a6:800:d3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.26 via Frontend
 Transport; Wed, 25 Sep 2019 21:29:36 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 21:29:34 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Wed, 25 Sep 2019 21:29:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65ef1b803285ee2d
X-CR-MTA-TID: 64aa7808
Received: from ac101b7421ba.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 875074D7-E1AD-4976-89E2-B2740C1928FB.1; 
 Wed, 25 Sep 2019 21:29:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac101b7421ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 21:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGd6EMxXj4lo4iVmJDNmiTe5/6ZuxjQvBDBA6MS34paIaLsquf6JYX08pHTMCgluLKYyYlRfrJ9hugelBDbe+RZBk/8K67422IdCi/9sG5d9X8hyUkb2yLv10Jt03EmBGwLbWoqZn+ecd5qfYlmTdMFmgnGcay3odBPCr+WcZYIR8//nPpv9MlVo5znMayGpWdCP0k7b87WyGTdWRNv0R+Y+JN1I/Qonp1FGGOBmSSA3ldPzi/Z3Pzh0J0S9cSZyqVybCRDkSoA1Ml0MSHTBEEqr0v+5HOmDJoG0Lol/kngxdlcXoZW1h0Fi/b7F+diE0BVY0fLdx8NbS6mcThmcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGJq75SSSv+PjC6y1Kj6JZ9KEMnAZTL0+GeCXzEyrjw=;
 b=jPhIxG8881kF6iNrWkE8L0PLOeSu1wBOoNNG9y9ffMw7cej24efez9Xp+Loh76rtMz3TPhNmxDTz6g/3+YbZ0L981mqrX/eauSHob95S+/b+44S9j8oSvZNVFEkLwgd/78geVPehvBqKnzgMMEeiuRzHNyTssLmwS7vBtS1fpt/9CR2tL8/Vkvi8/nmcJ58Ef3MHnvOwiIsrhidtxo8iHbW4JqKTQTeVbwn/L2zO47sAwMXZrCID6YvG6ztx2oZmLn+89h6saQf347bE6bhIIGnh/PfKKYXZrrSi4eb9ASyrh6YJshuN2c4aLP/AEnDh7fCmGkhW2+2bvwYeoMytfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGJq75SSSv+PjC6y1Kj6JZ9KEMnAZTL0+GeCXzEyrjw=;
 b=Njtp3CQxEqlqnSLaFze8Zd1Zhczb6fKLqnRurHSf4KSv+IxwOeilaahkYcfnulYHp5epqGKsW5/ehLHxYj4+vngAGVIlGUnaY1Z1hF+HQ8Pp9IFaBE+g7+th4uwc+9XTiVuopD0q5BbCNG5U7lgKkNs/k3u75074JVnCIO0QuUM=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2479.eurprd08.prod.outlook.com (10.175.20.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 21:29:27 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 21:29:27 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v4 3/8] xen/arm32: head: Remove 1:1 mapping as soon as it
 is not used
Thread-Index: AQHVbYOOnjrbATj/UkSOYuk5XmKLtKc85dwAgAAPtwA=
Date: Wed, 25 Sep 2019 21:29:27 +0000
Message-ID: <149af2b1-659a-5c4a-ed35-aea55cc2d9ae@arm.com>
References: <20190917181244.30027-1-julien.grall@arm.com>
 <20190917181244.30027-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1909251332520.22813@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1909251332520.22813@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0059.eurprd07.prod.outlook.com
 (2603:10a6:207:4::17) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 90819088-2e3c-455e-c93c-08d741ff75fa
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2479; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2479:|VI1PR08MB5359:
X-Microsoft-Antispam-PRVS: <VI1PR08MB535927F0FCA9C1CE131073D880870@VI1PR08MB5359.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(199004)(189003)(4326008)(3846002)(6116002)(76176011)(66476007)(26005)(102836004)(52116002)(386003)(6506007)(53546011)(5660300002)(86362001)(25786009)(186003)(2906002)(44832011)(446003)(99286004)(7736002)(305945005)(6916009)(66066001)(6486002)(54906003)(6436002)(229853002)(11346002)(2616005)(476003)(486006)(316002)(6512007)(66556008)(478600001)(8936002)(6246003)(81166006)(66946007)(64756008)(66446008)(256004)(81156014)(31696002)(36756003)(31686004)(8676002)(14454004)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2479;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 42FM8jC4FB+7222D1CB7cBJehTYmNLgEOvhzE5g+e+U8NHR1HStXUd6ihcVv5Bh0Hvy/RrvSoj1Qd5uFQwUm8FFeOkXGNpLjGVIg8yMhyTB7zn6Xh12tIUeNCLxeQkrSzcYhyoajT9MOV17VYnsBFuDojARv2J7AwGVwuweygvrgZ7Sli+V6vU6rvF4NLgoOL4558SZdZbYabO3RxLopaP2UbfGashAv5VlbhQuAsLTgjK47vy9YW7SfGAUvpWMmP7cucEVvy7Gb9qafAWK1o+3BGsaJ99FMKT78W43vfLPepfuJBP24QE4oazBHTOgoIbTiGCJFmwehznpYWoXkpWWnYofTUCJm7AkZ+jUyxqza9sMgarwtK3EwUI4HG0u8OHPRQ9ZiYC/+FmXEHGl1BWGvmK0vCxRiNe9Kcf2qO+E=
x-ms-exchange-transport-forked: True
Content-ID: <D5966BCCC2B95641A1590C93B386D42D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2479
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(199004)(189003)(6506007)(6246003)(3846002)(6116002)(76130400001)(70206006)(107886003)(6486002)(36906005)(316002)(6862004)(102836004)(22756006)(14454004)(446003)(2616005)(305945005)(26005)(47776003)(476003)(99286004)(186003)(6512007)(436003)(7736002)(25786009)(36756003)(2906002)(31686004)(8936002)(5660300002)(76176011)(126002)(229853002)(63350400001)(478600001)(4326008)(26826003)(54906003)(386003)(86362001)(8676002)(50466002)(81156014)(486006)(2486003)(356004)(11346002)(66066001)(53546011)(81166006)(23676004)(70586007)(336012)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5359;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 02476006-1685-475b-5830-08d741ff7155
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5359; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: TXjIh12Fcnt5ZAE3oxHFDnvQbU6ZqfJyDjh+vBBxc9gTrEVPY+LHr+Xr8EBei8Lb5RlA9MNzXJBhk5+Fa1DLhFyKCYFZyEOhNSx5+sY8MRaOzGtArJFNMEgvkPcdJ75wM2j4TpcAfprewTFHgguWiDPIpC1FOu7X+LNynb3J6jKlGYVuZFPEsuLbB43bJ4YgW+SGGRYKeqqfBHjEkgVsGFiB7jhsfp7Pez+plIaVAU+gSiqM1RgHkrZ0fAkXRVaTATZP0MvKkLnFXxut3kl7QjEbFFsUYwvVwq2Q+qtvtNGSIvuMdyK/xGREZHbW3NvQJb54/526gWCPtzwxv2GeDK/GfcmkWrJd3Bcnf6enTsPDO5l64+TsemDztDI5hewJCc0mFbDPPk5pHac4YWv+icc5KBvfzGJ+Z+JRYqX4aYs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 21:29:34.6679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90819088-2e3c-455e-c93c-08d741ff75fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5359
Subject: Re: [Xen-devel] [PATCH v4 3/8] xen/arm32: head: Remove 1:1 mapping
 as soon as it is not used
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI1LzA5LzIwMTkgMjE6MzMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCAxNyBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gVGhlIDE6MSBtYXBw
aW5nIG1heSBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9mIHRoZSBYZW4gdmlydHVhbCBtZW1vcnkN
Cj4+IGxheW91dC4gQXQgdGhlIG1vbWVudCwgWGVuIGlzIGhhbmRsaW5nIHRoZSBjbGFzaCBieSBv
bmx5IGNyZWF0aW5nIGENCj4+IG1hcHBpbmcgdG8gdGhlIHJ1bnRpbWUgdmlydHVhbCBhZGRyZXNz
IGJlZm9yZSBlbmFibGluZyB0aGUgTU1VLg0KPj4NCj4+IFRoZSByZXN0IG9mIHRoZSBtYXBwaW5n
cyAoc3VjaCBhcyB0aGUgZml4bWFwKSB3aWxsIGJlIG1hcHBlZCBhZnRlciB0aGUNCj4+IE1NVSBp
cyBlbmFibGVkLiBIb3dldmVyLCB0aGUgY29kZSBkb2luZyB0aGUgbWFwcGluZyBpcyBub3Qgc2Fm
ZSBhcyBpdA0KPj4gcmVwbGFjZSBtYXBwaW5nIHdpdGhvdXQgdXNpbmcgdGhlIEJyZWFrLUJlZm9y
ZS1NYWtlIHNlcXVlbmNlLg0KPj4NCj4+IEFzIHRoZSAxOjEgbWFwcGluZyBjYW4gYmUgYW55d2hl
cmUgaW4gdGhlIG1lbW9yeSwgaXQgaXMgZWFzaWVyIHRvIHJlbW92ZQ0KPj4gYWxsIHRoZSBlbnRy
aWVzIGFkZGVkIGFzIHNvb24gYXMgdGhlIDE6MSBtYXBwaW5nIGlzIG5vdCB1c2VkIHJhdGhlciB0
aGFuDQo+PiBhZGRpbmcgdGhlIEJyZWFrLUJlZm9yZS1NYWtlIHNlcXVlbmNlIGV2ZXJ5d2hlcmUu
DQo+Pg0KPj4gSXQgaXMgZGlmZmljdWx0IHRvIHRyYWNrIHdoZXJlIGV4YWN0bHkgdGhlIDE6MSBt
YXBwaW5nIHdhcyBjcmVhdGVkDQo+PiB3aXRob3V0IGEgZnVsbCByZXdvcmsgb2YgY3JlYXRlX3Bh
Z2VfdGFibGVzKCkuIEluc3RlYWQsIGludHJvZHVjZSBhIG5ldw0KPj4gZnVuY3Rpb24gcmVtb3Zl
X2lkZW50aXR5X21hcHBpbmcoKSB3aWxsIGxvb2sgd2hlcmUgaXMgdGhlIHRvcC1sZXZlbCBlbnRy
eQ0KPj4gZm9yIHRoZSAxOjEgbWFwcGluZyBhbmQgcmVtb3ZlIGl0Lg0KPj4NCj4+IFRoZSBuZXcg
ZnVuY3Rpb24gaXMgb25seSBjYWxsZWQgZm9yIHRoZSBib290IENQVS4gU2Vjb25kYXJ5IENQVXMg
d2lsbA0KPj4gc3dpdGNoIGRpcmVjdGx5IHRvIHRoZSBydW50aW1lIHBhZ2UtdGFibGVzIHNvIHRo
ZXJlIGFyZSBubyBuZWVkIHRvDQo+PiByZW1vdmUgdGhlIDE6MSBtYXBwaW5nLiBOb3RlIHRoYXQg
dGhpcyBzdGlsbCBkb2Vzbid0IG1ha2UgdGhlIFNlY29uZGFyeQ0KPj4gQ1BVcyBwYXRoIHNhZmUg
YnV0IGl0IGlzIG5vdCBtYWtpbmcgaXQgd29yc3QuDQo+Pg0KPj4gTm90ZSB0aGF0IHRoZSBUTEIg
Zmx1c2ggc2VxdWVuY2UgaXMgc2FtZSBzZXF1ZW5jZSBhcyBkZXNjcmliZWQgaW4NCj4+IGFzbS1h
cm0vYXJtMzIvZmx1c2h0bGIuaCB3aXRoIGEgdHdpc3QuIFBlciBHNS01NTMyIEFSTSBEREkgMDQ4
N0QuYSwNCj4+IGEgZHNiIG5zaCBpcyBzdWZmaWNpZW50IGZvciBsb2NhbCBmbHVzaGVkLiBOb3Rl
IHRoZSBzZWN0aW9uIGlzIGZyb20gdGhlDQo+PiBBQXJjaDMyIEFybXY4IHNwZWMsIEkgd2Fzbid0
IGFibGUgdG8gZmluZCB0aGUgc2FtZSBleGFjdCBzZWN0aW9uIGluIHRoZQ0KPj4gQXJtdjcgc3Bl
YyBidXQgdGhpcyBpcyBkb3R0ZWQgYXMgbG9jYWwgb3BlcmF0aW9ucyBvbmx5IGFwcGxpZXMgdG8N
Cj4+IG5vbi1zaGFyZWFibGUgZG9tYWluLiBUaGlzIHdhcyBtaXNzZWQgd2hpbGUgcmV3b3JraW5n
IHRoZSBoZWFkZXIgYW5kDQo+PiB0aGVyZWZvcmUgYSBtb3JlIGNvbnNlcnZhdGl2ZSB3YXkgd2Vy
ZSBhZG9wdGVkLg0KDQpJIGd1ZXNzIHRoZSBOSVQgbWVudGlvbiBpbiBwYXRjaCAjMSBzaG91bGQg
YWxzbyBiZSBmaXhlZCBoZXJlLg0KDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dy4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
