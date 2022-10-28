Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B2611467
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 16:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432110.684837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQHX-0003W8-NZ; Fri, 28 Oct 2022 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432110.684837; Fri, 28 Oct 2022 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQHX-0003Sn-KO; Fri, 28 Oct 2022 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 432110;
 Fri, 28 Oct 2022 14:24:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooQHW-0003Sh-A8
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 14:24:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQHV-0004cI-Ua; Fri, 28 Oct 2022 14:24:21 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQHV-0001RK-OU; Fri, 28 Oct 2022 14:24:21 +0000
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
	bh=n8mWUaMCrfal6nTlLq/FpOO6vnP15u88E+dsM++AM/o=; b=wGtiI39jPFQNUvGtppHRwSnBx8
	47amjH6NIJLHDEvD9txWCu57BKv98I7yXJ/gfjlo+CDmQg1qG3H73mt9IE1wACS+F2M2Bpu2iXGld
	9aDR7/MY1qecO0RkyJ4sstiNequfT8aJTcTfv5SA7zPbmxTOeHnrz24HnixFEZN5gn/E=;
Message-ID: <ef1f549a-d917-b7eb-d2e0-34cf8927f6db@xen.org>
Date: Fri, 28 Oct 2022 15:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 07/12] Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-8-ayankuma@amd.com>
 <c1290406-9ec4-97f7-efad-8279dec39123@xen.org>
 <65168ade-6730-b90b-b927-86535b18bdcb@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65168ade-6730-b90b-b927-86535b18bdcb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/10/2022 15:22, Ayan Kumar Halder wrote:
> 
> On 22/10/2022 12:03, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> I need a clarification.
> 
>>
>> Title: Xen doesn't emulate ICH_LR* (we don't expose them to the 
>> guest). Instead Xen will use the registers and your patch provides 
>> wrappers to use access the registers on 32-bit host.
>>
>> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h 
>>> b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> index 6841d5de43..f3b4dfbca8 100644
>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>> @@ -62,9 +62,61 @@
>>>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>>>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>>>   +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
>>> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
>>> +
>>> +#define READ_SYSREG_LR(INDEX)    ((((uint64_t) \
>>> + (READ_SYSREG(ICH_LRC_REG(INDEX)))) << 32) | \
>>> + (READ_SYSREG(ICH_LR_REG(INDEX))))
>>
>> This is a bit dense to read. Also, we should use READ_CP64() when 
>> dealing with arm32 only code. So how about (formatting will need to be 
>> done):
>>
>> #define READ_SYSREG_LR(INDEX) ({   \
>>     uint32_t lrc_ = READ_CP64(ICH_LRC_REG(INDEX)); \
>>     uint32_t lr_ = READ_CP64(ICH_LR_REG(INDEX));   \
>>                                                    \
> 
> I think this looks incorrect. These are read using 'mrc' so they should 
> be READ_CP32(). They are 32 bit registers.

That's my mistake. We should use...

> 
> However, READ_SYSREG is defined as READ_CP32(), so should we use 
> READ_CP32() or READ_SYSREG() ?

READ_CP32() instead of READ_SYSREG() for arm32 specific code. The latter 
is only provided to avoid #ifdef in the common code.

Cheers,

-- 
Julien Grall

