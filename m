Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B85492D0FCF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46402.82354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF9T-0002np-BN; Mon, 07 Dec 2020 11:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46402.82354; Mon, 07 Dec 2020 11:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmF9T-0002nL-7J; Mon, 07 Dec 2020 11:57:59 +0000
Received: by outflank-mailman (input) for mailman id 46402;
 Mon, 07 Dec 2020 11:57:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmF9S-0002nG-95
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:57:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ac48130-bd60-4dbd-b78f-e68f0bd70734;
 Mon, 07 Dec 2020 11:57:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED84DAC9A;
 Mon,  7 Dec 2020 11:57:54 +0000 (UTC)
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
X-Inumbo-ID: 6ac48130-bd60-4dbd-b78f-e68f0bd70734
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607342275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfLKhrz8fJ/V7bJ03ccgql8oqt88qgxVWroOMg1p8Uo=;
	b=X5psbxUb9ovR72AZKEm1xPicqqxBX+0kuCaRsQoRBimu5L9z8tiHc8ly3smiFjFP9tKY6R
	6QgW5JwtY5gBKezy7KM/dQKa6yurCkx0eWVt89MQtYvrPEg8gL19btRE5mqO3qwqmKQefl
	cylL4oEQerjMDwAkcEm3GDkzki8twu8=
Subject: Re: [PATCH v2] x86/vmap: handle superpages in vmap_to_mfn()
To: Hongyan Xia <hx242@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <4a69a1177f9496ad0e3ea77e9b1d5b802bf83b60.1606994506.git.hongyxia@amazon.com>
 <8a3c4749-4275-b632-b3fa-073447acd352@suse.com>
 <8ba50b6c69ca5c61da8e01faabd9eadc020a49b2.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eeb1bef1-fc57-2f73-735c-cd88e48d6d1e@suse.com>
Date: Mon, 7 Dec 2020 12:57:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8ba50b6c69ca5c61da8e01faabd9eadc020a49b2.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 12:54, Hongyan Xia wrote:
> On Mon, 2020-12-07 at 11:11 +0100, Jan Beulich wrote:
>> On 03.12.2020 12:21, Hongyan Xia wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5194,6 +5194,60 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long
>>> v)
>>>          }                                          \
>>>      } while ( false )
>>>  
>>> +/* Translate mapped Xen address to MFN. */
>>> +mfn_t xen_map_to_mfn(unsigned long va)
>>> +{
>>> +#define CHECK_MAPPED(cond_)     \
>>> +    if ( !(cond_) )             \
>>> +    {                           \
>>> +        ASSERT_UNREACHABLE();   \
>>> +        ret = INVALID_MFN;      \
>>> +        goto out;               \
>>> +    }                           \
>>
>> This should be coded such that use sites ...
>>
>>> +    bool locking = system_state > SYS_STATE_boot;
>>> +    unsigned int l2_offset = l2_table_offset(va);
>>> +    unsigned int l1_offset = l1_table_offset(va);
>>> +    const l3_pgentry_t *pl3e = virt_to_xen_l3e(va);
>>> +    const l2_pgentry_t *pl2e = NULL;
>>> +    const l1_pgentry_t *pl1e = NULL;
>>> +    struct page_info *l3page;
>>> +    mfn_t ret;
>>> +
>>> +    L3T_INIT(l3page);
>>> +    CHECK_MAPPED(pl3e)
>>> +    l3page = virt_to_page(pl3e);
>>> +    L3T_LOCK(l3page);
>>> +
>>> +    CHECK_MAPPED(l3e_get_flags(*pl3e) & _PAGE_PRESENT)
>>
>> ... will properly require a statement-ending semicolon. With
>> additionally the trailing underscore dropped from the macro's
>> parameter name
> 
> The immediate solution that came to mind is a do-while construct. Would
> you be happy with that?

Sure.

>>> --- a/xen/include/asm-x86/mm.h
>>> +++ b/xen/include/asm-x86/mm.h
>>> @@ -578,6 +578,7 @@ mfn_t alloc_xen_pagetable_new(void);
>>>  void free_xen_pagetable_new(mfn_t mfn);
>>>  
>>>  l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
>>> +mfn_t xen_map_to_mfn(unsigned long va);
>>
>> This is now a pretty proper companion of map_page_to_xen(), and
>> hence imo ought to be declared next to that one rather than here.
>> Ultimately Arm may also need to gain an implementation.
> 
> Since map_pages_to_xen() is in the common header, are we okay with
> having the declaration but not an implementation on the Arm side in
> this patch? Or do we also want to introduce the Arm implementation in
> this patch?

Just a declaration is fine imo. If a use in common code appears,
it'll still be noticeable at link time that Arm will need to
have an implementation added.

Jan

