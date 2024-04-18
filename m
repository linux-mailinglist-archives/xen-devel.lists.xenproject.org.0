Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3218A98A6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708244.1106945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQ3n-0005Zv-Tq; Thu, 18 Apr 2024 11:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708244.1106945; Thu, 18 Apr 2024 11:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQ3n-0005XQ-Pl; Thu, 18 Apr 2024 11:36:11 +0000
Received: by outflank-mailman (input) for mailman id 708244;
 Thu, 18 Apr 2024 11:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxQ3m-0005Vl-2p
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:36:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8f2cd1c-fd77-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 13:36:07 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-418c0d83d18so5517465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:36:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b00418e4cc9de7sm1954452wmb.7.2024.04.18.04.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:36:07 -0700 (PDT)
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
X-Inumbo-ID: d8f2cd1c-fd77-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713440167; x=1714044967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQJHKDlnitP1kzarCYHDHh81CK9RYPfVL10Ndc/YWxI=;
        b=HE2VLcSKEB4oe9knDJDfRulYE8RqUvCtkDDuKWZGmZQ70Avad846RpT1llXITw2tqo
         2vPTjAfwwBCcVg6zYmBAHahKEPUCNpkQOBRgEuI4jf/+z7NRRuYCTNv9+lw1ukYijHto
         V93NB4FLJ6wIAraQ4QETjYhjmzIueZrl7ejFmk4I0MxdcOYSL1BRxFJepQes6kbr9qSR
         vN9c2Nmuqcz/6BcF2N27SHbqZ3Bz9CLS+GXiuD9GthxNQ2UK1Zx6lWCcTQlW7afB8ABz
         P6M7lXwJh6xcXHbny2Ijvq4THcB2t2/PMFDEKSxLxQQ+M88Mp1hVpW+JOTpJyqTlJmqs
         2Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440167; x=1714044967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQJHKDlnitP1kzarCYHDHh81CK9RYPfVL10Ndc/YWxI=;
        b=OWrUNPDhrC3RXoGBaX407d92QvfsDMhmjXk7TZhXzgeZ7g7xAPClhUgcouzjcDcmhX
         gmfp5eVkGXLwOUWhzYiLGdkpZo+ownZFVqVvzyb4ddEoFXiOAQu9+i4Z2JhEP28VBfXD
         VO/NXxr4qQaW7qFibeLrfrtn2eOZml4a+bkSl4h+IlItBL3R6bXWEFz/Uhc6DvoBo0Gw
         PvEwRthHa1IEqKi9JEDK+VnZdPR7Q8IaykfsRArMgGHyM+MGs+3M3XG4PrC8DiecIov/
         kH8SYyrJ30SdFYaWuNG+i73yfkRwvRasU4b/CXYckOoq7cQ6n3MawgoNAnjXqON+ochb
         oyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUxQvpcCfooSLMKDT6jq5OdcQFKKahwoZIB5k/ZAArGmnCyUh/m1SjDfhZJ0eAacx4dt73Jgj2ST5lKrIPSa+oVZlEJ6vFpgINHD1H8TSg=
X-Gm-Message-State: AOJu0Yy7mdOjuf6KdnRp9MwxsDHmC6ZZZRn+zlscoABRki9COjZTqE/D
	1evPx6HbPw/1oYvnB18QM9AbkSPMD+5OIi2UjOusyitLcPOqwApnRSK3JAnurg==
X-Google-Smtp-Source: AGHT+IEdaLlyAlwDKOZ53kFXqSPiIiBzlXUMD519r6MS3nMTinjh0rYKR9UVaJxrsXPu9XIh+6dvug==
X-Received: by 2002:a05:600c:3d14:b0:418:5e80:b7b2 with SMTP id bh20-20020a05600c3d1400b004185e80b7b2mr1805855wmb.1.1713440167355;
        Thu, 18 Apr 2024 04:36:07 -0700 (PDT)
Message-ID: <ba37afe5-7531-45e4-b56c-22761f8dc492@suse.com>
Date: Thu, 18 Apr 2024 13:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 05/15] x86/p2m: move altp2m-related code to
 separate file
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416062915.3469145-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240416062915.3469145-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:29, Sergiy Kibrik wrote:
> Move altp2m code from generic p2m.c file to altp2m.c, so that VMX-specific
> code is kept separately and can possibly be disabled in the build.

The code movement is desirable, but the reasoning isn't quite right (see
replies on other sub-threads).

> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -9,6 +9,8 @@
>  #include <asm/altp2m.h>
>  #include "mm-locks.h"
>  #include "p2m.h"
> +#include <public/hvm/hvm_op.h>
> +#include <xen/event.h>

Please add above the private header #include-s.

>[...]
> +    return rc;
> +}
> +
> +

No double blank lines please, anywhere.

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -500,9 +500,8 @@ int p2m_alloc_table(struct p2m_domain *p2m)
>      return 0;
>  }
>  
> -static int __must_check
> -p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> -                 unsigned int page_order)
> +int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> +                                  unsigned int page_order)
>  {

And no unrelated re-formatting please (i.e. you really only need to
touch a single line here).

Jan

