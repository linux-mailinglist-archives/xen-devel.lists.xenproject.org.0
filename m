Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E3757C2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 21:22:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqjGS-0008WK-Td; Thu, 25 Jul 2019 19:18:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HEBQ=VW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqjGQ-0008WF-Vn
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 19:18:55 +0000
X-Inumbo-ID: 09904e9c-af11-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.87]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09904e9c-af11-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8kDBSv+qc0HHbFnZFBlBY6JFzmiZ1T1aUCFm/pnOGY=;
 b=ixoeg1rkOgP9Zb9EDJeo2h1jw4ogWJHnGKyFWNQSA7JAuPf+TdQHZ7JLsaRRtT3eDJpYgZIqOEBLQaDAAOQ/Fsf0lRIvM5wo6/d2nWTBRQypxkPKx/i7jJEXno/frvPIn1+Qmuy8xpcXLpBr7tLkMcFUZPvro59jVkdJh9wGKcw=
Received: from AM6PR08CA0043.eurprd08.prod.outlook.com (2603:10a6:20b:c0::31)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Thu, 25 Jul
 2019 19:18:49 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by AM6PR08CA0043.outlook.office365.com
 (2603:10a6:20b:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.14 via Frontend
 Transport; Thu, 25 Jul 2019 19:18:49 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 25 Jul 2019 19:18:48 +0000
Received: ("Tessian outbound 578a71fe5eaa:v26");
 Thu, 25 Jul 2019 19:18:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0e90fbd8fad1ef9
X-CR-MTA-TID: 64aa7808
Received: from 593164a22aec.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D7A003C-13E9-46BB-8F25-72A5C67F1924.1; 
 Thu, 25 Jul 2019 19:18:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 593164a22aec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Jul 2019 19:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlCaa0/6pKNehVB3vGnGCbaxCTLTDXej9VsKZmlxxclfyUjTzsKnUmL8GyYNMVbSXWyEcMKUcpAPI0xmt2obqCjvjeGJ0UjZT1IrnpppxJMzSdCI6cGhYyIPjGrObRltelv99sU0dhVeUcR53t+tx6wvqNZ4AHXhYt5GTjboQ1XHb7HCTpDrDdiAW7CPhqK7teTD3Pp6lkePnNmm7gkNVU6eSelYhvOyHn2vdS0lQwJpfsG+wqLyU1Vs/qD9fc/Uvsbt/9rU3CpHunshxCEJFNdUJTiQnIOg4QSnCVG8EI+u+kDeH8H5IhLFfsblj2uC6wHWqlzpplNxqSNKVKUkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8kDBSv+qc0HHbFnZFBlBY6JFzmiZ1T1aUCFm/pnOGY=;
 b=mbGN1wyWWy0/kCN41cVsW24qIWbaMkBvCTmNDbHPEA/xrmQ4HIFhnVZf1z3TMSP2X8o2/ziSiV4jtBfVAXj+4nR0wYrVHlYDNmDTF9WEBYKNK/b0ZsxWepHFRz8tr3OCZz2OjfRPsl9FNpCXwZZEd2LaAifuFK481e5n7CZ3FQYOoXZjmW2ydnhvVjGv2YasSb3Q2E5vzLBvOUFTYaX09KSj9Zbcn3wSbJdOo4hOBYYScJMOVisFAdB/xhkkG8FWBfo6RDA/KGQQHEIMqMISdQ8Cs7Zgp5V3GfX+0viwznvF1xaBAvUPn8WR6ezt1+iJ+JIB2I2+6/A3VHV2ER7vPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8kDBSv+qc0HHbFnZFBlBY6JFzmiZ1T1aUCFm/pnOGY=;
 b=ixoeg1rkOgP9Zb9EDJeo2h1jw4ogWJHnGKyFWNQSA7JAuPf+TdQHZ7JLsaRRtT3eDJpYgZIqOEBLQaDAAOQ/Fsf0lRIvM5wo6/d2nWTBRQypxkPKx/i7jJEXno/frvPIn1+Qmuy8xpcXLpBr7tLkMcFUZPvro59jVkdJh9wGKcw=
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com (10.255.185.80) by
 DB8PR08MB5065.eurprd08.prod.outlook.com (10.255.18.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 19:18:30 +0000
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::716d:55cb:fc6c:dad]) by DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::716d:55cb:fc6c:dad%2]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 19:18:30 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Rich Persaud <persaur@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
Thread-Index: AQHVQvAWk6mPFUPSlEi/KMD71+V/xqbbsrWAgAAC44A=
Date: Thu, 25 Jul 2019 19:18:30 +0000
Message-ID: <34b57c54-21c1-76dc-2eeb-4f072bd5fc61@arm.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
 <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
