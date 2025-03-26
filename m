Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B49A71374
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927341.1330088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMtT-000538-H8; Wed, 26 Mar 2025 09:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927341.1330088; Wed, 26 Mar 2025 09:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMtT-00052T-EB; Wed, 26 Mar 2025 09:17:51 +0000
Received: by outflank-mailman (input) for mailman id 927341;
 Wed, 26 Mar 2025 09:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txMtR-00051c-N0
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:17:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cb19888-0a23-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 10:17:44 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso3768821f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:17:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd277c9sm180668065e9.22.2025.03.26.02.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:17:42 -0700 (PDT)
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
X-Inumbo-ID: 2cb19888-0a23-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742980663; x=1743585463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LM476Dm76nxA3v4/OaxPUP+PmKsDu5gMhGVnrPwuLRU=;
        b=cPzY07GolrrYZvrtykxe+VdbNsoI2pnBTPUC03b6FoKwDPOtytTkzr1+6BwpZ9V5vm
         MCxrI+8jGeSZgj4zx9SXqAI/TuXU/lHUE5Iwjd69Or69+K5T9bsF6UmhwE3pObyVIX/D
         G5fiaO2HI3YIPKsLtjcyD0PbwMmk4wuWroWc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980663; x=1743585463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM476Dm76nxA3v4/OaxPUP+PmKsDu5gMhGVnrPwuLRU=;
        b=ZXZO95N075LIlTbQVFQrIPuzu4OtcH+Oz2Y4ShNj1YBgTU+e/5aTMVRigOprycEuiS
         JCK6G5yz8TQwHVa32ku7+w62gIDFHow05WSq2uXpE8mnhXkYJzOKsAHwdDuVmZdjugIs
         2bZaGZgLbZkajPePfcvMkf0clxQoxWWJBcm1I//2Kv45p6Rln8gMkpKn9nfHhPmsQYmo
         meItMlL7einvPlSYb8Vr7XsgOuwY4WDCOffTELAgz3xFdlSQjvj6jMwZAljZqqc79IYp
         aSTt5q3GAPep44cc8EK5RLCG7OW8elSpdTJfcelwPSaF9FFNvM3Pfw6zBwwx7BUTzp53
         zD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7OMTZufQ7TzS3+2zVwucXDO8Gq/aZFyRIFahg+felQ1a9TwlnYBzupG/QGFiHYe6U9Oe2MrOua2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+9VL7Iu5fVy2rN6+JOxkZzLjzDhbypY0t4m2incpRTDn64OAX
	u+N7eWGCGK/AA0NVMLomJQoUwf069OTss4yJKLNtNzzTaISyByH7P/ej02aoWc0=
X-Gm-Gg: ASbGncuD3EqUnvyX4SOTmnAesuALS5wqh8rgWQLXFnyUSWpKIMVHM4d7eRKeUsyw65d
	46XM4fRx5d4+2NHfO5QCk9a+kZAKTASLIROHXzibqANtZHsGB4QImtN90xjuXIIs1CnKR1iuo1j
	frFfcE2sC1OZJyWmEy+XmzKxoy9qYCmknxDFr/9YIKPiOckStGad9mOgulARYorSGvBcAOC4KBH
	lExa5evIRPJNL5HicFj4ST1iUbCiMihRaAunUPVNUNHFMTU/6ekneTI5lPDfVUH6Xq2uhLhI53+
	NoHk4IU7I/VnVGPbhNl1jCgZ8O0ZI/ZZRy4kREXb8rkXP831t39MLMhqvb06ZZu0NxMnVqilhY2
	fy17HSObDow==
X-Google-Smtp-Source: AGHT+IFeJRWl6yZBRxKhIDjchJvFtO2ZBQXNt+v1ConHoMeaz0Hg8cKlkFpCviMpqjD0ayooP7koYg==
X-Received: by 2002:a05:6000:1f8f:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-3997f8f5d54mr17511986f8f.4.1742980663326;
        Wed, 26 Mar 2025 02:17:43 -0700 (PDT)
Message-ID: <1a01a590-acb6-4b6e-9fb9-3af4deabb4b5@citrix.com>
Date: Wed, 26 Mar 2025 09:17:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Remove ASM_CALL_CONSTRAINT from
 elf_core_save_regs()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325180005.275552-1-andrew.cooper3@citrix.com>
 <ae306524-bc22-450e-88d6-8c0785003e17@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ae306524-bc22-450e-88d6-8c0785003e17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 9:00 am, Jan Beulich wrote:
> On 25.03.2025 19:00, Andrew Cooper wrote:
>> I was mistaken about when ASM_CALL_CONSTRAINT is applicable.  It is not
>> applicable for plain pushes/pops, so remove it from the flags logic.
>>
>> Clarify the description of ASM_CALL_CONSTRAINT to be explicit about unwinding
>> using framepointers.
>>
>> Fixes: 0754534b8a38 ("x86/elf: Improve code generation in elf_core_save_regs()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/include/asm/asm_defns.h  | 5 +++--
>>  xen/arch/x86/include/asm/x86_64/elf.h | 2 +-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
>> index 92b4116a1564..689d1dcbf754 100644
>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -28,8 +28,9 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>  
>>  /*
>>   * This output constraint should be used for any inline asm which has a "call"
>> - * instruction.  Otherwise the asm may be inserted before the frame pointer
>> - * gets set up by the containing function.
>> + * instruction, which forces the stack frame to be set up prior to the asm
>> + * block.  This matters when unwinding using framepointers, where the asm's
>> + * function can get skipped over.
> Does "forces the stack frame to be set up" really mean the stack frame, or the
> frame pointer (if one is in use)?

What do you consider to be the difference, given how frame pointers work
in our ABI?

It is the frame pointer which needs setting up, which at a minimum
involves spilling registers to the stack and getting %rsp into it's
eventual position.

>  In the latter case I can see how the asm()
> being moved ahead of that point could cause problems. In the former case I
> apparently still don't understand (yet) what the issue is that
> ASM_CALL_CONSTRAINT ultimately is to help with.

The specific bug is from a sequence of functions a, b and c, where b
uses an asm() to call c.

a() pushes old %rbp sets up new %rbp, b() fails to do so early enough,
and c() pushes a()'s frame pointer, not b()'s.  Then unwinding via frame
pointer skips b() in the backtrace.

I don't know what the precise effects of the constraint are.  The
compiler maintainers can't agree either, and say it's fragile and can't
be relied upon, but it seems to be the only way to have the desired
effect on emitted code.

~Andrew

