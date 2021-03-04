Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D9A32CE92
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 09:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93052.175611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHjRZ-0001eF-6V; Thu, 04 Mar 2021 08:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93052.175611; Thu, 04 Mar 2021 08:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHjRZ-0001dq-2j; Thu, 04 Mar 2021 08:34:49 +0000
Received: by outflank-mailman (input) for mailman id 93052;
 Thu, 04 Mar 2021 08:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHjRX-0001dl-Kv
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 08:34:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b8f25ac-40e6-4eb5-954f-cba9451488cf;
 Thu, 04 Mar 2021 08:34:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2285EAD87;
 Thu,  4 Mar 2021 08:34:45 +0000 (UTC)
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
X-Inumbo-ID: 5b8f25ac-40e6-4eb5-954f-cba9451488cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614846885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0MY4nLW/KZYUIkQoS7r900zeWrKxEpze568X7juTKQ=;
	b=uoE72CDeY4f0UX2mSekTNBKAC1/k2B1kK7/cbvsOzcQqslAPGl4p4BfY8VVGGEri8v0sJn
	5QCirdBe6CUwwrZ3u8hoZ3xfh7vSb0AONqq2KXX7oz82h5KOQewt+nPk2WJJ5A3JBRntK6
	5WvezQoodWGEx70+lFK4GpQNns0Enxk=
Subject: Re: dom0less boot two compressed kernel images out-of-memory
 work-around
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Charles Chiou <cchiou@ambarella.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c1b3f92388c34788b76193b70c150521@ambarella.com>
 <58aaf68f-4499-9400-6eb2-f1ad3b620c73@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <511603c8-40b4-5e22-7eba-7722d89895fe@suse.com>
Date: Thu, 4 Mar 2021 09:34:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <58aaf68f-4499-9400-6eb2-f1ad3b620c73@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.03.2021 20:36, Julien Grall wrote:
> (BCCing xen-users, CCing xen-devel + a few folks)
> 
> Hi,
> 
> Moving the discussion to xen-devel.
> 
> On 22/02/2021 05:02, Charles Chiou wrote:
>> When trying to boot two zImage using dom0less boot on ARM, we encountered this problem when xen runs gunzip on second guest:
>>
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Out of memory
>> (XEN) ****************************************
>>
>> And worked around it with the following patch. We'd like to check to see if this is a known issue and if the work-around looks reasonable. Thank you
> 
> I haven't seen any similar report in the past.
> 
>>
>>
>> diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
>> index db4efcd34b..e5bd19ba7f 100644
>> --- a/xen/common/gunzip.c
>> +++ b/xen/common/gunzip.c
>> @@ -113,8 +113,10 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>>
>>       window = (unsigned char *)output;
>>
>> +    if (!free_mem_ptr) {
>>           free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
>>           free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
>> +    }
>>
>>       inbuf = (unsigned char *)image;
>>       insize = image_len;
>> @@ -131,7 +133,12 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>>           rc = 0;
>>       }
>>
>> +    if (free_mem_ptr) {
>>           free_xenheap_pages((void *)free_mem_ptr, HEAPORDER);
>> +        free_mem_ptr = 0;
>> +    }
>> +
>> +    bytes_out = 0;
>>
>>       return rc;
>> }
>> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
>> index f99c985d61..de96002188 100644
>> --- a/xen/common/inflate.c
>> +++ b/xen/common/inflate.c
>> @@ -244,7 +244,7 @@ static void *INIT malloc(int size)
>>
>>       if (size < 0)
>>           error("Malloc error");
>> -    if (!malloc_ptr)
>> +    if ((!malloc_ptr) || (!malloc_count))
>>           malloc_ptr = free_mem_ptr;
>>
> 
> IMHO, this is a bit risky to assume that malloc_count will always be 0 
> after each gunzip.
> 
> Instead I think, it would be better if we re-initialize the allocator 
> every time.

I agree.

> How about the following (untested):
> 
> commit e1cd2d85234c8d0aa62ad32c824a5568a57be930 (HEAD -> dev)
> Author: Julien Grall <jgrall@amazon.com>
> Date:   Wed Mar 3 19:27:56 2021 +0000
> 
>      xen/gunzip: Allow perform_gunzip() to be called multiple times
> 
>      Currently perform_gunzip() can only be called once because the the
>      internal allocator is not fully re-initialized.
> 
>      This works fine if you are only booting dom0. But this will break when
>      booting multiple using the dom0less that uses compressed kernel images.
> 
>      This can be resolved by re-initializing malloc_ptr and malloc_count
>      every time perform_gunzip() is called.
> 
>      Note the latter is only re-initialized for hardening purpose as 
> there is
>      no guarantee that every malloc() are followed by free() (It should in
>      theory!).
> 
>      Take the opportunity to check the return of alloc_heap_pages() to 
> return
>      an error rather than dereferencing a NULL pointer later on failure.
> 
>      Reported-by: Charles Chiou <cchiou@ambarella.com>
>      Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
>      ---
> 
>      This patch is candidate for Xen 4.15. Without this patch, it will 
> not be
>      possible to boot multiple domain using dom0less when they are using
>      compressed kernel images.

Other decompression methods are unaffected?

> --- a/xen/common/gunzip.c
> +++ b/xen/common/gunzip.c
> @@ -114,7 +114,11 @@ __init int perform_gunzip(char *output, char 
> *image, unsigned long image_len)
>       window = (unsigned char *)output;
> 
>       free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
> +    if ( !free_mem_ptr )
> +        return -ENOMEM;
> +
>       free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
> +    init_allocator();
> 
>       inbuf = (unsigned char *)image;
>       insize = image_len;
> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
> index f99c985d6135..d8c28a3e9593 100644
> --- a/xen/common/inflate.c
> +++ b/xen/common/inflate.c
> @@ -238,6 +238,12 @@ STATIC const ush mask_bits[] = {
>   static unsigned long INITDATA malloc_ptr;
>   static int INITDATA malloc_count;
> 
> +static void init_allocator(void)

Please add INIT here. (I wouldn't mind if you used __init instead,
as there's going to be file-wide replacement after 4.15 anyway,
but of course this would render things inconsistent until then.)

Jan

> +{
> +    malloc_ptr = free_mem_ptr;
> +    malloc_count = 0;
> +}
> +
>   static void *INIT malloc(int size)
>   {
>       void *p;
> 
> Best regards,
> 


