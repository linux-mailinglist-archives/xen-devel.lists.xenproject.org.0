Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05B1CF678
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVZW-0007Z6-3E; Tue, 12 May 2020 14:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYVZV-0007Z1-GL
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:07:49 +0000
X-Inumbo-ID: f5c65852-9459-11ea-a2af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5c65852-9459-11ea-a2af-12813bfff9fa;
 Tue, 12 May 2020 14:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F3CDAA7C;
 Tue, 12 May 2020 14:07:50 +0000 (UTC)
Subject: Re: [PATCH 07/16] x86/shstk: Re-layout the stack block for shadow
 stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-8-andrew.cooper3@citrix.com>
 <8b6e03ee-545d-eada-457e-79c183a72d6d@suse.com>
 <51eca0a6-48ff-9169-2c41-c1cadace1d02@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad8a9e10-62a5-c107-3c61-56a8e1eb0bac@suse.com>
Date: Tue, 12 May 2020 16:07:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <51eca0a6-48ff-9169-2c41-c1cadace1d02@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 19:48, Andrew Cooper wrote:
> On 04/05/2020 15:24, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -732,14 +732,14 @@ void load_system_tables(void)
>>>  		.rsp2 = 0x8600111111111111ul,
>>>  
>>>  		/*
>>> -		 * MCE, NMI and Double Fault handlers get their own stacks.
>>> +		 * #DB, NMI, DF and #MCE handlers get their own stacks.
>> Then also #DF and #MC?
> 
> Ok.
> 
>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -6002,25 +6002,18 @@ void memguard_unguard_range(void *p, unsigned long l)
>>>  
>>>  void memguard_guard_stack(void *p)
>>>  {
>>> -    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
>>> -    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>>>  
>>> -    memguard_guard_range(p + IST_MAX * PAGE_SIZE,
>>> -                         STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
>>> +    p += 5 * PAGE_SIZE;
>> The literal 5 here and ...
>>
>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, _PAGE_NONE);
>>>  }
>>>  
>>>  void memguard_unguard_stack(void *p)
>>>  {
>>> -    memguard_unguard_range(p + IST_MAX * PAGE_SIZE,
>>> -                           STACK_SIZE - PRIMARY_STACK_SIZE - IST_MAX * PAGE_SIZE);
>>> -}
>>> -
>>> -bool memguard_is_stack_guard_page(unsigned long addr)
>>> -{
>>> -    addr &= STACK_SIZE - 1;
>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_RW);
>>>  
>>> -    return addr >= IST_MAX * PAGE_SIZE &&
>>> -           addr < STACK_SIZE - PRIMARY_STACK_SIZE;
>>> +    p += 5 * PAGE_SIZE;
>> ... here could do with macro-izing: IST_MAX + 1 would already be
>> a little better, I guess.
> 
> The problem is that "IST_MAX + 1" is now less meaningful than a literal
> 5, because at least 5 obviously matches up with the comment describing
> which page does what.

If you don't like IST_MAX+1, can I at least talk you into introducing
a separate constant? This is the only way to connect together the
various places where it is used. We can't be sure that we're not going
to touch this code anymore, ever. And if we do, it'll help if related
places are easy to spot.

Jan

