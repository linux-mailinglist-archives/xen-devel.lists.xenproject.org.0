Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB15B5E3C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 18:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405933.648356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmJO-0001F0-Nj; Mon, 12 Sep 2022 16:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405933.648356; Mon, 12 Sep 2022 16:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmJO-0001CR-L3; Mon, 12 Sep 2022 16:29:30 +0000
Received: by outflank-mailman (input) for mailman id 405933;
 Mon, 12 Sep 2022 16:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oXmJM-0001CL-Oj
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 16:29:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f264cf-32b8-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 18:29:26 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 16:29:24 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:29:24 +0000
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
X-Inumbo-ID: 10f264cf-32b8-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzpeJsejORs7XKBLR9b11tm7SU825oy4FZNbqg2P1317NKNarNgJB/2nQJxifD0mxCc1DSQ6TZMtyDi5oHMNDPdjWfBP1zWLyvzl9W22sP3bjQqqZqCaZKgp0ksI1itGs/kg/xfnrpWrQWNTWmd/k1PSOJ3E5qbw0OTi7O4VkV3mpolAR9Klf8ETIw9zv3w3NuCopWAcIwWlvCAtl7vQfqcEaTeTbuo9h0sMbA1WliNbgsUKN9QO44TRengQ3zZklry4YzWxyKV3POv3dQL9y9/yVBoLtbgILWxbelZ+na3lAhGGon27yF+ixCWApEFFq1F3QlcLqL1fxpn5/ECzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wupiBvB/i7/iWOS2GCbqaekWYjthsGjCEZevNiQLtE=;
 b=JallzdvnBRRXeYfk3wl7NSqa5Ph+aKSiYFBO7xQGYPksLoGktg65W62YBuUdN6Z8n2cOc11o7n4mfrG4bBaGYTMsxDciEn40P7XfV833hPY1+EHvz5kbu+5s4g9wUtuKhI8yLym826D/4XTtnxx4L4k3FJtZxc7lNs9ojfV1rpsDDUlegxi/v2IWQnyZ1PYVaJRzY8U2MS0PI4GoIvmDlAWnhw0yUQkEG6XeD7zKBH/rRosOoKw/swvXg4akvMdFw02U9/Yy8bTzRGgcpL91eq5LaHsi65UE+rJNKr0D93DnKICJjNRpC3ObGvTee8TpQXQqSYfGeeVxXuYGrHMDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wupiBvB/i7/iWOS2GCbqaekWYjthsGjCEZevNiQLtE=;
 b=cUR4iNP1oJGKgegLvtSPITAtIzaUe/kk9lc1WPUSuDGOYR7lnvLSBpzUQqFEsLzv0ykGXGLVgoKBK4HG6KeYv2qyPIPfVaHzrkvADjVOtGj1aK4FzUszR4sNlHRK4h3I3ZgC+acw95Bk7/6zfBm60mm5y/Ztf58VVui3QU3O168=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <64edb22b-eda8-2274-004e-9a036a972614@amd.com>
