Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E418D898177
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 08:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700689.1094223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsGbr-0007Jd-FX; Thu, 04 Apr 2024 06:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700689.1094223; Thu, 04 Apr 2024 06:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsGbr-0007Gg-Cc; Thu, 04 Apr 2024 06:30:03 +0000
Received: by outflank-mailman (input) for mailman id 700689;
 Thu, 04 Apr 2024 06:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsGbq-0006wX-33
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 06:30:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e88::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2adccb6-f24c-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 08:29:59 +0200 (CEST)
Received: from SA0PR11CA0147.namprd11.prod.outlook.com (2603:10b6:806:131::32)
 by DS0PR12MB9274.namprd12.prod.outlook.com (2603:10b6:8:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 06:29:56 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::3) by SA0PR11CA0147.outlook.office365.com
 (2603:10b6:806:131::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 06:29:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 06:29:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 01:29:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 01:29:54 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 01:29:53 -0500
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
X-Inumbo-ID: c2adccb6-f24c-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFwzgsaTUl96manX4x2ape+EKaUHRbu3dLEdOjqKfPgK9J4QBPQEEubSD6RoMxfQ57B3E097rYHftA2sJXm2B/uPj0nUZ/uNB/lRV+/gQUsubxD6VwLEa0bsmuN8xPq9HcwdFQFIuyU43o+7sMVGX8rOu5h5rAMzvCsV6uWsCHvvsSRdVMxkG4lXZ3NFRWhiR+bWvYHcKw8o3Cdniy++F0i8dTvHn4tUqDcLAVK82pSRjtoH91m9h36l6S8hzv+DfwOadH4hLYJEP1vK5ERZpBxYwMYBsZdEyp2BANWEw8CTEYKBUDfqZLVasfePxyfv1JSvIbfg2gnenPzEyp2SMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTWN/THBMen8kBPZlVFfYYY8BVIsY0J5eqdlLHqOK74=;
 b=CfaUEhTghcdwDSFjKbEFyybOfh0cUUbVHCaa6DAp59vKQXEWnU+jIvGrB49+szNCIRNV62l/5o2t0AIN2FUfCCeYCXrbOESZoxz85ZLHHWFycafQOq/eEC9bpT8AqH2dZ6+Q4dr/wx3qApPqtMnQ3mlPKoxwMtB2mbp9YPbj39mj36Qcqox3jt8QqKJUWLDeCe3pj/xzPo6/Sh5yPtyZk0EEhT1HqrjOVIz8zGZGiYdoCTvSbcnVns2l0Yq3y2KH422pZMGw5ZbVyYLwiDhWGoGJQeMRR9HiIopyxjnfyO7BiYeGS05xEywOzRCSnB85qEVuuKsZradGP1zXM8HcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTWN/THBMen8kBPZlVFfYYY8BVIsY0J5eqdlLHqOK74=;
 b=n65rrlQluvg3ANSPcK9KZYX3T6vPsl0LrwCBI7Dd9R/lG3ogn3wR1idpd4op2KvwQgbKXWhZ9hJjwY6bdkTrZ8HZXT+oejadTX6yteHjoxuspjht1q4YBgMXcX+jHjp+VPyWxuLZHa6Fk2GS8Iy2gppS/1prlSgvhuTEnoX9ydY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <87f2ffe1-2569-41c4-9cef-4919f362f7cb@amd.com>
Date: Thu, 4 Apr 2024 08:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
From: Michal Orzel <michal.orzel@amd.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
 <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com>
Content-Language: en-US
In-Reply-To: <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|DS0PR12MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fd06a8-28e4-4918-4840-08dc5470a531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u+hPEVXgYF0/ZSWS/qDwNvGo0ZJjGmuR2gikVNCjbRjcaGBVgH35cSwPkp/av/E5ZT8rxPS7zXSSL8rFnZWxqLHh/5OuzZtxHnKGxLzNkBoTKC8NZlkrgG1LK/KbDhQtAIHT8L61KS86+ve0WTmzDBCMWn8uE9DyjvN3ec8WoN7BKfY6J/dUyG3a8/Rql4Rm1mmsdTKx69YXSlV20QjuSW6URnqufLYknWYiqlaEhZQzNc37RV1PAk78q9VCpxSwcT6aXAFC6v+pUitRjdWseMCieB+VyM+T9sk6Rt80Bplrvi+MurYu+n9YEuFi3uGtLXpv7r5gMj0TN5CBVHX9KBnPX/7du7FxrCKUhBiesYbt3z2DIseJziOFPNw6mpSbOmxfHFcpvmYRAGwZaUq8H3PoD1z95qmcCyHMcdbnehdiK2sxV22iOcz/kDYBgmh1A9StTCoPJPKk8sZkvtfcoaichCsFHHkFsnXosPi8nLYYGU4elIb1XMIY/b3ljxfjiJWgc0iug833T20mz8+Or9HNSf3/BOyHM40eIfpTMQFxn18/OMczw+3BPAS6tldOS33PO5IWfD117cNNyQ3q8FpTDYQ/u9mA/MkJrdotdtHn+C3YsPK9dkOXkQ17t4eC6G232MK8rXLLWucZpinte3dPELpEhjmSfWfYpTWfn82Z6ynwZVgWmy4Om8svpNOHups/4WT0/JwLmCJAz7iytpTRFhgdne9zegJpNJwg89PaWpBIfRtKTesWtJeTG0RW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 06:29:56.2277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fd06a8-28e4-4918-4840-08dc5470a531
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9274

Hi,

On 02/04/2024 12:25, Michal Orzel wrote:
> 
> 
> Hello,
> 
> On 29/03/2024 01:08, Volodymyr Babchuk wrote:
>>
>>
>> Generic Interface (GENI) is a newer interface for low speed interfaces
>> like UART, I2C or SPI. This patch adds the simple driver for the UART
>> instance of GENI. Code is based on similar drivers in U-Boot and Linux
>> kernel.
> Do you have a link to a manual?
> 
>>
>> This driver implements only simple synchronous mode, because although
>> GENI supports FIFO mode, it needs to know number of
>> characters **before** starting TX transaction. This is a stark
>> contrast when compared to other UART peripherals, which allow adding
>> characters to a FIFO while TX operation is running.
>>
>> The patch adds both normal UART driver and earlyprintk version.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>  xen/arch/arm/Kconfig.debug           |  19 +-
>>  xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
> Shouldn't all the files (+ other places) have geni in their names? Could qcom refer to other type of serial device?
> 
> 
>>  xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>>  xen/drivers/char/Kconfig             |   8 +
>>  xen/drivers/char/Makefile            |   1 +
>>  xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>>  6 files changed, 439 insertions(+), 1 deletion(-)
>>  create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>>  create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>>  create mode 100644 xen/drivers/char/qcom-uart.c
>>
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index eec860e88e..f6ab0bb30e 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -119,6 +119,19 @@ choice
>>                         selecting one of the platform specific options below if
>>                         you know the parameters for the port.
>>
>> +                       This option is preferred over the platform specific
>> +                       options; the platform specific options are deprecated
>> +                       and will soon be removed.
>> +       config EARLY_UART_CHOICE_QCOM
> The list is sorted alphabetically. Please adhere to that.
> 
>> +               select EARLY_UART_QCOM
>> +               bool "Early printk via Qualcomm debug UART"
> Shouldn't you add depends on ARM_64? Isn't this device Arm64 specific like in Linux?
> 
>> +               help
>> +                       Say Y here if you wish the early printk to direct their
> help text here should be indented by 2 tabs and 2 spaces (do not take example from surrounding code)
> 
>> +                       output to a Qualcomm debug UART. You can use this option to
>> +                       provide the parameters for the debug UART rather than
>> +                       selecting one of the platform specific options below if
>> +                       you know the parameters for the port.
>> +
>>                         This option is preferred over the platform specific
>>                         options; the platform specific options are deprecated
>>                         and will soon be removed.
>> @@ -211,6 +224,9 @@ config EARLY_UART_PL011
>>  config EARLY_UART_SCIF
>>         select EARLY_PRINTK
>>         bool
>> +config EARLY_UART_QCOM
>> +       select EARLY_PRINTK
>> +       bool
> The list is sorted alphabetically. Please adhere to that.
> 
>>
>>  config EARLY_PRINTK
>>         bool
>> @@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
>>           will be done using 32-bit only accessors.
>>
>>  config EARLY_UART_INIT
>> -       depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
>> +       depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0) || EARLY_UART_QCOM
>>         def_bool y
>>
>>  config EARLY_UART_8250_REG_SHIFT
>> @@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
>>         default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>         default "debug-pl011.inc" if EARLY_UART_PL011
>>         default "debug-scif.inc" if EARLY_UART_SCIF
>> +       default "debug-qcom.inc" if EARLY_UART_QCOM
>> diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debug-qcom.inc
>> new file mode 100644
>> index 0000000000..130d08d6e9
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/debug-qcom.inc
>> @@ -0,0 +1,76 @@
>> +/*
>> + * xen/arch/arm/arm64/debug-qcom.inc
>> + *
>> + * Qualcomm debug UART specific debug code
>> + *
>> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> + * Copyright (C) 2024, EPAM Systems.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> No need for the license text. You should use SPDX identifier instead at the top of the file:
> /* SPDX-License-Identifier: GPL-2.0-or-later */
I chatted with Julien and it would be best to use GPL-2.0-only.

~Michal

