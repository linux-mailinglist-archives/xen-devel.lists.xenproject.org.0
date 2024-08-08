Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4946E94BDF6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774051.1184548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2a7-0003tx-7m; Thu, 08 Aug 2024 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774051.1184548; Thu, 08 Aug 2024 12:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2a7-0003rZ-4s; Thu, 08 Aug 2024 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 774051;
 Thu, 08 Aug 2024 12:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc2a5-0003rT-L2
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:49:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a31eccc8-5584-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 14:49:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso110724766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 05:49:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d4522esm735160366b.106.2024.08.08.05.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 05:49:22 -0700 (PDT)
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
X-Inumbo-ID: a31eccc8-5584-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723121363; x=1723726163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JCTGqDUixoVuDVnpzib7lZzBHzUkqf5HlKtTUmlzf9I=;
        b=ZqzeyhNtVi1S3rVwuG2Nbcy8+p/2vxRFuEIvE+PicsScWpXiBKeLS8rWIFwpKuMTkf
         7IQjK2QvHsTXnMSnz90VyA/Q/Pug0hmLyCYRXgjNZfzJsPzl92wa2jThI3C0BiU0CnTL
         jVonDfmR1Mg5viLAEWJrJ4OzWNmJc7Ruec0N4aNGBRSQ59ykmiG2vLZXPiuTzC+GmaWX
         u0XAAMq5J3kQYzOZ1tQgp9/w8gAnHjJ/pplhPImHnBAhVPzo3AZZTh0GUHmw1CCO3yDP
         FFaUdpcjItLm9xYhvKWFPCjwKDshcb+Jn6nIjdAKYAjG6Ptopn1zKbmbjudc859eGgn0
         6TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723121363; x=1723726163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCTGqDUixoVuDVnpzib7lZzBHzUkqf5HlKtTUmlzf9I=;
        b=EYsoMEJTkpUoybGclU5hKNFYbTR8GLt8+Il8Yt08dvVURxNchM0RJRSrZMb5IYbhZx
         cQUu6n2abY21ylIkEwsDOEWrCBrA/D7MzcfwMZ6zTAtGehZ78+jnvsbWdNhxVZzLAtqz
         FCmSRZq4Xi7t29QJ7xodsT1z4/9ja1arSxBD9vV5I9bM05pbJSLKfIhMV4ojIWftULpK
         Qp/jegDUHf74643C3umy0lS0rAjBxUrLmCj6OQKV2RRwhI3MGOvIoq+tn8f+q2HTc+XA
         y55b8JUMYUYey6/uXaLjshdxVD6de8Imk0gtg/6nm/hcj76seFQnktpUpw3Y54UDYH7x
         VpCg==
X-Gm-Message-State: AOJu0Yz3Yp3+YJ3VDA+bsBGCOXye8cH0vObD68lA5CitaLUBSzZwQOIs
	775b3n+dicf0HZ/FGSWCZ8XwyT1EyuA2IXsit7wUphD/zF6FLKSYbTbM4Pv5UQ==
X-Google-Smtp-Source: AGHT+IHBk5SEwOXM5863rG0qimC5uDriNUmmC3eXHmIdpwACKHZVSrzjQd9ZmM8LKlgFGRubB8r1rA==
X-Received: by 2002:a17:906:6a1c:b0:a7a:97a9:ba23 with SMTP id a640c23a62f3a-a8090c7ff48mr111737266b.22.1723121362688;
        Thu, 08 Aug 2024 05:49:22 -0700 (PDT)
Message-ID: <bc643306-a41a-41bb-b7b7-b7c67f9e5bdf@suse.com>
Date: Thu, 8 Aug 2024 14:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: arm: make VMAP only support in MMU system
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 14:09, Ayan Kumar Halder wrote:
> @@ -58,9 +58,13 @@ config PADDR_BITS
>  	default 40 if ARM_PA_BITS_40
>  	default 48 if ARM_64
>  
> +config HAS_VMAP
> +	def_bool y

With this being always enabled, ...

>  config MMU
>  	def_bool y
>  	select HAS_PMAP
> +	select HAS_VMAP

.. what use is this?

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
>  /* Initialises the VMAP_DEFAULT virtual range */
>  static inline void vm_init(void)
>  {
> +#ifdef CONFIG_MMU
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
> +#endif
>  }

What about non-Arm, which all have MMUs but no corresponding Kconfig
setting? And why is this not CONFIG_HAS_VMAP anyway (with HAS_VMAP
properly moved to common/Kconfig, where e.g. HAS_PMAP also lives,
and then unconditionally selected by all other architectures)?

Jan

