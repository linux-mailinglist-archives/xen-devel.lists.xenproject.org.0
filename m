Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGdANIfkiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:43:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021C10FDA2
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225400.1531892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRXw-000741-Bk; Mon, 09 Feb 2026 13:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225400.1531892; Mon, 09 Feb 2026 13:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRXw-00071I-7L; Mon, 09 Feb 2026 13:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1225400;
 Mon, 09 Feb 2026 13:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpRXu-00071C-Tf
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:43:23 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a9ff918-05bd-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 14:43:20 +0100 (CET)
Received: from AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::23)
 by DU5PR08MB10516.eurprd08.prod.outlook.com (2603:10a6:10:528::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 9 Feb
 2026 13:43:11 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::ca) by AM0PR10CA0013.outlook.office365.com
 (2603:10a6:208:17c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 13:43:11 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 13:43:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB11723.eurprd08.prod.outlook.com (2603:10a6:150:327::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 13:42:05 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:42:05 +0000
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
X-Inumbo-ID: 4a9ff918-05bd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=of7bS4nmz0xYfrKdb5EZZ4oNuL7wpkSSE9i8WP5ZB/oVzro2ZXjH3So6qmcRiVA8QHTUYDeU/aZzND4sDKgNoxnmNSetHCrvMLKDziOgI4ta2iMprBt+Sqct+3Px1WLqNRk/VAR3OkspHpZ5UDPnK/r+izDJ7POTUmyOSt/wXkV1wBvNmsjUn4JQ7Jx950a1l2+TYxIT/qoB36fdwtoDBE9ISU6+BTIeTXHjx6ZSvPDeSv+N3+vp5gAj+4n6NYnjYC0NE63VPljNwrOk2B1e/rKjnpbutFjCyG2KzKo2tZAsI5s/fn3/JvSJ+fjxhEM6baFMKsp81zSpYTIliimUcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PPitlFRaP6lgCZ3/SzjstNFgsyt9LHNuxmswqteW/c=;
 b=GxU0Dyui9lv4Wmu9qAmy9ExDxX4SOJRmJBkhVOImYc3e4cvzgjfkYOQ9dtz4QIEnbmJ4Wz22m5DxpGJEEOkRNIIFPfoV9B9E7h4eNRPSK+eg8zEXoKIrMPx6Sk40B/VTb7mj52SB2GPJSEFPZrXdkRhcq8IUBOEiyQ4oaE++ptXe9WcsePF6GVvCb+KfWdi2/1BDX/PwU9VEvmRoqXu/l1xy7wEByh59Y+vqQ5U72EIZf5F+rHdME6E9I9gDSsMWY91SeQOucqCFVokgN/6mUjBAplol/DbwLTZ/q+ecDux/smvZ4AAunDryWaiiRkJK7dEmvGzi7HlKF4kD1h3XXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PPitlFRaP6lgCZ3/SzjstNFgsyt9LHNuxmswqteW/c=;
 b=b7LFRs+fmsGncGBuLVPnk/XKcED7XpZs0niTHLniRsXk1uUuACXRhDYJlVpPoBeA8ZecYMCov5wPzIlryVc5STSdngme9kUslzn4dO3oSAFoC6n5M1+1YMHDLqWRm3oCfZTwte+dCg10WMxwHoKprMs2l5yWJe1Ei/MWgEx+FTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCAxX7OY1Kk61xNRcIx3M3jUy2ct36I0TsDVNYud40XXHxk29jXoGAwqKgZNfiQ7V64HORP/eYyAFn1Qki/2i2Qu0XF8n1DYKquHYEvovg55rP9Ohk8Kwm9ByhUXJWANeQnzw+gB+lb8ot2k8X18omyJZlSHCHaw8D2iqVJ7twr4b/ehXiEHaJZdLBrpOrddfZEDTc9g9Jer48SXB8oiQaQoyO7/+18iwI34uoEZubhhcwJ2+5DxOP9Xw4uHn+xeOgbrJRdIY5KdnLaZHKeZHL/6aMGAMPE9wkaXGHbM1HCZ4W20Fuv+ffVrEDm8AIHHRBpToR8eoENxVxgQv5jNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PPitlFRaP6lgCZ3/SzjstNFgsyt9LHNuxmswqteW/c=;
 b=exqA1K723npB0k0vJmcQQ6h0KbakwYeQFabnINhjbx4OW8C7vjgifXUBZQ8DM0MEZ94MplMfvWRqQCK9kFVlVdDbHkjwI68jgzAm5uYMQyVgIebzOjv7U+b7vj2YN0utrJRoC9zFpgiFc5+ffvqmva+WaSyQ7SR/AkWL6+QXciiEFOwlkiArvc9TL2N9poFsyWi4YFwFs7/K8QWgwUF3DTUoCZEaxdaTnxNmjNg2FTkDRDXjmtG+185OeLrbGQJjFal03qFa+oKPQyGPgff8lGagMGIkmQqQnKyOJKUWny3Eu4uxAD2KUQrWBtmVcwg7I9d3CVbRAuOMPskeijLslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PPitlFRaP6lgCZ3/SzjstNFgsyt9LHNuxmswqteW/c=;
 b=b7LFRs+fmsGncGBuLVPnk/XKcED7XpZs0niTHLniRsXk1uUuACXRhDYJlVpPoBeA8ZecYMCov5wPzIlryVc5STSdngme9kUslzn4dO3oSAFoC6n5M1+1YMHDLqWRm3oCfZTwte+dCg10WMxwHoKprMs2l5yWJe1Ei/MWgEx+FTY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index: AQHcmbF131JHt0VrQEG2yzDmCYz1i7V6XACAgAAB1gCAAAHIAIAAALSA
Date: Mon, 9 Feb 2026 13:42:05 +0000
Message-ID: <6B8E025C-3235-4289-948A-B26992D0C4C2@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <aYngg_ym18d0G-fX@Mac.lan> <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
 <aYnjjHlbaYjr2VqV@Mac.lan>
In-Reply-To: <aYnjjHlbaYjr2VqV@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB11723:EE_|AMS0EPF00000194:EE_|DU5PR08MB10516:EE_
X-MS-Office365-Filtering-Correlation-Id: 14453e76-a4b2-4feb-7dd1-08de67e12a41
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R0hRZ3hhOUViMkppa0FOZlpsbHFHTkw4aU9FampSdVdra29HdExxcG0wQjVk?=
 =?utf-8?B?SUNkRVBtU3Bac24xRmJVOFc4eERxYzBhMzBLNSttSDU4RTM2QVN3WDBqZ21V?=
 =?utf-8?B?d1JXSVNrODV6UWZ2dC9xeU43cVc3SGhuS0NUMTJYcXJBNjFTdWE2c2FSa0dW?=
 =?utf-8?B?ejc5eW5wOW0wZW1yWjluRHM4ZW0zUTBoK2JJMzNpM2ZUNTQxWUk4S1RzNE4y?=
 =?utf-8?B?MGRIdVd0N3Z2cmVjelJBOUFxclNZUllTS2h1QU5hWnczN0U4NmRDU2ZTS3Vl?=
 =?utf-8?B?N255YVlEd2Fod0d4eXlqVjBWTWJTTFluV0dnd1lOUG1MZjV5bkZOZjMvblZL?=
 =?utf-8?B?QTNYb3VyUXkxS3M2bGlxL3F4MkJ2TWVIRmc2eXNYNVZ0K0RrY1B0SzltK0V6?=
 =?utf-8?B?dnRjS0RYYkVmUVVvUUdQRk1CZkcxQmJFSEM1ZmtaN25hTy9NMWN1cWVTTDRW?=
 =?utf-8?B?ZWowaXU2cXJzaENSV3YyTWFjRmVSVHZmQ0RMN25LQ0pYcG9rUllvZ2x5WlBm?=
 =?utf-8?B?ZjF0NHV2aDJVOEJwc1JSSHFlYmFoanZTQS9vZm5yMGpUZ2w0UUZoZjVFMmZB?=
 =?utf-8?B?MVZxWUR0aVZQNVNhcHZITENNamMzalZRN0MxMlBCQXM1dTY4QXAzeUt3M1N5?=
 =?utf-8?B?M2tWTFpTRTZ2eG9pVkp3L2dwRE8wTTIyR1FjK0NueEkydWg0UUpSZVZOZG1j?=
 =?utf-8?B?WGRPMGNzTEM0MjlnZVZFcmpjL3FsY2RxWmdHSDVYMGdSS0crT2w0bEdMb0do?=
 =?utf-8?B?b2dNbCtBY253SHNaOGFWeTUvWjdjelFuZmI5VDJQYld5ZlljQklJQkZPVFNr?=
 =?utf-8?B?ODc4MUVtUTZQc1grajdWZlQ1LzdaeXZZaXc3ZGpvWjRicjFHKzVnR2V0SHpo?=
 =?utf-8?B?di9UTlRON01YNUsxK2oyY21lcHBpVHBvcHBMNlM0UUo3Q3YzeE94WWlybWor?=
 =?utf-8?B?RWhhMzFmUmRtNkJXL3YxdXNORG9MUGN2bnVOc2Rnekw0RkxVbXd3bnh6OEFl?=
 =?utf-8?B?QlJwM1lKM1AxN2dyZTk5ang4RDNUbEJpcVNjdGc5NmVWVjBIZmZTTWd0Lzdv?=
 =?utf-8?B?ME5tUG1FdjI2M3gxV211RDhyQlB3WE5jWk5RS1kxQUN2aFFSdW5lVDg2T3NH?=
 =?utf-8?B?UG5DOWJkYW13NlByZSs4QjlCZHp1bFFKYTlNb1dVRUFZWFlQZUFXUm9RVmYr?=
 =?utf-8?B?WmE4TFp4VmgwMFZ2eXBKdThESmJUTzNNa3lwZHo4Q0tzQmtSbFcrcmZlM3gz?=
 =?utf-8?B?ZWIxUnZKK2R4blZ6bXE4NVZUQWpNc1d0QTA4NkZjbTR4dWVzK0RKNVhnT2gz?=
 =?utf-8?B?N2pnT1ZBaU5CdzM0bXJUbHliNkJZYTk1Uk9aR2RiblUwdEYwa2UyQ1ExTXBP?=
 =?utf-8?B?aUVzSks1TDUyVkZxSWw2WUdEYW1QdHVCWFNaMHkwR3E4NHdHWkJTUVQxc1F2?=
 =?utf-8?B?S2tQSHlBcG1FdktQS0xkUHNMY1FLalBDTERZL1V5aks3Z05CMG1oSGZXMGl5?=
 =?utf-8?B?TXA0aldLNGRoTW5VVkxQSURzLytHb0pubFlIZ3FKcGdrdm5EbmVYVVJMb2V6?=
 =?utf-8?B?T3JUdWJPdWw2WnZmVUhTSUVtV2NsTHdxV2VuZWp5MUFGbXkvYlVLS2NxbVFX?=
 =?utf-8?B?ckdaaDk2ZFY1RFQ4UTZab01OalRZcFlubXRCYWRyRnBEeTd6Y0FZMVE3VTIr?=
 =?utf-8?B?TCtQUHhMSW1jQmhrS3hZSi9FbytEQ21BVGtQK1FlUDdxVFRHWmhNUXNwRWx4?=
 =?utf-8?B?VjByVDZKajF2L0Q0M0xDSDY4YUY0d0JiZmdrNVBQcVhmQjNQMkhQdHl3MFF0?=
 =?utf-8?B?d2VCQlVYQ0VBM3hCUnhaVzRDbzZDOGMwRWRIRVBTYUNYM1RSRklNTHorYWF2?=
 =?utf-8?B?Y0Q4QjhOdU1ndm94QWYyY3IxUTJITXVLM1JyV0NNdnF1U2FsMDVKRk1tdjN6?=
 =?utf-8?B?RWpJMjdYTENGZUcwalNaQ1VkdXR3OEVOOThvbUVaUFRicVpMbEZWZmx0N3hq?=
 =?utf-8?B?Tm91dHBHWXNMaU1ROGh4cUdRNUttYm9iQ2NLSkFpdEtITC9Xei9PcGpQbURY?=
 =?utf-8?B?MHRpOFMrbXg2V0k4U1pWa0dhaVUzN1lhOVhQY3MvVFJwcTB2MFJaR1FqYll2?=
 =?utf-8?B?bE41T09uMWdwR1llc0ZDR0NDb1NNWTl3RkJGV2VOOUs1WVNVbHk3U3AyTHRy?=
 =?utf-8?Q?ykVucLzSNVmFbCIcDb4TkAY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F64F49B97F2D849BE88CE251F5DC50E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11723
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72e347c8-4a1b-4f76-1071-08de67e10383
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|82310400026|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHpBUS9QTHhpM2ZrczBob1N0NDBqaFV6QUVIYzc0OHNIMnoramtDcXkvTy9m?=
 =?utf-8?B?VWw4cHNmakVzZ21Td05kaEVBdWRVSkN5akNrK0ZHbTFraTBUMUVkYVB4WE05?=
 =?utf-8?B?MGJXeGd6OEdaTmsrdWJkY0NIaER5ei9CT2JjcUVua1dxYy9sd2t1dVFSK1o2?=
 =?utf-8?B?dno1dEdIRVh5dWNPUndyRStYVHNJQ1FpaXB0UTJkcGdxL092MDVUbklRa1B6?=
 =?utf-8?B?V0R1UDgyK1pVY2lpc1E1T05jbktycDlRZGNWdUNqTmhzYXBsRi84QmJpaTZG?=
 =?utf-8?B?b0JHMDdCK3o0S3ozS1lTQTNHSTkzR3IwZFJpNXhlTFhPK0VNazI1UGRXNzlW?=
 =?utf-8?B?eWgyaDF3Vld4dENmb0g0SW4yVVRsK0dkNXY3aEdteXRUeVJRdVBNNmhudmZU?=
 =?utf-8?B?Z1czaWJ3U0JGbmhUODZDd2pCSkhaTnNzMG5Kd3dINHNxYjZkWXBSRXNkWHdJ?=
 =?utf-8?B?ajZ3VEt2cnlKMHRPUXg1RUsyZHRiSDZwUHh1ekw5Qi90SFdRNW5PbFZjblFa?=
 =?utf-8?B?akl2R09mb2hIeDBqL1dYeUFyVGhJQjh5VkpWakNIT2NVSmZhR1JmYWV6Qm1B?=
 =?utf-8?B?Mk1mRkVaMFV0ditUM3JJbHBNZjd5a3Z2S2lvaEl3YXV3QzdKQ3J3S3orNHhp?=
 =?utf-8?B?ejFaRFVyYXRMcko4aEYzRHdBa3l1c2VZUWlxTTVUeEM4eEJJVW1qdm4rbE1Y?=
 =?utf-8?B?L05Pd2NWaXhxa0xiYzNob3hhakl5enhJWWRraFJMQmxWendzUEVGNm43VFNi?=
 =?utf-8?B?SUhWa3Y3YmJ5ZmpCdkNudGc1MllXaFBwQ0tvZGtScTRMK3FRU2g3d2pKejlX?=
 =?utf-8?B?cnZyS2ZadWIvUmhnc2YrMmc1REpjWkZ5ZUJwNVJvc3VJUG03NEl4VFdLd3VT?=
 =?utf-8?B?QmRyd2hJTEhwL3EwMFVialdXRDhlVlp0ZFd0MDAySm03WitvRUZNekl4b2gw?=
 =?utf-8?B?ZHBUMzVVOXFBaTNqcTRIOVN2cDFpUVArQ2dIK3dPNjRmeGdWeXFEMnhJN3BH?=
 =?utf-8?B?dkpJVzJPbms4VzZPTWRyTmFsWXlOeUs3K0g4MmMvWk9VdG5EeEF1Y29EK3VX?=
 =?utf-8?B?UFBvKzlBNUE0aTRraXkzaUFJR3piSkpxWVp3cHpuVXhkVFEyREY0TlZ3aUZ0?=
 =?utf-8?B?dXFFdmU2TVJrdW5mdGRKYkJaVTNSQlFYMCtpUENhSTR4SksrK21La04xWmlH?=
 =?utf-8?B?cXdQWmF3TUJ3a2Jvck5Wbm8xQ1RObXhqcWJLVmxXZ0FsWmpDMGxGaUk1Tm56?=
 =?utf-8?B?NVdHbWI3Qmk1MjZOelh5cE45enlVZ3pMYmpKcnQwSGFOTVh2dUlsRXpza0dC?=
 =?utf-8?B?dnpEVTlTaHNITDlWZGJSVDZjV0plMENNQzRLSnhvK0cxdzBVY3VrVEZ6b2Zl?=
 =?utf-8?B?SE5oSHcrNWszYUhaYWVaTU9NMjR3eXFJNTlWLzRlbjFhK1ZvK2puSkZMdzZt?=
 =?utf-8?B?YXRMRzI1bDNCMzd6akF1MFdxT1BvOHU5MEo1eXpHV2dGMnJ2L0cxZUlkUzZD?=
 =?utf-8?B?N2Izb29udi93MmQ1all4U0VQM0Q0eUdNYnBROFJ0NDlVWTljS0pWeDJyMktn?=
 =?utf-8?B?NXJaT3RwTTB5U2luTlYwSHphYTFMNXd0aFM2bWVDWGFxWkp2NkVEZFhXMnYv?=
 =?utf-8?B?MTNRTTNJbDdkYWJHZlNVUWNvSEdaTklVSDJlZTRUWWN4VzhFSVdIdjdRci95?=
 =?utf-8?B?ZTZxRjhmU2pzTmFFaHZVZlg3VUhZM1RrWE9DdFMrUWhpTUM2bU0rY09RUEhZ?=
 =?utf-8?B?bVRhcUYxUzJkUFUxdnRLRFZON2tSckhIUlZyQ0hLU0tWMzQwVTBwYWZiUWU3?=
 =?utf-8?B?c0ZSUzNpNjlHZVNONzYxdXRFcDNCVEM3elFRT1lQQUJnbmRaZ05LWUx2Q3p3?=
 =?utf-8?B?cmZTOXF5eWthU1ZxWTdWMmRGYWhTUlZaaXo2eVJrVEs3ZnFvSEZ3KzlYcmw0?=
 =?utf-8?B?VWZqN2lrTzBTaGVKYmcwTThxVDd1TFJ0YjkwazlwRnNEMUVzOUd0STNlT2l4?=
 =?utf-8?B?OFkwN0tRcUVkUWpSQ2xwUUZXUW56YWZHYTl2KzJuSnBVWFhBZ0JSQThCeHFz?=
 =?utf-8?B?QzV5Yy81Zm1LYXBWdU1BbXRDbHRra1N1d1ZPdFA4N2c0bEZyd2FNa1lJRGE4?=
 =?utf-8?B?WitRTE4yN1J5dlhCejBJL1pJemJ1L2YrNnhnNGprdTdQYUxNVkxsMzUxS0Ju?=
 =?utf-8?B?K2dwcHZETWY5ZmpvK2JNaXV5eXFnYzB4UDd5RVUxd09RQW9HNkhOOERSNmgv?=
 =?utf-8?B?bWtYY1g5Z0dHZnVRTStYOWpWYU9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AYl6exASe6rJMKwyhtEXRGWVLJ0sbyvcPmVHs//8Xu0ZbQolm7FkMjziRF3+NmOYzibcYkUdVtQJRsJ1GgM8nAHzH2/NjxzCOaaaGm7+rwXMtyQC0SNcv9EuIUZXruPFlmTPmnSPB1WVeF/F5xqV1g3KRyjcnirj4XzYlLc5QOxwbRmQc9MnYXiEWZ7nkcLQtkR0hhMLKTyredbwlt8ir4FgsAajpJwYZap9OfVvl7WGkE6iKcC+Zwo5DZgymujnQHRIuKsAQ7Ar1LPjsTKArRyORWHPhcoJbKxNPwtZ5puZSHA3cYoTxtSdo1lf8xMiYEX5hCddaiAOiFnug9WE7KZeiD9ysQVlA8H8TDTuVCqWKRz60AbJG7w7/1DUN6UNSG16xzqMRpLkn3RPfuZeWzwpd8YzwqQBBYafw8VEn++bucWxlRjP2u3dMobZsfDv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:43:10.6515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14453e76-a4b2-4feb-7dd1-08de67e12a41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stdgnu.mk:url,arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0021C10FDA2
X-Rspamd-Action: no action

DQoNCj4gT24gOSBGZWIgMjAyNiwgYXQgMTQ6MzksIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgRmViIDA5LCAyMDI2IGF0IDAxOjMz
OjEzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBSb2dlcg0KPj4gDQo+
Pj4gT24gOSBGZWIgMjAyNiwgYXQgMTQ6MjYsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBNb24sIEZlYiAwOSwgMjAyNiBhdCAxMTo0
Njo0NEFNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBYZW4gZG9lcyBub3Qg
cHJvdmlkZSBhIERhcndpbiBidWlsZCBjb25maWd1cmF0aW9uIHVzZWFibGUgb24gTWFjIE9TLg0K
Pj4+PiBJdCBpcyBwb3NzaWJsZSB0byBidWlsZCBYZW4gSHlwZXJ2aXNvciAodG9vbHMgYXJlIG5v
dCBzdXBwb3J0ZWQpIHdpdGggYQ0KPj4+PiB0b29sY2hhaW4gYWJsZSB0byBwcm9kdWNlIEVMRiBi
aW5hcmllcyAoR0NDIG9yIG90aGVycykuDQo+Pj4+IA0KPj4+PiBBZGQgY29uZmlnL0Rhcndpbi5t
ayB0byBpbmNsdWRlIFN0ZEdOVS5tayBhbmQgZm9yY2UNCj4+Pj4gWEVOX0NPTVBJTEVfQVJDSD11
bmtub3duLCBlbnN1cmluZyBEYXJ3aW4gYnVpbGRzIGFsd2F5cyBmb2xsb3cNCj4+Pj4gdGhlIGNy
b3NzLWNvbXBpbGUgcGF0aCBzbyBjb21waWxpbmcgb24gTWFjIE9TIGlzIGFsd2F5cyBoYW5kbGVk
IGFzIGENCj4+Pj4gY3Jvc3MgY29tcGlsYXRpb24gY2FzZS4NCj4+Pj4gDQo+Pj4+IE9ubHkgY29t
cGlsaW5nIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVuIHRlc3RlZCAhDQo+Pj4+IA0KPj4+PiBBbiBl
eGFtcGxlIG9mIGhvdyB0byBidWlsZCB0aGUgaHlwZXJ2aXNvciBmb3IgYXJtNjQgb24gTWFjIE9T
DQo+Pj4+ICh0b29scyBjYW5ub3QgYmUgYnVpbGQgZm9yIG5vdykgdXNpbmcgYSBjb21waWxlciBm
cm9tIGJyZXc6DQo+Pj4+IC0gYnJldyBpbnN0YWxsIGFhcmNoNjQtZWxmLWdjYyBhYXJjaDY0LWVs
Zi1iaW51dGlscw0KPj4+PiAtIG1ha2UgWEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJ
TEU9YWFyY2g2NC1lbGYtIEhPU1RDQz1jbGFuZw0KPj4+IA0KPj4+IFRoaXMgbmVlZHMgJ3hlbicg
dGFyZ2V0IHBhc3NlZC4NCj4+IA0KPj4gV2l0aG91dCBhbnkgdGFyZ2V0LCB4ZW4gaXMgYnVpbHQg
YnkgZGVmYXVsdCBzbyBpIGtlcHQgdGhlIHNpbXBsZXN0IHBvc3NpYmxlIGNvbW1hbmQNCj4+IEJ1
dCBJIGFtIG9rIHdpdGggYWRkaW5nIHhlbg0KPiANCj4gV2l0aCB0aGUgYGNkIHhlbmAgb21pdHRl
ZCwgd29uJ3QgdGhhdCBhbHNvIGF0dGVtcHQgdG8gYnVpbGQgdGhlIHRvb2xzDQo+IHRoZW4/DQoN
ClRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIGluIHRoZSB4ZW4gc3ViLWRpcmVjdG9yeSBu
b3QgaW4gdGhlIG1haW4gZGlyZWN0b3J5Lg0KDQpOb3cgaSBnZXQgd2h5IHlvdSB3YW50ZWQgdGhl
IHhlbiAoYW5kIGhlbmNlIHdoeSB0aGVyZSB3YXMgdGhlIGNkIHhlbiBiZWZvcmUpDQoNCk1heWJl
IGhhdmluZyAtQyB4ZW4gd291bGQgYmUgYSBiZXR0ZXIgaWRlYSwgYnVpbGRpbmcgZnJvbSBtYWlu
IE1ha2VmaWxlIGNvdWxkDQpicmluZyBvdGhlciBzaWRlIGVmZmVjdHMgaSBndWVzcy4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg0K

