Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB323DABB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 15:28:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3fw2-0000Bx-P3; Thu, 06 Aug 2020 13:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3fw2-0000Bs-04
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 13:27:54 +0000
X-Inumbo-ID: 23dd9a41-138b-4a43-aa50-a4da4c5708de
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23dd9a41-138b-4a43-aa50-a4da4c5708de;
 Thu, 06 Aug 2020 13:27:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c15so8808549lfi.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AFNf1CHEaQX3/Ff6dZ20hSWg+v+SYrJPNYYJhhp5oAU=;
 b=HqDqLihpLFKSrLKu4XSokEx1eEt2tz6oyMQjkNEP3mbqq7/HqrGBbVFQOL3txfC4Pt
 lTxn44IeiXP1THu1P7Hq4ctVWP+e0MKxxniTPVlRG59IhGUCsMtrVhSB2lgjc6CMB1E8
 XRWq24w/SinGUpx/hdFsgQ6AgdEi8dgKZideXtvGfxR7vwxbHZklSNk7OZYyIwl+UJtt
 1gYdTihDOpWAeaW1d8HTiduCJ2ynBlNkpPVGMmiL4Cr1cVsQ7EdTJLsFmawLTkirrWNm
 KZbHi/I5dLkT+1d9YXSvqYN1HmDD3PHmEtoT/+4PWDlNYsxhCZErEUnMwFIN8a4GuIgs
 7PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AFNf1CHEaQX3/Ff6dZ20hSWg+v+SYrJPNYYJhhp5oAU=;
 b=E4Nxa5MJn/uSCO7hD5rLfmQRVjBB9yda3UwKp0NpwCc7v3I3xQZyDOR4CGpWOl7RYZ
 9Src1uhUtxhkJ/sB80MoIUoyxK/jCnVfmubj+PAop4dhPKTHqnOMqKQEwtxg1s3VCfGt
 CkZ2rOFRgFa4UwMPjSUTBriwsB0MECFggDfSdfQ+NkExFySP/zdWvLUkvIzVeTzvvQ9N
 HWlk4p+tXgCRJbKpwFBwOReO3i49ZSdKj191yMpiv/Nit8uKqExREXPlOc4kZO66/v5d
 /8ndb3Cc4tXYrhBJm9UByOtKe1lQBr0KxCl3q/mzonlSMDBwWWXhlcKuXUKZLpNVo3pm
 pfJw==
X-Gm-Message-State: AOAM531O1BpjtdpX6UyppHdmYM5c89Sd1F++HCO6Sa/Ks5DlgnI3OLTe
 06BJhqY6YOd8o7vyR826Wco=
X-Google-Smtp-Source: ABdhPJyFWONz2LqDVd9oQHKJNYX4EV8KtEiYIc8CjqGRUu1U6wNQEclvRvyfcO132RStx2E3g/ZKkg==
X-Received: by 2002:ac2:546f:: with SMTP id e15mr4052062lfn.133.1596720471343; 
 Thu, 06 Aug 2020 06:27:51 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t1sm2699655lfc.52.2020.08.06.06.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 06:27:50 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <952392d9-22cc-af66-c1af-f82360b75cf4@gmail.com>
Date: Thu, 6 Aug 2020 16:27:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 06.08.20 14:08, Julien Grall wrote:

Hi Julien

>
>>> What is this function supposed to do?
>> Agree, sounds confusing a bit. I assume it is supposed to complete 
>> Guest MMIO access after finishing emulation.
>>
>> Shall I rename it to something appropriate (maybe by adding ioreq 
>> prefix)?
>
> How about ioreq_handle_complete_mmio()?

For me it sounds fine.



>
>>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>>> index 9283e5e..0000477 100644
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -8,6 +8,7 @@
>>>>    */
>>>>     #include <xen/domain_page.h>
>>>> +#include <xen/hvm/ioreq.h>
>>>>   #include <xen/types.h>
>>>>   #include <xen/lib.h>
>>>>   #include <xen/mm.h>
>>>> @@ -30,10 +31,6 @@
>>>>   #include <public/memory.h>
>>>>   #include <xsm/xsm.h>
>>>>   -#ifdef CONFIG_IOREQ_SERVER
>>>> -#include <xen/hvm/ioreq.h>
>>>> -#endif
>>>> -
>>>
>>> Why do you remove something your just introduced?
>> The reason I guarded that header is to make "xen/mm: Make x86's 
>> XENMEM_resource_ioreq_server handling common" (previous) patch 
>> buildable on Arm
>> without arch IOREQ header added yet. I tried to make sure that the 
>> result after each patch was buildable to retain bisectability.
>> As current patch adds Arm IOREQ specific bits (including header), 
>> that guard could be removed as not needed anymore.
> I agree we want to have the build bisectable. However, I am still 
> puzzled why it is necessary to remove the #ifdef and move it earlier 
> in the list.
>
> Do you mind to provide more details?
Previous patch "xen/mm: Make x86's XENMEM_resource_ioreq_server handling 
common" breaks build on Arm as it includes xen/hvm/ioreq.h which 
requires arch header
to be present (asm/hvm/ioreq.h). But the missing arch header together 
with other arch specific bits are introduced here in current patch. 
Probably I should have rearranged
changes in a way to not introduce #ifdef and then remove it...


