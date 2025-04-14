Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B803BA886EB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950672.1346919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ld2-0006Y2-Pa; Mon, 14 Apr 2025 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950672.1346919; Mon, 14 Apr 2025 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ld2-0006VT-Mz; Mon, 14 Apr 2025 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 950672;
 Mon, 14 Apr 2025 15:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bm2T=XA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4Ld1-0006V5-3D
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:21:43 +0000
Received: from outbound.mail.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28864107-1944-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:21:38 +0200 (CEST)
Received: from AS4P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::24)
 by DU0PR08MB8445.eurprd08.prod.outlook.com (2603:10a6:10:407::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Mon, 14 Apr
 2025 15:21:34 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::4d) by AS4P195CA0047.outlook.office365.com
 (2603:10a6:20b:65a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 15:21:34 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 14 Apr 2025 15:21:32 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB9392.eurprd08.prod.outlook.com (2603:10a6:20b:594::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:21:00 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:21:00 +0000
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
X-Inumbo-ID: 28864107-1944-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C0e1vRTn3150nxlNbDlsPfNQcLo36OneZiXwW8Zmcaptv9OwXRy7lif6g2pxUxWr6VswEwhg1A/G42PxnLKsk3vnAIhNHgL0ZCi8P3TjlcJiN16Krg4IN9wuLpJTlt1UA/4F/+cDRX7MICjtgGjm8tmv8FJ0OJcG83k49+OGdYYmyS2KQxoq3IWBxkqQRAHChRCrf2R6O4JQrG2UZY4HgFsdpTQcArsOHojHM65/yZHR7hc1cCM4M60FxeBHUlIvBXbUJHBLG1efGXEAXOndUYvPENpw2VtDTlaaBdUtEHIN3SCyQAA0TK5e4Juebu+kmuK26Om5vb1QGrpoYSl6iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJtGkPvDkxhK6OHak/6MJ9rzmbPmzya5BKyZyO8mUIY=;
 b=H/xaxA1suAFYIWWD+PrGLyOiQKTW5xUJ1m6OgzlSX46fb+PXvNwRLRXwWDgPARsAAS4hzQaxNqjoYcmkEIXsTiA9UQxG+c2rBKUOsSjGC6rX7T3I19YH8vFDW7Ck7L8g3NgOD/PAcPHfu7lEj4ZDE979UD0hvIqVo4z/BRDIlh2xQlPp0ouu4V+iKEfBA6QF0O55+VjxY/NNGrCR3QMfgktLxiId4oW9xhcYjIKm4wpcGW0Zh5/B0fw7q+iQNyBK+100AW+uG6SL3p7RF/xIOuQ9J7a1U5j7DBCvT97hEYY9/Q6SptRd9z7rYoyArfHvKuX7dMdEffxekLVSON05jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJtGkPvDkxhK6OHak/6MJ9rzmbPmzya5BKyZyO8mUIY=;
 b=pO7FIirRVn7jxTNmd90CfSUf4nb7LLOuNAIGVg6FWkggeekZwwYv5IHotg7b86YA5K9+3zgYn23GmtEaAr6mV00Zpf9arRlGzSWBTKCZ7j52c7x7j2Y7psfyFmteSP2TF8o3oQofvx8GSjQnZK4oilG4YV8rXzDplCjZGmISXdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzrQBe5k2hXZpB9twZv73Tb5ncZgouCSQEzmjyq/6GMDgBO5toW6BClUMe/PcOkHn3YMBTd5iNoHm+cJqtCshZb1d0Dgnf6aFqoQb3qhSNymfxFJAXuukk7LROxoAyJWCjreKZN4vPdKvpcOcPXjv7PWE8dd8awS1E9EHoH1Lj7SjK3DeZgjuwF4aorDVhgnBF4TtRWcm9ZkvVojLFmIxhLtrOu4gpdi/dF4oHQP51nAsg5ozvAXbwdSzMHzRo90vbJnt8MROflftkDbI9Ja9NYY1xp/ANo5fjAgG7zJ4CgGBPrqpWZuKgCh3YE6KLqzuvj9nj+E999rGCSQVFWoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJtGkPvDkxhK6OHak/6MJ9rzmbPmzya5BKyZyO8mUIY=;
 b=gb0JqsF+qXYwe7lfKvIxJ7T8CizARMCGXsLZB/LspRjPIYUbMf0ZH8y90+Z4c2Ua9nDtl4AO7CeL8n+kyb3DzEbJZbpU4tNgLmwFF0+0sTS14ufnHHwtwuv0LLuIT+qjYAzACgO5XiiRTxKR1D5W2rnuwJ1OcbMf7fwfazS4SV2a9JSsFoZl6X2vDjHd2tzsDjONdU946LkgrHKh7PNRoihr8BwHZf18KMcpriEv3KK6/adQpMSCTcmDBGLkn/Vkt2QAIPsTraO29R7lF2uyy1mak1jbgfnjM5gxcey5hDk2wSaH8wxe2Yfcgzbo98bI/3sNNxaqILFmxUNeklyN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJtGkPvDkxhK6OHak/6MJ9rzmbPmzya5BKyZyO8mUIY=;
 b=pO7FIirRVn7jxTNmd90CfSUf4nb7LLOuNAIGVg6FWkggeekZwwYv5IHotg7b86YA5K9+3zgYn23GmtEaAr6mV00Zpf9arRlGzSWBTKCZ7j52c7x7j2Y7psfyFmteSP2TF8o3oQofvx8GSjQnZK4oilG4YV8rXzDplCjZGmISXdU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHbqvIQP3h8YyZqYkSDv4tGWZWI7LOi9uCAgABMVgCAAAL/gIAABWmA
Date: Mon, 14 Apr 2025 15:21:00 +0000
Message-ID: <D1EF4CFC-9DB2-4A1C-8224-AC349F132FCB@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-2-luca.fancellu@arm.com>
 <d323425d-b266-49d6-95d4-0e1acb5e489e@amd.com>
 <FCB86533-FFE9-4A79-AC8F-E2DBA2B1F553@arm.com>
 <d85090b5-43f4-41dd-a423-ada90d572001@amd.com>
In-Reply-To: <d85090b5-43f4-41dd-a423-ada90d572001@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB9392:EE_|AM3PEPF0000A796:EE_|DU0PR08MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b68747b-ef36-48f7-2089-08dd7b6809bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TnBYY21EVmlYRnpvaGFadFFSUGxiUCtrODl3bTBpTVRoOVdkU1pJaCtVK1Zn?=
 =?utf-8?B?TVpXRHRGVXJta2FKZVltb1pVMXpSQVdHVDNNcjl4dzk1SFRBeHFFU0VCa3NZ?=
 =?utf-8?B?Y3I0dlFyZFZqeFM0UFg5RWNjS2l2Z1JsSmdjQmRRMXh2Qk9Ka050NGhWV0x4?=
 =?utf-8?B?UWxMNjNuQjIybGU4RmNQKyt4SkRCZ1Z1QVo5S2x2Q3VleDVFYjV1OGhwYlBL?=
 =?utf-8?B?ZVJDU0RDRjFLWWR0RGczYXNXQkdaWDJTcVc5Z2dnUzVMSjUwbGFXYnE5S0lh?=
 =?utf-8?B?V2pyM1VxSDk0WDNuTjVDNFhsMzltUjFjUUVOTktDTS9WaVpwRU90SmN4VHVV?=
 =?utf-8?B?cXJ4UFlqR2xhNEhSRlhsNldiOFpGeDJsNmVWVkxtQks2bjZZS1pudTJQTURV?=
 =?utf-8?B?bnhlSmNwOS9RdE9ob0YvV1NqS0NpZjFOaGFQQVJzTWo1ekEwQzU3M1BtK3Iz?=
 =?utf-8?B?ZThrdUpNdXpNeU93WENKUkp2c0hyWUIwakxsOXhxYWozWnRVN1dxcjRCUHNY?=
 =?utf-8?B?RnRGeHBzek5nMzl2ZEFlWllCaERGQkRkTVRsenhqWExjem5lb3UzUTJ2R05J?=
 =?utf-8?B?b0pyNEtYRmtWVVk3ZU11cnBac3VCcEhSQlVMeGkrdVRIc0FJdENQRUQzVk9N?=
 =?utf-8?B?Zm9iZHk4SU1DRlFZbEUrSlNscHpyQVQyQ3pYUnkrMWN5VTNMUFpvUnI0TTFl?=
 =?utf-8?B?STJ6MWZtekk3MWdVZHROMi9XWWlsRnJTRW8zUHRYTjBpK1UvenUrQnRXRXpB?=
 =?utf-8?B?SXZCR3JzQzVGMERJRzVwNzAxMWtpbVlDQUoxMFZob3NLOE1scTgxM2xZMUh5?=
 =?utf-8?B?NVY0MkxnT1Q2UFJvVWxWSjEwUlgzbEV2YlZlLzNuSDQxZkRGejJHU2dwWjV3?=
 =?utf-8?B?NUVLd0FXcTZEU2NqUlJBSGFTbVZicmFTV3BUdG5iYlR1RzM3UElCdmd2V3BV?=
 =?utf-8?B?bmhtVmxyMlY3WVh1VjRRRTErL3h2bE1KSUVCUXlncHZsM1BzamFpNHVvVGw3?=
 =?utf-8?B?TjI5UnZsK25JVWwycUpjZU5CN2NwT3h3TXY2MXIxbnYwR1J5Mi9KcWpmRGFO?=
 =?utf-8?B?TE1jU0pLUnFBMUpwTG1NdW5Sejc0Sk5hTXpwcDJVeWkwd1VOaVozM0Q1cTQ5?=
 =?utf-8?B?Sk9JRldCbUxVSGsvWUFWMUhiZGM0UzVRNjhpK0kzek5uQW1ZM2pldTlBd2Qv?=
 =?utf-8?B?MGpRcFhoYUJyZFZScjlQVnBUdXgwNlRKb0t3NlBUdEhpeXpXYWNyY0prckpH?=
 =?utf-8?B?dWJ1U3RwZTJ5b29GVzA2a3B0UDh4eDhERy9sNWlvaTgwMFE2QTFGR24xbnZB?=
 =?utf-8?B?bzlKdTZGZU11YnRDSXVwRjJTUFZTTWVSaStnSWF4MW9td1J5amE3bnlROUJD?=
 =?utf-8?B?dUVOZ0dEZndBVWRuVTJWWWJ0VjVhQi9zWi9NeEJxdlNvQWRVcVh4RE9aMUUw?=
 =?utf-8?B?eWd2RjFYZE5jVnBiUDFWV1dLZjgxU2RORkNHYS9IR3N1Q21OT2VlRWU4VEVz?=
 =?utf-8?B?SVhUZlRydzdGY2hnSkZiY3JRemN4UHFnSU9HUC91UUNkbUdXNmVneEhoK1Ux?=
 =?utf-8?B?YnZxODV2alhFRmpiaXh2SnRBSi9yREtVTTUwQmlCM0FGcU9WNXMwRk1oWTlv?=
 =?utf-8?B?V3FGQnJzM281N3J3NUkvemQ2OTV5emxxRDlRaUlPZVlmVkNndTRTR0NMbjB4?=
 =?utf-8?B?bndMbVVRZTkxQlNtV2F1OFBWQ002ek5OdFprQXE3Z2FybkpDUktEOFg3OXZm?=
 =?utf-8?B?SXpDS2didnhNcFNRUEsvU01MNDc2dUJrUUR5ajhhUExuNkw4ci83eGJPT0hn?=
 =?utf-8?B?SVpZc3NXS3l0VFhnUk82UjNMWHplMEltNjF0eEZoZnZXdjNBblRDZm94UmdY?=
 =?utf-8?B?QVdSejBHdFF3RkdUcXB2Q2hXOE55cTMxaGVzSGRlamt5NnowcFF3ZUtNcmly?=
 =?utf-8?B?aE1DeVRLZmZaZURPekJMVkxQVkVwQVdnMHd6L01tRDk5QzJReW5TU3Bsb2JN?=
 =?utf-8?B?elpVcUpPOG5BPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DC720B0F9F0C340A69D8D98F48D308B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dbc0670-4a34-433f-8ed8-08dd7b67f65d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1YwRnl1K0FmMGd5cEJIdVFlWXhmZ1J4eWkzRmd3SzBIMTNRMjF4K0dpTklG?=
 =?utf-8?B?YnlhVHIzOTNTNXJmRWZPWmVManNWOUtkeEY2bUdZTFNuVWNxUzg2YW5QdjZF?=
 =?utf-8?B?dGM2REJZTzFTcEttdHFJdWFVb3hsNDJwNkkwTFdWTHo0L3U5T0VpbDVxVE5s?=
 =?utf-8?B?QmUvMnpTTzAyYnFFR3pEZGhVRVloSHh4WDRqVHFPKzFyWkZ6VTIzb1Q4K2l0?=
 =?utf-8?B?Z0p2S3lFTXZ4NDJuSERpWUU3M3o5dHZsMmJxT01TODIrNWJsK1MwZ3dsVktF?=
 =?utf-8?B?ZnRVbXQzRXUvbGk4L3JQWkoyd05OSU5UY0l2dDdOL3ZCVVQ5RnBGeXFYajlR?=
 =?utf-8?B?WkxLdUtBa20xcW14Mmk3Vlg5Y0hUaEtnYnovK042NTRvb3V4T01ZbGJ2bVlD?=
 =?utf-8?B?R1d1R2p3V2RXdWsycEhqUlVEVFhSV0p5aGNERGFxY3VBWXJ5QmJuRmVudEVG?=
 =?utf-8?B?TmUrY1VEVnB0b21ETE5ERXkwWE4veDhMalBOUXpPcHlaQ21qUG9VOWNERkNK?=
 =?utf-8?B?U0Ftd3BpTENBUS9xVzFybmorZ091Tks1MnFtLzNEZkhWQ09taGg2WFJCemxh?=
 =?utf-8?B?UXExWmxZVTVRT0JnM203OEVDMWVYeU8yc1ZpLzhVajRpUy9iL0lRcWVOeStn?=
 =?utf-8?B?VytFVFlyUTB2WTFiYklSTnFScUExUFhQMEsyWStQZ2lWOXZuQjB4MnM5L2U3?=
 =?utf-8?B?WjZTN2lnTjZrNDRVakdxTEMxVTdCbkVWU3ZsR3dXYTlydXQxdi9pRUg1Mno3?=
 =?utf-8?B?Q0V1QmZPbVNRRFJpSmlaZ25YOS9lNDJYQXczSUwyRytjSmRxcFY2cEtldTRJ?=
 =?utf-8?B?VWMvWk9Jc25Mc2hWRUhQRHU0N1krdGNZajArL2t5M2pCdFpDQXFpS1RsMGEy?=
 =?utf-8?B?UXJJVDNBWXpmc3RpTlA3MS9WZExEcG1SWnVYZ2g0T3BIY0F6VWMzZHFkeEZo?=
 =?utf-8?B?K20zZk1lREFYLzdLZndtMXpvWEVDS1JQOE1zT1I1eXFTa2ptN3U4bjg5QzVh?=
 =?utf-8?B?b1MrOVY4QlY5UDlVR0ZMc2E4b09kdU50ZGN5K3RJbVJMT1lpaGpGL0Y4OERG?=
 =?utf-8?B?NUI3cUVQc0kyaEZaMmd5WlF0NnRxMmVMNDk5aWZUWTUvRi9RbkJYTzF5RWky?=
 =?utf-8?B?WnZPaTE3ekFkc2FmK1dnNVJ5dWp2TjY0ZG1hUm1lUkpBenQzcmQrZWRzZjJp?=
 =?utf-8?B?alFnY21CZmpmNWp2ejJLczZZS1V6RmpDdFBJTnZtbzNQbElRTStFUVFGc3pU?=
 =?utf-8?B?L0phUWpqREJBelJUWmUwM0dhT2w2V0tJMnZNK3dSOERTTy8vRVBnMmNPdzVz?=
 =?utf-8?B?ei9sMGpIb2NkNzR5RHJrcjBubUZqUllnRGdZOUd6RStGWVVmdGt1WFVvekY1?=
 =?utf-8?B?WW1Qb1pjU0diVE9wVjYvY2FyYkZETDg2UXUxNXg1eEh5bTBvbEE0elB6OVdJ?=
 =?utf-8?B?RjRoNDVIM0FEZXZYUkFiNmdwd0JXd1ZwQ3lvU3ZkdTRSSUF5RGVBL1ZDMkZN?=
 =?utf-8?B?UERBRDBSN25UdnIzTWtMNGExWjJzTUxGcnNiOTdwNy9TZFBZV0ExMFBwaFMz?=
 =?utf-8?B?MFdQSkVMNG9ZY1VlQ2ZhVTJRUTVaRUQ2Q1VocThQTEF4YlRaMDIxS3o5RnBJ?=
 =?utf-8?B?bDVNa2FRSEJRZ1VrNHYxZFZWMTludlVsYmtqb05hNllHRXo1YU1oR2lxZFBz?=
 =?utf-8?B?bE9TUGZxdDRFQ0RhRjNjdVhtUjE3Z3ROV25xUmY3dzhTeE9tYzNJdWRMNm1h?=
 =?utf-8?B?NEg0T1ppM3JveVI3NzhzS05XVFdWMTMxQjVTV2x2MzI2c1NsZUIwQkdjSnZa?=
 =?utf-8?B?RzVWRjdOd05ESWpLMXBNNDEwRVljR2VyR2ppTTR6M1E0REgwSXY2ZVVsZkM3?=
 =?utf-8?B?cys1ZllrL05Ebis3aFhmZ1NLYmZxSlZmVkRzSmR4T0pDc0MxZmVsYzRnVzBS?=
 =?utf-8?B?S05OOXBMek9YVEdEcXc3clZaVXlzWU00UzhSeG16TU1UbGoyaHVjSEhEYzJW?=
 =?utf-8?B?QWZUZGlxc01ndW5OSmhla2UxOTROMDFRaFJwNVNXTjFNUGdnZTlhOXpLbTF2?=
 =?utf-8?Q?zG9oPS?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:21:32.6033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b68747b-ef36-48f7-2089-08dd7b6809bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8445

SGkgTWljaGFsLA0KDQo+IE9uIDE0IEFwciAyMDI1LCBhdCAxNjowMSwgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNC8wNC8yMDI1
IDE2OjUwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gSGkgTWljaGFsLA0KPj4gDQo+Pj4gT24g
MTQgQXByIDIwMjUsIGF0IDExOjE3LCBPcnplbCwgTWljaGFsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMTEvMDQvMjAyNSAxNjo1NiwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gRnJvbTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFy
bS5jb20+DQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgcHJfdCB0eXBlZGVmIHdoaWNoIGlzIGEgc3Ry
dWN0dXJlIGhhdmluZyB0aGUgcHJiYXINCj4+Pj4gYW5kIHBybGFyIG1lbWJlcnMsIGVhY2ggYmVp
bmcgc3RydWN0dXJlZCBhcyB0aGUgcmVnaXN0ZXJzIG9mDQo+Pj4+IHRoZSBhYXJjaDY0IGFybXY4
LXIgYXJjaGl0ZWN0dXJlLg0KPj4+PiANCj4+Pj4gSW50cm9kdWNlIHRoZSBhcnJheSAneGVuX21w
dW1hcCcgdGhhdCB3aWxsIHN0b3JlIGEgdmlldyBvZg0KPj4+PiB0aGUgY29udGVudCBvZiB0aGUg
TVBVIHJlZ2lvbnMuDQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgTUFYX01QVV9SRUdJT05TIG1hY3Jv
IHRoYXQgdXNlcyB0aGUgdmFsdWUgb2YNCj4+Pj4gTlVNX01QVV9SRUdJT05TX01BU0sganVzdCBm
b3IgY2xhcml0eSwgYmVjYXVzZSB1c2luZyB0aGUNCj4+Pj4gbGF0dGVyIGFzIG51bWJlciBvZiBl
bGVtZW50cyBvZiB0aGUgeGVuX21wdW1hcCBhcnJheSBtaWdodA0KPj4+PiBiZSBtaXNsZWFkaW5n
Lg0KPj4+IFdoYXQgc2hvdWxkIGJlIHRoZSBzaXplIG9mIHRoaXMgYXJyYXk/IEkgdGhvdWdodCBO
VU1fTVBVX1JFR0lPTlMgaW5kaWNhdGVzIGhvdw0KPj4+IG1hbnkgcmVnaW9ucyB0aGVyZSBjYW4g
YmUgKGkuZS4gMjU2KSBhbmQgdGhpcyBzaG91bGQgYmUgdGhlIHNpemUuIFlldCB5b3UgdXNlDQo+
Pj4gTUFTSyBmb3Igc2l6ZSB3aGljaCBpcyBvZGQuDQo+PiANCj4+IFNvIHRoZSBtYXhpbXVtIG51
bWJlciBvZiByZWdpb25zIGZvciBhYXJjaDY0IGFybXY4LXIgYXJlIDI1NSwgTVBVSVJfRUwyLlJF
R0lPTiBpcyBhbg0KPj4gOCBiaXQgZmllbGQgYWR2ZXJ0aXNpbmcgdGhlIG51bWJlciBvZiByZWdp
b24gc3VwcG9ydGVkLg0KPiBTbyB0aGVyZSBjYW4gYmUgbWF4IDI1NSByZWdpb25zLiBPay4NCj4g
DQo+PiANCj4+IElzIGl0IGJldHRlciBpZiBJIHVzZSBqdXN0IHRoZSBiZWxvdz8NCj4+IA0KPj4g
I2RlZmluZSBNQVhfTVBVX1JFR0lPTlMgMjU1DQo+IElmIHRoZXJlIGFyZSAyNTUgcmVnaW9ucywg
d2hhdCBOVU1fTVBVX1JFR0lPTlMgbWFjcm8gaXMgZm9yIHdoaWNoIHN0b3JlcyAyNTY/DQo+IFRo
ZXNlIHR3byBtYWNyb3MgY29uZnVzZSBtZS4gT3IgaXMgaXQgdGhhdCBieSB5b3VyIG1hY3JvIHlv
dSB3YW50IHRvIGRlbm90ZSB0aGUNCj4gbWF4IHJlZ2lvbiBudW1iZXI/IEluIHRoYXQgY2FzZSwg
dGhlIG1hY3JvIHNob3VsZCBiZSBuYW1lZCBNQVhfTVBVX1JFR0lPTl9OUiBvcg0KPiBhbGlrZS4N
Cg0KSSBrbm93LCBOVU1fTVBVX1JFR0lPTlMgc2hvdWxkIGhhdmUgYSBkaWZmZXJlbnQgbmFtZSBh
cyBpdOKAmXMgYSBiaXQgbWlzbGVhZGluZywgb2sNCknigJlsbCBuYW1lIHRoZSBtYWNybyBJIHVz
ZSBoZXJlIGFzIE1BWF9NUFVfUkVHSU9OX05SLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

