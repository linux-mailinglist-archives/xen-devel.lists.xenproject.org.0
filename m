Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E53099A89B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 18:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817276.1231339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szIAm-00026H-RS; Fri, 11 Oct 2024 16:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817276.1231339; Fri, 11 Oct 2024 16:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szIAm-00024a-Og; Fri, 11 Oct 2024 16:07:24 +0000
Received: by outflank-mailman (input) for mailman id 817276;
 Fri, 11 Oct 2024 16:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPWD=RH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1szIAl-00024U-DN
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 16:07:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e53a9bb4-87ea-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 18:07:21 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso2763492a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 09:07:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99c9a893casm43483966b.104.2024.10.11.09.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 09:07:19 -0700 (PDT)
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
X-Inumbo-ID: e53a9bb4-87ea-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728662840; x=1729267640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kTLAyTLsn9t+Viba1EJq5yv57ZCZ9nl3h4qXMHRNFgs=;
        b=nGyrnYnU+DfBvhSwGQRgTRRP6l95ULe6M4aqlOPUmXXuGVPm+ZGBQLywVSvvGGIfYt
         YZCkC93KdsKRYZL8Rt9VdCJK493HTx7w68Xy6prxv3J7ldN+33PfQXZQNS21oXGAUGPH
         mUBgOThYoGNN8HLR9Tve0xsk7Ff1ZjE8EUlAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728662840; x=1729267640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTLAyTLsn9t+Viba1EJq5yv57ZCZ9nl3h4qXMHRNFgs=;
        b=Xi/6myHQ7EGJeoWv2jha8HSpxUoPeN20qA/7lzvovnBFjEeiU9j0/MekS/Wjsla4sh
         NwbqL9V7NkTyulTURqS3ews/Wr6Piiri7FZFEnz3kSH145fDh+G/y0FB3L1b9yG0zOfH
         MhT2h8aqT/8afENWq+8e0CvEcRCQPO5zBNuna05IFx3XEGKIGHpHrztuIUH2EYd0mMP4
         QAsSjiTzqmdfEeMswnIwUyhyN5gj1f24pptK7+qw4fw0wc3Udji/RU3ovERtpvXPHNrc
         zJZt/TP4m4wngBxr27zIAt18Y+88I+SztEUsrJuYjNNZYjwrXVz5bxvh3DUNieoI1vKI
         8owg==
X-Gm-Message-State: AOJu0YwV4GhZppPyfeQWmi3chSIpFEI6JlmMUr56LGzdpmcwDNQF2Ogu
	TG9WrgUgjZtIo0T5w2bxObyyHG1U8crhT2S0HWlFr8FxRqLEIKDT4pCtOeHs1VQ=
X-Google-Smtp-Source: AGHT+IEE1is1oUW6Yy2b16qubnSW7XzGyinjwntdbzMoO4dSx5F3SBdi9PIr+ITv/J5rNT7yzODvZQ==
X-Received: by 2002:a17:907:3fa9:b0:a99:d101:fdfc with SMTP id a640c23a62f3a-a99e3e9cabbmr18637866b.65.1728662840473;
        Fri, 11 Oct 2024 09:07:20 -0700 (PDT)
Message-ID: <3b832dca-5f7c-45af-aff1-d5debc7ab7e8@citrix.com>
Date: Fri, 11 Oct 2024 17:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com>
 <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
 <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>
 <wbpdfwa3hgjqkixl7usy7ta3r4337txb5ppvj74oat2no5wk52@sisyzgauolhq>
 <48f0d04a-f1e8-4c00-b71a-42fe035a3d0f@citrix.com>
 <CACHz=ZgRPEWYK8hh-mi+308gYEBbzq=aUE6ic8O1ONeV29-5mQ@mail.gmail.com>
 <D4T2JEKDK7KE.6N9GUPZMAVPC@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D4T2JEKDK7KE.6N9GUPZMAVPC@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2024 4:06 pm, Alejandro Vallejo wrote:
