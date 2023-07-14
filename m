Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D95753FF3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 18:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563716.881150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLuU-0001Pe-PV; Fri, 14 Jul 2023 16:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563716.881150; Fri, 14 Jul 2023 16:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLuU-0001MO-MK; Fri, 14 Jul 2023 16:44:50 +0000
Received: by outflank-mailman (input) for mailman id 563716;
 Fri, 14 Jul 2023 16:44:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKLuT-0001MI-BY
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 16:44:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLuS-0007iN-S6; Fri, 14 Jul 2023 16:44:48 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKLuS-0003vJ-L2; Fri, 14 Jul 2023 16:44:48 +0000
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
	bh=MHaiPLNNQxAgcUw20mMmJkVlLrmOPBNeCOcLSNP13Rs=; b=mCeDt+JaAyGaGgl4Ba5t9/+Uxx
	HfaA4k38qXb1392Xc6bD3o+gWqyjGloEPc6exc2Ogp0RiR2CN6mQNs4LGXLX6HAACV5ce0GP/FiDr
	cWP2qQCkKtS42uBMGML0DoFS6hx1PEDCXYUdoWf0ey6J/3Jxc/zC6wlFxB22Wam5binU=;
Message-ID: <e7ff51c6-7408-8b39-e682-e9a973c4b29d@xen.org>
Date: Fri, 14 Jul 2023 17:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
 <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
 <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
 <c070054d-3f92-ecd2-4f04-a97c5a84d3d7@amd.com>
 <c05ac82d-f9bb-5d52-8b7d-df44d9043a66@xen.org>
 <bd6d9646-f0a8-5341-b4ce-7eca1d6153dc@arm.com>
 <93e0e360-d7f2-1987-a0a6-73420c55afcd@xen.org>
 <23275eba-3c1e-a51c-b248-7f7625671750@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23275eba-3c1e-a51c-b248-7f7625671750@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/07/2023 04:12, Penny Zheng wrote:
>>>
>>> Thanks ayan for pointing out that RES0 is not suitable for storing 
>>> software-only flags, agreed.
>>>
>>> Then, maybe we should refine the existing "struct pr_t" to store these
>>> sw bits, like:
>>> ```
>>> typedef union {
>>>      struct {
>>>         uint8_t tran:1; /* Transient region */
>>>         uint8_t p2m_type:4; /* Used to store p2m types.*/
>>
>> Why do you need the p2m_type?
>>
> 
> I inherited the usage from MMU. Right now, in commit "[PATCH v3 46/52] 
> xen/mpu: look up entry in p2m table", we introduce the first usage to
> tell whether it is a valid P2M MPU memory region. In the future,
> we may also use it to check whether it works as RAM region(p2m_ram_rw).

I find a bit odd to use p2m_type to decide whether this is an MPU memory 
region describing guest information. It would make more sense to 
introduce a boolean 'guest' for now. We can add the type if necessary.

> 
>>>      };
>>>      uint8_t bits;
>>> } pr_flags;
>>>
>>> /* MPU Protection Region */
>>> typedef struct {
>>>          prbar_t prbar;
>>>          prlar_t prlar;
>>>      pr_flags flags;
>>> } pr_t;
>>> ```
>>> The drawback is that, considering the padding, "struct pr_t" expands 
>>> from 16 bytes to 24 bytes.
>>
>> For clarifications, pr_t is going to be used to create an array in 
>> Xen, right? If so, what's the expected size of the array?
>>
> 
> Yes, it is going to be an array. And the maximum length is 255.
> MPUIR_EL2 identifies the number of regions supported by the EL2 MPU,
> which is 8-bits wide.
> The original 16 bytes, even with 255 regions at most, will take up
> less than 4KB. One page is enough. The following definition could have 
> covered all scenarios.
> ```
> /* EL2 Xen MPU memory region mapping table. */
> pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>       xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
> ```
Can you explain why you want the array to be page-aligned?

Cheers,

-- 
Julien Grall

