Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4889C10C4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 22:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832194.1247610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99oJ-0005T8-O1; Thu, 07 Nov 2024 21:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832194.1247610; Thu, 07 Nov 2024 21:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99oJ-0005Qk-Kr; Thu, 07 Nov 2024 21:12:59 +0000
Received: by outflank-mailman (input) for mailman id 832194;
 Thu, 07 Nov 2024 21:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2I65=SC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t99oH-0005Qc-KT
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 21:12:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c32a885-9d4d-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 22:12:52 +0100 (CET)
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Thu, 7 Nov 2024 21:12:48 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::56) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 21:12:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 21:12:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 15:12:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 15:12:47 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 15:12:46 -0600
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
X-Inumbo-ID: 0c32a885-9d4d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjBhIiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBjMzJhODg1LTlkNGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDEzOTcyLjYxODAxOCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfbmXbcLZJVmYzoCP2WArZAYe6LSz1kuhcli+tayiXv43nIT3ciYvXapH/wD1jqAwbo5V4EDOja1QPYU008XuQ9K5fk+SduGEZtTL4dQ0p+KMWpn4QXFgdQDuc5L8xthf+zIeXFs93ohnlD0daJooF53yaT4fdV+hHCisyMr8CoPQvYxtkGQPgz+b5A/qEoW2O5QC8Jd+L65vxMarboOuBDhxEIqmDKMKC8NnU/jtdJ9wZTAC4A3AoFbP667hUSqCT9rixwomrM2JIrRDTJ8FQzQg1hLiK8NLe6AeXlHJ6hwPKcpzq+Jm6MwXd4oLamtkfpxdCnPzske5h7NmsPJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOdhTX9d0VxfNaAqnwZk1tI+22gfz7+7+QWyZkVHbFE=;
 b=HY1wpCr2/VdlZcO7b/jJezwg332CEjgC/GaCpD0uRBU73FDnwM2+/dS7t9SWN+O+Oh9L3yZ3yKOI9Y2dUPQwNpwpLm/HND0Ubf0n6hzlmkWXzLsexxIk+pXSlYCEpmvxkvjkln83BWoKAdHKhOUVIqW7hVyfU108Bh0Pw8DFEgKBsYSRfmKhMezc7pP4ugga2YGOtdMumEuyF5wKzFfM8IIkz43BUnuCvU/W+0Q6lQw6x8sRi8Vk5ikyPvpbPFhJcDnhgF94BUxZJZBZ0uUYkpH6FR3RYSVgHYYHQuvJeWeYl9UARr1Po2CweFiO/oKdqt+cwRR0NyObZ8GO4aKUDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOdhTX9d0VxfNaAqnwZk1tI+22gfz7+7+QWyZkVHbFE=;
 b=EC3X7/oM+7lq4DrahAIoz/X2tXkW4OMNI3S5W1mqCxoEuw86gZVhNflqBBfYM0q2D9Emmtiu6Z8v54JO+duk7tdf3vTZ/yFsyGpSkA3fF4r7DaX1eQ9IcnH0WRDV7tTM5A+S669p1SkXfLM/v6W4zNSZ2WRmic6ubiRGHLLIFAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1a7d3d9a-0100-4dcc-9e2a-727a3061cd74@amd.com>
