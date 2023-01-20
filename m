Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DDA6751AA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481551.746520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo4n-0007gW-O1; Fri, 20 Jan 2023 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481551.746520; Fri, 20 Jan 2023 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo4n-0007ei-KH; Fri, 20 Jan 2023 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 481551;
 Fri, 20 Jan 2023 09:52:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIo4m-0007ec-Qw
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:52:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIo4m-0000xt-HW; Fri, 20 Jan 2023 09:52:48 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIo4m-0005RI-9z; Fri, 20 Jan 2023 09:52:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=/Oaj7xA8wsaFRUomI5eT7IQZAZ7QITj+EhLlBZL0KuA=; b=cgzscaRdM37gV9OWdwJRuYebfq
	fLSw7NjMOZjjIO3v9Vfw3zu+OM4xUSq36wNOx70Z+tsOW6kMr9eyUEWltdFeFlaDwL8EDdGB4yOvV
	hLaYxY/RbA1YBe2j2TQtvID8m0bpljgPBWSdnztfnedp6AmnpbzzyykVLSiakPOgrw6U=;
Message-ID: <4cffb178-1b15-23b4-b69b-1bf01f96ee56@xen.org>
Date: Fri, 20 Jan 2023 09:52:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 03/11] xen/arm: domain_build: Replace use of paddr_t in
 find_domU_holes()
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-4-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191459230.731018@ubuntu-linux-20-04-desktop>
 <bd0f1acb-3448-1f59-dcee-7e94972f442a@xen.org>
In-Reply-To: <bd0f1acb-3448-1f59-dcee-7e94972f442a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/01/2023 09:48, Julien Grall wrote:
> Hi,
> 
> On 19/01/2023 23:02, Stefano Stabellini wrote:
>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>> bankbase, banksize and bankend are used to hold values of type 'unsigned
>>> long long'. This can be represented as 'uint64_t' instead of 'paddr_t'.
>>> This will ensure consistency with allocate_static_memory() (where we use
>>> 'uint64_t' for rambase and ramsize).
>>>
>>> In future, paddr_t can be used for 'uin32_t' as well to represent 32bit
>>> physical addresses.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> I saw that Julien commented about using unsigned long long. To be
>> honest, given that we typically use explicitly-sized integers (which is
>> a good thing) 
> 
>  From the CODING_STYLE:
> 
> "Fixed width types should only be used when a fixed width quantity is
> meant (which for example may be a value read from or to be written to a
> register)."
> 
> This is also how we used it in the Arm port so far.
> 
>> and unsigned long long is always uint64_t on all
>> architectures, I can see the benefits of using uint64_t here.
> 
>  From my understanding of the C spec, the only requirement is that 
> "unsigned long long" can fit a 2^64 - 1. So it may technically be bigger 
> than 64-bit.
> 
>>
>> At the same time, I can see that the reason for change the type here is
>> that we are dealing with ULL values, so it would make sense to use
>> unsigned long long. >
>> I cannot see any big problem/advantages either way, so I am OK with
>> this patch. (Julien, if you prefer unsigned long long I am fine with
>> that also.)
> 
> I don't mind too much here.
> 
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Committed.

Cheers,

-- 
Julien Grall

