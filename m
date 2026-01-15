Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC6D23562
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204371.1519062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJGx-00018J-VE; Thu, 15 Jan 2026 09:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204371.1519062; Thu, 15 Jan 2026 09:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJGx-00016H-SP; Thu, 15 Jan 2026 09:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1204371;
 Thu, 15 Jan 2026 09:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE43=7U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vgJGw-00015s-C1
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:04:06 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 212f1c92-f1f1-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:04:00 +0100 (CET)
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:03:55 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::8) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 09:03:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 09:03:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 15 Jan
 2026 03:03:54 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 03:03:53 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 03:03:51 -0600
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
X-Inumbo-ID: 212f1c92-f1f1-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pxgr3UzMIsDlNFnPopSxSLlGFSzdagTL0p0kx9TwEyzF16YO5pmA/jrZyXqeZluGoUzE/1r/DXZb8IVNbhVMOjXEDd58EJXxG8+VhLtOx+1XHW/YVdzUYj/w11Kw9iOUSH/2fcfG6eiaqvTYDngo1/aauyi/vPOwGFv7Hc2GVeZ0U7LdHEu8HPYyEjK1dRg7XRBcsgjODBLn0KurisZmQ+BNrDJlHNi+RScQz58IXgTQjQONhWgubk01psMioEp6Gi7mhUCMjAckb5NzeHCF5fjAq7u/G+aphPGkm/V3o2grog4+5+JWEAgJ5YdA3i71gikdusb9ubWcMcYEEUOw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfW0N6H2ly5YeUdCPE3Iat57aZinNMZDcEEsXST2ynQ=;
 b=AQPM/mtlin7nY8ovXL8rRbmfU4tqBavUyJxK1/fWc6GYCjPn2Z/BA742VFrUPok7uEvflvJEB/E8soEyeYDDmpMD1V5XUWBdwCs/oLzNVOD8T2shnqcr5AAgSy1Gdx/bMnSAGvjDMCZps/R2KjcwbLSUoNBOE9yaG6ZbzV8UHyYeGxB+D5r5N0/VNLWR/u7fONYaFO/W320pwDPA9ce/3nfldcu++Ua3gtC+R8QDx1pVcd+72aTtyTLeVxWgcJYt2wu7bjvZSApaw1/0QIHvE3s6k+qX1hZe1zmalK7mOUVBPkhzr7V9Mtq8Ec7Kl4DLyfVvd4oGn2XGwaSNFkYw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfW0N6H2ly5YeUdCPE3Iat57aZinNMZDcEEsXST2ynQ=;
 b=civOcESdx/MjIVZcfDrmiwvRor0FbiM1ugnU6VtevsZXiH9poHkcfydj2Cf8LRRUoTOG1BKMISsmvrmTQfKxyRGkKYttkxR9TGmLOMPEcwuRBMiz90S+iGCpqgkqUgPawlzyQhVIMQphc6bvAluvtx7926Bb/TTRA6/vE5jGUNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <806731b5-6c56-4274-98f1-120530cfe398@amd.com>
