Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ABE9F7156
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 01:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860768.1272756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO4Hk-0006Tc-Et; Thu, 19 Dec 2024 00:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860768.1272756; Thu, 19 Dec 2024 00:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO4Hk-0006RX-CE; Thu, 19 Dec 2024 00:21:00 +0000
Received: by outflank-mailman (input) for mailman id 860768;
 Thu, 19 Dec 2024 00:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+GM=TM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tO4Hi-0006RN-Eu
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 00:20:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dae5aee-bd9f-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 01:20:57 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3863494591bso136086f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 16:20:57 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661200ae5sm786175e9.17.2024.12.18.16.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 16:20:55 -0800 (PST)
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
X-Inumbo-ID: 1dae5aee-bd9f-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734567656; x=1735172456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pxGK6h4H66Egfx0J8LK6VTpbKmkU4MTj87CRDk+DtAE=;
        b=CCV8p436AmcGnKaWjFQ7o3TsYP1HuQBCAOBVwcJXv0QwlB2wLnSLR0ojR1TXYwvIpL
         mjuxWn9wox3Dc/CktF337zBvoBVgrM/UKDkyBCXEuqTrOMD3zO/1u9wJbB84Ino4l+4J
         M3jJea1nmRwx5Lkcsy/E3rJLCnAr2J2kY3RFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734567656; x=1735172456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxGK6h4H66Egfx0J8LK6VTpbKmkU4MTj87CRDk+DtAE=;
        b=cBeY+A1Vi+udHacEs7kK4ACnsZX5GR7f0AF3QToBioL+wDRcIaFQ7KlJTMRBz1lv9q
         aY/SYr24khosRYHFOmgZqGYZTOtSRUsFxxHJH5TVpjsZGcb6vkCT6xJi8r3+DDYh0InC
         MTQ+UpkwXRrkec9GVTeIxW9HUd7aexKaHUdVgl9bHcatGUNGv5hXTiVMxlj+e9ACrnMF
         sFkehrvOfuZc/OZ54N4kUlHfVXKTn147VC3WCM1ZN3/lKj783hAfhgYz/o2DJagOf7Mt
         dUs+haMvrWggssH1Ti4LcfiztzqKqr1o4ujM8qk7XsdBAc05fprUlRgiHKKgbRRhFoff
         TcKw==
X-Forwarded-Encrypted: i=1; AJvYcCXYu+ODE34V8SQQ4C39iOAuETMyBD2MTxcxi8JqLRU20K7UluEkaeuopFJa3GVbNGavtiP7rjGD8/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYhxs9W0dWRjoC0HitTnR0lI0foZzK+IJraiFXZ5osSbxu7fiN
	xFuFteV22YnR4khP+yivfLAkAqPGFEfSjLLj/NqWCu+oN9RBTGQS4Ouo7CtF1wY=
X-Gm-Gg: ASbGncspB9TxZgwjU+fF98cJLgJNUCfYygKdyPCl3rn5O+jIxJKfMSJ8puf5JGHVsXK
	ku/jG0BcSfZPOU4HTyDaxE5m23zT3/IOtBb1Nv8d6l5KPQmMgr1o6ig3C+rPQuQsbP+ISsJumQx
	C7ZhpxjF8/UOkxab37Flz77ARBRaED9yZWEOpp4jCCRpFOIzyBPUTkU7fYlol2b0n1nKD0ZzSZM
	o8+acLHTbkSeYEh7BUbNKF7zVWHr2Zpy/HXK0aofYMQ/Wmg64+aOdWCYVmk3CCf57Z/iAlLBGHu
	dQgZSUpw4BbM9Q3oTh9L
X-Google-Smtp-Source: AGHT+IGpB63hGH6bETDA1DwzQcggTb05+40DCH/gDr4iAOkyT8QBV6+Pg2nCxJMBM+zUJ4zEoGTfqQ==
X-Received: by 2002:a5d:6d09:0:b0:385:fd07:85f8 with SMTP id ffacd0b85a97d-38a19af2014mr1093330f8f.29.1734567656430;
        Wed, 18 Dec 2024 16:20:56 -0800 (PST)
