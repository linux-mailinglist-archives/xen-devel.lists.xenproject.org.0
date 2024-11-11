Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965129C3C0B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 11:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833497.1248659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARjr-0002nM-Gp; Mon, 11 Nov 2024 10:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833497.1248659; Mon, 11 Nov 2024 10:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARjr-0002lP-E8; Mon, 11 Nov 2024 10:33:43 +0000
Received: by outflank-mailman (input) for mailman id 833497;
 Mon, 11 Nov 2024 10:33:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tARjq-0002lJ-Cr
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 10:33:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARjp-0001Mr-2F;
 Mon, 11 Nov 2024 10:33:42 +0000
Received: from [2a02:8012:3a1:0:440f:f547:9226:a08e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARjp-00030p-2b;
 Mon, 11 Nov 2024 10:33:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=yOp9E7TUNb/L822gZ8Iowvr6HsPsDI1/jLybZa9TC7Q=; b=l0/DTF+DUPfWhd448jnDMiTllH
	Bg9VtYV2LFaj9fnQ+WrvSl/tNP7fJpSHYhiLHBJv10iq0OK0MqTPOulbpbBxtFwnlob3IhwxKpR1X
	6curNOnNZKZMGCi5wQ48PRw+pzSy6wgtG8oA7T2/+4+Vj4XuSxYIcV9bN/I9/b8IMRos=;
Message-ID: <3d731902-d5eb-4f63-8501-5ddecf748cb9@xen.org>
Date: Mon, 11 Nov 2024 10:33:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <59b54859-d893-4bf4-8118-7e4a00e7d87e@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <59b54859-d893-4bf4-8118-7e4a00e7d87e@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/11/2024 15:22, Grygorii Strashko wrote:
> Hi
> 
> I'd be apprcieated if could consider my comments below.
> 
> On 30.09.24 14:47, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Introduce the SCMI layer to have some basic degree of awareness
>> about SMC calls that are based on the ARM System Control and
>> Management Interface (SCMI) specification (DEN0056E).
>>
>> The SCMI specification includes various protocols for managing
>> system-level resources, such as: clocks, pins, reset, system power,
>> power domains, performance domains, etc. The clients are named
>> "SCMI agents" and the server is named "SCMI platform".
>>
>> Only support the shared-memory based transport with SMCs as
>> the doorbell mechanism for notifying the platform. Also, this
>> implementation only handles the "arm,scmi-smc" compatible,
>> requiring the following properties:
>>     - "arm,smc-id" (unique SMC ID)
>>     - "shmem" (one or more phandles pointing to shmem zones
>>     for each channel)
>>
>> The initialization is done as 'presmp_initcall', since we need
>> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
>> If no "arm,scmi-smc" compatible node is found in Dom0's
>> DT, the initialization fails silently, as it's not mandatory.
>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>> are not validated, as the SMC calls are only passed through
>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>> running.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>   xen/arch/arm/Kconfig                |  10 ++
>>   xen/arch/arm/Makefile               |   1 +
>>   xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>   xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
> 
> Could it be moved in separate folder - for example "sci" or "firmware"?
> There are definitely more SCMI specific code will be added in the future
> as this solution is little bit too simplified.
> 
>>   4 files changed, 226 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>   create mode 100644 xen/arch/arm/scmi-smc.c
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 323c967361..adf53e2de1 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>         not been emulated to their complete functionality. Enabling 
>> this might
>>         result in unwanted/non-spec compliant behavior.
>> +config SCMI_SMC
> 
> Could you please rename it to clearly specify that it is only dom0/hwdom
> specific? Like SCMI_SMC_DOM0 or SCMI_SMC_HW_DOM.

I expect this series to be just a stop gap until we support SCMI for the 
VMs. Once this is merge, I don't expect we would want to keep a Kconfig 
to allow SCMI just for dom0. Therefore, I am not entirely convinced the 
proposed new name is a good idea.

> 
>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 
>> firmware"
>> +    default y
>> +    help
>> +      This option enables basic awareness for SCMI calls using SMC as
>> +      doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>> +      compatible only). The value of "arm,smc-id" DT property from SCMI
>> +      firmware node is used to trap and forward corresponding SCMI SMCs
>> +      to firmware running at EL3, if the call comes from Dom0.
>> +
>>   endmenu
>>   menu "ARM errata workaround via the alternative framework"
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7792bff597..b85ad9c13f 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>>   obj-y += physdev.o
>>   obj-y += processor.o
>>   obj-y += psci.o
>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>   obj-y += setup.o
>>   obj-y += shutdown.o
>>   obj-y += smp.o
>> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/ 
>> include/asm/scmi-smc.h
>> new file mode 100644
>> index 0000000000..c6c0079e86
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/scmi-smc.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/include/asm/scmi-smc.h
>> + *
>> + * ARM System Control and Management Interface (SCMI) over SMC
>> + * Generic handling layer
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#ifndef __ASM_SCMI_SMC_H__
>> +#define __ASM_SCMI_SMC_H__
>> +
>> +#include <xen/types.h>
>> +#include <asm/regs.h>
>> +
>> +#ifdef CONFIG_SCMI_SMC
>> +
>> +bool scmi_is_enabled(void);
>> +bool scmi_is_valid_smc_id(uint32_t fid);
>> +bool scmi_handle_smc(struct cpu_user_regs *regs);
>> +
>> +#else
>> +
>> +static inline bool scmi_is_enabled(void)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
> 
> I propose to add "struct domain *d" as the first parameter to make it
> more abstract from Xen internals.

I am not sure to understand why we would want the call to be more 
abstract. This function should *only* act on the vCPU currently loaded. 
So it makes sense to use "current->domain".

Cheers,

-- 
Julien Grall