Date: Thu, 15 Jan 2026 10:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
 <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a74f9e-082f-4525-6b3d-08de541502d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejJDcHA2bmQrMVZVQ0ptSXBWaTRNNzVzUEx0eEYrSUt6eXp0UmcrbEtwT3o1?=
 =?utf-8?B?UHVEa1RMUURGUjh5by9jMDBodmZWTHhySy9tbTZpMmRNeStjb1NHNVBjVlEz?=
 =?utf-8?B?b2lrZElIYnpzOWN2cGk0YU5BNE9oaVFXTWNCUFd1ODlFQXB6OFRtZ1R3TCtv?=
 =?utf-8?B?ekVvUnRHY2xZbythVnNNUkVZdXAxRHRMNWgzS2dhTmdyeXlhSWFGT0h3UWZq?=
 =?utf-8?B?SWJjYVJhSmZsWlIvbGtvUDhrN0wzS1dobnlOOWhMdDZlSTVmbXl5cDl2dVpS?=
 =?utf-8?B?NTE5cGR4VmpwUDJsOFh2alE0YTNnTFJrNElwN1FVR0t2bjljM0h2TGY0OGdP?=
 =?utf-8?B?YjNtQXFoNkRLL0I5cC8rQ0lYU0JxOEVQVFRhNVhkVmtsM1F6Rm8zdm80d3px?=
 =?utf-8?B?N3hUSm1WM2Q3UGM2WGpLNjlDdVVsbFNRV1JVSm1LZG1CVjk3cHd4dDFUWEpK?=
 =?utf-8?B?QVBwa2w5Zk1UMkdlNXdzSDQxSGQ0M3pIUXpnWDJtcC9sN3lGUHNIR2FQdHZG?=
 =?utf-8?B?QlV1enFqa0w3TEJ4Mm5jWFFOUFdHbzd6eUtSbUE4dVRacUVLRG5IVWpOZDQ4?=
 =?utf-8?B?NGxlQ0pxcmVhTENsNGhQS3FDeVM0NnFUVktiVlRmeWRCWERya2dvZ1QzSWNy?=
 =?utf-8?B?TGdZbURZdkxOK3hhM0Q0VTZFeS9yTEU4RDJyQmNpSlhxMGdIYmQrVkdBcEZR?=
 =?utf-8?B?UEtDcFNKV0xLT1pHQ0VRa1ppa2tlY2FlZ2dOV3R1TE9wNjduMURlNm5qQlJm?=
 =?utf-8?B?Y1cxdTVBNTJFRWtrSTFlRmdaMGZncUh4eXZCcHVSb2ZKM1NwM1BVVkVZZ2U0?=
 =?utf-8?B?WXNDRTdteWpXODhZYndEdlBCcEllNFVFZlM3Wi93dEc1NHZEUzN0YzNDNlAz?=
 =?utf-8?B?VCthd3JCRjdnOGk3MnJKY01OSGdIYnJrRU1XSVZ5bGRMWVFZMUtVdGtHMnl0?=
 =?utf-8?B?TkIya1pkQWlPY0txU1FsWHVYMEZCbkZDNjQwaktxdC9IWlpLRFVhdTNpazlQ?=
 =?utf-8?B?OXNzVDBqcFBPcU02T3BzMWkyeWEyc3lHclUySjZ1K1FFVnlwbS9tWHRHb2dF?=
 =?utf-8?B?bW5tSkdnd0lNem1tbnIyNVlyNnBMY1lOeEtUak9Lb2c4Y2Q5NE5FaGNJMWtK?=
 =?utf-8?B?cVd3KzIvbytCZ1JvWDZxUWhyRzFvRXZDWks2VmJOdzVaVERpZExBWDZUZSt6?=
 =?utf-8?B?NjZWdzZVK0VQU1NiRVF0VlIxOUV2L3NUdTVpNGxxQ1g4Nmx1VFJxci85LzVs?=
 =?utf-8?B?bUZ6OGZEbFRYekIxTWRzb3dxUXErZWwvN01Keno2dHpCOHVXM1pVTUFiVEtF?=
 =?utf-8?B?VTlCYVFkSERtQmM0UU1oTFg5V3FLOHZnYk4zcTVENEV3dWN0MHNENHBuTzQz?=
 =?utf-8?B?Z3VHcWpHc2JLb1JMQ3BzWTUyTjBQMWJXWWdPSnBoS3U4TVZEdUdpZFNtemM2?=
 =?utf-8?B?NUE3NUtXbi80a2JJVkt0Y2drdzYvTmJNMHYxczQyUFF4b3hZV2gvS0R2YmZz?=
 =?utf-8?B?c3RWenErRkJYUXUwN05Ibm5ydTdQVTI1S1BaVWd6SUlON0s1cmFnc3F6aE8y?=
 =?utf-8?B?Qi92ZWYwQkZZaWdvOXMweDJUZy8vQy9zbHNodlhYWENSdlNTK0tubDhTM3E4?=
 =?utf-8?B?LzdlZXVVUk4vc0kvd05INUU4eCs4cVdWWlNrcmdEamZoT0hudCtoTE8xbGln?=
 =?utf-8?B?aEpibmtKcXNqYlUzVm1MVVU3MERyTEpBeWxEQjhPYi81SGxsUVRuN2dtR3Qy?=
 =?utf-8?B?TUNYbGJGenFCUHgzOWRyMXVhRkhNU0piNHRIZHdENnArRVF2YzhEb3lWZWZz?=
 =?utf-8?B?RU1BVU9wK2p5VVJ3dkd3WXZMcWwyMHJwblNHbTd4MExxT3hNRkErNXMyQTZR?=
 =?utf-8?B?NXZOQjgxdkRNdmdvSVBRRG5kWTBIQWcrZ1FKK05TcFNUVlk3bnVMZ3RwMWVa?=
 =?utf-8?B?T3dBYk9XNzlaeGNjay8yTUNVS1M2Y2NLa3hnajRBUHlvYXdKb203Mi9aRTI3?=
 =?utf-8?B?eGo0M0xiMVhZUGZIbVVYZzNrMDlaQ2JHYTcvWEY0V0xtTGcybUVrME5mNG9U?=
 =?utf-8?B?UHVUYkF6dXNKbU43Z2N4cW5iL3djZ0hWS3J5Qy9JT0lpbFJCZFhvTWNhYWRw?=
 =?utf-8?B?djFKcXNiOXNqMFd0aGVQVkxObnZDdjlTYkNiKzhnMFZmcExYanE5R1RqZXdi?=
 =?utf-8?B?RDdJdTRkQUgzTXlkY2U0RllINWdxYndCS2NRU0Vha3NBUG1FR09ocWxCMHhU?=
 =?utf-8?B?d3NhQk9RQk4xbDBDcUlkckdLSUtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:03:55.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a74f9e-082f-4525-6b3d-08de541502d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440



