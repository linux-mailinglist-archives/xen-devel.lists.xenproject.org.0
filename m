Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CEAF1637
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031102.1404810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWx1K-0004zh-VK; Wed, 02 Jul 2025 12:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031102.1404810; Wed, 02 Jul 2025 12:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWx1K-0004xc-Sf; Wed, 02 Jul 2025 12:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1031102;
 Wed, 02 Jul 2025 12:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWx1I-0004xW-U8
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:57:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a1aee3f-5744-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:56:58 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2969996f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:56:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3ad405sm127453545ad.150.2025.07.02.05.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:56:57 -0700 (PDT)
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
X-Inumbo-ID: 0a1aee3f-5744-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751461018; x=1752065818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AkkjGestmVF39ML2y+UyM+aEYj+VZ2klWw6FZs0kwA8=;
        b=VWyX/Y8YNZ2XkofOlYohB47GFR5TOy5gWfNA47pGDx+ZAemXqsGZE8ltqqIOF8ofPV
         mzs1Ms8aLNTz6Ndq1dC8SxmgDW4dAWXImEX2HJ2bUgvmqjHi5uA4xEpMBv73ADJtNUFK
         CA78U/WiE5qp5rYgsYJjvLMyaQBuaDoIV0Eyl8Yt4d3tU0g/a41zsboSfq6Vu6IfQlIi
         8Q/l6JHahQjTj1PVaiVboFFM1+GD3Nr6ks08UudDWPpqDAgJiq33b7nWUfXu5hv9p1Iq
         6weom1NAB20gl6dkVWY6WCHJ7PVQ6PEvNpPkYxvpaeJviXCKPTVb+hPrKy2UqzUNbnxL
         LADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461018; x=1752065818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkkjGestmVF39ML2y+UyM+aEYj+VZ2klWw6FZs0kwA8=;
        b=sLWM4G0yjTCoZNSKVfSb82tskGcF6WhN58akOkNVN5zxPXX6Ai35bGJSTPLbqWVq39
         BcaXVyJ0kLKVrSFODR3GiqvIFtZEMO/JjudMTBoiIyWW9M7zmzME9lqwzsmhCxCEWEBj
         oCxZfXQkcTi3tl9SzYOxyPkNALT/zrSX5hfGLlK6lryBc6yz2f854RyHWZABwh35/jUP
         UCtSqgGrEwC2if/c35VgYJhpGdBcBL9KlFQsw9KK8l5eQfuUIPU0/vjpK0IW/Qy4/vEB
         A7VPxDQoagsluLVHG0aHriiEiuDHIwMPhwENWIcKtXJufjS2/3OyF8I6hTkOf/fDAZcw
         Gstw==
X-Forwarded-Encrypted: i=1; AJvYcCXKhby2wp1d7KBmieyki3MqAg4FdO3e/k1ecNVpSS9SE+pbdVjOcOA9e4B7Y4JWXdlv0WuBrX/WtSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxkTnrJ83uQeZIaRJwBWBNzh85Jq1eGNwa5pZmdt/9KzJqFBlf
	hRs47cDDoO3+stUfzfLWCGlvfcjohvHzCFWd8jzmJ1u7NWE0U+KHuWMw5ZKattl08A==
X-Gm-Gg: ASbGncvlXVnt5W2ezw4O/wiqXA9YrWdvwDtKq8HP6cPmjN3qhui7SFJP9DdYVSqh9W3
	X2qL5qxxo0uUFd5et88mzgkw8S/nUp/CE2auVi2+v7g5TWkSLrOKJIzlKJP9o7YcOKy/M36pebN
	6hYrA77fMPQvzIKbbpjOGzr4gQenxIBRYPt8JS2SRtawIak7LeONpSHCo+wmB+SJJ6uM9KEKuCS
	5AM2D8J0EP0ds2QyLH88fRnviRbgekKJwDmfFz4YlDFLmW4AlRunwdBOpVWNlofN5tcbgFvt89D
	pGgyoqbIWEEsc3IF+FwKW2bMSoIITWoisI/KaDijgUeNeDxhp9EjaJG2uik/39hcyGq+AD+NmvS
	S9pwKIBJPHOv2S8lJW3NEPVvE5mmpZKnjm8NtjLvH/HVHgpY=
X-Google-Smtp-Source: AGHT+IErWwJ6HMiugsw+nNwQyqBDOKxcNrTeXO5iDUOUjG+naic+1c2e99BM33DVxDQsr1j5d+Gi7w==
X-Received: by 2002:a05:6000:2910:b0:3a6:d26a:f0f5 with SMTP id ffacd0b85a97d-3b1ff14e59fmr2246215f8f.21.1751461018151;
        Wed, 02 Jul 2025 05:56:58 -0700 (PDT)
Message-ID: <3128c4ae-7146-4480-b7b3-e17f253e3870@suse.com>
Date: Wed, 2 Jul 2025 14:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] xen: Refactor kernel_info to have a header like
 boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-3-agarciav@amd.com>
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
In-Reply-To: <20250701105706.86133-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 12:56, Alejandro Vallejo wrote:
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -100,6 +100,16 @@ struct shared_meminfo {
>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>  };
>  
> +

Nit: No double blank lines please.

> +struct boot_domain {
> +    struct domain *d;
> +
> +    struct boot_module *kernel;
> +    struct boot_module *initrd;
> +
> +    const char* cmdline;

Nit: * and blank want to change places.

> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -16,7 +16,7 @@
>  #endif
>  
>  struct kernel_info {
> -    struct domain *d;
> +    struct boot_domain hdr;
>  
>      void *fdt; /* flat device tree */
>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
> @@ -34,8 +34,7 @@ struct kernel_info {
>      paddr_t gnttab_size;
>  
>      /* boot blob load addresses */
> -    const struct boot_module *kernel, *initrd, *dtb;

Where did this "const" go?

> -    const char* cmdline;
> +    const struct boot_module *dtb;

This one only retains the intended effect here.

>      paddr_t dtb_paddr;
>      paddr_t initrd_paddr;

"hdr" is an odd name here. That struct has no need to live at the beginning,
afaict. How about "gen" for "generic" or "bd" for "boot_domain"?

Jan

