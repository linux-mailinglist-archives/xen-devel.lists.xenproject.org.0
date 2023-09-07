Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB2797154
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 11:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597221.931427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBZV-0002hP-Bl; Thu, 07 Sep 2023 09:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597221.931427; Thu, 07 Sep 2023 09:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBZV-0002e4-8w; Thu, 07 Sep 2023 09:45:09 +0000
Received: by outflank-mailman (input) for mailman id 597221;
 Thu, 07 Sep 2023 09:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=luvz=EX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qeBZS-0002dx-Te
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:45:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 385b27be-4d63-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 11:45:04 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB5509.namprd12.prod.outlook.com (2603:10b6:a03:1d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 09:44:59 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 09:44:59 +0000
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
X-Inumbo-ID: 385b27be-4d63-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgpP+H4qPXZoAGn32eG83lgWpLlnQyTTP9mYfWlxNv2n9fciaF/g1WnqLt/ENEijIqAnpLf5BbElyjjLjXVovW70ndCZ3MJFqGNLMqk5azwH8eRMYT3nLUUCWPjft3OHAu7pOjk5dsL4nQ7fVDqo79RlrTNHLHVYXhV8QW7P0GNgF7UW+ZPZpIqrSgEzlIkvb8662tmjSgcaNm8mCGM+dxcRnPBusvEuX48eaa3kaHr9VTQnk75Xsl0xB+Q8cIIkGTOeEeAOqp0YWsZe8yPziCk34zhJk5wxlzKYR0W387RjAguol2ng8uC4mtTPUkwynGRWs8d5AZczg/qIyKCx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu50t3jLnEY7Y9H0YEJ2x1IetD+YDpbOU912fwBgPnM=;
 b=CfLSfo968kMzSboO7bHygdanikrvvWqqy7j77hunUrbmkG6SLBco/aIJSTVBSEGLBapc5L02IZKQvqrgdRFD3nnLy8/vMU8hPJRmyra84kWZMsb95BORT+lWzdluBdPkPqytZAvZewAWv//e4alRM+VDUciT02WbvV0cqt5/ziRqKIxAWddH8ObBS+3BfeN1Ocgc0J6v0L1mYlZAuGxdOoS2pjFknmX2tqTdgFHpSZcbMaQA90AAkdquCNayLsghWuStSCkxIhIdmxlDGTfqTSGqMkNMAH/Q9DqpWmQzSabbyGNQRhkMzlCLgWviEhAJLV7T7bUZp5ccsID+Xl4Zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu50t3jLnEY7Y9H0YEJ2x1IetD+YDpbOU912fwBgPnM=;
 b=HEPLiy8Vb/NuAuvJHEEi4Rkc9/Dgh1BTfSXrq1UD2UBKO2+1HxsE1mt++z6RXybUC0ir+oU3Vha71+PfueEckQmYmzfEoLNciSWz+lhjop7wf6LcQwpvoYaX4LPj/zAC0vyrXTztJ781ny2CkdXH3lwgCm3S90XGXc2NM6VaXrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b86047a6-f394-8dc0-a4ee-87543d6f9204@amd.com>
Date: Thu, 7 Sep 2023 10:44:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v6 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-2-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230828013224.669433-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB5509:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e56c03-38cf-4eff-071d-08dbaf871a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9L207Al3atjozZmKV2QkL3hUxCVv1G5hNvZAYF14lhBEBQhgOZpAuJrdcWpVs16d0zwB7f02TQHSMyqlOJdHv0zTLKLNm9/IKEArXAbJpXpIjRj8FDJOLTVQuuA4Kt7BV8D1CfPpPZnKN5ra6skJ9J+W1n3YzDXJv5OhIUbc81uzCnIF8i94VJtmk1KTWLUk/qt4vfU2rXxZU3bzIoGF7EZaSbzt+24VRTzc09ox49jkQEiz98n/+TenU/0jyceQVQgzYTxZlWNyiSv8OI0kzHGysX07z1Vt1P29mQ6MedDHdebUQeAD60TMX03H/2Vwf2l+80A4fy4zMsirkxDi4cGrhECg9DPGEJ8kdYHdrWwHKh3D2NToXgACR8kSChswHX2sqXO3dWOxeHtC4dE9HpmJeh5PfRncvcL7+pOca1LrUQ4KhWaGQOQb1ee+26xnWAfYO2EJviOQFQ3mOzH/7kVML183gLfhCTUCkyOKjvqSBkzl2xvIfJ+7KQwsaXtZr3kGM7vVrSRpu41bk9dqQ/ZbbE0oW5vcFxZcIaggLALQA5bG/3TR+xct6bA12uiIPd1OVDG+A1TtBhwFzyfv2TjC17YQ22SE5C9IS2DhNvcebo0FV9pC3Dj5xywnQAfWADqBwJjsWKr56OMMwC6IoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(1800799009)(186009)(451199024)(83380400001)(8676002)(8936002)(4326008)(66476007)(66556008)(54906003)(66946007)(53546011)(2616005)(6512007)(26005)(6506007)(6486002)(6666004)(478600001)(41300700001)(2906002)(316002)(38100700002)(5660300002)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVR5OWZIdXlvcjdDZm9NYlVIVzJxd1FRSk5adW5hSjNRbXNWZEQvaFcvV0dT?=
 =?utf-8?B?SGFlbkx2NWo2V2pCNkd3dU1QS082THhYSXhoOWRCVUNweTBOY2VZd2dUNVNI?=
 =?utf-8?B?aXlYZUttMThYdG1xZFhVUHEzZ3QxdVM4YTBVNkFIdHFxRWRvbHpkdi8zVVQ5?=
 =?utf-8?B?Y2Zyajlnalo5NjgvLzhlQUtFbjd6QmRHemlPdXh5Y1lJSnBjWUczNitKeStI?=
 =?utf-8?B?QnFFS29BRElBeE8vV0Yxcml5VDJpanNGSWcrbnJYSXU2bVBjNjY0Z2tCQ3Bk?=
 =?utf-8?B?TkFVaDZwK1BDa1I4WUN5ZG0wdSttMUo5WmJnYWpPaUQ0L05pWnNHeHdTanVP?=
 =?utf-8?B?UGc4WmxwLy9sOE9YaHFIbUEzRmVEK1BzcGhjR0pYYUk3VS95R2s0WjlvSkNn?=
 =?utf-8?B?Y1kzQXdBMk5uUnNKU0loZzNkbHVYMTRGNVZ6V1BIU0daVVZyWlNKTDYxYWJa?=
 =?utf-8?B?bThOQlQvUzhycmNaSkxpS3F2UzVTQ1dmc2tMcGxSWHZFcFFSM0ZGOEIzR2xm?=
 =?utf-8?B?TTdWN3JiRmdnOG1xenJPNE56THJLZDJ1UzVkYXVyKzlDdnVMZ2xobC9XMHgy?=
 =?utf-8?B?Y1R6ODFJU1Bvb0ZUN1lJcHlhTVVENWplaXY4bFUvbEtma2ZYY3pFL0dlSEZv?=
 =?utf-8?B?dU9LWVlUNlhHRHJ0TjBnUk5MNFFaSlprbmxXLzFOWUhGclJmOStra09sNi9J?=
 =?utf-8?B?QVdOTzN0cnNPQ0RPd0hsS1dqQk1Qa081QTNScURPZ2FlTkdiMjEzVGhxZzFZ?=
 =?utf-8?B?WUR1dUx4RHNhZU1jZmJLbGJYeklkbDdqRGIrSnZwQVg1S24yVURXaHpyWVdl?=
 =?utf-8?B?NUd4SjhNY3lxQ0d5VGNtS3BzUTZLS3VaWkN2TUhSVFJTRW1OakVGY0RyUmxB?=
 =?utf-8?B?ZVRKNjdLek1qWEhQTnVzU0ZJZHpnVFk2NEI2cUs0bGtNMXlBWTZONlNMYVhU?=
 =?utf-8?B?bmRObWdIRFlEOWZSSGFBOGJ1b25QMmRhTmQ5ZW1sU3JXeHlIT2V4UnAvc3Fl?=
 =?utf-8?B?Nno1V0xTMFNMZTQ2UzNqRnlHbzN3NWlqSWN3dFV3R2lCdzFOYkkzSUtBcjNZ?=
 =?utf-8?B?MEZvWXh3T2lCRHNYWGNaWU0xVkF4RGJXdC9yVzAxeEJjeGZjc09hMHNoMFcw?=
 =?utf-8?B?VXkrNHpxcU11ekp2dlhwdFZWSkdqYUVJdmVocnFPSWtXeGEzb08wYWQ0d0o4?=
 =?utf-8?B?MWRqTUZObVA2TDZZVG9XQjhOUWZhY1pRQUZObkNuNmRpcDMrUzlYcmFGK0dy?=
 =?utf-8?B?b0dDK3BpTmNIdldObm9HRG1kWXlKdWJRTG1PSWhrc0pOVUE5RDdUR1k2L29G?=
 =?utf-8?B?R1NUaUtJaHNTbjFpR3hPWDlvYzljdGdBZGRXRXp5NGdPZDBqbDROVkx6cjlv?=
 =?utf-8?B?WmhyQ3MyZmtJdlZTcjI5bXpzUUZ1SllCbVB5bDRPZjFhanlQZitwVXFjSTlV?=
 =?utf-8?B?WnVPLzBNRTlGQ253NkxOMW5VeHkyUk5sTU5rWEoyY29Xam9mUVNPdk16anly?=
 =?utf-8?B?dlVKUXZqUHZJTnZLRTlxM3BqcHF2V0FJbEEzcElxRTJJc2k0NkJxRWRLNkQ5?=
 =?utf-8?B?cm4zVG1vUTFXMHllVkFhZklVVGpaTWdNMnkyY2plTUFzZnpYMG1HQ21zOFBr?=
 =?utf-8?B?UWNDWHFQU2tJOENkbFpIRVRTQ3hPaW9JUThNK3NlMWJzbnlQdkwxY0o3OFpW?=
 =?utf-8?B?SXNsR1pVdHF4VlZoN1FCNTFlM0Q0ZkRxZ3YzRE5yUk16RFQ0Z2laTWNLNSts?=
 =?utf-8?B?YThVbE5WU1U4VFZSTi9EcksyQ3ByYTJyK3J0cXJ5Z1l4ZnVrTnNKYVZzQStm?=
 =?utf-8?B?R2p3N1Q3R1BDVzViUnZtTlBEVnVYZUtSejZxN3NrQ3h2dVdGVlBGMWpHdGNQ?=
 =?utf-8?B?Rno0WjhJNW04Q3VJSTg4L0d6YWhtR2tWVk0ybkZ6czBoSGNVbmNqUXh0YlRQ?=
 =?utf-8?B?c3oweVkrVTRhbFd4SG5XdUhZVWgwSVg1aDNpY0hOSnZFY25PK2ZTUWFORGl0?=
 =?utf-8?B?bjJxKzRTeHVFTHJFdzZkSlBOT0hqTDUwdklHcndpcWUwQ0FaYnRvSFEzMHFL?=
 =?utf-8?B?RjNkMFVJd3V2VEV1OUEwVjVCMFF5Yzk0ZTlZUUZUK2VDMVY5QUJ4M0lXL3Z1?=
 =?utf-8?Q?ZSlAKgkLODaB5twCvY5PXHqhg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e56c03-38cf-4eff-071d-08dbaf871a00
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 09:44:59.6041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFIkKW+414j1w90xbSXfDp7StWhnRhqlUm9662Dvtx7uqXgIuWITaPRs+ukYzEM15XkVuxQrk4jewzwcTmJ/wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5509

Hi Henry,

On 28/08/2023 02:32, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called on the boot CPU to remove all 1:1 mapping.
>
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
>
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> v6:
> - Add Julien's Reviewed-by tag.
> v5:
> - Add missing "()" in title.
> - Use more generic comment in enable_{boot,secondary}_cpu_mm() to
>    mention function will return to the vaddr requested by the caller.
> - Move 'mov lr, x5' closer to 'b remove_identity_mapping'.
> - Drop the 'b fail' for unreachable code in enable_boot_cpu_mm().
> v4:
> - Clarify remove_identity_mapping() is called on boot CPU and keep
>    the function/proc format consistent in commit msg.
> - Drop inaccurate (due to the refactor) in-code comment.
> - Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
> - Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
> - Call "fail" for unreachable code.
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S | 83 ++++++++++++++++++++++++++++++---------
>   1 file changed, 64 insertions(+), 19 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5029013a14..f25a41d36c 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -325,21 +325,11 @@ real_start_efi:
>
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -        bl    enable_mmu
>
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =primary_switched
> -        br    x0
> +        ldr   lr, =primary_switched
> +        b     enable_boot_cpu_mm
> +
>   primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>           bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -384,13 +374,10 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -        bl    enable_mmu
>
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =secondary_switched
> -        br    x0
> +        ldr   lr, =secondary_switched
> +        b     enable_secondary_cpu_mm
> +
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -748,6 +735,64 @@ enable_mmu:
>           ret
>   ENDPROC(enable_mmu)
>
> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_secondary_cpu_mm:
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* Return to the virtual address requested by the caller. */
> +        ret
> +ENDPROC(enable_secondary_cpu_mm)
> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_cpu_mm:
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        mov   lr, x5
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to avoid
> +         * having to worry about replacing existing mapping afterwards.
> +         * Function will return to the virtual address requested by the caller.
> +         */
> +        b     remove_identity_mapping

                 ret

I guess you also need this ^^^ (Similar to enable_secondary_cpu_mm() ). 
Otherwise PC will not switch to the caller.

It will again invoke remove_identity_mapping() (which is redundant) and 
then jump to the caller.

- Ayan

> +ENDPROC(enable_boot_cpu_mm)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry
> --
> 2.25.1
>
>

