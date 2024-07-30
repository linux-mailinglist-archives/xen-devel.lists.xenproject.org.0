Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45B941F08
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 19:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768021.1178732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYr26-0003zk-0U; Tue, 30 Jul 2024 17:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768021.1178732; Tue, 30 Jul 2024 17:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYr25-0003xn-TY; Tue, 30 Jul 2024 17:53:09 +0000
Received: by outflank-mailman (input) for mailman id 768021;
 Tue, 30 Jul 2024 17:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2aj=O6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYr24-0003xf-N5
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 17:53:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91aab818-4e9c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 19:53:04 +0200 (CEST)
Received: from BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26) by
 CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Tue, 30 Jul 2024 17:50:58 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::40) by BL0PR01CA0013.outlook.office365.com
 (2603:10b6:208:71::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Tue, 30 Jul 2024 17:50:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 17:50:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 12:50:56 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 12:50:55 -0500
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
X-Inumbo-ID: 91aab818-4e9c-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTZ/YHBR7BtlaajUU+I4XgZwcH57G7Pk+nLCXzviMSzxSMFpCa76bJKHOGZRcfreSzoUMq27fXHJDJ47d94rGIT5iOXU2h1ZSiya+ljZvIlUF0amC6X5KU3cN9FDdsP+AVTWH23tbNc2S3Gc7siHUxY6KlaSzD+ed7vKbFrbylGssdirqFRaBLwWq5AtBFcLlicWm4SpnlspC9Vnz5QMaZR4lFTYN+6DUPf9gPRnVjjTCOTi+Y7FRGPDrih6WhC4yL3RCYmDBQJh+D9ffibzh6c1IIptINfl2wjX9TtoqS2iXOQ6/2A3RVuy0frLytPsIDo0Pjw5T2lDSSsPSFnoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1sZYy2x2M/nreP3j2hTURzEWb5eWeFCapNjQTgj+pU=;
 b=Wa4kS8HWLobUmFN793wSLfQMUVKE1uAZeZyZ2XYyaLJ+xuf77PxDPIO0fgEGuPjaBV3TK9o1jlJgwtiQlShxl39Vvc6MJduiZcGiufku8QCvfJKKRDNzFvcR5xY/RcaKPa5oVQwiiFo+oNII8rgYb4liAsmVTmZTZ/xx9OfPlMCs9v2sbI40ViDnslcaZyHJJuofltoA8N4M6/JDR1D7Uy6hDUaomySqNurMKX6AeFZOdS2kCtu1qqUbYMgCGpVXErftaGZ1cuwgNHDkR1ZDdnYW+svzacMQ/b/kyAL+p9yijSmc7q3cezmxIeVRIwNIQN22webWTtl5I/0iH06KZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1sZYy2x2M/nreP3j2hTURzEWb5eWeFCapNjQTgj+pU=;
 b=af+ZEXwY35zyQc7glxw5mlcGNyO5Tvo9RpdTU/7gQmaWS6z8HyQVobBqx/SxLPyg/Edpt38bawXidZTNWGIFYMYWcmpixc1mC62j3fMIRKxNEz21X8U+M+xZeruvs5O/EalaBHcqOJAmXTuhotgiqbeYXY7aNmsrOXN0fax0vks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <23fe4756-4e5c-47f8-b9cc-101b7b8d116f@amd.com>
Date: Tue, 30 Jul 2024 13:50:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <d313f39a-f5aa-4611-975e-bc64759bbd01@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 804672a3-39d4-435e-b0e5-08dcb0c02b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjRFWWhVNDBqTWp4OGFzdXFGVGw3WWQ3aTAvdHNlcDQwYnlQY2lIZnIwdUdo?=
 =?utf-8?B?Smlzc3Q2Kzh0U1lkUFlyeDFISTdEU2VlNW9jaG1ldG82eWV2ckhPNFVEOVRO?=
 =?utf-8?B?Rk0xOFpnZHRSaEFqOEhIckNQLzFKRkg4MjBSU0RLRWtLMGlwdmtHZis2RE5a?=
 =?utf-8?B?Q0hYZkVUbzAwdjFvZEVrejdmSjYwZnFxT1BlNTJTaVRsRnkyMFNFN3ZsalBW?=
 =?utf-8?B?S3l0MEhvYUxESDZaOExVbTlUTWw4Vkdma3I5TkNPM01aYTFMOTN4ZnhhWGw5?=
 =?utf-8?B?WmFsLzEwdlZtcDJHYkIxUnk5MFZzWVhoMUpJRWFva21qOVJtTkJJeDFuQTRx?=
 =?utf-8?B?dEhadWcxVkVwSS9OQjUwR0N3U09jQ0JtWlBKZTFFNzlCYWg4QjdhOStDVUNt?=
 =?utf-8?B?WnFxaVh1TWxVMk1zU1lBR1Jydjg0eVN3VklRUHlJVHFlR0JUY0hoZWFzOGtp?=
 =?utf-8?B?UUhqUU5QNUVHNC8rUmcyUVJrK1VST05OYzFra2hSZU93bFB2LzZHS2REb1Ax?=
 =?utf-8?B?ckl4WDFtS28xTDd5bUJ5QjRmUWtTZ2dxQ0dnRG9mVGJxSFFWelpkYU9JVlFu?=
 =?utf-8?B?NTNnNVhYZnVjcWNiWE9TUVdkcHJocG1UcjYyM0wybmprdkhVWUFqdUNWOG5T?=
 =?utf-8?B?WE0rbXozY3N3ckMwb1M0MCs4RDIzZGRwQ3Q1WXNvTVdOMUI4d2VSQWhDUzE3?=
 =?utf-8?B?aXZpdGlQa0pHaHhYekRIaCtkMDdjazJKbzZadkJHbzg5N3NkMUFOdWgvOG5X?=
 =?utf-8?B?S2VMMy9xZWMzdCtHNkRhcUxaYU1jVkozUTB6U0pNMGxzbmVhWjVlWlJaeDU4?=
 =?utf-8?B?UnJkZG9IOFkwZi9lZmZHRFF6MDQ4SXE2eUY4WFR1aHc1WlFrelhTV3ZlQVRS?=
 =?utf-8?B?NG1QTzdRSlA5Rkd5Q2hBWnVwZnBOTTJWVWhDaTlTK3JuL05vZXBTMlhNYjFU?=
 =?utf-8?B?aDNNSW1RVVdoNWIxQit6b1VXY3Fka0xpaHpyMVhBd1Zoa2pRTzZpUW9BdnZq?=
 =?utf-8?B?T1VDdnk3ak1kM0tNczdGTmo5T0VhZmlDY0RxSE82dDVtcFh6QnV1N0R3WHBh?=
 =?utf-8?B?c05BYW1lejVUNkluMDZGOW9wcGNyTE9SejUzQy9MNVljMUdEMHpQQnZqYTc3?=
 =?utf-8?B?a2dubHJiVWNicDBHd3BtVjBNWSs2ZUZGQ3hNMThTTWduZXpVSnBoOFJUTk1Y?=
 =?utf-8?B?QUF4cDdvZzM1TTZ0c2hyczJXdmh4bVRSeGhwckg1VjdXaWg3YlhGQ2Vab3FI?=
 =?utf-8?B?SUtCMmxYa1pObnVyQ2pWWVNHa0VZNCtQOHRyNDdKeXdOUlJES2Q5RVA4ZjJQ?=
 =?utf-8?B?WmEzUjA3SEZ1eGFVcUR4MndSc2JnUVU4RTU3M0dCdGlYTmxSeldBd2xmSGdk?=
 =?utf-8?B?bisrVTlVcDE3alVlb1NMMldnWnQ4TVJFTWtldGdneVo3WDI1ak9mWjNkN0JN?=
 =?utf-8?B?enlQbkRjdGZjZTVEM1RCNmZLT2NxdDlncW9YYlV5TlFkSTJnandGRnJmUjZl?=
 =?utf-8?B?MEx6QWV1aEpybndhb20vTWltK0FGUE9BSHJaaTMxT1labjQ2bDJESHZydUda?=
 =?utf-8?B?aGxxamhscnBsYUxEcUM3ZHZ4RElXUHArWXlWTHluOWVWVzBWZjljZkIvdTBF?=
 =?utf-8?B?WWtNVWx6cStiSkpHeVYrdmREYUFxY245MVhjQU12bVk1aEllcGpLQ3QzY1hy?=
 =?utf-8?B?Vk11MkFlVnRjRUJNTUtUbCtXOTVmY2FRZ1N4bnFUbTFZaEtnejZ6MEFYMVJm?=
 =?utf-8?B?d0ptMzJWK0psSitmYlZ5UmFJSHErVzlUbUdwNkgrdnpnRWRwNnpJK3YySnRu?=
 =?utf-8?B?MWxXRzdzaDR3Y2JZT0t3V3FXa0Y4OXg2VjQ5OVdlMVY1ZWFLMk5DN2NzMlpi?=
 =?utf-8?B?L0dWUkFtMlRmRzAyeldGL0h3NytjSTVxMUlwcHp5Y0pURU1maUs3azMyQUt5?=
 =?utf-8?Q?J0ElHtckXKGOT4wdXOSbUld6nMEu/rIb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 17:50:58.2378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804672a3-39d4-435e-b0e5-08dcb0c02b18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

On 7/29/24 14:36, Julien Grall wrote:
> Hi Stewart,
> 
> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>> Use the -finstrument-functions option to check that the stack pointer is
> 
> Is the feature supported by both clang and GCC?

Yes, I tested both.

> If so, which from versions?

gcc since at least 1998, not sure what version specifically.

clang since v2.8 (2010)

> 
> From README, this is what we currently support.
> 
>       - For ARM 32-bit:
>         - GCC 4.9 or later
>         - GNU Binutils 2.24 or later
>       - For ARM 64-bit:
>         - GCC 5.1 or later
>         - GNU Binutils 2.24 or later
> 
> We don't mention Clang, but I would expect a clang from 4-5 years should still be Arm (not cross-compile as we never fully added the support).

There is a way cross compile with clang today, but still using gnu
linker and such. Here's my clang build rune:

make -j $(nproc) \
    clang=y \
    CC="clang --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    CXX="clang++ --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    HOSTCC=clang \
    HOSTCXX=clang++ \
    XEN_TARGET_ARCH=arm64 \
    CROSS_COMPILE=aarch64-none-linux-gnu- \
    dist-xen

> 
> 
>> valid upon each function entry. Only enable it for debug builds due to
>> the overhead introduced.
> 
> How much overhead is it? We use debug builds during the dev cycle, so we need to make sure this is not noticeable.

Xen binary size without instrumentation: 1.3M
Xen binary size with instrumentation: 1.9M

Subjectively, the Xen boot time on ZCU102 hardware seems comparable.

On qemu-system-aarch64, unfortunately, I'm seeing about a 7x slowdown in
Xen boot time. It seems page allocation operations are particularly
affected.

> 
> In any case, it would be better if this new option is under its own kconfig options. We can separately decide whether it is on or off by default when CONFIG_DEBUG=y.

Will do. Given the significant overhead when running on qemu, I think I
must reluctantly suggest that it be off by default. For CI runs with
real hardware, we could turn it on.

> 
>>
>> Use per-cpu variables to store the stack base and nesting level. The
>> nesting level is used to avoid invoking __cyg_profile_func_enter
>> recursively.
>>
>> A check is added for whether per-cpu data has been initialized. Since
>> TPIDR_EL2 resets to an unknown value, initialize it to an invalid value.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> RFC: I only tested this on arm64. I still need to test with arm32.
>>
>> RFC: Should we put this under its own config option instead of reusing
>>       CONFIG_DEBUG?
> 
> See above.
> 
>>
>> RFC: Is there a better value for INVALID_PER_CPU_OFFSET? We can't use 0
>>       because 0 is a valid value for get_per_cpu_offset().
> 
> I would consider to use ~0 because this is very unlikely to be used as an offset (at least on arm64).

Yep, ~0 works, will do.

> 
>> ---
>>   xen/arch/arm/arch.mk             |  1 +
>>   xen/arch/arm/arm64/head.S        |  4 +++
>>   xen/arch/arm/domain.c            |  3 +++
>>   xen/arch/arm/include/asm/page.h  |  2 ++
>>   xen/arch/arm/include/asm/traps.h |  8 ++++++
>>   xen/arch/arm/setup.c             |  4 +++
>>   xen/arch/arm/smpboot.c           |  3 +++
>>   xen/arch/arm/traps.c             | 45 ++++++++++++++++++++++++++++++++
>>   8 files changed, 70 insertions(+)
>>
>> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
>> index 022dcda19224..c39cb65d183d 100644
>> --- a/xen/arch/arm/arch.mk
>> +++ b/xen/arch/arm/arch.mk
>> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access
>>   CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>>   CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>>   $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>> +CFLAGS-$(CONFIG_DEBUG) += -finstrument-functions
>>     ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>>       $(error You must use 'make menuconfig' to enable/disable early printk now)
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 2fa07dc3a04b..4a332b9cbc7c 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -399,6 +399,10 @@ FUNC_LOCAL(cpu_init)
>>            * than SP_EL0.
>>            */
>>           msr spsel, #1
>> +
> 
> I would add a comment explaining what we are doing.

Will do.

> 
>> +        ldr   x0, =INVALID_PER_CPU_OFFSET
>> +        msr   tpidr_el2, x0
>> +
>>           ret
>>   END(cpu_init)
>>   diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 7cfcefd27944..93ebe6e5f8af 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -26,6 +26,7 @@
>>   #include <asm/procinfo.h>
>>   #include <asm/regs.h>
>>   #include <asm/tee/tee.h>
>> +#include <asm/traps.h>
>>   #include <asm/vfp.h>
>>   #include <asm/vgic.h>
>>   #include <asm/vtimer.h>
>> @@ -328,6 +329,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>>         set_current(next);
>>   +    stack_set(next->arch.stack);
>> +
>>       prev = __context_switch(prev, next);
>>         schedule_tail(prev);
>> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
>> index 69f817d1e68a..6b5aaf1eb3ff 100644
>> --- a/xen/arch/arm/include/asm/page.h
>> +++ b/xen/arch/arm/include/asm/page.h
>> @@ -7,6 +7,8 @@
>>   #include <asm/lpae.h>
>>   #include <asm/sysregs.h>
>>   +#define INVALID_PER_CPU_OFFSET            _AC(0x1, UL)
>> +
>>   /* Shareability values for the LPAE entries */
>>   #define LPAE_SH_NON_SHAREABLE 0x0
>>   #define LPAE_SH_UNPREDICTALE  0x1
>> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
>> index 9a60dbf70e5b..13e6997c2643 100644
>> --- a/xen/arch/arm/include/asm/traps.h
>> +++ b/xen/arch/arm/include/asm/traps.h
>> @@ -118,6 +118,14 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>>     void finalize_instr_emulation(const struct instr_details *instr);
>>   +#ifdef CONFIG_DEBUG
>> +void stack_check_init(void);
>> +void stack_set(unsigned char *base);
>> +#else
>> +static inline void stack_check_init(void) { }
>> +static inline void stack_set(unsigned char *base) { }
>> +#endif
>> +
>>   #endif /* __ASM_ARM_TRAPS__ */
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 0c2fdaceaf21..07d07feff602 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -47,6 +47,7 @@
>>   #include <asm/setup.h>
>>   #include <xsm/xsm.h>
>>   #include <asm/acpi.h>
>> +#include <asm/traps.h>
>>     struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
>>   @@ -733,6 +734,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>       percpu_init_areas();
>>       set_processor_id(0); /* needed early, for smp_processor_id() */
>>   +    stack_check_init();
>> +
>>       /* Initialize traps early allow us to get backtrace when an error occurred */
>>       init_traps();
>>   @@ -924,6 +927,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>        * since the static one we're running on is about to be freed. */
>>       memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
>>              sizeof(struct cpu_info));
>> +    stack_set(idle_vcpu[0]->arch.stack);
>>       switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
>>   }
>>   diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 04e363088d60..1c689f2caed7 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -30,6 +30,7 @@
>>   #include <asm/psci.h>
>>   #include <asm/acpi.h>
>>   #include <asm/tee/tee.h>
>> +#include <asm/traps.h>
>>     /* Override macros from asm/page.h to make them work with mfn_t */
>>   #undef virt_to_mfn
>> @@ -329,6 +330,8 @@ void asmlinkage start_secondary(void)
>>         set_processor_id(cpuid);
>>   +    stack_check_init();
>> +
>>       identify_cpu(&current_cpu_data);
>>       processor_setup();
>>   diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index aac6c599f878..b4890eec7ec4 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>>           arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>>   }
>>   +#ifdef CONFIG_DEBUG
> 
> Loooking at the code below. Aside the stack pointer part, nothing seems specific to Arm. So maybe this could be moved to common code?

