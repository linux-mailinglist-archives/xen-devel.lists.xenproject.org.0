Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE499583F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813497.1226462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGd4-0007MT-Gf; Tue, 08 Oct 2024 20:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813497.1226462; Tue, 08 Oct 2024 20:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGd4-0007L0-Dv; Tue, 08 Oct 2024 20:16:22 +0000
Received: by outflank-mailman (input) for mailman id 813497;
 Tue, 08 Oct 2024 20:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGd3-0007Ku-Bg
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:16:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2414::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dafc48d-85b2-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:16:19 +0200 (CEST)
Received: from CH2PR14CA0033.namprd14.prod.outlook.com (2603:10b6:610:56::13)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 20:16:10 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:56:cafe::a5) by CH2PR14CA0033.outlook.office365.com
 (2603:10b6:610:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 20:16:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Tue, 8 Oct 2024 20:16:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:16:10 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:16:09 -0500
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
X-Inumbo-ID: 2dafc48d-85b2-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xV+uzjw5cURYkXVCABvcBhX5E5LqxFQA0AnOINtpMFW6xjI0yh8K+JxlY2XEqjI36RVDHrWR5MjhsCBnY4+KwSsE28TJcMf0V44qTNgPLK82vcmJETPxNxIQDJajs1W1xEGVcQ9vFQjtTU7OWbngWp3BUK4H4PHRElyy3DEboSvKkivQFADYyuibFazmduMd6C0IEhWMI3TXVehNhJ62VloKv2GRjpwjuvMCaNfmyJ80aoZz1XDxdb51JHTL40QR3V8ZnZmqF3t2XBeGUtbEeLmvBwO2Es/9w5/ZOK/LS7drN8LYNChwBT/qPZvoJn971Mo9VICIVGQ7QFNWdU9kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRurKgHlYk5Rq9zpnnBpVE9SWJZiDkTt027V1AaYp6w=;
 b=t8KKeoHP4sRG5YugWCWX8d0TAnKwx3TwQD/wxK0NI+12romj7VgqETyukiEMPXE04FuqpS547FtqgFyFWzOJs4aJW7xdTVA7fg5QhiMVPqFQRbbI9Ftf8xJxHRoOsy1JRmdlT/yzy6VUdjqYIxsNEnTJMVMHVEXJkFnGU/ejl1VGoR3VGlSVvHqlCcUFEW+W4tTUeYBhPC1NOO/lShQTShjx4A68Ohy4do/62egvGAbwBmDVbhtZDl6AHbecIEV6bVzIo0jX1OF/Z+N5YGQfq3BqvqRbSf9BxkIupnl9XbwJ4j3/J5LzoyH4kL380iMjsIquysd7d2DygZTeaIWw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRurKgHlYk5Rq9zpnnBpVE9SWJZiDkTt027V1AaYp6w=;
 b=W4WGVA5sptDfoRusNi6E7pndtijqqSEyvjH+IeMBWGU2t1bhb1S1RlOw9YC0yL6oet1pTP199bGlohMHi1khfkJ9v3sg17EULdTpwtpr8Mhu7UH28kwExnr8kuavbA0cHpn6dfrmBUED8pK8tRLXFytyClQ4Kw7mawoDyyn9G9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
Date: Tue, 8 Oct 2024 15:15:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-37-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-37-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|PH7PR12MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cddecf-86c5-4f57-cf48-08dce7d60d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0VoMFc2WTdNOEdKTUFLTFlpSllmZGRBb1NmRVpUTGk4RHBzN2ZQOGZVdmRE?=
 =?utf-8?B?ajQ5aEV0UU4ydDd2NUxZU2lGN0d1S2RndnRZQUpwSlJWbWZxYkh5ZERPM1R4?=
 =?utf-8?B?NDNGNXZKT1duQU0ySXlqckpQNDlhSTcrTmRVVnUyQkM3RFRQcFVCZEpPOVkx?=
 =?utf-8?B?aUI0OXBtbG1rajBHOUV1YmxSZW9YWFh6WHpObFAyWER0SG4yMU1HZzBRODdO?=
 =?utf-8?B?ZnZVK1gyVUYvc2hnSHVQWXM0QUlRa3RBSlY2RFg1UHVuRE13NW4wa2lGQVJB?=
 =?utf-8?B?clFjMWZRWkU0RGJFa2k3Yml3NjkvVWdWWE9ZUENxQ1U4eVp0MnQ2YnZpaTFh?=
 =?utf-8?B?RExCcVhBV2EvY0NGYjErOTNQeTA0SGhaZ2xPWFhta1Jzc28yaDdsM014dVpW?=
 =?utf-8?B?MkNhUldmcHJUeEhRVGJJbmVVdFh0N2NObTYycWg3aGFFRk9ScnU2dzNOZGQr?=
 =?utf-8?B?cyt5d1g1NjAwc0VWYkhmc3dmWG9FeDN4QmNFMm84MWxvc0ZrelNyc2VFMUEw?=
 =?utf-8?B?OFlsVFYxS3kxaVQxcS9OdXRtOEFUYmlGUHNtNGEvOHVQandYWGJKM0hXaXd1?=
 =?utf-8?B?ak0xMkh2OVBxcXgvSk9TVS81YWpqVHJGMzVEeXVPZ2U0SVUyWWdXSmxoZEpJ?=
 =?utf-8?B?THVYVXRmUTVNaVhTN0UyK0ptVklpRXN6Rm4wcEo4WDlia0ppVnF1cE9jbmN5?=
 =?utf-8?B?VllCWmJDNExyMmt5SnB6ODl1WjRIOE1sZzIyU3gzSlI3c3hHVzBDaHFuMVh4?=
 =?utf-8?B?YXgrS0FlQWc0d2ZJbTdlem8wSEx1Q1ZZSmprTS9VZTdaYitPYlFoZmpFeFJt?=
 =?utf-8?B?N0dzVGtwNWM2MzYxSFhuaUQ5ck94V3hGR2JidXBZUm9ZUUt4cnZrbjZXcE9Q?=
 =?utf-8?B?L0RjL3FnMUhIOFVrV2thZENBaWFIdFZ4OVFZQ295OEZhZWpSSHU3eE9mMlZo?=
 =?utf-8?B?R056bTcwNWY4UytCR1RlUmdjeGpTRDNySkltdGcyQmk2bWJSZ2xsSDZxdFVJ?=
 =?utf-8?B?UlcrM0NXeHJhMm9XZk9iS2kxak9LSXV0YUlreDRvRU9GQkVqZTFlbW52VEhT?=
 =?utf-8?B?aDZ2Y3ZDd2xhZW9jZnN1cTJCbU9Mb2wzWkpTMkF1M3V5N1FTQlVLdlFHYi9Y?=
 =?utf-8?B?dG5UT2ZrTXFnWWd2TkpMbkFrZk1JeUUwc2kvZ2lpT1pmbEdscUN4UE9LUC9z?=
 =?utf-8?B?UnMwQUIrczY4cmNRbC9LZVNVNmRWcmFQNTBSZnMvNW1kT3U3U1dlM3ExWmtW?=
 =?utf-8?B?b0w0RW9NR0pRZHZIWDFRbEJvY1V5NmNaemg2cWlqNDl6dDczeHViUHJIaEJ5?=
 =?utf-8?B?TThwcEFDWU5qUlJoK2dGQkZ0ZE1nVit5Y2JwMUVaWUFVUTZweHVZTnR4UzFF?=
 =?utf-8?B?WE9sQksvRVhvbkRsVkxRdWlmUitQa2hjbFY3cWFFZGdKa0lIMTY1QktQd0tp?=
 =?utf-8?B?aVVBTkFlcCs5MDdxb1kwbEozbnViL2M2M0wxaFBnbHhWclNYWEJXcFY5cnkw?=
 =?utf-8?B?TW50TG5kWUVjenpNR0lGRjVFdVZNcW5rSXBCU0ZnNnY3N0RxNlgrMUd0MEpv?=
 =?utf-8?B?aG9GdVo0Q0w0TlU2YlUwUENYbVFKUndISStxSHRhdU1MMmtGa1h6RjdHVXl3?=
 =?utf-8?B?UURxazUzb3JUU1czakNzZm5mK0ZDTWNKZU8xd3pTaXlWMDlQckErQmozMEcz?=
 =?utf-8?B?bkZKT0Y2YmZBUjVwWmx4amgzMUF3SytOdk1vS1dxaWtqVWFSWkU0dDVzc2pH?=
 =?utf-8?B?em9OcXVRdEQ3eE50Wmx5QUI3WVpMK1ZSQjF0dis2VzhYR291V0lRNDVzdnpx?=
 =?utf-8?Q?7wfAfVlp5SndJ1+BehCEuH3uJBZpnkiNp0pkw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:16:10.6685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cddecf-86c5-4f57-cf48-08dce7d60d08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Any direct usages of struct mod have been transitioned, remove the remaining
> references to early_mod fields.

This is unclear, please try to re-word.  "struct mod" and "early_mod" 
don't exist.

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 31 +++++++++++--------------------
>   1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index e9e3da3204f1..0ffe8d3ff8dd 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>            */
>           bi->mods[xen].start = virt_to_mfn(_stext);
>           bi->mods[xen].size = __2M_rwdata_end - _stext;
> -
> -        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
> -        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>       }
>   
> -    bi->mods[0].headroom =
> -        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
> -                         bi->mods[0].mod->mod_end);
> -
> -    bootstrap_map(NULL);
> +    bi->mods[0].headroom = bzimage_headroom(
> +                        bootstrap_map_bm(&bi->mods[0]),
> +                        bi->mods[0].size);

Thunderbird might corrupt this, bit the above can fit on two lines:
     bi->mods[0].headroom = bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
                                             bi->mods[0].size);

> +    bootstrap_map_bm(NULL);
>   
>   #ifndef highmem_start
>       /* Don't allow split below 4Gb. */

> @@ -1708,8 +1699,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
> -                      paddr_to_pfn(bi->mods[i].mod->mod_start) +
> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
> +                      paddr_to_pfn(bi->mods[i].start) +

This belongs in patch 14 as mentioned there.

>                         PFN_UP(bi->mods[i].size));
>           map_pages_to_xen(
>               (unsigned long)maddr_to_virt(bi->mods[i].start),

