Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701C2FA635
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69884.125252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XPr-000366-Ix; Mon, 18 Jan 2021 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69884.125252; Mon, 18 Jan 2021 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XPr-00035h-FG; Mon, 18 Jan 2021 16:30:07 +0000
Received: by outflank-mailman (input) for mailman id 69884;
 Mon, 18 Jan 2021 16:30:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1XPp-0002y0-Gi
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:30:05 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c5e067a-8fc3-4b0d-addf-654d284cc66f;
 Mon, 18 Jan 2021 16:30:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id s26so24877873lfc.8
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 08:30:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d11sm1943340lfe.115.2021.01.18.08.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 08:30:02 -0800 (PST)
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
X-Inumbo-ID: 1c5e067a-8fc3-4b0d-addf-654d284cc66f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GCu1j7yLedRBB8GLV9KIi9Ed3tRCd5ondPRDH/MsBtc=;
        b=Ffw4HUVNKY8tu7cRa9bXGBhUG/VoLRjudQlNt2FVo4VsyY9FljHZSMilrYv47pa8+W
         Oz3Waxc6wY+WubJaljE10JROuF4PSLxl4JjymQjrbmikzq5XjXrwdYW5LVDZSmozvT3W
         teyQpWlY24LqD6fafzipbdQEWUqj8N0vqK5ajzHP5Ikot7Y4MUTExPU4gKSd5trGvJQt
         tXOIH/9/1mrzbha7Bo3ucaaagN4zZvBUnBOntYPuhui5RGuwEaaw6Fs/6EoLsykGtGXZ
         fAKZS7jv7xCJoK3cMaICbsyY6HnhJdqhIRKTbj1TfHZrN+h1Y2tRcjs3BwUAhoVzUUr4
         A4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GCu1j7yLedRBB8GLV9KIi9Ed3tRCd5ondPRDH/MsBtc=;
        b=N9WWHR8Tg4MQ3KJEFYi68vHpenThXCG00UsQJgavveYld/jBHG88lBIszWz6XQ9uZr
         zthfE/ER6Pp3QxQXuRfLOIuEpfZUI1GttckqFKahISLFGr8wlPvJ6Ed1U4KssZRkukfK
         gm20aSweJXm5G/YnPOr5Z8OglE4UEMDbjYsprYeURwZkrvQz3aQdNgzPPz+CMCv4wzvg
         epccZ9ed1j6Wyd9cTg7h6X49AQjmzbbcru4wvFgcMOfulaCvW8Qj8uefPguf+70Znrkz
         BfLglBRRQSds7yz42LfZKWf7IeIckzyE/QEJCgq4oNO7T/wVAyZB2kmpyEH+FK7NUiV3
         a1lg==
X-Gm-Message-State: AOAM533TQhInubBdd8kLW1c0QbBRvmx9v4rhOM5D4meVq+vms3ZS2WD4
	TzKhAVfLtlT7uMEkCaSwLTc=
X-Google-Smtp-Source: ABdhPJzumwNwQWWYYSPURpoC2eX/sMjnyHxss30rj28W6TDt8Ll3iI5Y8PxsbMUaPDQYNFmLUP5+ig==
X-Received: by 2002:a05:6512:3092:: with SMTP id z18mr8918207lfd.249.1610987403263;
        Mon, 18 Jan 2021 08:30:03 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <9904062b-cc59-c80e-50fa-ea932c8a9bd5@suse.com>
 <758fea3f-8a67-7541-1fa6-cf9898b4c336@gmail.com>
 <6c230830-7b3a-6339-ad23-1c975c058591@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2310c92a-3f82-b419-53b9-47e9a5f829c7@gmail.com>
Date: Mon, 18 Jan 2021 18:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c230830-7b3a-6339-ad23-1c975c058591@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.01.21 18:00, Jan Beulich wrote:

Hi Jan

