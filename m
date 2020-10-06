Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EE2847DC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3110.9028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPhkt-0001gB-Bv; Tue, 06 Oct 2020 07:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3110.9028; Tue, 06 Oct 2020 07:51:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPhkt-0001fp-8m; Tue, 06 Oct 2020 07:51:27 +0000
Received: by outflank-mailman (input) for mailman id 3110;
 Tue, 06 Oct 2020 07:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivvU=DN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPhks-0001fk-Gq
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 07:51:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfa7642e-dd19-4af0-a719-106a30ccce3a;
 Tue, 06 Oct 2020 07:51:24 +0000 (UTC)
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by AM8PR08MB5843.eurprd08.prod.outlook.com (2603:10a6:20b:1df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Tue, 6 Oct
 2020 07:51:22 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::96) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Tue, 6 Oct 2020 07:51:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 07:51:22 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 06 Oct 2020 07:51:22 +0000
Received: from eafbe70e3b2e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B35871F4-9849-4D0C-840C-2CF49E55B907.1; 
 Tue, 06 Oct 2020 07:51:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eafbe70e3b2e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Oct 2020 07:51:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 6 Oct
 2020 07:51:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 07:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ivvU=DN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPhks-0001fk-Gq
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 07:51:26 +0000
X-Inumbo-ID: dfa7642e-dd19-4af0-a719-106a30ccce3a
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.88])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dfa7642e-dd19-4af0-a719-106a30ccce3a;
	Tue, 06 Oct 2020 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LRCBCTu8g9BZ2k5WA08aaKL1PgpqMaRSCOJp7SOPIo=;
 b=4pHvi+d1BUOqdsFCkj9IIzshufPmvE6XhCiZilL+0zodn2qjyqoMzesrtih9eGV+OmXI+Jm1W//ux7BSmz4QNYAgRmMDvrZRNBUA4Fii2EdF1wsqOqwoajsFmEab2o3XU/IvsRzvkysljJ4o/W0MhKqIxR8jsODihpd2b2sqvlc=
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by AM8PR08MB5843.eurprd08.prod.outlook.com (2603:10a6:20b:1df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Tue, 6 Oct
 2020 07:51:22 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::96) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Tue, 6 Oct 2020 07:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 07:51:22 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 06 Oct 2020 07:51:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e47ebc7a49187d12
X-CR-MTA-TID: 64aa7808
Received: from eafbe70e3b2e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B35871F4-9849-4D0C-840C-2CF49E55B907.1;
	Tue, 06 Oct 2020 07:51:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eafbe70e3b2e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Oct 2020 07:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOGh8Rg77IySt8DI+37bOFRKcfS3AJj2yA/d8raBGNIn9r4NEiJR9OqsVolr+khaRM2pZfWt7Ufocv5zyEVsW0OwAU9EwAcyoQSX/45nOkEHizuQFA4EI52uUl5UZa/EJ0cmwxQCTpMGSodqjbhQfEv9r+KAmXXFeHCD6YSfxZt4zyH7BsxOQbMIh8Pjqh+dyiazplFtA6naso0/G3Ag5UrsBoUiGoJcnxzDPFbvKH7kM7o4mrFJQlOERxAt1qPtE3lFLrR8GE2QZzZVP6kizEdzof+qf6V1f3l4ORBB0A7a9TJwsu4qyGy1BoAaIsHBC5aQw+30BS1+RBfEGwG5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LRCBCTu8g9BZ2k5WA08aaKL1PgpqMaRSCOJp7SOPIo=;
 b=FKRU4vQ13wTDaKEaQQmEfBsej91RVw8qQRVJ9Lv4yDFF4OukA7gY1lU5DAunKQCVZWRiVlHbNa3OYuTI9jUgr4nGywC7NqLQ3RK0VU4d3pGfEFcnxEwir82PLUL3x2Q+cycV8IVzoF8YmTO4Tmc3xFOZhzPPubzQG0fHfxUpRYYNbq38yMP8XKRMU9B5q3VYjzqYut3pSHAJTv8Hej9d5pOHUsCuOfZPq8slrdUy9fPYHEuVV3J7WzXobXRDC87fBMygNDqatBjjoFvJLvuPkwenm/bmfK5Gm9RIQpWzKThwnAIQ2VgI6EZB3HFWryzsidFbG/L0br/I2E6sC30/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LRCBCTu8g9BZ2k5WA08aaKL1PgpqMaRSCOJp7SOPIo=;
 b=4pHvi+d1BUOqdsFCkj9IIzshufPmvE6XhCiZilL+0zodn2qjyqoMzesrtih9eGV+OmXI+Jm1W//ux7BSmz4QNYAgRmMDvrZRNBUA4Fii2EdF1wsqOqwoajsFmEab2o3XU/IvsRzvkysljJ4o/W0MhKqIxR8jsODihpd2b2sqvlc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 6 Oct
 2020 07:51:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 07:51:14 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Topic: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Index: AQHWmzF2iz7tdPrAmU+VUEf6Gggal6mJ/YIAgAA3CAA=
