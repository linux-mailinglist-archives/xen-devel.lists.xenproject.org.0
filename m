Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06659C3CA3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833524.1248689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASEM-0000Q2-C6; Mon, 11 Nov 2024 11:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833524.1248689; Mon, 11 Nov 2024 11:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASEM-0000NW-8J; Mon, 11 Nov 2024 11:05:14 +0000
Received: by outflank-mailman (input) for mailman id 833524;
 Mon, 11 Nov 2024 11:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tASEK-0000NQ-8x
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:05:12 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf424cbe-a01c-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:05:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso6083044a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:05:07 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb83acsm4815831a12.51.2024.11.11.03.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:05:06 -0800 (PST)
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
X-Inumbo-ID: cf424cbe-a01c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNmNDI0Y2JlLWEwMWMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzIzMTA3LjAxNDQ3Mywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731323106; x=1731927906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iIBjKHYDjM3hKudU8q8nmLLQuyZG2NCz1BON/yH64zQ=;
        b=gfH96lYVa6JkjqpZuQ7S1XwGWPqf9eXg/aTq06YyW+SMK+tySWrNrnr/BhTnQKXTf7
         ChJm1zQktnBqzmfrE20ba0OLEStZ9TFHxyDyymKcPrd3zOfH5YyyU36NbWJABf8LZOtv
         cVTlN3EkmmYD5w39pLkbMp5BlpWUvoDbzi8NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323106; x=1731927906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIBjKHYDjM3hKudU8q8nmLLQuyZG2NCz1BON/yH64zQ=;
        b=YOV90MPNRewn6lNZdDjjaiLWg3V+uLwmfHpQyxCTIRZUNv3WVMbPCO8F8GvV4rCZyn
         DmH1uKidcROm3nhQfspE4C6RPkSt1cXiQfmpkIh7MF6R8l+mM/lY6QBH/JDiTNaM0nCt
         hHetZcUr2K2XPFQnckX1UQJf5AIibso0fI5xBjQGNCfMz1wP0kztyq7t543WTJ+uEya5
         pRpbgoOQiAhnyxhn7rf9xVXP7/J5JcCgQLqMeC9eeHNgCWA8AkhvSSWcK+uatibBRcdR
         xy+BM2t6qwNFRMKCS7mtHeQRAuyO8UoKzIqguzIjJ0QZsMPtTpgufC3YzyHXfYqXL4P9
         Pqiw==
X-Gm-Message-State: AOJu0YyIQ75nEVHkYpfOcVQm+FynAF3EaltJM1o9VLE3Jon9u9a6z3OK
	frmFpVxnVaBJGazDkoCh9LKqy8INNVeO71MA02zgePb8vC+CV9iFaAw4v044OlI=
X-Google-Smtp-Source: AGHT+IGegQ+I8C5F8EMyNU0KyGF1d24aKXZB/tM6bwPxXPYuchdKlk94nLzIhgFEI+GDLGUkfrNDgQ==
X-Received: by 2002:a05:6402:2794:b0:5ce:c9d3:9fdc with SMTP id 4fb4d7f45d1cf-5cf0a323015mr10072455a12.16.1731323106458;
        Mon, 11 Nov 2024 03:05:06 -0800 (PST)
Message-ID: <1ace53f6-dd00-4277-9e91-4f3117facd38@citrix.com>
Date: Mon, 11 Nov 2024 11:05:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/wakeup: Fix code generation for bogus_saved_magic
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241109003654.884288-1-andrew.cooper3@citrix.com>
 <CACHz=ZjBiEkXCGayGSdFUUc0eCFqSvGGSyFDMmRc76Nz_aP9QA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZjBiEkXCGayGSdFUUc0eCFqSvGGSyFDMmRc76Nz_aP9QA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/11/2024 5:29 pm, Frediano Ziglio wrote:
> On Sat, Nov 9, 2024 at 12:37 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> bogus_saved_magic() is in a .code64 section but invokved in 32bit mode.  This
> Typo: invoked
>
>> causes a real encoding difference.
>>
>> Before:
>>   66 c7 04 25 14 80 0b 00 53 0e    movw   $0xe53,0xb8014(,%eiz,1)
>>
>> After:
>>   66 c7 05 14 80 0b 00 53 0e       movw   $0xe53,0xb8014
>>
>> The differnce happens to be benign, but move the logic back into a .code32 for
> Typo: difference

Thanks.  I'd noticed and fixed up locally.

>
>> sanity sake.  Annotate it with ELF metadata while doing so.
>>
>> Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> This issue dates back to the very introduction of S3 support in Xen, in 2007.
>> ---
>>  xen/arch/x86/boot/wakeup.S | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
>> index 08447e193496..c929fe921823 100644
>> --- a/xen/arch/x86/boot/wakeup.S
>> +++ b/xen/arch/x86/boot/wakeup.S
>> @@ -153,15 +153,16 @@ wakeup_32:
>>          /* Now in compatibility mode. Long-jump to 64-bit mode */
>>          ljmp    $BOOT_CS64, $bootsym_rel(wakeup_64,6)
>>
>> +FUNC_LOCAL(bogus_saved_magic, 0)
>> +        movw    $0x0e00 + 'S', 0xb8014
>> +        jmp     bogus_saved_magic
>> +END(bogus_saved_magic)
>> +
>>          .code64
>>  wakeup_64:
>>          /* Jump to high mappings and the higher-level wakeup code. */
>>          movabs  $s3_resume, %rbx
>>          jmp     *%rbx
>>
>> -bogus_saved_magic:
>> -        movw    $0x0e00 + 'S', 0xb8014
>> -        jmp     bogus_saved_magic
>> -
>>  /* Stack for wakeup: rest of first trampoline page. */
>>  ENTRY(wakeup_stack_start)
> Hi,
>    I agree with the code move, it's supposed to be 32 bit so it should
> be in the 32 bit section.
> Does the ELF annotation help with debug information? Maybe worth
> adding to the comment.

As said in the commit message, it's simply ELF metadata (symbol type and
size).

It doesn't interact with debug symbols, so far as I'm aware.

It's mainly for livepatching (the ELF metadata is how changes are
identified), but we're applying it uniformly to all assembly as a
cleanup activity.

> OT: If I understood correctly, the code is writing a character on
> screen in a tight loop. Maybe an hlt instruction could be helpful?

Yeah, it's not exactly great code, but it needs more adjustments than
just a hlt.

It ought to know about CONFIG_VIDEO, and ideally video=none.

> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Thanks.

~Andrew

