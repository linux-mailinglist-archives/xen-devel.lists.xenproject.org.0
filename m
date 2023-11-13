Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A37E9BAC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631549.984961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Vas-00024M-AY; Mon, 13 Nov 2023 11:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631549.984961; Mon, 13 Nov 2023 11:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Vas-00022U-7n; Mon, 13 Nov 2023 11:59:06 +0000
Received: by outflank-mailman (input) for mailman id 631549;
 Mon, 13 Nov 2023 11:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUCv=G2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r2Vap-00022O-R0
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:59:04 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e83::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c9161c-821c-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 12:59:02 +0100 (CET)
Received: from MN2PR15CA0011.namprd15.prod.outlook.com (2603:10b6:208:1b4::24)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 11:58:57 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::42) by MN2PR15CA0011.outlook.office365.com
 (2603:10b6:208:1b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28 via Frontend
 Transport; Mon, 13 Nov 2023 11:58:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 11:58:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 05:58:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 05:58:56 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 05:58:55 -0600
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
X-Inumbo-ID: 07c9161c-821c-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYk8yfOjdlssEUXmDAoUERcmGFWdYl33UE4EPwfymPvdW1UUyuaG0yuPMWjtVJ80LJSOOPSvazI/FcMHivQ+dmz+NvAqg+jDJz+6LNy3mDHiFXCxf91hR8dw7ey2GnqTaGWjHQv0BX5qLT4UKzl+5t98pp5+5bl968cLovWuRzrlHzRdNEOReBHWgdv3ZtoizDs9g8eO5iEFpMNoiKVWJNBSc70aczBE9t3o/sShsFNMPgYolYHMILa7oVtlAtirFMMUIw6JhmelSmjE/p8HqzigUXJnCOFdhgLKSCoLufNmvQedtXGU/Al0Rj6pEuQsL4HdMWLATa30922oZcUHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFcdHmvglp8nFlt2nI7NLPot0eHOX51TIHzSDCXJ/90=;
 b=ZQ9aP4WX8Ef/YcFewkmTJdfKlzHoADG8q0/qwEfMvgUnahyHowdovCixfqsZ7H99+zaA0plKXXL2J4myjMnXdKvymXgFjVLck/UBDqNxtlArAmg4GG795fQH1jmJkABz9yabkwtbX+0S5/s6T58iJ8m4TQT20h4kXLShgzsTtvLofXV9nuRWrH5oZhlBoeDiIalcv5XOxtxFwVNKXCv8pvuvuXcHky/Zd4CdG76Q97PYJq1ikN2iBpAB7qetWb+hs78z3PnD18BgGb7JV03/mdoXZiyjAZhPDGOCqPMW0pg0fYZcdsxFWSRyLXK96DaRtENS3WtsRqD4qoXJjOVHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFcdHmvglp8nFlt2nI7NLPot0eHOX51TIHzSDCXJ/90=;
 b=eDXkwNA4KHLSuNpOiWz0dOmJtU4e9ZocKeKcmkSio4AmHQ3avJeZ8SQmtFVjEHLulrRs0uAwdIncoba7ZsAGXpZnTZntZAwrm0T0D3jUq+L1WhKIuUrlNRHB/+ye9PSJ3shnMY6U0zLW2jIjsUB5/fHbKKw4TXvh1i+Bz07OMQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a4431da-7e48-4b71-9f62-154edcc5968c@amd.com>
Date: Mon, 13 Nov 2023 12:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231113090841.595428-1-luca.fancellu@arm.com>
 <20231113090841.595428-4-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231113090841.595428-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: a5535086-a4c7-42a0-c56c-08dbe43fea8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8eJRmxBiHVcZdFt0ak8tWLOKG3hOTyLcxP035czQUOlKQdYEMjfJzdTEtkvMwDXkd1er+1ljnacDraI+4RGFTWGS5eqOSW4bAG9KAEI3Vz9e0Hw2nGZhLt+PFyzKfKGm3TlCNJjIPmIAHaSM5HY9QnA2u/T+bKKxisck0bHRyeN7XWgplu4/JGPoh72/oXlETfNyI0KKepX2+90SpqTbCfZxxhdbfWCPIfPQPjr8HsupERilW0HE55BKk6RIlRdCZJefbDIez3oSwtyXXdAY0za3KJ3pYQSPyvcBSRCJTwCPZrw3o7w0vCI2QfV9QU7Bt7zEYxqJY2D+qVP044HD7b5hI0PvjlFxdn5Ie3T6CJI979qIdPpBEnRSNuC0VUYFUOKGZsrOqakNvR0ckdkC7z6iVRX6fVYPE2YGfXRJjOAWd1HQKHFk5To8pBrR2V20BxdR1/7MQFgs2CNPBgZkP4ZR63yfaWtL/JKKZikFeYA9IOVMEb4H6c29uk6YJIrpEeN1q3WKjkjDUoTsrqIIOjhCs9ZQQojs5LfljVgh741M5veBFlCgueu3TlVWgKPpgJ9ZMNYc2f3fmA1Y5Cw7WcPg6bGARhipbHs0dJhyotwt1ATX5QR7IcLJPQrT0Hg+EcmbVEtrvE9Sh+itLc+k2WO1lfNWmwtjWSFx5bdyfiKJB3agI7xczCMjGGbEvwMpCVespUUPPKxsux0nuUpR6rnP+Ky6dJzHsmzNs3I39f3+fEAL5o2QnK1sfloFaEXOLwzlK+JeBKKHESzsn9gpgrfYqc5jTh2Cl6+AnVzeNvyjmcRtLv4D4Xo2g2dBNNy31xfBSgXQ++t4BEJmgg/kjXd+ThorYdLDN0oTEQPEagiK9PPj3/KoF+XNeqWjM+t
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(110136005)(41300700001)(40480700001)(31686004)(2906002)(40460700003)(83380400001)(5660300002)(8676002)(36756003)(8936002)(44832011)(4326008)(316002)(70206006)(70586007)(86362001)(31696002)(53546011)(478600001)(54906003)(16576012)(26005)(2616005)(81166007)(336012)(426003)(82740400003)(356005)(36860700001)(47076005)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 11:58:57.1442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5535086-a4c7-42a0-c56c-08dbe43fea8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356

Hi Luca,

Apart from pending question on static event channels code movement, a few NITs.

On 13/11/2023 10:08, Luca Fancellu wrote:
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
> ---
> Changes from v3:
>  - remove header in dom0less-build.h (Michal)
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
> index 000000000000..022ae61ead7c
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/dom0less-build.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_DOM0LESS_BUILD_H_
The majority of header files have a guard starting with __ASM so I would stick to the scheme.

> +#define __ARM_DOM0LESS_BUILD_H_
> +
> +#include <asm/kernel.h>
> +
> +void create_domUs(void);
> +bool is_dom0less_mode(void);
> +
> +#endif  /* __ARM_DOM0LESS_BUILD_H_ */
1 space between #endif and comment

> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:b
What does 'b' means here? Only 2 files have that.

The comments apply to other files as well.

Apart from that, the movement LGTM.

~Michal


