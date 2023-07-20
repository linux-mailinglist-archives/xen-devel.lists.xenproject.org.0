Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72375BA9D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566766.886049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMc9N-0002q1-0v; Thu, 20 Jul 2023 22:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566766.886049; Thu, 20 Jul 2023 22:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMc9M-0002nR-Th; Thu, 20 Jul 2023 22:29:32 +0000
Received: by outflank-mailman (input) for mailman id 566766;
 Thu, 20 Jul 2023 22:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMc9L-0002nL-Fb
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMc9K-0001ij-2S; Thu, 20 Jul 2023 22:29:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMc9J-0001wo-Pn; Thu, 20 Jul 2023 22:29:29 +0000
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
	bh=8vuh8PsummUMnmp5Efaj61l3oeghV+IPWTihleeYVEs=; b=fnTVUNlyVH1TuOHDd7uIbyqXT1
	sPqInUGPI6nS0b3vKVTEOtKdmLh/E/C0YnbrcRkZZ1WDZPpQwCoVeTasTnSTeuY8XSN/HSgpP/pLh
	PQILQDDU5jRUawajA1voQtZFZ83Fr8rXHa8JIZDSHy/X3GP9wAJbj9E+nrjOH5FxwhE8=;
Message-ID: <7289237e-5197-a515-959a-023e62dceb14@xen.org>
Date: Thu, 20 Jul 2023 23:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A mediator
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>,
 Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-5-jens.wiklander@linaro.org>
 <FE5A2E30-8737-415E-92B2-B6B7B0BF0CCE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FE5A2E30-8737-415E-92B2-B6B7B0BF0CCE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 20/07/2023 11:20, Bertrand Marquis wrote:
> Hi Jens,
> 
>> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
>> Partition in secure world.
>>
>> This commit brings in only the parts needed to negotiate FF-A version
>> number with guest and SPMC.
>>
>> [1] https://developer.arm.com/documentation/den0077/e
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>> xen/arch/arm/include/asm/psci.h    |   4 +
>> xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
>> xen/arch/arm/tee/Kconfig           |  11 ++
>> xen/arch/arm/tee/Makefile          |   1 +
>> xen/arch/arm/tee/ffa.c             | 225 +++++++++++++++++++++++++++++
>> xen/arch/arm/vsmc.c                |  17 ++-
>> xen/include/public/arch-arm.h      |   1 +
>> 7 files changed, 291 insertions(+), 3 deletions(-)
>> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
>> create mode 100644 xen/arch/arm/tee/ffa.c
>>
>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
>> index 832f77afff3a..4780972621bb 100644
>> --- a/xen/arch/arm/include/asm/psci.h
>> +++ b/xen/arch/arm/include/asm/psci.h
>> @@ -24,6 +24,10 @@ void call_psci_cpu_off(void);
>> void call_psci_system_off(void);
>> void call_psci_system_reset(void);
>>
>> +/* Range of allocated PSCI function numbers */
>> +#define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
>> +#define PSCI_FNUM_MAX_VALUE                 _AC(0x1f,U)
>> +
>> /* PSCI v0.2 interface */
>> #define PSCI_0_2_FN32(nr) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,             \
>>                                               ARM_SMCCC_CONV_32,               \
>> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/asm/tee/ffa.h
>> new file mode 100644
>> index 000000000000..44361a4e78e4
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/tee/ffa.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * xen/arch/arm/include/asm/tee/ffa.h
>> + *
>> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
>> + *
>> + * Copyright (C) 2023  Linaro Limited
>> + */
>> +
>> +#ifndef __ASM_ARM_TEE_FFA_H__
>> +#define __ASM_ARM_TEE_FFA_H__
>> +
>> +#include <xen/const.h>
>> +#include <xen/kconfig.h>

None of the headers aside xen/config.h will include xen/kconfig.h. The 
former is included everything from the compiler command line. So I have 
removed it.

>> +
>> +#include <asm/smccc.h>
>> +#include <asm/types.h>
>> +
>> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
>> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
>> +
>> +static inline bool is_ffa_fid(uint32_t fid)
>> +{
>> +    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
>> +
>> +    return fn >= FFA_FNUM_MIN_VALUE && fn <= FFA_FNUM_MAX_VALUE;
>> +}
>> +
>> +#ifdef CONFIG_FFA
>> +#define FFA_NR_FUNCS    12
>> +#else
>> +#define FFA_NR_FUNCS    0
>> +#endif
>> +
>> +#endif /*__ASM_ARM_TEE_FFA_H__*/
>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>> index 392169b2559d..923f08ba8cb7 100644
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -8,3 +8,14 @@ config OPTEE
>>   virtualization-enabled OP-TEE present. You can learn more
>>   about virtualization for OP-TEE at
>>   https://optee.readthedocs.io/architecture/virtualization.html
>> +
>> +config FFA
>> + bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>> + default n
>> + depends on ARM_64
> 
> Even if the tee Makefile is only included if CONFIG_TEE is activated,
> the missing dependency on TEE here allows to select FFA without TEE
> resulting in a config with FFA activated but not compiled in.
> 
> No build error is coming from this, FFA is just not in if selected without TEE.
> 
> Should be:
> 
> depends on ARM_64 && TEE
> 
> I am ok if this is fixed on commit and my R-B kept.

I have fixed it and committed up to patch #9. That said, I think it 
would be best if we have a category TEE where both the OPTEE and FFA 
config is under. This will help to make the menuconfig clearer and avoid 
the "depends TEE".

Bertrand, Jens, can one of you have a look?

Cheers,

-- 
Julien Grall

