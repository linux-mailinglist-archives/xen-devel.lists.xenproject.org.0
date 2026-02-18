Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MZjDtPflWneVgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:50:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF81577F2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235818.1538676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjov-0003aQ-F4; Wed, 18 Feb 2026 15:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235818.1538676; Wed, 18 Feb 2026 15:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjov-0003XZ-B2; Wed, 18 Feb 2026 15:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1235818;
 Wed, 18 Feb 2026 15:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HD5B=AW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vsjou-00039n-08
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 15:50:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b01966a-0ce1-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 16:50:26 +0100 (CET)
Received: from AS4P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::14)
 by AMBPR08MB11660.eurprd08.prod.outlook.com (2603:10a6:20b:735::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 18 Feb
 2026 15:50:23 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::1b) by AS4P251CA0014.outlook.office365.com
 (2603:10a6:20b:5d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 15:50:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 18 Feb 2026 15:50:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB3PR08MB8794.eurprd08.prod.outlook.com (2603:10a6:10:435::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 15:49:19 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 15:49:18 +0000
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
X-Inumbo-ID: 8b01966a-0ce1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o716aLLDET5Y0eW1BbP3i9d/POadYgY/TxBACo9VNDbv1EszvaWt09rv7F6x5WOhQsAO+5gOPq1aI2m056HDn7U9fL2rvuOEKg34/QnTSH+Sk2HY0d/ZEKU84qCdW0T6m/gmx4SOboce3qnjuHw5Ngc9BzFVucYmx759I7HxK6VKI0ccOe/Dy70kdWUG/P5f/cLha6obkhjQU3ZYfJ0qhJYp2dX2SOK/zsTZB6RO3OMsZjAjYqSn/T7fll8LJsNdJN9gXNRzPzc/b7uH4vKbWuDKvjrkpJqu+xZPYPARtGDEIQokQr1k+Uc9HR/s6ZX1rpA9spSSHXovrDs4nuq22w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3DeqXAIKKnWywQHo9xnl0/8i309d7qRZueRR3vjb/A=;
 b=rfw+JQb0vQZW71Qca58PmX2co9OsZEMcrijuqCMFRj7u11Lot3jYreoJBP9JerQg6hZXfm9h6WqZ50dyP0gMR/F3U2uz6u8dVWv//xWyZmiogEZj4ZS21JtLGru7KLoqT3HHCb/Rx/ge9pOYdKU7dCfj26Br7Ccm2GzETIVh9Mx4M9H8DbtdFERBxTRhB9nlZus9ZTlcNcAGYj1qDK6PTnTCRpcHfA8lCU19+llYIjTR/KpHzveSXjWfNBwZmqsSIzwP3U/ib7nMREzxQ0dlhWmtDsYwhGTzUAvboRCun6Yv90vWB7JSo1N9d8/KWec9DIMMLSCrUqfOJUt7/rywoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3DeqXAIKKnWywQHo9xnl0/8i309d7qRZueRR3vjb/A=;
 b=lm8DASCZ1w6u4LBnhTpirZxPpzIH//yPbClM4SAIKlbM8Qqfe6ZktrSv5OemsgjmI/fDqNdGgXzwrcELIh8ZnMPjg9xoo1wqqxKE6oPgOoDfPtLaiMC6USwwZuXmB2lEE6rfbh7GlQMuD6xtw2Hxecofx/J96WRw04tSN7wmQ0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duERugWhXsPHTkcUtYufpsFb4XWFcg0QRV57NzLTBQj12YpTTbPpDii0um7JQZOyOWYaktXZ7yDJeSARizFxgXSQORN7iPyE7+s9YY3YImnTylPoPPqljb+TnpsI02oGtf7mZnqosbyftKLTTVgXYA9pBNA6/JGmFMnsx+bVdQYZjQrOsiexqEWUSk9CcegLUu5AOV2oJrlOrIP1PDWWB5RfFCPYi/JKvgnEke/3adStimvDdWEcTxJp+y5K6eoL2JWUA99qm/AoVYN1wF0SFxMpzqiv0i8VwKn84w2Ul16MXNCkuuxfk57olUnvKc+eDImzTcwaqtoCqZSp1HduGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3DeqXAIKKnWywQHo9xnl0/8i309d7qRZueRR3vjb/A=;
 b=PbhM/YSgWYxQmuic/Nxca05ZnfhFEQ0qkdZuPpOLZpltsMzxtbU90ZfDvB7y9ni7t80j6XEJquwqYF2ea+8StQlBIksC0zd57W4D8zkhF2DpDhSm2I18OAc9Oq4n0OCPzi0UJEpd4fLVvi+uhA3M2uJZYd82vbjwo4ngqRX2Xc25WFs+8nL6JsQA3HA9Tq1CbUG6LphCs9g2sdnw4Me66ltQO9BW35rtuvG3w2X4MUAG7qkDCM2w8PjxyjR6KvBhvAWP1xRuGGWOmNiL2lj5UcUpYfgRmMTbmEiw0Eb6marfEyhF4gQByRK3/Ro++QVeQ0yt/kU6P6TKW50xQ70dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3DeqXAIKKnWywQHo9xnl0/8i309d7qRZueRR3vjb/A=;
 b=lm8DASCZ1w6u4LBnhTpirZxPpzIH//yPbClM4SAIKlbM8Qqfe6ZktrSv5OemsgjmI/fDqNdGgXzwrcELIh8ZnMPjg9xoo1wqqxKE6oPgOoDfPtLaiMC6USwwZuXmB2lEE6rfbh7GlQMuD6xtw2Hxecofx/J96WRw04tSN7wmQ0M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan
 Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] CI: Extend eclair-*-allcode to enable as much as possible
Thread-Topic: [PATCH] CI: Extend eclair-*-allcode to enable as much as
 possible
Thread-Index: AQHcfj5G7fNp7PSkb0GiHPxZx0yorLWI378A
Date: Wed, 18 Feb 2026 15:49:18 +0000
Message-ID: <886C592D-FEC3-4266-B8EA-BE898D140145@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260105122436.555444-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB3PR08MB8794:EE_|AM3PEPF0000A79A:EE_|AMBPR08MB11660:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fc3917-3378-4b84-69ba-08de6f056d03
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TWJyNU95U1Juajg1NFl3RkhudEhFSDF0bEVPcTBxY0VMVEt5em9DU0NDcmFv?=
 =?utf-8?B?MFRZSlhsNjl0YmVpMVlNaHdNZjl6bHRlTGhURjZOaGt2cVA0L3dNZ1lONXZH?=
 =?utf-8?B?bGVGMGF1OWpnU1VSREJSS0VDZm1ZN2hsemNUMG5HRm8reDIrMEFEc3M1N1Ix?=
 =?utf-8?B?dU5wck1NZDVMWkcxRUIvbXNidDZpUENEaWtyR0xZMHFubDBOQ3hZYy9KZ0py?=
 =?utf-8?B?VXE3eVgya3FUcG1qTU1hczRsVGdJc3A3L3BPQnlURUo4dWQ5NDJjWGgxcTYz?=
 =?utf-8?B?NWcydVN4S05jWVMrS0x4NkdnN2xqZHZ0aHhWZ0ZpTkQ4RlRaTFczcXliSDhs?=
 =?utf-8?B?Smd4a0tEejFGY2xnWDZZaCtjTGo2M1k0eDA5RllyV2hYdGdUdCs5czBNUjk4?=
 =?utf-8?B?aG9OM1BKMWxJQWJIZm43d2JnTG5lc2UwdC9rdnFxdDVkZVN1OUZmV1lhZHpQ?=
 =?utf-8?B?MXc5Sm9PR3E1a0VEMkJYVVBqbk1ZSkE1Q3o4UU9sTWx0YkhCNkV6dERhZEh0?=
 =?utf-8?B?NXlndzhSUnFGa1F5aG1YSGdKOHVPNHFlQjJ0YitneUVaTHVITXhQVmFVemRp?=
 =?utf-8?B?SUVGeVV2V1ZkSUxhWUJpejUxL0RZQXBtWkRsTS91L2tGTlBwTDhDaWk2ZExN?=
 =?utf-8?B?Zko0cmQyQmpjeXByY2pIS1krdUdqRlVGdC9KMnZvSSt6QmhGRTdET2pZVklu?=
 =?utf-8?B?NFQ2dTUrS1lvS2hHYVA1M2ZmWUVyVkVTcjRyZUJDTXNSY2IzWFFGeXltS3dz?=
 =?utf-8?B?RTIramVsYWhLaWhKZ1V6SGhUMkk4SHdnR3pheEMyVG5OMlZocXhtWmxPUGNM?=
 =?utf-8?B?cDZRZWFCRWZkSWtkNjFibmFsaHY4ZndvejVWUHFtLzhmSTBVWWc4eWhneGdK?=
 =?utf-8?B?ZmFZZS9NdXJoMURoOXRILzZUK0RjK0Zocy8yVU5Sa1hKWnYvMlVVZnRWc24w?=
 =?utf-8?B?Ync5b3hKbmUrWWQ2dUVib3R6UjJwYVkxd2xRMU5mc0FOOEo0MkRjWEh3ZXhx?=
 =?utf-8?B?cmsrbVlRcjlmK3dqc1cwQ2RWVHJWejY4Q1ZhQzk5L0ZCOW1DTWxOd0t1UEQx?=
 =?utf-8?B?am1DMmxscmNQK243VXNVdmZrc0JoSllPODIrQmd2NjRoNENsb3lTNGpDcVpn?=
 =?utf-8?B?VjlTOVdFTkdvSU9lSGdkVmp6eCtLaW9JdmxsTnRFb1pmelBxY0xoU2ZlaS9m?=
 =?utf-8?B?OUppSDZBM1BrNzU2VmR5bGZRYitJWktxZFd0YlgxbVQzeGx6K3B2NkFzeWI1?=
 =?utf-8?B?b1hCM0wvVkNFbldLQUloOHI0NWY5OWtla3dpcWFsRS8zWmtKVFJURW12VWZx?=
 =?utf-8?B?LzFURWF5QWhxVDV4K3EwVTNtNVBjTGFlNjRXaTQvQ1RBajdoU0dUWTdJVU1P?=
 =?utf-8?B?TmxSOSsrQjJLcnhTUW1GNzM5NzQ3dUpacnJRazFXeGpzWDVvcmRKSXZrMUly?=
 =?utf-8?B?c0JXVTVGbE5KNmVVaEg0RVZaWCtpM2JUNFVhbUhhaWtwT3o4bmxnWUdUMUhP?=
 =?utf-8?B?Y1RLMnJWaDBLSTZhMVJDUU93VDIrUHRmeE91UisyTUh2aE92UVpiYjUyb01y?=
 =?utf-8?B?NkNnWVpqRUtKamR1dDltdXBHU0xlTisrTjZYWTNMMW9QQ3k1SGNwaWFxeGJU?=
 =?utf-8?B?bElaU3R6QUZLaTdnUU0wL1FPNVludUhudzl2RTI4NFAvUVZGbU5tZExHaEtH?=
 =?utf-8?B?OHRkTHJIdDZTUVRySTYrZUdER2VnUHVOSU4xSHpnN1FqZ2lsNTRITndBODdW?=
 =?utf-8?B?aTBBdlloUXMwNjlGdkJadkNPRG4xNFhJd1JTU2RkY1h6R3M5bFQwZklIZFNh?=
 =?utf-8?B?Q3JSMUZkR01td1Z1ZWRTRFI2NERvRGdsTDFLNkllM2VUcDJPMXpmcEh0UHJU?=
 =?utf-8?B?d0hjc0p1Q1crQXVUYjBoNWo4Tmg1anZNQzdUeGRTdjFEMkJMYzQ5dXFRWGJJ?=
 =?utf-8?B?c3VmZnMvM2tDVlFTVER3UDZGWW5UaEtYSEtBeTUwNTdoOEhPcVJtK1dERHpB?=
 =?utf-8?B?dTZSb1h1dU1jNjlYK1RmdjErMW50SGxPQ3ZOT1pBSHlZMWxWTVgyVzBPSjdn?=
 =?utf-8?B?UUZZamhkajhtRkdSV1FlamhXVXBDdUc2bmhySmhUTXBXbWpOVk5jK1Y1SktC?=
 =?utf-8?B?b25oQW8zTGxBMkFOcDhwNDVabHIzVzJiRXpOelpPVVFYZ1lNRVVXdUs3QTFk?=
 =?utf-8?Q?ld23OFURQXvBJhZJ2xv3NZg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A81EF580E006D4A8C788D22ACBADF1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	324411bd-63ba-4bb6-cb0f-08de6f0546cc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|14060799003|35042699022|1800799024|376014|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2haMXIzUkZ1TnA4VWYwQVAxSFNqS1IySEVWbUw5TWxqamRwc2lkVElGYzFE?=
 =?utf-8?B?QkNZcnptekNWWEhiOWk1Q3B2U1ZpZE9XUHE4V2lpckJXVU95a2VmN1NzTWwr?=
 =?utf-8?B?Vzh3U0tyWGo1dnZjM0F0SDBMYTZjZ2FtRUpHRkJsYzdNak03bnJBUjNJR1ZW?=
 =?utf-8?B?bVVpWXY2UTJqc3FQdWdWYklqNnZ4dHRLRlFWL29JRFRyR1lNZlFERTQyeEZm?=
 =?utf-8?B?ZnFuY0VXVnp0bE5vRzhwNFhDRFo4Tld6YXgrZFZVYXRyRTh4QWQzYW90ZzM2?=
 =?utf-8?B?clpzcmtnb3NySXZ5RXZrRVg4S1lza0FnbGF6ekZNclF4NGlXWEoyYStKc3hX?=
 =?utf-8?B?VWlaSzFuSUdiYlZaVEFpSncvOWtCYVMwUDlOQWhsNzc2TnpkRmFQT0hreEx3?=
 =?utf-8?B?UHBJT2Vmc1JLY3Z0NE5KMmdvVlFHbFBWcThaNTRDVXVhdXpndkk4Tkx2UU42?=
 =?utf-8?B?RnZ5MDZrazhZYldIaTIwYVhRSE9VUXBPM1h6M0k0ZnpjVDI0RzAzUEI1bk9Y?=
 =?utf-8?B?NVJ5VHRNbkdGSFpDc3ZiV0xjVXExTWdZTHJ3dmU0aGVKYlk4U1FNNG1acUZI?=
 =?utf-8?B?TE9UcXdJaVBpdVpia09oR0FDQlNsOXlyZUNSWnFWMmJ0RmlpczFYK09uSDEr?=
 =?utf-8?B?NDdrS1YxbFNpajdTMDFCY2g0MmNFczRmSVZGUytnTUxLOHprYVBoQ1ZvWE8x?=
 =?utf-8?B?UUJSdklHWWY0bzRZQUlmeHFRdFAxWkt0WnEwRXN5N0ZJRmR2NStvZVdvL0tU?=
 =?utf-8?B?QXBlRmZrbWNYZCt2RVpST1lZYUlBN080MXZvNXg4dXdKWlBCdG1HaUZXWndI?=
 =?utf-8?B?dmJMMnZOaTZmS0tVcmtBL2NkOTIwekVHdG9YanYrcUpLOExES0MwcjlpVlI2?=
 =?utf-8?B?K1lockVYOEJnQmdiUWRkWnFpM3lhbnRKZ2k4bW1GWXVSZUZYUEgzV2hxem5r?=
 =?utf-8?B?dThGbEFjTTk0dFJOU3BKN3MzUGtITUxNNU1COGRrUExMNjJaci9FMVpOaTlI?=
 =?utf-8?B?aE16ZWV1cmk0Y0hkR1VMV3BBOFJLbXNmTWhMWCtKN3c2UWtnT29zZWlaZ2Ir?=
 =?utf-8?B?TGpNR3c3NG1Cc254M0lDZ2l5TWZRVWV2bzUxZmw1bFVYWkxwNlVWcTVrdis5?=
 =?utf-8?B?YS9GNFlGeWRhTmkyTjlObGRHWkNiTmFlSHdQUnRuNjk4dHlnSnZUMlU3VGFj?=
 =?utf-8?B?WUVuaW1hVFkrRlA2cG1nY2ZPc0Z3OVhpajZlOVBVMWlGak84aGJTd0tnTUFS?=
 =?utf-8?B?dlJtUDIzNTNldFZCblBBRnd0WWpoTlB6cEkySGRzTXZKMzlqeEtXenJJSmNP?=
 =?utf-8?B?VWlJbnNaT0NVdzNienpWNHlWbEkxejI0NTE1RndFMGxOTzBNc1pVS2x5Yy93?=
 =?utf-8?B?MzFhdk0wUW9JYlg5a2FOQnErQytMSnJJMW9zWG1kek5xKzgzTHZwamFUYkdV?=
 =?utf-8?B?dU1RUzBDVm5aOEcreHpIWmRMZ1QwRHY2bk0ybS9tQk1TR3VhcjgyWEV5Sk5i?=
 =?utf-8?B?U29FUGovaU42Wmd0QjREOGkySWNVZG1LK1JQUnlLck1pSXI5eVFCK25KeUpE?=
 =?utf-8?B?aHIxUllZTmJEV2VWRUREZEFKR0duYnpPT3FVQ0FyUDYzamV1akRNZmpEeWZw?=
 =?utf-8?B?eXJvYjk3OXZwazYyNTMzLzBSeXc5dUVDRUVmWEtRalRMTWV1ajVxSDlSS3JL?=
 =?utf-8?B?MThIQ1JybmFoQlFFdElHc25DQ2RVNDhXeHkzc2xpYWNGcjZGOVNqRzZydVJS?=
 =?utf-8?B?bkNpejMwdTZrcGNjcy9sb1VkekNmZ2pKRWRDNWd5dmk0bVp1ZWlyTm5JM2My?=
 =?utf-8?B?cmM5QXNBKzA1a2ZYWjYzdWRTZ2VqZHBhZ0k4SnFyc3pYM1NSMWV6MW5ETG56?=
 =?utf-8?B?a3N0NGFsaGlqaWloY3k5MWRaMklieEZvZlA2VzgrSXAvckhPNkIwSzBnclNB?=
 =?utf-8?B?MHd4UTNKVXJxY01rZmRRdDhEajJOcXIrblhWZldGai9JTmwyeTFSN0tqM01q?=
 =?utf-8?B?Z0RYZjRLQks0SGVkcENmaUk0ZHZNbDBLSCtlK0JTYU5zUTloOVdTaldHcnJY?=
 =?utf-8?B?OTJrQ3hVeHNGVDU0YXdpM2w4QkZqVFY4bERtVnpLeE90TUZrSXBzR0N2WVlt?=
 =?utf-8?B?VDlOTGVlMm9HbXVuVGVIbHdVOUhkZkdOS1NpQTh1TjZuV20yYUJLS0o2b2NU?=
 =?utf-8?B?eE9hMWVVSENBUUp3RnNQWkcrWTR2NERnOWl1MHlEbzYyMHU0aUlkK1dGWkpz?=
 =?utf-8?B?cThMZDJGcTlPVWcxVHE3SVpjaTV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(14060799003)(35042699022)(1800799024)(376014)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DRe1f+qS9ntlnbFFHUv7dHUmWYFIqhM6UZcexhHFBEWGilvpF4DtZ0CJbVkM4xVzzdhlx0ZOI8IWRYVq4mGV7+bMziHKWh+4sHOGzA/55TAfZ2d8gu4MQeUyYiEEnLYnqtUMFYiWyLJfM5PiPVMOg+dmxAuoE2/7o32PA9sL/+G5O9OwhhaRvDa5FfcjDva3RL8JE3XdTnIEQo/MepXx+/OdfGvNTnMyulXEw5qYJhEPkWGBoswH7dztFpw1L+LoKpSUoFpX2QHfjBOoPvF7kIO8UyjxTyaRAMdsjjGJ9qAXcXJg3xMicTxA2cgN7oY62qDdq1kLozRXQDRJGM2j7cmyqOoTDRHpWt1WXEO5nnDFbz1FDcN9URDN+1ol5sxVoNy/+ntWhQ2DUHpFyxQPe7FE6R3O5mjisuILoXudQiYkylreJgMVd8EU4L0Jck1b
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:50:22.6596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fc3917-3378-4b84-69ba-08de6f056d03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11660
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 5ADF81577F2
X-Rspamd-Action: no action

SGkgQW5kcmV3DQoNCj4gT24gNSBKYW4gMjAyNiwgYXQgMTM6MjQsIEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24geDg2LCB0aGlzIGlzIGJh
c2ljYWxseSBldmVyeXRoaW5nLg0KPiANCj4gRm9yIEFSTSwgQ09ORklHX01QVSBhbmQgQ09ORklH
X01NVSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlICh3aXRoDQo+IENPTkZJR19TVEFUSUNfTUVNT1JZ
IGluIHRoZSBtaXgpLCBhcyB3ZWxsIGFzIENPTkZJR19ORVdfVkdJQyBiZWluZyBtdXR1YWxseQ0K
PiBleGNsdXNpdmUgd2l0aCB0aGUgb3RoZXIgVkdJQyBpbmZyYXN0cnVjdHVyZS4NCj4gDQo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLCBidXQgYSBsb3Qgb2YgbmV3IEVjbGFpciByZXBvcnRzIChub24t
YmxvY2tpbmcpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IC0tLQ0KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDQzogY29uc3VsdGlu
Z0BidWdzZW5nLmNvbSA8Y29uc3VsdGluZ0BidWdzZW5nLmNvbT4NCj4gQ0M6IE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gQ0M6IFZvbG9keW15
ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gQ0M6IEJlcnRyYW5kIE1h
cnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gQ0M6IE1pY2hhbCBPcnplbCA8bWlj
aGFsLm9yemVsQGFtZC5jb20+DQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3Qv
aGFyZHdhcmUveGVuLXN0YWdpbmcvLS9waXBlbGluZXMvMjI0NTE0MjQyMg0KPiANCj4gTWFpbnRh
aW5pbmcgdGhlc2UgbGlzdHMgaXMgZ29pbmcgdG8gYmUgYSBuaWdodG1hcmUuICBJIHRoaW5rIHdl
IHJlYWxseSBkbyBuZWVkDQo+IHRvIGltcGxlbWVudCBDT05GSUdfQ09NUElMRV9URVNUDQo+IC0t
LQ0KPiBhdXRvbWF0aW9uL2dpdGxhYi1jaS9hbmFseXplLnlhbWwgfCA0NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvYW5hbHl6ZS55YW1sIGIvYXV0
b21hdGlvbi9naXRsYWItY2kvYW5hbHl6ZS55YW1sDQo+IGluZGV4IGE0NzI2OTJmY2IzMS4uN2Ey
YzBiZmE3N2QxIDEwMDY0NA0KPiAtLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9hbmFseXplLnlh
bWwNCj4gKysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvYW5hbHl6ZS55YW1sDQo+IEBAIC00NCw2
ICs0NCwyNCBAQCBlY2xhaXIteDg2XzY0LWFsbGNvZGU6DQo+ICAgICBMT0dGSUxFOiAiZWNsYWly
LXg4Nl82NC5sb2ciDQo+ICAgICBWQVJJQU5UOiAiWDg2XzY0Ig0KPiAgICAgUlVMRVNFVDogIm1v
bml0b3JlZCINCj4gKyAgICBFWFRSQV9YRU5fQ09ORklHOiB8DQo+ICsgICAgICBDT05GSUdfQVJH
Tz15DQo+ICsgICAgICBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxFPXkNCj4gKyAgICAgIENPTkZJ
R19ERUJVR19UUkFDRT15DQo+ICsgICAgICBDT05GSUdfRUZJX1NFVF9WSVJUVUFMX0FERFJFU1Nf
TUFQPXkNCj4gKyAgICAgIENPTkZJR19FWFBFUlQ9eQ0KPiArICAgICAgQ09ORklHX0hZUEVSVl9H
VUVTVD15DQo+ICsgICAgICBDT05GSUdfTEFURV9IV0RPTT15DQo+ICsgICAgICBDT05GSUdfTUVN
X1BBR0lORz15DQo+ICsgICAgICBDT05GSUdfTUVNX1NIQVJJTkc9eQ0KPiArICAgICAgQ09ORklH
X1BFUkZfQVJSQVlTPXkNCj4gKyAgICAgIENPTkZJR19QRVJGX0NPVU5URVJTPXkNCj4gKyAgICAg
IENPTkZJR19QVjMyPXkNCj4gKyAgICAgIENPTkZJR19VTlNVUFBPUlRFRD15DQo+ICsgICAgICBD
T05GSUdfWEVOT1BST0Y9eQ0KPiArICAgICAgQ09ORklHX1hFTl9HVUVTVD15DQo+ICsgICAgICBD
T05GSUdfWEhDST15DQo+ICsgICAgICBDT05GSUdfWFNNPXkNCj4gICBhbGxvd19mYWlsdXJlOiB0
cnVlDQo+IA0KPiBlY2xhaXIteDg2XzY0LXRlc3Rpbmc6DQo+IEBAIC0xMDQsNiArMTIyLDMzIEBA
IGVjbGFpci1BUk02NC1hbGxjb2RlOg0KPiAgICAgTE9HRklMRTogImVjbGFpci1BUk02NC5sb2ci
DQo+ICAgICBWQVJJQU5UOiAiQVJNNjQiDQo+ICAgICBSVUxFU0VUOiAibW9uaXRvcmVkIg0KPiAr
ICAgIEVYVFJBX1hFTl9DT05GSUc6IHwNCj4gKyAgICAgIENPTkZJR19BQ1BJPXkNCj4gKyAgICAg
IENPTkZJR19BUkdPPXkNCj4gKyAgICAgIENPTkZJR19BUk02NF9TVkU9eQ0KPiArICAgICAgQ09O
RklHX0FSTV9TTU1VX1YzPXkNCj4gKyAgICAgIENPTkZJR19CT09UX1RJTUVfQ1BVUE9PTFM9eQ0K
PiArICAgICAgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRT15DQo+ICsgICAgICBDT05GSUdfREVC
VUdfVFJBQ0U9eQ0KPiArICAgICAgQ09ORklHX0RFVklDRV9UUkVFX0RFQlVHPXkNCj4gKyAgICAg
IENPTkZJR19FRklfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVA9eQ0KPiArICAgICAgQ09ORklHX0VY
UEVSVD15DQo+ICsgICAgICBDT05GSUdfRkZBPXkNCj4gKyAgICAgIENPTkZJR19GRkFfVk1fVE9f
Vk09eQ0KPiArICAgICAgQ09ORklHX0dJQ1YzX0VTUEk9eQ0KPiArICAgICAgQ09ORklHX0hBU19J
VFM9eQ0KPiArICAgICAgQ09ORklHX0lPUkVRX1NFUlZFUj15DQo+ICsgICAgICBDT05GSUdfSVBN
TVVfVk1TQT15DQo+ICsgICAgICBDT05GSUdfTElWRVBBVENIPXkNCj4gKyAgICAgIENPTkZJR19M
TENfQ09MT1JJTkc9eQ0KPiArICAgICAgQ09ORklHX09QVEVFPXkNCj4gKyAgICAgIENPTkZJR19P
VkVSTEFZX0RUQj15DQo+ICsgICAgICBDT05GSUdfUENJX1BBU1NUSFJPVUdIPXkNCj4gKyAgICAg
IENPTkZJR19QRVJGX0FSUkFZUz15DQo+ICsgICAgICBDT05GSUdfUEVSRl9DT1VOVEVSUz15DQo+
ICsgICAgICBDT05GSUdfU1RBQ0tfUFJPVEVDVE9SPXkNCj4gKyAgICAgIENPTkZJR19VTlNVUFBP
UlRFRD15DQo+ICsgICAgICBDT05GSUdfVk1fRVZFTlQ9eQ0KPiAgIGFsbG93X2ZhaWx1cmU6IHRy
dWUNCj4gDQo+IGVjbGFpci1BUk02NC10ZXN0aW5nOg0KPiAtLSANCj4gMi4zOS41DQo+IA0KDQo=

