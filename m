Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E3931217
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 12:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758817.1168316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIjo-0006HJ-Qv; Mon, 15 Jul 2024 10:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758817.1168316; Mon, 15 Jul 2024 10:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIjo-0006EF-OB; Mon, 15 Jul 2024 10:15:20 +0000
Received: by outflank-mailman (input) for mailman id 758817;
 Mon, 15 Jul 2024 10:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOo3=OP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sTIjn-0006E9-K5
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 10:15:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:200a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 212bb5a4-4293-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 12:15:17 +0200 (CEST)
Received: from BL1P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::23)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 10:15:13 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:2c7:cafe::db) by BL1P222CA0018.outlook.office365.com
 (2603:10b6:208:2c7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 10:15:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Mon, 15 Jul 2024 10:15:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 05:15:12 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 05:15:10 -0500
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
X-Inumbo-ID: 212bb5a4-4293-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfhICrSY34LDbxvFvCF4U/6zt7nmz9yBM4klTgd9fU60j4bpvG+GzHllpLTTjz3Rcb9dJtZ6T6JHMO0nJSBuS2GGT4pPXNO8OMtzDhkgwU7bvFXmmEG0axfMu2Lh8cz7AoLb48uFrENYhnS2p6/Yv+yb0j7uAgHcKmKpgtrQ4DEaP8lfVeAOrSkVrDggoaZoN9AUbObEdvHbpkzEeV9aNcsOLJtXsWdULv30VUB0Kl+CU17WgtzVnIEbamcBgAYfGpNryRsCQzBR0cP01+NHH7QcoeeOODzJEzrwkESyaWlGrKc9JIGqIzqGuuQDseWT8kOa7EwSsxeajeMAdwVSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yg3+d9VsWm1DnUTslS/oveDOZBCjtkbsH3/s9DogokQ=;
 b=neko306aGUcTolGQoFMkphDDeVSHfLXCrv5dYNg4WnENTEoeZC9IyECn1cV9Yu3U7ciDzV7iGSXh+V3KkjWU9F4lMM2vpJgbe2a1MlWxCx6uEUZF4hzJioXx43OmizKrSxh1aXrX23aCkWOJzm0cKDLOuyh2KrzgESMBOMn7FBffHuh+JPQZQxDpRdMTbuCdqq2WV4BXm6ZHGl4pHNmY5W6C7hXnWH3fLbTNlEr+CwySPufLnLIY+GMMiQW+tjbt4CvQkkVBCrHNipV4pIl8LC8Iwbus255nKYCKfxE+EblJs5PzEBRVWLTP2kCylcHlwFuN0SwdaBLRHhyfbwfzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg3+d9VsWm1DnUTslS/oveDOZBCjtkbsH3/s9DogokQ=;
 b=tFXQN9+3BmMJMONZzIbsAtxvlAOfVcZnCHICUD7YCk98ljPzo7CrEs20Yecp6df2z3KGlRwIRx9mhlIjBsOnwd37LtIk/SkavrOwYcmJ1aDDiSWyDL7eCKI5jLj9Vs1jZ3sPIObA3xHSIJWvAxlK7wTKb8Ff1wpmM3z8JEGaHgk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <98144517-5abe-4a82-81b4-6a459826fb2f@amd.com>
Date: Mon, 15 Jul 2024 12:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <cb2348393294b8910d794d9d11fff28ff0e6996b.1720799926.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cb2348393294b8910d794d9d11fff28ff0e6996b.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DM6PR12MB4332:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c5838c-245f-413c-4568-08dca4b703bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWVMMmovcWZvSzlRRS96clFkUFZnZ0pJdWRHZ2luaHFwK2NBNmxnNUttR2tH?=
 =?utf-8?B?NGZwLzcvdVZTU1NySUhUWVFIZ2RrNUxpc1RDemZWMFBlN2ZKWktsd1RBSUR1?=
 =?utf-8?B?QUZVQVdFMjh0WFM2dVZycWloejRRd3FCTGp2dHF4REVBYTk1cUZMbnFJRUt0?=
 =?utf-8?B?VW9jZksxS1AxTFBRTjMyUFl5Zk16R2gzMFp3V2pQcVJUaVZDbUlCcm9BL1VT?=
 =?utf-8?B?SEFhb2ZodzdVTnMvRzVKWTBXeWVJMWJhR0lGWVUxN3RyMTNPcit6Wjh4WFRD?=
 =?utf-8?B?aEsyUkttNDJrYURLZEJnNzQ0WEwzdWZEaC94OUhucW5qbGJ1bWVUL0V5R2t3?=
 =?utf-8?B?SDRnalBwSHZBWnlCN0k3bnJnaFE5bktRbHMvQU9HNVNBbkxnRW0vMG9Zb3Ex?=
 =?utf-8?B?R1JmZERPUVNUd1M5bjk5YWw2cmI4Wk90TkhaNldKMEZ5OXJMaGNpRHJ6Qkw5?=
 =?utf-8?B?UGYzTlRMVDVOMnpXR0ZQc3h2UGhXVjFnTHFHWHlHTXNVaTkzVmRjS09vMzlo?=
 =?utf-8?B?a25udVhpemhoa1NEQVhiY3NmMjVrdXhOM1JxbnNSU3drOTc5REhvRjNxT1VV?=
 =?utf-8?B?MVRmaFY2RTJVUEU5MngyRFZwcU1zZDdUV3pXSnlpRzhNaS9yMStmR0VNZXNs?=
 =?utf-8?B?V0FlVnhEc2hBeitvS1YyYi9ZNUd2YnJwVHg4S3JDeGM4WUJxeDFKQkNITklr?=
 =?utf-8?B?SVJLZXM2STNXVkZNYklzMkEwNndFVE1RalltMmJYeUpsZ1lHSHpaK0oyNlVD?=
 =?utf-8?B?SjNjeHlaTFpBRDRsTzcxRnJDdHV1eElkWVFyS2EyaXJlb3JEZW5mSGIyVDJh?=
 =?utf-8?B?c0lIajlRSmc3cWNydkdwSEx5VnlhRXczeXNrQUE1ZWlXckVzTENxVmJLQnEr?=
 =?utf-8?B?S0NWVDVhcnhqcUZaT04ramFuT3pXbEdjY3JXNi9tY0pTUlU3NFJOdWxtWWlV?=
 =?utf-8?B?alRPaUpya25pcHhYOElHSEpvQnF2MlZBTHZtOE1hS0lWMGcvdDNXVytTT3VH?=
 =?utf-8?B?TS8xdG85Ly9aWHRybkRVTkpSLzZMcHdDaFNQZk1wTWRwUWJvRHA1NlBobU5Z?=
 =?utf-8?B?ZjVua2t2aDh2NE5LNk5CSUw2QzZQUW12K2tqanFJbWNlamR6SXg2ZnAzRVl2?=
 =?utf-8?B?SkhhbVdWQ2hYREdaaU5wTll5VUdHSzBTam45UDJ5bEI5KzZoN080VGM3SUNW?=
 =?utf-8?B?MlMzcjN2dGtEVS90M2dPa1cvNkRWa2RVSmJZUllLT2xUb2JWVHZNMzlYYkpR?=
 =?utf-8?B?NVlNY1pVcXRpU0xWVUN1Z2dLY0l0Z2VhUkR4Z3ZwNWFSbUNDMVNoRW90R21i?=
 =?utf-8?B?ajc2V0dRSDY2ZXFtZXl3cUg2UUFzYnBQemdxUDYwYmcrNjVBNDYvcVY0VmY3?=
 =?utf-8?B?bklBS3pJYWpmSUQvMGtvL1RpNlZtZi9NcnRmdUFFaEkyTEJrdWdxbzUxdzB5?=
 =?utf-8?B?T21rSEVBLzJhdTVQVGYxTjBSVEdyV1BsMTRrdnl1SUFsbUJQR0N5cEVlWjlZ?=
 =?utf-8?B?NzJxeG5QSTdPcnFibGtyeU91aEZEcGFwVTdUZ0Fndk5QaGJTTXRXU0hUQ1JL?=
 =?utf-8?B?aUdEcjUvYjJEME1hdVUrcFdwVUVma2xsaFE3NjdCZEx3aW01UEM5c0I1MkNv?=
 =?utf-8?B?Wmw4QVJkbC9SdnBzYm9hSjFkMExrSE1PZTJrbEdoVlNuY1JzMFZMS2tzTEZh?=
 =?utf-8?B?ZnVBV1kxNzF0YVlVdGQyVHlXdmJ5N2VVdDhLRUJUaGxobmxSVU1OQmVnTkZE?=
 =?utf-8?B?UW9mM0tuaWRlU29ESkdVVysyYnRtOEp2RE94Zkl3dDFIL3ZNbFdwRFlkcmJ1?=
 =?utf-8?B?UTZEeU9ETXJHNEdlZHJGN2RaL2NBQ0c0Tys1aGMvWkk5QWdHbUx0dUwySXBv?=
 =?utf-8?B?ay95WG5hT2JCMSswdlF4N05ZSFpTTG5kMGtJa2kxbnYwV2ZTdXZMS0RHamxl?=
 =?utf-8?Q?4J0yN7oIGc09GIsMWpPYRNAE4cUp8NlV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 10:15:12.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c5838c-245f-413c-4568-08dca4b703bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332

Hi Oleksii,

In general, the patch looks ok (apart from Jan comments). Just a couple of remarks.

On 12/07/2024 18:22, Oleksii Kurochko wrote:
> 
> 
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V6:
>  - update the version of the patch to v6, to show that it is based
>    on the work done by Shawn in the patch v4.
> ---
> Changes in V5:
>  - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>  - drop message "Early device tree parsing and".
>  - After rebase on top of the current staging the following changes were done:
>    - init bootinfo variable in <common/device-tree/bootinfo.c> with BOOTINFO_INIT;
>    - update the code of dt_unreserved_regions():
>        CONFIG_STATIC_SHM related changes and getting of reserved_mem
>        bootinfo_get_shmem() ??
>    - update the code of meminfo_overlap_check():
>        add check ( INVALID_PADDR == bank_start ) to if case.
>    - update the code of check_reserved_regions_overlap():
>        CONFIG_STATIC_SHM related changes.
>    - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>    - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>    - struct struct membanks was update with __struct group so <xen/kernel> is
>      neeeded to be included in bootfdt.h
>    - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to generic bootfdt.h
>    - bootinfo_get_reserved_mem(), bootinfo_get_mem(), bootinfo_get_acpi(),
>      bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved to xen/bootfdt.h
>  - s/arm32/CONFIG_SEPARATE_XENHEAP/
>  - add inclusion of <xen/macros.h> because there are function in <xen/bootfdt.h> which
>    are using container_of().
>  ---
> Changes in v4:
>   - create new xen/include/bootinfo.h rather than relying on arch's
>     asm/setup.h to provide required definitions for bootinfo.c
>   - build bootinfo.c as .init.o
>   - clean up and sort bootinfo.c's #includes
>   - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
>     xenheap-specific behavior of populate_boot_allocator
>   - (MAINTAINERS) include all of common/device-tree rather than just
>     bootinfo.c
> ---
>  MAINTAINERS                       |   2 +
>  xen/arch/arm/include/asm/setup.h  | 187 +-----------
>  xen/arch/arm/setup.c              | 432 ----------------------------
>  xen/common/Makefile               |   1 +
>  xen/common/device-tree/Makefile   |   1 +
>  xen/common/device-tree/bootinfo.c | 459 ++++++++++++++++++++++++++++++
>  xen/include/xen/bootfdt.h         | 196 +++++++++++++
>  7 files changed, 660 insertions(+), 618 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  create mode 100644 xen/common/device-tree/bootinfo.c
>  create mode 100644 xen/include/xen/bootfdt.h
> 

[...]

> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> new file mode 100644
> index 0000000000..7cd45b3d4b
> --- /dev/null
> +++ b/xen/include/xen/bootfdt.h
> @@ -0,0 +1,196 @@
> +#ifndef __XEN_BOOTFDT_H__
AFAIR, to avoid violating MISRA rule 21.1, we should avoid introducing new macros with double underscore.

> +#define __XEN_BOOTFDT_H__
> +
> +#include <xen/types.h>
> +#include <xen/kernel.h>
> +#include <xen/macros.h>
> +
> +#define MIN_FDT_ALIGN 8
> +#define MAX_FDT_SIZE SZ_2M
2M blob limit is Arm64 specific. What will be the limit on RISCV? Shouldn't it be moved to some arch specific file?

~Michal

