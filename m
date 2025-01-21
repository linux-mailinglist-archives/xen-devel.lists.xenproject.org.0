Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9EA18897
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 00:54:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875722.1286142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taO3v-0007vc-Gr; Tue, 21 Jan 2025 23:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875722.1286142; Tue, 21 Jan 2025 23:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taO3v-0007sx-EB; Tue, 21 Jan 2025 23:53:39 +0000
Received: by outflank-mailman (input) for mailman id 875722;
 Tue, 21 Jan 2025 23:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eP5S=UN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1taO3u-0007sr-6F
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 23:53:38 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:2408::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec86888d-d852-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 00:53:36 +0100 (CET)
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 23:53:30 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::88) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 23:53:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 23:53:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Jan
 2025 17:53:29 -0600
Received: from [192.168.62.40] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 17:53:28 -0600
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
X-Inumbo-ID: ec86888d-d852-11ef-a0e5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPX7LVZV6k5RRedDe4TRx3pA/U+ahClvMNXnfczAPATkIdgSK80y0u9bE1n/7/uo/poYyHbGtEiQNsCTKn4GngiATj/4Qp3lTXkwU3muEM5vRBhRXqzaBXPrHpYDe3egXCqK//p9zZmjKYO1publ7vkRGFVTdVnngagyTcRDAE91LIkc/N60McN8zMzfbnglfsmMEugSF3YiLBTxxHymQqGoYucM3rC2Yjxk7wm0Ebe/CHbD6wDN7svzl6RIqWQeOE51Adps46lQjT0H5uOSFgF+l+bfmFv53TT3sl0N23371QUFtT97PsKrnxhDPn0da/B+0F1cdTKe+rfzn7vrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af10JZJcWTXMWWC8WnVRNapxtQBCXjCco68gtDJVO3k=;
 b=BxoMoXN/iABxHYCYG73vd9tgwnMmMTekfDFT4t/FbegAHUsLU8/OzrsHQAMdZ7gdnzD9ofD/qt3j+cZSgLYBYSVKGyzOHJONxQYbnv9vgPX1dFZPfS4iXF84ybgutfy4TAhtx5RgemFut0vFUD4CxLS8VHX0ymckSnkifIJMej6qdck0Z16i3yWv67bAvis4m0oDzfKdRRTyRa/RyT/34RpMpEQcH0gbMZg1g4Hv5h0+VKglJqgKGbzPtpKWNUgDMAA0btbLoLW5LPUAZHTjVxEdM57aFbu6k/F1Cxpqg5ez6ViofQHCPxFGVeoojqEmyIcpXymKyVwS3hMls9Z24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af10JZJcWTXMWWC8WnVRNapxtQBCXjCco68gtDJVO3k=;
 b=OQBPsnk1A3dQRtA4xee4IEWNUrVRhf/7qtQc9cfZxWPAMyJvoef+rUhJH3GL1s04x1rQleLnC9kmyahBwZlryycCzxj+37KeYnBexUySt8B06Osannd4oy1sxqQjaEjphlQSPINfcGnypttiANatLNU7Ut9bHYe5LdLYYtARJho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8595e239-079d-43a6-8713-dcabba9136bf@amd.com>
