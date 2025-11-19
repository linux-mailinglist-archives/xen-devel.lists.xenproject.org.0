Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198AC6D836
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 09:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165689.1492370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdrC-0002Ru-OZ; Wed, 19 Nov 2025 08:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165689.1492370; Wed, 19 Nov 2025 08:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLdrC-0002PV-LE; Wed, 19 Nov 2025 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1165689;
 Wed, 19 Nov 2025 08:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vLdrB-0002PP-NK
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 08:48:05 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743d4667-c524-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 09:48:01 +0100 (CET)
Received: from BN0PR10CA0028.namprd10.prod.outlook.com (2603:10b6:408:143::34)
 by SN7PR12MB8820.namprd12.prod.outlook.com (2603:10b6:806:341::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:47:55 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::47) by BN0PR10CA0028.outlook.office365.com
 (2603:10b6:408:143::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:47:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Wed, 19 Nov 2025 08:47:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 00:47:55 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 02:47:54 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 00:47:52 -0800
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
X-Inumbo-ID: 743d4667-c524-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLfl6eqEy7nX5KSPlxL5VSth47DmPSonB17AjPr6AMM6Ol0KtOQEYy4V/Dnb/T4fThjWtl3MgpOdpr/bgozggWxnvZIkFaAZuTdwy9IKFDWVHQFYd2KCjgjGY14dXgJ5moUMz0Q60eO+209cTU1FRcjaZc9zaF21T0GlfYA+kRJwqL4Td9C2j8Vx2fI1bFoAZKkrGwo3UDfvIYAUS4+EZW1HSchiP0rRfPX3HbcOdsDsyuYYxT5/9h1RIQ2SCkhDWy/+ERHUhMXMnV+TC5EPjJgKAtOf4DJC3NkAQR3RG2fOl2P2FgUFtwbZ/uLd9myIYEwe09c02YTiKltPgE5lcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su0iSqib626Zn72ft5Jjud6kQuq0GVOlnNFk524ALPQ=;
 b=d29mGxPiZcQaPz3JZ2OeWXtUmeL2+1i6xctw8SmsZ0jx/T0+oclBQSuQDybtuBq3z0b576fNH8l2WRfvaCB65ukTjGlzQVtSaNKwlLsBkwhj38I4W6df5L0ZdJQfBqS5jAd8SteVDcIVghjoTAxvwMx90GPjzb6JOCMzmMqxqKNvLSkmMs+J9zSE6DlmcbpdrFB6LYkDQ+/Eni4BbQDUvhOHoOr0MD8fuv2WdZKfKZArW70uvnje6PnwkcKgFRwAA+JuNILYEwAyjR8XXg2NVIpNBYlju25/ge76vMIzK8mf3uCMwm38qlMDLDBW1M+s6qyajNItNHBbIYT085skbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su0iSqib626Zn72ft5Jjud6kQuq0GVOlnNFk524ALPQ=;
 b=B1AeFX60/xWEu4VmXEGXERDGZhHCu9FHKweTTbxeY1V4w1lradi1Bec2VxYVczoZ9XGcTYToVf0IC4wy113uHtLLF8uD6XnBJit/NGn2h/RLtmGlsSApQExM2GGOPeG3vmcJKzJ5hSbVtGCiWube825Bfgw+tDOEakwlKblXEbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com>
Date: Wed, 19 Nov 2025 09:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
 <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SN7PR12MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 220315bd-d194-487b-9b03-08de27485520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWNNbEtXMFRLbWVyWitCT3FwOE9mYnlvRjE3MUhyMWR1U0xLWnJ0ajV5OWQz?=
 =?utf-8?B?aXpHRVI3aUZEbUFTbjI5RFdEU3lHK2NpeU4ySzNhdFVHb2hoYXcxZGlVcFB5?=
 =?utf-8?B?SGhnUkNnai9pcG1RaXdiemQ2VExXUTFxYVVETTA4OXNqdnhNOHhMNk9GYnk5?=
 =?utf-8?B?NlVKNHl4YVg2WUhCSnljaS9TOWo0Z3RGNTdkUmR1YVZ1T1ZFMGw1QktHa2pQ?=
 =?utf-8?B?Ymc0NlYxWktiUnZ4VU1aMGFSQUM1V0ZrbVkvbWkwanFtb0x1RnpnS2xQeGxH?=
 =?utf-8?B?OWxnQlE2VExldzZTbUFYYzZ0d0ZaQTIzVzg2L0Jaekd4NjhhOExGM2k1eG4v?=
 =?utf-8?B?cjArQjNCdExzTGV4STlNampnU3hJS3JmaWhwcnI2ZUxWcGp1WWZsK2tVSHdt?=
 =?utf-8?B?TDNVWVBqUndpSUR5dnZocHhFSkZPTThaQXdQcUVBUEZoT0trQXhVeDhwL2ps?=
 =?utf-8?B?WTg0dnREbmlMZWlyelNFT2Jsam1lTW5kTGpnQmxhb1E0cFdqb21meHBRSGpT?=
 =?utf-8?B?M2NhVVZOV2M3Qm9DS1R2RkhzZDhtVHJEcGNJTmlpRmdGb2pwMVFCdDNsdEJP?=
 =?utf-8?B?Q0NVczlxSkgzWkJPQjdyc1kyQVcwakdadnlSUXZhYXdodERoaGIwUHpNdzRT?=
 =?utf-8?B?Y2ZhM1FvbWRpQ2ZPbEM4eE9FQmdXM1NqRytFdDNnY3NkVVlVV1IzU2lsQWMx?=
 =?utf-8?B?Y0Y5T3NaYnVwTDQzMU5aL2NHdXM5SUJYaVoyV2IwQWhKMjlhZ0pUUXltajY2?=
 =?utf-8?B?ZXpLNUxQN3NlTTlFdjk4UFZveTlvRkwzYjFpdlhDRXBENzVBdC95M2hpZ3Jw?=
 =?utf-8?B?Sy9scExWZndORldMeHRCOWlySm1Ba3ZYQlN5d3BHa3NDVGp1TzZrVXA0S2Qy?=
 =?utf-8?B?TGordzlXUmZBcDZ4aml6eXlHdVBncWYybzJlY3ZZNTgrRkRHUzd1SzJOM1NF?=
 =?utf-8?B?clc4QS84TWhwMGdlalZxRkh3YWNlSjJZS21YMHJ1TlBWSWllZncvRXJEWEhO?=
 =?utf-8?B?dXloZ1N3d2M0RVhSdzZSTXUrT3FVNktPeWxyam03UVJCV2tMYk9OUzMxajE2?=
 =?utf-8?B?bjV3cmNCN2tOYnVTazdOT05pZzVEd1BKTTEyT2lnUEpoS3VoNVVGZXcxVlJh?=
 =?utf-8?B?WHI4L1JhVTJpdDhsNG40Y3dwMy9FcG0vQTNYRERnaWJwdERwS1N1TVkweU5P?=
 =?utf-8?B?TTlDcHJ2c1pKWDUvYVQwZkxLa1JvR1lqWDBORGRKUG0xNll3NkR5ZytTODBX?=
 =?utf-8?B?T2pMYVZSMGxqanlibTd2UGR1MjVlK2UwYWNzTGxEZWxBSWhZVUhIZGFyVUh3?=
 =?utf-8?B?Ujdhb2gxVU95aW9MZHhaYlhrZjcyNWwrbmJjdDdVMWhZamdaTmwrSy95ZS9h?=
 =?utf-8?B?UDBGRkgwMUo1aVBCNmZ3WmJ2NThHQi90UnNGbDVNRityVkhMMXNRd1crSGdp?=
 =?utf-8?B?RkFyRWI3MDlVVW9Wd0o3YVNZZ3pYeDBsYWRiTWxiT0NXTzI2dXZ4RjYrMFgy?=
 =?utf-8?B?TWRkMEY2WGpwdlF4ZWx3cGlMWXN2eDJ5bzBOaUhrdVNmdSt4eFRnaG1waElt?=
 =?utf-8?B?Q0NaMjl0RTFHUUJJaitNaW92dmtLdVZEWWFGQTVWamFKSzloVHpMWEFKRUhK?=
 =?utf-8?B?VUxhV2JHTlcrSi90eU1pUnlPRnJjOVhITkFCY0g0V2ZmVStqSlFPVkxhd1Qv?=
 =?utf-8?B?TTdObTE1RWY5WTlPMXVyRGxlMUdQOWkzVnQ5c0RoYmRtMFNHTzlscnBqU3Bm?=
 =?utf-8?B?clo5R2luQU9sT29lZUh3UzNweEd4a2IwKzJPU2pIbko4UHF4OWZKZFNDRHVk?=
 =?utf-8?B?WFcxRUY5Wi9iem14dXMyejVpaDVnNHhyQWVucWVaeG9MUmF2ZkN6WTZScUMz?=
 =?utf-8?B?eS9rZkc2aDUvbWVmeklxQ2VQNVZOY1JSZitDaFE3dGRWbjJCRmJhanpLRmN5?=
 =?utf-8?B?QkFmNTlUUVE1dk5veHpOSi9HMkFUaTZnY3VoRlp2WnArTWFLYkl2QnUzN1c4?=
 =?utf-8?B?QVhKUWJWM2cxdWoyVVhIcHlsd0lzT3BqRlc3RHdtelFMSWdCbFNvOEcyOWtZ?=
 =?utf-8?B?Ynd0bnhBRjZWWU12UGpyMVdDMW9yTVErQU9URkN2ejhkMzZSNEtjMDNlS0Zn?=
 =?utf-8?Q?G1+w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:47:55.2113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 220315bd-d194-487b-9b03-08de27485520
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8820



On 18/11/2025 16:37, Mykola Kvach wrote:
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
> steps required by the platform.
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
> Changes in V14:
> - move arch_domain_resume to a separate header
> - avoid usage of typeof for context struct
> - moved error printing from domain_resume to arch_domain_resume
>   in order to simplify common parts of code
> - minor changes after review
> ---
>  xen/arch/arm/domain.c                 |  41 +++++++++
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>  xen/common/domain.c                   |   5 ++
>  xen/include/xen/suspend.h             |  15 ++++
>  9 files changed, 189 insertions(+), 22 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/include/xen/suspend.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index e36719bce4..3c0170480b 100644
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
> @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *d)
>      p2m_domain_creation_finished(d);
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    int rc;
> +    struct resume_info *ctx = &d->arch.resume_ctx;
> +
> +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
These are bool and uint, so %u should be used.

