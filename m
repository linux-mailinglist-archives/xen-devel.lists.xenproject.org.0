Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7669A9FBEF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 23:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971169.1359654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vk7-0006cQ-Eu; Mon, 28 Apr 2025 21:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971169.1359654; Mon, 28 Apr 2025 21:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Vk7-0006a5-C3; Mon, 28 Apr 2025 21:10:23 +0000
Received: by outflank-mailman (input) for mailman id 971169;
 Mon, 28 Apr 2025 21:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEkc=XO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u9Vk5-0006Zo-MO
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 21:10:21 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2417::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ff817ef-2475-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 23:10:19 +0200 (CEST)
Received: from CH2PR05CA0032.namprd05.prod.outlook.com (2603:10b6:610::45) by
 MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Mon, 28 Apr 2025 21:10:16 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::90) by CH2PR05CA0032.outlook.office365.com
 (2603:10b6:610::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Mon,
 28 Apr 2025 21:10:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 21:10:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 16:10:14 -0500
Received: from [172.25.248.240] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Apr 2025 16:10:13 -0500
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
X-Inumbo-ID: 2ff817ef-2475-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpsCo50aYompCQ8K6Wz6ZyPueCLS55e9wdCNLOVIvqZ1PaSyghF1Uj9TnAQAGSyXwaUU+ZpK8g/KK9AaZ7sW4eFXs4bPqmmt7zLf+bc+0wbF4V6sL3wIpEGIaC4W4IWVDGOAFeTLCi2OTAJiT9GSjyq0w7hWckLDaofkTWOB2+ikZ5/bIBvSu7CarjtTQsUQbX19M6zhvoWmRs1Hd9LnrBSsG039kmP3j7wgftCwwma/DbPgg3zHhsIjCkCZfE+6UCKLozWpcJ5QbCQIL+Bzu4pRSsF2NX9Xhei8O7a/RUt4czySIsVB27ylEXb9BxF7av3N4XC7nfSCHWwqhBbFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T59YqtMA9cSf61s0uNZ5bSB4OwxVG3dB8QJcEEDd30s=;
 b=ourS2DeT7Mzl2KuJdH+5Alof3v7WP2Wl7hgyKZOrO/11rqxRkByQdgSxyx070nFiujGKpyFP7gFCJOSCRgM/4di24xa+w5LX+T0iu0vmBK8RbL3eguF0DJKIuqoscd/YYzG+aPIMng2182D0AtcjTuWd3uHhlPO+dF9UwlGTldt57VS4gVO7L8EnEnPJK9zdmKi1W7+UEsb32FqlFpWzGfMEMLlxcxXzHExS1eyQ65X9KaoXQCmK5EnD0giKjDaIUvvp71hIHT0b4l4hXGPxXHWdQRTLP8g2386vz5uWQBvNQ4YCVYyKt8Jk/8l0Dci2UAjWdGD1LbdMP9y08ccVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ariadne.space smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T59YqtMA9cSf61s0uNZ5bSB4OwxVG3dB8QJcEEDd30s=;
 b=sx1jhAZYpIOAZMMWR1yvkiWeHPvCA077zAY3dhHTaS9gBdWLGlXCWCErAWQh5QWzoXDcTVS0pqndG4typquwkG0806hOWAYfSniso1NHDc6wskbYOH7QxHvFpoqeR2fqUX7MoxbOgQsa6wGpFPu8KVcDgDwLGGX1eOkKIcgi6Bg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3aa95fa2-eb10-4d97-bff0-dce96688a4cf@amd.com>
Date: Mon, 28 Apr 2025 17:10:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Ariadne Conill <ariadne@ariadne.space>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <agarciav@amd.com>, "Alexander M .
 Merritt" <alexander@edera.dev>
References: <20250428195736.2516-1-ariadne@ariadne.space>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250428195736.2516-1-ariadne@ariadne.space>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e649379-62cf-48c6-75fa-08dd86991277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2RxSVM1NzJucmxHc3VpYk9YTFNDSVdNRGRXeERSbHpaYjJvbGtWdUI0ZmEv?=
 =?utf-8?B?aWx5emhxVXRQUjZ2dmNEOVA1WTNUb1VYYjJOZnR1ODh4RTFlYkp2b3hVTWp1?=
 =?utf-8?B?ajkyTTFESlIyUTNibnpCdjBySFA2VHo3Qm9DL0lRTzUxWjZ5aHdCUVJwUGRj?=
 =?utf-8?B?V3R1MWxCZCtJR043UjIrZkNjRGpJc2NaSWNpL0lRbGIwZHNGMDFrZXIvUnNS?=
 =?utf-8?B?UFI2ZEZIcGRaZDhzeGVaQ1NlWGJveFUreStvMDFJMkcxWHN5TWJmR3hDL2FZ?=
 =?utf-8?B?SWVkTUwrdWJLSEpocUJZd3Mxb0ZBOXFqdnpJMFZhZlh5NUZLTWhVUWZnWjJP?=
 =?utf-8?B?emVMaEhZc0RxVnUrbEMyaHA4NEc0bDNac0puY3RxL21BQU5pRUVFWWc4WW9o?=
 =?utf-8?B?eEdOSU9oSUNKMklXZDBzTHh3U3JWSkZlajc0NVUvOXhnRHB0R3QyZk5NWk01?=
 =?utf-8?B?SVd4MnRhWWIvZjNIbWpzTElyOERrMTBsNWluWDdITVNsOWxWQzB0RmJFSzVF?=
 =?utf-8?B?RUlJcjBvRHpQcTJHK0pyazB1a1FXV2Y0NUxMQkNiRTdZU3JMYWE0T01VbCsw?=
 =?utf-8?B?UXhubUVPQ0MzRkwxSGJNVWFQeFJBczRKaitWeitYTXdzRWdKNWdHZWtFZHk3?=
 =?utf-8?B?NFI0VlBNN3ZaQkdvY00vNXBEbHBBaWhybEJHSGJ0YUl1T20xM25BWUc4SElV?=
 =?utf-8?B?NE9yQmRUOTRvSjlXODVqSWdERWFaaWs4SWtSd2Y3aHpmdDZQV3FvUDRuTmJw?=
 =?utf-8?B?Y0ZLTFhweVZCVEZGblhOMG5idjNYZHM1WStBcm9zOTBqd0R2aXhkV0RFbENu?=
 =?utf-8?B?ZFVvQ2NmNTk4c28wc01DU0xhSnVKTEp2N2hUbWF2OFBmRldDZGhnNmNnNHl2?=
 =?utf-8?B?TEdGOXRYWUFtU0R2MzRxcG5jWk1UWFgzckJ2MldRVXhlb3hScTRkbERjS01w?=
 =?utf-8?B?WUFYSWREUThocUUzckJjUGNNYmJVd0NUajRyRHE4cmtpeFUzUGZ0OCtaSTZx?=
 =?utf-8?B?bnJGRkJWcXJPcklpcEdrNFdyN2JOTTR3Ni8wczgwdjdTczJQdEt4Z1hZN0M4?=
 =?utf-8?B?OHQwRitpVDJSclkzaUZpTlR2ck5semFQN2gvQ3N5WUNBcWU0anhGVXc5cWl6?=
 =?utf-8?B?VENJWUFZb2thcTVuU1Q2RjdXeDY2azVxdENjUXI1dkd3STFKQzJ4VW9oMUI0?=
 =?utf-8?B?UkttNmZzZEx3ZGF1R1doL3pEem5yYm1UWjBQandEUURSOG1JMVBTa29uRUE3?=
 =?utf-8?B?cWVKMEc2SDhsREkxMDBmNWkzN1NwTXJwZnUrQkxRQWNWYXV1dmZ4ejVPUjc4?=
 =?utf-8?B?U2pkK0FzMkJFNEt3QUtSY2c4YXRvLzB4VDNTUjBWeXhLYnQ2U0kvVVdMWU41?=
 =?utf-8?B?ZUkwUFJqOVA4QnpUbGF4dklhTVhqUHg3Tk5zV3VFd3U0WTBjOEgyckVVNjN1?=
 =?utf-8?B?b0JsbnlwOGR2MUxaUEVDOWZORnVtdnhFN0FMU1h5K0NBeVdReGlmRDhKR25O?=
 =?utf-8?B?eWgvRy9NZmdzSjNVQVBvRG1BYnNQSHdSV3R3UE1uZS96M045MmZIc25QbUM1?=
 =?utf-8?B?OVdQY0haRko2SVhVY1NsdEV1bzJmUTE5Tm5RUlE4eTRUZ3JNZHhHYkprQjFp?=
 =?utf-8?B?eEI5eE1YVUM1RzBvZjBWVzVQZVFHOUZNd2l2K1F1M3hhSmVhZkZwQlVVVkxi?=
 =?utf-8?B?UlZBRzBiOXZkWjl2VWc0Qmk0bXJ6bXQ0U0g2WmpDWjZaRlNnL2NjM2pudWhM?=
 =?utf-8?B?WUFKNFNmT2hTRVBWeHhSSlNHaHNEMlhSbS9NZkZDTDdjRjVRb2NhL2ZPZitq?=
 =?utf-8?B?T05VbkRKYzVhTEJFVEp4eDlJb1pzbFRzWnorU0FYMWJqWG1TK0wweUl0WlpW?=
 =?utf-8?B?V2VaUHdYQ1dQUXhwK21uMG5HNytVWG82Z1lESWdFeHFxcUQxeG84LzFRR0ZS?=
 =?utf-8?B?eUNOejhyZmxkYmo5WkpTSWtBSWFkSHp3WUozMWpYSlpKeit6NGMzcWwxcE1S?=
 =?utf-8?B?MHVDQ3JxaTBsWjZGVjJScjVqdzJ6dDVlVE9uLzkxTFIxRmF6eEZ0RjJpTFIy?=
 =?utf-8?Q?sqAGbj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:10:15.3770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e649379-62cf-48c6-75fa-08dd86991277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410

On 2025-04-28 15:57, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
> 
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.
> 
> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

