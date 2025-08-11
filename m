Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843C1B2125F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 18:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077845.1438866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulVbi-0007QF-NZ; Mon, 11 Aug 2025 16:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077845.1438866; Mon, 11 Aug 2025 16:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulVbi-0007OL-L1; Mon, 11 Aug 2025 16:42:46 +0000
Received: by outflank-mailman (input) for mailman id 1077845;
 Mon, 11 Aug 2025 16:42:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulVbh-0007OF-Ag
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 16:42:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulVbg-000A3T-0P;
 Mon, 11 Aug 2025 16:42:44 +0000
Received: from [2a02:8012:3a1:0:2562:7575:7df6:8090]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulVbg-000Ich-0U;
 Mon, 11 Aug 2025 16:42:44 +0000
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
	bh=TYXKIeR5UY0XJjKjs0hkmd5FfNyRMQaQnFcLwobic2Y=; b=r0FvFSATn9WLXHraTo5RR3ZGCM
	KJFW+SXgnLTuQkrro95CXRxRkmrDiQbO2ZxHjwSAGo0B8SYeCTGM6Wz2bUbgIrN5O1z4K0yH3xpih
	ABOg1DklGqnN1S0KnX3TYlDrbbb1YBzrpk2GTDfMh1ILGYiH8Jqnja/g5GmdoZ5cY73k=;
Message-ID: <8bf02122-f5fd-4793-8e78-91eaf38ea8b0@xen.org>
Date: Mon, 11 Aug 2025 17:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] pdx: provide a unified set of unit functions
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-3-roger.pau@citrix.com>
 <5b940bdf-9bc0-49b2-af92-7251b2780c71@xen.org>
 <aJmk1o7sUT2UZJ8M@macbook.local>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aJmk1o7sUT2UZJ8M@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 11/08/2025 09:07, Roger Pau Monné wrote:
> On Fri, Aug 08, 2025 at 06:21:29PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 05/08/2025 10:52, Roger Pau Monne wrote:
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index a77b31071ed8..ba35bf1fe3bb 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -256,9 +256,11 @@ void __init init_pdx(void)
>>>    {
>>>        const struct membanks *mem = bootinfo_get_mem();
>>>        paddr_t bank_start, bank_size, bank_end, ram_end = 0;
>>> -    int bank;
>>> +    unsigned int bank;
>>>    #ifndef CONFIG_PDX_NONE
>>> +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>>> +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
>>>        /*
>>>         * Arm does not have any restrictions on the bits to compress. Pass 0 to
>>>         * let the common code further restrict the mask.
>>> @@ -266,26 +268,24 @@ void __init init_pdx(void)
>>>         * If the logic changes in pfn_pdx_hole_setup we might have to
>>>         * update this function too.
>>>         */
>>> -    uint64_t mask = pdx_init_mask(0x0);
>>> -
>>> -    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>>> -    {
>>> -        bank_start = mem->bank[bank].start;
>>> -        bank_size = mem->bank[bank].size;
>>> -
>>> -        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
>>> -    }
>>> +    pfn_pdx_compression_setup(0);
>>>        for ( bank = 0 ; bank < mem->nr_banks; bank++ )
>>>        {
>>> -        bank_start = mem->bank[bank].start;
>>> -        bank_size = mem->bank[bank].size;
>>> -
>>> -        if (~mask & pdx_region_mask(bank_start, bank_size))
>>> -            mask = 0;
>>> +        if ( !pdx_is_region_compressible(
>>> +                  mem->bank[bank].start,
>>> +                  PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
>>> +                  PFN_DOWN(mem->bank[bank].start)) )
>>
>> This code is a bit too verbose. Can we at least introduce "bank =
>> &mem->bank[bank]" to reduce a bit the verbosity?
> 
> I cannot introduce a `bank` local variable as it's already used as the
> index cursor for the loop.  Would you be fine with:

Ah yes. I am fine with the logic below. I am happy if you want to commit 
message without resending the series.

Cheers,

-- 
Julien Grall


