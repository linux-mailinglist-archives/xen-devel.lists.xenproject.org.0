Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA8B26EBE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 20:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082333.1442233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcYn-0001Rj-Po; Thu, 14 Aug 2025 18:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082333.1442233; Thu, 14 Aug 2025 18:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcYn-0001QI-N3; Thu, 14 Aug 2025 18:20:21 +0000
Received: by outflank-mailman (input) for mailman id 1082333;
 Thu, 14 Aug 2025 18:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umcYm-0001QA-6V
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 18:20:20 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 549102ad-793b-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 20:20:17 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso6658575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 11:20:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b91b05b28fsm5459040f8f.21.2025.08.14.11.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 11:20:16 -0700 (PDT)
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
X-Inumbo-ID: 549102ad-793b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755195617; x=1755800417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MmZkt0R1b0M3Fai1YjWidcDQOmuulM3aGiIx5Uuomj4=;
        b=Fz1c0ablEzgUci2YGU/sUJFN366ia6j9I4XmF3NBESY81iAoQNiMTGBOTsLQoW2HYH
         HHtwBpg1w17QEgsz+9Z+WRpHEmrZQcbg8zBWdt9UCUxHaizZO2G2o1dw0DvQQ+TpYJJY
         3oQst5uzA4Ev3xmajFmU30uDuS58Iyf49u6U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195617; x=1755800417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmZkt0R1b0M3Fai1YjWidcDQOmuulM3aGiIx5Uuomj4=;
        b=Zw46clAwA9veRFozLDUf70iFEEZPoEIHW/fqqJkLVJaYWgWYtMPyGAnwuyWR9YHZo+
         jIW4BhKMmnlehU2FqPKjKghb4MwfxWg2CuUkKkbPnUlH7I4AMLTWVEpZWuSSqMqHODdM
         Is+IAwcDTwOWVbI55mpQ4sKvrGqioU4oLLx/4bLKWobJPi0cRGao6YU/WygmuMvVE4ot
         7AYzXz2BC6iayJFWzVbSkG0fMM9rOz08JFZfYTX5+99Lle8rPUZ98xQoSphv2vebS44t
         2SPGDix8uLqjx+MVI6OnMz+ON/PjdYLBo7warVYFwp2x1qr2w6AT2IM6E7HFL0Iyo5NT
         noxw==
X-Gm-Message-State: AOJu0Yz2IRu9cswBeHkBk/HMb9D62mOodYly5cO8kCkeCW4uB3+ZRPJh
	sGttTtSulJsk8ey6fjogK35hhFNlYRd0N0H9JlXo12Rl4/RgmIw1n2fP1VWbx11MHag=
X-Gm-Gg: ASbGncutzLt8kSMJa8sqgB1h9rNyE+7Ndm7HYWcL7aCKoce+CtAFCPbJzysDzXpFkrn
	DMfkfXrWYYHgxve0HRIn+AQ0IRMr6OG6+ddck7qYqSVnDQxHixaMvPBjTfYeAtBR/L0mBiydikH
	sGIl97BELUFISLj+F99FAgijwiMt3FKd0+b2rU5aSz6prGzs9XJT/WaOA2CoBoorUAhV+csC4/N
	lV23elNcpVYcoLLxcXAxKSAG+eu69Qzs0OOd6tEoSP8BO+Y/Wcvxd3ONQXYW4ROfyq4oOG5Tr7O
	gBWbn6a2FQPVKGhy40vPE1fn3taEuOjKjwsOrNaz7My9woklCUtOcKeK4gYMdzOx9oICJCqa1/s
	x6iNcEU8chyKqroq2qxpl3BpYD0Sxge4yXYi9GLQJyc0jbCUHvU4dbC/3tsSyAE2mI/sv0/WQK7
	AzT34=
X-Google-Smtp-Source: AGHT+IGQPPbKRRdkfIqwiymy+aegYBPv8KNVH6YXKDb/ozMJWeYXpbIKjXJPohbOpWdMbqPbB3Y9fg==
X-Received: by 2002:a05:600c:1988:b0:459:db80:c2d0 with SMTP id 5b1f17b1804b1-45a1b6152ccmr35487985e9.7.1755195617171;
        Thu, 14 Aug 2025 11:20:17 -0700 (PDT)
Message-ID: <0af415c5-df96-4715-a7e6-0d645e2e3a96@citrix.com>
Date: Thu, 14 Aug 2025 19:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
 <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
 <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 8:26 am, Jan Beulich wrote:
> On 13.08.2025 13:36, Andrew Cooper wrote:
>> On 12/08/2025 10:43 am, Nicola Vetrini wrote:
>>> On 2025-08-08 22:23, Andrew Cooper wrote:
>>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>>>> --- a/xen/arch/x86/traps-setup.c
>>>> +++ b/xen/arch/x86/traps-setup.c
>>>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>>>
>>>>  void nocall entry_PF(void);
>>>>
>>>> +/*
>>>> + * Sets up system tables and descriptors for IDT devliery.
>>>> + *
>>>> + * - Sets up TSS with stack pointers, including ISTs
>>>> + * - Inserts TSS selector into regular and compat GDTs
>>>> + * - Loads GDT, IDT, TR then null LDT
>>>> + * - Sets up IST references in the IDT
>>>> + */
>>>> +static void load_system_tables(void)
>>>> +{
>>>> +    unsigned int i, cpu = smp_processor_id();
>>>> +    unsigned long stack_bottom = get_stack_bottom(),
>>>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>>>> +    /*
>>>> +     * NB: define tss_page as a local variable because clang 3.5
>>>> doesn't
>>>> +     * support using ARRAY_SIZE against per-cpu variables.
>>>> +     */
>>>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>>>> +    idt_entry_t *idt = this_cpu(idt);
>>>> +
>>> Given the clang baseline this might not be needed anymore?
>> Hmm.  While true, looking at 51461114e26, the code is definitely better
>> written with the tss_page variable and we wouldn't want to go back to
>> the old form.
>>
>> I think that I'll simply drop the comment.
>>
>> ~Andrew
>>
>> P.S.
>>
>> Generally speaking, because of the RELOC_HIDE() in this_cpu(), any time
>> you ever want two accesses to a variable, it's better (code gen wise) to
>> construct a pointer to it and use the point multiple times.
>>
>> I don't understand why there's a RELOC_HIDE() in this_cpu().  The
>> justification doesn't make sense, but I've not had time to explore what
>> happens if we take it out.
> There's no justification in xen/percpu.h?

Well, it's given in compiler.h by RELOC_HIDE().

/* This macro obfuscates arithmetic on a variable address so that gcc
   shouldn't recognize the original var, and make assumptions about it */


But this is far from convincing.

>
> My understanding is that we simply may not expose any accesses to per_cpu_*
> variables directly to the compiler, or there's a risk that it might access
> the "master" variable (i.e. CPU0's on at least x86).

RELOC_HIDE() doesn't do anything about the correctness of the pointer
arithmetic expression to make the access work.

I don't see how a correct expression can ever access CPU0's data by
accident.

~Andrew