Date: Tue, 6 Oct 2020 07:51:14 +0000
Message-ID: <F313E5EA-DF1A-4AC2-885B-75FD1B1D8211@arm.com>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
 <3de58159c6fde0cdfa4d0f292fa55fdb931cb3aa.1601913536.git.bertrand.marquis@arm.com>
 <95b2a6f9-e063-8276-db62-ddaac06f4b7b@suse.com>
In-Reply-To: <95b2a6f9-e063-8276-db62-ddaac06f4b7b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88f1c5d3-c0f8-4e04-52a8-08d869cc9e7e
x-ms-traffictypediagnostic: DBAPR08MB5845:|AM8PR08MB5843:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5843061E3246C95EE92806CE9D0D0@AM8PR08MB5843.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8OybOaITiH4UAZB1EjeK92AQr91mohtoyb0GVX1ftoxz5zQCiSxh8VjYQcv5X3oUZ29ej2GSL3A4oiz1V5/hFOLaY7A3wlPL1XQ80Q+ee3x2H5MbusCKJ2yPC7kUW75fCNsZ6K7ZgN7nT96i2eg457npoaWcXQT9Fnmo5lUu6br0m9mryxqTs3Pa7Vbu6xR7+d++pyUrGJmVAG83Rs+apkJlQaP/eS++5Dy5jV8h+MRoZSmBW0NcF8fbGh0JZ4YzPcFE6Sn+x8U/wstNmSo9RtNllG3D6MqfLTLBu5NtjjZcogUO6oGWEVpY77/oUbWMofag65p6e+VTge7+7hVnzg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(91956017)(53546011)(6512007)(83380400001)(6916009)(6486002)(66556008)(86362001)(64756008)(66946007)(4326008)(66446008)(76116006)(6506007)(66476007)(5660300002)(2616005)(36756003)(33656002)(71200400001)(54906003)(316002)(8936002)(478600001)(2906002)(66574015)(186003)(26005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 3HYYqx4dC7HtQyO+yUkW9iGbuO8NRll1JyMtStzl9nj/0qnw6ZMF+1M8JLBq9dOjrvx8v0g89gGLx9jpO1RGpk9Li8tzRy/6oHClL/1hQY/Ybtij/WFNg3SluSsBW1Dl424JPIL6SYvuOIye4tv3xWiIzUbfcNq2dZSJZoVlAVuTr5lWbJmFcJDJRuYRayKYG867/ruj2fFHKlUMMm79M3wr/BAXQweGTF/ricLQ7UuCR+gOs8JGV3WURIrkUt1onlVTVg8l7bxVO+oaNHllaLJFAW1wFqjEq4Qe1nMCv+9QHEKhjZfIInY3ftVAEyLF7NIjsgEKiJb062hnVn6FrD9T/xEqyRaR0NWgbjIoT9M66g1Bw0xDHvM4oc86fRUjU17IiM5/LtmLDMzF+x+euAAOB9s4oAomY++0BG6I02cWJHld9D/CnjZk+yItiqUoFThu62kujMEzl08A8pt1+GhjRocjGKm3o2k/9zICNkScRXR3fk9DnP9PxThngC1ui00uO+RwpCyRu/LHHn5NDApw3byGrnRvtwiakRi22WeKCOvsPv6kF4k7rK0BPTPELeUBlZBVxQUbuXMoUCnVbmWHuvuuc8INtS8PX7Aup+M6smk5nxvSXjWp4DWEmQxk71m7y3xlDM1NHubcJ/X6yg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0BB1335B1971645A9B0DE915B127476@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2388f856-92f0-4e10-2d13-08d869cc99e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AP5Rs56mt5RlgmYwoXPCWizrapldVU68i/5VGbtt40wTpsu4c2ueE4BpKt9VLpfdbdP3yksImFEEvmqk3hCIfsHCN/XJD64f6N3dvuJNrnyku667+pK2aDH14Dbh2JIjcZBcUH8IS7p50jP1mMmUKF8SJjUWPrWgLM8qOOXdvQ9GHRayGhBOjq+Bfqu/7ZY0eq/CanvLeMOZ1tkQ3WgBu9glSPImC43UTCXlhG7Ud29PcETdzmNADbL/52zDSnRc4pcsYXuSUMGcatVyRqBiZO1kfpxv4jTdrqj6GuMngCSV8M8Mv2/vnS4PhsxgUn5sup7AnF7JuGvcHggZeROVMe8oKAZx+F/fvbWskAtW0tAuFqHdci0XCioTzyjWyqiWXzeiMka77Ulye2ofc2O34Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(70206006)(36906005)(54906003)(316002)(336012)(4326008)(26005)(82740400003)(6862004)(86362001)(6512007)(53546011)(6506007)(36756003)(2906002)(83380400001)(186003)(70586007)(478600001)(82310400003)(6486002)(8936002)(5660300002)(66574015)(2616005)(33656002)(356005)(81166007)(47076004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 07:51:22.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f1c5d3-c0f8-4e04-52a8-08d869cc9e7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5843

DQoNCj4gT24gNiBPY3QgMjAyMCwgYXQgMDU6MzQsIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNS4xMC4yMCAxODowMiwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+IFVzZSBtZW1jcHkgaW4gZ2V0QnJpZGdlIHRvIHByZXZlbnQgZ2NjIHdhcm5pbmdz
IGFib3V0IHRydW5jYXRlZA0KPj4gc3RyaW5ncy4gV2Uga25vdyB0aGF0IHdlIG1pZ2h0IHRydW5j
YXRlIGl0LCBzbyB0aGUgZ2NjIHdhcm5pbmcNCj4+IGhlcmUgaXMgd3JvbmcuDQo+PiBSZXZlcnQg
cHJldmlvdXMgY2hhbmdlIGNoYW5naW5nIGJ1ZmZlciBzaXplcyBhcyBiaWdnZXIgYnVmZmVycw0K
Pj4gYXJlIG5vdCBuZWVkZWQuDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+ICB0b29scy9saWJzL3N0YXQveGVu
c3RhdF9saW51eC5jIHwgOSArKysrKysrLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvc3RhdC94
ZW5zdGF0X2xpbnV4LmMgYi90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jDQo+PiBpbmRl
eCBkMmVlNmZkYTY0Li4xZGIzNWM2MDRjIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9zdGF0
L3hlbnN0YXRfbGludXguYw0KPj4gKysrIGIvdG9vbHMvbGlicy9zdGF0L3hlbnN0YXRfbGludXgu
Yw0KPj4gQEAgLTc4LDcgKzc4LDEyIEBAIHN0YXRpYyB2b2lkIGdldEJyaWRnZShjaGFyICpleGNs
dWRlTmFtZSwgY2hhciAqcmVzdWx0LCBzaXplX3QgcmVzdWx0TGVuKQ0KPj4gIAkJCQlzcHJpbnRm
KHRtcCwgIi9zeXMvY2xhc3MvbmV0LyVzL2JyaWRnZSIsIGRlLT5kX25hbWUpOw0KPj4gICAgCQkJ
CWlmIChhY2Nlc3ModG1wLCBGX09LKSA9PSAwKSB7DQo+PiAtCQkJCQlzdHJuY3B5KHJlc3VsdCwg
ZGUtPmRfbmFtZSwgcmVzdWx0TGVuKTsNCj4+ICsJCQkJCS8qDQo+PiArCQkJCQkgKiBEbyBub3Qg
dXNlIHN0cm5jcHkgdG8gcHJldmVudCBjb21waWxlciB3YXJuaW5nIHdpdGgNCj4+ICsJCQkJCSAq
IGdjYyA+PSAxMC4wDQo+PiArCQkJCQkgKiBJZiBkZS0+ZF9uYW1lIGlzIGxvbmdlciB0aGVuIHJl
c3VsdExlbiB3ZSB0cnVuY2F0ZSBpdA0KPj4gKwkJCQkJICovDQo+PiArCQkJCQltZW1jcHkocmVz
dWx0LCBkZS0+ZF9uYW1lLCByZXN1bHRMZW4gLSAxKTsNCj4gDQo+IEkgdGhpbmsgeW91IHdhbnQg
bWluKE5BTUVfTUFYLCByZXN1bHRMZW4gLSAxKSBmb3IgdGhlIGxlbmd0aC4NCg0KdHJ1ZSwgSSB3
aWxsIGZpeCB0aGF0IGFuZCBzZW5kIGEgdjIuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