> On Fri Oct 11, 2024 at 2:58 PM BST, Frediano Ziglio wrote:
>> On Fri, Oct 11, 2024 at 2:38 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> On 11/10/2024 2:28 pm, Alejandro Vallejo wrote:
>>>> On Fri, Oct 11, 2024 at 02:08:37PM +0100, Frediano Ziglio wrote:
>>>>> On Fri, Oct 11, 2024 at 1:56 PM Alejandro Vallejo
>>>>> <alejandro.vallejo@cloud.com> wrote:
>>>>>> On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
>>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>>> ---
>>>>>>>  xen/arch/x86/boot/reloc.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
>>>>>>> index e50e161b27..e725cfb6eb 100644
>>>>>>> --- a/xen/arch/x86/boot/reloc.c
>>>>>>> +++ b/xen/arch/x86/boot/reloc.c
>>>>>>> @@ -65,7 +65,7 @@ typedef struct memctx {
>>>>>>>      /*
>>>>>>>       * Simple bump allocator.
>>>>>>>       *
>>>>>>> -     * It starts from the base of the trampoline and allocates downwards.
>>>>>>> +     * It starts on top of space reserved for the trampoline and allocates downwards.
>>>>>> nit: Not sure this is much clearer. The trampoline is not a stack (and even if
>>>>>> it was, I personally find "top" and "bottom" quite ambiguous when it grows
>>>>>> backwards), so calling top to its lowest address seems more confusing than not.
>>>>>>
>>>>>> If anything clarification ought to go in the which direction it takes. Leaving
>>>>>> "base" instead of "top" and replacing "downwards" by "backwards" to make it
>>>>>> crystal clear that it's a pointer that starts where the trampoline starts, but
>>>>>> moves in the opposite direction.
>>>>>>
>>>>> Base looks confusing to me, but surely that comment could be confusing.
>>>>> For the trampoline 64 KB are reserved. Last 4 KB are used as a normal
>>>>> stack (push/pop/call/whatever), first part gets a copy of the
>>>>> trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 = ~54 kb)
>>>>> is used for the copy of MBI information. That "rest" is what we are
>>>>> talking about here.
>>>> Last? From what I looked at it seems to be the first 12K.
>>>>
>>>>    #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
>>>>    #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
>>>>
>>>> To put it another way, with left=lo-addr and right=hi-addr. The code seems to
>>>> do this...
>>>>
>>>>  |<--------------64K-------------->|
>>>>  |<-----12K--->|                   |
> s/12K/4K/
>
> My brain merged the 12bits in the wrong place. Too much bit twiddling.
>
>>>>  +-------------+-----+-------------+
>>>>  | stack-space | mbi | trampoline  |
>>>>  +-------------+-----+-------------+
>>>>                ^  ^
>>>>                |  |
>>>>                |  +-- copied Multiboot info + modules
>>>>                +----- initial memctx.ptr
>>>>
>>>> ... with the stack growing backwards to avoid overflowing onto mbi.
>>>>
>>>> Or am I missing something?
>>> So I was hoping for some kind of diagram like this, to live in
>>> arch/x86/include/asm/trampoline.h with the other notes about the trampoline.
>>>
>>> But, is that diagram accurate?  Looking at
>>        /* Switch to low-memory stack which lives at the end of
>> trampoline region. */
>>        mov     sym_esi(trampoline_phys), %edi
>>        lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
>>        lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
>>        pushl   $BOOT_CS32
>>        push    %eax
>>
>>        /* Copy bootstrap trampoline to low memory, below 1MB. */
>>        lea     sym_esi(trampoline_start), %esi
>>        mov     $((trampoline_end - trampoline_start) / 4),%ecx
>>        rep movsl
>>
>> So, from low to high
>> - trampoline code/data (%edi at beginning of copy is trampoline_phys,
>> %esi is trampoline_start)
>> - space (used for MBI copy)
>> - stack (%esp is set to trampoline_phys + TRAMPOLINE_SPACE +
>> TRAMPOLINE_STACK_SPACE)
>>
>> Frediano
> So it's reversed from what I thought
>
>  |<--------------64K-------------->|
>  |                   |<-----4K---->|
>  +-------------+-----+-------------+
>  |  text-(ish) | mbi | stack-space |
>  +-------------+-----+-------------+
>                   ^                ^
>                   |                |
>                   |                +-- initial memctx.ptr
>                   +------------------- copied Multiboot info + modules
>
>
> Your version of the comment is a definite improvement over the nonsense that
> was there before. Sorry for the noise :)

Today, the pointer that becomes memctx.ptr is phys+SPACE, which does not
include the stack.

So initial memctx.ptr starts immediately below the stack, and the bump
allocator goes backwards (leftwards).

~Andrew

