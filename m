Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6230AFD654
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037142.1409797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCwM-0006G4-3l; Tue, 08 Jul 2025 18:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037142.1409797; Tue, 08 Jul 2025 18:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCwM-0006EN-0h; Tue, 08 Jul 2025 18:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1037142;
 Tue, 08 Jul 2025 18:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xvV=ZV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uZCwK-0006EH-KM
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:21:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5205a3d6-5c28-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:21:10 +0200 (CEST)
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 18:21:05 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::1a) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:21:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:21:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:21:02 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 13:21:02 -0500
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
X-Inumbo-ID: 5205a3d6-5c28-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdixqD8e/4oAHpgu5vLRcRzYtz0CwOfLSoRbEnQmXSEoy6ViEAQNHlXuZlPACL2BCT+SzISIslfXKW3QPZGe0Ab12ge3dawXwCjQYeMruRo4b0Vl8DSbr1ZRVoH0C6rfrHuZWcPsm23t0AMWZn3Zuf7aNT9le2OlbT16teNd9sCKuMXb25IGQkyoWtC18np8TZEPPIIkg5e9WRTT1WByAbwkTxVuwJ4Xr7RpBp7Lf07jun9C8/+80sJ25KdcwsxLLUwIw/p9ELZUxW/dLSmcRqmYML0hg/tAlSVbtTXQ7C42eaRK2y2ErRjEm8AFU1ZFIep4wPEoI0FIfSa8nsh74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eaqeWCZj7fbY+GezRrdfaMbQF5uimZQR4yDvQ3EZEI=;
 b=jdtnhLL6zWEFiWLXEEAQbitDxSlpQja3qFmLvyXOYd7V118nnYFKrQPJXEBYJ6rOVbCp07TVhNmqsOfBVW9VjiZvj9iYFalQw/cJbc5RtSqrlQbGpuHOx4lP4x9PrkVs+7JY9rDWVgfhR7Kp/r6KPBfw6BQKvqoqIU93vRedZfC1j5nEyl/o9Gum+ZnjqjFqldzV1K1Y/E2NrqhVUD5O2DgBamliCW5SL11SBcKp4JiqUl4ZqPv08vpMH8Ztd8n8RULBOhm979wx+nxBW9rgQNxbZfNWiVVNweCDcHejaMPrGRck3Q2roWM8usmgzjIHndhsCrOSxLM1bLSHpcNjbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eaqeWCZj7fbY+GezRrdfaMbQF5uimZQR4yDvQ3EZEI=;
 b=Npl/Czm7L9aqeMjvHOxv3SS2jCDkcb+tUvs2J/L/eR4QlmtOCnMPY0pRshRD7g/IFFE9UTexmAMLdRmuHYsfJPI+38CH1TympnN5q8Z8rr86um7o9s3eexoxoKxx2FqqvW1jCRng6CVMnZ0uNsAYNiUtM+8bltNiI3uwkSs6Sis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64ea50a0-67d6-4f95-a6fb-b56b3b657059@amd.com>
Date: Tue, 8 Jul 2025 14:21:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discussion on the delayed start of major frame with ARINC653
 scheduler
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
	"stewart@stew.dk" <stewart@stew.dk>, "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>, "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