Message-ID: <a49b3be1-4bf4-434b-8260-1d37685d9054@citrix.com>
Date: Thu, 19 Dec 2024 00:20:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
 <9056a92d-8e91-4f2d-a8f3-5cde378f6c6f@suse.com>
 <7aea0e1d-f60c-4e82-8b63-c4e18cbcce85@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7aea0e1d-f60c-4e82-8b63-c4e18cbcce85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/12/2024 4:52 pm, Jan Beulich wrote:
> On 12.12.2024 15:30, Jan Beulich wrote:
>> On 12.12.2024 02:17, Andrew Cooper wrote:
>>> (With the knowledge that this is a disputed Kconfig pattern, and will
>>> need rebasing), the way I want this to work is simply:
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 0de0101fd0bf..5d0a88fb3c3f 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -434,6 +434,9 @@ endif
>>>  
>>>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>>  CFLAGS += -fstack-protector
>>> +ifeq ($(CONFIG_X86),y)
>>> +CFLAGS += -mstack-protector-guard=global
>>> +endif
>>>  else
>>>  CFLAGS += -fno-stack-protector
>>>  endif
>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>>> index 9cdd04721afa..7951ca908b36 100644
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -28,6 +28,7 @@ config X86
>>>         select HAS_PCI_MSI
>>>         select HAS_PIRQ
>>>         select HAS_SCHED_GRANULARITY
>>> +       select HAS_STACK_PROTECTOR if
>>> $(cc-option,-mstack-protector-guard=global)
>>>         select HAS_UBSAN
>>>         select HAS_VMAP
>>>         select HAS_VPCI if HVM
>>>
>>>
>>>
>>> Sadly, it doesn't build.  I get a handful of:
>>>
>>> prelink.o: in function `cmdline_parse':
>>> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>> --no-relax
>>> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
>>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>>> --no-relax
>>>
>>> which is more toolchain-whispering than I feel like doing tonight.
>> Imo the root of the problem is that the compiler doesn't itself mark
>> __stack_chk_guard hidden (it does so for __stack_chk_fail, albeit only for
>> 32-bit code), and hence finds it necessary to use @gotpcrel to access the
>> variable. Even if the linker managed to relax all of these, it would then
>> still be less efficient compared to direct RIP-relative accesses.
>>
>> I also can't see how we might be able to override the compiler's internal
>> declaration to mark it hidden (the same appears to be true for other items
>> the declares internally, like the retpoline thunks or even strcmp() et al).
>> Passing -fvisibility=hidden doesn't make a difference (just as another
>> data point).
>>
>> Playing with -fstack-protector* flavors, I observe:
>> - -fstack-protector causing several failures, like you observed, oddly
>>   enough exclusively from __init functions,
>> - -fstack-protector-all and -fstack-protector-strong each causing a single
>>   (but respectively different) failure, for apparently random non-__init
>>   functions.
>> Taking this together it very much smells like a linker issue. I'll see
>> about checking there further.
> The oddity with how many diags show up is down to internals of the linker.
> It processes a single input section in full (continuing over this specific
> type of error), but will stop processing afterwards if any such error was
> encountered.
>
> The issue itself is a wrong assumption in the linker: It believes that it
> would only ever build small-model code when encountering this kind of
> relocation, and when not linking a shared library or PIE. With this
> assumption it converts the relocation resulting from @gotpcrel to
> R_X86_64_32S (converting the MOV from GOT to MOV $imm), which of course
> overflows when later trying to actually resolve it. What I'm yet to
> understand is why it doesn't use R_X86_64_PC32 (also) in such a situation
> (it does e.g. when building a shared library).
>
> While so far I didn't try it, using --no-relax is presumably not an option,
> as I expect that it'll leave us with a non-empty .got. Plus I didn't even
> start looking into how the xen.efi linking would deal with the ELF-specific
> gotpcrel relocs; the concept of GOT doesn't exist in PE/COFF, after all.
>
> While the linker certainly wants fixing, I continue to think that getting
> the compiler side right would yield the better overall result.

Ok, so what precisely needs doing here?

For starters, I guess __stack_chk_guard wants to respect
-fvisibilty=hidden and/or #pragma.  I can see why it wouldn't want to in
regular userspace, but we're not that.

There's clearly also an LD error (bad assumptions about model).

How many other bugs need opening in the various bugzillas?

~Andrew