> On 18.01.2021 16:52, Oleksandr wrote:
>> On 18.01.21 12:44, Jan Beulich wrote:
>>> On 17.01.2021 18:11, Oleksandr wrote:
>>>> On 15.01.21 22:26, Julien Grall wrote:
>>>>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>>>>>> --- a/xen/arch/arm/io.c
>>>>>> +++ b/xen/arch/arm/io.c
>>>>>> @@ -16,6 +16,7 @@
>>>>>>      * GNU General Public License for more details.
>>>>>>      */
>>>>>>     +#include <xen/ioreq.h>
>>>>>>     #include <xen/lib.h>
>>>>>>     #include <xen/spinlock.h>
>>>>>>     #include <xen/sched.h>
>>>>>> @@ -23,6 +24,7 @@
>>>>>>     #include <asm/cpuerrata.h>
>>>>>>     #include <asm/current.h>
>>>>>>     #include <asm/mmio.h>
>>>>>> +#include <asm/hvm/ioreq.h>
>>
>> Note to self:
>>
>> Remove obsolete bool ioreq_complete_mmio(void) from asm-arm/hvm/ioreq.h
>>
>>
>>
>>>>> Shouldn't this have been included by "xen/ioreq.h"?
>>>> Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it turned
>>>> out that there was nothing inside common header required arch one to be
>>>> included and
>>>> I was asked to include arch header where it was indeed needed (several
>>>> *.c files).
>>> I guess the general usage model of the two headers needs to be
>>> established first: If the per-arch header declares only stuff
>>> needed by the soon common/ioreq.c, then indeed it should be
>>> only that file and the producer(s) of the arch_*() functions
>>> which include that header; it should then in particular not be
>>> included by xen/ioreq.h.
>>>
>>> However, with the change request on patch 1 I think that usage
>>> model goes away at least for now, at which point the question
>>> is what exactly the per-arch header still declares, and based
>>> on that it would need to be decided whether xen/ioreq.h
>>> should include it.
>> ok, well.
>>
>> x86's arch header now contains few IOREQ_STATUS_* #define-s, but Arm's
>> contains more stuff
>> besides that:
>> - stuff which is needed by common/ioreq.c, mostly stubs which are not
>> implemented yet (handle_pio, etc)
>> - stuff which is not needed by common/ioreq.c, internal Arm bits
>> (handle_ioserv, try_fwd_ioserv)
>>
>> Could we please decide based on the information above?
> You're in the best position to tell. The IOREQ_STATUS_* you
> mention may require including from xen/ioreq.h, but as said,
> ...
>
>>>>>> --- a/xen/include/asm-arm/domain.h
>>>>>> +++ b/xen/include/asm-arm/domain.h
>>>>>> @@ -10,6 +10,7 @@
>>>>>>     #include <asm/gic.h>
>>>>>>     #include <asm/vgic.h>
>>>>>>     #include <asm/vpl011.h>
>>>>>> +#include <public/hvm/dm_op.h>
>>>>> May I ask, why do you need to include dm_op.h here?
>>>> I needed to include that header to make some bits visible
>>>> (XEN_DMOP_IO_RANGE_PCI, struct xen_dm_op_buf, etc). Why here - is a
>>>> really good question.
>>>> I don't remember exactly, probably I followed x86's domain.h which also
>>>> included it.
>>>> So, trying to remove the inclusion here, I get several build failures on
>>>> Arm which could be fixed if I include that header from dm.h and ioreq.h:
>>>>
>>>> Shall I do this way?
>>> The general rule ought to be that header include what they need,
>>> but not more. Header dependencies are quite problematic already,
>>> so every dependency we can avoid (or eliminate) will help. This
>>> goes as far as only forward declaring structure where possible.
>> I got it.
> ... it depends. If xen/ioreq.h needs nothing from asm/ioreq.h,
> the I wouldn't see why it should include it.
>
>>>>>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu
>>>>>> *v) {}
>>>>>>       #define arch_vm_assist_valid_mask(d) (1UL <<
>>>>>> VMASST_TYPE_runstate_update_flag)
>>>>>>     +#define has_vpci(d)    ({ (void)(d); false; })
>>>>>> +
>>>>>>     #endif /* __ASM_DOMAIN_H__ */
>>>>>>       /*
>>>>>> diff --git a/xen/include/asm-arm/hvm/ioreq.h
>>>>>> b/xen/include/asm-arm/hvm/ioreq.h
>>>>>> new file mode 100644
>>>>>> index 0000000..19e1247
>>>>>> --- /dev/null
>>>>>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>>>>> Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ as
>>>>> the IOREQ is now meant to be agnostic?
>>>> Good question... The _common_ IOREQ code is indeed arch-agnostic. But,
>>>> can the _arch_ IOREQ code be treated as really subarch-agnostic?
>>>> I think, on Arm it can and it is most likely ok to keep it in
>>>> "asm-arm/", but how it would be correlated with x86's IOREQ code which
>>>> is HVM specific and located
>>>> in "hvm" subdir?
>>> I think for Arm's sake this should be used as asm/ioreq.h, where
>>> x86 would gain a new header consisting of just
>>>
>>> #include <asm/hvm/ioreq.h>
>>>
>>> as there the functionality is needed for HVM only.
>> For me this sounds perfectly fine. I think, this would also address
>> Julien's question.
>> May I introduce that new header together with moving IOREQ to the common
>> code (patch #4)?
> As with about everything, introduce new things the first time you
> need them, unless this results in overly big patches (in which
> case suitably splitting up is desirable, but of course no always
> possible). IOW if you introduce xen/ioreq.h and it needs to
> include asm/ioreq.h, then of course at this point you also need
> to introduce the asm-x86/ioreq.h wrapper.


Thank you for the clarification.

-- 
Regards,

Oleksandr Tyshchenko


