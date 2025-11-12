Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D68C51004
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 08:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159536.1487842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ5aO-00020T-DB; Wed, 12 Nov 2025 07:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159536.1487842; Wed, 12 Nov 2025 07:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ5aO-0001yH-AY; Wed, 12 Nov 2025 07:48:12 +0000
Received: by outflank-mailman (input) for mailman id 1159536;
 Wed, 12 Nov 2025 07:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21S/=5U=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vJ5aN-0001yB-Ab
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 07:48:11 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc1a038-bf9b-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 08:48:08 +0100 (CET)
Received: from DU2P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::30)
 by AM8PR08MB5713.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 12 Nov
 2025 07:48:03 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::cd) by DU2P250CA0025.outlook.office365.com
 (2603:10a6:10:231::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 07:48:01 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 07:48:02 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB9000.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 07:47:27 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 07:47:27 +0000
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
X-Inumbo-ID: edc1a038-bf9b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OtefcMgUsG+rlmB6v05xDJ1dv38G49qpc+HzgYcR2P9LBA+aukUdNfT2JHKTUwCqwuZMxYKP+BvAI/o/cSRntyh0H63S87CAu68cfP0CIuOoq7wGSGgqDKkkpDNYsyZB8wXtI08YjRmgqrKPOAF0xSZeWmykXCzCv/4I3t0YmbkRtfbYW3uE/6jNnQCSLSMH+5gN+mvzrGsVsJ9rwOM0ufVNItHlTH1SmgZtE25OcT6VOd2h/3HP0io5INoklTTa7EQS/FcOOQ2zhkX4IQOgpBYER6tv8LyxfUE5REoZxuB25NsSGGF29DxYrBrPxPCs2757WT1mppK47bJx2VwTVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pch2KVFYJZ3k3jnuyzWiscTST8PxHu8Qog87IinwUxs=;
 b=Il+rBNjYz1OdXX/OJ9++ZUL4GnFSKOi87ZcR2hKrQH8ieQa0mMZ7qG4H/JCsdhWONEwRLbBcB4978XIV6UlDq9uUaJAatrqfBB5Gsi1qiX+XeWluQAMWxHNV2TiuSFpWxwL59ZouCylxKiTl3MaT2FgpiOjBlFeE6PAnpZddMnm1CTTwds3aFawN3fx04H8u7wjB5Ekf97ligzO84N/stAsgGx7/yKGyxynQWmEItt+OHYqFCw9b69xhP2Ovz+D43sSDnpqVplGbJZ1xa0BE4xlCDpo2YEGGxQZlHT8EYLZFJrnEspePJhjIkV5wrkWxgbXWWl6rTdYgb3FSWRJZ0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pch2KVFYJZ3k3jnuyzWiscTST8PxHu8Qog87IinwUxs=;
 b=ap8jJAKFiFaN+SquP0eeSgcgGtsf6O9E2pDxwuT9D05fn7b+ZuMvEex+ks8s3ajLJBx3UZ0nHPoTH5H4GB1YgH5qwErDWa7pS38d3vWT5Hu2s2MlxLfEllVmKCoDN1j4qg6TqpupzC+anBrYJjq2V56GYFMupk08m60XQS/gKsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxTABJgEg7u9x3l8W5KKqC5TY1S7kw18C7HX0/bprqg4YN+f9lO+pH/4P9Fp+Rgi0/XMPpW8w0LrXlhzLMitM2xADI3ccjNqtL0LWQt6614wqqbA+IsS4waF7yxHZdocwXvIuhOiNs6Xo2Z3Z8EM/RgJQ3PjoEm8jjg02LF8MXDj+tNSB4qZWVWZ1u+INjNKb7PxrzzIOgBCf6gkVEjudQ5/aVIG2F2MbxKLT6VH5ztYN+w4ZOCS7IAE7TtKsPEKOSg7pPjribyugz09caML/82cOYol14l+Qh40MFgisZQzB2SthiAIhDc6Pi1sncMFzIKr3ZAhN9dHk5Svlvbtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pch2KVFYJZ3k3jnuyzWiscTST8PxHu8Qog87IinwUxs=;
 b=AGbTVnf4ljmpBTY1pUYMclGcx0fKN3iCVAvh6SOP5+vDzfY38RTMTBBBk2ek/NSBb0ceg/Lv2m2yTx/sML46tNNYw8xc00liwWxkd9ycWisU8ZVzNpa7pm7KdV28hJyQfsnQEFwcm5jjNIfIb9jdmHUVaqzzrkXBnPYrn8Ng7MTTJowro7P4uP4A9IinK35yl6ZjcC44h4YhI9ba7pIEmuI23VPT2PH+xFTuuxl/5ltYvhJ5lvhjwV98sRduBpPhi+zDFtDU8PWXZRtm5h7+ZrzBgAvRiIW//7gmnjKS5sy8kDNlzB82KjUgERfnEsFgTBRpGtdRmAOqY5etjyl/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pch2KVFYJZ3k3jnuyzWiscTST8PxHu8Qog87IinwUxs=;
 b=ap8jJAKFiFaN+SquP0eeSgcgGtsf6O9E2pDxwuT9D05fn7b+ZuMvEex+ks8s3ajLJBx3UZ0nHPoTH5H4GB1YgH5qwErDWa7pS38d3vWT5Hu2s2MlxLfEllVmKCoDN1j4qg6TqpupzC+anBrYJjq2V56GYFMupk08m60XQS/gKsw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
Thread-Topic: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Index: AQHcU6MU9r1SyxgepkCxXro0WqQYWrTuqdCA
Date: Wed, 12 Nov 2025 07:47:27 +0000
Message-ID: <80431F4E-4512-478F-94B0-1CDDC5E8B6E7@arm.com>
References:
 <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB9000:EE_|DB1PEPF000509FC:EE_|AM8PR08MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a90795-286e-477b-ad20-08de21bfcf0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SE91YW5iNnNpa09pYlYzMCtQeERidFA5WkVqTTYxajFPY0dzbU1rd3NGdlNF?=
 =?utf-8?B?WlpSNGMwQXNsUDBDWGhlUis5anhkamgycUdEamlYcjBLc0JxZ3AyWm8yN1BF?=
 =?utf-8?B?TkFuSlROTi9XalA2ZjRNMExyRW9NT1QxenJSWVBUQ2FESnR5MnlaM3dsRTBl?=
 =?utf-8?B?RFMvUUFWRFRHSm5GY2tXNFI0bVc5T21iTHFVUWIvaHk4OHJFb2hCLzhMeHps?=
 =?utf-8?B?d0xFM0k3N1lGRE5yMEhpQTFSajFEQlYybU9KL01idzRJMFBNbnJEbnEvcGFD?=
 =?utf-8?B?d01LNHBYbUFzUkVtSncwZVUwOTVTSG01SjlxamdGV3JaMTlPYWVjM2pZSGxp?=
 =?utf-8?B?M0hBWUk5N2tJbmhMU2h1UkJ1eFpQOUpBMWRKelZlbXV1OEVmRDFoQi9oZ0JZ?=
 =?utf-8?B?VytHSWd5S0hTNVNkWG8zMm5wZ1JiUE4yM3Q3NnhTd2xHTlhtM1IrTmxsWUJk?=
 =?utf-8?B?YStKZ1dMWC9QdXFuZVB0T2ltdlVxQTUzU3lUZTdRZndQQWgrSnJ5WnlUckhH?=
 =?utf-8?B?RGZ4MTIvRUd3Yko4MGdKU00zajB0RzRMY2lxZmpsc2xCNjQxMkw1ZWpMaWw2?=
 =?utf-8?B?NFo4MjU0WXVlUi91dHluK1M4cmV4aGVoRGlBd05vT2NwOU94WFFXTWNEeG05?=
 =?utf-8?B?cjJuUUVHQ3VFL2hYaWMvamxnTHJReXUzLzlGQVAzc1VvOXU3RTN5MTdtaHNz?=
 =?utf-8?B?OGlpTFpUYUdwUHlkbkZkYXBpSGIvVStmOUNzQkFWQjJweWVlN3ppTmtYaldJ?=
 =?utf-8?B?NVZvY21iVkJ4QVNtMUUzNXFiSUtFWnh2ZmJ3bmtCREM0dGRRQkdmWFlIOEhu?=
 =?utf-8?B?R05uZ2M4ZjFVL3RkQ1dUZktBZlpobGFERC9LbmRLYzZjRkd3TFV2c2V1Rlkw?=
 =?utf-8?B?VFlLbFRydlVDbXNubThGR3o1Rm9oY2MxSGdEb0YzRGJIbC94MENkSUZCclRI?=
 =?utf-8?B?VEhhaFVvV2pyQ2VaQjBWOGgxWmw3OWh1eTZ6bWtsZWY4Y3ZLcnlaVmlVUDJr?=
 =?utf-8?B?T3VmaGI3SGVzK1hTemh3STRjYXlxVUM5K1h0NHdsU3U0NEc0enJSUHNJTjli?=
 =?utf-8?B?UzNTRnJ0ZlQwQy9wVlZKbXpXMEs2aWgrME0zMlI1YlNmYjhQU1ZRaUxqYkN1?=
 =?utf-8?B?dXlsckI0MGJGNjRMKzJTZHNIbUlRd2tRdzMvWGtpQzJXOFBQaDlockxOajk4?=
 =?utf-8?B?MDJGVmpmdWNkS29LU2M3RE5vKzhVcUV3NU5uSW94S3YxdGxSWHVhT1lLSTla?=
 =?utf-8?B?cit1ZVpabDVha2ZvUlIwNklYbW0zeWRTdUdpNjJJWkdLbnhNbnB2TzNLVFVR?=
 =?utf-8?B?aWhhMERweHdEQkdvSm44UDhWNHZiL3hNY1VlVkpaYVF6UjVlR1IyVVN2WU5u?=
 =?utf-8?B?bDhyS1Y0bnJYTnNPNGFlTzlLSzduenBIcnllbHlJQzhlTXZpQ3BwNmJSZ1Fm?=
 =?utf-8?B?SHpmNW5sVjd6WDZxQzNPdncrZ0VOcE9JWVY5aDIrVFA4SG1ncm9XYm5jQjdu?=
 =?utf-8?B?RHp0UUpaN3pESmMyQ0I5L3lkTFp5UHk4SFgwKzN3K1IrMEYySE9zSlJYMEdM?=
 =?utf-8?B?ay9ZWGMzZDgzdloyUDlRV0o5bExObXJZdkRnTWRxMTBFSzV2eTdoSnRjUGlt?=
 =?utf-8?B?L0EwbzZSalN6MVJQM2l6TGtEakRwZExwWnZwWS9hWFhMRDZkTlJjRTl5VlNS?=
 =?utf-8?B?V25Bamh0ajU3YTRwOFZyVG4vazFoeEdmYTlhUkpUYUp3WE9MeVpQOWhINk8r?=
 =?utf-8?B?c0wrOW90aHJYYWZIYVMyc3lSaWI1b2tlL1lJUkV5cE12WWhoamFlbU5LaWV6?=
 =?utf-8?B?c3J1SGEwbFBIUGpqTU9iR01FaXMxMFVhY1U1MHlMWW1ES1RmWnRFY1owc1Iw?=
 =?utf-8?B?NUh6U2MzV3ZsQU5Yak9FbFovb2pBdmhZNHVvaDlOYmluWTg1U3VCcU01Z0hR?=
 =?utf-8?B?MWdCRVdncUszQnQ4ZUMzRWpuWkxWVFpZL1pnTUNFTmU4NE51aFB1NlJGTFlt?=
 =?utf-8?B?QzFpc2F1Z3VjQTJhYnBvLzlFa0I2ekVFOWtpWFVya1dYQ09rOThCTzdhOHZw?=
 =?utf-8?Q?/5rRBT?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <521DFA59B168C34BABE4B7A9A23C2641@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9000
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	980aacd0-7a36-472d-3133-08de21bfb9f7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUE2VVBnaVB0cW1rc2dnNy9vQ2hkZ0R2V3VDb1hWSG5KVnpPVzJaeWRtNDdS?=
 =?utf-8?B?NDdod1pjbUtFM3VQSVZuMklkTjhNMFQxNk1kM0VKOU5nZklJcXFtWUx5aHhr?=
 =?utf-8?B?YU1KekxJYTdIcUpxN1JIbXFuRWw1N2RiRGhVYmdkYVhUNXAzUUFGVUVEbkZw?=
 =?utf-8?B?ZWdpL1JBVnl5UGFpY2lTQjV1SDE4dmdzaXVjS3E1aWg0NEwwcDBKYWlPcTRL?=
 =?utf-8?B?TGR3cnQ1dU9yR2ZBTmRFcEI3N292ZFNUejBWZ05rOWxPS3haY0pSSVp4VWc4?=
 =?utf-8?B?NHBIcjgvU2tLYlFoYk1QRjc1VTRHSzNYY1JGQnUyNTMxb1h3UHdhdDRvbWZl?=
 =?utf-8?B?b3FYNC9ud1QrWVlGYU4zMGlxK0JTZU5zTmhwV1VRQkhlaHlncGVTTVMvVU4y?=
 =?utf-8?B?MkFwWkFzbTRvWkNhOW85c1pGNXRPcVpic25hUzhIbG5tbFVVVVNZZHhJOStR?=
 =?utf-8?B?cHdyMmJJeS9hQUxoVVp5c2pPbGFzTnpDbFNoU2xxK21aeUVvL3Q1VHRRbWNJ?=
 =?utf-8?B?emg4NzZXaVV5QzNWdzNGbWFxUHFORGVCQjM2R0h4KzlzeHVuMjlDSFlWTmt2?=
 =?utf-8?B?Y1BCWm1oVDBDTDliaGRiTDNpVVlET1BlMXBYZjJpZ3RsQjd2bzMzMWR1ZEh2?=
 =?utf-8?B?c0kxRkdkOS9iOEVodTdqQVhzWElNek5ya2UxU25PY0pEc1A2VEQzL0lwUElu?=
 =?utf-8?B?dE51c0E1Y0RQMmJSOHc4QndYVlU1SG1xVGV1Z2pQUU1mdnJHV3FMT2U0RGpU?=
 =?utf-8?B?Z1lZcHdrM0JONlRja2UwUllXZW0zbVhXUUh3Q0NhZGZyWnNTOXdnZlZpRi8r?=
 =?utf-8?B?UGM1Z3Y3ZmIyK1FQOFZnM2g1UVl0NU0wZGFjRGhtcDFDckVJeG5vM25GNFFt?=
 =?utf-8?B?SDdlUE1zUW5jVXBMdTVocEdDNTVQVGV4T29Pa2xoY0F0NVM3Y3JEaUtVUlhY?=
 =?utf-8?B?TytUTXEyZWh4Vm9hWWg3OS85Nk5tTTl1bW1RNVRrbWc3OGZZd2oxOXBXd3Vo?=
 =?utf-8?B?RlZONVhrZldiK280NG9Ma0VNS3dqWk8raFRLWU0zWnpVT2tSRGNjN3BIZEhQ?=
 =?utf-8?B?a3BhalZCdVdjODYvQlE3SGlFcWlEZ3VxSVczYkhGZU9RVGF0OTJnYk05WVB3?=
 =?utf-8?B?V1VpS01GZHpFVkpwWTVJR2JOYU9wVVFYc2hVb0hxTmZURTlIR0gwR0syVGhr?=
 =?utf-8?B?WXpCams5TVVGL1piSHMyRDVBelNCY1pHOCs4TzR0cHdBaitRR1JCZ1lZM002?=
 =?utf-8?B?SmF0cG4reUFNYWhadERHcmpFaTJDVE8xMXphTktrenZuWW90V050aFZzNUs5?=
 =?utf-8?B?RWhveExuYXM0K2wrZkx2T09OdkN3QzArZDIrMi9EcHFINkFkaDlUSjBFS2J0?=
 =?utf-8?B?aWoxRlVvVkNGL1MxNEJRNzVpWS9YWUN0U2FIRHdLa3BDa1dVV1k5REFZZm8y?=
 =?utf-8?B?bzBCTmc5aE94aVJDZk52ZTB6MXFORWJvaFIxcU5MeHJGV1pJcFNpemRaOWRj?=
 =?utf-8?B?eHUvU0Q0V1JzMGt2MEhaaXRUUUpNZ3ErZ2xKSmFBL29LcUJWOHJQZlFTZDBi?=
 =?utf-8?B?Uzg3UFJKcjRXNkt1dTFML3U3cjJSUFF1dGpSTGkxcFEvSlJKVWp3OUhQTHBq?=
 =?utf-8?B?RTFBOE9Bd3hrR2t1eDJWNmcxZVRzbmlpWkFOcEdmQ1I2UVppb3ZpKzFLK0p6?=
 =?utf-8?B?em9MbmpmZFJGNjhXMUIxcWxSa0RHZnV2Mk1vK09laFNGVXVybFZBVWRNS0hO?=
 =?utf-8?B?VWkwWGFzalNtWXBmT21DdDBZNEF5T1VaSUNoZHU4aXZoUDV3UVVqZlB0UHZO?=
 =?utf-8?B?b2FlYTMwQ1YvanVOejlmN2JOK1lmdE9JY21HMU11UDdMV29wWkJpZHk1MVYr?=
 =?utf-8?B?aXJUTWJlZG9LS0tiRUNNNHFQRzZwZTVzTUl2NDJiWExNUnJhendNbWsvczlQ?=
 =?utf-8?B?ZHBQUjhYd0xrL01WNy84YzRpb1IwUWR3VHdOaWVYU2dHaXR1RjJ0WVdHVVha?=
 =?utf-8?B?aFd5UFI5S0JieUR6Mm5NcmhSNU9JczU2bzBzS2RtckRjWHJQaHN3ZkFBOFhR?=
 =?utf-8?B?K1hDSVBLMWtvbDhocFYxd0hJdGJWMGlmTHFwd21iMWNwemNRT1NieCtlY3Zr?=
 =?utf-8?Q?Ru4M=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:48:02.8359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a90795-286e-477b-ad20-08de21bfcf0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5713

SGkgRG15dHJvLA0KDQo+IE9uIDEyIE5vdiAyMDI1LCBhdCAwNzowOCwgRG15dHJvIFByb2tvcGNo
dWsxIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gUmVtb3ZlIHRo
ZSByZWR1bmRhbnQgbG9jYWwgJ0RUQl9NQUdJQycgZGVmaW5pdGlvbiBhbmQgcmVwbGFjZSBpdHMg
dXNhZ2UNCj4gd2l0aCB0aGUgY2Fub25pY2FsICdGRFRfTUFHSUMnIGZyb20gJ2xpYmZkdCcuDQo+
IA0KPiBGaXhlczogNjZlZGViMmUzOTcyIChhcm06IGNvcHkgRFRCIGFwcGVuZGVkIHRvIHpJbWFn
ZSkNCj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVr
MUBlcGFtLmNvbT4NCj4gLS0tDQoNCkxvb2tzIGdvb2QgdG8gbWUhDQoNClJldmlld2VkLWJ5OiBM
dWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCndoaWxlIHRoZXJlIEkgbm90
aWNlZCB3ZSBoYXZlIERUQl9NQUdJQyB0aGF0IHNlZW1zIHRvIGJlIG5vdCB1c2VkIGluIHRoZSB0
b29sc3RhY2sNCnhlbi90b29scy9saWJzL2d1ZXN0L3hnX2RvbV9hcm16aW1hZ2Vsb2FkZXIuYy4N
Cg0KSSBkb27igJl0IHRoaW5rIHRoYXQgc2hvdWxkIGJlIGFkZHJlc3NlZCBpbiB0aGlzIHBhdGNo
LCBJIGp1c3Qgd2FudGVkIHRvIHJhaXNlIGF3YXJlbmVzcy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoN
Cg==