>
> [...]
>
>>>> +
>>>> +bool handle_mmio(void);
>>>> +
>>>> +static inline bool handle_pio(uint16_t port, unsigned int size, 
>>>> int dir)
>>>> +{
>>>> +    /* XXX */
>>>
>>> Can you expand this TODO? What do you expect to do?
>> I didn't expect this to be called on Arm. Sorry, I am not sure l have 
>> an idea how to handle this properly. I would keep it unimplemented 
>> until a real reason.
>> Will expand TODO.
>
> Let see how the conversation on patch#1 goes about PIO vs MMIO.

ok


>
>>>
>>>
>>>> +    BUG();
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
>>>> +{
>>>> +    return p->addr;
>>>> +}
>>>
>>> I understand that the x86 version is more complex as it check p->df. 
>>> However, aside reducing the complexity, I am not sure why we would 
>>> want to diverge it.
>>>
>>> After all, IOREQ is now meant to be a common feature.
>> Well, no objections at all.
>> Could you please clarify how could 'df' (Direction Flag?) be 
>> handled/used on Arm?
>
> On x86, this is used by 'rep' instruction to tell the direction to 
> iterate (forward or backward).
>
> On Arm, all the accesses to MMIO region will do a single memory 
> access. So for now, we can safely always set to 0.
>
>> I see that try_fwd_ioserv() always sets it 0. Or I need to just reuse 
>> x86's helpers as is,
>> which (together with count = df = 0) will result in what we actually 
>> have here?
> AFAIU, both count and df should be 0 on Arm.

Thanks for the explanation. The only one question remains where to put 
common helpers hvm_mmio_first_byte/hvm_mmio_last_byte (common io.h?)?


>>>
>>>> +
>>>> +static inline int p2m_set_ioreq_server(struct domain *d,
>>>> +                                       unsigned int flags,
>>>> +                                       struct hvm_ioreq_server *s)
>>>> +{
>>>> +    return -EOPNOTSUPP;
>>>> +}
>>>
>>> This should be defined in p2m.h. But I am not even sure what it is 
>>> meant for. Can you expand it?
>>
>> ok, will move.
>>
>>
>> In this series I tried to make as much IOREQ code common as possible 
>> and avoid complicating things, in order to achieve that a few stubs 
>> were added here. Please note,
>> that I also considered splitting into arch parts. But some functions 
>> couldn't be split easily.
>> This one is called from common hvm_destroy_ioreq_server() with flag 
>> being 0 (which will result in unmapping ioreq server from p2m type on 
>> x86).
>> I could add a comment describing why this stub is present here.
>
> Sorry if I wasn't clear. I wasn't asking why the stub is there but 
> what should be the expected implementation of the function.
>
> In particular, you are returning -EOPNOTSUPP. The only reason you are 
> getting away from trouble is because the caller doesn't check the return.

True.


>
> Would it make sense to have a stub arch_hvm_destroy_ioreq_server()?

With what has been said above, it make sense, will create.


>>>> +
>>>> +static inline void msix_write_completion(struct vcpu *v)
>>>> +{
>>>> +}
>>>> +
>>>> +static inline void handle_realmode_completion(void)
>>>> +{
>>>> +    ASSERT_UNREACHABLE();
>>>> +}
>>>
>>> realmode is very x86 specific. So I don't think this function should 
>>> be called from common code. It might be worth considering to split 
>>> handle_hvm_io_completion() is 2 parts: common and arch specific.
>>
>> I agree with you that realmode is x86 specific and looks not good in 
>> Arm header. 
> It is not a problem of looking good or not. Instead, it is about 
> abstraction. A developper shouldn't need to understand all the other 
> architectures we support in order to follow the common code.
>
>> I was thinking how to split handle_hvm_io_completion() gracefully but 
>> I failed find a good solution for that, so decided to add two stubs 
>> (msix_write_completion and handle_realmode_completion) on Arm. I 
>> could add a comment describing why they are here if appropriate. But 
>> if you think they shouldn't be called from the common code in any 
>> way, I will try to split it.
>
> I am not entirely sure what msix_write_completion is meant to do on 
> x86. Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could 
> help?
>
> Regarding handle_realmode_completion, I would add a new stub:
>
> arch_ioreq_handle_io_completion() that is called from the default case 
> of the switch.
>
> On x86 it would be implemented as:
>
>  switch (io_completion)
>  {
>     case HVMIO_realmode_completion:
>       ...
>     default:
>       ASSERT_UNREACHABLE();
>  }
>
> On Arm, it would be implemented as:
>
>   ASSERT_UNREACHABLE();


Good point, will update.


-- 
Regards,

Oleksandr Tyshchenko


