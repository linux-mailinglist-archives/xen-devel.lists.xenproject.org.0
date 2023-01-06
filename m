Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99796602FD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472762.733125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoVT-0006vQ-H1; Fri, 06 Jan 2023 15:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472762.733125; Fri, 06 Jan 2023 15:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoVT-0006tI-Dc; Fri, 06 Jan 2023 15:19:43 +0000
Received: by outflank-mailman (input) for mailman id 472762;
 Fri, 06 Jan 2023 15:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NPe1=5D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pDoVS-0006sw-6J
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:19:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 892c6e25-8dd5-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 16:19:39 +0100 (CET)
Received: from BL0PR1501CA0022.namprd15.prod.outlook.com
 (2603:10b6:207:17::35) by CH3PR12MB8511.namprd12.prod.outlook.com
 (2603:10b6:610:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:19:35 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:207:17:cafe::ef) by BL0PR1501CA0022.outlook.office365.com
 (2603:10b6:207:17::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:19:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.15 via Frontend Transport; Fri, 6 Jan 2023 15:19:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 09:19:35 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 6 Jan 2023 09:19:33 -0600
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
X-Inumbo-ID: 892c6e25-8dd5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmYYZKmsm8wPu+mMVvCMuOGDou5onGM5gBzV/I4eOskIXzI+6NE30RbZvtBsCrMHS++tOmWmL3Ha0EvDtHLO9qERQLAqOIGWMIoChzx3uTWAfgv9yOQiLqmLEHxRhyExmCXI9jdefmQnCtuCT3arjzSZdjxvWALXdJ72DUBJMQ5vp7p6tIqxonc8o3SFI7UedASi60Na0EdjiEe2ZrPhfkcPAlOPRx8h6Xrsnj9Lh0s7L5uBuF5YCIkODOonQpQZ8tc7vVp2tepfU5KRXPliRSjhYZqi1N+qPWG+7b819kZ//RhrzUSYGZbkGmlcct/QSk1MnZ8qE/hXTo90szETaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwgDyJdzWg87zclswFLQ8OvS/mSB4UK6QDkVuEFIJx8=;
 b=YY1/D4tXCUqkIMeyRDeoA4A0TSXpgcaWh5ZhTbvZujoEk/0ndSCmocg3z1eTBCuwQbv+ztICIw7eTMp8MzXszip0g/ubMcdLbi0p+2qYs5Rekum85bUcgtZAh8uFBrB7aHFUSY5UPAQepJo5dWNjVJ2bZ5VXEh47EgLsqamh6c6ve8kXab47DZ3FfYv8l7PYw+WQKayGZUblLSoMLu1q6sUv/OSFQmAHVn91JMMFYKxjEtSLrLpZ7TRRwk0HCykLAKesNVz1ePWA3r1Z8fatCF1n7+clvmuZg1JALPLonHYP5E+KnbTFZd595S9GPXY+iA+vwTadKaWBFHY3rUaRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwgDyJdzWg87zclswFLQ8OvS/mSB4UK6QDkVuEFIJx8=;
 b=CUVuitha+SUvHdMk/QZ7K/reCnYq9OAWxIbTvhZzLLDUAW6T26z+Bif3L+4OtRz6ovMIYJpA8SIS0YEPEBsfPnoacjdCzKQYkTHVnI2T0LpXZCggp5mX8mKMVRII/8mk7Sh+YvMv2W10cP3jymoclxpJrh+mU15xMXXpPU9sNuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <420e9747-09ba-b6e4-d3c5-14f0f174c1d7@amd.com>
Date: Fri, 6 Jan 2023 16:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ed7080-a8fc-4de6-717a-08daeff96b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/GHIgVc3pfa5ce4nYdV4nJGpB4d+LgU5rIVcl4/DeVnsU0X1wVKEIWhrgohd+LZ8kOMWs8rpE6k7rxg3pDAqyp65II5TR520mNXRC3A0Ua02MjXVW6p/5eBofN8HU2fx6RyTi4+7qoO2TlYlHHvLSr2NzqH9bNsin3G5S2/QLsz+guHiicGXaplb3uX15o8wgqHYrQQn3s4XwB5uVN4VG1fuQqfpdBwj+zDvo2J8rNEnwVGMWhqU3PF77wZ0jAd4DI0OZe6BjH+4bjR2/mGtoHD8Y581eb8FZgpJe3xfTT1HUz+EzBjLB6DJdiYMUP0VhbgpUGy8DEZksXnSzbjjr3Tfr4tsEHHifn2wAVmkbwaleLbuN1yZtVlhXGlkoqVjV7b36fzqR7j2EDBVFxg/JYnkv4DeFm/Pup0ZxGA/OSkh1rQZ1ho05elMNHNirJOvDdmYM0AfYFxSnXuRi+VYgDd++YDX7do+LoKqv/o6jTHrW5oc2++ngZm6J5d2Z5hFNdxm1jkeua8inxwCB30Anu+xKry8FlT9LAn963MH6rD2ypfVFUcleJytHYgDYNhqUBzGIUJ56/pUi1BmjztjOhsW5XAxAqxFy1LwL7SACR4w1NtZNj7wGaj9nxMkMPETbNekeUnNPfXQ3kXzVEdu0/TUtaCKcGa5fRUmtWOrRK0eNat7stcmbmm5QJNBXmX2MQS0EiPYMn/Ivv7UnLa5Qt7ABxRqa//H75idZ9bzAuej9XNws2E9jpZ63F5kgaOrGnXAQ/VJzlPY/KPk48JV5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(2616005)(426003)(336012)(186003)(40460700003)(81166007)(26005)(356005)(82740400003)(40480700001)(86362001)(36860700001)(31696002)(36756003)(82310400005)(110136005)(70206006)(8676002)(8936002)(4326008)(70586007)(316002)(31686004)(5660300002)(2906002)(54906003)(53546011)(16576012)(41300700001)(44832011)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:19:35.6204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ed7080-a8fc-4de6-717a-08daeff96b8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511

Hi Oleksii,

On 06/01/2023 14:14, Oleksii Kurochko wrote:
> 
> 
> The patch introduce sbi_putchar() SBI call which is necessary
> to implement initial early_printk
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/Makefile          |  1 +
>  xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>  xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/sbi.h
>  create mode 100644 xen/arch/riscv/sbi.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 5a67a3f493..60db415654 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += setup.o
> +obj-y += sbi.o
> 
>  $(TARGET): $(TARGET)-syms
>         $(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> new file mode 100644
> index 0000000000..34b53f8eaf
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> +/*
> + * Copyright (c) 2021 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Taken/modified from Xvisor project with the following copyright:
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef __CPU_SBI_H__
> +#define __CPU_SBI_H__
I wonder where does CPU come from. Shouldn't this be called __ASM_RISCV_SBI_H__ ?

> +
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR            0x1
> +
> +struct sbiret {
> +    long error;
> +    long value;
> +};
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
> +        unsigned long arg1, unsigned long arg2,
> +        unsigned long arg3, unsigned long arg4,
> +        unsigned long arg5);
The arguments needs to be aligned.

> +
> +/**
> + * Writes given character to the console device.
> + *
> + * @param ch The data to be written to the console.
> + */
> +void sbi_console_putchar(int ch);
> +
> +#endif // __CPU_SBI_H__
// should be replaced with /* */

> diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> new file mode 100644
> index 0000000000..67cf5dd982
> --- /dev/null
> +++ b/xen/arch/riscv/sbi.c
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Taken and modified from the xvisor project with the copyright Copyright (c)
> + * 2019 Western Digital Corporation or its affiliates and author Anup Patel
> + * (anup.patel@wdc.com).
> + *
> + * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + * Copyright (c) 2021 Vates SAS.
> + */
> +
> +#include <xen/errno.h>
> +#include <asm/sbi.h>
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
> +            unsigned long arg1, unsigned long arg2,
> +            unsigned long arg3, unsigned long arg4,
> +            unsigned long arg5)
The arguments needs to be aligned.

> +{
> +    struct sbiret ret;
Could you please add an empty line here.

> +    register unsigned long a0 asm ("a0") = arg0;
> +    register unsigned long a1 asm ("a1") = arg1;
> +    register unsigned long a2 asm ("a2") = arg2;
> +    register unsigned long a3 asm ("a3") = arg3;
> +    register unsigned long a4 asm ("a4") = arg4;
> +    register unsigned long a5 asm ("a5") = arg5;
> +    register unsigned long a6 asm ("a6") = fid;
> +    register unsigned long a7 asm ("a7") = ext;
> +
> +    asm volatile ("ecall"
> +              : "+r" (a0), "+r" (a1)
> +              : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> +              : "memory");
> +    ret.error = a0;
> +    ret.value = a1;
> +
> +    return ret;
> +}
> +
> +void sbi_console_putchar(int ch)
> +{
> +    sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
> +}
> --
> 2.38.1
> 
> 

~Michal

