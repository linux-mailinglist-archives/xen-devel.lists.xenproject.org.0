Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862EB24888
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 13:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079781.1440472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9m3-00024O-MU; Wed, 13 Aug 2025 11:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079781.1440472; Wed, 13 Aug 2025 11:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9m3-00022L-JZ; Wed, 13 Aug 2025 11:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1079781;
 Wed, 13 Aug 2025 11:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um9m2-00022F-29
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 11:36:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b259b5a8-7839-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 13:36:05 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso62573745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 04:36:05 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16deecbasm27880405e9.21.2025.08.13.04.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 04:36:03 -0700 (PDT)
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
X-Inumbo-ID: b259b5a8-7839-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755084964; x=1755689764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BpRFVoGmBml0++sWbPNlu2ABBbNxpkPpye0Kz8hW9L0=;
        b=GhMybSawqgDSQi//5V1OdctRsuIHFt/qECVPh0HJbDdeQ+oR2krmxBJnKwRCTsjStT
         kCrL01IhpeqBZjW/ECOUDBoX9EMBxFV+iduUhB491h6e5uq2s8LOsc0GTLdYJmzo63IT
         i3pyS4v0peL5ZA0zXtwQT9mDrj7M2FDydWVaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084964; x=1755689764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpRFVoGmBml0++sWbPNlu2ABBbNxpkPpye0Kz8hW9L0=;
        b=uKSmAiDeJ6g1hqHn4uO6lpQuAa/FxlfNl9p8/2dPUGwL1LrDHhS/Z5+xxcPDk5dzDC
         +BraqRs363d4SBWFTS6nZdzv9e/Kw4zy+seeDilZdJfy44Tq/TnJrVrEMBFfKIdfW/Z4
         Jz41HgqIy9CTBfz3YZlSjy2IIDzuV3mZ2HUMXscOO9qqSf90oYmhl6R6MBmlps4R8A9w
         Oxikm+SJWqzeZ7ICAHpFuwXg5P2VHkT0+1i2sIBNPgCjLLEZpyrIg94z+T82DRFnnLcc
         yru6VxS0Y2ngbkJIm+6lf3xXwlsk71G4bFEXmx4eysQd2QXUFBS1YYzl5XAXvakn8eZm
         HIgg==
X-Gm-Message-State: AOJu0YzOk0TUGOdHaHYoGMFZBqqFgs1bSX0+QgTq0rauhFBFfNaQMaMt
	6c3WBGK20BuEp9GjX6ci4O3FJh5r3UY0e1IiRDgLn0dNiqvpg+TuflTvquAshDz+d6E=
X-Gm-Gg: ASbGnctMRSkR5PCqnGQFLs93Q4LjKjhBkR6w3Qk/VcF3lU66ttuqEEDSiFZFYMcbP5/
	BnEOpF9vT54vn9zcBd5EVWfQ+xP7olU5cIL2XCg8YD38iQMSTZdlxE8Nhr33tVqFmCABHFdgPa6
	Y2GIC0sNnnu7BsHAeKsHjRZNHlkQ693Z3f0CPLJ4bqQSYaOPo98f4mRHCiiTJrxscmBlpFjfB0W
	FvgIOT5KQME7hFWBfYz9ionSyi+rWL0WHhupUU4pfeo579Rr2rEq2Xf8H+TkYPMYYYMWhVAD8NS
	LOJpxe6s9oF3n2kGoeyG0EmI8FLBJV53rhSpMdgt3Nz8rL7BXP3smu4fw5wu63p/8iqs5IJaSYc
	wKN/Sw1e1WiYOWQUbLeWFpJCL1MjwvdzEdCTsO/2LwjV4opL1BKgnnFs1mOwRiIIV40c9
X-Google-Smtp-Source: AGHT+IEDqLNWJR/7zRZQiv5ZiHj/7JYeh8bR0T18Y/Tmyx70JNwrTUqbRJe3E7FVC/3y+eV0uLVaUQ==
X-Received: by 2002:a05:600c:1ca4:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45a19c9f89bmr3703235e9.8.1755084964260;
        Wed, 13 Aug 2025 04:36:04 -0700 (PDT)
Message-ID: <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
Date: Wed, 13 Aug 2025 12:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 10:43 am, Nicola Vetrini wrote:
> On 2025-08-08 22:23, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>> --- a/xen/arch/x86/traps-setup.c
>> +++ b/xen/arch/x86/traps-setup.c
>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>
>>  void nocall entry_PF(void);
>>
>> +/*
>> + * Sets up system tables and descriptors for IDT devliery.
>> + *
>> + * - Sets up TSS with stack pointers, including ISTs
>> + * - Inserts TSS selector into regular and compat GDTs
>> + * - Loads GDT, IDT, TR then null LDT
>> + * - Sets up IST references in the IDT
>> + */
>> +static void load_system_tables(void)
>> +{
>> +    unsigned int i, cpu = smp_processor_id();
>> +    unsigned long stack_bottom = get_stack_bottom(),
>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>> +    /*
>> +     * NB: define tss_page as a local variable because clang 3.5
>> doesn't
>> +     * support using ARRAY_SIZE against per-cpu variables.
>> +     */
>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>> +    idt_entry_t *idt = this_cpu(idt);
>> +
>
> Given the clang baseline this might not be needed anymore?

Hmm.  While true, looking at 51461114e26, the code is definitely better
written with the tss_page variable and we wouldn't want to go back to
the old form.

I think that I'll simply drop the comment.

~Andrew

P.S.

Generally speaking, because of the RELOC_HIDE() in this_cpu(), any time
you ever want two accesses to a variable, it's better (code gen wise) to
construct a pointer to it and use the point multiple times.

I don't understand why there's a RELOC_HIDE() in this_cpu().  The
justification doesn't make sense, but I've not had time to explore what
happens if we take it out.