On 12/12/2025 14:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
> 
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
> 
> The arch_domain_resume() function is an architecture-specific hook that is
> invoked during domain resume to perform any necessary setup or restoration
> steps required by the platform. arch_domain_resume() stays int to propagate
> errno-style detail into common logging; preserving the integer keeps the
> reason visible and leaves room for future arch-specific failures or richer
> handling.
> 
> The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
> the vCPU context (such as entry point, some system regs and context ID) before
> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
> code and avoids intrusive changes to the generic resume flow.
> 
> Usage:
> 
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
> 
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V16:
> - Refactor error handling in domain_resume: move logging to generic code,
>   use explicit return code checking.
> - Make context clearing conditional on success in arch_domain_resume.
> - The 'int' return type is retained for arch_domain_resume for consistency
>   with other arch hooks and to allow for specific negative error codes.
> ---
>  xen/arch/arm/domain.c                 |  39 +++++++++
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |  10 +++
>  xen/include/xen/suspend.h             |  25 ++++++
>  9 files changed, 205 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/include/xen/suspend.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 47973f99d9..f903e7d4f0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,8 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
>  
> +#include <public/sched.h>
> +
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> @@ -24,10 +26,12 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/suspend.h>
>  #include <asm/firmware/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/vpsci.h>
>  #include <asm/vtimer.h>
>  
>  #include "vpci.h"
> @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    struct resume_info *ctx = &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
How does this check and returning -EINVAL correspond to...

> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=%u, shutdown_code=%u\n",
> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend reason
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
> +     * In these cases, the resume context will be empty.
this comment? This patch assumes that we can now resume successfully (i.e. this
function returns 0 and common domain_resume can continue) only if the shutdown
was with SCHEDOP_shutdown. Anything else will infinitely keep the vCPUS paused.

Other than that, the patch looks good.

~Michal