Date: Thu, 7 Nov 2024 16:12:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-13-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: b25baeda-508e-4c9b-3f0e-08dcff70ee6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1orOVF1STk4Rko2MXVLMXM2NUpSVHprVzRKOUxPU0lMTWs4ajZSNEtQNEZo?=
 =?utf-8?B?OTFQODR6MzBmTTZXeTh0aGpCb04wUFUxanRUZ0dPTWlhMnh2cmhiYUtqbVVM?=
 =?utf-8?B?QnVYNW4xNzVEd0k4WW1MK2JpMkk2RWh0RHRTdUFNUFZ2dmRVV0ltYWhDVzZX?=
 =?utf-8?B?MkNRaGZXSkNBMW9JWlZ2ekdJUU5IbzdWck8yY1lvVUFWQ1RuQWZCN2tueUp0?=
 =?utf-8?B?ZW02RXVNVXJiNDhGYWtGamdpeXU2TE9SL3RZMnQrZWZrSTYrVlhWdTF5QkZ3?=
 =?utf-8?B?SXJGZ0E1NUgvYUhwOEwra1RBbnJWUmdiZHI3eStKaTVZMGFCRmVvb1RDMUUv?=
 =?utf-8?B?UlcxMWhJdS9pNG9uaGxDWElnMHkxckJ6SHgrTmJCNmlHWVZjMVRyRXQ0UHhk?=
 =?utf-8?B?RzNGdEpicXZvd1ZmcElybkVla2xHNFp5MHBKQWNBa2JneEk1VWNEMEVBL3Zk?=
 =?utf-8?B?M1Z6b3gzdFhmY3BCcGdrV0JEa21HT2ZuWkJiK29TbmY0ZVdSOTNjOW9ORVhp?=
 =?utf-8?B?T2FHaWxZbnFNWGt6bEoxZCtEMTFmNUEvSlVPemZpVEZ6OGtqVUtKNUx2aFgw?=
 =?utf-8?B?UjdTb0Y5eTBWa1dtY0RCM21zYWVZRmhZMmFtamVVT3VBZzArZEcyS2w5WHNo?=
 =?utf-8?B?NkJOSEROQm9QNTNGbUJYUGhxcnFHdE1ObGl5VlA4UjdOcXAydS9wUWN1RDht?=
 =?utf-8?B?enF6cE5ldWp2dENYaVRUbkZLUzZpaWY2OTVWcHJxZWJTRXVWUmF4K055elpW?=
 =?utf-8?B?RXEwM2xoOWR4WGExaFE2OHNKWHByMUhkYUpMb2dmNDlHbGpoMDNvRC9Nb1ZF?=
 =?utf-8?B?dGxwclVBdlR0SWFxeVhjVEd2RXV6YU5FVXV0OVBDeXliOFdHLzVhY1JsL0NY?=
 =?utf-8?B?ZVhkcUs2UFFjOXhKbm9rZG1TUEJEa25YU3FoekkrV05lUm9IT2Z6eXhMa2ti?=
 =?utf-8?B?QzdUOE9CMzZKempmRjYrKytxcXRHVnBINXBqcWJjS0ZVVU0yNnBFaFZmWW1H?=
 =?utf-8?B?WmdCMmd4aWRYQzBCTWRMcWhwYXBlVlR0eVVKM2xoUmg1VkVTNVR4MDJTSkJm?=
 =?utf-8?B?RFJzTmxCeUQwRnBYTDFJcDhPZll3TG1iZzdqeHBFY3BsMUE5MFFwdkVFT1F4?=
 =?utf-8?B?SHltejc1UGg4VEFINXRITDFCdGp6WUlHWFQyVk9EdGtsRkVsMzlIeXViTGUr?=
 =?utf-8?B?bzI1clRIZ2pLRjlJK2JvL015UnlENE51QkhTUWdlNFpGemJQTEdLZWZwY29G?=
 =?utf-8?B?OGhEb3ZVSVhtNWhqa3lkVm9remtQRnQyTWRvK0N1Nm00ZThyMjFmSlJUbGRa?=
 =?utf-8?B?RVZBRzlqSElUQWxheEQ2WkU3VW9nMmpjM2NHQ1ppaERCNnFrNkMvKzBValBW?=
 =?utf-8?B?UnlMMURwUTFnbHpDRE82bDJXTVFEeVNjc3RUK1JWM0p5TmdVdUViV2d5Qy9o?=
 =?utf-8?B?a0gxS3BHY2xKNlF1YlVPQkxKV25vY2NyR04wQjVZWi8zM1ZCR1JoWFlpWHpx?=
 =?utf-8?B?Z3FuRHpRMUxkWGFJWjhvd1BhTlhsbW1pc1AwUEhEWEVBai8wb2g5UXpGUGo2?=
 =?utf-8?B?VEhkK2lVekd3WTRjYS9YdzAyRm1WbzVNREJpNEd4WFk0Y3RVK3MzbWl4OTdL?=
 =?utf-8?B?bi8zZlN4SmJWTnh6ZEFiZmZQZzRGSExHdE9xZTVVTDlaOHNjUE9LSWxuWE5a?=
 =?utf-8?B?ZWg3bm94TUdjb2Y4RkR1Nml2MGMrbjhkbmROaG0vYWRFNUpWWGF6dklySkxF?=
 =?utf-8?B?Nk9aL3hjN1FkUVNkMnd2Q2I1YWZJc3NFSEt3RnVOM1lhelBEMi92SUdGdGQw?=
 =?utf-8?B?QkhkNXdmYnhPTDNKRUl2WTRtYlpoajJMRVRybW1aNmxGbnVXQjU3WWJ1VWg3?=
 =?utf-8?B?eFlPUWVhbFVMQTBiNUtLTjBUOVp0Z0FMeWtOVjRPUGE0R0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:12:48.0387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25baeda-508e-4c9b-3f0e-08dcff70ee6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012

On 2024-11-02 13:25, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain. This provides for
> the backing memory to be directly associated with the domain being constructed.
> This is done in anticipation that the domain construction path may need to be
> invoked multiple times, thus ensuring each instance had a distinct memory
> allocation.

Is the area only used at domain construction time?  If that runs 
sequentially, then only a single cmdline buffer would be needed. 
cmdline_pa can keep pointing to individual cmdlines.  Unless the 
multi-domain builder needs to keep multiple?  But that could maybe keep 
cmdline_pa pointing into the device tree?

> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v7:
> - updated commit message to expand on intent and purpose
> ---
>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>   xen/arch/x86/include/asm/dom0_build.h |  1 +
>   xen/arch/x86/pv/dom0_build.c          |  4 ++--
>   xen/arch/x86/setup.c                  | 18 ++++++++----------
>   4 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> index 3873f916f854..bc51f04a1df6 100644
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -8,10 +8,14 @@
>   #ifndef __XEN_X86_BOOTDOMAIN_H__
>   #define __XEN_X86_BOOTDOMAIN_H__
>   
> +#include <public/xen.h>
> +
>   struct boot_module;
>   struct domain;
>   
>   struct boot_domain {
> +    char cmdline[MAX_GUEST_CMDLINE];
> +

You might want to put the 1024 byte chars at the end of the structure. 
Having the other pointers at the start is probably more useful.

>       domid_t domid;
>   
>       struct boot_module *kernel;

> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 28257bf13127..2c84af52de3e 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -960,8 +960,8 @@ static int __init dom0_construct(struct boot_domain *bd)
>       }
>   
>       memset(si->cmd_line, 0, sizeof(si->cmd_line));
> -    if ( cmdline != NULL )
> -        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
> +    if ( cmdline[0] != '\0' )

Shouldn't this check bd->cmdline[0] ?  There is a const char *cmdline in 
this function that should probably be removed.

Regards,
Jason

> +        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
>   
>   #ifdef CONFIG_VIDEO
>       if ( !pv_shim && fill_console_start_info((void *)(si + 1