> +                d, d->is_shutting_down, d->shutdown_code);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * It is still possible to call domain_shutdown() with a suspend reason
> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
> +     * In these cases, the resume context will be empty.
> +     * This is not expected to cause any issues, so we just warn about the
> +     * situation and return without error, allowing the existing logic to
> +     * proceed as expected.
> +     */
> +    if ( !ctx->wake_cpu )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
> +                d);
> +        return 0;
> +    }
> +
> +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> +    if ( rc )
> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> +
> +    memset(ctx, 0, sizeof(*ctx));
> +
> +    return rc;
> +}
> +
>  static int is_guest_pv32_psr(uint32_t psr)
>  {
>      switch (psr & PSR_MODE_MASK)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index af3e168374..e637cb4de0 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -5,6 +5,7 @@
>  #include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> +#include <asm/suspend.h>
>  #include <asm/vfp.h>
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
> @@ -126,6 +127,7 @@ struct arch_domain
>      void *sci_data;
>  #endif
>  
> +    struct resume_info resume_ctx;
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>  
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>  
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>  
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>  
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
> new file mode 100644
> index 0000000000..b991a94d5a
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_SUSPEND_H__
There should be no double underscores in guards (see examples in CODING_STYLE)
> +#define __ARM_SUSPEND_H__
> +
> +struct resume_info {
> +    register_t ep;
> +    register_t cid;
> +    struct vcpu *wake_cpu;
> +};
> +
> +int arch_domain_resume(struct domain *d);
If possible, headers should be standalone, meaning you should include necessary
headers or forward declare what's missing.

> +
> +#endif /* __ARM_SUSPEND_H__ */
> +
> + /*
> +  * Local variables:
> +  * mode: C
> +  * c-file-style: "BSD"
> +  * c-basic-offset: 4
> +  * tab-width: 4
> +  * indent-tabs-mode: nil
> +  * End:
> +  */
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
> index 0cca5e6830..d790ab3715 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,12 +23,15 @@
>  #include <asm/psci.h>
>  
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
>  
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>  
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                          register_t context_id);
> +
>  #endif /* __ASM_VPSCI_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..22c3a5f544 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,32 +10,16 @@
>  
>  #include <public/sched.h>
>  
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
> -                            register_t context_id)
> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> +                   register_t context_id)
NIT: incorrect parameter alignment

