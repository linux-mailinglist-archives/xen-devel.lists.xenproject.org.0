Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4CA09DB2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 23:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870036.1281488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNNc-0001rR-3N; Fri, 10 Jan 2025 22:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870036.1281488; Fri, 10 Jan 2025 22:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWNNc-0001ou-06; Fri, 10 Jan 2025 22:21:24 +0000
Received: by outflank-mailman (input) for mailman id 870036;
 Fri, 10 Jan 2025 22:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7mG=UC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tWNNa-0001oo-CP
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 22:21:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:200a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36455260-cfa1-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 23:21:19 +0100 (CET)
Received: from CH0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:33::32)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Fri, 10 Jan 2025 22:21:13 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::19) by CH0PR08CA0027.outlook.office365.com
 (2603:10b6:610:33::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 22:21:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 22:21:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 16:21:12 -0600
Received: from [172.31.88.124] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 10 Jan 2025 16:21:12 -0600
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
X-Inumbo-ID: 36455260-cfa1-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag6eK7gcPQRhcN1YNkG4hjji8u8waUSt7hCb38Wm95GsoLIviVV+YRaHwRdzPAMr9epgOfJMkCVLDKaV1aWnm816s0SBC4C2MPXP1nNldEHpK+DZLaXfmSIsINLtCSwXJAKNX4ZpspLYZCNuoNqUctphqJIzBnGXagtlKK3KDKO2m5DZx6CyNat7yoxE4SnFWIchbEWg7w3GFmb8SQYqcdT4xdG16o0krMwF4dlCUjddhuiMSCZBNNm+AhuGz8/0AvJqMzIgrTjI8uMtNWHO7+XcXfmV+G7OLyRoKWBa6rjpj+ivLPv9pqz3acdQA+oiqVNDih9htbO4+IdWmyVKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP38IVBNbqZWKbOqOxt0j0fmaPu0MFviVieuQbDEr+M=;
 b=Js8fPhe9wiMpShUZ6l4043QvIP3PSjVB+Dj8+T7eoNGoT7kMlljytxe2qkWIGmdhGyvrceJOF++gUOzjhbYAWr4nryijxlkdJzo0BbsM5L43+7r2up2q4rogXEOdOfGJuFhZ4VCT+Gl0nQKEgpW/x2ceH7W+Lo94V57zUvwI7ZWjjBo1yCO6eYhkWsRJ30h84eFIfQepnXPOCa7cYnNrXwuQG3TAFci4HFuyVHllz7n/TPaTzrJDCsDutyS/X6jO+OPdQVDBKItktU/qCAhtqAlsZRu/I12CgMoEVgDKgBvXZEd+jThvbqEnVSK5BE2dSHaHHD06UKHa8cnM1EuS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP38IVBNbqZWKbOqOxt0j0fmaPu0MFviVieuQbDEr+M=;
 b=Lg50oDCUxt/X1XfGxSUWBruoXDmbssV1Rsdwg5K6WlQFn8C96EgGWsOAEtBxVESiWGFnw9iMYAe4y1HTUFcRccWxh4tG13VEnDDfSSeE+L8zBkPhwkxEcxubGHzEnaIu+iqGymzpPuM9YpWPMPuoBdKvRqJ+KWdT4EfZiTSaN/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f02d01c0-2860-4645-b0a5-24cdc1415b12@amd.com>
Date: Fri, 10 Jan 2025 17:20:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-8-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241226165740.29812-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 164f12b3-b277-4b48-31e0-08dd31c517d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEM4aGNFQUg1Rk40c0FuRjVyNlhTdC95bnVVc3NSeVgvcE9sbXhjQ3ByaGRT?=
 =?utf-8?B?a2Z6Uk1LQzlzaHdRTVgzZW1vSDBxVTAyOXVXL2dwTm1zN3lsVnBoNzBmVXps?=
 =?utf-8?B?Qy8wU29OQXZYQ0RZRHIveUtZZkFBcWIvZGVSZWtycVBWeCt2c0YrY2FIT0FD?=
 =?utf-8?B?ZzlkWVFjMjZaTngwT2cybzNGU2MwR1NoT1ozRlBlWTBOcU5lU0tFQytDaUFJ?=
 =?utf-8?B?ckxNQ2pNZnNObzJnVkdRNzBqaUNKU2tjYlRwdEpKRzZyeERseVVjZTZPeHlK?=
 =?utf-8?B?aWNQaERDZHc2OTFyd2gzWjJiRTN6c0xDS2ZaZUZUSm9tQW0vUy96ZzJ1NFgr?=
 =?utf-8?B?YWFPZ3d1eE84L2tNeXk0MlI2ZnZDN2VKVS9CVGI0bEpkd29ndVZHT0xSYzdF?=
 =?utf-8?B?K01zZWVQNmdjdHpVWDIvVHNpeEhWM0VWU05VV09XaFNmNFc5QUtORVJyNTFQ?=
 =?utf-8?B?WFFudWg4OE5KeWk5S01NOGN2c0JXOFI4N1dUS2RVNmRsdUlQWEVJSmtTVVdW?=
 =?utf-8?B?QS9ySE91enQ3M0NXY2htcktETk9aNm5IMzdwMi9pNFErVkdLNk5JY09KbVp3?=
 =?utf-8?B?V0xrYXlNWDJ5bFdhbm9MbjJXeGN4K0ZQTUR4RkxDenVqVldQakluTERKM1Ey?=
 =?utf-8?B?bW1CUjBZRnlCQTVVd0w1TERKZXpIV2tlY1M5UStPRjBKTE9IYjczVG1ONVRY?=
 =?utf-8?B?S1lhY3lFSXJDTmFuYnVJSC9DS2pNYm9PNTlUK1BZenVLZHlJb2hYOXZNK01M?=
 =?utf-8?B?Z0Z3QU9zY1Brc25lK1VoOXRyaTRjUmJSbEFmUUZHTGNsbUo2alI5SkJsVCtE?=
 =?utf-8?B?VUJKYnh5NmtqRGJZeDhjb3VuMHJYS1kxTUJIUWpYa1ZmVzlFOHExbUpqRGt0?=
 =?utf-8?B?NEZib2M1NzhQa3VmVFgzcGpDZWNTSE0vb29kcHlWMCtJKzhvck12anBpVWZL?=
 =?utf-8?B?bkx1ejk3dHZZSEswd3lYV0czSmZhaG1KQXFlY2d4UUR0TzdqQ3A5MDhDa3E2?=
 =?utf-8?B?UEVZZURremFYdy9kVHYyak94VVNvTTQ3ZDh4dU1sYm5JTGhKZmVDYWtxcThZ?=
 =?utf-8?B?enl5NFZIRmIxZDdkcVhPcmZMVk55ZllZQXFKaWlHUTdwclhkS29Ta0NyNFFZ?=
 =?utf-8?B?Wjc3aGVzMnlmd2pkK2pMQjBHZ3d3YW13aXNraWpHM0VWZzExYm5maHYwdk81?=
 =?utf-8?B?QVRRU3h6bHhmaTFIdFRQbEd3dkd4bzVOd2RWRE5CUVdtbnAxYzhGSUNlMHEx?=
 =?utf-8?B?dm1KZURrc0c1bHU2Rm43VXhKK2JaeVVwVUF1c0x0VHFML0RaeWorY1cyRXRz?=
 =?utf-8?B?RERZN0ZFUlNiTjh1YmVSMjRJQmtrRkVhemZ1OFIrVWNyL2RCUm16OEVHL0lu?=
 =?utf-8?B?dURjMWxPNlhoN0llY0RabHE5TkpzWXFYdGdwSzR4d0pmVGhGWGlMZENuNVBP?=
 =?utf-8?B?SU10RS83VWRRU3pJbG5NdFRQTXo5U3VCWENSUmJ1MXY3L24ySTJrYUdBVTVs?=
 =?utf-8?B?Q1VITTQyVnI2SStnbmZWRzN5bFRqME1ENnJiREl2MXJjM0pFZFBDREx3bURk?=
 =?utf-8?B?WVhJVlZlbVM3OWx2Y2pIL1lDTnllQXpKY2g3MHgxdUtBUGxpOTNyM2ZzOGdl?=
 =?utf-8?B?anpzLzErRi9HazJiZittVDMrek5hRjl3Y1N0bTlqL3R2aWJxK21CNG5GTnhG?=
 =?utf-8?B?ZEU4RjlVVytDWTBncytHSXo0UTVENDZTRGtpbmYzQ2lSR2htU1pIeElGOXl2?=
 =?utf-8?B?bGtqaEZsc2hyMHRyNkg1R2R0M08xU3QvMVJNNjNMVnBuRWVORytJaHE3SEpT?=
 =?utf-8?B?NEp5UUxvaUdQVHBid0t2a3pBZERURW0yeFhBY0k5NlgycTlwS1ZMdlZPdndK?=
 =?utf-8?B?NlY2Q0d3RkphRTV2WmtlSmx1QWtuYnFLcExnSGRkaFI1UGxwWkRUVEJOVjcz?=
 =?utf-8?B?MGErRU1RRkRvRGliV1QwY1dvalFDZHFaZHJleGFQU3V5OU9mR0dsZEJKeXY3?=
 =?utf-8?Q?2TKB1BriLnB8mrw1WTryzDHFCdmt+M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 22:21:13.4125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164f12b3-b277-4b48-31e0-08dd31c517d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288

On 2024-12-26 11:57, Daniel P. Smith wrote:
> Add the ability to detect both a formal hyperlaunch device tree or a dom0less
> device tree. If the hyperlaunch device tree is found, then count the number of
> domain entries, reporting an error if more than one is found.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
> index 4a3f80648f86..5793bdc9fd47 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,14 +13,77 @@
>   
>   #include "fdt.h"
>   
> +static int __init find_hyperlaunch_node(const void *fdt)
> +{
> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> +
> +    if ( hv_node >= 0 )
> +    {
> +        /* Anything other than zero indicates no match */
> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
> +            return -ENODATA;
> +        else
> +            return hv_node;
> +    }
> +    else
> +    {
> +        /* Lood for dom0less config */

Look

> +        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
> +        if ( chosen_node < 0 )
> +            return -ENOENT;
> +
> +        fdt_for_each_subnode(node, fdt, chosen_node)
> +        {
> +            if ( fdt_node_check_compatible(fdt, node, "xen,domain") == 0 )
> +                return chosen_node;
> +        }
> +    }
> +
> +    return -ENODATA;
> +}
> +
>   int __init has_hyperlaunch_fdt(struct boot_info *bi)
>   {
>       int ret = 0;
>       const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>   
> -    if ( fdt_check_header(fdt) < 0 )
> +    if ( !fdt || fdt_check_header(fdt) < 0 )

It seems to me the !fdt check should move into the earlier patch.  What 
do you think?

>           ret = -EINVAL;
> +    else
> +        ret = find_hyperlaunch_node(fdt);
> +
> +    bootstrap_unmap();
> +
> +    return ret < 0 ? ret : 0;
> +}
> +
> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    int ret = 0, hv_node, node;
> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +
> +    if ( unlikely(!fdt) )
> +        return -EINVAL;
> +
> +    hv_node = find_hyperlaunch_node(fdt);

You call find_hyperlaunch_node() twice.  It seems like you can just have 
has_hyperlaunch_fdt() return the node and pass it into this function.

Regards,
Jason

> +    if ( hv_node < 0 )
> +    {
> +        ret = hv_node;
> +        goto err_out;
> +    }
> +
> +    fdt_for_each_subnode(node, fdt, hv_node)
> +    {
> +        ret = fdt_node_check_compatible(fdt, node, "xen,domain");
> +        if ( ret == 0 )
> +            bi->nr_domains++;
> +    }
> +
> +    /* Until multi-domain construction is added, throw an error */
> +    if ( !bi->nr_domains || bi->nr_domains > 1 )
> +        printk(XENLOG_ERR "Hyperlaunch only supports dom0 construction\n");
>   
> + err_out:
>       bootstrap_unmap();
>   
>       return ret;

