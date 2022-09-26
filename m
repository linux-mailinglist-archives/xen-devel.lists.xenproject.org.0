Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CB5E9C3A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411494.654441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjga-00077x-2A; Mon, 26 Sep 2022 08:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411494.654441; Mon, 26 Sep 2022 08:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjgZ-00074b-V6; Mon, 26 Sep 2022 08:41:55 +0000
Received: by outflank-mailman (input) for mailman id 411494;
 Mon, 26 Sep 2022 08:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5U7=Z5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ocjgY-00074V-Pm
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:41:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11aa3af1-3d77-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 10:41:53 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:41:49 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 08:41:49 +0000
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
X-Inumbo-ID: 11aa3af1-3d77-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SX5eax7kLne2lvsqUE07e10zMehzayLVe3mUgglgISEKR6ueyAVwAy/6ya+9PoB/08QUodjjfCMknLGzZZN6cGxxZTBGLl37Mpf1ADWzJ2JWwGekjFJJxxlstQWg4c200Gzz4kpT9Umk6hdGtPskuRsDZB3GYFwCVY6QMCu7ygzCzZc0lL45H32WUxavx4BkVbXFjDIK7qz/npNU72gHvPpf65S+oV3K4P1GexAGE+Pl4FlixiQiLcNuRuq1+FokicApTbVE1+7MHdQ3P64gdUr9Y+iY7Amv86ODO68Pc4Hbexkrt0xnC2R5fY0l/GNznZWF/4zjyyGGi3XmS5OZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmnPbBvRwJJ0v6/KydytTfPjn46lb/PXbnpqMrg2H10=;
 b=knDEEIAnDIio9WIPdu3qwtCWSgSp1Ug8a+QR9xhpW5keigEYCAsAXf4j5X3TH7+nztWwxqIUM9iAiHFHvniyY7WRZGHw4XlwFuXqoaXzx5y5fz5w7iePBYVSa4K4C3SqJkX4aOxGYx+kzfqkDwCWIm+2mWu2fCaI3zgbTG5cKTmU+soRxr0ck3q5hZManVcjk0hDY35jWzixC+gKHpQKPL3hnC/gI7qLXoy/uwYl5WRkAUvqJq0tUEBbtHswEYyYhMg/ELbWuNQwHwNE/wuXT8mcJX/T8M6FA9r0CFbASlDHVcE0ksjpuOBduTgi12/czln3adgxQwXx+IbuqC4TiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmnPbBvRwJJ0v6/KydytTfPjn46lb/PXbnpqMrg2H10=;
 b=ZrUbgIN2WK1YYY1ASs3rp25wRssGW+6B2Hpo0oH05WqK3xFuWaQIuOBhlDkxHb/Y8wF1sE9AwwhdtzN/A/6gwmjTwlrO5G+ye+xeB3ySQRNkWO7Yo2HcmLg3mTUoUIfgoNbf7BTehf6Pe3RzRGS+9PG9F16k1FWj0ldKioaYlfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <93fe747d-b2ce-4d8f-b574-ad773f3dc9f9@amd.com>
