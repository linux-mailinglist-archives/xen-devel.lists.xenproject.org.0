Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A396FC53
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 21:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792024.1202077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smev6-0004eF-Lh; Fri, 06 Sep 2024 19:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792024.1202077; Fri, 06 Sep 2024 19:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smev6-0004be-Ia; Fri, 06 Sep 2024 19:47:00 +0000
Received: by outflank-mailman (input) for mailman id 792024;
 Fri, 06 Sep 2024 19:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smev6-0004bY-5A
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 19:47:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b8c7c5-6c88-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 21:46:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso250888366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 12:46:56 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038c0asm313642566b.62.2024.09.06.12.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 12:46:54 -0700 (PDT)
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
X-Inumbo-ID: c5b8c7c5-6c88-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725652016; x=1726256816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e+NzuGBUO1E9lZH7yhlYmY3QhJYDO9gtLScuQfkmYSk=;
        b=b5QTmFzLQy8oY1x9HUXR1tYMYMliKCfGlRqf+u++IWTalukD0mMouqzC+ym9Ky4Qkg
         zihlUb9eSQRciuL8tCZEXYnRypdJj2Do0xlz2PL0+xlrAL8ch8P3JpzbrOnnJNQ7+Xoe
         twMRSk8CiT2T/swvhOVzQMv+JyseVecd9y314=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725652016; x=1726256816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+NzuGBUO1E9lZH7yhlYmY3QhJYDO9gtLScuQfkmYSk=;
        b=W8fTY6XwVA2msrE+Z77xAtTXCfbOcbUVvFVrqXGsDR5VOLIcymkNowI6TVA9+YocEw
         hefJh1IZRbmEl/VFwcL/zLMsowvjcThlMZ7nbiNO85u+aAFUatxoU13sAG2k0W5Yudpy
         o1XJoPZD8v1VyIwgI7A9HfCSrZ2kqprLIWeM8vpxUmaYSdYVSFtxYxGKQKw5E6Lgwuwb
         xMr/5qakEWImhwhKBgQ4mxwsvlS5eJmwfZBw2LJCFuRnrp3wjp/Bg1Gh7lEZ4K00jkPV
         COr4wpkyBDB9txC9c1PdZWZtTLVjOwQ9dQJKsDLiuXC2UMvb0S/jMiAyovfowAEau/HY
         6Tig==
X-Forwarded-Encrypted: i=1; AJvYcCUsEN7SrBd0NMXRtYeXSgMECZWnnn/p1/ZD25DJQSVmRz4tOBXjj+lXU8EFSw3dOKxxypq37b5XKeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB3ermr9E55m808kaCoIH6em2/2jVJ+Z2yNPwB6Sq3LZQ9HNhR
	WAZC2oxmUBzm8ssef3N78WKhL5XxCDUBADXailv3poW3zje60d/PJdDm1nJyTtg=
X-Google-Smtp-Source: AGHT+IG9XLrMlJ272hKSgxChz2NuuZEsmNDC9od/EVSBn3Mgojh0kXhv89p9wCa7F+5K8JLhHd5THA==
X-Received: by 2002:a17:907:6090:b0:a8d:e49:c530 with SMTP id a640c23a62f3a-a8d0e4b0fd7mr124416366b.42.1725652015376;
        Fri, 06 Sep 2024 12:46:55 -0700 (PDT)
Message-ID: <a16b5174-9af2-4efc-a91c-6e1159c5b383@citrix.com>
Date: Fri, 6 Sep 2024 20:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline
 symbols
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-4-andrew.cooper3@citrix.com>
 <092700d9-101b-4bac-a500-7f03bd471d89@suse.com>
 <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
 <b16e9d77-869a-4ea3-93a6-647d3873ea4f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b16e9d77-869a-4ea3-93a6-647d3873ea4f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/09/2024 6:58 am, Jan Beulich wrote:
> On 05.09.2024 18:10, Andrew Cooper wrote:
>> On 05/09/2024 4:42 pm, Jan Beulich wrote:
>>> On 05.09.2024 15:06, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(unsigned long delta)
>>>>      }
>>>>  }
>>>>  
>>>> -extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
>>>> -extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
>>> I'd prefer if these stayed here, leaving the 4 symbols as minimally exposed as
>>> possible. Recall that efi-boot.h isn't really a header in that sense, but
>>> rather a .c file. Elsewhere we keep decls in .c files when they're used in just
>>> one CU.
>> See Frediano's RFC series, which needs to change this in order to move
>> the 32bit relocation logic from asm to C.
> And it moves the declarations to the new .c file. Visibility still limited
> to that one file. And (afaics) no Misra violation, contrary to what your
> later reply to Frediano suggests.

If only there were an easy way to answer the question.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7766305370

Failure: 4 regressions found for clean guidelines
  service MC3R1.R8.5: (required) An external object or function shall be
declared once in one and only one file:
   violation: 4
>> The only reason efi-boot.h can get away with this right now is because
>> the other logic is written entirely in asm.
>>
>>
>> Scope-limiting linker section boundaries more than regular variables is
>> weird to me.  It's not as if they magically take more care to use than
>> regular variables, and trampoline.h is not a wide scope by any means.
> It's not "more than", it's "like" (i.e. no matter whether a linker script
> or assembly is the origin of the symbol).

I'm asking why linker-section-boundary symbols should be treated
specially, and not seeing an answer.

I assert they do not warrant special treatment, and should live in
header files like every other extern symbol we use.

~Andrew