Date: Tue, 21 Jan 2025 17:56:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/24] xen/ctype: introduce is_console_printable()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ae81b1-4211-4163-77ca-08dd3a76ce51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHRzTDVxY2JwM1UrNm1SMmdzSDNIdUFpZXFtcHZudHYwYjRYbysvTjJYdVQ2?=
 =?utf-8?B?UlFOdHViK1pza1hKTEhjbHNzL3RWejJRRU9mSmRZNXBBUDFSMnNMRkVVSDJ3?=
 =?utf-8?B?NTBEa0hiYklDWDNOM01tQk5qVkVHUHpCcnBMa0RFS1dKVU9TeEVMOXYwOXo0?=
 =?utf-8?B?cG1IYURlVW05QWtReFh6eU0yTkRmQjRsMXYxRU0yTXR4QThKVEowMzlxbTYz?=
 =?utf-8?B?elRTZXhpSFZwb293cHNvZ09mRW5JUXZVb0FsN1VEbkNuQ1pCWmhzR0hWdGdK?=
 =?utf-8?B?REZ1STdybEd0a21BbEhRSk83UHBKRU5kQndkVWVaeXhHbE1Qa0NjTk5QMkRX?=
 =?utf-8?B?QTRKK0l4Q1dWdDFxazBYWWxESWY1c2RIcUtROGlEdWROamxtREppeGxZcFNx?=
 =?utf-8?B?N0F2c20vVFpnZ3Njd3hibWVNWEs2WTY2dUNBWVJ1QjYzL0k4YjIrZUVVdjhy?=
 =?utf-8?B?L2VreGNwanlUb1ZGcHpac0VjbXFDY3F2S2hnWWFiZUJmUkFKT3RkVXo5cW1x?=
 =?utf-8?B?RkJBcW9UbzlwbmlDM0pwbkwwQU1hWHpMcGUrcHJNN0Z6VHUyemN4UGVQMCtS?=
 =?utf-8?B?OTMvM0VWRmRKbVh2clpzWFgzVDJ6Vk5qN2VOTE03cE1kRUhJcUtKNmxGQTZK?=
 =?utf-8?B?cDJJTEVKcnhXMzdteVczZmZLSThrekFab3JJU1IzNWdXaHBSVHdtbjZSQ0NR?=
 =?utf-8?B?M1BEQ3pRSGl3MmJiaFkvNFNXUS9mUXFWOXg5YkJ2T09acURjNHRscXdmWCs0?=
 =?utf-8?B?VFJMQjR2ZkcwanNhcWdsTmkyZ2xKQXE3ZEpyK25jQjRjcXVxRkFLRmxwV3dl?=
 =?utf-8?B?bkZ1dE1PSjA0WUlOa3JkVXVuMkZaME9RZ1VQUHRTbHlLeVRkTmFNUGdETHpL?=
 =?utf-8?B?c05CV2U5T2hSZnAzZTNDaStydHJFNzVMU2M1czlBK1J0eERlN2ZXWXhmOUtY?=
 =?utf-8?B?NlU3akJTeFNTcmx6R2pWZHYveUw0WXI3bENtVWtuUThML243cTJvZ1ZiWGRn?=
 =?utf-8?B?K1Q1QVhhSDBPbFluVkluT0RNR1M3eEJERU0zc1dUckhkM0ZWRHVVUUl4WTF0?=
 =?utf-8?B?N2hrS1JuUG1tK3phL01DcEtML1R2c2VyUjhKNlJzL0xzcktoQVJiSWNzU3dD?=
 =?utf-8?B?bE1FbzJBRmdrV3YwdUFVSFRxdm9HMUJZa24vZ2NHRlhEYk9CVVRrL1lBNnNG?=
 =?utf-8?B?VXRPcjlBMHZBeWtLQlVHaGYxTmJFcTFpTW1UVEU3cTRGdnIwUituTWRQeFFs?=
 =?utf-8?B?aXNETUEwYnZYbTMra3ZCdWFMQWRnd2lrdVRIWUo1TjJFVW5Ldkh2c1lYdnVV?=
 =?utf-8?B?YlprQXNKUnplMjhGZWFDWGNNNkZ0aS8rc0d6NmIzQjBrNUVSMUFrRGNMK0ds?=
 =?utf-8?B?d1FEWmhoOW9KaVBTblRaK1VXQTBoZFEva09TZi9aeTc4cEN1aHExY0xHLzd1?=
 =?utf-8?B?S1FncEpUQmQ1bHFuZ2t0N29vWmxaREVOVHpQTHFSWnpPZllJMlQ3MERCT0lX?=
 =?utf-8?B?TzRhai9aWHFWQU9YWU1OVDZtL2l3Mks2S1BVTEwvc1NrcGZ4YzUvMUZMMVZE?=
 =?utf-8?B?K0xZazBuOFVsME9NaERMY2VvZEZ1Q1VDanR5NDZvbFhMZ1RjcnZ0Y1ptbWlR?=
 =?utf-8?B?dGV5VzVwaG1USWduMmluUjhFbHo1MnBxV3dlcVRRMWhid3BGMmxCU2pCVkpY?=
 =?utf-8?B?c1IvSHdLUyt1cGljNVR5UGpJdkF6dWd2Q1JYV2NGa1J6aDdUbG9vakFFT2dQ?=
 =?utf-8?B?YWdRekFvdDgxdTdVcnhlWVNDVFVVZEp2cWNaaFJBb1Y2Y3NOV3c1QUZ4eXl5?=
 =?utf-8?B?R0Z5RVZOYURVMUlHdFBzMzk3NS9TeFhFbnpSMzZXYkF4ZWxWcDZFQU5lazli?=
 =?utf-8?B?WFB5c1lMdFhrdDcxZzd0VzNIaXQrMXo4UUFIY1NxbUVlQVd1YTJqUlhIU3Ro?=
 =?utf-8?B?OHk2MVl3ODFWZkc1TlV5OW13TStqNzNkMDdzdXZmcTI4QWwvN2o5NThrNUNx?=
 =?utf-8?B?L0luZHdlTCt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 23:53:29.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ae81b1-4211-4163-77ca-08dd3a76ce51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> There are several console drivers which have same checks w.r.t. printable
> characters. The check is moved to new is_console_printable() function and
> re-used in the UART emulation / guest logging code.
> 
> Also, MISRA rule 21.13 for ctype.h has been exploited while working on
> the code change, reference the rule from ctype.h for future engineers.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 7da8c5296f3b62c6c45131c58fe5cf0e393e9ef3..4cb397116b44935214801c496b30e44c9399c59a 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -674,7 +674,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>                   c = *kin++;
>                   if ( c == '\n' )
>                       break;
> -                if ( isprint(c) || c == '\t' )
> +                if ( is_console_printable(c) )
>                       *kout++ = c;

This `if` now accepts newline, but newline is already handled above.  So 
it seems okay to me.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>               } while ( --kcount > 0 );
>   