References: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|PH0PR12MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f60e05-d47e-43c4-0f9a-08ddbe4c33c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWMxZ3ZBOEcrQmNWTGVMRDM0K2tKZWpsaFVaeWx1NjNVZS9pb1FCVEI3THF0?=
 =?utf-8?B?c2pPSXU2VFhpbUZFekRHYjBqWmZmZ3ZlS2pIRm5ONWVieWZ5V2Y1UmJubmpF?=
 =?utf-8?B?MVViY2JGY1ZIeEUycmxLQUQyWnZvSGlsTEttTGY2c0xicHZwOXQ4TXRGa1Fi?=
 =?utf-8?B?WndBZThvU1k3Vi9ZeFZiQlZqYVYvbEVlYkNUSElnNEZnc2cxSU9ZY0hwbEFE?=
 =?utf-8?B?Z2ZCaVNtMmJjYVFUQWxobGRpeXM4WVVWZjdyV2dwZ3VTVGp2UTNtcnowamM3?=
 =?utf-8?B?blFRMmVXYVQzU1lsY2RYV28ybC9QZzFBeFZ1QWdYY1NtNnp2Q0JWblRxN1BG?=
 =?utf-8?B?NDNBcFZtbTlGbG1KaEM2UW1xaFBZWllYOVdoRnJSbmxnMUhRc3J1RmdiU2tj?=
 =?utf-8?B?a2t6VmVFdFpKZldxSi94VG0vQXFYUHRUSXc2NHhBcVY0MG9JQUlqQkNiWWtQ?=
 =?utf-8?B?RDFDNHp2dnNrR1V6VER6UzJxVFV3STNWY1R0QmYwVklGczJqMFpDbWswaFJ3?=
 =?utf-8?B?bGo4UXNuNlNWVGdLd1BuL1VuZ3N0NUtlOHdudGlLMk5XVzdUakRyUUVXRTNw?=
 =?utf-8?B?VEdLYTNWQXNFbDQ3Yzlwemk0dTF0a2NtR2ZwOVQxaTlpbi9ldlVJclNOT28v?=
 =?utf-8?B?d0RBMHJVN0p2SzJGeVpMU29wQmlXeUI3cFM2TlljK09DZFBpcW9zU3E0TFc1?=
 =?utf-8?B?OG5peHAvYTMvRld0TTBJOFc4d3B6MytuaDlZTUJzckpScmRWaENmdnh4TmNk?=
 =?utf-8?B?NW5UR0ZVTEpwV1ZMc0k3MWswdDhGSnZkR00zSmt1S2dkRW1odWNBVkUyeW9H?=
 =?utf-8?B?OXA5UmlDeXhROE1BSzllZHphaDBKd3FNMWZMeXdaUWlCUEg4Z01VM3VENnhY?=
 =?utf-8?B?SFhHcWhRenVVb1FSUzlKVzZGQkxSNUcxc3dTeUw3WlRPeVhlTWlXeUpEakFK?=
 =?utf-8?B?RlZ4azZqSlJuQnZkSHMzcHlaOVRUU3VWTGVSZ3UrZUJYMStNeW5zYnhKM0c4?=
 =?utf-8?B?RFRMTzZhQnNTWmMwRGJzVk9EOTcrTlhZYzFGZkU3d2lPVTRrbUllS1FOOS95?=
 =?utf-8?B?ZTBpeTBEcFlNNWRnd1diZnI0ZHNFQWtZcFZjL3RKZnlGMzh4Umc5a1dtNUlj?=
 =?utf-8?B?U285WVpPb3YvZjZrb2hwNDh3U1N4NWwzQWRKRm0rY3J2a1BiSHY3Sjh1ZzY1?=
 =?utf-8?B?ZFNncUFsRk9XeURYUUQ4Q3Y2RTAybTNpR1M1RjZEZGpXUUdXbVNUNGl0WkNR?=
 =?utf-8?B?NXhtQTFzRVp5M3Z3RnFxRGZiRkErblRXOXlDWXpHRnZiT0tRUXFpWjczL2Zh?=
 =?utf-8?B?NFhFRFpBOHdrOFdCODAvbEZaZnpjTmt3ZWtUMEJSUmpiY3A4S2tCeWxORFhX?=
 =?utf-8?B?YUxOcUUvWWZVNndocWhYVHNPVzZEWElMK05lSkQxNWtOV2wxQXZkZXk1ZDAv?=
 =?utf-8?B?ZFBpUFo5YS9ycVVtMVVEZjBBelVxYW9uQVJMUUYyZUpHVEpvN2l3ZzBsQTQy?=
 =?utf-8?B?YVJLREQvWndFSXlMc01uQy9nL0FBbmFDaWozbCtJdlRqRHNsRmpXeFh1a2Nk?=
 =?utf-8?B?aDk0VDBaV2kyZXNHdUhtSklEVXU4UUxFU1RBaXRLYkN2Vyt5aWFhL1dJVWUx?=
 =?utf-8?B?NGo4S2E3QTNDRWg1TGx5YXNXYWVMejNBcHB5TndIdWVTMDQ0aDFsb09idnU0?=
 =?utf-8?B?NjVOOUNhYmNmZW40MkJpK0J1MzhyWWhGWm40aVYzMHowNCthNmZJYzc0K0N6?=
 =?utf-8?B?RHdpRFRxTGI4NW4wQ0tJeGI1ZERYWXhIQjd5cXozcHFIMndBZ3cyY2tRVjFX?=
 =?utf-8?B?WXdzRnFIVUhzYnI1WXNOdlRqZUt2YVQ1OVVSU0VWYmxwbmJlQXVQMm1GcURs?=
 =?utf-8?B?VG1CQXhIOUdsOFVZSDZUVnNtb0RIQzVYNzZrTENlK1NxQmpWQmplYmNrNEs5?=
 =?utf-8?B?cGpuREZGS1lITjdlZTBCL2F1YzVCaDJVSTJFQWdjVnFqN0pWa1hRaDd0QWlY?=
 =?utf-8?B?Ti91NzJWQ0FrbngzVWdxVzVuSnpMd2FvaUF5TEhIZHh2MGcxbFpISEJPc3I3?=
 =?utf-8?Q?R1l38y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:21:05.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f60e05-d47e-43c4-0f9a-08ddbe4c33c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629

On 6/25/25 23:50, Choi, Anderson wrote:
> We are observing a slight delay in the start of major frame with the current implementation of ARINC653 scheduler, which breaks the determinism in the periodic execution of domains.
> 
> This seems to result from the logic where the variable "next_major_frame" is calculated based on the current timestamp "now" at a653sched_do_schedule().
> 
> static void cf_check
> a653sched_do_schedule(
> <snip>
>     else if ( now >= sched_priv->next_major_frame )
>     {
>         /* time to enter a new major frame
>          * the first time this function is called, this will be true */
>         /* start with the first domain in the schedule */
>         sched_priv->sched_index = 0;
>         sched_priv->next_major_frame = now + sched_priv->major_frame;
>         sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
>     }
> 
> Therefore, the inherent delta between "now" and the previous "next_major_frame" is added to the next start of major frame represented by the variable "next_major_frame".
> 
> And I think the issue can be fixed with the following change to use "next_major_frame" as the base of calculation.
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c index 930361fa5c..15affad3a3 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -534,8 +534,11 @@ a653sched_do_schedule(
>           * the first time this function is called, this will be true */
>          /* start with the first domain in the schedule */
>          sched_priv->sched_index = 0;
> -        sched_priv->next_major_frame = now + sched_priv->major_frame;
> -        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
> +
> +        do {
> +            sched_priv->next_switch_time = sched_priv->next_major_frame + sched_priv->schedule[0].runtime;
> +            sched_priv->next_major_frame += sched_priv->major_frame;
> +        } while ((now >= sched_priv->next_major_frame) || (now >= sched_priv->next_switch_time));
>      }
>      Else
> 
> Can I get your advice on this subject?

The drift you're observing is a known issue with the scheduler. The next
major frame shouldn't be calculated with the "now" variable. It should
rather be calculated by adding the major frame period. Also, as your
code suggests, it should take into account edge cases where "now" may be
in the far future. There is another instance of next_major_frame being
calculated using "now" just above. Are you willing to submit a patch?