Yes, I suppose so.

> 
>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>> +DEFINE_PER_CPU(unsigned char *, stack_base);
> 
> I think this could be "const unsigned char *" as the stack should not be modified directly.

Every time there's a vcpu context switch we will have a new stack.

> 
>> +
>> +void __attribute__((no_instrument_function)) stack_set(unsigned char *base)
>> +{
>> +    this_cpu(stack_base) = base;
>> +}
>> +
>> +void __init __attribute__((no_instrument_function)) stack_check_init(void)
>> +{
>> +    this_cpu(stack_check_nesting) = 0;
>> +    stack_set(init_data.stack);
>> +}
>> +
>> +__attribute__((no_instrument_function))
>> +void __cyg_profile_func_enter(void *this_fn, void *call_site)
>> +{
>> +    unsigned char *sp;
>> +
>> +    if ( get_per_cpu_offset() == INVALID_PER_CPU_OFFSET )
>> +        return;
>> +
>> +    asm volatile ("mov %0, sp" : "=r" (sp) );
>> +
>> +    if ( sp < this_cpu(stack_base) ||
>> +         sp > (this_cpu(stack_base) + STACK_SIZE) )
> 
> The top of the stack is used to store struct cpu_info. So you want to substract its size (see arch_vcpu_create()).

Will do.

> 
>> +    {
>> +        if ( this_cpu(stack_check_nesting) )
>> +            return;
>> +
>> +        this_cpu(stack_check_nesting)++;
> 
> Looking at the use, it only seems to be used as "print/panic once". So maybe use a bool to avoid any overflow.

It will only ever be incremented once. I'll still change it to a bool,
this should make it more obvious.

> 
>> +        printk("CPU %d stack pointer out of bounds (sp %#lx, stack base %#lx)\n",
>> +               smp_processor_id(), (uintptr_t)sp,
>> +               (uintptr_t)this_cpu(stack_base));
>> +        BUG();
> 
> I would consider to call panic().

panic() alone doesn't show the stack trace / call trace.

> But is it safe to call any of this if we blew the stack?

Nope, it sure isn't!

> IOW, should we have a buffer?

Yes. After some experimentation, I found that this printk and a WARN
(similar to BUG, but resumes execution and allows me to collect these
metrics) uses approximately 1632 bytes of stack. Assuming BUG uses a
similar amount of stack as WARN, and adding in a comfortable margin for
error, I'll add a 4096 byte buffer (i.e. invoke the print/BUG with 4096
bytes remaining on the stack).

