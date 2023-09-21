Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659B7A9504
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 16:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606461.944378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKEk-0002M2-U8; Thu, 21 Sep 2023 14:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606461.944378; Thu, 21 Sep 2023 14:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjKEk-0002Jr-RM; Thu, 21 Sep 2023 14:00:58 +0000
Received: by outflank-mailman (input) for mailman id 606461;
 Thu, 21 Sep 2023 14:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlvV=FF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qjKEj-0002Jk-8A
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 14:00:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47f44d12-5887-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 16:00:55 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 21 Sep
 2023 14:00:51 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db%4]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 14:00:51 +0000
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
X-Inumbo-ID: 47f44d12-5887-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiIjO9ZCUbPQXDnteIuGkk3EBvj7Y0lHNYNiBmZRSurqYBRdzU8+QChvimqckHOrLDbVtEff1PMYJc5J4lasSZfDPIme1rIgWZNOXTmvtEgk+7zMDzeaYElk6ipQ3f6jVOb4reciSn2IKEM+qJzOqxZk/YyNaza78Uy3mKunaePf4xwWwxbf1n+JBWQN30DkS8BaQt6Yz1iCz2QQk1lQ8hNnlZj72/yjLSPm89AuMJxKVTUu36vcpU0pjtZdYXaa2FZ8dHlhcN2en/yRTOBlfwrVDHhv+oIQjYNBvbW/gVDGK1XVr12qqTXikysBQMUDqZBM+XKCdmni/zBbk0FRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxTwrY1bZAbU8ix862Q1RZqDK0+sWRQeS8HcUcmxc2E=;
 b=Dzc74dcymLZqscoKFm3QopzFjg//4G0LIXZMy1Trw7YtPCG564Py6hOq7j0OrVujot7hGhqP/pC+Yb7vDyWf+wWlmRpVFuXPNfNhzrmOmI3ha+fjP5+jpgBAYipkGT+eOh0aDzP+sr3N+ZvKh4pZmVKpJGvESCNdcNbXpq570sLBy5Q0rHlxGLpwL51XfhimCqLkn3Rr+IEQl8grIZsqtnb48x3CzWvkxZWaqzgGlnKpjmSopF5eDl7+PplPQl7zPtQSfwQYQeKPYNXKEnWEYgp30hj2Oy0P55qHL6B9lSwXNfeLIe2gsxlbVKR9vhZD4rk8w3EzyYL6LiAmvgmkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxTwrY1bZAbU8ix862Q1RZqDK0+sWRQeS8HcUcmxc2E=;
 b=dw3oLI/5O5ISVQLeBsuejMRgt3iVf6pmPOU3rGGOQCwTJFVJ0dp13J/lUJq8iJ7UzPK/vwKq7RgvUbROiVQIWKFvdyc6aawkDwxv8PkrJL0rI7/yG9nK9DM5Y1FHMNralXxQI9IFpbVgPWi/deJJYzFM44iK2jIWkTHjfhn7h+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5f3d543a-b701-d401-ac70-6438b603399a@amd.com>
