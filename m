Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911930F1A6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81250.149782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cXS-0002S5-DT; Thu, 04 Feb 2021 11:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81250.149782; Thu, 04 Feb 2021 11:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cXS-0002Re-A2; Thu, 04 Feb 2021 11:11:06 +0000
Received: by outflank-mailman (input) for mailman id 81250;
 Thu, 04 Feb 2021 11:11:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7cXQ-0002RY-MY
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:11:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b64a12b-aa0b-4d43-9f12-4db73e11581a;
 Thu, 04 Feb 2021 11:11:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFC04B0D2;
 Thu,  4 Feb 2021 11:11:02 +0000 (UTC)
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
X-Inumbo-ID: 2b64a12b-aa0b-4d43-9f12-4db73e11581a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612437063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siaYoyjY1DkXijIWGSAnrTQRHCrDJe7zky9prae3INo=;
	b=C8XNsZcf9ruSCQiIsYxmnpgEFwlEgrPw/QAcYb7M1rP92kTIzrg4eDAwOV4aBtLXDiaHwX
	vjoqLOSmq8g6GayIi4Abkrh6DkTMk9/I+zbv7Ml/EEUc6BRqWcdK1ykcpfozfuXJMfXSQ6
	LzXEjsrpUZ1XxgxMdkUmNRmraRmABfI=
Subject: Re: [PATCH v9 02/11] xen/domain: Add vmtrace_size domain creation
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
 <20210201232703.29275-3-andrew.cooper3@citrix.com>
 <7a27c313-2c7c-8394-3749-e2f4d671fdab@suse.com>
 <c6762201-eceb-39c1-fa2a-4bf2af5e0758@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <981ef00b-9f6a-937a-003a-bb6a394076ca@suse.com>
Date: Thu, 4 Feb 2021 12:11:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c6762201-eceb-39c1-fa2a-4bf2af5e0758@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.02.2021 17:04, Andrew Cooper wrote:
> On 02/02/2021 09:04, Jan Beulich wrote:
>> On 02.02.2021 00:26, Andrew Cooper wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -132,6 +132,56 @@ static void vcpu_info_reset(struct vcpu *v)
>>>      v->vcpu_info_mfn = INVALID_MFN;
>>>  }
>>>  
>>> +static void vmtrace_free_buffer(struct vcpu *v)
>>> +{
>>> +    const struct domain *d = v->domain;
>>> +    struct page_info *pg = v->vmtrace.pg;
>>> +    unsigned int i;
>>> +
>>> +    if ( !pg )
>>> +        return;
>>> +
>>> +    v->vmtrace.pg = NULL;
>>> +
>>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>>> +    {
>>> +        put_page_alloc_ref(&pg[i]);
>>> +        put_page_and_type(&pg[i]);
>>> +    }
>>> +}
>>> +
>>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    struct page_info *pg;
>>> +    unsigned int i;
>>> +
>>> +    if ( !d->vmtrace_size )
>>> +        return 0;
>>> +
>>> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
>>> +                             MEMF_no_refcount);
>>> +    if ( !pg )
>>> +        return -ENOMEM;
>>> +
>>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>>> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>>> +            goto refcnt_err;
>>> +
>>> +    /*
>>> +     * We must only let vmtrace_free_buffer() take any action in the success
>>> +     * case when we've taken all the refs it intends to drop.
>>> +     */
>>> +    v->vmtrace.pg = pg;
>>> +    return 0;
>>> +
>>> + refcnt_err:
>>> +    while ( i-- )
>>> +        put_page_and_type(&pg[i]);
>>> +
>>> +    return -ENODATA;
>> Would you mind at least logging how many pages may be leaked
>> here? I also don't understand why you don't call
>> put_page_alloc_ref() in the loop - that's fine to do prior to
>> the put_page_and_type(), and will at least limit the leak.
>> The buffer size here typically isn't insignificant, and it
>> may be helpful to not unnecessarily defer the freeing to
>> relinquish_resources() (assuming we will make that one also
>> traverse the list of "extra" pages, but I understand that's
>> not going to happen for 4.15 anymore anyway).
>>
>> Additionally, while I understand you're not in favor of the
>> comments we have on all three similar code paths, I think
>> replicating their comments here would help easily spotting
>> (by grep-ing e.g. for "fishy") all instances that will need
>> adjusting once we have figured a better overall solution.
> 
> How is:
> 
>     for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>         if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>             /*
>              * The domain can't possibly know about this page yet, so
> failure
>              * here is a clear indication of something fishy going on.
>              */
>             goto refcnt_err;
> 
>     /*
>      * We must only let vmtrace_free_buffer() take any action in the success
>      * case when we've taken all the refs it intends to drop.
>      */
>     v->vmtrace.pg = pg;
>     return 0;
> 
>  refcnt_err:
>     /*
>      * We can theoretically reach this point if someone has taken 2^43
> refs on
>      * the frames in the time the above loop takes to execute, or
> someone has
>      * made a blind decrease reservation hypercall and managed to pick the
>      * right mfn.  Free the memory we safely can, and leak the rest.
>      */
>     while ( i-- )
>     {
>         put_page_alloc_ref(&pg[i]);
>         put_page_and_type(&pg[i]);
>     }
> 
>     return -ENODATA;
> 
> this?

Much better, thanks. Remains the question of logging the
suspected leak of perhaps many pages. But either way
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

