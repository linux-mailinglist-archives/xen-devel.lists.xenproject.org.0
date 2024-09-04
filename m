Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3896B18C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789791.1199432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljTr-0005hX-Sp; Wed, 04 Sep 2024 06:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789791.1199432; Wed, 04 Sep 2024 06:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljTr-0005eW-Q1; Wed, 04 Sep 2024 06:27:03 +0000
Received: by outflank-mailman (input) for mailman id 789791;
 Wed, 04 Sep 2024 06:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljTq-0005c4-GC
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:27:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0608a9a-6a86-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 08:26:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5343617fdddso10626338e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:26:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb1b8sm770439366b.38.2024.09.03.23.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:26:57 -0700 (PDT)
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
X-Inumbo-ID: b0608a9a-6a86-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725431218; x=1726036018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OKEMCHUAlF0oBWN2DgEo72n1hdvcfXT1zYxJL/ovM/0=;
        b=IWOE4uDz9knFibm6Llxew6sVxOCour8ZJhOMcGsb7T+rkzKEvyMJhu7xvlhtQN+4i3
         IN7CmR8VcZGDBT9IRqkqK/arRHd5pX5px8ZC/6DfOS7o9AgQFrCxEKFhAUKl14JONpEm
         3SVvfbufPn12+POjoriNz2tI8HBPSMWxlbIF7r8By4BhO2IeR97b8hFRm2xshniPBhO+
         RLAIgHlkg8UBglFNWQcbZrVlgypaY78JN6SHaZO+iYcrw+xLzMFz7nKT3JMfl7cVD6nY
         EWBEI0/BqHdeZQGJN5SS88bLI3ET/j1h3lWkBaBbSMTY/F6FXzkyNy5JPcXZwvWNIWY1
         JFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725431218; x=1726036018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKEMCHUAlF0oBWN2DgEo72n1hdvcfXT1zYxJL/ovM/0=;
        b=dz/jQxaV2WFw9JHXvs7WJjsXy69vRboFdaZJ5M57wjsjsAEVKUaaRtZj06AgZSd1l/
         5/sg+yzxK4x7V0Gqv0p+o5EZ6/JtkqlwwxY6zo8sUeDkkVMhhTp8neGtNA82UZp7/T9i
         yF4Pq012i3kahk9M1lo3r/dw2MZmKcq0IIP0tH5cGodsfrVGfLtBH5YQ8BZo4hLFWpGq
         3H7rLS/+KzbeTSQkUzNpJ5nizSs3SYYwVSa03NVIL9HpjO91ddNbbYckO/tkhIkzb1mD
         t3dj0Q+26D8zgu/nx+bAINJNi+TCWV2UxszJ0tZIR0G3v2Scv6cIJJTFVMUl++R2e9if
         NtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbPTpl1nzYJ7pR8uWp1CoReGmC6pv6tR41cJhXrJ6JjHMr1GoYmL//i9e4Mft/ibTHoVqCT9o3yQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDzHx2nMtFu/JWFJPGFqUYGA6MEBLI87c6J4u8Rg46HCOzvbDX
	WNfn70528bSZOIVJz8ES12LJQKsVjFwNBo+W6KUdg5ZmK9qn3J5nTt/YySRumw==
X-Google-Smtp-Source: AGHT+IH6VykZBaaxItnToeZ27m7dN3MTxU+eR7eoB+/PGXOWpZ5c18iLxRgoYAhWhhQ/OG2KHbpKJw==
X-Received: by 2002:a05:651c:1503:b0:2f6:4a89:9afa with SMTP id 38308e7fff4ca-2f64a899d00mr36647971fa.22.1725431218103;
        Tue, 03 Sep 2024 23:26:58 -0700 (PDT)
Message-ID: <610f17d8-1399-48df-ace1-b31a848dd265@suse.com>
Date: Wed, 4 Sep 2024 08:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/44] x86/boot: move mmap info to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -8,11 +8,16 @@
>  #ifndef __XEN_X86_BOOTINFO_H__
>  #define __XEN_X86_BOOTINFO_H__
>  
> +#include <xen/types.h>
> +
>  struct boot_info {
>      unsigned int nr_mods;
>  
>      const char *boot_loader_name;
>      const char *cmdline;
> +
> +    paddr_t mmap_addr;
> +    uint32_t mmap_length;

Why would this need to be a fixed-width type, unless we went in the direction
of what Alejandro mentioned in reply to patch 1? IOW at least we want to be
consistent with which kind of types are used here.

Jan

