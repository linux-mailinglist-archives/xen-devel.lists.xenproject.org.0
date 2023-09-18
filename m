Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E397A4AC8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 15:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604077.941279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEcA-00023x-GM; Mon, 18 Sep 2023 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604077.941279; Mon, 18 Sep 2023 13:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEcA-00022H-DV; Mon, 18 Sep 2023 13:48:38 +0000
Received: by outflank-mailman (input) for mailman id 604077;
 Mon, 18 Sep 2023 13:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiEc8-00022B-Oe
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 13:48:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5eb63c-562a-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 15:48:34 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40472f9db24so45076015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 06:48:34 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b0040303a9965asm15382471wma.40.2023.09.18.06.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 06:48:33 -0700 (PDT)
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
X-Inumbo-ID: 0f5eb63c-562a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695044914; x=1695649714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEW1I/dBs+bBINM70hO7ydaAvq0svhRITvjNqbR3G/k=;
        b=MMi2C9vxpaRYClz5lGgXb+3nCOJCPPrHv3GMIuqkJ8vnYzfKWHliNV9gOXAsi9VT5T
         FGmGQBQlj9q0vrl1N0Xi9NLfUsVwHTBVcJg0iiI0UG/B8yi2DYqREsfuTRlPmYYCzxso
         r0xNltolx9YkoJ9S9ktqOBeI+Q/IzDfsOf2/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695044914; x=1695649714;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEW1I/dBs+bBINM70hO7ydaAvq0svhRITvjNqbR3G/k=;
        b=t/Dp8gw0IW1hCYvFJitl7UqoIzTaAPIqwAn64YZU75CT9z/ews8l8cEUXFKAMbd4v3
         vqXE5YHPPNeMnnvfg4OmdVnV5JjOhrJVy+XGLa6YWlLa4sKksx2j+sUIDxRporSHzRCt
         Dk6vXhLQWhmBS81nf0npewdz5PESniasT+cKmmWRodVhm+Fl0OEdOm78f40apNvyofLL
         zuYYxjjZ7A0LaEic8H4qROkUa1RPPMN1Gb7oXoeRpS73GkcOMvIvzQVJwLMrmULhvzDm
         l6+rNwA3VfbPSDceQ6gKUHBU2LTQD3n/oSDf7lbvgxoxN7tEZjZcvUWaIjFOAY4OfOKX
         Mp/w==
X-Gm-Message-State: AOJu0Yx0DQ+0JnhhO0ES/67Ih9twoIN7i5+2C/3+CS9HEMaQjFNHTezI
	z6fYtWBk43P2kHiZq37NF6oKSg==
X-Google-Smtp-Source: AGHT+IFD176P+Xdf72wka1Cz6/TJn0KP3O40QlFnwf0WCanE4jRrc4/7BMgiJzxnRoGHwReKISVHMQ==
X-Received: by 2002:a1c:790b:0:b0:401:b493:f7c1 with SMTP id l11-20020a1c790b000000b00401b493f7c1mr7276653wme.35.1695044913643;
        Mon, 18 Sep 2023 06:48:33 -0700 (PDT)
Message-ID: <12199b7d-5599-c530-19f2-6dcf2c4bcf77@citrix.com>
Date: Mon, 18 Sep 2023 14:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-7-andrew.cooper3@citrix.com>
 <d089bc84-40aa-6a71-341c-df934910c2b2@suse.com>
In-Reply-To: <d089bc84-40aa-6a71-341c-df934910c2b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2023 12:02 pm, Jan Beulich wrote:
> On 15.09.2023 17:00, Andrew Cooper wrote:
>> Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
>> entry/exit asm, so it only needs setting in the IST path.
>>
>> As this is subtle and fragile, add check_ist_exit() to be used in debugging
>> builds to cross-check that the ist_exit boolean matches the entry vector.
>>
>> Write check_ist_exit() it in C, because it's debug only and the logic more
>> complicated than I care to maintain in asm.
>>
>> For now, we only need to use this signal in the exit-to-Xen path, but some
>> exit-to-guest paths happen in IST context too.  Check the correctness in all
>> exit paths to avoid the logic bitrotting.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I understand you then didn't like the idea of macro-izing ...
>
>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -117,8 +117,15 @@ compat_process_trap:
>>          call  compat_create_bounce_frame
>>          jmp   compat_test_all_events
>>  
>> -/* %rbx: struct vcpu, interrupts disabled */
>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>  ENTRY(compat_restore_all_guest)
>> +
>> +#ifdef CONFIG_DEBUG
>> +        mov   %rsp, %rdi
>> +        mov   %r12, %rsi
>> +        call  check_ist_exit
>> +#endif
>> +
>>          ASSERT_INTERRUPTS_DISABLED
>>          mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
>>          and   UREGS_eflags(%rsp),%r11d
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -142,8 +142,15 @@ process_trap:
>>  
>>          .section .text.entry, "ax", @progbits
>>  
>> -/* %rbx: struct vcpu, interrupts disabled */
>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>  restore_all_guest:
>> +
>> +#ifdef CONFIG_DEBUG
>> +        mov   %rsp, %rdi
>> +        mov   %r12, %rsi
>> +        call  check_ist_exit
>> +#endif
>> +
>>          ASSERT_INTERRUPTS_DISABLED
>>  
>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>> @@ -659,8 +666,15 @@ ENTRY(early_page_fault)
>>          .section .text.entry, "ax", @progbits
>>  
>>          ALIGN
>> -/* No special register assumptions. */
>> +/* %r12=ist_exit */
>>  restore_all_xen:
>> +
>> +#ifdef CONFIG_DEBUG
>> +        mov   %rsp, %rdi
>> +        mov   %r12, %rsi
>> +        call  check_ist_exit
>> +#endif
> ... these three instances of identical code you add, along the lines of
> ASSERT_INTERRUPTS_DISABLED?

There's no header that's unique to just the entry.S's, and it's only 3
instructions that need a very specific stack and state layout.

The SPEC_CTRL_* macros are already a giant source of pain, and for 3
instructions I don't think the complexity of the abstraction is worth it.


Furthermore, I've got some fixes to the other ASSERT_* macros which are
going to make them a bit more like this.

~Andrew