Date: Mon, 26 Sep 2022 09:41:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: Add static event channel in SUPPORT.md on ARM
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <02a4499694dec9fd48791a2d0c24a0d450b907ac.1663928523.git.rahul.singh@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <02a4499694dec9fd48791a2d0c24a0d450b907ac.1663928523.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CO6PR12MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8060ac9d-0a3c-4e79-de84-08da9f9af40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g4OzeOfwOn7FNFhKGIt6/ySbSVDYKg8ltVPqEYNdfkU0JVXh0Df0ThXgxkDQLMHlkgVaEQlyEh5YKXhLzirCYCZtj6FLkHDq/lXuvnOgLeTti6S33hm8zl1b6lIiE2BPyz1h43l/Fma3+LJ+OPsmHc7cw5dB+iupZvds3S22gxSu4TLpb3Aoz+zI0iLNPPCXWfsLOMHlifgWLstLy8k4rlK5mKrKujGfsqmJjtdCICLJWVXtXjpo60/zuRqRTKmUSrySTX5NzE37jwsMt1hD5/SAYjJDjLB99LvmtEVJ6tr5uQxosEniCm42IP4WGwyvBDHVFIyrHW0yg8aG6gvhOaR9QNYp6UOgTsaKOc2KnGqUfPHLMbokCgkXT1zuyCx8m2rL67i3H1+ujEwGQkVvGD91UWSzeoTALb9VzjUfbRrXhwuEyrk0Dor2deoO1HnozQjjEuQRpFwqsYCkg84wwnKKwBSclsmDtoBDouJg9NYXIQ8ysBTZ94OGuksgc09Bf95anaJ2SoNusqxwswhxQnvwm0qGzNo+0VfUtfw7pc6qJyMPy6iPtLxx2Th9H3RPLW0baWJTQrmtWNQsiam6O2NT71F81gdK0Py7a5DP0yCXJNdMO9ILrTRZMM2UQ8/P/RpLyacc1nTF/G/e+F+XpD/Wok2aQmwt7wNWkvlyjF3NPK9Z8rX9tYjloLLNTfrdwxwcP2NNwROieXvCqIfUQByymcS5rL2I7Qov8P0SYEEYpd7AuugHTq/Q6uDNXDI9yU1wK2UsMarwUieqdWPMCcNN9bhDJpsYjjumG1FLg3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(2616005)(83380400001)(186003)(38100700002)(5660300002)(6506007)(2906002)(8936002)(53546011)(478600001)(6486002)(41300700001)(26005)(6666004)(6512007)(4326008)(66556008)(8676002)(66946007)(316002)(66476007)(54906003)(36756003)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG9GRGtwd1dQcGw3aGhrM1VReWoyNHRENURqU0J1aDgvaEZvRTFCUjhHTGtY?=
 =?utf-8?B?ZVdOWUJoSjBkYm9IUHNuZWJFakEzZjNnRmJsOFQzRDN2SXlmNmxRNXMvTElr?=
 =?utf-8?B?OCtPWWtNaDNOUHZnTnpUck9aMys3dWt4dmNyQUdSeFV6cHVpZXRlTm83NHRQ?=
 =?utf-8?B?WW1IUUF6emlNb0thaVh6VC8va0hqVDJINVNOSzBEUnkyT3ovTWJrVlhWZFg0?=
 =?utf-8?B?Sm1TSHVaQ2pvMFNXSld5R2E1cXZwZU9yaVAvNWVRR3JZOUVhbWZta1IxS3Q4?=
 =?utf-8?B?YTBpdG5uRUdOdHBWZmtwQi9oUzNHbEJiOHc0MVhPQnpNZVowTklXSGhKTTZ5?=
 =?utf-8?B?UHllRVB1eVpjTDNYdnF3aCtkLysrR2VTSHh2ZDZnNGhjOTdRZ2dRN0JtVHdC?=
 =?utf-8?B?VlZDMi9GYlNmWVpTcXZTbkVKUjVMWldSbmdkRjJaUFZPd1hpOGtWTGNUWEM3?=
 =?utf-8?B?WWp1bTlPRHZDWS9iYi9NMFNzZVp4TUMwbElZbEVlcGZoZVhTUlZZSW5zbkcr?=
 =?utf-8?B?Qlpaa0VPR2xxV2x2TDM1QjRaZ1IrRVM3ZGZ2emE1RW04Rlg3cXFIak1HSjc5?=
 =?utf-8?B?UXVMTGw3OEhjeXNnY3JGV1ZoajNzOWp3Ny9yQXlCblk1VUkxd0VBTzBLOHZ3?=
 =?utf-8?B?NTllMnQybVpSWkxsVzFqVndoMmY1dm1mUTVnckNlSUNYWTNkZXJ3VEZ1S2ZT?=
 =?utf-8?B?QTV1K1JDYUMyeFowNjAxLzhmY2xtc0F6NWNLYWhzTG9JeE0rYmQ1amdRTnRU?=
 =?utf-8?B?SlNlQ05QQTE3a2Z0R1JQanhZcER4UXJmM1F2M01pSk5ocm10Vk80NlhVbXU5?=
 =?utf-8?B?OUVibTBkU05jYytEZThWYk1ZbHFLY3JDTTQyWXdLUkRYYkdnVGpSN3NkTi9I?=
 =?utf-8?B?c1ZVRTRab0ZycFBUS1dTdi9rNGJrSlIxUHhtMHpGRkhVbzFwVUJqTEV0V0Iz?=
 =?utf-8?B?dG9mVHJUeUpzWk0yejFjbDNRK2xJQXJEMFFSM3Bpb1BqNmNJaVlwNjFDbDJG?=
 =?utf-8?B?dFRjVk5xRGRGZlJ0RE9BenZIKzRJMTZ1VFBLWXgvc3l1TE1KMkNPQ0tCY2hQ?=
 =?utf-8?B?VTFGZ1pHelpOdUtualJEYWFqWGNybm5YTVNtWXRxSW9rcVhSdUZzT0V3YkdQ?=
 =?utf-8?B?aHZJRUJGdmV4QzBoa2dqbTdxcEtDOFpiN3VDM1VuZGQvUHU4dngyd0pXQTZM?=
 =?utf-8?B?OHU2bDJvQldkTVQxUUFJbGY1L0VPNGk3bWZ1aElqdlYxRVpMTVBGRUt6cWt3?=
 =?utf-8?B?QmhScUtaY21jWGdtY0t6QnBCU3YyRHY2Mkw5eEZNb1lNakJ0SDhoclR5QjR6?=
 =?utf-8?B?V3drcitkdUNieG9mdmp4NDR2UnFTbW10bmxZQjFqa3RyeHhZVWxpZlQzUjZB?=
 =?utf-8?B?RFdicG5oRTJUZkRxQXpPYnZUYStkVGJjU1JIUDRjUHoxYjR3TlF5MzZ3dS80?=
 =?utf-8?B?bWlpNmQ5aGRLNVZIRHE0OVZSZkVTU0lGQzJBbGFkZVd1Q0JjRTAreWptbEg5?=
 =?utf-8?B?NitvYkRyenNaeXRLTUJ3NGdNK01ZOEpOQ1RyQXlRWng1MmhLaC9YUStXTHRR?=
 =?utf-8?B?ZkV4MU5jMG8wK2lRekZxaWp4cFdmZFl5YXpkNG5IdVpzeFNFL0Q3dFRST0Zm?=
 =?utf-8?B?cklGdC9PWnhWTGJCT0RNTENKY0NjbnJzcmVVQm5BUjZERmVNVDd1ajE4cE0x?=
 =?utf-8?B?VFZKaWp5cDNURllaeVQya0s0RWEzZDcyWWN5dkFuN1lJSmgxZmpOdzZTK1pR?=
 =?utf-8?B?T0t1cVJQODFuempBL2V2RDBXMzJNZmwrQmtDNml6NkwrSDYzMnFYSDYvQ3Nu?=
 =?utf-8?B?S2hWOWs5cThkNGVXWkdxa0toWmhEZ2dCS01NVk5nN3dJSGJoKy8wZG9CcU12?=
 =?utf-8?B?TXpvSHVmMEZheSt3bjBMb2tLVnlRWkR1SkJQTVBhV2ZUQ04zVVNBOXdyb3Nu?=
 =?utf-8?B?bGZuSC80UW5FWlBhQzYzVm9sRkluVmVKZjBpRm9DZTE0YUsra3VwaCtWT1N1?=
 =?utf-8?B?S3p5OE50UFJRTXMxM0tIaVpLN1JIaEM4WlFvcjZBZ3p2SEduME0zMEIzY2ND?=
 =?utf-8?B?NjkvL1BIZ2haWHVqZGg3RHhHb2RqQ25xWTlieFVLK0pMOVhTMmxhdG5FaFJu?=
 =?utf-8?Q?zbFD8xqBLOtMDipS5Mm5rCFFk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8060ac9d-0a3c-4e79-de84-08da9f9af40e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:41:49.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CAimJ84EoOXuzFV+XcWL9XXPpNtwyGuJXf5tRQzc5FrmN4+4oNGMCdfuZJZR2Ow1+gUxXojNnQs6RlKvkmAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441


On 23/09/2022 12:02, Rahul Singh wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Static event channel support is tech preview, which shall be documented
> in SUPPORT.md
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   SUPPORT.md | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 8ebd63ad82..29f74ac506 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -922,6 +922,13 @@ bootscrub=off are passed as Xen command line parameters. (Memory should
>   be scrubbed with bootscrub=idle.) No XSAs will be issues due to
>   unscrubbed memory.
>
> +## Static Event Channel
> +
> +Allow to setup the static event channel on dom0less system, enabling domains
> +to send/receive notifications.
> +
> +    Status, ARM: Tech Preview
> +
>   # Format and definitions
>
>   This file contains prose, and machine-readable fragments.
> --
> 2.25.1
>
>

