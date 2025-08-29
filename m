Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BADB3C304
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 21:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102009.1454806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us4l2-0001Wx-6o; Fri, 29 Aug 2025 19:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102009.1454806; Fri, 29 Aug 2025 19:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us4l2-0001VC-3v; Fri, 29 Aug 2025 19:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1102009;
 Fri, 29 Aug 2025 19:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gB5=3J=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1us4l0-0001V6-Ss
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 19:27:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30ba2d4d-850e-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 21:27:26 +0200 (CEST)
Received: from CYXPR03CA0085.namprd03.prod.outlook.com (2603:10b6:930:d3::28)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 19:27:16 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::3c) by CYXPR03CA0085.outlook.office365.com
 (2603:10b6:930:d3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Fri,
 29 Aug 2025 19:27:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Fri, 29 Aug 2025 19:27:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 14:27:15 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Aug 2025 14:27:14 -0500
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
X-Inumbo-ID: 30ba2d4d-850e-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb4YDQGD/WtT5C3cDWx4mLwlYhzLOMAyfcnCjjOcU+NAsCH9e9KXVrJAz4+TpUL2HYhrGzvKfKULWssso+p27OKNnfkUwX3FnW1hee3D7P+RBHZain16/hJBleSg9pyyK8oNRshrJfBZdIV2JSjblsKZiwAgPEOEPc5pyUwysHfgfq9e72/E5BdLEsajOOJ7FZZD0EtUjLpLW1UN5qQI8Z4ZhDPIZztymuzT8XIOS9vtsue8jowITV/ZjsDm1NJD/NKT74chgYFLWs7rf3I4g7IXGaGaQv5A0yL77uZFdaNehZqTLebHBWIIBPGlg2/Pe4iI9C3JUJ2lVMG8YHv/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSd8Jodlsejos4ba/Ljvbovg8UIawEf5gMHvusXI+Kk=;
 b=MTroeIQvL6S8MySKT0ggMm+uL8VSzjxl7b74qvbXlaPgyLod/rRID0pcs71oy0i03YkDcT6g7x/iJpPnHXujgqvZslzWHCz7uaCY5rTCfJJmEpjWoFcCSdkCB1DU9pK2Cd9r1M2h0qkd7HzIvCxOfTFvR73jO/a4WrN5t/UWka0aPuvyGWhqP9JZTSAstftpgmC0eGhTjsJzw8vgNgw8MWlHa5mbgWb4MIes8OnKCW7BAyAPs5A2rVUgHTUAxnQXf3dy9MFesU29ucZsAXhFLX0J9fD6sI2YaDxNAibQaW6KMrj7uBhBQjE71rC2Ti8ysRTgDJyNUDQLfH++6gn/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSd8Jodlsejos4ba/Ljvbovg8UIawEf5gMHvusXI+Kk=;
 b=46wUQrJLkq6u8lrtOvnfzMc4urhkHn+Vd+gBJJRKPwznAhFy5yF7o9g073UeIuXm0p984IhhR/y6UQdXPr6KnvrKCFmkPUZ4eU+wF4mVyu+kUWGH9VTPFkTHzvBrGsfTi2iMZJBfpC11zqo5Uto5YnI5wjvCPl05j47zVN8i61g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 29 Aug 2025 12:27:13 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <dmukhin@xen.org>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<dmukhin@ford.com>
Subject: Re: [PATCH v5 01/15] emul/vuart: introduce framework for UART
 emulators
In-Reply-To: <20250828235409.2835815-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291217110.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e0182d-f662-4376-a0fb-08dde7321024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?azixhophNMUsNIC7aLDjCqdNVmgdFbxFcgj4H3UYCnd0L3a/sHZhvFJ+jowA?=
 =?us-ascii?Q?Kb+AqdpONWZmICAviQzGfUYb8HxGq9qoLgyRC99tOZVZdGmD/CZeIME01pI1?=
 =?us-ascii?Q?3t2t/jWPeIiDMfY6eAglRLmyBF8Bu0Fy7MQTk3cmpLYnEjGmgWQBnyWOeFmL?=
 =?us-ascii?Q?9nwJV7NtqqcdlEOOFI4AXM0eP+3feb5LnWcxeCAaUEO/bcSiRbZqZNOTGpjM?=
 =?us-ascii?Q?wxKRIohaA6SegAHCz7YiSOZdPZJrpGZKmfqzIsTjN3jRdhI46uAhJDvrCTcS?=
 =?us-ascii?Q?f5Tjv8tDU/Aug/KuCgKIqCJ4SyE6D1PgZTJrD9DvOFVjEpvvqg9e3PhJxwt1?=
 =?us-ascii?Q?aHAPbJpli44ruDQvqP9kIfaEnxc5pr/yohqyTpB/y5FlTXXqolPZOSSEM154?=
 =?us-ascii?Q?9R49ntqSg3k4tjPQ7I9lmQKxLnVtYio9hpcsLvmDp9kMmGDAD086UthTy4TK?=
 =?us-ascii?Q?WrxvsaJcmMaPeB9jG3tYX31pJgi9xTxHOQsN2GLu3Fo7rvpGPuY/WrEa2jxi?=
 =?us-ascii?Q?Uc+LB1TZ3v7WhhhLQbjW9Fv90S5pfnJGNWvEowhV2KHHGMOr1B1nqiFzpc0U?=
 =?us-ascii?Q?YztaYlC0q3+DZ9b/T8OLBNPUxDlOBnQyEGdrb6n/iIPx/dGBSGI77XxPaExt?=
 =?us-ascii?Q?FLoYz3uDPGSsPOHcMmRaPufqSDHX7GcFYKFAdbGHuKYZ17AwdnV4Bh7reqUz?=
 =?us-ascii?Q?yHAv4/aaxG6VbgrNCnotZd6KWYSTbJYggrWOMgUs7p6QgwyxRz1tRlYPIlxu?=
 =?us-ascii?Q?2z8bxISbIBIErovAv5LaTiP1u0DPNuV3hVU49PeuJ2ZrqkQqAozirH/x8NjN?=
 =?us-ascii?Q?AktxiY0PwCnplCvUvdFFHH8mHCtPlSVafwIlH8h3Y9Ttd/Bd9Cijce3kqXiD?=
 =?us-ascii?Q?X8kJvlx37c0YgaedpoWn4a9oc9Vcp/CFB24sk/ainUZ+VdwUvIvXmgaTsCzR?=
 =?us-ascii?Q?TDRC9nM9jZXLmZBe1GThavr9BxAXarlDIIKzspsDudvyppQ4hBM7Z75xxhLZ?=
 =?us-ascii?Q?p6SEn/b6b3YkjLYPF8sPZLKfucAWvkrOY0di1fWmbc6KiJibyqnuGWs3vp6g?=
 =?us-ascii?Q?kpDbaI5eBS2dGb0Tkdy/y7G5P5+6rSexWVnNwLN6LvklIbqRCUgYfp9Ev2+B?=
 =?us-ascii?Q?7OCO0PyLM5ifTLxfv0zF3z4IJkJSmRwGvyBWM+jbn+nzYXOnfYSLWbzGUTvu?=
 =?us-ascii?Q?uhmByF8A/oYIXPFUWkhEsVy8vapaFQ0hxUgRjYqnqfZF1itX2LO65ZQrkPR/?=
 =?us-ascii?Q?6lMUiqnOnYNH6s7vufJpl1GTDIXWFTVR/0Cy+gnfy9mAI+v/dZWKdRO9+0jx?=
 =?us-ascii?Q?VPReYL+siad7xcsDezYgYzTluJYW+pLXd4eyZL6F9Bwkczm2ZzdrQwd+s6Jl?=
 =?us-ascii?Q?qBV4NkLLbrgYKC49zULBqXDA6y/fbgkfKvFS1Uy3nRqycH32SeCPDYxNUU9l?=
 =?us-ascii?Q?0zvpcKsN7Y1Rid40JAxbFMoUSu5DtkCItq9iLKOyKMsVqkwP973E5mpSLxdD?=
 =?us-ascii?Q?CoxnGfA2bJrWxSwfkI9Gub8rUnsOGO9AM+pe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 19:27:16.0791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e0182d-f662-4376-a0fb-08dde7321024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs in the
> console driver and simplifies enabling new UART emulators.
> 
> The framework is built under CONFIG_VUART_FRAMEWORK, which will be
> automatically enabled once the user enables any UART emulator.
> 
> Current implementation supports maximum of one vUART of each kind per domain.
> 
> Use new domain_has_vuart() in the console driver code to check whether to
> forward console input to the domain using vUART.
> 
> Enable console forwarding over vUART for hardware domains with a vUART. That
> enables console forwarding to dom0 on x86, since console can be forwarded only
> to Xen, dom0 and pvshim on x86 as of now.
> 
> Note: existing vUARTs are deliberately *not* hooked to the new framework to
> minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart" (i.e.
> minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.
> 
> No functional changes for non-x86 architectures.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - addressed feedback
> - Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-3-dmukhin@ford.com/
> ---
>  xen/arch/arm/xen.lds.S         |   1 +
>  xen/arch/ppc/xen.lds.S         |   1 +
>  xen/arch/riscv/xen.lds.S       |   1 +
>  xen/arch/x86/xen.lds.S         |   1 +
>  xen/common/Kconfig             |   2 +
>  xen/common/Makefile            |   1 +
>  xen/common/emul/Kconfig        |   6 ++
>  xen/common/emul/Makefile       |   1 +
>  xen/common/emul/vuart/Kconfig  |   6 ++
>  xen/common/emul/vuart/Makefile |   1 +
>  xen/common/emul/vuart/vuart.c  | 156 +++++++++++++++++++++++++++++++++
>  xen/common/keyhandler.c        |   3 +
>  xen/drivers/char/console.c     |   6 +-
>  xen/include/xen/serial.h       |   3 +
>  xen/include/xen/vuart.h        | 116 ++++++++++++++++++++++++
>  xen/include/xen/xen.lds.h      |  10 +++
>  16 files changed, 314 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/emul/Kconfig
>  create mode 100644 xen/common/emul/Makefile
>  create mode 100644 xen/common/emul/vuart/Kconfig
>  create mode 100644 xen/common/emul/vuart/Makefile
>  create mode 100644 xen/common/emul/vuart/vuart.c
>  create mode 100644 xen/include/xen/vuart.h
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index db17ff1efa98..cd05b18770f4 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -58,6 +58,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 1de0b77fc6b9..f9d4e5b0dcd8 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -52,6 +52,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index edcadff90bfe..59dcaa5fef9a 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -47,6 +47,7 @@ SECTIONS
>          *(.rodata)
>          *(.rodata.*)
>          VPCI_ARRAY
> +        VUART_ARRAY
>          *(.data.rel.ro)
>          *(.data.rel.ro.*)
>  
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 966e514f2034..d877b93a6964 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -132,6 +132,7 @@ SECTIONS
>         *(.rodata)
>         *(.rodata.*)
>         VPCI_ARRAY
> +       VUART_ARRAY
>         *(.data.rel.ro)
>         *(.data.rel.ro.*)
>  
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 76f9ce705f7a..78a32b69e2b2 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -676,4 +676,6 @@ config PM_STATS
>  	  Enable collection of performance management statistics to aid in
>  	  analyzing and tuning power/performance characteristics of the system
>  
> +source "common/emul/Kconfig"
> +
>  endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index c316957fcb36..c0734480ee4b 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
>  obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-y += emul/
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
> diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
> new file mode 100644
> index 000000000000..7c6764d1756b
> --- /dev/null
> +++ b/xen/common/emul/Kconfig
> @@ -0,0 +1,6 @@
> +menu "Domain Emulation Features"
> +	visible if EXPERT
> +
> +source "common/emul/vuart/Kconfig"
> +
> +endmenu
> diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
> new file mode 100644
> index 000000000000..ae0b575c3901
> --- /dev/null
> +++ b/xen/common/emul/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_VUART_FRAMEWORK) += vuart/
> diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
> new file mode 100644
> index 000000000000..ce1b976b7da7
> --- /dev/null
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -0,0 +1,6 @@
> +config VUART_FRAMEWORK
> +	bool
> +
> +menu "UART Emulation"
> +
> +endmenu
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
> new file mode 100644
> index 000000000000..97f792dc6641
> --- /dev/null
> +++ b/xen/common/emul/vuart/Makefile
> @@ -0,0 +1 @@
> +obj-y += vuart.o
> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
> new file mode 100644
> index 000000000000..7b277d00d5c7
> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -0,0 +1,156 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/err.h>
> +#include <xen/sched.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#define for_each_emulator(e) \
> +    for ( e = vuart_array_start; e < vuart_array_end; e++ )
> +
> +extern const struct vuart_emulator vuart_array_start[];
> +extern const struct vuart_emulator vuart_array_end[];
> +
> +static const struct vuart_emulator *
> +vuart_match_by_compatible(struct domain *d, const char *compat)
> +{
> +    const struct vuart_emulator *emulator;
> +
> +    if ( d->console.vuart )
> +        return NULL;
> +
> +    for_each_emulator(emulator)
> +        if ( emulator->compatible &&
> +             !strncmp(emulator->compatible, compat,
> +                      strlen(emulator->compatible)) )

strncmp will continue until the given count even if compat is shorter


> +            return emulator;
> +
> +    return NULL;
> +}
> +
> +static struct vuart *vuart_find_by_console_permission(const struct domain *d)
> +{
> +    struct vuart *vuart = d->console.vuart;
> +
> +    ASSERT(d->console.input_allowed);

This ASSERT looks suspicious as we haven't even checked that vuart!=NULL
yet. I would remove it


> +    if ( !vuart || !vuart->emulator || !vuart->emulator->put_rx ||
> +         !(vuart->flags & VUART_CONSOLE_INPUT))
> +        return NULL;
> +
> +    return vuart;
> +}
> +
> +struct vuart *vuart_find_by_io_range(struct domain *d, unsigned long addr,
> +                                     unsigned long size)
> +{
> +    struct vuart *vuart = d->console.vuart;
> +
> +    if ( !vuart || !vuart->info )
> +        return NULL;

You might as well call vuart_find_by_console_permission that has all the
checks already

> +
> +    if ( addr >= vuart->info->base_addr &&
> +         addr + size - 1 <= vuart->info->base_addr + vuart->info->size - 1 )
> +        return vuart;
> +
> +    return NULL;
> +}
> +
> +int vuart_init(struct domain *d, struct vuart_info *info)
> +{
> +    const struct vuart_emulator *emulator;
> +    struct vuart *vuart;
> +    int rc;
> +
> +    emulator = vuart_match_by_compatible(d, info->compatible);
> +    if ( !emulator )
> +        return -ENODEV;
> +
> +    vuart = xzalloc(typeof(*vuart));
> +    if ( !vuart )
> +        return -ENOMEM;
> +
> +    vuart->info = xvzalloc(typeof(*info));
> +    if ( !vuart->info )
> +    {
> +        rc = -ENOMEM;
> +        goto err_out;
> +    }
> +    memcpy(vuart->info, info, sizeof(*info));

one thing to note is that the fields (strings) compatible and name are
copied by address, I am not if it is OK but FYI


> +    vuart->vdev = emulator->alloc(d, vuart->info);
> +    if ( IS_ERR(vuart->vdev) )
> +    {
> +        rc = PTR_ERR(vuart->vdev);
> +        goto err_out;

this path leads to vuart->info not being freed


> +    }
> +
> +    vuart->emulator = emulator;
> +    vuart->owner = d;
> +    vuart->flags |= VUART_CONSOLE_INPUT;
> +
> +    d->console.input_allowed = true;
> +    d->console.vuart = vuart;
> +
> +    return 0;
> +
> + err_out:
> +    XVFREE(vuart);
> +    return rc;
> +}
> +
> +/*
> + * Release any resources taken by UART emulators.
> + *
> + * NB: no flags are cleared, since currently exit() is called only during
> + * domain destroy.
> + */
> +void vuart_deinit(struct domain *d)
> +{
> +    struct vuart *vuart = d->console.vuart;
> +
> +    if ( vuart )
> +    {
> +        vuart->emulator->free(vuart);

should we pass vuart or vuart->vdev here? The emulator state is supposed
to be vuart->vdev?

> +        XVFREE(vuart->info);
> +    }
> +
> +    XVFREE(d->console.vuart);
> +}
> +
> +void vuart_dump_state(const struct domain *d)
> +{
> +    struct vuart *vuart = d->console.vuart;
> +
> +    if ( vuart )
> +        vuart->emulator->dump_state(vuart);

also here vuart->vdev?


> +}
> +
> +/*
> + * Put character to the *first* suitable emulated UART's FIFO.
> + */
> +int vuart_put_rx(struct domain *d, char c)
> +{
> +    struct vuart *vuart = vuart_find_by_console_permission(d);
> +
> +    return vuart ? vuart->emulator->put_rx(vuart, c) : -ENODEV;

and here?


> +}
> +
> +bool domain_has_vuart(const struct domain *d)
> +{
> +    return vuart_find_by_console_permission(d);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index cb6df2823b00..156e64d9eb58 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -22,6 +22,7 @@
>  #include <xen/mm.h>
>  #include <xen/watchdog.h>
>  #include <xen/init.h>
> +#include <xen/vuart.h>
>  #include <asm/div64.h>
>  
>  static unsigned char keypress_key;
> @@ -352,6 +353,8 @@ static void cf_check dump_domains(unsigned char key)
>                             v->periodic_period / 1000000);
>              }
>          }
> +
> +        vuart_dump_state(d);
>      }
>  
>      for_each_domain ( d )
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9bd5b4825da6..d5164897a776 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/vuart.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> @@ -596,11 +597,12 @@ static void __serial_rx(char c)
>      if ( !d )
>          return;
>  
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
>      {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> +         * NB: must be the first check: hardware domain may have emulated UART.
>           */
>          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> @@ -611,6 +613,8 @@ static void __serial_rx(char c)
>           */
>          send_global_virq(VIRQ_CONSOLE);
>      }
> +    else if ( domain_has_vuart(d) )
> +        rc = vuart_put_rx(d, c);
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>      else
>          /* Deliver input to the emulated UART. */
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 8e1844555208..d7e81f098359 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -36,6 +36,9 @@ struct vuart_info {
>      unsigned long data_off;     /* Data register offset */
>      unsigned long status_off;   /* Status register offset */
>      unsigned long status;       /* Ready status value */
> +    unsigned int irq;           /* Interrupt */
> +    const char *compatible;     /* Compatible string */
> +    const char *name;           /* User-friendly name */
>  };
>  
>  struct serial_port {
> diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
> new file mode 100644
> index 000000000000..ca025b4179be
> --- /dev/null
> +++ b/xen/include/xen/vuart.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#ifndef XEN_VUART_H
> +#define XEN_VUART_H
> +
> +#include <xen/serial.h>
> +#include <public/xen.h>
> +
> +struct vuart_emulator;
> +
> +enum {
> +    VUART_CONSOLE_INPUT = 0U << 1, /** Physical console input forwarding. */

code style: single *
This flag is zero, is that intended?


> +};
> +
> +
> +/*
> + * FIXME: #ifdef is temporary to avoid clash with
> + *   arch/arm/include/asm/domain.h
> + */
> +#ifdef CONFIG_VUART_FRAMEWORK
> +struct vuart {
> +    const struct vuart_emulator *emulator;
> +    struct vuart_info *info;
> +    struct domain *owner;
> +    uint32_t flags;
> +    void *vdev;
> +};
> +#endif
> +
> +struct vuart_emulator {
> +    /* UART compatible string. Cannot be NULL or empty. */
> +    const char *compatible;
> +
> +    /*
> +     * Allocate emulated UART state (RX/TX FIFOs, locks, initialize registers,
> +     * hook I/O handlers, etc.)
> +     * Cannot be NULL.
> +     */
> +    void *(*alloc)(struct domain *d, const struct vuart_info *info);
> +
> +    /*
> +     * Release resources used to emulate UART state (flush RX/TX FIFOs, unhook
> +     * I/O handlers, etc.).
> +     * Cannot be NULL.
> +     */
> +    void (*free)(void *arg);
> +
> +    /*
> +     * Print emulated UART state, including registers, on the console.
> +     * Can be NULL.
> +     */
> +    void (*dump_state)(void *arg);
> +
> +    /*
> +     * Place character to the emulated RX FIFO.
> +     * Used to forward physical console input to the guest OS.
> +     * Can be NULL.
> +     */
> +    int (*put_rx)(void *arg, char c);
> +};
> +
> +#define VUART_REGISTER(name, x) \
> +    static const struct vuart_emulator name##_entry \
> +        __used_section(".data.rel.ro.vuart") = x
> +
> +struct vuart *vuart_find_by_io_range(struct domain *d,
> +                                     unsigned long base_addr,
> +                                     unsigned long size);
> +
> +int vuart_put_rx(struct domain *d, char c);
> +
> +#ifdef CONFIG_VUART_FRAMEWORK
> +
> +int vuart_init(struct domain *d, struct vuart_info *info);
> +void vuart_deinit(struct domain *d);
> +void vuart_dump_state(const struct domain *d);
> +bool domain_has_vuart(const struct domain *d);
> +
> +#else
> +
> +static inline int vuart_init(struct domain *d, struct vuart_info *info)
> +{
> +    return 0;
> +}
> +
> +static inline void vuart_deinit(struct domain *d)
> +{
> +}
> +
> +static inline void vuart_dump_state(const struct domain *d)
> +{
> +}
> +
> +static inline bool domain_has_vuart(const struct domain *d)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_VUART_FRAMEWORK */
> +
> +#endif /* XEN_VUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index b126dfe88792..2d65f32ddad3 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -194,4 +194,14 @@
>  #define VPCI_ARRAY
>  #endif
>  
> +#ifdef CONFIG_VUART_FRAMEWORK
> +#define VUART_ARRAY              \
> +       . = ALIGN(POINTER_ALIGN); \
> +       vuart_array_start = .;    \
> +       *(.data.rel.ro.vuart)     \
> +       vuart_array_end = .;
> +#else
> +#define VUART_ARRAY
> +#endif
> +
>  #endif /* __XEN_LDS_H__ */
> -- 
> 2.51.0
> 

