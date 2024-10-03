Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D098F39B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 18:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809635.1222070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOML-0002kh-0T; Thu, 03 Oct 2024 16:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809635.1222070; Thu, 03 Oct 2024 16:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOMK-0002ix-U9; Thu, 03 Oct 2024 16:07:20 +0000
Received: by outflank-mailman (input) for mailman id 809635;
 Thu, 03 Oct 2024 16:07:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1swOMJ-0002ir-SG
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 16:07:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swOMJ-0006RR-8G; Thu, 03 Oct 2024 16:07:19 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swOMJ-000232-1F; Thu, 03 Oct 2024 16:07:19 +0000
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
	bh=K7pDr7WdDNF2ZDrbCrU4uKyUqoTQpWFFGwYm6Dd8TOY=; b=er6b73us+uOBN4NuIdumFHpR6H
	o4hdS0eAkqWbLoiwOq8e1PHl4+hr1BVfWB6J7h+7wBs0s0OuJaIQ3EpgCJoeU5n7POrdw5PVE4BP5
	tC0/0c+UJcL4e5mTo9nm+YjbqWTwwtx/mqFCA5GAtEUzaB3dGzUWn66M1ok5N3nTSiUA=;
Message-ID: <45a70cd4-f7a0-4ef8-ab90-c256ec6e544e@xen.org>
Date: Thu, 3 Oct 2024 17:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
Content-Language: en-GB
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <e713ae46-104a-4414-8ad3-02ca8b0a521d@xen.org>
 <3092497c-8626-4e86-b28a-16594eb2a4f0@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3092497c-8626-4e86-b28a-16594eb2a4f0@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/10/2024 16:27, Andrei Cherechesu wrote:
> Hi Julien,

Hi Andrei,

> On 01/10/2024 12:35, Julien Grall wrote:
>>
>>> , the initialization fails silently, as it's not mandatory.
>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>> are not validated, as the SMC calls are only passed through
>>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>>> running.
>>>
>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>> ---
>>>    xen/arch/arm/Kconfig                |  10 ++
>>>    xen/arch/arm/Makefile               |   1 +
>>>    xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>>    xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>>>    4 files changed, 226 insertions(+)
>>>    create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>>    create mode 100644 xen/arch/arm/scmi-smc.c
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 323c967361..adf53e2de1 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>>          not been emulated to their complete functionality. Enabling this might
>>>          result in unwanted/non-spec compliant behavior.
>>>    +config SCMI_SMC
>>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
>>
>> Strictly speaking you are forwarding SMC from the hardware domain. For Arm, it is dom0 but it doesn't need to.
> 
> Well, SCMI is Arm-specific and so are SMCs, but I agree to change
> to "hardware domain" / "hwdom" in order to keep the language generic.

To clarify, I meant that it would be possible to have an hardware domain 
on Arm. This is not used/implemented today but most of the code is 
adhering to the language. The only reason where we would use dom0 is 
when we explicitely check for domain_id 0 in the code.

[...]

>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = scmi_check_smccc_ver();
>>> +    if ( ret )
>>> +        goto err;
>>> +
>>> +    ret = scmi_dt_init_smccc();
>>> +    if ( ret == -EOPNOTSUPP )
>>> +        return ret;
>>> +    if ( ret )
>>> +        goto err;
>>> +
>>> +    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
>>
>> In the commit message, you said the SCMI subsystem was optional. But here you use XENLOG_ERR. Shouldn't it be a warn or XENLOG_INFO/XENLOG_WARN?
> 
> Well, SCMI is optional, in the sense that if we don't find the
> SCMI firmware node in the host DT, we exit silently (-EOPNOTSUPP)
> and we return right away (no error printed).
> 
> But if we do find the SCMI node, it means that we should initialize
> the SCMI subsystem, right? And if we're trying to do that and we
> find that the DT node is not correctly formatted (i.e. the
> 'arm,smc-id' property), I think we should print an error.

Correct me if I am wrong, but from the doc, I understood that the 
property arm,smc-id is only necessary if the transport is SMC/HVC.

So I don't think we should print an error if it is not found as this is 
effectively optional.

I agree...

> 
> However, I think we shouldn't print an error if we return
> with an error code from scmi_check_smccc_ver(). And the print
> inside scmi_check_smccc_ver() should be a XENLOG_WARN.
> 
> So, I think we should print a XENLOG_ERR only if we figured
> we need to initialize, and we started to do it but it failed.

... with the two other points.

Cheers,

-- 
Julien Grall


