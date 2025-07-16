Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4295B07EB8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045668.1415878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8by-0002B7-9u; Wed, 16 Jul 2025 20:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045668.1415878; Wed, 16 Jul 2025 20:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8by-00028v-5i; Wed, 16 Jul 2025 20:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1045668;
 Wed, 16 Jul 2025 20:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8bw-00028m-BI
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:20:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4755a8e0-6282-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:20:14 +0200 (CEST)
Received: from BN0PR04CA0135.namprd04.prod.outlook.com (2603:10b6:408:ed::20)
 by LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 20:20:08 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::aa) by BN0PR04CA0135.outlook.office365.com
 (2603:10b6:408:ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:20:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:20:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:20:03 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:20:03 -0500
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
X-Inumbo-ID: 4755a8e0-6282-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eads8lJvvvPXdJm8U9MZTIOrAruXqc7DNDwEjjb0guo8nxHfE1/n7WNuNsVqz768cs0Khi/o2SuISut3SJupI6C85oUIMQwkpT8cGVu5dOBulDuo2ilsxPZc4nux2QvhoQcvLR6DkG2C4ejnuNeApUNYKsC4Q8ORL48z+MQsgR5A37BTxpvTnlI4dkDY5vvfxgqkjyGrrzPTB5FSrEJz/uJ+8jIstzSFGAf6FdG/C/SUI/JdT49M2PoEinwRQ92sQ9UpRa+hNXeSr2Ch2HwFqHka7ZfrELoJsqqh9qbP3MbDkPmXVzlqnhFSV/4PIB748J5CvULq6nlc90NP9OpRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx7mFybjmz5F3bu4/yKVCdmSRqcuMxw3jjYWyVz8q+o=;
 b=tg5SAGEK1ij0PS5sZaDsp6Vl61ONps8yKIuPVSw4Hxq5JaAiN7+yFwYJzCqVH5ZygJunB2O9qszQSupyj03O6h6Zd9DrIQfrllevKSPvmAQgnXmhYn4wx0T1YqY3CDMXjIbZzPd82IfCYaFzvlVf0Ej/MSUdB6Md+zqqQMJt9ZGDAOH2H4+vTF4K5jh8mdfpI8vPfUyeiSOar3WBRdtV83NLrtvp4fb8V3lEI20hSS00ILJi9l2CYcmyKtbcpwKposU9ThpPvUHULe5H6Ae8hBwV7zqELQXf7y9RK3DkzOUZ7NDswQidDGiBJLPg7Tjl+DFgucmSBX3/Ig9lr1WkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx7mFybjmz5F3bu4/yKVCdmSRqcuMxw3jjYWyVz8q+o=;
 b=uHXQnQoXXc+B49gNumcWVK32c2GwWWdJYwGP+2FuGXWonIwF2wv1pS3z1u6tvVdD7lmc3v1tA/DpczDSGAtTJATbIctDtOQsfbtA9UScqhVeihopXQha3OIuCLOfzGbFZTIu96Pjm0uFCeiW88iPW0uR+pLZiEZw6v5BJRX/jDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b905a64f-4c61-4740-aeca-96f8305f9cda@amd.com>
Date: Wed, 16 Jul 2025 16:13:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] libevtchn: add O_CLOEXEC support for Mini-OS
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|LV3PR12MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e60dd9f-9e1f-4106-f212-08ddc4a62888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0syZjdSK28rRG5GcVh5aUR0bElvYWFyaEZvNXRINXdqZFBERkJicnJxdVlB?=
 =?utf-8?B?OHhyTUNEZDRLR0JMSWQ0SVg0MzI1cmtSYUp5NVpNYmlpYnBOTmx0R1QxSGhH?=
 =?utf-8?B?Z3hSZzRGb2RtUjJnSUg0TU95bTdzbUhzNDNEUlB5VnpEOEJ1cFJBNHhJOTA5?=
 =?utf-8?B?aVlNVm9nNDBHNFVQZlVtZXo5dlpCR3FXa01XOEZ3V25QSE0zUnFIMWZ6U3R4?=
 =?utf-8?B?dTEvejFFd3RKWkFYZDE0WVk1ditKcWxYSlZqT09tdURMbkpmY1JralhyeWh6?=
 =?utf-8?B?YmhkVkFSV0tlaUtRNHNubnlZVzk2aDI3azg1YWptb0J1LzRtaW9VbFZJeG9w?=
 =?utf-8?B?QmlmQzd2TzdQUUtwM2FBL28zWk5leFRDWDVKaG1BOXY4YlR2MDZlRlpBdGRh?=
 =?utf-8?B?WVFLMkhLOVduOE9SNXdsR3c0TWJEa0RxRG93TFMydmxDcGFScExDOWhHMld3?=
 =?utf-8?B?Mkw3alN6VnVRcVFhaGVtbFlSd2IyWEVDNi9keWdubFBiTTVod2ZmYzlXWDlZ?=
 =?utf-8?B?YnFaYXBVRUdabTZFditiTDFkejkzK21hS0NyVXhjcm43QlU1TnptQ05PeFZF?=
 =?utf-8?B?RDM5WG56RWtydDhuM05BZG85cVlKVmorUXdleWNFNnFpYSt6WVR4bEN3S3pK?=
 =?utf-8?B?czFYdzU2L2ZzNDljdkUyMEJUamgxWUNzem5DR09zMFUxbjg4dmFibU5qWkpW?=
 =?utf-8?B?akFqM09NeUZuVjQ2MjVtNVNJT2t1cXdNdzVOT0Z6Q21FY3dJT3QyRWZScGJP?=
 =?utf-8?B?SHZqRW1LK1M3QmZGem9XRVpGNDRaTzNuMVdPUWU5T21DTkpmVDg4L1ZlVTFT?=
 =?utf-8?B?bjFDK0FxekhzVlFlajNaNTdrdkVFUkxxSWd2eFl2a1pmQlQxbFdyakhoa05P?=
 =?utf-8?B?RzlDclRUVVFXbFFaR2JqQUNLQlpmQWo4bFdkMHJMVERTKzNBSXMraVZDNCsr?=
 =?utf-8?B?RDFTR0V2RkJHWERDaVBxeUN6RnZKeGJxdFJKZDBMRTZsaDhWWjRVM0wvOW5h?=
 =?utf-8?B?Z3dvS1VPakhudG93RW5rNkUrWUR3QkhZcHpkWDhWYjBlbFlkN1dwQ1ZUSFdI?=
 =?utf-8?B?VnhQdFFQWXVXS24xWXpXVi91RTJSbDRJWVAyc3M5ZmJLM2JseEo0K2pQN2dJ?=
 =?utf-8?B?b2lQbStRMzZhc2JoSksrYTRmcDNsRnpRRW01VHJTeitYQzFLKzY5Y1d3Ukhq?=
 =?utf-8?B?RElUOUlMUjZtdVpGZ20ybGlha2NrZWtTdCtBTTFiWURnTTN6ZHNHMzhhQWx3?=
 =?utf-8?B?RDJSNWU4Wm9nZ25qdklZaUpCZGJia0JRV2pjZGx4a1h6am9KaVllaXZmaXBV?=
 =?utf-8?B?OHZIaGF1NE4rZ3NqSVp6UGh6S3JJU2lHekJNT2tsSDI4SE0zR2FIaEsvclNR?=
 =?utf-8?B?aXJZS0dnRlJKVm9CREtyN1VyM1FSVVdaL3duMzNTRUhQMlZTR0RzV05VTEVz?=
 =?utf-8?B?RTQ3UUh6MkxhVFZsRzFFbkt5NFVrN0VBaTYvNmpOSXVtRXFlQTJvZ1JHK2Rq?=
 =?utf-8?B?L0lnWkt0eDBmLzQzU0loL2NoK0ZOeWFueVMyZk10SUFLbThXNlJkeVFUcURw?=
 =?utf-8?B?YTRsMld3YTludG5lc2xBTk1RVG5TZ1B2OWl2TEtKWXBnejRRMkF0Mjk3MlIz?=
 =?utf-8?B?ZkVqazRHSm1zSW9oOXhPVnBwdkRvNjJqODhkZGdjZ2N3bjFtZm91TmRzYy9r?=
 =?utf-8?B?YWN0WXBPaEFPdEVNUUEzbE5VZnFlNjdiOVRKelZhNzdsVHBYWDFwQW5FU00v?=
 =?utf-8?B?NlhxeXEzUzgxNXMrWDFXZ0hPZS9Zcnkvd2xGNHRzeXRib01KemZGU0FlbVVE?=
 =?utf-8?B?MEk1SFc1a1N5R1NMU0tacmZuWExQblhGbE8vTUVsR2ZTNGxZRHNidWZHV3RB?=
 =?utf-8?B?WlFZNTlEVHVycVEvcWhWU0wxOWJKK211TkFtTEh4VEcyNUtlSzFlOWthZjQv?=
 =?utf-8?B?d1NSS0oyQWEzU2FwaVlFV0Qra0ZJU0FVWU9LTnhqZ1dZM3AvSmxwUlp3MWJO?=
 =?utf-8?B?bmROZkZoUWtINlhadGkzZzdDZlF6cG1tOUtwU1I5c3lXOW9ETjJaL25LZTdP?=
 =?utf-8?Q?ANTwCl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:20:07.9723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e60dd9f-9e1f-4106-f212-08ddc4a62888
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404

On 2025-07-02 04:12, Juergen Gross wrote:
> With Mini-OS now supporting O_CLOEXEC for the kexec case, no longer
> ignore the XENEVTCHN_NO_CLOEXEC flag in minios.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

