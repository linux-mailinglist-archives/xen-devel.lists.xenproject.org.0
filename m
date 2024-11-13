Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0A9C6DD2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835437.1251311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBWE-0002XS-UU; Wed, 13 Nov 2024 11:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835437.1251311; Wed, 13 Nov 2024 11:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBWE-0002Vm-Qc; Wed, 13 Nov 2024 11:26:42 +0000
Received: by outflank-mailman (input) for mailman id 835437;
 Wed, 13 Nov 2024 11:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBBWD-0002Uf-SC
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:26:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25790984-a1b2-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:26:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so84441935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:26:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97cfaesm17956726f8f.38.2024.11.13.03.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 03:26:36 -0800 (PST)
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
X-Inumbo-ID: 25790984-a1b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI1NzkwOTg0LWExYjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk3MTk4LjYwNjIxNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731497197; x=1732101997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IO5Dm4l2vjnYAXNyoasecd1nP/TIKA7uAKnBLcXxhuE=;
        b=FLH1eyWagehEMOt/vuErTwAmvRfpeaeuFIL8O1kZ0A1ZL1gAyNFrBY14FRGEQ001ao
         6QoffDzupKQfJCzjPYVp3KtD8r0jCCPqXhnJHhxCTBM/fqBCJbjfhoD/MKbo1BoT3DGi
         xGjmdZKt27aO0fmcQkRUBLx6Skv+3Ts3hnX1IgM0v9yngq5sGKh062UzNHS5lKws9SrC
         kFddmTyJnapyMSBGZ0R77UrrgbZYzHsOhi7QcgzQRxTfpQHQXj41xBt9ZP3O59sgd5rw
         m6GCUiQj/zgSJrehFxQtuXeHZjSQPrnORznLVRncAODLYmSAt/cWcOX2X8AnPwQ6/ksc
         NHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731497197; x=1732101997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO5Dm4l2vjnYAXNyoasecd1nP/TIKA7uAKnBLcXxhuE=;
        b=B0awNCwXiOBMQsnh0cVWwu4nzhQiluKIXa/JywUONsgshO2h0ozjbaVOnJy/aN5YUV
         WxcXgX3sjmhlBrL6/uz5f/f2MPCG6dE6CVwsqa6IoAaYLipHj3Y7VcpP3V8723F6qs7B
         iMzaIsAHv1tzrtNN2or4LWkIwBUba9HcBFu04u4YsotDB86liKucEoBes0QcAzlTEjlg
         eOM3kDz/gNe7hrKe2Gn1qzGwCXq4TcjxKxnmMIdpIqmtRobqBzJ5ge36niDE6BQu+HHE
         5kfCmAuDod0fnDOJqoTKoQ/4A34i6wvgxq6bd6CJ+U281eKVu1h1RIoahvo7l5RvjMhS
         4qAg==
X-Forwarded-Encrypted: i=1; AJvYcCWAHrhafkWWuQEeTBskblSlOCr9OV5RWe07y1OHAcUxOpmgqRXNskRO3kY6KIXj5kNRTiWxjGXzceA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg6WEFXwSUj4ERchDIThJiYTTnkqj1CLsIseAC5PXzLJvz69Rg
	ZD4AlA+jepwR9lQLkT0ihqiLra51aHSHqTdWuHvB8Uc59AWiywd9fEUWUZvqDQ==
X-Google-Smtp-Source: AGHT+IHpNf+9BI0ovxR/Cu79inL59ZWr/U7cyFuDpqI5EgKBZ5DEe/iF6wjC2CFnDvjHzYzvY1aZlg==
X-Received: by 2002:a05:6000:782:b0:37d:612c:5e43 with SMTP id ffacd0b85a97d-381f1838df9mr21478719f8f.0.1731497197210;
        Wed, 13 Nov 2024 03:26:37 -0800 (PST)
Message-ID: <61572855-095d-419f-bccf-a51fb5fd537b@suse.com>
Date: Wed, 13 Nov 2024 12:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/trampoline: Document how the trampoline is laid
 out
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-2-andrew.cooper3@citrix.com>
 <5f58dda2-1619-4416-b711-c600367d6f47@suse.com>
 <db7d200d-a13c-4cb4-9860-5a40cc039db7@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <db7d200d-a13c-4cb4-9860-5a40cc039db7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 12:19, Andrew Cooper wrote:
> On 13/11/2024 10:20 am, Jan Beulich wrote:
>> On 13.11.2024 10:30, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/trampoline.h
>>> +++ b/xen/arch/x86/include/asm/trampoline.h
>>> @@ -37,12 +37,63 @@
>>>   * manually as part of placement.
>>>   */
>>>  
>>> +/*
>>> + * Layout of the trampoline.  Logical areas, in ascending order:
>>> + *
>>> + * 1) AP boot:
>>> + *
>>> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the identity
>>> + *    mapping (which must be executable) can at least be Read Only.
>>> + *
>>> + * 2) S3 resume:
>>> + *
>>> + *    The S3 wakeup logic may need to interact with the BIOS, so needs a
>>> + *    stack.  The stack pointer is set to trampoline_phys + 4k and clobbers an
>>> + *    undefined part of the the boot trampoline.  The stack is only used with
>>> + *    paging disabled.
>>> + *
>>> + * 3) Boot trampoline:
>>> + *
>>> + *    This region houses various data used by the AP/S3 paths too.
>> This is confusing to have here - isn't the boot part (that isn't in the
>> same page as the tail of the AP/S3 region) being boot-time only, and hence
>> unavailable for S3 and post-boot AP bringup? Both here and with the numbers
>> in the description - what position did you use as separator between 2) and
>> 3)?
>>
>> Then again it may be just me who is confused: Didn't we, at some point, limit
>> the resident trampoline to just one page? Was that only a plan, or a patch
>> that never was committed?
> 
> The positioning of various things is rather complicated.
> 
> Only a single 4k page is mapped into idle_pg_table[].
> 
> But, the AP/S3 path use:
>   trampoline_cpu_started
>   idt_48
>   gdt_48
>   trampoline_xen_phys_start
>   trampoline_misc_enable_off
>   trampoline_efer
> 
> Which is beyond the content of wakeup.S.  The GDT in particular needs to
> stay valid with paging enabled, to load __HYPERVISOR_CS.
> 
> We have /* From here on early boot only. */ in trampoline.S but that
> seems to be the extent of checking.  Everything needed for AP/S3 is in
> the first 0x229.

I was fearing it might be as weak. We probably want to gain a symbol there,
for use in another linker script assertion.

Jan


