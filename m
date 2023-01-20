Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BB675183
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:49:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481546.746510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo0n-0006Iq-7M; Fri, 20 Jan 2023 09:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481546.746510; Fri, 20 Jan 2023 09:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo0n-0006H8-4W; Fri, 20 Jan 2023 09:48:41 +0000
Received: by outflank-mailman (input) for mailman id 481546;
 Fri, 20 Jan 2023 09:48:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIo0m-0006H0-9d
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:48:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIo0l-0000t4-Sg; Fri, 20 Jan 2023 09:48:39 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIo0l-0005NL-MZ; Fri, 20 Jan 2023 09:48:39 +0000
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
	bh=Ak93oFN0Mep3PDFkZ4xhG6CurNAM13G69c8JV5YQLRM=; b=se7ubq4esFFwmQOv8IqJUPg/hc
	MW9XqU7RdqOAeKnOMPdfv5ZnhMT1reIXWcY99RCtFoQ15a4eGNuGhd72HBXu/uq69TRKe5OnfXUWS
	cO1soD2n8LexssC2w6kWHEPQcSzxw1Odlpg6fNJ2JtF0e60nY8QZpHUwwKPhP3apFWqY=;
Message-ID: <bd0f1acb-3448-1f59-dcee-7e94972f442a@xen.org>
Date: Fri, 20 Jan 2023 09:48:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 03/11] xen/arm: domain_build: Replace use of paddr_t in
 find_domU_holes()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-4-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191459230.731018@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301191459230.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/01/2023 23:02, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>> bankbase, banksize and bankend are used to hold values of type 'unsigned
>> long long'. This can be represented as 'uint64_t' instead of 'paddr_t'.
>> This will ensure consistency with allocate_static_memory() (where we use
>> 'uint64_t' for rambase and ramsize).
>>
>> In future, paddr_t can be used for 'uin32_t' as well to represent 32bit
>> physical addresses.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> I saw that Julien commented about using unsigned long long. To be
> honest, given that we typically use explicitly-sized integers (which is
> a good thing) 

 From the CODING_STYLE:

"Fixed width types should only be used when a fixed width quantity is
meant (which for example may be a value read from or to be written to a
register)."

This is also how we used it in the Arm port so far.

> and unsigned long long is always uint64_t on all
> architectures, I can see the benefits of using uint64_t here.

 From my understanding of the C spec, the only requirement is that 
"unsigned long long" can fit a 2^64 - 1. So it may technically be bigger 
than 64-bit.

> 
> At the same time, I can see that the reason for change the type here is
> that we are dealing with ULL values, so it would make sense to use
> unsigned long long. >
> I cannot see any big problem/advantages either way, so I am OK with
> this patch. (Julien, if you prefer unsigned long long I am fine with
> that also.)

I don't mind too much here.

> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> 
>> ---
>>
>> Changes from -
>>
>> v1 - Modified the title/commit message from "[XEN v1 6/9] xen/arm: Use 'u64' to represent 'unsigned long long"
>> and moved it earlier.
>>
>>   xen/arch/arm/domain_build.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 33a5945a2d..f904f12408 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1726,9 +1726,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>                                     struct meminfo *ext_regions)
>>   {
>>       unsigned int i;
>> -    paddr_t bankend;
>> -    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
>> -    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
>> +    uint64_t bankend;
>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>       int res = -ENOENT;
>>   
>>       for ( i = 0; i < GUEST_RAM_BANKS; i++ )
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

