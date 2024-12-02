Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A69E0094
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 12:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846557.1261727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4er-00031D-68; Mon, 02 Dec 2024 11:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846557.1261727; Mon, 02 Dec 2024 11:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4er-0002yd-32; Mon, 02 Dec 2024 11:32:05 +0000
Received: by outflank-mailman (input) for mailman id 846557;
 Mon, 02 Dec 2024 11:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI4ep-0002yX-HB
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 11:32:03 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae618fd-b0a1-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 12:31:59 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53df7f6a133so4344850e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 03:31:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f32837sm151757135e9.33.2024.12.02.03.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 03:31:57 -0800 (PST)
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
X-Inumbo-ID: 0ae618fd-b0a1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBhZTYxOGZkLWIwYTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTM5MTE5LjIwOTAzNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733139118; x=1733743918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7W6yN9rr3CDp87MekTNE2ZiQgK62p8TOhOvutuhiLzA=;
        b=Wy/sKZt3NXLUU4CAUxNaFHKc9aPpbLAev9oV0xFfF67Td54NkXbreo2GhGSBlNFqn+
         8vfob89YXTtTkdRvuvdVvMHF8fotAvuXbki+NuMLZR5mkwqwaluax/jIXpeVuFFFpqNX
         fquVzvlUlLK5ulHLMnqpCoXCUYQ00e/v8aurf95m804hRMc30KtZTdwP7/p5BGEfbuev
         Qd44k7KqC2p4eExIO/wgbgSaRLmVPWq/RTfPzTPm9h0oHjRC4XTMpAT8fWWKWa0cpQF3
         eJcFs6OC92fUr/RLxfu44DhrX0sCDwN7Vapb+es2TuerJi2Rsox6LqlZRQLXr3MH3bUf
         c7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733139118; x=1733743918;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7W6yN9rr3CDp87MekTNE2ZiQgK62p8TOhOvutuhiLzA=;
        b=VvMPpoYFR/92LaK0cpMYwVXq3QYUStXFlqy86C2zki31z6J+4o8GIqksSSM4aqdXOy
         UYWaLoxCGUmq1wXMFxPWtd2/XS9OyJ2HhYQAxA/Am1nCBcmC5QJeVMhZGDsBZJK7n+EO
         6/RFHx4hHgCg3FNk0IJ+zPfAYZv8jMP8BUSKH3FTpbMy0zeAi4i8rTLwEA/45niAZuoP
         mvzJSLRpF2AFP0B3rzY4EqkVeWMN7jRCTwdsvY3mdkFrngy972T3O060iGKpV2cZGjpV
         n4ozOvioGLpOt6UU+lvx2pow/YkAUgwhCvGKb+Fy5G2px+RX+Gxf7jWQKRmqqK/L06D1
         lh/w==
X-Forwarded-Encrypted: i=1; AJvYcCXF0LNVv+P9UDl8tuAdtzrp/i0Yj3kWx2MPnNbnotbFpmt2I9cVvQhU+//AJiDrdvEBigvXQWfIBcw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrnwNcGjERUGuD6UCWuTHnp3trVLlm/PtUK8IOE2aUnooweByI
	1qFNcgX3ZCJS04QGNq5jQqktiDYLLL/QB/j/45oaPtF7td1iH2WSorelzZ2H7A==
X-Gm-Gg: ASbGncub7FB90+HE7jWG0il+u+t295/YAncbpWJudbpIO/xLkSy/Zzfxe7l5ULo462W
	Rqx3zVeSlQIjo91iOt94Xt+s5tz1p0hGUfy4rrf4V+cZwWx1pXUfYGEwHXlv1s16vgB8B1ywmpS
	iI0KIvLn6i7BpmfnaXso/7ZimxsqLthwaJl8o59Lv6Q5T8ualYud9T3wrppLTKdE0oltfZVIe/q
	FcQhAhSCXGnfP6t3WnvplisdngRzgVn6+4GfUGMUt2s/1VsVOutUGsUH11HLNWXO7whLPPbY4rk
	E8kIxuE0dDPaq2VCRxzhwff6eBh5g3osjJI=
X-Google-Smtp-Source: AGHT+IFvKFyDupidQRSg9AzsJwhmta/oSD0PQSMX15ucz9Cy0E/RELT2g7pr2BinlzgxH6Qto3czdw==
X-Received: by 2002:a05:6512:3b9e:b0:53d:ed7f:8154 with SMTP id 2adb3069b0e04-53df00d11a7mr10257611e87.21.1733139118573;
        Mon, 02 Dec 2024 03:31:58 -0800 (PST)
Message-ID: <26418af7-0b5b-495c-8815-ce7305951beb@suse.com>
Date: Mon, 2 Dec 2024 12:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
From: Jan Beulich <jbeulich@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-2-volodymyr_babchuk@epam.com>
 <56f5cf93-33fc-4314-8d38-93d9e0026429@suse.com>
Content-Language: en-US
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
In-Reply-To: <56f5cf93-33fc-4314-8d38-93d9e0026429@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 09:06, Jan Beulich wrote:
> On 30.11.2024 02:10, Volodymyr Babchuk wrote:
>> This patch is preparation for making stack protector
>> configurable. First step is to remove -fno-stack-protector flag from
>> EMBEDDED_EXTRA_CFLAGS so separate projects (Hypervisor in this case)
>> can enable/disable this feature by themselves.
> 
> s/projects/components/ ?
> 
>> --- a/stubdom/Makefile
>> +++ b/stubdom/Makefile
>> @@ -54,6 +54,8 @@ TARGET_CFLAGS += $(CFLAGS)
>>  TARGET_CPPFLAGS += $(CPPFLAGS)
>>  $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>> +$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
>> +
>>  # Do not use host headers and libs
>>  GCC_INSTALL = $(shell LANG=C gcc -print-search-dirs | sed -n -e 's/install: \(.*\)/\1/p')
>>  TARGET_CPPFLAGS += -U __linux__ -U __FreeBSD__ -U __sun__
>> --- a/tools/firmware/Rules.mk
>> +++ b/tools/firmware/Rules.mk
>> @@ -15,6 +15,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>>  
>> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
>> +
>>  # Do not add the .note.gnu.property section to any of the firmware objects: it
>>  # breaks the rombios binary and is not useful for firmware anyway.
>>  $(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=no)
>> --- a/tools/tests/x86_emulator/testcase.mk
>> +++ b/tools/tests/x86_emulator/testcase.mk
>> @@ -4,6 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
>>  
>>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
> 
> Is use of cc-option-add really necessary throughout here, when ...
> 
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -432,6 +432,8 @@ else
>>  CFLAGS_UBSAN :=
>>  endif
>>  
>> +CFLAGS += -fno-stack-protector
> 
> ... is isn't needed here? Iirc the compiler version ranges supported don't
> vary between components. Then again afaics $(EMBEDDED_EXTRA_CFLAGS) is used
> by x86 only right now, and with cc-options-add, so perhaps it (a) needs
> using cc-options-add here, too, and (b) it wants explaining why this needs
> generalizing from x86 to all architectures. Quite possibly hypervisor use
> of $(EMBEDDED_EXTRA_CFLAGS) may want generalizing separately, up front?

Correction: Except for PPC all architectures consume $(EMBEDDED_EXTRA_CFLAGS)
right now. So the moving is less of a generalization than I first thought. I
still need to get used to passing -R (rather than -r) to grep, to find all
instances I'm after ...

Jan

