Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D66CB226A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 08:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182537.1505405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEKl-00049h-0N; Wed, 10 Dec 2025 07:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182537.1505405; Wed, 10 Dec 2025 07:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTEKk-000479-Sp; Wed, 10 Dec 2025 07:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1182537;
 Wed, 10 Dec 2025 07:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTEKi-000473-NL
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 07:09:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3adb0175-d597-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 08:09:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so55537025e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 23:09:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d1d497sm28462235e9.4.2025.12.09.23.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:09:54 -0800 (PST)
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
X-Inumbo-ID: 3adb0175-d597-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765350595; x=1765955395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lwS509WMIxBr8aH2Zqp+csF4vi9Wp96nHKV5Z0rr9Kk=;
        b=bXvi3cUnlCP6lxxIqRG5GqaPBJwkdFMOz8Q+YZZiL4ZYhFmy3Cg8vb2ywO2P6nWgxv
         uEmXRa1k9TJm26ZAhybqGqN7Dhul8vpyeW+b8HvcXJEcKIBtA7T5WCxTl91xVLjaj5IB
         fEV/dM6ytUevcwgUqQ1tFIh8POWwahrojsv21KNwT+FAY8jkdks9f0M5LKaOk92JzCkJ
         /JH/LS9E6WmucmcKaJytcDAxoaabNqxgDUwtxLmkte4Ny7pdJFFY/Z2fuWwLAg/CN8KP
         ClrQsaObS4EAOB8E7D32Qofo4SoaHVJRCM6WtUtL0+NpeZvKLR7C2HgEnlGIgoRfZmLc
         ks1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350595; x=1765955395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwS509WMIxBr8aH2Zqp+csF4vi9Wp96nHKV5Z0rr9Kk=;
        b=AbOwR2dhzgFW7eJstgzZ7t+DeH9Lk46nbnO3yC1m2CIRUwts6p5aR1Xt3d/gEZyEGy
         VCPhCkouLGqjyOrBc9EaiRhwnzqv2CMVI0ZEvXM1bgnNxN49nngqrZwXtr3dMG37uSiM
         +ViqvyatkkGqQTCcOD6SV+h4J8fhfpv7rJI7cJZME7R3tjUI6qLJEL1jgWjn93rHn6Im
         I5vkSgTyn3Sawz/oAC4+vJbZZr/1z1jCxhW9ydVghwWO5HJqB8UZPoidoOYEq4PHbIak
         dn93wvjD50vih+IqzDsIbb7djV3mE3L0UXvKZENabpna86I+gWrnTwW+C6MJ7tC8PORv
         jcCg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyNgpr8agvtFj7DC990qvX8Lfjohkpe9Ifc7DMqP69YaDd0WwFZxDQRQPpgR9LiOtVUbThP2dYX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAhOQF2iowa+UWngQwHqJXaacJ+tWXMHNFO53YRwTZ9ZB7vlmA
	9JaHuQmYSsncv/hovo/UVv8IsirREqScZEK7Davqnm8vlfPxCbOl45783BTtL85wB5Fxfa1I52H
	rBRU=
X-Gm-Gg: ASbGncsv/+/NWgitR5J++XldMZkKdvfzmJjULUnTH2zYINPW+YL9Fi0eLodajTWiXxA
	FjgWCbfHUJMHpo6iZ67QY0SuHayzuudFlheSlFCxFKk9n2aKC3UlpgiBDAOqU//DGvgS7umYmf6
	ccXdU4rGo+OS5Ztcbb+/XpOxAzIX9UFp71Qn6uftuBmiJBteGiQtxz7JvHQWNie4ifsLdnUuJDm
	VO9OxvWdQlcZTOaXZ45wrD87pKKDvYilWsIGnEkpMWmnA4kw5Eo5cv2vFT06NTxtCVZImzofHmp
	Td8DfXjMn96u/FtiyfPTbtP9MbMEayuFPdybto6fX3NHmsm9U4seoosZbdE02fRVM3sxwCEjNCy
	Z5sZFuvmXpFCQiqeEsDxGLgIKGdu+UvhmcJc6yJGcNihpxpv0vCABgukadwAijKMqDouLP1PO52
	8C37WTCBaaq3VHUnyz8P6k6whi/gRBa6V4g/mVAxKgEykIna7oT+AzgAoyltxvhvcNc8ip7mO4P
	MEBgL3rce9xyA==
X-Google-Smtp-Source: AGHT+IHIVLM6klgAcCTDKTXc+zgyW2yKmFGqBAzGrRC3ngG0xTlqtZdh0y3ZBOZqn4KeYRGZLCKQww==
X-Received: by 2002:a05:600c:4f09:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47a8379fe25mr9709685e9.34.1765350594847;
        Tue, 09 Dec 2025 23:09:54 -0800 (PST)
Message-ID: <2bf5c46b-0b95-46ef-9c25-849fcba0f170@suse.com>
Date: Wed, 10 Dec 2025 08:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
 <32f54604-706b-4377-b59a-b287ef1afb3a@suse.com>
 <049bb40b-13f6-4b5c-9105-aeac03680f86@amd.com>
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
In-Reply-To: <049bb40b-13f6-4b5c-9105-aeac03680f86@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 22:55, Jason Andryuk wrote:
> On 2025-12-08 03:46, Jan Beulich wrote:
>> On 05.12.2025 23:40, Andrew Cooper wrote:
>>> On 05/12/2025 10:28 pm, Jason Andryuk wrote:
>>>> When linking to create xen-syms, add --gc-sections to garbage collect
>>>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>>>
>>>> We need to add KEEP() to the linker script in assorted places to retain
>>>> appropriate data - especially the arrays created therein.
>>>>
>>>> Something is off though.  In a test where memory_add() is unreachable,
>>>> it is still included.  I'm not sure, but I am wondering if it's the
>>>> alternatives somehow keeping a reference to it.
>>>
>>> Yes, .altinstructions contains relocations against the origin patch
>>> site, which will cause it to appear to be referenced. The same will be
>>> happening with a bunch of other sections.
>>
>> We will need to derive helper section names from base section ones. See
>> e.g. HAVE_AS_SECTNAME_SUBST as introduced by "common: honor
>> CONFIG_CC_SPLIT_SECTIONS also for assembly functions", controlling the
>> use of the --sectname-subst asssembler option, to in turn be able to use
>> %S in section names (available from gas 2.26 onwards).
> 
> I tried to add your patch and change ALTERNATIVE to:
> ".pushsection .altinstructions.%S, \"a\", @progbits\n"
> but it fails to build.  One example:
> ./include/xen/compiler.h:62:21: error: invalid 'asm': operand number 
> missing after %-letter
>     62 | # define asm_inline asm __inline
>        |                     ^~~
> ./arch/x86/include/asm/pdx.h:13:5: note: in expansion of macro ‘asm_inline’
>     13 |     asm_inline goto (                               \
>        |     ^~~~~~~~~~
> ./arch/x86/include/asm/pdx.h:22:5: note: in expansion of macro 
> ‘PDX_ASM_GOTO’
>     22 |     PDX_ASM_GOTO(skip);
>        |     ^~~~~~~~~~~~
> 
> ".pushsection .altinstructions.%%S, \"a\", @progbits\n" ends up creating 
> section ".altinstructions.%S" which doesn't helpful.
> 
> Is %S expected to work with inline asm, or only standalone?

Both, as long as --sectname-subst is passed to the assembler. My patch adds
that option to AFLAGS only, whereas for inline assembly it would need adding
to CFLAGS. Did you perhaps overlook that?

Jan

