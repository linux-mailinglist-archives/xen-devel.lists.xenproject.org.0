Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB618C7525
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723169.1127770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZCf-0005T7-Fs; Thu, 16 May 2024 11:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723169.1127770; Thu, 16 May 2024 11:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZCf-0005Qu-Cn; Thu, 16 May 2024 11:23:17 +0000
Received: by outflank-mailman (input) for mailman id 723169;
 Thu, 16 May 2024 11:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ZCe-0005Qk-8s
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:23:16 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afe38048-1376-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 13:23:15 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so254659266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:23:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17886sm973560666b.210.2024.05.16.04.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:23:14 -0700 (PDT)
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
X-Inumbo-ID: afe38048-1376-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715858594; x=1716463394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2guZqs3YJwFfLDpBOb46zWp8VJ6xG7fIxOb5wDm9pOE=;
        b=GPh3hLL7dZaZL8lGAJspj3k84s1BgKQQxMJ0gjCRXXu9BmHG+AKvwigGYf6eEKlsYR
         QW/lX5BwTCDRK4S8LI1nua27fSdmMYq9CI49b936EpLqfTNPINSw/ZOjYFahT8j+HaWh
         +OGoc9fgkX4P/6h/4FEEvqP5PZXlGFLH+hwSxkqEYhDFtWY6EIBpM8kVwqB40zTzLYFZ
         LlrrVY1r1F7XVVN/g69GedYx1c0RDosoFAnfS2kBX8Nmc73xcm9TOoskTZM2Q92EntIN
         PBgKbb4SzLB2rkBqK4qzWcGt0bDxzG3KdWcgYV4ofp4G9uaoGptSRrO846RM3XNOuzHA
         tOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858594; x=1716463394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2guZqs3YJwFfLDpBOb46zWp8VJ6xG7fIxOb5wDm9pOE=;
        b=BqUCEyzqXUTCPdYoQixLHo3APeJuMcARTc9IcOlaWcMmLhHSs7AyLyNyhP19A8an/+
         dBpFIRD8/DRtl7Mi54Imwyzi+gJUoUh3yJcHrbTnKFDhOAqRn+6Q1X+wkgfLC9mv9TFr
         aTyRrpUBoBWYl6N7Q0olEQhQYDIUFAXmsExGA87yZGOcHZ85e5TCX0OK6NUOTO4hXP1p
         ygx34aqftAcXOw8IZcHoxDTrr5xfniF4+IXU92rTjqP7E3fFNKttV96rtKkw0Tl1GkC/
         x8COTadNVd6n15VutF7s9/bVnhNyU21yRimQgx2KLEFBXEb651djwdQqO2TM8PY9qBEr
         Kk2g==
X-Forwarded-Encrypted: i=1; AJvYcCUsVyTjSDnm9ofYBc1qQkaxaY5zmQMIw+jcEoXP1CE22TJ+rRsD5fRpKwV+QoRFPDU2CW0dz9P6xCE+muHmXJ/RMo22Per7lRbOrBLD45w=
X-Gm-Message-State: AOJu0Yzm6Oh5Okv5pNuvdkqFO6aoYSwf5fephwGTDVn5KtJsIqbvx2z4
	1Q47qeijutU9wgcvgIsfebuV/aiSQK3b3eCDjU3cqpphXkkMVz7CXUOyHnqPUA==
X-Google-Smtp-Source: AGHT+IFDLMqw6BUXhf+dDp3AyOriERa4mpMvo8hb4dk4YgZMzzvkwZd/x1H7HxiFRaghmTIZ4ILFkg==
X-Received: by 2002:a17:906:fe4a:b0:a59:a8a4:a59d with SMTP id a640c23a62f3a-a5a2d66aa6dmr1442062566b.62.1715858594611;
        Thu, 16 May 2024 04:23:14 -0700 (PDT)
Message-ID: <7d780eff-a64f-40dd-a377-2af05bbd2eee@suse.com>
Date: Thu, 16 May 2024 13:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 08/15] x86/vpmu: guard vmx/svm calls with
 cpu_has_{vmx,svm}
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:14, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -290,7 +290,7 @@ static int cf_check amd_vpmu_save(struct vcpu *v,  bool to_guest)
>      context_save(v);
>  
>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
> -         is_msr_bitmap_on(vpmu) )
> +         is_msr_bitmap_on(vpmu) && cpu_has_svm )
>          amd_vpmu_unset_msr_bitmap(v);

Assuming the change in the earlier patch can actually be established to be
safe, along the lines of an earlier comment from Stefano the addition may
want to move earlier in the overall conditionals (here and below). In fact
I wonder whether it wouldn't be neater to have

#define is_svm_vcpu(v) (cpu_has_svm && is_hvm_vcpu(v))

at the top of the file, and then use that throughout to replace is_hvm_vcpu().
Same on the Intel side then, obviously.

> @@ -288,7 +288,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
>  
>      /* Unset PMU MSR bitmap to trap lazy load. */
>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
> -         cpu_has_vmx_msr_bitmap )
> +         cpu_has_vmx && cpu_has_vmx_msr_bitmap )

Aren't you elsewhere adding IS_ENABLED() to cpu_has_vmx_*, rendering this (and
similar changes further down) redundant?

Jan

