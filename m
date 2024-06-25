Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB42915E90
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747192.1154527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzEc-0004Xr-Vw; Tue, 25 Jun 2024 06:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747192.1154527; Tue, 25 Jun 2024 06:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzEc-0004Vn-Sb; Tue, 25 Jun 2024 06:00:54 +0000
Received: by outflank-mailman (input) for mailman id 747192;
 Tue, 25 Jun 2024 06:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzEb-0004Vh-48
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:00:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47086dbd-32b8-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 08:00:52 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so56328441fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:00:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7069afb8bd8sm403788b3a.145.2024.06.24.23.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:00:50 -0700 (PDT)
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
X-Inumbo-ID: 47086dbd-32b8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719295251; x=1719900051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QGYTSjuyk5eWZDroKLLfQ8zBgMUfQ/0YGkUFlSNGDdY=;
        b=JHT4r4J+XvSDTg1d6Hecc+cV1rB9CyI2YkNEm9V09AkO1rpV+abwxA0eeVaKOxuDbA
         oYSbrJpRFz+QSlDrILg0upHmiUnMA7Xz094AQWXWkZwIwSR3H5NvV3fN8sdCfuqG308E
         O0YqpXSABnpNi08R7jMhfnBTu+lk36LgZ7PA4nbR5DsZOSmhTf8lVm8WR4vtWF13qPuG
         rBHrJis/gC7z+vrX25e1ggYc+4qFVI7zR2icvaQjBuF5DURgh2kzzaGkqh/APgjuDfQB
         I2LLoWNVKWBm6w3VJPhLbJPdkyXx0OrjUxUE2SzIyX6nmeF02yJ+qUfqdaHN3q0ZdgvV
         kJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719295251; x=1719900051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGYTSjuyk5eWZDroKLLfQ8zBgMUfQ/0YGkUFlSNGDdY=;
        b=Y5EWtkBFx7V3fr7gZxMIYFR3+53Xt6fcObbH2nQj3B0ohbW06mYvWZEbcZ6MKPRQ7D
         j5hJodP/7j9F0evrUkOmm4ziN8yZv0vZxLf2g2tYts6Jo6Vr8E7dN6Zgtu56gEQGQlJm
         +1ebFnhym/YSPMjOqvL/NzXIaVDn5so/CACWHh+FlfQ8TdhIONCwBIGVLJWqmL8xs8Fi
         xnnRo17tG3a5Puwo028w9B5Yh8ztWi57gLceECiH9Y6Po5nkGf6AEsQZotq1DaZw5SJZ
         9Ntno/aZ9KwddAhf7f64p3hOpUKyygPRX/xY/CwHN8I9c1fAaY7P5ud9FjNNc9O4JyRw
         p43w==
X-Forwarded-Encrypted: i=1; AJvYcCUt+O+H/xA7Y/bUh9rwIOORylwShDBeBrwntzDXnMehijB24zTjNRU1FUF/AP9HtYXQbDWEzw6HIG1DdORfBqcrjQ05NPhEaNh1UgmVDg0=
X-Gm-Message-State: AOJu0YzFBY/SYenDuLqCBQXkQO1qqiwuLvqiu6yRApDrIlpoa9KOenOv
	zmwzRffXwuYI7iuHGldEnbKFkMQjZaHPueLeht2Y+QtLVv1AtS1pyGmNugFgcQ==
X-Google-Smtp-Source: AGHT+IFHPCziqXXYtQLOVV6YdqS2rDgeQmRPUWNbvwHxqhexrUH8yl/yqPxSGUXTK+BddbkVzljhlA==
X-Received: by 2002:a05:651c:209:b0:2ec:5777:aa61 with SMTP id 38308e7fff4ca-2ec5931002amr50758901fa.3.1719295251404;
        Mon, 24 Jun 2024 23:00:51 -0700 (PDT)
Message-ID: <80d0578d-26c0-4650-9edf-6926c055d415@suse.com>
Date: Tue, 25 Jun 2024 08:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240621191434.5046-1-tamas@tklengyel.com>
 <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
 <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
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
In-Reply-To: <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 23:23, Tamas K Lengyel wrote:
> On Mon, Jun 24, 2024 at 11:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>>
>>> +libfuzzer-harness: $(OBJS) cpuid.o
>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $^ -o $@
>>
>> What is LIB_FUZZING_ENGINE? I don't think we have any use of that in the
>> tree anywhere.
> 
> It's used by oss-fuzz, otherwise it's not doing anything.
> 
>>
>> I'm further surprised you get away here without wrappers.o.
> 
> Wrappers.o was actually breaking the build for oss-fuzz at the linking
> stage. It works just fine without it.

I'm worried here, to be honest. The wrappers serve a pretty important
role, and I'm having a hard time seeing why they shouldn't be needed
here when they're needed both for the test and afl harnesses. Could
you add some more detail on the build issues you encountered?

Jan

