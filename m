Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D475C806912
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648966.1013106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmsj-0006Sh-V5; Wed, 06 Dec 2023 08:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648966.1013106; Wed, 06 Dec 2023 08:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmsj-0006Qh-SW; Wed, 06 Dec 2023 08:03:45 +0000
Received: by outflank-mailman (input) for mailman id 648966;
 Wed, 06 Dec 2023 08:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAmsi-0006QE-9d
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:03:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f940b7d1-940d-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 09:03:43 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso36796195e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:03:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0040b45282f88sm24533118wmq.36.2023.12.06.00.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:03:42 -0800 (PST)
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
X-Inumbo-ID: f940b7d1-940d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701849823; x=1702454623; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oI+yvhZvfHWj13V/LzQU0MG0M1pV6Mfy3pqbwS+VTQ4=;
        b=J1/2M++i/ErLdKeo2iGdSzA2pnllTQSynppxHDfCNz58VMKdKPYs5FQNeTBrW0jXw4
         NKXMSw5/mRSJjQ/CgExTAx4VJLU6Aop44ufhUVNFKKj9fXJ899BrQeTjmQA5aLQsXFY8
         VehU0mLfqGxSkKLMVhuwAbzH4IUXafYFTAovNakg2wJUQ8uul3U06oEJ/kBqdg9pacpr
         eSKpo5EgsEsR/BUoC0UkmDCGCWJU6zCtjPm/fJof3FQWs7Vmvz0cRY8yDtPTAWXOekhT
         kYPgq7vF5mv659a4RvCwBVUE154Ynb0jr+9iFCXiXnpeWWfDyovaRtMb31FUbVH8nwWv
         PkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701849823; x=1702454623;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oI+yvhZvfHWj13V/LzQU0MG0M1pV6Mfy3pqbwS+VTQ4=;
        b=ivT5xA88DRF4mR1bDwoWyKLxLfl/1AOjH7rDjp3HEFsBafckcxVAEx3GPeEr87SUNy
         Ub/jmMBpN20idP9GTqnHHqpX2Bmzbtng60rXKvqlw4nvryqB9igw15OfI/LymJm0Pkb5
         9R0lZthl8NSPQmxl3wZdixrewlG8Wrv9HbRLvsrMpUM7Pf94sg6fdbsf25VuHgnsMuQi
         MWsHFtnRo3YcrvFjFd/gx89DEXTLjjDN2hNNHvZYyV4mat4guteiKXdZ6iqtptusXp4l
         k3BY/qvCRFYAaYFomrLg0AnHFFPsQGERbqFRsFz8Evul/gf98ZlOJsvbWxPBiZfaJKfN
         nwmg==
X-Gm-Message-State: AOJu0YxVztZE88gAT91AHeBNPLXSmJEYasLrB79/b+MDcKmf3wAwPeuQ
	AtdJPuaUGCRZGBC7e+69dsA4
X-Google-Smtp-Source: AGHT+IFpGJvCMc4NCtV8W6Zs7H2aSSHAkAI2tvK7W8bnBUr2UHCBeZEEQ+wS3KmMGDC/RiQT/xv2hQ==
X-Received: by 2002:a05:600c:5248:b0:40b:3441:37 with SMTP id fc8-20020a05600c524800b0040b34410037mr164428wmb.30.1701849822756;
        Wed, 06 Dec 2023 00:03:42 -0800 (PST)
Message-ID: <65972619-874d-413d-b02f-e4ce4da0cdea@suse.com>
Date: Wed, 6 Dec 2023 09:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/6] xen/acpi: address remaining violations of MISRA
 C:2012 Rule 8.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <6c0fa7c13641c53800c323285275fd58d9989326.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051905050.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051905050.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:07, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> --- a/xen/arch/x86/include/asm/acpi.h
>> +++ b/xen/arch/x86/include/asm/acpi.h
>> @@ -81,7 +81,7 @@ extern bool acpi_lapic, acpi_ioapic, acpi_noirq;
>>  extern bool acpi_force, acpi_ht, acpi_disabled;
>>  extern u32 acpi_smi_cmd;
>>  extern u8 acpi_enable_value, acpi_disable_value;
>> -void acpi_pic_sci_set_trigger(unsigned int, u16);
>> +void acpi_pic_sci_set_trigger(unsigned int irq, uint16_t trigger);
> 
> There is something strange about this one, I cannot find the definition
> anywhere. Am I missing anything?

That was apparently added by mistake in 0de39e40277b ("Update ACPI headers
to Linux 2.6.24"). I wouldn't be surprised if there were more.

So yes, the line wants deleting, not updating.

Jan