Date: Mon, 12 Sep 2022 17:29:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [ImageBuilder 1/2] Refactor sanity_check_partial_dts
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <20220912115934.19552-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220912115934.19552-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: f25635d3-3eff-4d14-5e8e-08da94dbf429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TRbYCbdm8tPFwamlJoE+js7aHYnvgq5xm3mc62/EO81TxTGNKBE/cCJbIIU/wkuj13HpqpLDVO0xuS/XUKmai2YhXW5eoDBti5aud5ynQ86zrZhYKSv6zXQFCSbnqDnUF+jdVgINJYMLRtE+DKofGhsPc01vbRnrD+16+pYEyrJVd4K8QIleXIBfVUeQbDq8vUdZPmyRxumyfZIV/AWz8ryXib7e4/DG5hZkhNXJvrTpupHlCezIWtR0vkCnnvMp3UaSbQmIDCnQLERQTIP8+rNwWFk0/rMS6VoE3384uWe1JIAKHS5WmGYCofobKn8iDSCRPIqBdFACcw3Oq5mv8K8XI91JqJ1jXRzXDArmD8HnYUqdD2Png2WJFaTKka3fPHBgM7u3LDYklSN5caULykLj3Il/RIq8fzXPCH29yJtDk0eMow1WPLRWuTRL2BVDFSRXLOFjwBc1486GhI9erUJRa88pJo+9lnnMsIl2g/edh80cHMv+gh5OaGQ18ZYy06ynIkSj8MSnijkSQ6XC2Dr7u0L8Xm5GpHMJR/+jaFWb+HYH6wLpXhyDKDoVmoNHO7dmkNM/wHGpSFYcGsNfqQzrRzM+1UdiZTTDhGZO0wKFhJTp3PvrbVNptPFHrcCkgAbwIXo7Fb5an2LtOe2DDWU+semc6OuulVYJ9lGHRN0l/dWut3ArzPd+FYo+RMX9rnuckHMG/dDUx8gCnQwNeXMPq2C77RWq6PTGPylfq6GaTJIxD/JazqdlDaEAjuNWwoFVjivv8z34CHAOwJzMx+QoVOQknDbdRD5g4R6EbXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(2906002)(5660300002)(6486002)(8936002)(26005)(6506007)(6512007)(6666004)(53546011)(83380400001)(478600001)(41300700001)(2616005)(186003)(66946007)(38100700002)(36756003)(31686004)(31696002)(316002)(66556008)(8676002)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlFlc3J0UHhLRTJ4dmRGaXpLRlYyZ1BRR3NvYjJ0bHVqNHVxb2dla0hZSXUy?=
 =?utf-8?B?cHpRSWFvRkNSZkdwTFVHYjQzdEtwYlJCTGtNUllDMCs3RUROd3pGTUFuQzE4?=
 =?utf-8?B?M0xmVW1HRWdkNm52T3A1dHowSEJKV0Z5N1dLVHJ4QzExZ25WQzdMWTFuWmtH?=
 =?utf-8?B?c1g4ejZub0RUdC9vWjJ2LzVFaFJZWDhFYlZ3Wnp4TmtYaVd0WkNnL2xXZGlw?=
 =?utf-8?B?UkQybGtJMFJpUGNkM0dUMHorYy9KdFdwWjBnY0hidmt4Zld1OUVxSWt5RG9z?=
 =?utf-8?B?ekJ5OThzM01XUlhlOVBWbVZLSWRETHhySC9XeDQzcm43V1I3QVhtWjQvQWds?=
 =?utf-8?B?UVlybWRvZkhvYXg1OHZ6cEgzUDNBWVdxWWd1VjhTaGcvT2NvL1A3cktEY0kv?=
 =?utf-8?B?RHNWSzVCNDlpRmQ2MXVzUkZ3Y0dIU1BrRENhK2JtMU9ERmh0MnM5YmpmUUZV?=
 =?utf-8?B?dmxHK0RaekdGSUtLSnIvSDVISmcxazNJZEROY05DNE5LbjFoeDY1MlpzT1Fx?=
 =?utf-8?B?K0xoYUN4MWV2RFNNUStsVXM0WlREZmcxcERGdzBFSEFuRGpVV0JFUTQxWVAz?=
 =?utf-8?B?SENOK0VUNDRmTktiNEM4Zm5KcXhtYWErQ2lhTzJvbmZkNk5rR3NhRkJMTXhN?=
 =?utf-8?B?eS9uT0g2K3h4SWpIOHZMMmNZeHIxdGRXZytZNnUrUURTMEozMlkwbmdUSjJP?=
 =?utf-8?B?R3FlaktmcDRQNTF1a2RLZzgra2k3c2F0eHZQcndRWTBUcW9iclVsd2NteXV4?=
 =?utf-8?B?NWRRb0FMTElqMUp2WEY3SGN5dkpZUXFSczNaL2xhRnE2NFRIZUxGa2pCUFNL?=
 =?utf-8?B?bE5iQ3B1WUVPbFJyOEhvcmlwenlEUzhsUktURm1GVFdWWDFtU3d1eXp0UzQ4?=
 =?utf-8?B?ekVEMUFsYmxyU3VabGRTaWF4WTk2bVRCTDlZYS9nRmZsWFZDYlhMd3lmSjVX?=
 =?utf-8?B?WTFVMWVFZjNTWXZPU2pueXE0OHh6emJxOXdzNzVmWU9TTm50SHRuS0tmb2JV?=
 =?utf-8?B?Y0N5dWJ0M3hmNnNqUE9zU3RBNTEwU2dYbzRjeUV6cDVOaWtRNXlwaUNsUTNn?=
 =?utf-8?B?MnZqS2EvNjFoYjZ1d1pPa3ZKbktEa3pwMEh2dk5OYm5Fc29pRkFja2VYUXBF?=
 =?utf-8?B?QjNYb3djUlZMWXZ4R0Ewc2Zsdm1uNHk2WVdRV0diVVU4RTlEbDFXMmN0VWhM?=
 =?utf-8?B?RjdjTThxVi9PcktCbTExU1RyRDIvMGVCQkpuOEgycTBYaUZvTkdDakRVcGZW?=
 =?utf-8?B?bkhSVTRzRWJNSURZME1rTDVqZ2JxZnIxeEJLZWZIWDk1Nkx3Y2hOZENMTzdi?=
 =?utf-8?B?b1EwTE9sNnZ3ZnJkbEZObFdVN1BackVCS3NES2tRc3AvMkRDS0pkaTYya3hK?=
 =?utf-8?B?ZmpTd1VjMnhjUTNZMmRhQVJ2MmNEZEh1RmhjR2RtbVZTdmkrVW51aGp2allq?=
 =?utf-8?B?STF1dEdNQ0NaWnNXVHdqdkNoQnVrdjFvSXpPazJwTEhZZUR0MDZuc0NiSjIr?=
 =?utf-8?B?VXJ3VU1rS3pkTzJtVS9FM1pTY3F2ZG5JNElmclFnekF1WXkrYXU2Vi9qRG10?=
 =?utf-8?B?eGVQSktYdVV0KzBTUWlKUVV4STNleTNNc1JSUkl4enovbGFETmxzZ0p3Rm13?=
 =?utf-8?B?eERBNXZFc2FOMUxKbWtCcjR3dVFXM1lRZGVKaVY0b0xabzBoekRmK0lLbnhL?=
 =?utf-8?B?Q0dTMmZSY1IyMkdoVnFBSEJ6RUlXOXdEaDBFV2xTK3ArOU5aM3hHc1Exd0hr?=
 =?utf-8?B?am55Y2R3cmNFcEtucGptQUg1SjhnWWordExveDEzTmM4ZHpIOURDbEZXMWZC?=
 =?utf-8?B?S2krZnlEZnRJOWJScW9VQTRJeHdmbkhsYTlrbE1YNlFuRUhNaGJVRlVMUHpm?=
 =?utf-8?B?cmR6WXdrcWRtNk9KQmZJRHhwZE50VnVzNThvL1VCYzkrTzVFd0Q4dFVGU0NN?=
 =?utf-8?B?R1c3U3VlZ3pibklBY1dSbFRDUGdwcXVDWUhVdzUxTjdwRFZqdzk5eG0wMkpn?=
 =?utf-8?B?V0xxNU9UT1doTWNyQ2ZvVnZiZWNIMldVTStRZVc5cnNwU2p1MDIySGRuMWJ2?=
 =?utf-8?B?Q3htNDJWajU1MEh1WHpncE9vK1lnSWNQaERROFFCNUUwK1Y2cGNHbkdiT1ZP?=
 =?utf-8?Q?V7mjbMLDo4xAeDYTa4ICA4t9q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25635d3-3eff-4d14-5e8e-08da94dbf429
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:29:24.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOssjBDXDLAYr3pF5QAfjFR4h/jJdUy2X6m/ju174Mn3P2ZV/88hbGWYvYINI/uZ9xNcSDcsXlBSvZ23HsMzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233


