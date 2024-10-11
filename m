Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F999A5BC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 16:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817131.1231246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szGHd-0001ji-EG; Fri, 11 Oct 2024 14:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817131.1231246; Fri, 11 Oct 2024 14:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szGHd-0001hU-Bd; Fri, 11 Oct 2024 14:06:21 +0000
Received: by outflank-mailman (input) for mailman id 817131;
 Fri, 11 Oct 2024 14:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPWD=RH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1szGHb-0001hH-Qg
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 14:06:19 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcbf24e1-87d9-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 16:06:19 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c8af23a4fcso2691611a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 07:06:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93711a189sm1947413a12.24.2024.10.11.07.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 07:06:17 -0700 (PDT)
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
X-Inumbo-ID: fcbf24e1-87d9-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728655578; x=1729260378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9MstecxexnVqwbJE/8WVc9yl7UCL4/zZbp8OiRrrn7s=;
        b=vyHsNXIXWrtD4vt0XL2l4FczenFD3emxW9n9nb1Fu70v8CoujK1cNjX50HTDiDBbw3
         Z4xMexOe12+7bG5t5trpkSV69ecoc6mZhvAt6CQNFxSWyXzQI6bEIPa0b/VrOs4SYpxP
         YBGdcgMSj1hYC8QzOtKhFXTFeqwJLQMxb0YF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655578; x=1729260378;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MstecxexnVqwbJE/8WVc9yl7UCL4/zZbp8OiRrrn7s=;
        b=AIG4/WHD7i6Zs4KW8GsGs6u8akgaoK2in3VMWIOz6DR+6hvDFTbzphLPiZsM/ZTq5B
         agAOrZ5qgRTvR1O8iITi7BAhBZMRp57z0IWvVd5UArkyi8lGiiXWbNyPnrLiq1p6KRuQ
         WWnJceO4Nm9CGwGfKWVTy2cC9ub2HLMyS+zqQLKhQWsNjOWr9JQIcdx68uoAEaCwTOsT
         K/XRQ1Z1RvHTLiby2nkQoL0hSfe5t32/Go5fsYwFfzqd57DCleTJniNeTsqPEOdv7Cgv
         904a40z3fkRC2KzmeU6Hwq0Jc2bw+Bg5RcXuFhsm33+BW8iSqI+Ua4SpRrSjA3+02VsX
         IeoQ==
X-Gm-Message-State: AOJu0Yy1o/740zg61ZAjDFLuzIa/NoIYTHqSJgScM154xy+/vbJYS3Pa
	a1ZHURUy/tkQdmZklWcERiK/YqguMQyChntwsa6Va0v17us8oJy/oUZApeMg21A=
X-Google-Smtp-Source: AGHT+IHyzu3iLDGAKMg5jSJtINi+ySM4qjDgdSJvH8awe2fMuH+Mwy8wKADVoVQYuyuv8cOt07SGFw==
X-Received: by 2002:a05:6402:2749:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5c948d76b4amr1627538a12.30.1728655578537;
        Fri, 11 Oct 2024 07:06:18 -0700 (PDT)
Message-ID: <4daebe89-881a-4b2c-a307-a78a7f52be4b@citrix.com>
Date: Fri, 11 Oct 2024 15:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
From: Andrew Cooper <andrew.cooper3@citrix.com>
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
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <48f0d04a-f1e8-4c00-b71a-42fe035a3d0f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2024 2:38 pm, Andrew Cooper wrote:
> On 11/10/2024 2:28 pm, Alejandro Vallejo wrote:
>> On Fri, Oct 11, 2024 at 02:08:37PM +0100, Frediano Ziglio wrote:
>>> On Fri, Oct 11, 2024 at 1:56 PM Alejandro Vallejo
>>> <alejandro.vallejo@cloud.com> wrote:
>>>> On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>> ---
>>>>>  xen/arch/x86/boot/reloc.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
>>>>> index e50e161b27..e725cfb6eb 100644
>>>>> --- a/xen/arch/x86/boot/reloc.c
>>>>> +++ b/xen/arch/x86/boot/reloc.c
>>>>> @@ -65,7 +65,7 @@ typedef struct memctx {
>>>>>      /*
>>>>>       * Simple bump allocator.
>>>>>       *
>>>>> -     * It starts from the base of the trampoline and allocates downwards.
>>>>> +     * It starts on top of space reserved for the trampoline and allocates downwards.
>>>> nit: Not sure this is much clearer. The trampoline is not a stack (and even if
>>>> it was, I personally find "top" and "bottom" quite ambiguous when it grows
>>>> backwards), so calling top to its lowest address seems more confusing than not.
>>>>
>>>> If anything clarification ought to go in the which direction it takes. Leaving
>>>> "base" instead of "top" and replacing "downwards" by "backwards" to make it
>>>> crystal clear that it's a pointer that starts where the trampoline starts, but
>>>> moves in the opposite direction.
>>>>
>>> Base looks confusing to me, but surely that comment could be confusing.
>>> For the trampoline 64 KB are reserved. Last 4 KB are used as a normal
>>> stack (push/pop/call/whatever), first part gets a copy of the
>>> trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 = ~54 kb)
>>> is used for the copy of MBI information. That "rest" is what we are
>>> talking about here.
>> Last? From what I looked at it seems to be the first 12K.
>>
>>    #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
>>    #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
>>
>> To put it another way, with left=lo-addr and right=hi-addr. The code seems to
>> do this...
>>
>>  |<--------------64K-------------->|
>>  |<-----12K--->|                   |
>>  +-------------+-----+-------------+
>>  | stack-space | mbi | trampoline  |
>>  +-------------+-----+-------------+
>>                ^  ^
>>                |  |
>>                |  +-- copied Multiboot info + modules
>>                +----- initial memctx.ptr
>>
>> ... with the stack growing backwards to avoid overflowing onto mbi.
>>
>> Or am I missing something?
> So I was hoping for some kind of diagram like this, to live in
> arch/x86/include/asm/trampoline.h with the other notes about the trampoline.
>
> But, is that diagram accurate?  Looking at

Sorry, sent too early.

GDB says that trampoline_end-trampoline_start is 6512, so one and a half
pages.

TRAMPOLINE_STACK_SPACE is 4k, and subtracted from 64k to make
TRAMPOLINE_SPACE

So this is why code uses TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE (==
64k) for it's size calculation.

Within that, we've got MBI_SPACE_MIN (8k) used in the linker assertion,
for SPACE (60k) - (end - start)(~7k).


What we're really saying is that the total size is 64k, with the top 4k
being stack, the bottom 7k being .text(ish), and the middle 53k being
the MBI relocation area.

And memctx is a backwards bump allocator within the middle 53k.

Maybe we should defer this until after the Hyperlaunch BootInfo series
has come in.  Later parts have a major change on how we handle the MBI
block, and I can see some substantial pruning opportunities.

~Andrew

