Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FA938E80
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761789.1171819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrdF-0001Jt-7W; Mon, 22 Jul 2024 11:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761789.1171819; Mon, 22 Jul 2024 11:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrdF-0001HO-4Y; Mon, 22 Jul 2024 11:55:09 +0000
Received: by outflank-mailman (input) for mailman id 761789;
 Mon, 22 Jul 2024 11:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVrdD-0001HI-EM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:55:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cb369b0-4821-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:55:06 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77baa87743so439624966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:55:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7bdac0sm415320766b.60.2024.07.22.04.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:55:05 -0700 (PDT)
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
X-Inumbo-ID: 3cb369b0-4821-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721649306; x=1722254106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gFfXVU6XiY1KG5DgwejyKNGR/9Y0OFSel6bgkpXSPK0=;
        b=YByomqJ6OW0aUawmHqIop3tfakMh88jFJKJqOPC3TbnDEnqGk5eIm24U+CW1V4oNZb
         kA2pS96FlYqKASQVBuYbUrjD+W2EFJo7TkaNgWQt/56brEQI9x8k1TiMfP/S4qyNZEuM
         iKePVDegFu8veuiXK46FhrAhH6nCKHUhMXjqdpuV6YfgkzRksMFBHvBbMVqexq6LTh1L
         0yMTkcTb3pDMhpVWoDi9Loir0zQacZExrJTjSeckYuleHpmJsjFKYG1u33fGKeiH2dNn
         ofw6WB8Z55xeFk8rFF8QQ+L5XUzqbjNPqAmAALSF20azH1loFTpFRIJwi5S91btzQamz
         LpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649306; x=1722254106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFfXVU6XiY1KG5DgwejyKNGR/9Y0OFSel6bgkpXSPK0=;
        b=l5J31AfdHPM/rW0IHR3h1taxGjsRDY2choxGwEhGoCf0AR6+zbFK+pRZSdHDoJwxhu
         mmukN0lyQn3Tb1B9HWumRHJz9PAy9MU5xs46qUCqU0m2ymyIEoEeQ3vrlgB40nYlbMBd
         QAhJqHZOAiSuASvU9dq0NwhsFTO/rWqE2VmRdM0oxLY/nism8gCz6//Q3uaQJuLeAMrA
         2/RQHlsZJXRfXpjCAGCHzDebsXqVHGA0uKrSGn7lXkPb5m9W6bh+rnjFJ1mDbn1O673l
         dWu5WGzbYN9JNpkyCqnEYhh5sNu302vNTBCxZ57LidJzW+/iM8R76RVqw3WKOJwO9aO3
         lC8A==
X-Forwarded-Encrypted: i=1; AJvYcCUTXff3En8UdMi1niV2j1/Y+XEiYCyYz6NH3MwlVrhCMIYutBYbz4echT8+KhA3Ebf+gJd23pcMJSSciCjnnvikTceVlOe0suIrznL+VOQ=
X-Gm-Message-State: AOJu0YzPX4pbV+fP01v4sWdR0DxUZs4oFo4PNhvm76vbF+YXFnpkt9GP
	0a8pfjQeIN1wi5meh9DRIoWx78/bGEKdoQ7lPMn7wTUA0Sf3Lt2QI/FCrKP6jQ==
X-Google-Smtp-Source: AGHT+IGff+6W+RbF45vW42tX0KOxv48WB1hK3sF3anRb8ujxYEuMjvqStDQiImgT7sXJfZzsQDIRsw==
X-Received: by 2002:a17:907:980d:b0:a77:c330:ad9d with SMTP id a640c23a62f3a-a7a4c44b02amr400366166b.61.1721649305559;
        Mon, 22 Jul 2024 04:55:05 -0700 (PDT)
Message-ID: <7ad9cd04-a4f6-47ef-8f73-400388329fbc@suse.com>
Date: Mon, 22 Jul 2024 13:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 11/14] x86/vpmu: guard calls to vmx/svm functions
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <81999eb47b590afe3b269c33f7d166c9882cafdc.1720501197.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <81999eb47b590afe3b269c33f7d166c9882cafdc.1720501197.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 08:07, Sergiy Kibrik wrote:
> @@ -363,7 +364,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>              return 0;
>          vpmu_set(vpmu, VPMU_RUNNING);
>  
> -        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
> +        if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
>               amd_vpmu_set_msr_bitmap(v);
>      }

Up from here there's another is_hvm_vcpu(). I think you want to change all
of them, for consistency.

> @@ -269,7 +271,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
>      if ( !is_hvm_vcpu(v) )
>          rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
>      /* Save MSR to private context to make it fork-friendly */
> -    else if ( mem_sharing_enabled(v->domain) )
> +    else if ( is_vmx_vcpu(v) && mem_sharing_enabled(v->domain) )
>          vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                             &core2_vpmu_cxt->global_ctrl);
>  }

Why don't you change the is_hvm_vcpu() that even is visible in context?
Then this hunk would also actually follow what the description says.

> @@ -333,7 +335,7 @@ static inline void __core2_vpmu_load(struct vcpu *v)
>          wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
>      }
>      /* Restore MSR from context when used with a fork */
> -    else if ( mem_sharing_is_fork(v->domain) )
> +    else if ( is_vmx_vcpu(v) && mem_sharing_is_fork(v->domain) )
>          vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                              core2_vpmu_cxt->global_ctrl);
>  }

Same here, and up from here there are again two more places to change
(plus at least one more further down).

Jan

