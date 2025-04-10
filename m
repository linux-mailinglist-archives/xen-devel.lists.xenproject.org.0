Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB43A84715
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945892.1343972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tM7-0007bA-3E; Thu, 10 Apr 2025 14:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945892.1343972; Thu, 10 Apr 2025 14:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tM6-0007YQ-WC; Thu, 10 Apr 2025 14:58:15 +0000
Received: by outflank-mailman (input) for mailman id 945892;
 Thu, 10 Apr 2025 14:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2tM4-0007YE-TV
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:58:12 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3658c503-161c-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 16:58:07 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so783801f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 07:58:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893773c1sm4962502f8f.24.2025.04.10.07.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 07:58:06 -0700 (PDT)
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
X-Inumbo-ID: 3658c503-161c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744297087; x=1744901887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sn/h+VF9LatSkgYYPkgoWVF5L5WFJbZy7qkO5lRw3o4=;
        b=BCt1A7r0qXkrtpDL1pnz+D+4abp2NiLqZbu2bR7+8dhqm8KiEoQw7vzxEC3zH+I+st
         5OzH8N56vr7qdpMsk2iE37IqZZrS1HZot8NsZD9zw88Rn7KRvfCHFupW1g2htTlCqRoo
         SrLrexK9GLAE/YbiBW1A6y+DWGHs1hSG/z1mfCLwwJuaZ1W9yQqwxh6HVy+UWQ+dYgWK
         Pfz5DBFPDu0j9uvwcyU9T2ll6Xk/j++LGUg8y1abWozJkWu9VVbyQmnArTc1f4kGY9v+
         N8pLMQSqZMrS1tljwswa4t9fSu6K2dbkUj3nDQZLecReRvcM72R17XboG2OmQwtpZl0q
         Us1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297087; x=1744901887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn/h+VF9LatSkgYYPkgoWVF5L5WFJbZy7qkO5lRw3o4=;
        b=SLWxp14Xz6rue84NyxIgMn5JyuYu5SehccqBa2j3qiSHJ+/mJNNzZqemECdviJtuN7
         L8U5hnHE4IKkYdmebscozfUZUyfrumDBINeuUU5R4qrdcwy81Nw7VhbgpSbWCTV2NEhq
         rxr6ilwx3DTor2qSwNwg5V6KyYBIjwY7lwoZL6VxdRR7+dbE4mVh1tk+8CFdd/wnqecU
         q/YKQF6nPndJThLj6wYhmKnyrmPLfXGQNEM5iJSuU8TwE0ioafVgYKy/8g/jp2pIMkYA
         r1wvHcOxwI7O2A/H8ZiUQq5KX5tuQXVc13tA3pN5c1S0txXncUoVP8FKQrflJSESK6PV
         Zmqw==
X-Forwarded-Encrypted: i=1; AJvYcCWmXj1gQcmtNwmOXTeO+VrW9sBhrOZsyvqnnPQQILtWQB4V7wdMMh431uWUm/meYXvVq/g0Z1XZTbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWoI+BL9EoAQVoUzENhbpGmG75jytTQLoK/S1c204V+8rZs8yz
	8/Q9xgoVAZpORvO9IqzxeGlfl1AuQgAlQIlRS6NroJH8P5klywDPzS+OIZoKYQ==
X-Gm-Gg: ASbGncv8d+751Q5tOeAfJ+8rYXaps+wPZoqtMpvy2+yS6akf9cof94UWY8CMGgm+7LV
	WXNFLEQAJCkZI+FT2wuYXMDfoaBaLITaseddO3v5v3V0bWEHC8bg0lzslvSXv4Kgr6J0HzG+oe0
	Eho8vpcVZuNQKbtFu4ph0smLS6Bd43kKg0NPhsYQjziLS7tCv6F2qNCpPsztLPDrgEEpCrh2YKW
	+PFwSv1zQ8jihA7WFQCQDjH5gqUptBjzaUWp95CxenMkMs9dUscT2vGJIONgDwzB774cVrk8IZh
	TsxDedcjg9vWMuOZ5e/b/i+XEQO68R099pTH9Zp2322P67M0jJ+o+bYv9/XWaGBztCIRjiKxQtn
	bkDc/+Uy6OzBm7Falvlw5fmLCxA==
X-Google-Smtp-Source: AGHT+IGIqjieEiyVolNh2HQzLRAn3e0RmmiFZ4qMA1cMccuTQo35GyoKuPLp7JZ+ONJ7sy7hVAgLXg==
X-Received: by 2002:a05:6000:4014:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39d8f4655f9mr2454516f8f.4.1744297087111;
        Thu, 10 Apr 2025 07:58:07 -0700 (PDT)
Message-ID: <887e3990-a176-46fd-9697-6b89e87afb6c@suse.com>
Date: Thu, 10 Apr 2025 16:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EFI: sanitize DLL characteristics in binary
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
 <acb31eec-38ef-4e35-be71-9a6579a46159@apertussolutions.com>
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
In-Reply-To: <acb31eec-38ef-4e35-be71-9a6579a46159@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2025 16:39, Daniel P. Smith wrote:
> On 4/2/25 04:51, Jan Beulich wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -113,6 +113,7 @@ efi-nr-fixups := $(shell LC_ALL=C $(OBJD
>>   
>>   ifeq ($(efi-nr-fixups),2)
>>   MKRELOC := :
>> +EFI_LDFLAGS += --disable-high-entropy-va
>>   else
>>   MKRELOC := arch/x86/efi/mkreloc
>>   # If the linker produced fixups but not precisely two of them, we need to
>> @@ -123,6 +124,8 @@ EFI_LDFLAGS += --disable-reloc-section
>>   endif
>>   endif
>>   
>> +EFI_LDFLAGS += --dynamicbase
>> +
>>   endif # $(XEN_BUILD_PE)
>>   
>>   export XEN_BUILD_EFI XEN_BUILD_PE
> 
> Seems straightforward, will rely on your knowledge of binutils that 
> there are no unattended effects from the flags.
> 
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks, but to clarify: If there's an issue here, it would be with the PE
loaders in the various EFI implementations; the binutils side is of little
concern (as to the effects of the flags).

Jan

