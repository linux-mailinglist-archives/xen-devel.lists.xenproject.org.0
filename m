Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E43B0E50E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 22:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053003.1421764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueJqU-0005DU-QL; Tue, 22 Jul 2025 20:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053003.1421764; Tue, 22 Jul 2025 20:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueJqU-0005AY-NO; Tue, 22 Jul 2025 20:44:18 +0000
Received: by outflank-mailman (input) for mailman id 1053003;
 Tue, 22 Jul 2025 20:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stB6=2D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueJqS-0005AS-Pb
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 20:44:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2418::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dfd8d15-673c-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 22:44:11 +0200 (CEST)
Received: from BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 20:44:06 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::f8) by BY5PR03CA0009.outlook.office365.com
 (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 20:44:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 20:44:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 15:44:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 15:44:02 -0500
Received: from [172.29.130.202] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 15:44:01 -0500
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
X-Inumbo-ID: 9dfd8d15-673c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzXUW30ps0VZHWuUxhTjlhPyALJZDyWA/xsnjCrLAaS8s6JxAXgkX1QD1L7xwxnQ+QjSKUIR/kQ8+7aGaoX8WFF4rJ9GDWeeSVW7Qbh5iC7xZ2PdxpJvPzfaT1oO5RcRz9CBQNSx8ZrU1QVtt5+MMHCE4zdVWP1iZAvC4GCQXgyxc6Fm0XjX0KDA7gNlOnuUour9KBCvKTAfkSxpjslbMmZXs7sywDM18Bbohlh+tPiSeeghcr+zr8pbm6sE43mnDhvMYZmys9CK4QHxed9Ae/vkTAw8AfSryqrC2YzDAPA/zAypXgRneR/97cofiilIptev6yjHGcEBaPuYOQoYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgHTJtCCQMzuJCTLz8mIGs7MvmEVD7ahzV6q2XSTYRg=;
 b=NAKUHWV1jCtcE1T3FQeC11SYrgT10RjJuL67IsR3/5UnPKQ3CRpzShEvocylHeFrI3U3/XdDoMVRyk0LqRk7p/IBqfZkK7YXcanWiK5tWphMjGKe4UkOfUnihf6yW5WpDoRTYjadBfbc6DV6wru5Xe06rjPVUIHMiXFlIOWYk5JEkrwygS/KwwF5+se/knjxf7Hg/idQ+6jMak6NEQc+fdsmhoEMtlot5yV/3eaKnqbYtWfMBUhgOdnpS60EBrgFDlzx9DwoN/eeDq4+WKl044X0+NNb5KTLZuD3hLnDkrJzyoAO7mcvS9WKJkvsLsxWjOIjvv3Coh0MJrBqc/bWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgHTJtCCQMzuJCTLz8mIGs7MvmEVD7ahzV6q2XSTYRg=;
 b=iMV7fwNGdvCE3iNyNP4YD/xTW8ryNRxvluHq2kUDp5Eu+wAPAZF++wnV1x6ipe2d57j9Zg/fK8LF8xLvKR5BMRO/8ZIdOthbsDmULDgSfR2mRAhZANbCS+l67MhIDhl9ADTUTxBv54M7QjQ25AAvdRIfEwShOQ1jf9WIaUKvIYg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0c262d60-6776-4c60-ae6e-5d168bba9d93@amd.com>
Date: Tue, 22 Jul 2025 16:44:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen/arinc653: fix delay in the start of major
 frame
To: Anderson Choi <anderson.choi@boeing.com>, <xen-devel@lists.xenproject.org>
CC: <matthew.l.weber3@boeing.com>, <joshua.c.whitehead@boeing.com>, "Nathan
 Studer" <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>,
	<xen-devel@dornerworks.com>
References: <cb18dbefaf574eb4d3647097d06debcab378533a.1752815008.git.anderson.choi@boeing.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <cb18dbefaf574eb4d3647097d06debcab378533a.1752815008.git.anderson.choi@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 808b7bc3-4b23-4ea7-1be3-08ddc9607f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGVSaVhkSFQwREwzMEJwak1aMFp0Z0RONlA4bFNjUjJqK0JIQ09pdTFqcllj?=
 =?utf-8?B?L0g3amI4dC9CMFlMWCtjNEpuV1lxa3hYeUZUNlZxUHFVNVhveE8zbmRENmti?=
 =?utf-8?B?eExlRS9FaXloU0hML05OZ2VGTmVBM3pvc05BRXN4MEhmeUNQSE1FSS8zc0lh?=
 =?utf-8?B?VURsbE13bldnT1VhRmpwY2d2c29WcUdPTFhtY3BYaWQxZlFlbnhjSXEzU3FJ?=
 =?utf-8?B?WkVTcnlqSnZVdVBBbGFEZ2pHaHk5WmpjTDJ1aDlTRzZsQTlGa3VEWmxWL1Zr?=
 =?utf-8?B?TEFhVzhDcjhTOUt0b0o0Q0Q3OFIvWXFSR29nQXhaZ1V3dGpZTnJTL296NC9t?=
 =?utf-8?B?Q0pwYll3d3Z5RUNORVN6WXZ4QmRqVXJTMXFyOW42bGY1MG1pOFN2dTB1eGhB?=
 =?utf-8?B?bjUzWTlZK2Urd2VKd1VHa3l0RUR5Ulp6b2J3OXJtY1RlYkpwNXJqNmdWTnRn?=
 =?utf-8?B?MFpLd2tJZ0s5SUNsREZMczNJVC9vUXJCekF6SC8xaDltWGZya09ObmRtc0E4?=
 =?utf-8?B?b29DN3NQeXlDblNuOE91RDMwSWJ0SnpIM1FHWEJuOWFuL1lFd3FoZDY4S3d4?=
 =?utf-8?B?UG5ja0xCeVBFcWFaYjBSTG9jdTBTWEw5Y05FemE0TlQ2OGhYK2ZwMm1Gek1q?=
 =?utf-8?B?Z1JnUUdXZFdYR3liaGNtbCtGUDFKYnZxL0Z4L01weVJWa3hpdENSOVlMZXhI?=
 =?utf-8?B?RnFKblYwZ1EzM20rd1E3Rmtmd1RJNnl2cjRTR1E4UWx4YVphYnc5VzVJUEFh?=
 =?utf-8?B?aFhGUFExdDA4VTJvTU5PT3NNbVA5OWpiTE13TGFFMU9hSmdKclkzek8wdFhL?=
 =?utf-8?B?dTg2VkV5NmxzQkVXRXUvalZtUTZadDZWQ0poZ0Iyamx6clVDcWt6WlBHMDNj?=
 =?utf-8?B?dVFyTlRTSEVVUTh0VjhXSkFxa3ZXblNkQjZZaXNxY05BWG5ZNjExbHRGVnNV?=
 =?utf-8?B?TGZCcndFc21vbHNoUk43VUNDR0tWK3Q3eGJJa2QxUVh2c2NCL2M1OXp1RUFF?=
 =?utf-8?B?WXZuRUJ6alpqRjU3SWhrZG9vR3hOczc0U1RhTzZzUmpoVzc1MnJVbmdaWXZ3?=
 =?utf-8?B?YXNQdjEwQlBiQUlnTzNkT0Q5amU1VlExT3Mxa05PQjdVYlhqdlpvc0E4aU9D?=
 =?utf-8?B?WEsxeWQ2WjV1T05JQXlleWpvVXJTL1R0ZzNNaFJtSkJNNGtpdXY1R2EvcmlR?=
 =?utf-8?B?VVB2UStBaXk0UTk3RnNOM0ZpNHQzelpQVmJUbEdMTng0Vkpka0ZsWU9oU1Vw?=
 =?utf-8?B?MTk5WjlLckZxMTdzTi90UGl0MkRjRjhmYXZGbW82VWY1MGZNYytPUjFFeVpa?=
 =?utf-8?B?NFpzRTRWeUxYb1hYSjdMamk3ZFVuQTZ5KzZrL0J3NEZhOGtRVWNaVkt1d0dY?=
 =?utf-8?B?R2EyakRJdkNobS94VXZiZWVFZk95VkJyMG8wNFRVVWgyNHVreGExSmJJbll5?=
 =?utf-8?B?TWl0MzVGZDVlUnZRTjNRaXB6MElUZU94Rkg3ek9KTmxobCtKenU0YXJvV2Js?=
 =?utf-8?B?OHhURWpVVmw1K0ZXaTgrcmxsUnBCNVdCVE9yQVpqeTFCRXhIZUl3UVRHajVv?=
 =?utf-8?B?MzZtUzhaS0g5d3ZKeCt3L0VRSDlSZ1g2aXRWanJDVWlRWjBRMnA0MldDZG9Z?=
 =?utf-8?B?aU0rb0JwanIrdkcxRUFGRHdYUE83ZHMvcWlURnFmTGtnWFZxbnh4R2hRc2k5?=
 =?utf-8?B?dnZIR1hjN3F0M3pJa2hLTjcya1pzYjdpNTVxZzJWcndvTGhOalorZERDZXpm?=
 =?utf-8?B?b2hGbjkvbFl5S0tkRFMvSDUvQVBOZVhQWlFIMHlOeDdFQjluZXIySXVueUpz?=
 =?utf-8?B?eVdRMWtTMExuTFdBL3VBWGJlSERyNGZ3Y0dseXRZVU9XZmZXQzVlbG5hMUJ6?=
 =?utf-8?B?Ulg1K1d2U0hkZmZTdWdSYnpGL1FmSm1wYVJCNS91WVljRUVvcDNDcDNTYW9k?=
 =?utf-8?B?dzY3ZVhqZGtRb1ZtMFdQU3A4SVZjTTk0bS9qbkx2bUpZUDFJOEMrRTVFTHZ4?=
 =?utf-8?B?N0dwMURZVHdHbklJOU5HRVE4eC9uV3g1WEkvOVduUzZoNEFqK3JObzRYRnF3?=
 =?utf-8?Q?XXy2uB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:44:04.3480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808b7bc3-4b23-4ea7-1be3-08ddc9607f37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

Hi,

It largely looks OK to me, just a few small comments below.

On 7/18/25 05:16, Anderson Choi wrote:
> ARINC653 specificaion requires partition scheduling to be deterministic

Typo: s/specificaion/specification/

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

Typo: s/sceanario/scenario/

The line is also too long.

> the expected next major frame.
> 
> Per suggestion from Stewart Hildebrand, the while loop to calculate the
> start of next major frame can be eliminated by using a modulo operation.

The while loop was only in earlier revisions of the patch, not in the
upstream codebase, so it doesn't make sense to mention it in the commit
message.

> 
> Fixes: 22787f2e107c ("ARINC 653 scheduler")
> 

Please remove the extraneous newline between the Fixes: tag and
remaining tags

> Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
> 
> ---
> Changes in v3:
> - Replace the while loop with the modulo operation to calculate the
>   start of next major frame.
> - Initialize major_frame and runtime of zeroth schedule entry to
>   DEFAULT_TIMESLICE not to use "if" branch in the calculation of next
> major frame.
> 
> Changes in v2:
> - Changed the logic to resync major frame and to find correct
>   minor frame after a miss suggested by Nathan
> ---
> ---
>  xen/common/sched/arinc653.c | 39 ++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 930361fa5c..b7f3f41137 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
>      ops->sched_data = prv;
>  
>      prv->next_major_frame = 0;
> +    prv->major_frame = DEFAULT_TIMESLICE;
> +    prv->schedule[0].runtime = DEFAULT_TIMESLICE;
>      spin_lock_init(&prv->lock);
>      INIT_LIST_HEAD(&prv->unit_list);
>  
> @@ -526,29 +528,30 @@ a653sched_do_schedule(
>  
>      spin_lock_irqsave(&sched_priv->lock, flags);
>  

Since the num_schedule_entries < 1 case is no longer handled below, we
depend on major_frame > 0. Please add
ASSERT(sched_priv->major_frame > 0); here.

> -    if ( sched_priv->num_schedule_entries < 1 )
> -        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
> -    else if ( now >= sched_priv->next_major_frame )
> +    /* Switch to next major frame directly eliminating the use of loop */

Similarly to the commit message, there was no loop in the code before,
it doesn't make sense to mention it in the in-code comment.

> +    if ( now >= sched_priv->next_major_frame )
>      {
> -        /* time to enter a new major frame
> -         * the first time this function is called, this will be true */
> -        /* start with the first domain in the schedule */
> +        s_time_t major_frame = sched_priv->major_frame;
> +        s_time_t remainder = (now - sched_priv->next_major_frame) % major_frame;
> +
> +        /* major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
> +         * if num_schedule_entries is zero.
> +         */

The start of the multi-line comment should be on its own line. I know
the comment format was a preexisting issue, but since you are changing
the lines anyway, please adhere to CODING_STYLE on the changed lines.

>          sched_priv->sched_index = 0;
> -        sched_priv->next_major_frame = now + sched_priv->major_frame;
> -        sched_priv->next_switch_time = now + sched_priv->schedule[0].runtime;
> +        sched_priv->next_major_frame = now - remainder + major_frame;
> +        sched_priv->next_switch_time = now - remainder +
> +            sched_priv->schedule[0].runtime;
>      }
> -    else
> +
> +    /* Switch minor frame or find correct minor frame after a miss */
> +    while ( (now >= sched_priv->next_switch_time) &&
> +        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
>      {
> -        while ( (now >= sched_priv->next_switch_time) &&
> -                (sched_priv->sched_index < sched_priv->num_schedule_entries) )
> -        {
> -            /* time to switch to the next domain in this major frame */
> -            sched_priv->sched_index++;
> -            sched_priv->next_switch_time +=
> -                sched_priv->schedule[sched_priv->sched_index].runtime;
> -        }
> +        sched_priv->sched_index++;
> +        sched_priv->next_switch_time +=
> +            sched_priv->schedule[sched_priv->sched_index].runtime;
>      }
> -
> +    

Please remove the extraneous white space

>      /*
>       * If we exhausted the domains in the schedule and still have time left
>       * in the major frame then switch next at the next major frame.