>  {
> -    struct vcpu *v;
> -    struct domain *d = current->domain;
> -    struct vcpu_guest_context *ctxt;
>      int rc;
> +    struct domain *d = v->domain;
>      bool is_thumb = entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid = vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> -        return PSCI_INVALID_PARAMETERS;
> -
> -    /* THUMB set is not allowed with 64-bit domain */
> -    if ( is_64bit_domain(d) && is_thumb )
> -        return PSCI_INVALID_ADDRESS;
> -
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> +    struct vcpu_guest_context *ctxt;
>  
>      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
> -        return PSCI_DENIED;
> -
> -    vgic_clear_pending_irqs(v);
> +        return -ENOMEM;
>  
>      memset(ctxt, 0, sizeof(*ctxt));
>      ctxt->user_regs.pc64 = (u64) entry_point;
> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>      free_vcpu_guest_context(ctxt);
>  
>      if ( rc < 0 )
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
> +                            register_t context_id)
> +{
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    int rc;
> +    bool is_thumb = entry_point & 1;
> +    register_t vcpuid;
> +
> +    vcpuid = vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
> +    if ( rc )
>          return PSCI_DENIED;
>  
> +    vgic_clear_pending_irqs(v);
>      vcpu_wake(v);
>  
>      return PSCI_SUCCESS;
> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
>  
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +    bool is_thumb = epoint & 1;
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    d->arch.resume_ctx.ep = epoint;
> +    d->arch.resume_ctx.cid = cid;
> +    d->arch.resume_ctx.wake_cpu = current;
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
NIT: %# is preffered over 0x%.

> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>          return true;
>      }
>  
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint = PSCI_ARG(regs, 1);
> +        register_t cid = PSCI_ARG(regs, 2);
> +
> +        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &= GENMASK(31, 0);
> +            cid &= GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 775c339285..6410d32970 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -26,6 +26,7 @@
>  #include <xen/hypercall.h>
>  #include <xen/delay.h>
>  #include <xen/shutdown.h>
> +#include <xen/suspend.h>
>  #include <xen/percpu.h>
>  #include <xen/multicall.h>
>  #include <xen/rcupdate.h>
> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>  
>      spin_lock(&d->shutdown_lock);
>  
> +    if ( arch_domain_resume(d) )
> +        goto fail;
> +
>      d->is_shutting_down = d->is_shut_down = 0;
>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>  
> @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown = 0;
>      }
>  
> + fail:
>      spin_unlock(&d->shutdown_lock);
>  
>      domain_unpause(d);
> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> new file mode 100644
> index 0000000000..53f75fd6ad
> --- /dev/null
> +++ b/xen/include/xen/suspend.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_SUSPEND_H__
There should be no double underscores in guards

> +#define __XEN_SUSPEND_H__
> +
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#else
> +static inline int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
Stray whiteline?

> +
> +#endif /* __XEN_SUSPEND_H__ */
Missing emacs block?

Did you run MISRA scan on this patch?

~Michal