In-Reply-To: <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To DB8PR08MB5499.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::16)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b057055-3568-4267-fc2b-08d71134ebbf
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB5065; 
X-MS-TrafficTypeDiagnostic: DB8PR08MB5065:|AM5PR0802MB2596:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25969B0FB921B58780810CBB80C10@AM5PR0802MB2596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0109D382B0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(199004)(189003)(31686004)(6436002)(71190400001)(44832011)(8936002)(14444005)(53936002)(6486002)(66066001)(486006)(6512007)(2616005)(2906002)(66946007)(110136005)(68736007)(6116002)(102836004)(25786009)(386003)(53546011)(76176011)(6506007)(478600001)(476003)(64756008)(81166006)(81156014)(446003)(66556008)(52116002)(8676002)(11346002)(305945005)(99286004)(186003)(26005)(5660300002)(6246003)(7736002)(4744005)(31696002)(66446008)(256004)(36756003)(3846002)(229853002)(14454004)(86362001)(66476007)(71200400001)(4326008)(54906003)(316002)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5065;
 H:DB8PR08MB5499.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 6Z4VQ9/7+zMfZaJe5J05VkmqHGbPvvcfO5qc5lP2RDAcOx6rNhKXkJZK8NgH7YzSDFUAfIFOZuN86rjp2nNaNvnP9Be3HQKmtNVfKq4zZYaRA6tDG+Qgewwuy+VUmoaIuomMZery8OW+r6l95HLbvF+US9TvoMC+7xAaGUzSySoou9tF6xA9s9CXEvhm8wwE21ZX2aKC/0JAqOowfQfQcm3ch4LYb2gtE8Ox58bqOd62Y1MSM4kHWVoQloSOyjsoBUZ3JfnyxKnD3XXPa2k3WUZxIxdxRLqi3HiTo3Pty2Fw4Ys2aop7L0JkwElwRFrlnJb1knPlVE/xpxWHZwMViULAs9XVPrJreQpX8ZS3jDRQ6HTkePg4hQmLD5YH7RwW6jGaDugpNBYMYg4X6LsQSAjDeDWPAeLdDIEosrG7m+c=
Content-ID: <431AAFE7EFCB4A4A8C3F2557FF1A1593@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5065
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(199004)(189003)(76130400001)(76176011)(4326008)(31696002)(305945005)(5660300002)(81166006)(50466002)(229853002)(86362001)(66066001)(446003)(25786009)(2616005)(26826003)(14454004)(7736002)(6116002)(6512007)(47776003)(11346002)(3846002)(316002)(478600001)(36756003)(70206006)(476003)(6486002)(63370400001)(70586007)(22756006)(436003)(4744005)(356004)(63350400001)(6246003)(6506007)(53546011)(36906005)(99286004)(336012)(107886003)(2906002)(102836004)(23676004)(8936002)(54906003)(110136005)(126002)(31686004)(8676002)(486006)(2486003)(186003)(386003)(81156014)(14444005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2596;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc6b6faa-c403-432a-bf00-08d71134e095
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2596; 
NoDisclaimer: True
X-Forefront-PRVS: 0109D382B0
X-Microsoft-Antispam-Message-Info: Qs+TwUTu5770kmM54BbeoZN4IKUmIV+Q0vQvun1aqDeWkN0IOs9u3jYsX+zck8yam5gg1Llwgb3xR9QwWTX1z5r92JeLYC/Nk0Onf4nezD3/tWh7OqyWuriHKWNQqHwhmTcQxRcbkyMbeRNDJ7AmPocMuGRz2Gq4f61CzGb3+MV3prXAuoi3nQsrBANxbCO4/Gnnij3Ge7bNN12ku6OKNjD/vJIlinnaLpEW+1ERg4A2nv2lffcbPENw0IbYEXunQp+Eu1All3pAWIagSguU0P4h4MFvWhpoclPKb+Cxvho9k74zPppdefukejman8+AcDL+vSNAmGMbNdxf/YJNElOu3ThwEH4ogI9VDKgceEnWJYSr/cZFCPw4kjIHdLQuoCIDDHpmoT+EV6VKHSnqOuwe8pjobeLqd/iYDr+fsQk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 19:18:48.6162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b057055-3568-4267-fc2b-08d71134ebbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUmljaCwNCg0KT24gMjUvMDcvMjAxOSAyMDowOCwgUmljaCBQZXJzYXVkIHdyb3RlOg0KPiBD
b3VsZCB5b3UgaW5jbHVkZSBMdWthc3ogcGF0Y2gsIGFsb25nIHdpdGggSnVsaWVuJ3MgcmVxdWVz
dGVkIGZvcm1hdHRpbmcgDQo+IGNoYW5nZXMsIGluIHlvdXIgdXBkYXRlIHRvIHRoZSBNQUlOVEFJ
TkVSUyBmaWxlPyDCoEFzIGEgbmV3IFhlbiANCj4gbWFpbnRhaW5lciBhbmQgY29udHJpYnV0b3Is
IEx1a2FzeiBtYXkgbm90IHlldCBiZSBmYW1pbGlhciB3aXRoIHRoZSANCj4gcHJvY2VkdXJlcyBh
bmQgcHJhY3RpY2VzIG9mIHRoZSBYZW4gY29tbXVuaXR5LiDCoFdlIGNhbiB3ZWxjb21lIGhpcyBu
ZXcgDQo+IG1haW50YWluZXJzaGlwIHJvbGUgd2l0aG91dCBkcm9wcGluZyBzdXBwb3J0IGZvciBh
IGZlYXR1cmUsIHRoYXQgKGEpIGhlIA0KPiBpcyBtYWludGFpbmluZywgKGIpIGlzIHVzZWQgYnkg
WGVuLg0KDQpJbiBnZW5lcmFsIG1haW50YWluZXJzIGFyZSBhd2FyZSBvZiB0aGUgY29tbXVuaXR5
IGFuZCB0aGUgcHJvY2Vzcy4gSWYgDQp0aGF0J3Mgbm90IHRoZSBjYXNlLCB0aGVuIEkgYW0gbm90
IHN1cmUgaXQgaXMgd2lzZSB0byBnaXZlIG1ha2UgaGltIHRoZSANCm9ubHkgbWFpbnRhaW5lciBv
ZiB0aGF0IHN1YnN5c3RlbS4NCg0KQSBtb3JlIHN1aXRhYmxlIHBvc2l0aW9uIHdvdWxkIGJlICJy
ZXZpZXdlciIgZm9yIHRoZSBuZXh0IGZldyBtb250aHMgDQp3aXRoIGEgcGxhbiB0byBtYWtlIGhp
bSB1bHRpbWF0ZWx5IG1haW50YWluZXIuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3JhbGwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
