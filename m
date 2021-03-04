Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539632D0A9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93090.175734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlDX-0004qw-R1; Thu, 04 Mar 2021 10:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93090.175734; Thu, 04 Mar 2021 10:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlDX-0004qX-Nv; Thu, 04 Mar 2021 10:28:27 +0000
Received: by outflank-mailman (input) for mailman id 93090;
 Thu, 04 Mar 2021 10:28:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHlDV-0004qS-Uh
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 10:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHlDV-0000QQ-FT; Thu, 04 Mar 2021 10:28:25 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHlDV-00086q-6b; Thu, 04 Mar 2021 10:28:25 +0000
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
	bh=mNlFm4VQb0yj1aHmxWN+nnGSg9MTFU5612d/9trK7yo=; b=r8ytQ6KB26mfbhMRxY1vY824jH
	04nT3B4/wAugiVlmyIOocsSVYArRfLZIsiE71dSk8ujZIcvPWA33o2go5AxwyHC/SrAeKEp9btRcM
	Gcrh5J6SY8ErIskn1nQqkstJobqcO+dZhlLD/PWZXIHk9axA3EoeQD5djpvO1PH+afq4=;
Subject: Re: dom0less boot two compressed kernel images out-of-memory
 work-around
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Charles Chiou <cchiou@ambarella.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c1b3f92388c34788b76193b70c150521@ambarella.com>
 <58aaf68f-4499-9400-6eb2-f1ad3b620c73@xen.org>
 <511603c8-40b4-5e22-7eba-7722d89895fe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e455c5c9-c660-b11e-71c9-6072c1d40057@xen.org>
Date: Thu, 4 Mar 2021 10:28:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <511603c8-40b4-5e22-7eba-7722d89895fe@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/03/2021 08:34, Jan Beulich wrote:
> On 03.03.2021 20:36, Julien Grall wrote:
>> (BCCing xen-users, CCing xen-devel + a few folks)
>> How about the following (untested):
>>
>> commit e1cd2d85234c8d0aa62ad32c824a5568a57be930 (HEAD -> dev)
>> Author: Julien Grall <jgrall@amazon.com>
>> Date:   Wed Mar 3 19:27:56 2021 +0000
>>
>>       xen/gunzip: Allow perform_gunzip() to be called multiple times
>>
>>       Currently perform_gunzip() can only be called once because the the
>>       internal allocator is not fully re-initialized.
>>
>>       This works fine if you are only booting dom0. But this will break when
>>       booting multiple using the dom0less that uses compressed kernel images.
>>
>>       This can be resolved by re-initializing malloc_ptr and malloc_count
>>       every time perform_gunzip() is called.
>>
>>       Note the latter is only re-initialized for hardening purpose as
>> there is
>>       no guarantee that every malloc() are followed by free() (It should in
>>       theory!).
>>
>>       Take the opportunity to check the return of alloc_heap_pages() to
>> return
>>       an error rather than dereferencing a NULL pointer later on failure.
>>
>>       Reported-by: Charles Chiou <cchiou@ambarella.com>
>>       Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>>       ---
>>
>>       This patch is candidate for Xen 4.15. Without this patch, it will
>> not be
>>       possible to boot multiple domain using dom0less when they are using
>>       compressed kernel images.
> 
> Other decompression methods are unaffected?

Arm is only using gzip so far. I quickly looked through bunzip2 and 
unlz4 (I know there are others), they look fine because they don't 
allocate a large global pool.

We probably want to check the others.

> 
>> --- a/xen/common/gunzip.c
>> +++ b/xen/common/gunzip.c
>> @@ -114,7 +114,11 @@ __init int perform_gunzip(char *output, char
>> *image, unsigned long image_len)
>>        window = (unsigned char *)output;
>>
>>        free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
>> +    if ( !free_mem_ptr )
>> +        return -ENOMEM;
>> +
>>        free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
>> +    init_allocator();
>>
>>        inbuf = (unsigned char *)image;
>>        insize = image_len;
>> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
>> index f99c985d6135..d8c28a3e9593 100644
>> --- a/xen/common/inflate.c
>> +++ b/xen/common/inflate.c
>> @@ -238,6 +238,12 @@ STATIC const ush mask_bits[] = {
>>    static unsigned long INITDATA malloc_ptr;
>>    static int INITDATA malloc_count;
>>
>> +static void init_allocator(void)
> 
> Please add INIT here. (I wouldn't mind if you used __init instead,
> as there's going to be file-wide replacement after 4.15 anyway,
> but of course this would render things inconsistent until then.)

I will use INIT. I will wait a bit before sending the patch formally 
(I'd like a confirmation that it solves the problem reported).

Cheers,

-- 
Julien Grall

