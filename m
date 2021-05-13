Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C006137FCFF
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 19:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127023.238673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhFYY-0002cV-BV; Thu, 13 May 2021 17:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127023.238673; Thu, 13 May 2021 17:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhFYY-0002ZZ-8R; Thu, 13 May 2021 17:55:30 +0000
Received: by outflank-mailman (input) for mailman id 127023;
 Thu, 13 May 2021 17:55:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhFYX-0002ZT-8j
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 17:55:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhFYV-0007mi-Nt; Thu, 13 May 2021 17:55:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhFYV-0003tR-HY; Thu, 13 May 2021 17:55:27 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=83YPJzuVB7giuX9ioaeST6gflKL5uVIQXnDpdoZ07PQ=; b=j4YGJHFiJ7UU629Eeg35Y0Fedt
	DMSm5R+bG+gKy6ox79i23e5GZ6ABo3J9+Xgw/t7JHnAuf+GbTjV1aO80rZGt7bF9JokE8iOq4IRWM
	1UYuJRhPgSgWjk2xLeF9c1PXSsCzi0ZJHNq6QkEf51qVcd7/4rGT21GX7ZOJjtQVnbmw=;
Subject: Re: [PATCH RFCv2 09/15] xen/arm32: mm: Re-implement
 setup_xenheap_mappings() using map_pages_to_xen()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-10-julien@xen.org>
 <alpine.DEB.2.21.2105121506300.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b77cd6d4-5cc4-c32e-b728-644f60324e6a@xen.org>
Date: Thu, 13 May 2021 18:55:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105121506300.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 12/05/2021 23:07, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Now that map_pages_to_xen() has been extended to support 2MB mappings,
>> we can replace the create_mappings() call by map_pages_to_xen() call.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>>
>>      TODOs:
>>          - add support for contiguous mapping
>> ---
>>   xen/arch/arm/mm.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 5c17cafff847..19ecf73542ce 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -806,7 +806,12 @@ void mmu_init_secondary_cpu(void)
>>   void __init setup_xenheap_mappings(unsigned long base_mfn,
>>                                      unsigned long nr_mfns)
>>   {
>> -    create_mappings(xen_second, XENHEAP_VIRT_START, base_mfn, nr_mfns, MB(32));
>> +    int rc;
>> +
>> +    rc = map_pages_to_xen(XENHEAP_VIRT_START, base_mfn, nr_mfns,
>> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
>> +    if ( rc )
>> +        panic("Unable to setup the xenheap mappings.\n");
>>   
>>       /* Record where the xenheap is, for translation routines. */
>>       xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> 
> I get the following build error:
> 
> mm.c: In function ‘setup_xenheap_mappings’:
> mm.c:811:47: error: incompatible type for argument 2 of ‘map_pages_to_xen’
>       rc = map_pages_to_xen(XENHEAP_VIRT_START, base_mfn, nr_mfns,
>                                                 ^~~~~~~~
> In file included from mm.c:24:0:
> /local/repos/xen-upstream/xen/include/xen/mm.h:89:5: note: expected ‘mfn_t {aka struct <anonymous>}’ but argument is of type ‘long unsigned int’
>   int map_pages_to_xen(
>       ^~~~~~~~~~~~~~~~
> 
> I think base_mfn needs to be converted to mfn_t

You are right. I think my scripts are build testing arm32 with debug=n. 
I will fix it and respin.

Cheers,

-- 
Julien Grall

