Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B623951A03
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 13:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777094.1187283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seCHW-0000uZ-Hb; Wed, 14 Aug 2024 11:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777094.1187283; Wed, 14 Aug 2024 11:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seCHW-0000s4-E9; Wed, 14 Aug 2024 11:35:10 +0000
Received: by outflank-mailman (input) for mailman id 777094;
 Wed, 14 Aug 2024 11:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seCHU-0000ry-Hl
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 11:35:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41b6f454-5a31-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 13:35:07 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a8553db90so774325366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 04:35:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414f059sm160390366b.158.2024.08.14.04.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 04:35:06 -0700 (PDT)
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
X-Inumbo-ID: 41b6f454-5a31-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723635307; x=1724240107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TdcdNZ0L1cdf/nzueErIj9aMhdMrYc9i/EhAHBZuZBU=;
        b=fsN2qAMeTuSBxurAqJfykkxiMZ2AEQUsLCxL9g5u8reUID+DPMl0DIZwYlqDlzZcMy
         ue42bJZU2DEpjycjM33kjavXJk8Z1bVzfETH+APQz7HL8n2GwIXRX2btbuswuPlc+zT9
         rv9IrsSi+ErhD5b9KMqK9G2BHNn2bQcgDfvNnWFzM8ZVLhsUkOJRE+neu7NPOaH99Ld2
         q0dSkn3T/X/mvCKXpjh1HTcKQLoVSIz5ipbBMcvuD+ulEwbU9+saS6FB/rbx04j+rawO
         5KBT2pemNgh+e7AhkeF/iMtDgC+QF7JWty95DTocmuaKDbmwCDwW15kjvfQtqDZZDTMJ
         xoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635307; x=1724240107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdcdNZ0L1cdf/nzueErIj9aMhdMrYc9i/EhAHBZuZBU=;
        b=cpwyvXQV+s/yDyQEWbJ5aU3glQOjwNlNBb4ufi532LqrtNTGb/36KYJAYD78P+2DPy
         Z3x1rM/HMQUTjWH/gPAFLR7lT36F4dc8wRF/giBPZcGGNpW3hmdciTJMPEV07/lXFkaV
         ZcNl8LFFb5TMSQtuuRLj9frn6i/tEAm/myv1aPqHkybyLSB8hBuPdpvGt+3pLqdAAZ+S
         n6S9ZYgPOkWuz42nVtnMHQxCEKztSyzxrJ2qt0Nn1gLMG8LDD3c2Ti6nICmA72vEtWBt
         BPH8N1F3s97cbi4swxxZh7NeXIKuv7T2Y9/wWCm1s1WWhnXjtQ+kYRxnjGVfOXk/Rh51
         GRXg==
X-Gm-Message-State: AOJu0YyOLWD5u6lc85xGB9dUx59o/ICHTALFj7HUS5S4apX5nyeYkFIN
	cnRtMfRVlQHwY57e/8iMp8oBIFJy5OrSb02S59JBBt9kp3PyrnqJZHXKHtYnEw==
X-Google-Smtp-Source: AGHT+IFCvoZ+VQlkGYWYdFJQsx7naoy5m9vu2Llx69Wj63dkO9LJi0FoEA+CscJaqwi9XkBQWe/O4w==
X-Received: by 2002:a17:907:c7d7:b0:a77:e48d:bc3 with SMTP id a640c23a62f3a-a8366d507f5mr167665766b.19.1723635306793;
        Wed, 14 Aug 2024 04:35:06 -0700 (PDT)
Message-ID: <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
Date: Wed, 14 Aug 2024 13:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
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
In-Reply-To: <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 12:55, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 14/08/2024 07:37, Jan Beulich wrote:
>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>
>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>> with new memory attributes. Since this is highly dependent on virtual
>>> address translation, we choose to fold VMAP in MMU system.
>>>
>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>> depends on VMAP.
>>>
>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>> While I'm not an Arm expert and hence I'm likely missing aspects, I question
>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>> conclusion towards the usefulness of branch hardening. I would advise
>> against encoding such a connection in the Kconfig dependencies.
> 
> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was 
> added.
> 
> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/
> 
> And from 
> https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
> 
> Spectre is valid on MMU based systems.

Since then various other issues / flavors were found. I've been focusing
on the x86 side of things, but I'd be very surprised if some didn't
affect other architectures as well. Plus branch hardening can be a pre-
cautionary measure, too, I think.

Jan

