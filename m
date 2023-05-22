Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1870B8ED
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 11:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537831.837385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11rp-0005Bu-ST; Mon, 22 May 2023 09:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537831.837385; Mon, 22 May 2023 09:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q11rp-00059j-Pq; Mon, 22 May 2023 09:30:13 +0000
Received: by outflank-mailman (input) for mailman id 537831;
 Mon, 22 May 2023 09:30:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q11ro-00059d-0F
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 09:30:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q11rn-00011v-6j; Mon, 22 May 2023 09:30:11 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q11rm-000750-Vz; Mon, 22 May 2023 09:30:11 +0000
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
	bh=UWFr3JaX+KvShznDAaU6+zbb1LXxDxIXNN8txSpwPsw=; b=L1IPjFpTMr8qCxv1TNHU2OiYw6
	A/P/bOHvIO7rB6Kgw1QeN0ko3nLFGMa1aQAayOwaX5ZMaZmVO7Aif326XbUiAorQEj5/GexHCNmlh
	RoHe5PZPLHsYJJuJDYyXNL+SvDfip0FGj+ngCQMjdyKfCg/SkFpbasVwIr2lVB++LmJY=;
Message-ID: <5fb23d0c-dbab-58c3-71d4-f3d5254249fc@xen.org>
Date: Mon, 22 May 2023 10:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
 <a21f2917-052a-ddb5-3de5-1ea58cb55252@suse.com>
 <8A5D1D62-0FCF-4A2F-8B09-D216002D168C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8A5D1D62-0FCF-4A2F-8B09-D216002D168C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/05/2023 09:43, Luca Fancellu wrote:
>> On 22 May 2023, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.05.2023 16:46, Julien Grall wrote:
>>> On 19/05/2023 15:26, Luca Fancellu wrote:
>>>>> On 18 May 2023, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>>>> +/*
>>>>>> + * Arm SVE feature code
>>>>>> + *
>>>>>> + * Copyright (C) 2022 ARM Ltd.
>>>>>> + */
>>>>>> +
>>>>>> +#include <xen/types.h>
>>>>>> +#include <asm/arm64/sve.h>
>>>>>> +#include <asm/arm64/sysregs.h>
>>>>>> +#include <asm/processor.h>
>>>>>> +#include <asm/system.h>
>>>>>> +
>>>>>> +extern unsigned int sve_get_hw_vl(void);
>>>>>> +
>>>>>> +register_t compute_max_zcr(void)
>>>>>> +{
>>>>>> +    register_t cptr_bits = get_default_cptr_flags();
>>>>>> +    register_t zcr = vl_to_zcr(SVE_VL_MAX_BITS);
>>>>>> +    unsigned int hw_vl;
>>>>>> +
>>>>>> +    /* Remove trap for SVE resources */
>>>>>> +    WRITE_SYSREG(cptr_bits & ~HCPTR_CP(8), CPTR_EL2);
>>>>>> +    isb();
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Set the maximum SVE vector length, doing that we will know the VL
>>>>>> +     * supported by the platform, calling sve_get_hw_vl()
>>>>>> +     */
>>>>>> +    WRITE_SYSREG(zcr, ZCR_EL2);
>>>>>
>>>>>  From my reading of the Arm (D19-6331, ARM DDI 0487J.a), a direct write to a system register would need to be followed by an context synchronization event (e.g. isb()) before the software can rely on the value.
>>>>>
>>>>> In this situation, AFAICT, the instruciton in sve_get_hw_vl() will use the content of ZCR_EL2. So don't we need an ISB() here?
>>>>
>>>>  From what I’ve read in the manual for ZCR_ELx:
>>>>
>>>> An indirect read of ZCR_EL2.LEN appears to occur in program order relative to a direct write of
>>>> the same register, without the need for explicit synchronization
>>>>
>>>> I’ve interpreted it as “there is no need to sync before write” and I’ve looked into Linux and it does not
>>>> Appear any synchronisation mechanism after a write to that register, but if I am wrong I can for sure
>>>> add an isb if you prefer.
>>>
>>> Ah, I was reading the generic section about synchronization and didn't
>>> realize there was a paragraph in the ZCR_EL2 section as well.
>>>
>>> Reading the new section, I agree with your understanding. The isb() is
>>> not necessary.
>>
>> And RDVL counts as an "indirect read"? I'm pretty sure "normal" SVE insn
>> use is falling in that category, but RDVL might also be viewed as more
>> similar to MRS in this regard? While the construct CurrentVL is used in
>> either case, I'm still not sure this goes without saying.
> 
> Hi Jan,
> 
> Looking into the Linux code, in function vec_probe_vqs(...) in arch/arm64/kernel/fpsimd.c,
> ZCR_EL1 is written, without synchronisation, and afterwards RDVL is used.

You are making the assumption that the Linux code is correct. It is 
mostly likely the case, but in general it is best to justify barriers 
based on the Arm Arm because it is authoritative.

In this case, the Arm Arm is pretty clear on the difference between 
indirect read and direct read (see D19-63333 ARM DDI 0487J.A). The 
latter only refers to use of the instruction of MRS. RDVL is its own 
instruction and therefore this is an indirect read.

Cheers,

-- 
Julien Grall

