Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03339D8D4C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843108.1258758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfR0-0006zO-5o; Mon, 25 Nov 2024 20:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843108.1258758; Mon, 25 Nov 2024 20:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfR0-0006wR-2F; Mon, 25 Nov 2024 20:11:50 +0000
Received: by outflank-mailman (input) for mailman id 843108;
 Mon, 25 Nov 2024 20:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFfQy-0006wL-Hj
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:11:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2009::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e83e6d-ab69-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 21:11:35 +0100 (CET)
Received: from BL1PR13CA0116.namprd13.prod.outlook.com (2603:10b6:208:2b9::31)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 20:11:28 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::57) by BL1PR13CA0116.outlook.office365.com
 (2603:10b6:208:2b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Mon,
 25 Nov 2024 20:11:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Mon, 25 Nov 2024 20:11:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:11:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:11:27 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 14:11:26 -0600
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
X-Inumbo-ID: 77e83e6d-ab69-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjEwIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijc3ZTgzZTZkLWFiNjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTY1NDk1LjU1NzU5NSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB+U9jxqvCZN3SfHS8hUxQ0t9XQkDh0T/hu+UYlmhwaXrMPnBZX68TNp+eoWoH/LPqiEpync8X/v4/Etwrze3XeAQ5xM/PjP4xkRjSqnUKUTjjNmI5Z2YEHxPwaguBFYy5sbyroImIriSZY7JAGnT1FIX7Kg7s3/8KOfYOHm14PD2zsYJgQfqwnZPYgLytQYZiCKku5GuPeH26oe13fDNc7PdWNZ1mei12guVajFNAHqVuexlX2E5ZGtNW8wdZ8lRQEYyO4oqytlLNr9Z7ULbFn+5rIcwJP0thPUgBXutaa4mj6qI5EVIranR0vTope7OjCOKLK7msorACfemlb4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOkL4Ftoq3m9YfETrTq4SDo/nceuuCAqJDazHjut+Sw=;
 b=KwjAXA6v6GTRaWxgwfYRqpatplPznHa4x0RumnAzftFyGAwlXZ2Ev8pxgV8aBliK/woKi9mwK/ibhknNYhLe8H5y0bbq9Hxg4x/1/yYhWsOiGB0nEtRAsJ9m6JrirWora+TSwWZN/QgTD37JiJVoSd0oMb/ps+lKqf+wi+dV7LdfXKvuiQYjULbrH8dKyYoGb8v/xj4/sddcHxxdKtfn0OCXPOr28t5MVV7KJOi3yCnsRcrne+qcYccJxm6pbi43e2MZ7stFuT07JKHvUCVuIP3CYH8n81P4QBmfQ7ZIqGNdFGhYHUdrkYA3SQbs3c0TuekOhvKjX6Ogw+DvqrZhXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOkL4Ftoq3m9YfETrTq4SDo/nceuuCAqJDazHjut+Sw=;
 b=jQsDLKLyoqrXal88eKWoaVNMdOwi3dfjfemEUd4fsZUh4M7B7hucNEzBG77Gd45cK7LLXt97zWBCFdFAPMw8tnBTaceP5xDUZ2mK8iaG0A/NwWGdN9+tGoqYGRhsqkpd4ylDwNPGvGKJgHdGqziCnr5uWRquySL++H3Lt+QoGX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6843e4c8-1b72-4b3f-be45-1854051dbd40@amd.com>
Date: Mon, 25 Nov 2024 15:11:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-8-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d6aae9-8b63-4c69-738f-08dd0d8d5844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE9BQ1l3S3ZqRnRDQityVkw3aThOOWdvUzFjYWQ4bVp2SDkwOFRPSUtDL2ti?=
 =?utf-8?B?cVQ1RWVwckUydmpTMjY4TlExMHd4VGw2SzFtVVhERTFDM3FWNTEyaTNJbjgx?=
 =?utf-8?B?ZEFGN3Z0Y3FDSzJlVU1Pb28yOWphd3E3Nk44Ty9lUXB0Zmk3V3FjN05paG1p?=
 =?utf-8?B?WE9Oc1hXYUU0Y2NwSFQ1VTA0c1lmYlVkOXpERVRkbnJvbHhFdzhFZHNZSzgw?=
 =?utf-8?B?TzdFVWJRQVhpbzAwcVFKd3JQR1AzVG9PNVJLTlQ4RHhGenRaaFNiVzBkdjF4?=
 =?utf-8?B?R1N0VWcvblVLSTFHRC9lS1JZVFRQS2lPZVU3RU1oRVZYR0NjUzQ4YndEcDgr?=
 =?utf-8?B?YmxIdlpBOTJnS1FjTi9TaE15akFlTmo1SklWRlpaZ29kZXpLMS9NY2QxN2d3?=
 =?utf-8?B?b3ljSWFib2REMU8zeGJEa1diMVAwZmw4TFI3L1RJOTE2TDUvR3d6RU1xNVlK?=
 =?utf-8?B?eTc5OGl5NExMMEhaNGJPUno3aFViN3lzU3IraWt0anMzKy9JYVNkdmp6WmxS?=
 =?utf-8?B?SVVNeWtRNEpKZEJNZStpS1VZcmRTZjIrYVd2dEFaemIwQXV4K1VWREh6dUJN?=
 =?utf-8?B?dUtTYWo4M0NnZy9NZkI3UlZSMTBFZUYwa2x5eUd2UW5oV00vZ1FiMUJiNUp2?=
 =?utf-8?B?RWVIRHovZDNEUnRhNW9WU0t1cG5RektRbitsM09VaDFNcXJGWEdTNHVzUGZZ?=
 =?utf-8?B?ZFUyNVpqR1RHUk82VlFGZWtlclJKQ0lVVS94YVl2dUFsMStUaldzQVl2ZElp?=
 =?utf-8?B?eW9BK1ZQWW94cThLTGZvYkJhc3N5QXlUbmtOKzJqanNoVTJIUUUrdVlDL0NG?=
 =?utf-8?B?SEZkWkt1Y1YyVHpLWmF3V1pjYXZkRnk1RWxuenFLaW9TQ1lvN2h3Zlp6MTFS?=
 =?utf-8?B?Tm5sdTZnZVhMMWVUem5PUDY1aFVjUkU5Q2JYMlJhUmorSHZ4RHc4QXRua0hj?=
 =?utf-8?B?R3k2MG91M2dibjRiWU1qWENYVTZRTEZKNm8wMUdPTEdTb2FjaXR6dUc4K05S?=
 =?utf-8?B?SlhFZHZiamwybTlFenA4QXRBcDNtLzM5MW0rS1g2azNaWGNxZGtFNGtNdm8z?=
 =?utf-8?B?cnU4YkpuOExJZ2dDa0NaL2cyd0xaNVdwOUZFVjJ1OVppais4TTdjbW9VY2cr?=
 =?utf-8?B?ZWNtTnV6YWRncGo2aU1wbUFLcUZSZklxMU1BSWsyWWlOU25vQkFXWk5DbEts?=
 =?utf-8?B?aE5ETHRjcjl6bndiREx2WHdvNGlxbTZnQmlvcFl3T1MyU3BwaHU5b0o0VXVF?=
 =?utf-8?B?UjB6RlFONDVtUkdreXNTSXV6UnIyTURscUl1WWpZOE0rMFpBZ2FSWE1YTkNB?=
 =?utf-8?B?R2Y5UENQRW41NkplZFE3ZEl4aXgxcC92cWFXUFdqYzN4cTYwOEVpZU9vZC9u?=
 =?utf-8?B?RS8xRkpSYnNMaDZ5cXdlWjZ4eXUxbnhKa3gxSmQ3MXhkcXJwWk5OU09LQk5u?=
 =?utf-8?B?UlZodGtqL2RIRFpFSy9vK000UGtsdmxyMEZCbDJwa092YjM5MzVMK0xxeTBE?=
 =?utf-8?B?UHNrNTlvN3FnYkxROEU2N0ltR0x2VWtvMzVsT0MvYlNsV1czeEUzeU1ZVlhk?=
 =?utf-8?B?Uk1PdVNWaTl3VFlWQUZuQVk1SmIzTDA2bjdFWTJZTW9sYUdPSUwwMW1LQXpr?=
 =?utf-8?B?blVWVGVoaFZiU2FUTENNaXYxM2FoUFdzQXZFa0ROTkpKeTlZMjJyMlpjV0F6?=
 =?utf-8?B?MXlsUWZ5SEFhbHJHV2xXNlQ3MEwxZ1ZBaTVzaHFPZHpFRUM4Y3M1TXdKM1dh?=
 =?utf-8?B?cjkvMFF5ZDRaK1FoR1NvWFlrclZqdGcwR0FoM1ZXdUszQVVvY0NzSmRNejVv?=
 =?utf-8?B?V2lsWklTck5QNTg1Y3JTcTdPc0xaM1hFTTNkUTZaaTBCREpxTE9NWVg1dEZQ?=
 =?utf-8?B?amRuMmhPa3hDZWMwYmxZWGtBaVI0aXAvTU1vamt0UVllR1JjWHV0dStWdlNk?=
 =?utf-8?Q?wJQ3GD472aAG8UrzUmatYESKeGdi5dm4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 20:11:27.8230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d6aae9-8b63-4c69-738f-08dd0d8d5844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Add the ability to detect both a formal hyperlaunch device tree or a dom0less
> device tree. If the hyperlaunch device tree is found, then count the number of
> domain entries, reporting if more than one is found.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain_builder/core.c  | 14 +++++++
>   xen/arch/x86/domain_builder/fdt.c   | 64 ++++++++++++++++++++++++++++-
>   xen/arch/x86/domain_builder/fdt.h   |  5 +++
>   xen/arch/x86/include/asm/bootinfo.h |  1 +
>   4 files changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
> index 211359895d84..a80f3711c306 100644
> --- a/xen/arch/x86/domain_builder/core.c
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -40,7 +40,21 @@ void __init builder_init(struct boot_info *bi)
>                      ret);
>               bi->hyperlaunch_enabled = false;
>           }
> +    }
> +
> +    if ( bi->hyperlaunch_enabled )
> +    {
> +        int ret;
> +
> +        printk(XENLOG_INFO "Hyperlauch configuration:\n");

Hyperlaunch

> +        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
> +        {
> +            printk(XENLOG_INFO "  walk of device tree failed (%d)\n", ret);
> +            bi->hyperlaunch_enabled = false;
> +            return;
> +        }
>   
> +        printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>       }
>   }
>   
> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> index 3f9dda8c34c3..ff1ba58b6907 100644
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c

> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    int ret = 0, hv_node, node;
> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +
> +    if ( unlikely(!fdt) )
> +        return -EINVAL;
> +
> +    hv_node = find_hyperlaunch_node(fdt);
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

You continue execution - is that intended?  It'll take the next module 
as the kernel and try to boot?  Would you rather panic?

Regards,
Jason

>   
> + err_out:
>       bootstrap_unmap();
>   
>       return ret;

