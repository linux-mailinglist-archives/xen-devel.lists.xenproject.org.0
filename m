Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27315A09C17
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 20:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869985.1281429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWL58-00044N-0U; Fri, 10 Jan 2025 19:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869985.1281429; Fri, 10 Jan 2025 19:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWL57-00041f-TY; Fri, 10 Jan 2025 19:54:09 +0000
Received: by outflank-mailman (input) for mailman id 869985;
 Fri, 10 Jan 2025 19:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7mG=UC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tWL56-0003zb-ED
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 19:54:08 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2416::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f0b3bf-cf8c-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 20:54:05 +0100 (CET)
Received: from MN2PR06CA0015.namprd06.prod.outlook.com (2603:10b6:208:23d::20)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 19:53:59 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:23d:cafe::c6) by MN2PR06CA0015.outlook.office365.com
 (2603:10b6:208:23d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 19:53:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Fri, 10 Jan 2025 19:53:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 13:53:58 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 13:53:58 -0600
Received: from [172.31.88.124] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 13:53:57 -0600
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
X-Inumbo-ID: a4f0b3bf-cf8c-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X872xgXHGfsGM237LvtrTMRk9/0f5dx62JzHSvW5ak+01K8CnFNg7uBcxw7C0pJW8TW3D+EhLRgh/KlzwdiShSkewM7P7/55XGkdHmW1PL54nSrHuwt/Jfe2yghu6yGFP4u9CApHM4twNfD3cjnmDWeNwgEuql6g8QbKsS1Sqmd5R9Wlkhag1SGNdKBUVMmZCYr85/nZB2+ajP2WLIcVSok0DPJl03bTKP+p6FHJO+BJVBvfQv/pGplVZJdouu/2wG0r+smh2S1W7JgDfYxD7jSefWuRS1ubu7Idea07Ve8Ft7+n1F9lGRsTc+FKjgPgvZa+3Tv4Hnaa3NeUrMNVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02oETOlBsWxI1frBbQ+Ht8ybGSP54hNsPPtunB8DhLU=;
 b=VCVsT0kfMGc2QvkuY/pvwkusn351h4Lelg7T0ymdLw7381xN2xWsx3e06TcMKCkhZM2p2/iZmbpcx4ou/QbVdUVjogQ8YDwkxac+LQP6T8DWRt2+OkMrSxljRdtHVtCI2Ai6doRRzP0F+Pi9uIiyfiQeq3IoPWZlzg1mFK1l7EnwBcf9XGF/WsSurOulaOf0n7NHDXRj5aE7iFb2/famk5oOwBXLi5mceYhmNm0eEa9/OYjdUIYn9HrOvT0AWv3EvASmRPuw5Ij6DLV2GQcH+rXY/t+FvN32v7MWmEBezwcc1hGw2hPCW6JZpes9r72LCmd76D204oTZn1O8xPLZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02oETOlBsWxI1frBbQ+Ht8ybGSP54hNsPPtunB8DhLU=;
 b=GXWbV6qW0Tae4+G9Vd28+G3wJyTBu+DobOUV1VmA2bFqDoyhpqZtcljx9lu+aIf2naW7TDQm/nONW36Dt2IS6h++D8iJCu/3LMSavfebtUw1//lMFhAOYpDwJltsIOZYoMlcJ1nr0qM4DxaSGxNkKJ5m6D/U9qCCeK/YsQFEUhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <508cff3c-3fd4-4ab7-89ef-30a72a267111@amd.com>
Date: Fri, 10 Jan 2025 14:52:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4419031b-8f5e-4274-2945-08dd31b08622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWNveTQ1a1NFNjBtUTA3bm53dmdaZjFpQTA0Wlo5ZkR5WVgvUVQxS09FM0hw?=
 =?utf-8?B?Mk8wQlF0ZWtjc1VVbFN1amFnR0U1SjRlSXZvUHhWRTV2U1JYcGYvUlNnOTdm?=
 =?utf-8?B?a0Z0akxoK1dha01GalBmZzgvNUZ4TlM5ZHVUazdHZmlIUGo0Vk1zbHlvVmli?=
 =?utf-8?B?TDdhdmhVRG9QYUtNcmpEc1B3T0I3SUNOUFVCblF3dzZlSjA0TVlyd1Z4bkVx?=
 =?utf-8?B?K2wzbWM4dVZNVlNqeXV5YWJnenM4OXJpUFY0VmJzcHFCUHJLK3ZBb1RtWDB3?=
 =?utf-8?B?R1lTZGtBVEJvOGdobWNjdjZsYmhFdWRiV0RWWGJaWEZadnFGU2MxcmJsNTFJ?=
 =?utf-8?B?T3hJelNlaVZEV1lHNjNTL256UVBOYXROek1aYlZhUS9mcGlEU3J2N3E3N0dU?=
 =?utf-8?B?ZkpzVk1HU3V2c2h1NlUxWDJhQjByaGowWUFHVzdmd1UxUFNCUHhIVko4U1Fa?=
 =?utf-8?B?ZDBmOXRpOU04WGRpRTMwNkIvV1A5b3MvN21JS3V3YU52R2R5cklrbjE1UndI?=
 =?utf-8?B?YXdGNTlrNHpGam1zYU1IRjZiZWZhU0VVTmFGS3RINVQwclF1L2NDOHljUVd2?=
 =?utf-8?B?RmlyNEpmWnRkR3FlTGt0U1R5NENSSXBWeGpOTy9ZckwwQUNia1FzVzVPUWhz?=
 =?utf-8?B?YUI1TmZLR084YTJ3Qm5RbGpzL0hYUGI0WTQvbzdFQ2tjcGRWa1hmTEtFUzMx?=
 =?utf-8?B?YUpoSzAyY3IxSzdQSVd5UCtOUEpNWjlVSUNrcFVjWXFzTkFLQ0JPc1VWYWdV?=
 =?utf-8?B?MlpBWDhVZG95aTU2TUFXL2dJbkFOYVQ5eDJWQzFUTkNGNjBLcEE2WCsvVGJF?=
 =?utf-8?B?bUhUSEdMWERQTjJEYjJQMmtrSmZkdzd4RUlReC85YjFzQXE2NFpZNFlpcUhV?=
 =?utf-8?B?cVFMakZJSUVVUXlqSmlSUE5ZTW1WbFIzdnMyZFNLeWFuZ1hmZDdyWlJ0M05a?=
 =?utf-8?B?TXBwc2hJbldPM0lIa0xVSzg5dUVEQ3hKVXl0WkVwS2lMbGlKd1Zqb0F4VHlP?=
 =?utf-8?B?LzhjUnQ5bVVrSjkyMkF5SWR4citTQ2lGU2E4K1pwNkNDM1dFaVdaY2Voak5t?=
 =?utf-8?B?VU95QmtyU1NRVWNXMm9zWEZPa2RCSDdVdm9HZzlyVVJkSUlwa2ZLM29UNzlP?=
 =?utf-8?B?R1NxczVsWWs5aFRDVG93b3F4aHRiSkxEVFBlbGRMbm9LbkExK1NwVlhJSklH?=
 =?utf-8?B?NkVjb2tJRWVmbWo4UGgzK0k3ZW5lTHFzVElWMlRKMHl0TCtLS3h6cTVWU1NV?=
 =?utf-8?B?czlNQklIbkxSdUNPU20wZW40SGt0RDAyQWlCT0VKWUdud01zekplMmlhN2ZL?=
 =?utf-8?B?cG5ZWTR4YUVJbC90eSthRVZJdFAxSkVNVy93dnlHRzNRMmRaMlNwQ0d5S05L?=
 =?utf-8?B?MDZPZ0d1d2ErSmYyMXk5TmJpL0ZRd3RacWxJTW56QXhnWWVxcmRQb2ZYQW8v?=
 =?utf-8?B?Ynl1TFovRGVES1Z0eDUwd1VHTmlqU0M2RHlybkdtZ2FTZExjQWRTeHpnZUZQ?=
 =?utf-8?B?U0FpOVhNVC9LVFY3cGVqUUYyeWFtMUtrWU40YmJSRUlQYXRuNUxGMEQ4RGMr?=
 =?utf-8?B?c1ViQU12SmQzN1NjWVdZdnpocTJsclgxb2NFd1R5eDI2R1JaMXBtYUZqNzZZ?=
 =?utf-8?B?am8zMEM0YStyTnJFTDRNU0FPTGxxajJVWlhsdlRuQ2c2bUpsQXBOOVNwaFNS?=
 =?utf-8?B?RGovdU93REJydzJibTFFdk84Z1NtZ2k4VWRsYlNSMC81dW45V1dMUUFBT09v?=
 =?utf-8?B?SWNTdUdkTk1PSERsbE4yK1R4MldlRktmQUtaRC9ZZlh6QnExTW5jOG9WRkwy?=
 =?utf-8?B?VE5wT3JBT1lFMERTdWtYVHNJUUowTjV1TER5eVkxa0wxZDR2bWVXd2xvemls?=
 =?utf-8?B?bEQxZGE5VXBhNm9yYkZXdC9YOHVoZUtVNHNQV1lOMU53dXJpNmo0ckZsVDQv?=
 =?utf-8?Q?nJe8wjDZxipqUJvgnrn+ZP0BLbpKUy8e?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:53:59.0244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4419031b-8f5e-4274-2945-08dd31b08622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain. This provides for
> the backing memory to be directly associated with the domain being constructed.
> This is done in anticipation that the domain construction path may need to be
> invoked multiple times, thus ensuring each instance had a distinct memory
> allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>


> @@ -1018,39 +1037,52 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           panic("Error creating d%uv0\n", bd->domid);
>   
>       /* Grab the DOM0 command line. */
> -    if ( bd->kernel->cmdline_pa || bi->kextra )
> +    if ( (bd->kernel->cmdline_pa &&
> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
> +         bi->kextra )
>       {
> -        if ( bd->kernel->cmdline_pa )
> -            safe_strcpy(cmdline,
> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
> +
> +        if ( cmdline_size )
> +        {
> +            if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
> +                panic("Error allocating cmdline buffer for %pd\n", d);

I guess I wasn't clear last time.  Instead of two levels of indent, I 
was thinking at the top level:

     /* Grab the DOM0 command line. */
     cmdline_size = domain_cmdline_size(bi, bd);
     if ( cmdline_size )
     {

domain_cmdline_size() checks all the pointers, so this removes 
duplication and indent.

The rest looks good.

Regards,
Jason

