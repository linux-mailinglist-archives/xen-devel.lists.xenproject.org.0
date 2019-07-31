Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A87C3EF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsouG-0005jx-C4; Wed, 31 Jul 2019 13:44:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UN8Z=V4=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1hsouE-0005jR-L3
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:44:38 +0000
X-Inumbo-ID: 5485a4b8-b399-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5485a4b8-b399-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:44:37 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 13:44:31 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 13:32:33 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 13:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBYnbNiqogGt2GU8KGdNu5nRnal27LXu1Khbup217efgRqFMyrZ3VIx1IQuGgdc6cP0nHBIXGcHBMq+D9vQm3+7m1d5tvRf8qnYwL2cjlpGus1bDX9p1w3NXKGSz0DwhL1TQv8pqxxF0NLrFmIJmtRm43DHLrrdVo3Tp4BqQl+oT44ScTLSIvroSF2IB5FMHUdHFyBH8g9gyLYT10e543HFnpRgogryn1PDTLzz3pchMqIA3G1GbbOdmztjDW7v2lqD3hD9MPWTiNmHoGwAvVJyG7o1l+xvECKpMH/e1+I2XR3kg4y1+M2w7Q/VfYETLnWjMbWyTjsYB3sQQe67B9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/xSTADiD07/l/fosXubD9Scd+qOTl7yjuMAGXPREaU=;
 b=GBNQ9j00vZ22dK3j7Bv+JRguPbexlsIx/qO9FJrB0t6wUijhxUo0qW7e5EjIvnE4gnZYq63+B/RHSMvbXxdh42Trw2kRZnEivXaofmjNXqEWO3nzBMafbJAfRwRa+Q+0emYjX9095C294tFAl4kYK9zr3fQwcVS/Q49PAvHoBsSGOZR5FfBVSxPQMxDqHI4a9xbtiaG/zAwwdvVc6+aqsw4j7fK+MRHwMmYrGcYpNQmbfIxPhgkTe+Afvg6bbtcgWVFhxhqdUTr4c56Hwsso84Abaq3Aj7o1yd7ejLqxAnxCT0vvkN8M7AXx5WNvxpVyWNJ6NrKpaT0hbDkJF6f4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 13:32:32 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:32:32 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Speculative mitigation facilities report wrong status V4
