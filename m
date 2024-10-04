Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600598FD4A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810000.1222579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbjN-0006kK-Jl; Fri, 04 Oct 2024 06:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810000.1222579; Fri, 04 Oct 2024 06:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbjN-0006ip-Gr; Fri, 04 Oct 2024 06:24:01 +0000
Received: by outflank-mailman (input) for mailman id 810000;
 Fri, 04 Oct 2024 06:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swbjM-0006ij-Kr
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:24:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3d0cc1-8219-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 08:23:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c718bb04a3so2140528a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102892f2sm178509066b.45.2024.10.03.23.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:23:57 -0700 (PDT)
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
X-Inumbo-ID: 3d3d0cc1-8219-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728023038; x=1728627838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2M15zK0DxC62d9Bv6bb5nOWP7coKduRD91GmFz0m1rg=;
        b=Bl+8dacqAzLRGuJMBX/1soN2zHIWaaaj2eCD3ACNTTaR91j6nsM5n5bWDwad0rahJE
         SOq71N3Eq53+kty1m0LDV3/LcCOzizqf8IWkX+s04U25RpLkIX6XAc58iRxhuBTbCN7t
         8UHjdt+9AanzJ0PSOAn+kUPl8aTMn8yWF60nZo+UY2O9AcSZDScVU4yia5+lAoIMY/8b
         TAtBVIGgBH2r5HO81haonxN6iP1aMBFFBUnm6Kxr1bN0pLmlgxY/1h0E/u/LOMvab6YB
         Rn9fnvip0uZY6YZn/Dx7GbczQ6C8+bdymvGTjeVKRx84ibw0vDppXFbBNKOWTs+uFvwT
         pCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728023038; x=1728627838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M15zK0DxC62d9Bv6bb5nOWP7coKduRD91GmFz0m1rg=;
        b=HKbwJboKCE+CnX3XEyqxqEV3TWkIGNxZFKaCZEUXyf/W4VSpyGMl4mi4J55JH4d+Ok
         NKqkul9a9bTUc/0Cn0+UxuEjv831x48PfXVQ746ivCrt1mdXWh/dHipEurXkywOnH2IB
         Q6erTgl2vRG0KmzSyHTNK2ZdQgkzhlSbbjPVOZroVu4KMdJuV2eGvm9Kfk1TUuyv/XD3
         ETfzxtPub6w/p5QSf0UWYcjBLv84LI52yXdOZM+KqnJI8tubrer11WqAO2udvhJGQkpS
         N1P+kAGbv24YHzOU/PYvSAuWLqIMFiuaCU/yovrGsgyz2rD0nk2k7HJS0o91gokZ5RWF
         15IA==
X-Gm-Message-State: AOJu0YysVQZGBWlTxf4Tj9xww1Rywz/QXnSIITIpi0yqR+Z/HAbD9W3d
	p2XFjWjmJRzupUX6njr+k+shv/oDTGKp6ptgQ1LcJ4ikD6aX2WkVpyAzTjHFGA==
X-Google-Smtp-Source: AGHT+IFVBC42EBQ36UqU9vpQy7f6lDbvh0Mpl8xUQ3kVrxu9RCGnt0d+clv4TaBviLcnsIjRSjFwQw==
X-Received: by 2002:a17:906:7303:b0:a99:22e:9658 with SMTP id a640c23a62f3a-a991c031334mr160684866b.40.1728023037987;
        Thu, 03 Oct 2024 23:23:57 -0700 (PDT)
Message-ID: <b09f94e4-1a96-4de5-816e-362ba4131f5a@suse.com>
Date: Fri, 4 Oct 2024 08:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/19] Update header guards bases on new coding style
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.10.2024 19:59, Frediano Ziglio wrote:
> With the help of some scripts and manual checking I updated header guards.
> 
> As the changes are pretty large patch was split based on maintainers
> to reduce mail spamming.
> 
> Excluded public headers from the update, they are API, software like
> Qemu will fail to compile if changed.

Interesting - the first patch I peeked at, ...

> Changes since v1:
> - make all commit compile;
> - exclude public headers, their guard is not an API.
> 
> Frediano Ziglio (19):
>   xen: Update header guards - Generic
>   xen: Update header guards - X86
>   xen: Update header guards - ACPI
>   xen: Update header guards - ARGO

... this one, adjusts a public header. And the diffstat ...

>  xen/include/public/arch-arm.h                           | 6 +++---
>  xen/include/public/arch-arm/hvm/save.h                  | 4 ++--
>  xen/include/public/arch-arm/smccc.h                     | 6 +++---
>  xen/include/public/arch-x86/cpufeatureset.h             | 6 +++---
>  xen/include/public/arch-x86/cpuid.h                     | 6 +++---
>  xen/include/public/arch-x86/guest-acpi.h                | 6 +++---
>  xen/include/public/arch-x86/hvm/save.h                  | 6 +++---
>  xen/include/public/arch-x86/hvm/start_info.h            | 6 +++---
>  xen/include/public/arch-x86/pmu.h                       | 6 +++---
>  xen/include/public/arch-x86/xen-mca.h                   | 6 +++---
>  xen/include/public/arch-x86/xen-x86_32.h                | 6 +++---
>  xen/include/public/arch-x86/xen-x86_64.h                | 6 +++---
>  xen/include/public/arch-x86/xen.h                       | 6 +++---
>  xen/include/public/argo.h                               | 4 ++--
>  xen/include/public/vm_event.h                           | 6 +++---

... also contradicts that statement. Please clarify.

Jan

