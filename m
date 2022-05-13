Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F775269E0
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 21:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328714.551814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npaeY-00055R-HP; Fri, 13 May 2022 19:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328714.551814; Fri, 13 May 2022 19:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npaeY-000522-DS; Fri, 13 May 2022 19:08:42 +0000
Received: by outflank-mailman (input) for mailman id 328714;
 Fri, 13 May 2022 19:08:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npaeX-00051w-48
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 19:08:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npaeW-0007PP-NM; Fri, 13 May 2022 19:08:40 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.8.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npaeW-0003PX-GB; Fri, 13 May 2022 19:08:40 +0000
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
	bh=KRvdFx+56ki4UiDRETogg2OiT5rQP+VKEI7RLMa58kE=; b=mvmCGSxCAsYE4B6e6mnBukQm3t
	W1/3PwD32KhR8acz8OwY/Nm2rDvLwjiqKkDxPk/NU/ZbeMewcmfEC5Jl2Ua7y9dhVglZSlNRr5/M5
	T0bpday+dvr0gFORgn/mBdRtc179aiqOHQD9jf7I8+Cv98tKLAngbQ3IhUXcWpfs/N5Q=;
Message-ID: <27c7c9cb-af5a-22fa-80b8-a2fe383412bf@xen.org>
Date: Fri, 13 May 2022 20:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 05/36] xen/arm: compute LLC way size by hardware
 inspection
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-6-marco.solieri@minervasys.tech>
 <0509b0eb-0f3b-8a26-4202-0011201c3fac@xen.org>
 <9b10c3d3-05d4-c08b-efd6-2cb106f58dea@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9b10c3d3-05d4-c08b-efd6-2cb106f58dea@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/05/2022 15:34, Carlo Nonato wrote:
> Hi Julien

Hi,

> On 09/03/22 21:12, Julien Grall wrote:
>>> +
>>> +
>>> +/* Return the way size of last level cache by asking the hardware */
>>> +static uint64_t get_llc_way_size(void)
>>
>> This will break compilation as you are introducing get_llc_way_size() 
>> but not using it.
>>
>> I would suggest to fold this patch in the next one.
>>
>>> +{
>>> +    uint32_t cache_sel = READ_SYSREG64(CSSELR_EL1);
>>
>> The return type for READ_SYSREG64() is uint64_t. That said, the 
>> equivalent register on 32bit is CSSELR which is 32-bit. So this should 
>> be READ_SYSREG() and the matching type is register_t.
> Since we don't want to support arm32, should I stick with 
> READ_SYSREG64() or switch to the generic one you
> pointed me out?

If this code is meant to only work on 64-bit, then I would prefer if we 
use READ_SYSREG() and register_t (see more below about READ_SYSREG64 vs 
READ_SYSREG()).

>>> +    uint32_t cache_global_info = READ_SYSREG64(CLIDR_EL1);
>>
>> Same remark here. Except the matching register is CLIDR.
>>
>>> +    uint32_t cache_info;
>>> +    uint32_t cache_line_size;
>>> +    uint32_t cache_set_num;
>>> +    uint32_t cache_sel_tmp;
>>> +
>>> +    printk(XENLOG_INFO "Get information on LLC\n");
>>> +    printk(XENLOG_INFO "Cache CLIDR_EL1: 0x%"PRIx32"\n", 
>>> cache_global_info);
>>> +
>>> +    /* Check if at least L2 is implemented */
>>> +    if ( ((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_MASK)
>>
>> This is a bit confusing. cache_global_info is storing CLIDR_* but you 
>> are using macro starting with CTR_*.
>>
>> Did you intend to name the macros CLIDR_*?
>>
>> The same remark goes for the other use of CTR_ below. The name of the 
>> macros should match the register they are meant to be used on.
> You are right for the naming mistakes. Should I add those defines in 
> some specific file or
> can they stay here?

I would define them in arch/arm/include/asm/processor.h where we already 
define all the mask for system registers.

>>> +        == CTR_LOC_NOT_IMPLEMENTED )
>>
>> I am a bit confused this the check here. Shouln't you check that 
>> Ctype2 is notn 0 instead?
> I should check a little bit better how this automatic probing thing 
> actually works
> and we also have to clarify better what is the LLC for us, so that I 
> know what we
> should really test for in this function. Probably you're right though.
>>> +    {
>>> +        printk(XENLOG_ERR "ERROR: L2 Cache not implemented\n");
>>> +        return 0;
>>> +    }
>>> +
>>> +    /* Save old value of CSSELR_EL1 */
>>> +    cache_sel_tmp = cache_sel;
>>> +
>>> +    /* Get LLC index */
>>> +    if ( ((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_CTYPEn_MASK)
>>> +        == CTR_LLC_ON )
>>
>> I don't understand this check. You define CTR_LLC_ON to 1 << 2. So it 
>> would be 0b10. From the field you checked, this value mean "Data Cache 
>> Only". How is this indicating the which level to chose?
>>
>> But then in patch #4 you wrote we will do cache coloring on L2. So why 
>> are we selecting L3?
> 1 << 2 is actually 0b100 which stands for "Unified cache".

Oh yes. Sorry, I miscalculated the field.

>  Still I don't 
> know if this is
> the best way to test what we want.

Would you be able to explain what you want to test?

>>> +        cache_sel = CTR_SELECT_L2;
>>> +    else
>>> +        cache_sel = CTR_SELECT_L3;
>>> +
>>> +    printk(XENLOG_INFO "LLC selection: %u\n", cache_sel);
>>> +    /* Select the correct LLC in CSSELR_EL1 */
>>> +    WRITE_SYSREG64(cache_sel, CSSELR_EL1);
>>
>> This should be WRITE_SYSREG().
>>
>>> +
>>> +    /* Ensure write */
>>> +    isb();
>>> +
>>> +    /* Get info about the LLC */
>>> +    cache_info = READ_SYSREG64(CCSIDR_EL1);
>>> +
>>> +    /* ARM TRM: (Log2(Number of bytes in cache line)) - 4. */
>>
>> From my understanding "TRM" in the Arm world refers to a specific 
>> processor. In this case we want to quote the spec. So we usually say 
>> "Arm Arm".
>>
>>> +    cache_line_size = 1 << ((cache_info & CTR_LINESIZE_MASK) + 4);
>>> +    /* ARM TRM: (Number of sets in cache) - 1 */
>>> +    cache_set_num = ((cache_info >> CTR_SIZE_SHIFT) & CTR_SIZE_MASK) 
>>> + 1;
>>
>> The shifts here are assuming that FEAT_CCIDX is not implemented. I 
>> would be OK if we decide to not support cache coloring on such 
>> platform. However, we need to return an error if a user tries to use 
>> cache coloring on such platform.
>>
> In my understanding, if FEAT_CCIDX is implemented then CCSIDR_EL1 is a 
> 64-bit register.

Technically all the system registers on arm64 are 64-bit registers. That 
said, earlier version of the Arm Arm suggested that some where 32-bit 
when in fact the top bits were RES0.

In Xen, we should try to use register_t and READ_SYSREG() when using 
system register so we don't end up to mask the top by mistake (a future 
revision of the spec may define them).

If the co-processor register is also 64-bit on 32-bit, then we should 
use register_t and READ_SYSREG64().

> So it's just a matter of probing for FEAT_CCIDX and in that case 
> changing the way we access
> that register (since the layout changes too).

Yes. I will review it if you want to implement it. But I am equally fine 
if you just want to add a check and return an error if FEAT_CCIDX is 
implemented.

Cheers,

-- 
Julien Grall

