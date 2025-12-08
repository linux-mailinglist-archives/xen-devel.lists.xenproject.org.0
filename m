Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB8CAC7C3
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180115.1503355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWVY-0003zW-87; Mon, 08 Dec 2025 08:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180115.1503355; Mon, 08 Dec 2025 08:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWVY-0003wx-5V; Mon, 08 Dec 2025 08:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1180115;
 Mon, 08 Dec 2025 08:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWVW-0003wr-NB
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:22:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc32cec6-d40e-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 09:22:07 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so26452025e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:22:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f75sm24496046f8f.42.2025.12.08.00.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:22:06 -0800 (PST)
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
X-Inumbo-ID: fc32cec6-d40e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765182127; x=1765786927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yK201ByNyyOdetdJF9IJ8QIIYYBRxZ8znqnN0c3/C4=;
        b=JjyIHjwS9lI8NDC4wJ/368+uzcXy5c4jevDhxsWAaxDf8FHggBS4YIMWdfyfYNtN2A
         cmqCf0LC64HII8Zu9Fz+b/5ZnpsFB7uQ5iYEjwwnWfdQI33jlbC9gUNyyGpaSNTbxUzr
         ZbVRTX+RD7PgQpyFki0LtvHN9FCEIjewDYj+4+zfmdMAKVPI3NTvE2HSDehczGezxLNb
         oglf6PIQV0wmMZRP5zyK+bH5AHQD00dDfxj5qt4l1/999M9xjUQeBvZujVjbry/ic8Pl
         8AFsK+CQIsLDja0M2C8zEmw1iWJn/wjxqwwWNEoD83eiXY1JD+ECNZpyDInun88/JDSn
         2tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765182127; x=1765786927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yK201ByNyyOdetdJF9IJ8QIIYYBRxZ8znqnN0c3/C4=;
        b=rcmSh3FkEIoOvN9dFtnLkj2uR0c78nBXaz4t2ORYQZhDmZNRatmMscz9FNDkE8Y0YC
         ZeIT39OoLGaYrIXNcOpm1gbHum0s6ONN/yK4epK4g+sSTMjjlavcoGfFl/lte3qNxJsE
         6dC8slQAutr7laulAlAjxMk0xmzOWTCRdk6GmxILJ7Zc3++LKx/MCaV0kUyPbNrbX1kU
         1HNMgQq7xS44P85fxZP52oDP4TQ0+/DFISbewU2WCjLblaye4QRKTYwXt1lIji/Alu+9
         IukXCsc0kDIlrdPmdSKteIoR5uywSFQdu4tDItz751+h7dk+ZcbzGpFizlvY+hkSuBuF
         CcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyxSTzmnFJ5OCL0oa+oiUn8w1SyKx0Q0UDP2dDz83dXhEgCznAIWDw2Ii3ap2wiQrZAdn4mKr6bQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3cG3Rv+jTIsJtHiCbOXOxSpTWEysuL1W2CTcJA8SFmo+ivsMO
	FPheqvkQkXlEBAEwX6RwT2XDKxPZk5Ve2ciF+smbeNZAxKFLmbjRg5fovJKWti1u0w==
X-Gm-Gg: ASbGncum/qeHMtxTu7WoEpzQNIz1C7B4QmmDhmCR28peOd64xHVlxnNmMdmAb7uJAha
	21dwEZP2mApCMUpcHBRH0gpto6BD8PHL4ieRWhiwaVAF3CMRyZtKvabHHwYvn/g+bfmAlkiplZU
	vgBxuE5MQLfGPP6DXO9LQUB/HE8GUq5A+sXddVr5gfvqJOTsOUeWcBNaRi9Kc1YDK/8oVnCesIg
	zoiCZaCgUjmh/4KYIQjW5S+1UaDSptkHHlNxAkX68t3w74ca35z/HTuk+zDUlxVIunpyM+rVxqV
	4uZLhXZwhVEYBj0ojrbAgtT937t/VgTOJSlVtMJizoqhWOTyaY/cw6Fwpnh80/wIMOcvokQvMKh
	boq/Y6+MkmJW9Rhmjw97jSqf5BlgaTsUN56b9LGvCOFP16LAYdnH5MPjOH+tNJ5SlLYab1+dOQh
	OR1a4bMemLtN6SKcGCc5hPDINjtdvrf9D/DcJAPaSfCAAI+uHAByHQ5IQcWXOx+hWjU2fGvaGTP
	hA=
X-Google-Smtp-Source: AGHT+IEC58WWkPpLAzvlNO120X7t3ZlXfbBwN6uepFUUIxLnGmRN8nORovA3SWXd/Q2KWgQWF3aJ+A==
X-Received: by 2002:a05:600c:524f:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47939e282efmr73345165e9.26.1765182126891;
        Mon, 08 Dec 2025 00:22:06 -0800 (PST)
Message-ID: <c18468ec-fd9b-4d28-a210-68962b1d81c7@suse.com>
Date: Mon, 8 Dec 2025 09:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] Do not attempt to workaround older binutils
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@citrix.com>
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-2-frediano.ziglio@citrix.com>
 <ac0a0539-572a-44a3-a2ee-b56a77e69794@citrix.com>
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
In-Reply-To: <ac0a0539-572a-44a3-a2ee-b56a77e69794@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 18:44, Andrew Cooper wrote:
> On 05/12/2025 4:09 pm, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> Older binutils versions do not handle correctly PE files.
>> It looks like they could work if they don't produce debug information
>> but they mess the PE file in other way like putting invalid
>> flags in sections.
>> Also different tools will complain about the format (like
>> objdump and strip).
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>  xen/arch/x86/arch.mk | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>> index 16368a498b..10eb8e4292 100644
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -88,13 +88,6 @@ EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long
>>  LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
>>  XEN_BUILD_PE := $(LD_PE_check_cmd)
>>  
>> -# If the above failed, it may be merely because of the linker not dealing well
>> -# with debug info. Try again with stripping it.
>> -ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
>> -EFI_LDFLAGS += --strip-debug
>> -XEN_BUILD_PE := $(LD_PE_check_cmd)
>> -endif
>> -
>>  ifeq ($(XEN_BUILD_PE),y)
>>  
>>  # Check if the linker produces fixups in PE by default
> 
> Given the practical breakage, it's clear that noone's using xen.efi
> generated from toolchains these old.

Where are you taking this conclusion from? The description saying "putting
invalid flags in sections" is pretty vague, and doesn't clarify whether the
result is actually unusable. I've been using xen.efi from various pretty
old tool chains without any issue. I may not have done so recently, but if
there was breakage there this would be a regression on our part then.

Jan

> So, while it's not completely ideal to be "dropping" xen.efi on such
> systems, it firmly seems like the right thing to do overall.
> 
> EFI support is still available on such systems via xen.gz + MB2.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> 
> 


