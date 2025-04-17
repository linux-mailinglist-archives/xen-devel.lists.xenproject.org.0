Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB1A9200F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957942.1350933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QV0-0003Co-Fo; Thu, 17 Apr 2025 14:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957942.1350933; Thu, 17 Apr 2025 14:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QV0-0003AW-Cr; Thu, 17 Apr 2025 14:45:54 +0000
Received: by outflank-mailman (input) for mailman id 957942;
 Thu, 17 Apr 2025 14:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5QUy-00039b-OB
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:45:52 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a40d288c-1b9a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:45:44 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so568746f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:45:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50ed12f6sm321105ad.192.2025.04.17.07.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:45:43 -0700 (PDT)
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
X-Inumbo-ID: a40d288c-1b9a-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744901143; x=1745505943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MgVW7PJ5FZR4n1WWl9xTDrX1OwgTpmvDuZfQJ6ltedM=;
        b=P5V0xthRLFYe69FsfOZIPpNMnEHvrI4GaUle2P9YBd0+GxfSGHn2KnwLcyoY0IMM9d
         h2uk9nIh0Hw2IcSAiqHB2semKavcTyrYRV3xSa670SBycIlAqmJKu/CCMW3Q4QEKWws5
         OsSA8l+EDzIVOZVSOCbaLaVpnUw+EtFSQgKxmc+6N1fYtOtA7SWRDt8LkhEnFknrhomm
         cWKl7T7LCL4OGv+CCUSOUIluMvHe/VxDF9VbaaYKlmqIv1YQUCfS/1pvy0IWtnNlcPF1
         336VWOrYCujGgnLr/IWaykI6kplzeiMMEIXy6mrwTzAh84VAIgheoTkK1eHvWiKcCRu3
         zKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901143; x=1745505943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgVW7PJ5FZR4n1WWl9xTDrX1OwgTpmvDuZfQJ6ltedM=;
        b=IjyxKRjhMdxXCHPvQymgcn46jpPXMIY8fEZGQHPnGojh8XXi9CVzQSBMfUjyz0K64r
         vmB8Ukn+SnqqgLxO903AgpJn9GbIm3qkWxy9hdINE02PMIexVapJQ2xRgLR/GY0ZqPPB
         IrpAT31wfSOUnbdZAET8VSEajzfque6kMtBibT01t3oTcYV4lWuZOg0bM5bO5IiNAl+/
         tQti4PIeuNMmhQ5n8QLPq5atWMk9QUofqypdWyB28YCMtQKupJkvKXq6fGkGkctgWxSl
         Wf2I+HLeNNOD6f7rJWBvmEwSLretQaOJSGVUbq3EQ2vLN5wfQMzZMavYvN/ENfJvNJID
         zfow==
X-Forwarded-Encrypted: i=1; AJvYcCWWcXJaKE0EY4fCeteOM38yho04c6FIBJpq2ctpa/JeU+CFasBDMch2vyMhECy+6wKHt5l2gNwgrHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoRffeb118acW4OAEf2FJY8V2BAQ6h1FUrOAvi7DmqxBdgk3jf
	OFynt6nx398Cj8HBzSfJFsYSPk8XaNeToY2Fxmz/cGOm6VwcWNx75LbuFqDTPQ==
X-Gm-Gg: ASbGncuJEQYeeTx/t4L/3TTNdE35suOaVMTruu5dtYjlglXzJog9fWVqKjWSYupKjZk
	hiXBxoPAx/Nst+Mxag9gKLJR0GliYqfqVHHHpSHlhtpqTPYYOieGmmlXtz/8a4AfvHxHStQb8fJ
	0IevJAm6oHmlZzy4JAwS69fJ8ZrCwN1Ja2s3HXAIOzvUCDh5vgDcoIoN5Tru+N8ROQCdULlZ+87
	G/iXFJT2K53cysoEbpmGl1CX4VGtgsdSP1m7MnPzrPZZT6ABmZq+izFJHnyL60nhCaQgwl80fxZ
	070Bfn/dbrhysGU9OGZe0crE/N6vSHq9Of/Pd6ZM2aMlXDaseCaxDx3xVg6/kADjiqHdO78TnWw
	2U/kyLVf31SIbFCpi8Wo0I+PX1A==
X-Google-Smtp-Source: AGHT+IE6G8m4apNKlZWVfM1TcsrpOYJC9iQeM1PZpRauspMaEKBLHLtF2w9wdkFmrrjzch8s2TH8IA==
X-Received: by 2002:a05:6000:240a:b0:39e:e588:6745 with SMTP id ffacd0b85a97d-39ee5b89e28mr5753031f8f.46.1744901143565;
        Thu, 17 Apr 2025 07:45:43 -0700 (PDT)
Message-ID: <faa552cb-d933-492b-b3ed-e803856265ab@suse.com>
Date: Thu, 17 Apr 2025 16:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] xen/common: dom0less: introduce common
 domain-build.c
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <9dbf651ce177a7292f80879373e86a51305f216e.1744626032.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9dbf651ce177a7292f80879373e86a51305f216e.1744626032.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 17:56, Oleksii Kurochko wrote:
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -5,6 +5,7 @@
>  #include <xen/bootfdt.h>
>  #include <xen/device_tree.h>
>  #include <xen/fdt-kernel.h>
> +#include <xen/mm.h>
>  #include <xen/types.h>
>  
>  #if __has_include(<asm/domain_build.h>)
> @@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>                       int sizecells, const struct membanks *mem);
>  int make_timer_node(const struct kernel_info *kinfo);
>  
> -unsigned int get_allocation_size(paddr_t size);
> +
> +static inline int get_allocation_size(paddr_t size)
> +{
> +    /*
> +     * get_order_from_bytes returns the order greater than or equal to
> +     * the given size, but we need less than or equal. Adding one to
> +     * the size pushes an evenly aligned size into the next order, so
> +     * we can then unconditionally subtract 1 from the order which is
> +     * returned.
> +     */
> +    return get_order_from_bytes(size + 1) - 1;
> +}
> +
> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
> +                                               paddr_t gpa,
> +                                               void *buf,

This very much looks like the latest now, when the code is made common,
it wants to be const void *. Even if this may require another prereq
patch.

However, instead of using a function pointer, couldn't the now common
code call copy_to_guest_phys_flush_dcache() conditionally upon
IS_ENABLED(CONFIG_<whatever>)? Or provide a weak
copy_to_guest_phys_flush_dcache() which would simply call
copy_to_guest_phys()?

Jan