Date: Thu, 21 Sep 2023 15:00:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/arm64: head.S: Fix wrong enable_boot_cpu_mm() code
 movement
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230916040649.1232558-1-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230916040649.1232558-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ab3b8d-d675-4d95-1045-08dbbaab2a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENhMCiv9uFRzzgRr50s4UZJJm2DUgeOQnecx0RvgjAFEUJJyYAN1X0TZfo0z+ivImMDMLL5Ftbl2DygZbVCYTxqipP8A1gayJSUOPclCfrzYsA/OsCVZlneCcbwsGH7uS49L78x/RzlJWYbKu98IB0TIoxqxMhekUzzi6Z871AkXoF4dRF3UARpDqk3MLerb6kpGQAvE1pKSoPIxfzIH7WPvtDDQFhAgHcpiHTlAfZcqX8mXQ7oTzCq66pmUjL+8ICX3IN6XXfiJz/8iJMcBTUmfxYYJLKka7aFPrvhmFBAz108K0MBwemBB9a/nFKRdQippCv26QJ/6rKBKm5EC4zhisGrVvXyCwItBhdyzXoei4oPXaueHXAcDoBPyceSDY6aQDS/xh3hnzwCwsqX92HXt/NJ0ppz2rtOrm12DWxyPM7MY+ZpVxDDF+mjrgtVfCbakOZO0FVxZAnHuI3nZbcclETkhiHlCP1xN5AsMIs7cCoOvZcDv7Zocpcyfo4YbwI3fSdmmp0jlt4/VZN5KDYq/sZRMFpVQ0h/5xj2LyxrevjfW6k4czZZXue5yvdtE6/oeyIUKvxJUOxB3XyZ7O+OgkrT4C345K1OZxSY47e0LmkrYY0NXTa/h7XszLZhMFkDozT/BZaqObUphNvdpdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(1800799009)(451199024)(186009)(53546011)(6506007)(6486002)(2616005)(26005)(2906002)(6666004)(54906003)(5660300002)(4326008)(8676002)(6512007)(8936002)(36756003)(41300700001)(66946007)(66556008)(66476007)(316002)(31696002)(38100700002)(478600001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhaUmRVWWVVQVFWbitPc3NheFJGdU5ndnpQNHMzblBtS1c5cGtzOHM1Z1ZT?=
 =?utf-8?B?UkFwa3VqcFVid0luSStsSnV4dlJ6QnphSXAvaHRzTGlReEZDQ2hWWEpORS96?=
 =?utf-8?B?QVJuaGg0VUtHQWVoQnhRNUpUcFBLS3M3Z2ZVa2JnOWR6ajZpdWtTa1FwaDhn?=
 =?utf-8?B?ZzltbFFjQVM5M3dOUlFKbXFUR2tBRmpIeHpxN2RSOGxVMFdTakhUanVFUGJz?=
 =?utf-8?B?bFlkLzE4aUoxbTZnUTFpNGZCU2lTUVZkSFRLUU9CWXdHWnEvL3F6Z1I1QlFq?=
 =?utf-8?B?UURFQnNpNk82bVFyM3ZBTVdYZkszclNwVjlJdElhOVJPeUtvaXQ4SkROYWtP?=
 =?utf-8?B?M2dmZGdWcjdkMWZQZ3hNaDZROUxLZmpJaEJxNm83K0h3amQzTW0zMk9aOXpo?=
 =?utf-8?B?R3BBWis1QnZ1MWJmT0lXK0xtTHliUVpjU3I0akNCSWNLdnBqc0pmMWgvWDlv?=
 =?utf-8?B?OWVTSytaaEZsSUJnRGRydGx4aVlhR3hQeFNxQncvK2dXT3llSllSb3ZoUXUy?=
 =?utf-8?B?ZCtNUzlOTVY3MDA2ckFTdUpvTFB0eVR5L1dDVWxyMWNLbFRzOWMwaHYzazZV?=
 =?utf-8?B?Z0JyOWtiYzZSUGNDUHVZaTVTd2VYd013SU9VOEdldU9sYnJneTc0bXVyREJ5?=
 =?utf-8?B?ZmtmWVQ5NFhOM1BtZzM0VTRhcUpSM1VJcWJNOHlFNTBtbFhVd0N6SVgzR2VK?=
 =?utf-8?B?eDQvK2RFMGxDUS9uSjVReG5qeTd1RzlzZjdkUitCZjZDUUlBeTY5c2dhY2Ex?=
 =?utf-8?B?QkFMcjRNR3Q5KzJrTkhWTkRndzhTcGtXRUEvalE3c3EyK3FkVllCaFlHNGIv?=
 =?utf-8?B?cUZtNU54QS9IREhwUktTMmxBUTBxRkIxSG1LdWVMMkJQQVBxNUJ0MGc3emw1?=
 =?utf-8?B?MXVrTFM1UGtDcTVjSThVbU0rMWZTUkFUUHdOdU92MkVodytuQm0yWG1JYytK?=
 =?utf-8?B?c1RaeWY0cXFrK2RnTWtpUVNDbXVtc0ZaakFYUzhTOUp5WjZEdUQ1RitXMThn?=
 =?utf-8?B?eTNnQmtyZ2lhd1djaEZzU2VvR0NtaXFybXo5amdsaStFRm9qY283M0dPRWJz?=
 =?utf-8?B?V1ZVUVdWTU1QVHY4NjJsQVNlTGpRSVJFOWkvTk1XQm9sQjlMVms0Wmh5OUlT?=
 =?utf-8?B?b0xZZ2lvaG1HVW9XSmtaTVprUStZVW0rR1Y3d2huK3hGN3o0WkNuTXNkSGts?=
 =?utf-8?B?Nm1zeXh5Rm1FdVVYekZYNnppSGphb2x0NGVhRzJLZ3BTMEVqUXVGbDdMUUF0?=
 =?utf-8?B?YzM0N1hMRVNCQW5VZTRFR1FGWnd2SDVweC83eE5SZjVRNXdFQUhKUEpTL0JF?=
 =?utf-8?B?ejQxZVpuSnBVL3ZKTGpWaWR6cm5pbjdmWi8vZDZGcjNhS3h4RE1NQXZ4OXhR?=
 =?utf-8?B?TEZ4NG01REZWOS9IYy9ZcEc3Y2V0VG1GbUFCeUM4cDBRTUNVTXhaclFMRE1S?=
 =?utf-8?B?a2NITVZyMmpPQlBEcEVVbkRFekFxRURkOUdhczVERWZ4b0VqZGtzc09PeDly?=
 =?utf-8?B?b0xLc0VxaHFyVWJEUkJpeFdqNitUbXRtRHpaVjBvTkdWdnBSTUQ5WjdCUHhS?=
 =?utf-8?B?YVJ4ditEbE5GdnoxRWlBSEErcmNmMGNYbXVxSzF3NEpZb0ZHN3poZzU0T2xU?=
 =?utf-8?B?aFFrSzY3UzMvN0hQMllnWDR6L1FFQWZ3VHNIZlNqWmZ5RFN3bW93WlZ1Mm53?=
 =?utf-8?B?RzJ2c1BoZzJUTXFGeEV1anl2TVFDL1BqTy90bXFqK1FLYkxsTERiNmpraTdj?=
 =?utf-8?B?Zm96RUdLVTNUWXM0VUJ6ZVNsRnNYdUVXcTZwRllITXVtZjhJZktxMWlwTHlj?=
 =?utf-8?B?aUxMV2NLdzRLcGVqVW00WEd5Qm9UamhrelMvdnhJdGs4SkNKdVRhNURFZTN0?=
 =?utf-8?B?KzdDTVVWSG13MlV4NHE5NzVON0tOS09uRm9PNUZQWVQvb2FaUFVRQU82SDZR?=
 =?utf-8?B?eGR5eWF2UUtwVWtyNkpoaUx3b0UzVGpqcmhFT0N5K1d3Rm5HSlJQZnJxbmhp?=
 =?utf-8?B?K0c0Vk5ZU3BSMVhIc2YyQVZnVGcvV0I4NHV6bTNSaEtrSkwrV2YrS0NzbzMr?=
 =?utf-8?B?Z3o2Zm1Bb2pibXBiUnhRTHF1WU4rVGhaQ3E4bEZNSGY3TWlTRi9WanhaTzcz?=
 =?utf-8?Q?yYKAhyagHH9TMuMdsceeCQLKS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ab3b8d-d675-4d95-1045-08dbbaab2a45
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 14:00:51.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b00Yul5js67VGNAIF7v/4oZxtUe5+QOpbU7AEod5iGz2fjzk9jY/GyqdDqPlAU8CrRaH3hjbzU+tsXuXM0xn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495


On 16/09/2023 05:06, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Some addressed comments on enable_boot_cpu_mm() were reintroduced
> back during the code movement from arm64/head.S to arm64/mmu/head.S.
> We should drop the unreachable code, move the 'mov lr, x5' closer to
> 'b remove_identity_mapping' so it is clearer that it will return,
> and update the in-code comment accordingly.
>
> Fixes: 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to mmu/head.S")
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/arm64/mmu/head.S | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index a5271e3880..88075ef083 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -329,7 +329,6 @@ ENTRY(enable_boot_cpu_mm)
>           load_paddr x0, boot_pgtable
>
>           bl    enable_mmu
> -        mov   lr, x5
>
>           /*
>            * The MMU is turned on and we are in the 1:1 mapping. Switch
> @@ -338,19 +337,15 @@ ENTRY(enable_boot_cpu_mm)
>           ldr   x0, =1f
>           br    x0
>   1:
> +        mov   lr, x5
>           /*
>            * The 1:1 map may clash with other parts of the Xen virtual memory
>            * layout. As it is not used anymore, remove it completely to
>            * avoid having to worry about replacing existing mapping
> -         * afterwards. Function will return to primary_switched.
> +         * afterwards. Function will return to the virtual address requested
> +         * by the caller.
>            */
>           b     remove_identity_mapping
> -
> -        /*
> -         * Below is supposed to be unreachable code, as "ret" in
> -         * remove_identity_mapping will use the return address in LR in advance.
> -         */
> -        b     fail
>   ENDPROC(enable_boot_cpu_mm)
>
>   /*
> --
> 2.25.1
>
>