On 12/09/2022 12:59, Michal Orzel wrote:
> Currently function sanity_check_partial_dts from scripts/common takes
> three arguments where the last two (repo, dir) are used always in
> conjuction to form a path to a directory storing partial dts. Modify the
> function to take only two arguments where the second one is to be a path
> to a directory storing partial dts. This will help reusing this function
> in the future to perform sanity checks on partial dts that do not
> originate from a repository.
>
> Modify compile_merge_partial_dts to take this change into account.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   scripts/common | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/common b/scripts/common
> index 25c041270c29..ccad03d82b30 100644
> --- a/scripts/common
> +++ b/scripts/common
> @@ -40,8 +40,7 @@ function get_next_phandle()
>   function sanity_check_partial_dts()
>   {
>       local domU_passthrough_path="$1"
> -    local repo="$2"
> -    local dir="$3"
> +    local partial_dts_dir="$2"
>       local address_cells_val
>       local size_cells_val
>       local tmpdtb
> @@ -51,7 +50,7 @@ function sanity_check_partial_dts()
>       for devpath in $domU_passthrough_path
>       do
>           file=${devpath##*/}
> -        file="$repo"/"$dir"/"$file".dts
> +        file="$partial_dts_dir"/"$file".dts
>   
>           if ! test -f "$file"
>           then
> @@ -96,6 +95,7 @@ function compile_merge_partial_dts()
>       local dtb_dir=$1
>       local repo=$(echo "$2" | awk '{print $1}')
>       local dir=$(echo "$2" | awk '{print $2}')
> +    local partial_dts_dir
>       local tmp
>       local tmpdts
>       local file
> @@ -123,6 +123,7 @@ function compile_merge_partial_dts()
>           dir="."
>       fi
>   
> +    partial_dts_dir="$repo"/"$dir"
>       i=0
>       while test $i -lt $NUM_DOMUS
>       do
> @@ -132,7 +133,7 @@ function compile_merge_partial_dts()
>               return 1
>           fi
>   
> -        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$repo" "$dir"
> +        sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
>           if test $? -ne 0
>           then
>               return 1
> @@ -146,7 +147,7 @@ function compile_merge_partial_dts()
>           for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
>           do
>               file=${devpath##*/}
> -            file="$repo"/"$dir"/"$file".dts
> +            file="$partial_dts_dir"/"$file".dts
>   
>               # All the subsequent dts files should not have dts version mentioned
>               if test $j -gt 1