Thread-Index: AQHVR6RnpQWKZDonvE6LwiC0SdZMpQ==
Date: Wed, 31 Jul 2019 13:32:32 +0000
Message-ID: <20190731133214.22790-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ef7e1a1-4772-4848-f7a2-08d715bb8a52
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3266; 
x-ms-traffictypediagnostic: BY5PR18MB3266:
x-microsoft-antispam-prvs: <BY5PR18MB3266DA543A5DC4328EC8FCCABEDF0@BY5PR18MB3266.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:214;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(2906002)(6512007)(14454004)(4326008)(476003)(2616005)(3846002)(6116002)(25786009)(86362001)(66446008)(66476007)(64756008)(107886003)(68736007)(66556008)(386003)(36756003)(478600001)(486006)(2501003)(66946007)(6506007)(50226002)(316002)(1076003)(6436002)(5640700003)(6486002)(26005)(66066001)(54906003)(99286004)(305945005)(8936002)(5660300002)(256004)(81166006)(7736002)(6916009)(71200400001)(71190400001)(186003)(8676002)(2351001)(53936002)(52116002)(102836004)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3266;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IE37Y86bHQGMZNhatgis9UELfT0P1IXDUVDh/Q+OjVVji1GQUAG2/gV1/24K4gkaBVfwbi4jQITb2SsV6vQ5xQmdoJWwgul5lJ6lO3G6R8BFx3FYlb6CuedGvbwUmkr6YW1KJdHSABK0VezR8xfmttirnoStQWwRC3GFiDBZXp9rgZP0e2aaS9E00q4aIAMy+UtP85L0dtyK7XnEkxAaSIOYz2LfqyqLTrstmrwP+esTGQv7ZtN98Y1Yrxg+oXIRs1gBc0s3ISYiGVsi4X8KrpxttR54Fcp8qRlcZ7hNm3oGInsbSAzIAs7kzt0PQQsjVjMV3em6716t93Fsnt5zZm8X4sz7OgjhUMO4p+CJ0oB/VMTPCI1QfD7AhDCBE3MenQ4igdteeGK+55NcENOKKl1Gcbj8QpDlTJiynnDQrZE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef7e1a1-4772-4848-f7a2-08d715bb8a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:32:32.2254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3266
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] Speculative mitigation facilities report wrong
 status V4
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Jin Nan Wang <jnwang@suse.com>, "wl@xen.org" <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm9vdGluZyB3aXRoIHNwZWMtY3RybD0wIHJlc3VsdHMgaW4gWGVuIHByaW50aW5nICJOb25lIE1E
X0NMRUFSIi4KCihYRU4pICAgU3VwcG9ydCBmb3IgSFZNIFZNczogTm9uZSBNRF9DTEVBUgooWEVO
KSAgIFN1cHBvcnQgZm9yIFBWIFZNczogTm9uZSBNRF9DTEVBUgoKQWRkIGEgY2hlY2sgYWJvdXQg
WDg2X0ZFQVRVUkVfTURfQ0xFQVIgdG8gYXZvaWQgdG8gcHJpbnQgIk5vbmUiLgoKU2lnbmVkLW9m
Zi1ieTogSmFtZXMgV2FuZyA8am53YW5nQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9zcGVj
X2N0cmwuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMK
aW5kZXggY2FkYTlhMDU4ZS4uNDY4YTg0NzU5OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Nw
ZWNfY3RybC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYwpAQCAtMzY2LDYgKzM2Niw3
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9kZXRhaWxzKGVudW0gaW5kX3RodW5rIHRodW5r
LCB1aW50NjRfdCBjYXBzKQogICAgIHByaW50aygiICBTdXBwb3J0IGZvciBIVk0gVk1zOiVzJXMl
cyVzJXNcbiIsCiAgICAgICAgICAgIChib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfTVNSX0hW
TSkgfHwKICAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19SU0JfSFZNKSB8
fAorICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX01EX0NMRUFSKSAgIHx8CiAg
ICAgICAgICAgICBvcHRfZWFnZXJfZnB1KSAgICAgICAgICAgICAgICAgICAgICAgICAgID8gIiIg
ICAgICAgICAgICAgICA6ICIgTm9uZSIsCiAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVB
VFVSRV9TQ19NU1JfSFZNKSAgICAgID8gIiBNU1JfU1BFQ19DVFJMIiA6ICIiLAogICAgICAgICAg
ICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSkgICAgICA/ICIgUlNCIiAgICAg
ICAgICAgOiAiIiwKQEAgLTM3Nyw2ICszNzgsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRf
ZGV0YWlscyhlbnVtIGluZF90aHVuayB0aHVuaywgdWludDY0X3QgY2FwcykKICAgICBwcmludGso
IiAgU3VwcG9ydCBmb3IgUFYgVk1zOiVzJXMlcyVzJXNcbiIsCiAgICAgICAgICAgIChib290X2Nw
dV9oYXMoWDg2X0ZFQVRVUkVfU0NfTVNSX1BWKSB8fAogICAgICAgICAgICAgYm9vdF9jcHVfaGFz
KFg4Nl9GRUFUVVJFX1NDX1JTQl9QVikgfHwKKyAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZf
RkVBVFVSRV9NRF9DTEVBUikgIHx8CiAgICAgICAgICAgICBvcHRfZWFnZXJfZnB1KSAgICAgICAg
ICAgICAgICAgICAgICAgICAgID8gIiIgICAgICAgICAgICAgICA6ICIgTm9uZSIsCiAgICAgICAg
ICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfUFYpICAgICAgID8gIiBNU1JfU1BF
Q19DVFJMIiA6ICIiLAogICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfUlNC
X1BWKSAgICAgICA/ICIgUlNCIiAgICAgICAgICAgOiAiIiwKLS0gCjIuMjIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
