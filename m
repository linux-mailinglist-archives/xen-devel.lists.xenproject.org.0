Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5BCAF39
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 21:28:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG6hT-0006PQ-44; Thu, 03 Oct 2019 19:23:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iG6hR-0006PL-KZ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 19:23:41 +0000
X-Inumbo-ID: 4b661978-e613-11e9-9736-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b661978-e613-11e9-9736-12813bfff9fa;
 Thu, 03 Oct 2019 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhZO9p+VYz0ReNwdbmjFpJhEh/JrH8/0edcnqbliN4k=;
 b=XQ0fYWSnOBJUbJPawsn+ZHQUfi4pGHEZbXzcryCrdALGQr/TQaD/Q21Uvkgu80n/b4+sD+MzOl/Ide3NC99oKjRrDnMtXweQTstxvJNsdO7MjwkK6eRmp7ZKSd717ULKwjcosWK4/m76232x8mYqXaP0DYSA5SpKNK2nDGD7/ZY=
Received: from VI1PR08CA0153.eurprd08.prod.outlook.com (2603:10a6:800:d5::31)
 by VI1PR08MB5533.eurprd08.prod.outlook.com (2603:10a6:803:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 19:23:32 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0153.outlook.office365.com
 (2603:10a6:800:d5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Thu, 3 Oct 2019 19:23:32 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 3 Oct 2019 19:23:30 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Thu, 03 Oct 2019 19:23:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a0f4c3bc1ab3a07
X-CR-MTA-TID: 64aa7808
Received: from 670f55577a5f.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB75048F-2457-47DA-B192-51902060AE3A.1; 
 Thu, 03 Oct 2019 19:23:25 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 670f55577a5f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 03 Oct 2019 19:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+uELdJWKjJKngqwonVCpymoj18NlbGPlJuNtysGfAetOzmODUb17UUo+5eUIatlmZDYGMq7ninDph+cUCNj4EwhBrTvs8mTUMVsUGnZ14X3wLyHUYzDEtKI0cF/sDUDC6L/IZHfMUjpwDuB0g6aZmxqFgIs0Fgey6XpQyk05V7v7X9DAymHhil5IExe0F5/H+79VXO+TQxI9JDTw/WVNGlfrBWceuftjyozy+1TKJAndSU6Kr2njFeSFA4Q9XDCoLAdNbVgtsACYbKhpR5h4agxQlMr9wouDq3GgxPmAYIQsvXlndARGBb6FRIeIfPwmGOGGGs9hCdfs8araUXRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhZO9p+VYz0ReNwdbmjFpJhEh/JrH8/0edcnqbliN4k=;
 b=m2JLJeVxNX1roDRJu4SWuAkvl2Vpv7foKfnEpgxgaPGx/xXTSINhox3yaV856ZJMzZ+v7IuKm88kH9DBE7pz+UXhXAvNG4gtYqh1ie9WpkYD1GEKsYyK4qNnMeYT+EH8sXzL3kK8pBFEy6nIMjjN7J5V9NiAV9eoMkDz/jXvSIpJBY+K7U8qG58BiRNiSUgM+Bw+7M8R+0CBSZs0q5nQyG9FpNboNAiZSDKuIML3eIwiUD8KJ1pOEvROY1gnI/Nbi1ZUbCWTpeutQTKMWSqdu3tT0cy8uUCb4b7G8MNH9Mo/S7bxkREphtsOnakWGuLsCTUEdw8k6KKROVDJJ7RG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhZO9p+VYz0ReNwdbmjFpJhEh/JrH8/0edcnqbliN4k=;
 b=XQ0fYWSnOBJUbJPawsn+ZHQUfi4pGHEZbXzcryCrdALGQr/TQaD/Q21Uvkgu80n/b4+sD+MzOl/Ide3NC99oKjRrDnMtXweQTstxvJNsdO7MjwkK6eRmp7ZKSd717ULKwjcosWK4/m76232x8mYqXaP0DYSA5SpKNK2nDGD7/ZY=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4664.eurprd08.prod.outlook.com (10.255.78.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 3 Oct 2019 19:23:23 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 19:23:23 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Brian Woods <brian.woods@xilinx.com>
Thread-Topic: [Xen-devel] Errors with Loading Xen at a Certain Address
Thread-Index: AQHVeLj3el+wWu67506idNHh/rHuH6dHotsAgAAAJACAABGzgIAAImsAgAAGhoCAACDTAIABO0mAgAAB94CAABLhgA==
Date: Thu, 3 Oct 2019 19:23:23 +0000
Message-ID: <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com> <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
In-Reply-To: <20191003181547.GA13953@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 29fd02c6-43ce-4721-f13b-08d748372ce3
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4664:|VI1PR08MB5533:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5533BA9EA0AFFF45D09CBA04809F0@VI1PR08MB5533.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01792087B6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(189003)(199004)(6246003)(86362001)(486006)(6436002)(6486002)(44832011)(31686004)(4326008)(76176011)(186003)(54906003)(4744005)(2616005)(66946007)(66556008)(66476007)(11346002)(446003)(229853002)(476003)(66446008)(64756008)(31696002)(36756003)(316002)(25786009)(6512007)(26005)(102836004)(5660300002)(2906002)(71190400001)(8676002)(52116002)(81156014)(53546011)(6506007)(81166006)(386003)(8936002)(256004)(99286004)(14454004)(7736002)(305945005)(3846002)(6916009)(6116002)(478600001)(66066001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4664;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mfGqSrFz6Zt8oonQEyQ8W5Qujaj2UMzDQx9QfxFP3aH3L4WMGRoN7kMjqt2V5si8tbKmzFE7h3PwCz9WO1inepSSFVAgIR98R83Hj/94nJ9QYWxLR3CLfnPNF48ILLTm3X+s/DYU/CP/0EWITyZ5SonC0GddT8vQsgw6WLx6VeCQLiNPEbBXIAWPj4IQwIzx9il/UkTSSSQTiOdsOSD9DhI+w1rfuGhkfyEOIlxXafAoml55vfMPmLZXuFcAFJJUP9v2ztsggH30/YPwoO/HhPiUT12H/YWjwoK3T9ks7s9oEki+YIMYy7eCwLkDFih8Da9BqSEkNruLR3se0eXLAGheSvkOUUI6SiNIj0ARpzFcxAPMB3fwgcJqWTsta2aZ/PiaTgV6YLiGA5A+bgkBKwOOeKDuxbISYe8PFX+5TBM=
x-ms-exchange-transport-forked: True
Content-ID: <8DDA8E94C7D6BE41AEA642ECF54F4B63@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4664
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(199004)(189003)(70586007)(31696002)(25786009)(31686004)(6512007)(186003)(81156014)(305945005)(6486002)(36756003)(6116002)(356004)(70206006)(7736002)(3846002)(8676002)(336012)(107886003)(6862004)(26826003)(478600001)(81166006)(47776003)(66066001)(14454004)(6246003)(4744005)(50466002)(4326008)(316002)(386003)(76176011)(6506007)(76130400001)(53546011)(26005)(86362001)(54906003)(126002)(22756006)(5660300002)(476003)(2616005)(11346002)(446003)(8936002)(436003)(63350400001)(23676004)(102836004)(486006)(2906002)(2486003)(99286004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5533;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: db249fc0-c0ba-48ca-4665-08d748372865
NoDisclaimer: True
X-Forefront-PRVS: 01792087B6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1JR0rhCU0SpKXOYWgA9ZyxnZEUGpbUjIHZWdKEQy9xNkbPD2whpIW/nXb+9QU1lcQh/OA0zI17p2ZdV/n6Pbg4C5wieFba0B/ADub5+x8Q1hfHf0ONFOiOrVvHIkK5rC5wtxb7c96YqzhtwwJkjIYRCjCUkhphmW53K3mOEwYHknbs9zGIXOYtE3rdYDipEJt61HLB13xY+xOPkqmyAp33thSQE6Kwtaem0e1dB/igfspzLi5FFV5s2byHD53KBDu8z41NUVMQ6rw3Y1F2ip41ooUZ3Qj4eOMb9VVg7HkzGf85pbXgJEXRfqlAEQ9VgTtdEXH3EMdhbOqMp/2DAS/vouhaM9ovu7SDxjqDxhID5jl/ITqIlTfeFQFMIRAXJE+z592KF8Yd/f/1BxmFTAcVzkwi9vKmj+ohJxYgR6IM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 19:23:30.9191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fd02c6-43ce-4721-f13b-08d748372ce3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5533
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDAzLzEwLzIwMTkgMTk6MTUsIEJyaWFuIFdvb2RzIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAwMywgMjAxOSBhdCAwNjowODo0NVBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IChYRU4pIEJXX0RFQlVHOiAuNiBjb3VudF9pbmZvPTB4MDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVO
KSBEb21haW4gaGVhcCBpbml0aWFsaXNlZA0KPiAoWEVOKSBCV19ERUJVRzogMDEgY291bnRfaW5m
bz0weDAxODAwMDAwMDAwMDAwMDANCj4gDQo+IFRob3NlIGRlYnVnIG1lc3NhZ2VzIHNhbmR3aWNo
IGVuZF9ib290X2FsbG9jYXRvcigpIGluIHN0YXJ0X3hlbigpLg0KDQpobW1tLCBsb29raW5nIGJh
Y2sgYXQgdGhlIHRocmVhZCwgdGhlIFdBUk5fT04oKSBJIHN1Z2dlc3RlZCBpcyBhY3R1YWxseSAN
CmluY29ycmVjdC4gOi8gU29ycnkgZm9yIHRoYXQuIEl0IHNob3VsZCBiZToNCg0KV0FSTl9PTiht
Zm5feChwYWdlX3RvX21mbihwZyArIGkpKSA9PSAweDAxNTMzKTsNCg0KTm90ZSB0aGUgImkiIGlu
c3RlYWQgb2YgIjEiLg0KDQpJZiB0aGUgV0FSTl9PTigpIGlzIHRyaWdnZXJlZCBiZXR3ZWVuIHRo
ZSB0d28gY2FsbHMsIHRoZW4gaXQgd291bGQgbWVhbiANCndlIGFyZSBnaXZpbmcgcGFnZSB0byB0
aGUgYm9vdCBhbGxvY2F0b3IuDQoNClRoaXMgd291bGQgaW1wbHkgdGhhdCBuZXh0X21vZHVsZXMo
KSBvciBkdF91bnJlc2VydmVkX3JlZ2lvbnMoKSBpcyBub3QgDQp3b3JraW5nIGFzIGV4cGVjdGVk
IChpLmUuIGNhcnZpbmcgb3V0IGFueSBtb2R1bGVzKS4NCg0KQWxzbywgY291bGQgeW91IHNlbmQg
eW91ciBsb2cgd2l0aCBlYXJseSBwcmludGsgZW5hYmxlZD8NCg0KQ2hlZXJzLA0KDQotLSANCkp1
bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
