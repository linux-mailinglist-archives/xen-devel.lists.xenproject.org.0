Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB84C4C2B30
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 12:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278191.475352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCfU-0000uf-Ae; Thu, 24 Feb 2022 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278191.475352; Thu, 24 Feb 2022 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCfU-0000sk-6Q; Thu, 24 Feb 2022 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 278191;
 Thu, 24 Feb 2022 11:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdJg=TH=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nNCfS-0000se-GI
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 11:52:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20602.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f82212-9568-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 12:52:14 +0100 (CET)
Received: from DM6PR21CA0019.namprd21.prod.outlook.com (2603:10b6:5:174::29)
 by MWHPR02MB3263.namprd02.prod.outlook.com (2603:10b6:301:67::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 11:52:10 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::d5) by DM6PR21CA0019.outlook.office365.com
 (2603:10b6:5:174::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Thu, 24 Feb 2022 11:52:10 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 11:52:09 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 24 Feb 2022 11:52:08 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 24 Feb 2022 11:52:08 +0000
Received: from [10.71.117.160] (port=52939)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nNCfI-0004Q2-1V; Thu, 24 Feb 2022 11:52:08 +0000
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
X-Inumbo-ID: 33f82212-9568-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abQ1ypetRZK3kvIjehD/4iqKAoCEsH6TOv+kzm+bqFh/TTKKqHbLVqAUB/On5O43qnW3lrwnB+FHMhfurOah6UplnW0Z+jsr1KX2U68f+HJZaR7SqZB82IlI2UwxveGQwbW8Q95vG/Hb1T1qTGErAlE+CfCHBFNBhVB1Mekci1lishNMAmIZQrTeZ1lfME6a5SyXKMfEV8/wMhnsIq7ZGJbGGUwyafEsEgIRPip4RdHs0sXwk0+QvPwd8nZ1y6S57WPrVjZDRQYNcULMZbifKwyn37fegxF2F10HJLZfShxLTrk616z7BbXLJRu6W+aU323y/UhOS7BnHwG4ykC4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVrjslPv3gt8iFlmxkUL7Svwo3yvaf6VhUzZ7WVUCsQ=;
 b=PyEmFDouJvCGz3hu/391ulGmT+zoO+Ics0dOJl+5HPPXUrVOBxD4yusjcH8xuPlxr15VEQcvBLTROLY6skrUj2DeQEAaro0Q5vEx12rBTxUV6dJCFMqA3q/xwr1YmundQnMk7tFtyyzPT5k2td0NR6mY4CQ+t0iCk6Ix1AWdPZxrdh9vBfAJ70xY3H43FMdeMAK7Cwq4xQImHKWjaP4ic7P6Ld6SPQYuwsEIm4KixSYyjfuxVUKL5OagVlsMSgkCwxJMMn30M7PhfRYh0usZydeGvaRym7gDjOtjfNJmPtoEdEBegi1Y1FJKO1owH+Ml9MaqAFXNuGdsSm9CItinDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVrjslPv3gt8iFlmxkUL7Svwo3yvaf6VhUzZ7WVUCsQ=;
 b=Bnp1COZBEa2Fj08kZpRoA0OiDOFFZVTPlywVkhXJqRmILnK8h3Ys5D6/lOXFyLOi7j+LvlNDn67WCy1//nCqAU+EhZ6WlOdnV+vthcM0XaCWw6thBt6kvhHI3Lm5428oQAtrVeZRlR6lZbBqjNho1tLcl+FD764LJ1aChxAEywM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <a0c4c458-152e-750b-9e26-63a6d544e836@xilinx.com>
Date: Thu, 24 Feb 2022 11:52:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Wei Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75101160-a114-48ee-824b-08d9f78c16ca
X-MS-TrafficTypeDiagnostic: MWHPR02MB3263:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB326398A494E171648CD86CDEB23D9@MWHPR02MB3263.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VxHYoTLIP/gzkkt/Y59lVNf5lOQg5cEqpCFbQ/OMoYKMMKab3uwgqDdsrHOwXHm0M5o1OrxstrJwBR+2u+Tlxi9256D3bXyj4oxokqYIGeCpBJhIZZcOz5E8TRcemgmcWnuLnVD4PZ6T54GAsg0UeHW0i4RaccU1Q9wTuauiBhRgr8Snzyw2TA/TJWT/8gDsbVAZ2qrJk769f4ShCQfgw6xMsMc5SZ8uwyTtxFfTge8ZZ6EJOXg+GgTOjra/dPyK5CsyWMxYQk+wqg657tKU+VnyZVNYVhMy88yZnRkBOJN/5SS/KDn2DXKI1K4C4b7Fpx6NATYGhUy+uKp6jDDNpulY3k2x9gieYxZ1aEVCbEsdjCY8l1G9Rd0JYReDqaT1iNea/xulAGFE+DL7mlclVZWIlzX9+LJg60ZJRMOdI4DIsqHqr3RjtqQutQxALC8peJQkVBbXqdW5ljKb4ZmtgPPvEyIS5WQkkV5WS+JBz+5aNn0PI/dbLLc04xL1GynYLXmRUbXVQyZUyr0ZAsX3f6AFBuTwppTy4QSk9gQcExzE8SFJL5CRDE75CjBkJG5WW+LTpcA9R6zOGWLuWaFFLxt/fURpaip1D9cSNeaaEVCYaR3PPrgxoPXEWpcy3t55YKDMCaaP9ykW9bpLttZ3HJ4ogiKcT9/mPe06Lmjlb6nzTslxxRzdHNkT89Q8dzcsi0M8F7itOvNmj7ATMk3qbH4rNNUNoShftQteQ/zeVBCWLYUSPva0b5Mf6MEwvupS6MMqwVRa6ZnblYoExHvWbn3oLJFX744O9LNgZtqf7ynT1hm4wV8d8YbBS10FggCu9O3OWRt6//lAD7vk7ruWTGcWpJYSOdbLWom/XQ7FqnY=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(26005)(186003)(53546011)(31696002)(82310400004)(336012)(30864003)(83380400001)(70586007)(8936002)(426003)(5660300002)(70206006)(2616005)(9786002)(4326008)(40460700003)(47076005)(31686004)(36860700001)(36756003)(508600001)(316002)(7636003)(356005)(110136005)(54906003)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 11:52:09.7301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75101160-a114-48ee-824b-08d9f78c16ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3263

Hi Wei,

This is a nice writeup. I have a few initial queries.

On 24/02/2022 06:01, Wei Chen wrote:
> # Proposal for Porting Xen to Armv8-R64
>
> This proposal will introduce the PoC work of porting Xen to Armv8-R64,
> which includes:
> - The changes of current Xen capability, like Xen build system, memory
>    management, domain management, vCPU context switch.
> - The expanded Xen capability, like static-allocation and direct-map.
>
> ***Notes:***
> 1. ***This proposal only covers the work of porting Xen to Armv8-R64***
>     ***single CPU. Xen SMP support on Armv8-R64 relates to Armv8-R***
>     ***Trusted-Frimware (TF-R). This is an external dependency,***
>     ***so we think the discussion of Xen SMP support on Armv8-R64***
>     ***should be started when single-CPU support is complete.***
> 2. ***This proposal will not touch xen-tools. In current stage,***
>     ***Xen on Armv8-R64 only support dom0less, all guests should***
>     ***be booted from device tree.***
>
> ## 1. Essential Background
>
> ### 1.1. Armv8-R64 Profile
> The Armv-R architecture profile was designed to support use cases that
> have a high sensitivity to deterministic execution. (e.g. Fuel Injection,
> Brake control, Drive trains, Motor control etc)
>
> Arm announced Armv8-R in 2013, it is the latest generation Arm architecture
> targeted at the Real-time profile. It introduces virtualization at the highest
> security level while retaining the Protected Memory System Architecture (PMSA)
> based on a Memory Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
> which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.

Is there some good document explaining the difference between MPU and 
MMU ? And when do we need one vs other.

>
> - The latest Armv8-R64 document can be found here:
>    [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R AArch64 architecture profile](https://developer.arm.com/documentation/ddi0600/latest/).
>
> - Armv-R Architecture progression:
>    Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
>    The following figure is a simple comparison of "R" processors based on
>    different Armv-R Architectures.
>    ![image](https://drive.google.com/uc?export=view&id=1nE5RAXaX8zY2KPZ8imBpbvIr2eqBguEB)
>
> - The Armv8-R architecture evolved additional features on top of Armv7-R:
>      - An exception model that is compatible with the Armv8-A model
>      - Virtualization with support for guest operating systems
>          - PMSA virtualization using MPUs In EL2.
> - The new features of Armv8-R64 architecture
>      - Adds support for the 64-bit A64 instruction set, previously Armv8-R
>        only supported A32.
>      - Supports up to 48-bit physical addressing, previously up to 32-bit
>        addressing was supported.
>      - Optional Arm Neon technology and Advanced SIMD
>      - Supports three Exception Levels (ELs)
>          - Secure EL2 - The Highest Privilege, MPU only, for firmware, hypervisor
>          - Secure EL1 - RichOS (MMU) or RTOS (MPU)
>          - Secure EL0 - Application Workloads
>      - Optionally supports Virtual Memory System Architecture at S-EL1/S-EL0.
>        This means it's possible to run rich OS kernels - like Linux - either
>        bare-metal or as a guest.
> - Differences with the Armv8-A AArch64 architecture
>      - Supports only a single Security state - Secure. There is not Non-Secure
>        execution state supported.

If so, then I guess there is no Trustzone kind of protection available. 
I mean where application is normal world can request for data to be 
processed in secure world (by switching the NS bit on AXI).

Also, does Armv8-R support Trustzone controller 400 which helps to 
partition memory into different protected enclaves based on NSAID ?

(Apologies if my queries are irrelevant, I am asking this purely out of 
my own interest :) )

>      - EL3 is not supported, EL2 is mandatory. This means secure EL2 is the
>        highest EL.
>      - Supports the A64 ISA instruction
>          - With a small set of well-defined differences
>      - Provides a PMSA (Protected Memory System Architecture) based
>        virtualization model.
>          - As opposed to Armv8-A AArch64's VMSA based Virtualization
>          - Can support address bits up to 52 if FEAT_LPA is enabled,
>            otherwise 48 bits.
>          - Determines the access permissions and memory attributes of
>            the target PA.
>          - Can implement PMSAv8-64 at EL1 and EL2
>              - Address translation flat-maps the VA to the PA for EL2 Stage 1.
>              - Address translation flat-maps the VA to the PA for EL1 Stage 1.
>              - Address translation flat-maps the IPA to the PA for EL1 Stage 2.
>      - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.
>
> ### 1.2. Xen Challenges with PMSA Virtualization
> Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to run
> with an MPU and host multiple guest OSes.
>
> - No MMU at EL2:
>      - No EL2 Stage 1 address translation
>          - Xen provides fixed ARM64 virtual memory layout as basis of EL2
>            stage 1 address translation, which is not applicable on MPU system,
>            where there is no virtual addressing. As a result, any operation
>            involving transition from PA to VA, like ioremap, needs modification
>            on MPU system.
>      - Xen's run-time addresses are the same as the link time addresses.
>          - Enable PIC (position-independent code) on a real-time target
>            processor probably very rare.
>      - Xen will need to use the EL2 MPU memory region descriptors to manage
>        access permissions and attributes for accesses made by VMs at EL1/0.
>          - Xen currently relies on MMU EL1 stage 2 table to manage these
>            accesses.
> - No MMU Stage 2 translation at EL1:
>      - A guest doesn't have an independent guest physical address space
>      - A guest can not reuse the current Intermediate Physical Address
>        memory layout
>      - A guest uses physical addresses to access memory and devices
>      - The MPU at EL2 manages EL1 stage 2 access permissions and attributes
> - There are a limited number of MPU protection regions at both EL2 and EL1:
>      - Architecturally, the maximum number of protection regions is 256,
>        typical implementations have 32.
>      - By contrast, Xen does not need to consider the number of page table
>        entries in theory when using MMU.
> - The MPU protection regions at EL2 need to be shared between the hypervisor
>    and the guest stage 2.
>      - Requires careful consideration - may impact feature 'fullness' of both
>        the hypervisor and the guest
>      - By contrast, when using MMU, Xen has standalone P2M table for guest
>        stage 2 accesses.
So, can it support running both RTOS and Linux as guests ? My 
understanding is no as we can't enable MPU (for RTOS) and MMU (for 
Linux) at the same time. There needs to be two separate images of Xen. 
Please confirm.
>
> ## 2. Proposed changes of Xen
> ### **2.1. Changes of build system:**
>
> - ***Introduce new Kconfig options for Armv8-R64***:
>    Unlike Armv8-A, because lack of MMU support on Armv8-R64,
But Armv8-R64 supports VMSA (Refer
ARM DDI 0600A.d ID120821, B1.2.2,
Virtual Memory System Architecture, VMSAv8-64). So it should support 
MMU, isn't it ?

- Ayan
> we may not
>    expect one Xen binary to run on all machines. Xen images are not common
>    across Armv8-R64 platforms. Xen must be re-built for different Armv8-R64
>    platforms. Because these platforms may have different memory layout and
>    link address.
>      - `ARM64_V8R`:
>        This option enables Armv8-R profile for Arm64. Enabling this option
>        results in selecting MPU. This Kconfig option is used to gate some
>        Armv8-R64 specific code except MPU code, like some code for Armv8-R64
>        only system ID registers access.
>
>      - `ARM_MPU`
>        This option enables MPU on ARMv8-R architecture. Enabling this option
>        results in disabling MMU. This Kconfig option is used to gate some
>        ARM_MPU specific code. Once when this Kconfig option has been enabled,
>        the MMU relate code will not be built for Armv8-R64. The reason why
>        not depends on runtime detection to select MMU or MPU is that, we don't
>        think we can use one image for both Armv8-R64 and Armv8-A64. Another
>        reason that we separate MPU and V8R in provision to allow to support MPU
>        on 32bit Arm one day.
>
>      - `XEN_START_ADDRESS`
>        This option allows to set the custom address at which Xen will be
>        linked. This address must be aligned to a page size. Xen's run-time
>        addresses are the same as the link time addresses. Different platforms
>        may have differnt memory layout. This Kconfig option provides users
>        the ability to select proper link addresses for their boards.
>        ***Notes: Fixed link address means the Xen binary could not be***
>        ***relocated by EFI loader. So in current stage, Xen could not***
>        ***be launched as an EFI application on Armv8-R64.***
>
>      - `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
>        `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
>        These Kconfig options allow to set memory regions for Xen code, data
>        and device memory. Before parsing memory information from device tree,
>        Xen will use the values that stored in these options to setup boot-time
>        MPU configuration. Why we need a boot-time MPU configuration?
>        1. More deterministic: Arm MPU supports background regions,
>           if we don't configure the MPU regions and don't enable MPU.
>           We can enable MPU background regions. But that means all RAM
>           is RWX. Random values in RAM or maliciously embedded data can
>           be exploited. Using these Kconfig options allow users to have
>           a deterministic RAM area to execute code.
>        2. More compatible: On some Armv8-R64 platforms, if the MPU is
>           disabled, the `dc zva` instruction will make the system halt.
>           And this instruction will be embedded in some built-in functions,
>           like `memory set`. If we use `-ddont_use_dc` to rebuild GCC,
>           the built-in functions will not contain `dc zva`. However, it is
>           obviously unlikely that we will be able to recompile all GCC
>           for ARMv8-R64.
>        3. One optional idea:
>            We can map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or
>            `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_end` for
>            MPU normal memory. It's enough to support Xen run in boot time.
>
> - ***Define new system registers for compilers***:
>    Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
>    specific system registers. As Armv8-R64 only have secure state, so
>    at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
>    first GCC version that supports Armv8.4 is GCC 8.1. In addition to
>    these, PMSA of Armv8-R64 introduced lots of MPU related system registers:
>    `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
>    `MPUIR_ELx`. But the first GCC version to support these system registers
>    is GCC 11. So we have two ways to make compilers to work properly with
>    these system registers.
>    1. Bump GCC version to GCC 11.
>       The pros of this method is that, we don't need to encode these
>       system registers in macros by ourselves. But the cons are that,
>       we have to update Makefiles to support GCC 11 for Armv8-R64.
>       1.1. Check the GCC version 11 for Armv8-R64.
>       1.2. Add march=armv8r to CFLAGS for Armv8-R64.
>       1.3. Solve the confliction of march=armv8r and mcpu=generic
>      These changes will affect common Makefiles, not only Arm Makefiles.
>      And GCC 11 is new, lots of toolchains and Distro haven't supported it.
>
>    2. Encode new system registers in macros ***(preferred)***
>          ```
>          /* Virtualization Secure Translation Control Register */
>          #define VSTCR_EL2  S3_4_C2_C6_2
>          /* Virtualization System Control Register */
>          #define VSCTLR_EL2 S3_4_C2_C0_0
>          /* EL1 MPU Protection Region Base Address Register encode */
>          #define PRBAR_EL1  S3_0_C6_C8_0
>          ...
>          /* EL2 MPU Protection Region Base Address Register encode */
>          #define PRBAR_EL2  S3_4_C6_C8_0
>          ...
>          ```
>       If we encode all above system registers, we don't need to bump GCC
>       version. And the common CFLAGS Xen is using still can be applied to
>       Armv8-R64. We don't need to modify Makefiles to add specific CFLAGS.
>
> ### **2.2. Changes of the initialization process**
> In general, we still expect Armv8-R64 and Armv8-A64 to have a consistent
> initialization process. In addition to some architecture differences, there
> is no more than reusable code that we will distinguish through CONFIG_ARM_MPU
> or CONFIG_ARM64_V8R. We want most of the initialization code to be reusable
> between Armv8-R64 and Armv8-A64.
>
> - We will reuse the original head.s and setup.c of Arm. But replace the
>    MMU and page table operations in these files with configuration operations
>    for MPU and MPU regions.
>
> - We provide a boot-time MPU configuration. This MPU configuration will
>    support Xen to finish its initialization. And this boot-time MPU
>    configuration will record the memory regions that will be parsed from
>    device tree.
>
>    In the end of Xen initialization, we will use a runtime MPU configuration
>    to replace boot-time MPU configuration. The runtime MPU configuration will
>    merge and reorder memory regions to save more MPU regions for guests.
>    ![img](https://drive.google.com/uc?export=view&id=1wTFyK2XfU3lTlH1PqRDoacQVTwUtWIGU)
>
> - Defer system unpausing domain.
>    When Xen initialization is about to end, Xen unpause guests created
>    during initialization. But this will cause some issues. The unpause
>    action occurs before free_init_memory, however the runtime MPU configuration
>    is built after free_init_memory.
>
>    So if the unpaused guests start executing the context switch at this
>    point, then its MPU context will base on the boot-time MPU configuration.
>    Probably it will be inconsistent with runtime MPU configuration, this
>    will cause unexpected problems (This may not happen in a single core
>    system, but on SMP systems, this problem is foreseeable, so we hope to
>    solve it at the beginning).
>
> ### **2.3. Changes to reduce memory fragmentation**
>
> In general, memory in Xen system can be classified to 4 classes:
> `image sections`, `heap sections`, `guest RAM`, `boot modules (guest Kernel,
> initrd and dtb)`
>
> Currently, Xen doesn't have any restriction for users how to allocate
> memory for different classes. That means users can place boot modules
> anywhere, can reserve Xen heap memory anywhere and can allocate guest
> memory anywhere.
>
> In a VMSA system, this would not be too much of a problem, since the
> MMU can manage memory at a granularity of 4KB after all. But in a
> PMSA system, this will be a big problem. On Armv8-R64, the max MPU
> protection regions number has been limited to 256. But in typical
> processor implementations, few processors will design more than 32
> MPU protection regions. Add in the fact that Xen shares MPU protection
> regions with guest's EL1 Stage 2. It becomes even more important
> to properly plan the use of MPU protection regions.
>
> - An ideal of memory usage layout restriction:
> ![img](https://drive.google.com/uc?export=view&id=1kirOL0Tx2aAypTtd3kXAtd75XtrngcnW)
> 1. Reserve proper MPU regions for Xen image (code, rodata and data + bss).
> 2. Reserve one MPU region for boot modules.
>     That means the placement of all boot modules, include guest kernel,
>     initrd and dtb, will be limited to this MPU region protected area.
> 3. Reserve one or more MPU regions for Xen heap.
>     On Armv8-R64, the guest memory is predefined in device tree, it will
>     not be allocated from heap. Unlike Armv8-A64, we will not move all
>     free memory to heap. We want Xen heap is dertermistic too, so Xen on
>     Armv8-R64 also rely on Xen static heap feature. The memory for Xen
>     heap will be defined in tree too. Considering that physical memory
>     can also be discontinuous, one or more MPU protection regions needs
>     to be reserved for Xen HEAP.
> 4. If we name above used MPU protection regions PART_A, and name left
>     MPU protection regions PART_B:
>     4.1. In hypervisor context, Xen will map left RAM and devices to PART_B.
>          This will give Xen the ability to access whole memory.
>     4.2. In guest context, Xen will create EL1 stage 2 mapping in PART_B.
>          In this case, Xen just need to update PART_B in context switch,
>          but keep PART_A as fixed.
>
> ***Notes: Static allocation will be mandatory on MPU based systems***
>
> **A sample device tree of memory layout restriction**:
> ```
> chosen {
>      ...
>      /*
>       * Define a section to place boot modules,
>       * all boot modules must be placed in this section.
>       */
>      mpu,boot-module-section = <0x10000000 0x10000000>;
>      /*
>       * Define a section to cover all guest RAM. All guest RAM must be located
>       * within this section. The pros is that, in best case, we can only have
>       * one MPU protection region to map all guest RAM for Xen.
>       */
>      mpu,guest-memory-section = <0x20000000 0x30000000>;
>      /*
>       * Define a memory section that can cover all device memory that
>       * will be used in Xen.
>       */
>      mpu,device-memory-section = <0x80000000 0x7ffff000>;
>      /* Define a section for Xen heap */
>      xen,static-mem = <0x50000000 0x20000000>;
>
>      domU1 {
>          ...
>          #xen,static-mem-address-cells = <0x01>;
>          #xen,static-mem-size-cells = <0x01>;
>          /* Statically allocated guest memory, within mpu,guest-memory-section */
>          xen,static-mem = <0x30000000 0x1f000000>;
>
>          module@11000000 {
>              compatible = "multiboot,kernel\0multiboot,module";
>              /* Boot module address, within mpu,boot-module-section */
>              reg = <0x11000000 0x3000000>;
>              ...
>          };
>
>          module@10FF0000 {
>                  compatible = "multiboot,device-tree\0multiboot,module";
>                  /* Boot module address, within mpu,boot-module-section */
>                  reg = <0x10ff0000 0x10000>;
>                  ...
>          };
>      };
> };
> ```
>
> ### **2.4. Changes of memory management**
> Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
> decouple Xen from VMSA. And give Xen the ability to manage memory in PMSA.
>
> 1. ***Use buddy allocator to manage physical pages for PMSA***
>     From the view of physical page, PMSA and VMSA don't have any difference.
>     So we can reuse buddy allocator on Armv8-R64 to manage physical pages.
>     The difference is that, in VMSA, Xen will map allocated pages to virtual
>     addresses. But in PMSA, Xen just convert the pages to physical address.
>
> 2. ***Can not use virtual address for memory management***
>     As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using virtual
>     address to manage memory. This brings some problems, some virtual address
>     based features could not work well on Armv8-R64, like `FIXMAP`, `vmap/vumap`,
>     `ioremap` and `alternative`.
>
>     But the functions or macros of these features are used in lots of common
>     code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate code
>     everywhere. In this case, we propose to use stub helpers to make the changes
>     transparently to common code.
>     1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap operations.
>        This will return physical address directly of fixmapped item.
>     2. For `vmap/vumap`, we will use some empty inline stub helpers:
>          ```
>          static inline void vm_init_type(...) {}
>          static inline void *__vmap(...)
>          {
>              return NULL;
>          }
>          static inline void vunmap(const void *va) {}
>          static inline void *vmalloc(size_t size)
>          {
>              return NULL;
>          }
>          static inline void *vmalloc_xen(size_t size)
>          {
>              return NULL;
>          }
>          static inline void vfree(void *va) {}
>          ```
>
>     3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to always
>        return `NULL`, they could not work well on Armv8-R64 without changes.
>        `ioremap` will return input address directly.
>          ```
>          static inline void *ioremap_attr(...)
>          {
>              /* We don't have the ability to change input PA cache attributes */
>              if ( CACHE_ATTR_need_change )
>                  return NULL;
>              return (void *)pa;
>          }
>          static inline void __iomem *ioremap_nocache(...)
>          {
>              return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>          }
>          static inline void __iomem *ioremap_cache(...)
>          {
>              return ioremap_attr(start, len, PAGE_HYPERVISOR);
>          }
>          static inline void __iomem *ioremap_wc(...)
>          {
>              return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>          }
>          void *ioremap(...)
>          {
>              return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>          }
>
>          ```
>      4. For `alternative`, it depends on `vmap` too. We will simply disable
>         it on Armv8-R64 in current stage. How to implement `alternative`
>         on Armv8-R64 is better to be discussed after basic functions of Xen
>         on Armv8-R64 work well.
>         But simply disable `alternative` will make `cpus_have_const_cap` always
>         return false.
>          ```
>          * System capability check for constant cap */
>          #define cpus_have_const_cap(num) ({                \
>                 register_t __ret;                           \
>                                                             \
>                 asm volatile (ALTERNATIVE("mov %0, #0",     \
>                                           "mov %0, #1",     \
>                                           num)              \
>                               : "=r" (__ret));              \
>                                                             \
>                  unlikely(__ret);                           \
>                  })
>          ```
>          So, before we have an PMSA `alternative` implementation, we have to
>          implement a separate `cpus_have_const_cap` for Armv8-R64:
>          ```
>          #define cpus_have_const_cap(num) cpus_have_cap(num)
>          ```
>
> ### **2.5. Changes of guest management**
> Armv8-R64 only supports PMSA in EL2, but it supports configurable
> VMSA or PMSA in EL1. This means Xen will have a new type guest on
> Armv8-R64 - MPU based guest.
>
> 1. **Add a new domain type - MPU_DOMAIN**
>     When user want to create a guest that will be using MPU in EL1, user
>     should add a `mpu` property in device tree `domU` node, like following
>     example:
>      ```
>      domU2 {
>          compatible = "xen,domain";
>          direct-map;
>          mpu; --> Indicates this domain will use PMSA in EL1.
>          ...
>      };
>      ```
>      Corresponding to `mpu` property in device tree, we also need to introduce
>      a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` for domain to mark itself as an
>      MPU domain. This flag will be used in domain creation and domain doing
>      vCPU context switch.
>      1. Domain creation need this flag to decide enable PMSA or VMSA in EL1.
>      2. vCPU context switch need this flag to decide save/restore MMU or MPU
>         related registers.
>
> 2. **Add MPU registers to vCPU save EL1 MPU context**
>     Current Xen only support MMU based guest, so it hasn't considered to
>     save/restore MPU context. In this case, we need to add MPU registers
>     to `arch_vcpu`:
>      ```
>      struct arch_vcpu
>      {
>      #ifdef CONFIG_ARM_MPU
>          /* Virtualization Translation Control Register */
>          register_t vtcr_el2;
>
>          /* EL1 MPU regions' registers */
>          pr_t mpu_regions[CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS];
>      #endif
>      }
>      ```
>      Armv8-R64 can support max to 256 MPU regions. But that's just theoretical.
>      So we don't want to define `pr_t mpu_regions[256]`, this is a memory waste
>      in most of time. So we decided to let the user specify through a Kconfig
>      option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value can be `32`,
>      it's a typical implementation on Armv8-R64. Users will recompile Xen when
>      their platform changes. So when the MPU changes, respecifying the MPU
>      protection regions number will not cause additional problems.
>
> 3. **MPU based P2M table management**
>     Armv8-R64 EL2 doesn't have EL1 stage 2 address translation. But through
>     PMSA, it still has the ability to control the permissions and attributes
>     of EL1 stage 2. In this case, we still hope to keep the interface
>     consistent with MMU based P2M as far as possible.
>
>     p2m->root will point to an allocated memory. In Armv8-A64, this memory
>     is used to save the EL1 stage 2 translation table. But in Armv8-R64,
>     this memory will be used to store EL2 MPU protection regions that are
>     used by guest. During domain creation, Xen will prepare the data in
>     this memory to make guest can access proper RAM and devices. When the
>     guest's vCPU will be scheduled in, this data will be written to MPU
>     protection region registers.
>
> ### **2.6. Changes of exception trap**
> As Armv8-R64 has compatible exception mode with Armv8-A64, so we can reuse most
> of Armv8-A64's exception trap & handler code. But except the trap based on EL1
> stage 2 translation abort.
>
> In Armv8-A64, we use `FSC_FLT_TRANS`
> ```
>      case FSC_FLT_TRANS:
>          ...
>          if ( is_data )
>          {
>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
>              ...
>          }
> ```
> But for Armv8-R64, we have to use `FSC_FLT_PERM`
> ```
>      case FSC_FLT_PERM:
>          ...
>          if ( is_data )
>          {
>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
>              ...
>          }
> ```
>
> ### **2.5. Changes of device driver**
> 1. Because Armv8-R64 only has single secure state, this will affect some
> devices that have two secure state, like GIC. But fortunately, most
> vendors will not link a two secure state GIC to Armv8-R64 processors.
> Current GIC driver can work well with single secure state GIC for Armv8-R64.
> 2. Xen should use secure hypervisor timer in Secure EL2. We will introduce
> a CONFIG_ARM_SECURE_STATE to make Xen to use secure registers for timer.
>
> ### **2.7. Changes of virtual device**
> Currently, we only support pass-through devices in guest. Because event
> channel, xen-bus, xen-storage and other advanced Xen features haven't been
> enabled in Armv8-R64.
>
> --
> Cheers,
> Wei Chen
>
>

