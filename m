Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76C584628
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 21:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377062.610145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH8yl-0007it-7Q; Thu, 28 Jul 2022 19:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377062.610145; Thu, 28 Jul 2022 19:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH8yl-0007fp-49; Thu, 28 Jul 2022 19:15:27 +0000
Received: by outflank-mailman (input) for mailman id 377062;
 Thu, 28 Jul 2022 19:15:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH8yj-0007fj-Nr
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 19:15:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH8yi-0008Ge-QM; Thu, 28 Jul 2022 19:15:24 +0000
Received: from [54.239.6.189] (helo=[192.168.25.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH8yi-0002IT-Ia; Thu, 28 Jul 2022 19:15:24 +0000
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
	bh=6UT7bCaYzyGCe0MEDUH/ypta6gAQtL5TSOWu4dfV2Ug=; b=DPD287kUs48gpxP8wxTDU7qbVv
	Q/rtFMC4OGkAwldP6jdMeCuFstDxGS5m1mG/p3U43u1Y8k/Y9yxSlGCnpszSo8Ob15rvHXYdi60wW
	/deEidMyv21Tawb5Ek+c/Tfmg3GVKgmtdALX8hH2jGI8Dd8i1B50xLIDeRT8+jIVPvps=;
Message-ID: <307cef37-e48f-e66f-3550-85c0c50cbb7e@xen.org>
Date: Thu, 28 Jul 2022 20:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org>
 <25778cc8-b9d3-ac0d-b8e4-9a7be87d44bc@xen.org>
 <CAHUa44EBUE3Xo+YGj+JBu0ebpW+sDmuvXS5i-GO45K-4ZdiSBA@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44EBUE3Xo+YGj+JBu0ebpW+sDmuvXS5i-GO45K-4ZdiSBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/07/2022 07:17, Jens Wiklander wrote:
> On Fri, Jul 8, 2022 at 3:41 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jens,
>>
>> I haven't checked whether the FFA driver is complaint with the spec. I
>> mainly checked whether the code makes sense from Xen PoV.
>>
>> This is a fairly long patch to review. So I will split my review in
>> multiple session/e-mail.
>>
>> On 22/06/2022 14:42, Jens Wiklander wrote:
>>> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
>>> Partition in secure world.
>>>
>>> The implementation is the bare minimum to be able to communicate with
>>> OP-TEE running as an SPMC at S-EL1.
>>>
>>> This is loosely based on the TEE mediator framework and the OP-TEE
>>> mediator.
>>>
>>> [1] https://developer.arm.com/documentation/den0077/latest
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>>    SUPPORT.md                        |    7 +
>>>    tools/libs/light/libxl_arm.c      |    3 +
>>>    tools/libs/light/libxl_types.idl  |    1 +
>>>    tools/xl/xl_parse.c               |    3 +
>>
>> These changes would need an ack from the toolstack maintainers.
> 
> OK, I'll keep them in CC.
> 
>>
>>>    xen/arch/arm/Kconfig              |   11 +
>>>    xen/arch/arm/Makefile             |    1 +
>>>    xen/arch/arm/domain.c             |   10 +
>>>    xen/arch/arm/domain_build.c       |    1 +
>>>    xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/domain.h |    4 +
>>>    xen/arch/arm/include/asm/ffa.h    |   71 ++
>>>    xen/arch/arm/vsmc.c               |   17 +-
>>>    xen/include/public/arch-arm.h     |    2 +
>>>    13 files changed, 1811 insertions(+), 3 deletions(-)
>>>    create mode 100644 xen/arch/arm/ffa.c
>>>    create mode 100644 xen/arch/arm/include/asm/ffa.h
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 70e98964cbc0..215bb3c9043b 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed through.
>>>
>>>    No support for QEMU backends in a 16K or 64K domain.
>>>
>>> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
>>> +
>>> +    Status, Arm64: Tech Preview
>>> +
>>> +There are still some code paths where a vCPU may hog a pCPU longer than
>>> +necessary. The FF-A mediator is not yet implemented for Arm32.
>>> +
>>>    ### ARM: Guest Device Tree support
>>>
>>>        Status: Supported
>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>> index eef1de093914..a985609861c7 100644
>>> --- a/tools/libs/light/libxl_arm.c
>>> +++ b/tools/libs/light/libxl_arm.c
>>> @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>>            return ERROR_FAIL;
>>>        }
>>>
>>> +    config->arch.ffa_enabled =
>>> +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);
>>> +
>>>        return 0;
>>>    }
>>>
>>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>>> index 2a42da2f7d78..bf4544bef399 100644
>>> --- a/tools/libs/light/libxl_types.idl
>>> +++ b/tools/libs/light/libxl_types.idl
>>> @@ -646,6 +646,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>>
>>>        ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>>                                   ("vuart", libxl_vuart_type),
>>> +                               ("ffa_enabled", libxl_defbool),
>>
>> This needs to be accompagnied with a define LIBXL_HAVE_* in
>> tools/include/libxl.h. Please see the examples in the header.
> 
> OK, I'll add something. I'm not entirely sure how this is used so I'm
> afraid it will be a bit of Cargo Cult programming from my side.

The LIBXL_HAVE* by toolstack built on top of libxl (like virtio) to know 
whether a future is supported by the current library.

[...]

>>
>>> +
>>> +static inline uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
>>> +{
>>> +    return (uint64_t)reg0 << 32 | reg1;
>>> +}
>>> +
>>> +static void inline reg_pair_from_64(uint32_t *reg0, uint32_t *reg1,
>>> +                                    uint64_t val)
>>> +{
>>> +    *reg0 = val >> 32;
>>> +    *reg1 = val;
>>> +}
>>
>> Those two functions are the same as optee.c but with a different. I
>> would rather prefer if we avoid the duplication and provide generic
>> helpers in a pre-requisite.
> 
> These functions are trivial but at the same time for a special purpose
> which happens to coincide with the usage in optee.c. I can't find a
> suitable common .h file and creating a new one seems a bit much.

I would implement it in regs.h.

[...]

>>> +        .a4 = pg_count,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +
>>> +    /*
>>> +     * For arm64 we must use 64-bit calling convention if the buffer isn't
>>> +     * passed in our tx buffer.
>>> +     */
>>
>> Can you explain why we would want to use the 32-bit calling convention
>> if addr is 0?
> 
> I was trying to avoid the 64-bit calling convention where possible,

OOI, why are you trying to avoid the 64-bit calling convention?

[...]

-- 
Julien Grall

