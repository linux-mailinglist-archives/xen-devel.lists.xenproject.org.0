Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DDC956AE3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779614.1189323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1V9-0002AD-LB; Mon, 19 Aug 2024 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779614.1189323; Mon, 19 Aug 2024 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1V9-00028S-I7; Mon, 19 Aug 2024 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 779614;
 Mon, 19 Aug 2024 12:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1V7-00028M-Lk
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:28:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931e72f4-5e26-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:28:44 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8374e6a6fbso520892766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935984sm627580766b.116.2024.08.19.05.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:28:43 -0700 (PDT)
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
X-Inumbo-ID: 931e72f4-5e26-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724070524; x=1724675324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2LRTc2ob5i1caEeLOvnQ6KWSCSQ6ADEg4hGUZMcdX4g=;
        b=X5e4vjCdmQbHjSYuSESR4ccRLzSNiT8LOVtkMk24tG19KS/XNZoGcHlPGBrpRxHqqg
         x1p34W4cMIYLB/0wv8oQoJ0WLiumSsM5MPpoaxzN+9dS+n0sObvOuusrdB7yY8S8FJOC
         AHAVTXZx5T1sjwdrTy6Uzr0pNRc9zJVthtBhfLi8ck1nImMivXRviuaOIMYnOZFapkph
         6IhJNTNwlOQOL/9mAQtbqzI04tcSkX/GMqgTtfnOMPrrcQGPIVvcdUsHE+6WIDsIjGU3
         qdEyrz3m0QvDyXne1AvKW0QymEUJppOW0N0Qv+abbZgFP/CCwZlseysMO3j7VFcwFQKl
         z+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724070524; x=1724675324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LRTc2ob5i1caEeLOvnQ6KWSCSQ6ADEg4hGUZMcdX4g=;
        b=ruNjgEpHe+FqIzFjW7U+qBMMbzZ9tvxCUiNbjz8vAjF5xsMNGH1FDTTlvJDUOT8aXK
         f09UCwK1iHpxp0Q9ZsjxgMaNn2JY3c2pS2i4UPwefwDVhopvSkeeMt7ogE8tIH8FSwPd
         6JUqR0MOoRqnfyZX9QKdtmWJbfqDRetpJLbJRBiAQxPXMRkDl1CoSHd9ieu+xWHf3+Ko
         lQp6KG7JfXr5fbTT07Bu6aPqtV+kNvBYl+4hrfYBnoPjpMghROuLeGQ4iBDbgWr1SV9O
         Joja1exQI9ISdU7SB6mW21l/sq71gD65KfpS5EoeG55iSRC9KvDvPM7L8DoOnwbgS/d4
         /l9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVwNXJW8OjflTkJB0IB3Dz+vboTBqZiU7JVAUCKOfV9lsGBGtDbDiWLW1d7G/vbUddnM1/qTcoz+jjvXc4/Fm/D8YuFJBWQAszrNvwjeI=
X-Gm-Message-State: AOJu0YyQaAt7/3tJyIdLgc6+WCZUiYkW9ZS44Ti6MwkxxdTC9tHlYYFa
	ErG+5xEUqLSeZiRZXOaRljZJubAJzIcsHtmbFdM/FFhxUh0XRBZsdG7DkhMc9w==
X-Google-Smtp-Source: AGHT+IEHJyIJ9m6UhvWpeWgOKrEhRy1ZS5QpZbqKea8EhJDcP75k8yY7GE/Z4+TGNiuV2tDxrBKmmw==
X-Received: by 2002:a17:907:86a4:b0:a7d:34bf:600e with SMTP id a640c23a62f3a-a8392a4a586mr713043366b.60.1724070523858;
        Mon, 19 Aug 2024 05:28:43 -0700 (PDT)
Message-ID: <94d08e04-041c-448e-a2c3-28b8c00b82ec@suse.com>
Date: Mon, 19 Aug 2024 14:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/5] x86/spec-ctrl: configurable
 Intlel/AMD-specific calculations
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <b789679a7edd41c88eca41d3c703d2292cfcce0e.1723806405.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <b789679a7edd41c88eca41d3c703d2292cfcce0e.1723806405.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:14, Sergiy Kibrik wrote:
> Put platforms-specific code under #ifdef CONFIG_{AMD,INTEL} so that when
> corresponding CPU support is disabled by configuration less dead code will end
> up in the build.
> 
> This includes re-ordering of calls to ibpb_calculations() & div_calculations(),
> but since they don't access common variables or feature bits it should be
> safe to do.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>

For one please consider adding Requested-by: or Suggested-by: tags.

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -1012,6 +1012,7 @@ static bool __init should_use_eager_fpu(void)
>      }
>  }
>  
> +#ifdef CONFIG_AMD
>  /*
>   * https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
>   */
> @@ -1110,6 +1111,7 @@ static void __init div_calculations(bool hw_smt_enabled)
>              "enabled.  Please assess your configuration and choose an\n"
>              "explicit 'smt=<bool>' setting.  See XSA-439.\n");
>  }
> +#endif /* CONFIG_AMD */

And then no, I don't think we want to use #ifdef-ary here. IS_ENABLED()
inside the functions (where the vendor checks are) is not only making
sure the compiler will still parse all the code even when either vendor's
support was turned off, but will also help review (by having in context
what the actual vendor checks are in each function).

Jan

