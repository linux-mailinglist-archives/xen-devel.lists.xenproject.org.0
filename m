Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337C66BA67
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478500.741737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLqv-0004T4-9l; Mon, 16 Jan 2023 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478500.741737; Mon, 16 Jan 2023 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLqv-0004QI-75; Mon, 16 Jan 2023 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 478500;
 Mon, 16 Jan 2023 09:32:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHLqt-0004QC-J7
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:32:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLqt-0001SZ-AO; Mon, 16 Jan 2023 09:32:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLqt-0004H3-4a; Mon, 16 Jan 2023 09:32:27 +0000
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
	bh=EUmlqLYuI7kybKU7uph9Vinh1iqxbE7SF94BU9Q6j6w=; b=TywtCwmdmgNHEyO8AZmfiq063U
	/ks2x40Ai/iE2Uawf2N2HRGn1laPFOaDV0urAiUOKNoDC8gDo8NOJjz+6IQb/UKgP9KDMIRZt08oH
	1Xft1BTVQNZl9LN0uzZ2U4zW0N1EN0dMA6n1Bz8GI8Dt8ktH1q9v4cCX1TQGFenL+mf0=;
Message-ID: <18b23f77-6d51-0851-5a58-b19d790b09cc@xen.org>
Date: Mon, 16 Jan 2023 09:32:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/14] xen/arm64: mm: Rework switch_ttbr()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-14-julien@xen.org>
 <19559eed-525e-206f-c8ac-f9902f610714@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <19559eed-525e-206f-c8ac-f9902f610714@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/01/2023 09:23, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 13/01/2023 11:11, Julien Grall wrote:
>> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
>> index 798ae93ad73c..2ede4e75ae33 100644
>> --- a/xen/arch/arm/arm64/mm.c
>> +++ b/xen/arch/arm/arm64/mm.c
>> @@ -120,6 +120,36 @@ void update_identity_mapping(bool enable)
>>       BUG_ON(rc);
>>   }
>>
>> +extern void switch_ttbr_id(uint64_t ttbr);
>> +
>> +typedef void (switch_ttbr_fn)(uint64_t ttbr);
>> +
>> +void __init switch_ttbr(uint64_t ttbr)
>> +{
>> +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
> Shouldn't id_addr be of type paddr_t?

No because...

> 
>> +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;

... here it will be used as a virtual address.

>> +    lpae_t pte;
>> +
>> +    /* Enable the identity mapping in the boot page tables */
>> +    update_identity_mapping(true);
> Could you please add an empty line here?

Sure.

Cheers,

-- 
Julien Grall

