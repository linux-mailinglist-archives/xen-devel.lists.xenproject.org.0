Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9038B2F5C0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088488.1446230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2zF-0003SB-4b; Thu, 21 Aug 2025 10:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088488.1446230; Thu, 21 Aug 2025 10:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2zF-0003QB-1o; Thu, 21 Aug 2025 10:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1088488;
 Thu, 21 Aug 2025 10:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up2zD-0003Q4-DQ
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:57:39 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a577f917-7e7d-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 12:57:37 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f7f15so1147947a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 03:57:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a761f2599sm4948390a12.5.2025.08.21.03.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 03:57:35 -0700 (PDT)
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
X-Inumbo-ID: a577f917-7e7d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755773855; x=1756378655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w1n3cyMmsHG3C5o7mCY8sLDUzFeAZrOahVTBAR2gU+8=;
        b=TSjjI++4N7aJL9jlICFBEv8Rkj8HBKF+a0ht6ctyeluM0STV2hhxnm1P53UrKIuYfM
         YKqyQRLTUAhqENd2tVMcRM4oh47XgDOwXr9I9a9ZbIG4FtQ8StAVukm/fzYtXG2Hy7GF
         rbTIZYnkv8bFyLQyjbOpm9VGeMfMT1R8MBZ0BjHrP7f6SCxijyzfbsNcWJRECpihaO57
         lLFErasUfC46Zip4T60umuMTiUDzHR471Ya4ospgG9MtWcKoHAMZ2PHv3OfPxwIRJur7
         r1imVXI7cXzkbMymwZLquNiDO9srBjwea9DaZGGEQ/yGwKT4psn+5tSjkE74HteWFKx2
         DQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773855; x=1756378655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1n3cyMmsHG3C5o7mCY8sLDUzFeAZrOahVTBAR2gU+8=;
        b=beMxt6Xq91lYcQkY6pt+orksXwMVZQ6SbwazQJFJcog4yLALhMNdO0oqm/nVBWxnlL
         cIkOdvHumsvjHJQu/ejgLO03nlDtTDrFsXv5PS9ki4uaef+kbB3aWsUdQs9tT9PRP6bp
         gs9i3ahazS3871TpIc4BRd3sXK41zeQH/0gsn9KWVAoi5oO8c47VIQZq2LOGgzpGMBGv
         iYpZhfy2cGHDXirWWBSzbM76zUg22YaSB/6OlTEScHFWMCWUzn4n1crxWheAXmC381Jm
         EKYuZSYnOOE3jQ/TCDA/hPUWoP/3Mmt0SSu08+OY8Roi7hRMpKoSru7CYAg4CZC/ZOxH
         vwWg==
X-Forwarded-Encrypted: i=1; AJvYcCXKcWnYbLc217uLQoZTstyOWqdgn5UO+56apbqCx0yXskYkXWUDlMUcn9FXaIJBvM6uZ4c6+JOFt6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGhULmvWTj9HewbsbpIFvoUCAoiqsrxjmy2jZiG/qhXMwUd4ui
	bm39wm1XMS8MYP4s2TuXzKTvPmvgiKLLJJwY8IkKh4BJNRQqTXRK9KbbLwH/DQiFsw==
X-Gm-Gg: ASbGncsW//pTH5lvdmFx9f529gwVY0kKbZqmAgzoTmWLgXfLqVAqVJwCXFSe2CyZ6Sa
	7PHoyQia9yWr664tU89iJReMy5eyNBjNZtXa/xEWE4ZYj+YNWUhDs1ZgWTcorV2Rex6bE4bc/qS
	f1WlOo43+NoSr7rVxcGQH9YPGv4wejJg7NQ3VYPNkt/SMo/dPN/xyppCoU34x0St5aF5Sd5N1BK
	AzJTCCOrl3Mws5GBrLs2BZT5TAbqAp5SEnJ0ObQijUkgjnuIgGDgUt+0yuUGXsroq1bhjeDd/ks
	VzOrGW2Ks9z5sFuh0Xkkn0T0bVLXeuqp/wzCt9OMhSFg6ulZd8JopSG5xv6d3ZqUOBaaWfKqQ3E
	VH+yLkqg21ieh8Atwvzg8o2z9+K0k1d5WmCqGDzxAdq05w+B3iPCfp5ABv6KR51ODygwuPROLUb
	UO2hWiYj4=
X-Google-Smtp-Source: AGHT+IGAe4xr/4FjZXVWTyMTGCVermDvuGol6x2rj/rDdAKDoDs2P1h1ayqDRPy8mj9ufCmOtMffvw==
X-Received: by 2002:a05:6402:4408:b0:618:47a0:3ba2 with SMTP id 4fb4d7f45d1cf-61bf8725e3fmr1824088a12.24.1755773855526;
        Thu, 21 Aug 2025 03:57:35 -0700 (PDT)
Message-ID: <4ee727e6-2d6b-42b4-b4e2-f385c394d702@suse.com>
Date: Thu, 21 Aug 2025 12:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
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
In-Reply-To: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 12:50, Mykyta Poturai wrote:
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -51,7 +51,9 @@
>  #include <asm/device.h>
>  #include <asm/io.h>
>  #include <asm/iommu_fwspec.h>
> +#ifdef CONFIG_HAS_PCI
>  #include "../arch/arm/pci/pci-host-rcar4.h"
> +#endif
>  
>  #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))

Hmm, while this may take care of the immediate issue, I wonder if it wouldn't
better be the header itself which is modified. Then perhaps also taking care
of the other (Misra) issue there: The header guard check not being first in
the file, but sitting after an #include.

I further assume there is a good reason why a private header is included here
from some other subtree.

Jan

