Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373846C4BB3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513445.794441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyWz-0004dA-2c; Wed, 22 Mar 2023 13:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513445.794441; Wed, 22 Mar 2023 13:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyWy-0004bT-UX; Wed, 22 Mar 2023 13:29:32 +0000
Received: by outflank-mailman (input) for mailman id 513445;
 Wed, 22 Mar 2023 13:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peyWx-0004b7-2G
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peyWq-0006FB-LR; Wed, 22 Mar 2023 13:29:24 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peyWq-00008B-D2; Wed, 22 Mar 2023 13:29:24 +0000
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
	bh=nMXOPjLyhSEzpHCxZ8vLvhkRgVg9InpHiBWRcnqFwVk=; b=iH/LqW3/QdI4bUVBRTaGi+pNzo
	4bP0EkjJMkz0RlKcBSX0uW9yLMifhPA5VSFENXbAGrk6xw8RgsGfq75rqFkgbTlnEQpY3V6SyN14V
	LsPgqfVNKIhIbU/dqlCKm4APay4V4w6WBvVZkyFTFj3Ga20c2rPYsYYZoQA+8B7Dm3ew=;
Message-ID: <ac320354-454f-f6e6-d2b6-a470b66c7ec7@xen.org>
Date: Wed, 22 Mar 2023 13:29:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
 <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
 <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 22/03/2023 06:59, Jan Beulich wrote:
> On 21.03.2023 19:33, Ayan Kumar Halder wrote:
>> On 21/03/2023 16:53, Jan Beulich wrote:
>>> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>>>> On 21/03/2023 14:22, Jan Beulich wrote:
>>>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>>>> course suspicious as well - this ought to be uint32_t.)
>>>> The problem with using uint32_t for paddr_t is that there are instances
>>>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>>>
>>>> For eg , handle_passthrough_prop()
>>>>
>>>>                printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>>>                       " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>>                       kinfo->d->domain_id,
>>>>                       mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>>>
>>>> And in xen/include/xen/page-size.h,
>>>>
>>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>>
>>>> Thus, the resulting types are unsigned long. This cannot be printed
>>>> using %u for PRIpaddr.
>>> Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
>>> when physical addresses are only 32 bits wide?
>>
>> I don't have a strong objection except that this is similar to what
>> linux is doing today.
>>
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12
>>
>>>
>>>> I remember some discussion (or comment) that the physical addresses
>>>> should be represented using 'unsigned long'.
>>> A reference would be helpful.
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html
> 
> I see. I guess this will be okay as long as only 32-bit arches elect to
> use 32-bit physical addresses. Maybe there should be a BUILD_BUG_ON()
> somewhere, accompanied by a suitable comment?

Hmmm... We definitely have 40-bits physical address space on Arm32. In 
fact, my suggestion was not to define paddr_t as unsigned long for 
everyone but only when PHYS_ADDR_T_32 is selected (AFAICT this is what 
is done in this patch).

This is to avoid having to add cast everywhere we are using PAGE_* on 
paddr_t and print it.

That said, I realize this means that for 64-bit, we would still use 
64-bit integer. I view it as a less a problem (at least on Arm) because 
registers are always 64-bit. I am open to other suggestion.

Cheers,

-- 
Julien Grall

