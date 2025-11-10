Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31809C47B12
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158530.1486869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUD6-0006vy-C5; Mon, 10 Nov 2025 15:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158530.1486869; Mon, 10 Nov 2025 15:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUD6-0006tv-9E; Mon, 10 Nov 2025 15:53:40 +0000
Received: by outflank-mailman (input) for mailman id 1158530;
 Mon, 10 Nov 2025 15:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIUD4-0006tm-WE
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:53:39 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b15f0dd-be4d-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 16:53:36 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b64cdbb949cso548678266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 07:53:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbca75bsm1154852566b.14.2025.11.10.07.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 07:53:35 -0800 (PST)
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
X-Inumbo-ID: 6b15f0dd-be4d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762790016; x=1763394816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6YacTpvcvzIyAZEz+zA694UUn9SpWUXLp8JDTFmmwg=;
        b=HJNfyjZVuiDVIBpOhwtPVAAY5vvxANqKrbpXgXvXZKExL3qCAgZYnVgEoDPd8u9TiG
         dWoAxwRfg4Ne5z9KnI3VAHnoTqELzXDEicygMf0eOTI3JxAjG1+5zUqpZi+U4g2PQpyl
         c0SExqv5tOLWrhRf/enaEUgeJEGYKKJj4gGiwY07NvVGw6pwN5+QgvfuXsse0Z+lyvyE
         2i+R7RFVuZSqDezP9Lxnchy8JX2mNfRIUxigvd0vJhWHopcQmDQst/gbmUvA0aPMLpje
         MMJ70/HjxMVWi9fxI1MQvalI3ji7v5Eo2s83n9WmK9R6fbHnLImQZnoP6nUxTNIqJQ0V
         j1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790016; x=1763394816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6YacTpvcvzIyAZEz+zA694UUn9SpWUXLp8JDTFmmwg=;
        b=spPB6/i6zrPzT8NAuu3jnMP9cb4ONgW6zKPHtQTugrswktpu1QNmtg3lZw/ppPue3Y
         FhRif+Wpwbr7PSEw573hvX56XHI7ZugAfa/pLAYCSF03Xk2cbV5RDQCw7v5RLnHE7DNo
         h02Av03R7MOAeECtXS1OFOKlWNX824pSeSaGyx5WU0nskmfL/dtzw4/j8uIE6gIknI43
         2p1SZxkDv0ZFwKNuJmxvJP8xTwTJp7PSbY0+yj206NREedVFr+bZ987X2kjMmcelCN0y
         /bDgacRDvvlISmyQuX5SC7bLCL0USXvsNEKfWdhpp9WGK2i9vJcvTpWx0ep9wcXw3OsA
         5siw==
X-Forwarded-Encrypted: i=1; AJvYcCWZoG9KrmIY4AyImTsU+MaRmxjM13E/ftw9zhvxkWrSh7ZqNroS3W6SHZUcSPWQCGVEnvv4SkgOjH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3LezpyUnE1HB3AKOti+FDRfAG8woJ9ouqU/636tV3YQ4id5sI
	QtvCeVD61fIdZzsbaTJO3plYezJxyJCIDLpEjsLyFRvtdlz/YJW+WOoPZofGaN7mOA==
X-Gm-Gg: ASbGncu3Cn1sl9NtliAIeYLuu6zB4Lh3eRdi2ciMA36EijgjC0PFMEcZramdLbcMJil
	jPI+VKa1xbI+ObYjaAPyLtNNMHydsA8uWITK+LBvMF0msxl5wDn0ZRqle1Ip74F5aUj+bJliHiH
	lopooaAcu601m+/xxOPFQTGJfWaSIjP1RzY0/O/wqyYJWciOqEc+fIn8usgTOu2t9n3rKjiwwcs
	mmMYDLBwgvAwySccSIZNQj9pd62ooqlhdfAJO3qg59zAnoZyYz9PjOC8IGhoiwfh1aKexSpE8LT
	bRv62JfwECyKFwzqbmSKfBWoa3qKoWQJbDmeGiOcrhek1GKAaXDNTi8y+Ixjc8CXWcKaMpk97w5
	AYGIwnIO40gqiPK9NC3uJhWZzu8zhV0DVQkUr/DoGirEmvifJE9Aa1AvZnsRHdRVgdHzeiMrkDv
	9vcDXB3tiUpo8Nr7ELPBasIqa0QPE4mVFRx8GuhRSbxELITWzdzzEYMjy1+u+W0dtS
X-Google-Smtp-Source: AGHT+IE578uK7GZ+f7Ttd7MefyFPM32tQjTwAPBVZ8hTP/Fhn5qvp9xRjviYT0uof2Cmdr1fqL9/iQ==
X-Received: by 2002:a17:907:3e9f:b0:b70:6e0e:1a07 with SMTP id a640c23a62f3a-b72e036c995mr907126666b.27.1762790016106;
        Mon, 10 Nov 2025 07:53:36 -0800 (PST)
Message-ID: <2c3fffbf-68cb-4850-95f2-71ae1af1a6bb@suse.com>
Date: Mon, 10 Nov 2025 16:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20251110125859.78124-1-frediano.ziglio@citrix.com>
 <55f0f1f2-3892-44fa-94d6-15e0e8513ef1@suse.com>
 <CAHt6W4d3dJrmJ9DM-6Th+0YsUaJGH7Msvq_t6GpffJu7rALzbg@mail.gmail.com>
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
In-Reply-To: <CAHt6W4d3dJrmJ9DM-6Th+0YsUaJGH7Msvq_t6GpffJu7rALzbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2025 16:36, Frediano Ziglio wrote:
> On Mon, 10 Nov 2025 at 13:40, Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.11.2025 13:58, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -228,17 +228,21 @@ endif
>>>       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>>>       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>>>             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
>>> -           $(note_file_option) -o $@
>>> -     $(NM) -pa --format=sysv $@ \
>>> +           $(note_file_option) -o $(TARGET)-syms.efi
>>> +     $(NM) -pa --format=sysv $(TARGET)-syms.efi \
>>>               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>>               > $@.map
>>
>> This part if fine with me now.
>>
>>> -ifeq ($(CONFIG_DEBUG_INFO),y)
>>> -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>>> +ifeq ($(CONFIG_DEBUG_INFO)_$(filter --strip-debug,$(EFI_LDFLAGS)),y_)
>>
>> This extra change looks correct to me, yet I wonder if doing it this way isn't
>> fragile. If EFI_LDFLAGS wasn't set globally, but only for xen.efi, aiui this
>> wouldn't work anymore.
> 
> Maybe, but it's not a regression of this patch, the same test was
> present before, just using another syntax

How is it not a (latent) regression? It is my understanding that the ifeq()
is processed when the Makefile is parsed, whereas the original $(if ...) was
processed as the rule is executed.

>>> +     $(OBJCOPY) -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
>>> +     $(STRIP) $(TARGET)-syms.efi -o $@.tmp
>>> +else
>>> +     mv -f $(TARGET)-syms.efi -o $@.tmp
>>
>> This, while I think I understand why you do it, looks somewhat odd. Plus the
>> reason you do it is, like ...
> 
> Can you explain why "it looks somewhat odd" ?

You're moving a properly named file to a temporary one. (Just to later move
it again.)

Jan

