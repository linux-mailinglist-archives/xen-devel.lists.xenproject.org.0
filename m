Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F287F0CE5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 08:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636444.991948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4ynp-00020l-1x; Mon, 20 Nov 2023 07:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636444.991948; Mon, 20 Nov 2023 07:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4yno-0001yk-VD; Mon, 20 Nov 2023 07:34:40 +0000
Received: by outflank-mailman (input) for mailman id 636444;
 Mon, 20 Nov 2023 07:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r4ynm-0001ye-Vh
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 07:34:38 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c8f472-8777-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 08:34:37 +0100 (CET)
Received: from DS7PR03CA0325.namprd03.prod.outlook.com (2603:10b6:8:2b::34) by
 DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Mon, 20 Nov 2023 07:34:34 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::c0) by DS7PR03CA0325.outlook.office365.com
 (2603:10b6:8:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 07:34:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 07:34:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 01:34:26 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 01:34:25 -0600
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
X-Inumbo-ID: 41c8f472-8777-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY7t+mFjBI3o+XVNLecJsfzkHa4uHK7Qhd/XexeE9zrpvMO/3MvFXp9l0ljCENIO0HX7Bo6GtFSwfyFIee8GBzK/8s+3IlLVd7FE9OqAnEOXK5+tPCrFfcGj3K3m6VfDIQKofbL1O9JT1w28HL21J3FxmEzlCTtvpu1dCjqUQXEj8ieh8VNqZ7SztCL7zu15Bt/8aByItu+DYxt4hvcY3myLo4WvD66NVlUM1sndRi/bWPQlGrVLu0q8ZhEZq2+6uRvAI8Ix4Ds3ihBsxH71R9pckuh9LGHkDF0h6LwvykmuWT+4TdjEzxlDRis929Oqon80VK75eTEp98KLcT9OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxNXROpp6Yr6TpmKCw02pnJ6EfJVhlWKWgezcYGVpGo=;
 b=dk5zYf8iPSHds84AhgOd826iEQp2ZLAWhFa7uVULPjX0O4sP0lWSA4yTmEHN9HUmpcE1LrtjrQURamyZgbzHE9uE/IMiUEwJvIQ890N/CQuCca5x1csNCX3uapT0yGX10nCjouQU+BBF4L0N8m+VHA4mBq/I2AwqeipmmFi3dMWmrMNSABUYiI+nU/6wIUhV7fNpKL+AFa11wHSu/NZB30jTqWstu0QTJF+S3ycp/sEQAMDoy90R0jmSj7HuNk4qeJOp8sSJDlXhbsUdXM3SjA9FOPAkY5QO0kGBgwaszBFVzAEOEjky3gqkypJNgNC4pzEQZGdhImoGhXFBbkHlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxNXROpp6Yr6TpmKCw02pnJ6EfJVhlWKWgezcYGVpGo=;
 b=C6fl7l8YLsXLJRTjUcSNMaF7xzZHBpxV/Pbhst4v0iEVCHUf1zUODWcYhzT4mfXW4yyabOmLzmG07b3oytNpNp9xKxDulfVLp71Igu7SyNYc6FFfDJENJZyS78y8CxQLS9hU6WgefufFSmR5V87hrw5kmJHJjFy78ZJe5zJ8zLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
Date: Mon, 20 Nov 2023 08:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-4-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231114090356.875180-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db7ab7d-bbdf-4f7f-0315-08dbe99b245a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OL+KUMC5lWRuA0TIMUnBT0SIuvVobMvOz7Yk/nZp67M7tbilhOh0brv5xwO4YPRDdi7RL0iCbdtcHJwDHPau6iHH32hMgj/e+HvBIwhyrY1cjNnOtnQz9yAE4QZ71z8l4ufJnB2hIl9xfMoeIWVtIeQtrhF7pXk2KsPkKcT/ZeJX5lXNWh8ek8As1D0TyEEQ1qk0o8d1wL7B7RL5tZbc0SN6pfX3EmnBRQbnIgKDEcziLh+HKlU/aYjCKDZSRj6EThzBmP+ztR78UuhK+x9bx7DYV/VBA3EU46wLEFTz/LzqHyg0lgInbXCn68vTbAMDnRNKJZvmvGn9/9ZnJRfSARqo1gx5O9CWa97NSH4UWUNA4+dg27oPL2kzmVAQHwKDUYG1FT7ul7kAfMdaGYbsiD7Gl/i5TCFISO9jhZBlV6gtfWOwq8FPrXVbZOP9A6fFjcXCDqGWcRUHoWMtbDE0674hhqL6bhrXOaqX+YYuHEiNSMRUiqTVPsutqYPz+OvWiTnfh4WIpaTEq3dlTOvNk5j32j09Xep0+vWK1lY0EzKWLx+OpOD+41rV7votFGjYNoyR1fixg/6XTxgdR2rfUqIoaziUYWzxmD07oXRAtiUwRm6KLxlndihqhySWx+0dfJFlPhFmt55krmQYpyd3T8Uog09bCb+J1I70wsuY35TSj33S84jEzoTDkE3BCNrLzz3115+Bfho8VIoW7y8AUgEhvcKuQComUkTc3TLwkig6VXVkdp7etECBgP6Jmx2GYZaHPIc/PqCIwhsanJ7HhbisWK5OC8iUEql9Gscbxn+F26LwDKzegoUahaCHp42kXYrCdDqG4hYoFF96v+A7FDlor3rK4RdNlRkYurZ/XkaHw94ENvvhN34uCLMxJxvnIxq+ajNvdqPqE83jKSkgG2NqFeVgH+FnRvafS+0EZxE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(36860700001)(40480700001)(31686004)(478600001)(316002)(16576012)(82740400003)(8936002)(8676002)(4326008)(26005)(2616005)(426003)(336012)(110136005)(70586007)(70206006)(54906003)(53546011)(356005)(81166007)(83380400001)(47076005)(44832011)(5660300002)(2906002)(31696002)(40460700003)(41300700001)(86362001)(36756003)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 07:34:34.1357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db7ab7d-bbdf-4f7f-0315-08dbe99b245a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985

Hi Luca,

On 14/11/2023 10:03, Luca Fancellu wrote:
> 
> 
> Currently the dom0less feature code is mostly inside domain_build.c
> and setup.c, it is a feature that may not be useful to everyone so
> put the code in a different compilation module in order to make it
> easier to disable the feature in the future.
> 
> Move gic_interrupt_t in domain_build.h to use it with the function
> declaration, move its comment above the declaration.
> 
> The following functions are now visible externally from domain_build
> because they are used also from the dom0less-build module:
>  - get_allocation_size
>  - set_interrupt
>  - domain_fdt_begin_node
>  - make_memory_node
>  - make_resv_memory_node
>  - make_hypervisor_node
>  - make_psci_node
>  - make_cpus_node
>  - make_timer_node
>  - handle_device_interrupts
>  - construct_domain
>  - process_shm
>  - allocate_bank_memory
> 
> The functions allocate_static_memory and assign_static_memory_11
> are now externally visible, so put their declarations into
> domain_build.h and move the #else and stub definition in the header
> as well.
> 
> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
> externally visible.
> 
> The function allocate_bank_memory is used only by dom0less code
> at the moment, but it's been decided to leave it in domain_build.c
> in case that in the future the dom0 code can use it.
> 
> Where spotted, fix code style issues.
> 
> No functional change is intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one remark...

> ---
> Changes from v4:
>  - fixed name in inclusion macro __ASM_* instead of __ARM_*, fixed
>    emacs local variable 'end:', style fix (Michal)
> Changes from v3:
>  - remove header in dom0less-build.c (Michal)
> Changes from v2:
>  - move allocate_bank_memory back in domain_build.c, remove header
>    from dom0less-build.c.
> ---
>  xen/arch/arm/Makefile                     |    1 +
>  xen/arch/arm/dom0less-build.c             | 1018 +++++++++++++++++
>  xen/arch/arm/domain_build.c               | 1265 +++------------------
>  xen/arch/arm/include/asm/dom0less-build.h |   20 +
>  xen/arch/arm/include/asm/domain_build.h   |   60 +
>  xen/arch/arm/include/asm/setup.h          |    1 -
>  xen/arch/arm/setup.c                      |   33 +-
>  7 files changed, 1240 insertions(+), 1158 deletions(-)
>  create mode 100644 xen/arch/arm/dom0less-build.c
>  create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
> 

[...]
> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
> new file mode 100644
> index 000000000000..81446cbd8bf3
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/dom0less-build.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_DOM0LESS_BUILD_H_
> +#define __ASM_DOM0LESS_BUILD_H_
> +
> +#include <asm/kernel.h>
No need for this include, especially if you are removing it in the subsequent patch.
This could be done on commit (+ there is a conflcit between your series and Henry's mmu/mpu split)

~Michal

