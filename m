Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC7938DE5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761685.1171694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqrW-00047e-8Z; Mon, 22 Jul 2024 11:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761685.1171694; Mon, 22 Jul 2024 11:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqrW-00045c-5a; Mon, 22 Jul 2024 11:05:50 +0000
Received: by outflank-mailman (input) for mailman id 761685;
 Mon, 22 Jul 2024 11:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqrU-00045W-Vt
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:05:48 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58eafbbe-481a-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:05:47 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeec60a324so54401891fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:05:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a44cb995absm4330918a12.45.2024.07.22.04.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:05:46 -0700 (PDT)
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
X-Inumbo-ID: 58eafbbe-481a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721646346; x=1722251146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qGyR88A/hBUnz+cJs6sjjjIgO4VsY7v+pM3503uK4B4=;
        b=E+2uGM+I1JtuBsGgBcZ3ER9FYehvxD9lXwgxm00OBIRwxGGJ6DcAe5+VoioVnEwaH6
         ox3GSiCIG8EnWBuHAmBnPbvP6rLG8BwzC9KPOdA5C7LUijfoix5qtoW1t8sORcpE4wrc
         CYEq1fO2TUXTHxnCZpd0xnZOsocDHFOGMGaTWlpdBDbVYpC5DFWjUuUXlC7g0SpmnH12
         fHUWTjAEd2H0qzvaueU2RfAi4T40JfkBtfvInsxiADlm2BHaPi4ui1ANJnVYzyNr0mAO
         tmxmVSzIZXj5NmuplDep+FrolPCrIoL1Cgv23bZC/1SdPKNlrT72qILm2gZbpX5uB54i
         Nvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721646346; x=1722251146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGyR88A/hBUnz+cJs6sjjjIgO4VsY7v+pM3503uK4B4=;
        b=BbMXsMPdq0giD9Z7UzSHDWqSBIji+HyA+hRyiU1oDz6Lagb0bTkMNwA1CSS/UOEYLv
         i4of7fRvshgPL88ifgYiWW15h6xJDsi+ozeQhItsf/WyoEa4jf7RIjK+XcTIYLHOXdti
         sW95wfJtW1yAem6aEzxGlTPdhMVmhnLxxNvvOO7AoCCS9nlcfUwQ/Ssh6FhRPTfhDMqS
         DIurv2TwedJtZXf6DGxDpjxuvGnH7MRCBXGubW4+bbtx8Df/mZ6/BEvKYwKtjt1Oz6bR
         0oEd8o7nSjGPZPMueJl6BcedTrhzYdQK9hUzSEtEK94N1/oALLR506bsGneJ6qb3vrhT
         mBtg==
X-Forwarded-Encrypted: i=1; AJvYcCU0AE0ODt1kT9Lc/xqx6ZzP0F+EY0VbGV3JshqcMTXsnsTJJgJwQWlUU58vBa5ITK4bZ2rayg48LUz0VxpQrtRDKtgBHfk/g17jk8Z0ono=
X-Gm-Message-State: AOJu0YzEsMXxX+lw7sbkNghwXbbbdzfPLrKcyNgKghcwg0I25nmNiQfB
	PzEclre5kuL0qOXxVRSWGhoZI1QtoBOyzr7yDtEql2vkbTxN+9Imepx9MyQk5Q==
X-Google-Smtp-Source: AGHT+IFq1JNraLbCBk5opjN1y/GiEVYtJwBG5aCTQGoQ/om1cXSxcbhZ4P8RiIdlzMUNmukdZK2UzQ==
X-Received: by 2002:a2e:b052:0:b0:2ef:20ae:d117 with SMTP id 38308e7fff4ca-2ef20aed353mr49948191fa.10.1721646346474;
        Mon, 22 Jul 2024 04:05:46 -0700 (PDT)
Message-ID: <0ae9e579-7d96-41f2-8f6b-2ee3394b3afe@suse.com>
Date: Mon, 22 Jul 2024 13:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com>
 <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
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
In-Reply-To: <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 13:03, Tamas K Lengyel wrote:
> On Mon, Jul 22, 2024 at 5:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.06.2024 00:47, Tamas K Lengyel wrote:
>>> This target enables integration into oss-fuzz. Changing invalid input return
>>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
>>> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
>>> build.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> I've reverted this right away, because of ...
>>
>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>>
>>> +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>
>> ... this causing
>>
>> gcc: error: unrecognized argument to '-fsanitize=' option: 'fuzzer'
>> make[6]: *** [Makefile:62: libfuzzer-harness] Error 1
>>
>> with apparently a fair set of gcc-s used by distro-s we use for CI.
> 
> Well let me see if I can hack the Makefile to only build this with clang..

And perhaps a new enough version thereof? Or has the option been around there
forever?

Jan

