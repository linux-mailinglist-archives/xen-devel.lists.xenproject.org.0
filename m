Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695D359FBD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 15:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107833.206100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUr6Y-0004M6-6X; Fri, 09 Apr 2021 13:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107833.206100; Fri, 09 Apr 2021 13:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUr6Y-0004Lk-3A; Fri, 09 Apr 2021 13:23:22 +0000
Received: by outflank-mailman (input) for mailman id 107833;
 Fri, 09 Apr 2021 13:23:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUr6W-0004Lf-Sh
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 13:23:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5ef3842-18e1-47b4-9f26-f06e6da1593a;
 Fri, 09 Apr 2021 13:23:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33800B0D1;
 Fri,  9 Apr 2021 13:23:19 +0000 (UTC)
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
X-Inumbo-ID: c5ef3842-18e1-47b4-9f26-f06e6da1593a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617974599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+GSWSxRnFu2ymxORhPVe2l7To6rRzYw1ekr3JmHBFg=;
	b=JB0iSkiVvMJTxiMDHYKLdPpIuTcI/Koi1YqD8Xna65udZKQ7BiywfMVbR54wOcq9LMQVyj
	oOUx/BuzM8Q5FGgB3W9SaABzIhZ7QIGO4AvxGL9f3+ZZ2yCU6cZENz+7E9WJtEVfH+TpH9
	MhVkuTlWdmoTHzJaTw08tqqU9OLmig4=
Subject: Re: [PATCH 09/11] kexec: avoid effectively open-coding
 xzalloc_flex_struct()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <4ea9c4a3-74c0-1722-fa5d-3930be99ef4a@suse.com>
 <8131c6f5-ed8c-98ae-376a-fe8f7b63a790@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ade021ab-8e9d-600d-b48d-8e251a4c341d@suse.com>
Date: Fri, 9 Apr 2021 15:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <8131c6f5-ed8c-98ae-376a-fe8f7b63a790@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.04.2021 14:54, Andrew Cooper wrote:
> On 08/04/2021 13:21, Jan Beulich wrote:
>> There is a difference in generated code: xzalloc_bytes() forces
>> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
>> actually don't want it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This honestly looks like a backwards step.  In particular, ...
> 
>>
>> --- a/xen/common/kexec.c
>> +++ b/xen/common/kexec.c
>> @@ -463,7 +463,10 @@ static void * alloc_from_crash_heap(cons
>>  /* Allocate a crash note buffer for a newly onlined cpu. */
>>  static int kexec_init_cpu_notes(const unsigned long cpu)
>>  {
>> -    Elf_Note * note = NULL;
>> +    struct elf_notes {
>> +        Elf_Note first;
>> +        unsigned char more[];
>> +    } *notes = NULL;
>>      int ret = 0;
>>      int nr_bytes = 0;
>>  
>> @@ -477,7 +480,8 @@ static int kexec_init_cpu_notes(const un
>>  
>>      /* If we dont care about the position of allocation, malloc. */
>>      if ( low_crashinfo_mode == LOW_CRASHINFO_NONE )
>> -        note = xzalloc_bytes(nr_bytes);
>> +        notes = xzalloc_flex_struct(struct elf_notes, more,
>> +                                    nr_bytes - sizeof(notes->first));
> 
> ... this is far more error prone than the code you replaced, seeing as
> there is now a chance that it can underflow.

You're kidding, aren't you? sizeof_cpu_notes() can't possibly return
a value which would allow underflow here. There would be bigger
issues than the underflow if any such happened, in particular with
any theoretical underflow here simply resulting in the allocation to
fail.

The original code is type-unsafe and requests more alignment than
necessary. Besides objecting to my present way of addressing this,
I would find it rather helpful if you could mention some kind of
alternative you'd consider acceptable. As said in the cover letter,
I think mid-term we ought to do away with xmalloc_bytes(). Hence
some alternative would be needed here anyway.

Jan

