Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31902B08E00
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046890.1417295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOXb-0003MM-Bx; Thu, 17 Jul 2025 13:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046890.1417295; Thu, 17 Jul 2025 13:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOXb-0003KO-8V; Thu, 17 Jul 2025 13:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1046890;
 Thu, 17 Jul 2025 13:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68ni=Z6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ucOXZ-0003KI-Bi
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:20:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2418::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98bf5ac-6310-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 15:20:47 +0200 (CEST)
Received: from DM6PR12CA0014.namprd12.prod.outlook.com (2603:10b6:5:1c0::27)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 13:20:43 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::c9) by DM6PR12CA0014.outlook.office365.com
 (2603:10b6:5:1c0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 13:20:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 13:20:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 08:20:42 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 08:20:41 -0500
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
X-Inumbo-ID: d98bf5ac-6310-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVH9yQgWyFNedzB4SjS6WZuxYi1quBtn7IpNIS6KJIrJ1WeHyN5x7z3IWkEnKXi2+Le/Uyc4vm5/Zl9ZXUjSHLe6EHphpAly9zv1if7Oy1WhN7+llRVrYo7u4I4fHGaaV2mE7tzQ33dsdDf7XWpFn1avQPXNdhTlFnFhbzEkaSSyA7U46bRJBsPW24wXCOduBcHwn0nDwID1krMQfCxDoqf7Zi1CF5HgQi24pH9UJbC2bvKtFb3WDnqT6G/D6xSKG5EW+A0Gw1kz7AV2WmIKLCD0qyNs3pKymlkNGWs35NDVQVuvn4Of/2VbmXR41cqpZyPDDOt/uk0Rxz7S70AtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+3G5X7FVn8MiJi955OOZDwsokiHYaq1BBDMSaA91ro=;
 b=ZXCGTIDUDjoq/faufZm6/50/oOMGkW8TIm2yIofqFVhf3MjUh97JNhnKw5XScl2fVkl/479Bd/hlrFr5njq8Lx4p/CG1YdfcAqm8nI0uZ09CaEcALOsY88P1JehAzbdZxLfxm0SBIZYZ5+UGxv90mnROxjDa5Y29OtQ5B71ffwKKIqfDJmtgwd2zOQ9cW0Yay+ZLVJ4RAjfajyActiTQAe2bL0tqDEVWaKZG+38oj6WolDwl1mbNrCkFHyFMCc64Bxv8XkFECnNgJ/DKSW/fWReDmKAQvk42V8N+2cF1KJqzhEOVUlKy5zYI9A930wwxmJDxPoMYBKLcrPWFfFnu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+3G5X7FVn8MiJi955OOZDwsokiHYaq1BBDMSaA91ro=;
 b=NbyGFDDNhKUDO2b+SZE9nsj0XKIIrQMW3tagqFGAAM7ztCufzKhvtRhrK7soT5GTnC6Fd73mJtJcSi9jHA9Q2R2OzHSc0OcyUuy4grDp/ApqECBwlJpLU0/6loxwIyaTHYip6g3aH+AZczrwMiBtW1eslQYyj/j/5ipvuhFSsIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
Date: Thu, 17 Jul 2025 09:20:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
To: Anderson Choi <anderson.choi@boeing.com>, <xen-devel@lists.xenproject.org>
CC: <matthew.l.weber3@boeing.com>, <joshua.c.whitehead@boeing.com>, Nathan
 Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>,
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, <xen-devel@dornerworks.com>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6944be74-d53c-4e0c-4ab4-08ddc534bb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlIzL012blJ5WlNmcWJ0ZzBXKzJMZjE4S0NYU0hvcVc1UUd6eHBMY1A3UXB2?=
 =?utf-8?B?b3FuazFVMHNMVFdmNVdqZ0VzaEtsSjY4b015SGtHTGtUY2xZUjl6dUtJaVRF?=
 =?utf-8?B?ZFdlZ1BNMlhIdzhjVzJpYU1OenRBeHRmQnhaUE1JZE03MW9IMkdYTlZxM1NG?=
 =?utf-8?B?MEx1R3VaNkdidkpWdWxZMFhycGdpMkZibFVuSU8va1pCUUo1NHBVTG5ZdmZm?=
 =?utf-8?B?Q1lOcG9HMmpRWDBvYW9zWUxvMThSWjhuNkhQNzNiR0xjVVBjMDBTZFl4bm93?=
 =?utf-8?B?QWVINjhHMEMweUZJVnpteHV1Rzd4elJCZC92Z0o3OEI3YWV4ZGJ4cU5La3R3?=
 =?utf-8?B?Z2tsb0hETlVoalJFYnZHQVpLdzgvKzltaTJCUE80MGI4U2Q4NW5IQ29rL2Er?=
 =?utf-8?B?cE5jcjkxS0ZrZENJQVJOT2QzaDRPVnljbndNczRlMy9UMU9Za1Mxem5lSCth?=
 =?utf-8?B?UEFzT2lLYmhiTFA5TWpKRXZXci9VSzhJcGl4bWwrOGdxWk45Q0xKN3RQaUFv?=
 =?utf-8?B?b3NVK2szdWVlOGxoVFBMNE9YV0ZBVjZHdjQzeEx3MFZEcXBybVhXVHRaL2dX?=
 =?utf-8?B?Wit2YisrMExaMzdLNm9USUhRTmhEcHBHQ1hKc21XVVczdW9DY0lzQWFvaWMy?=
 =?utf-8?B?WXR6NU1DK25qUW5TNG9LWUwyb3FMTG9uZE1YcGtXeVFaVGRnRmtDcmVydy9C?=
 =?utf-8?B?L1MrdkZQUzZlbkhkMkFXMTdwMzNJZElzZ1QwVGFHUksrazFNMktYZnQyUHh3?=
 =?utf-8?B?ZkZab2MrdWFabkpDT2hLemtIZWFucU1Lc3RkOEVFV2pvYjlhdkhjWlBiYndB?=
 =?utf-8?B?elBYVU9tK3pyYVhlRDQycXBzZi9zRnZBYVk0RkZObjF4ekJIOGxsY2NQMFIx?=
 =?utf-8?B?dDJxK0ZmaDl1eUJsMTFNejhSRy9xZWZ5bWdlTDIyKzNMRHNaL3dhcEs1WFd4?=
 =?utf-8?B?K0Q1RzlPVFJidzJpNHV0Y3JkK2dkdnB4VzhyREJKRzg0V3NFUkhDditnU0Nm?=
 =?utf-8?B?WFNJUzZGNlI2dS9sMjdZbFhUV3J2UDRaY3A0YUdLcDlaR3A3L3F0NEZkTVl2?=
 =?utf-8?B?aCtQMXVBMnRlWDFqb0dZaXBHR043MThqbFJrNTg3SlAzQTV2NHplc2pMY1U2?=
 =?utf-8?B?ZFdkbzQ1ejh4cTVuRGVHZ2RXeUQrbWtDdGJBaG9JME5ucUd1TUw0QU1FR0JH?=
 =?utf-8?B?dWhmajIyUytiSHZpSElnNlBmR1JtYnd4ZHRBWHdYczVuWWZmMUdtRi9QWjFM?=
 =?utf-8?B?WXg1WHdZRmkzbEFrbm1Ha0N0U0ExSHRlQUhycmRIZ2RVWnRmdHByeWlQR2tm?=
 =?utf-8?B?TXY0QS9taFdEdUxvWUhrOGIzaHg3UGNaSnJLcGJXS0VpeXFPWUZyMExuRXNi?=
 =?utf-8?B?Y2doMUhTWXFpc08waGVueGY0bDlYejVOanpWUzZ6M0g0N20rVWs4Z09jbStH?=
 =?utf-8?B?VUlPZlRoOStRb0w0ckdpZEUzTFpxbFZhR0E1TXpMOGdWcnRQYjMrUnZ2aDgr?=
 =?utf-8?B?eDRhaS8zTUIvZ3FpLzBBN2h1dDhGNEVUMHVVb3FoblBKV2sxcmV4dGpQbXZB?=
 =?utf-8?B?SVp6OUEzN2hGTWxIS04zc3VkdUNqYUp5b2lMb0V6OUhuS1NsSWlrR2lyQnZD?=
 =?utf-8?B?ZUJ0T1pteGxOZ29JYnMwNXh1N1ZNNDZYRFY5c1hFeElFUEx0ZGJMQndMM3pQ?=
 =?utf-8?B?b1JvZTA0cGx6L28wbjFLVEUyL1Z1STJjQlB3K1hGSmY3Nk5GQ1V0a0JrN2V0?=
 =?utf-8?B?aFVWcmtreGF2cEFkeGVsTW1hMEgrY0JBaVBTTldmSFpUZUJiR0pFN3NsY1Mv?=
 =?utf-8?B?NTJvaFVIZGhCTVQ4bnZUSDBaUHpadEdXLytPZS90UlFxYjJYWERTQkM2VUIx?=
 =?utf-8?B?T3VpVitiL3VXTUgwajF0ODIwZ1hYSGRzUGhGUCsxb1ZOZ0t4Z0lIMnNsaEhs?=
 =?utf-8?B?NGlDV054ZmlHNVEvSjhzV3BDaHdOOFhXRkxWdkczeFlsWTlBdW9TL2x6am5z?=
 =?utf-8?B?QmpORXNMbzNwNjlZU0tpU1FzNk16bnBIODJtcmhPNXBJS1pvTVFxOFI3dVZu?=
 =?utf-8?Q?+T6a6C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 13:20:42.6859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6944be74-d53c-4e0c-4ab4-08ddc534bb4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468

On 7/14/25 23:16, Anderson Choi wrote:
> ARINC653 specificaion requires partition scheduling to be deterministic

s/specificaion/specification/

> and periodic over time.
> 
> However, the use of current timestamp (now) as the baseline to calculate
> next_major_frame and next_switch_time introduces a delay in the start of
> major frame at every period, which breaks determinism and periodicity in
> partition scheduling.
> 
> For example, we observe 3.5 msec of accumulated delay at the 21st major
> frame with the following configuration.
> 
> Target : qemuarm64
> xen version : 4.19 (43aeacff86, x86/IRQ: constrain creator-domain-ID assertion)
> dom1 : 10 msec runtime
> dom2 : 10 msec runtime
> 
> $ a653_sched -p Pool-arinc dom1:10 dom2:10
> 
> 0.014553536 ---x d?v? runstate_change d1v0 runnable->running //1st major
> frame
> 0.034629712 ---x d?v? runstate_change d1v0 runnable->running //2nd major
> frame
> <snip>
> 0.397747008 |||x d?v? runstate_change d1v0 runnable->running //20th
> major frame
> 0.418066096 -||x d?v? runstate_change d1v0 runnable->running //21st
> major frame
> 
> This is due to an inherent delta between the time value the scheduler timer
> is programmed to be fired with and the time value the schedule function
> is executed.
> 
> Another observation that breaks the deterministic behavior of partition
> scheduling is a delayed execution of schedule(); It was called 14 msec
> later than programmed.
> 
> 1.530603952 ---x d?v? runstate_change d1v0 runnable->running
> 1.564956784 --|x d?v? runstate_change d1v0 runnable->running
> 
> Enforce the periodic behavior of partition scheduling by using the value
> next_major_frame as the base to calculate the start of major frame and
> the next domain switch time.
> 
> Per discussion with Nathan Studer, there are odd cases the first minor
> frame can be also missed. In that sceanario, iterate through the schedule after resyncing

s/sceanario/scenario/

> the expected next major frame.
> 
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>

I think this wants a Fixes: tag:

Fixes: 22787f2e107c ("ARINC 653 scheduler")

> 
> ---
> Changes in v2:
> - Changed the logic to resync major frame and to find correct
>   minor frame after a miss suggested by Nathan
> ---
>  xen/common/sched/arinc653.c | 38 ++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 930361fa5c..a7937ed2fd 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -526,27 +526,31 @@ a653sched_do_schedule(
>  
>      spin_lock_irqsave(&sched_priv->lock, flags);
>  
> -    if ( sched_priv->num_schedule_entries < 1 )
> -        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
> -    else if ( now >= sched_priv->next_major_frame )
> +    /* Switch to next major frame while handling potentially missed frames */
> +    while ( now >= sched_priv->next_major_frame )
>      {
> -        /* time to enter a new major frame
> -         * the first time this function is called, this will be true */
> -        /* start with the first domain in the schedule */
>          sched_priv->sched_index = 0;
> -        sched_priv->next_major_frame = now + sched_priv->major_frame;
> -        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
> -    }
> -    else
> -    {
> -        while ( (now >= sched_priv->next_switch_time) &&
> -                (sched_priv->sched_index < sched_priv->num_schedule_entries) )
> +
> +        if ( sched_priv->num_schedule_entries < 1 )
>          {
> -            /* time to switch to the next domain in this major frame */
> -            sched_priv->sched_index++;
> -            sched_priv->next_switch_time +=
> -                sched_priv->schedule[sched_priv->sched_index].runtime;
> +            sched_priv->next_major_frame += DEFAULT_TIMESLICE;
> +            sched_priv->next_switch_time = sched_priv->next_major_frame;
>          }
> +        else
> +        {
> +            sched_priv->next_switch_time = sched_priv->next_major_frame +
> +                sched_priv->schedule[0].runtime;
> +            sched_priv->next_major_frame += sched_priv->major_frame;
> +        }
> +    }

There's no need for the above loop, this can be fixed by subtracting the
remainder (modulus major_frame). E.g.:

    if ( now >= sched_priv->next_major_frame )
    {
        s_time_t major_frame = sched_priv->num_schedule_entries < 1
                               ? DEFAULT_TIMESLICE
                               : sched_priv->major_frame;
        s_time_t remainder = (now - sched_priv->next_major_frame) % major_frame;

        sched_priv->sched_index = 0;
        sched_priv->next_major_frame = now - remainder + major_frame;
        sched_priv->next_switch_time = now - remainder +
                                       (sched_priv->num_schedule_entries < 1
                                        ? DEFAULT_TIMESLICE
                                        : sched_priv->schedule[0].runtime);
    }

The commit description may want some minor updating to reflect this.

> + 
> +    /* Switch minor frame or find correct minor frame after a miss */
> +    while ( (now >= sched_priv->next_switch_time) &&
> +        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
> +    {
> +        sched_priv->sched_index++;
> +        sched_priv->next_switch_time +=
> +            sched_priv->schedule[sched_priv->sched_index].runtime;
>      }
>  
>      /*


