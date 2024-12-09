Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74299E9BA0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851683.1265716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgao-0005i3-G1; Mon, 09 Dec 2024 16:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851683.1265716; Mon, 09 Dec 2024 16:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgao-0005ff-Cx; Mon, 09 Dec 2024 16:26:42 +0000
Received: by outflank-mailman (input) for mailman id 851683;
 Mon, 09 Dec 2024 16:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgan-0005f9-9t
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:26:41 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc417d2-b64a-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:26:39 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so1873019f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:26:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216410fd80asm27591685ad.270.2024.12.09.08.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:26:37 -0800 (PST)
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
X-Inumbo-ID: 5dc417d2-b64a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761598; x=1734366398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq50I1G+0YYtc9QiJzWCI6fpX6PdDQYKBa4LPraZyuI=;
        b=ZMBII+7TqrUlY+yHzK43XX5XY8y8v4kT7Nzpvz3GXKcUX7JbSoEspGCQlde/BRtHyW
         3Mc4eh+Vrb5/TvPjXqNF/Zy+lWBKbWDVF4VAUYTuFyowMhnbdHhBLH7W8Qoi3gIEPmTf
         1pyINsTWVi5PP8pTao5qiVVUKX12pOIzQmpx6qcsfKojtz3Z0bRCbCZYTR6LwigKyJVA
         5dRb+YaE+hYRWFrdlAOzMEsKYjeHpd8IG10l/ku7yxzg3TXzoClPHwp9PAD5VzySpQAX
         hb1F5aisNazTvt0iX5gzgzOcalnJwQcI/kvlHXso8txtLlfxI3dLSXU34shEFKrr08dk
         8COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761598; x=1734366398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq50I1G+0YYtc9QiJzWCI6fpX6PdDQYKBa4LPraZyuI=;
        b=m3XMH8Nwh9vB5S0P5YhfiSOT4zMmN/0J5EfVUSlrkh7omFgmzBBl+EBxGCs8Gvp7Ck
         8RHH78D+ERzIv1uRozrpmdBJJ6ojXRc4eygBUZCzLsNOyVhxxWdlsSGCV+W6wF301Ety
         AGMXZ+0Wjd1nExFXHdrJyMwvHGT0CMNgRl8og5dtgOjVDN+4Ar0o9wqLORLzhfq7waTH
         MrKd6WtBSCRlCLCaQqwac2Se0XbthrO98yvk7Xoy1U6xRN82S2maIB2YJXAIYskWItxZ
         JFT+0qqDgmX5IEhZdviYk+mme+sDTZ2YUA2oYp4V16VGDc2Jk5XuzbFFu6P9zpBUQSG6
         FYgg==
X-Forwarded-Encrypted: i=1; AJvYcCVggdnMdDln/HL7uT1047H40oFjWqj8AVDNGZbDQ/HknZFQdhrpDDKLQX/u0DFm8xYr8h9qvrmC2IA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi1lceSMNBhDy82BmMniwvVv1U/brQPT/MCx2cG9hEFRUcg6+S
	ptIfo3HSf4RM1twABvIs/eoirAaSjqPaKlqatw761Nxf+pjgK/24mHHABr+Eqw==
X-Gm-Gg: ASbGncsx8P8qHFnSCPeVnR//zKLhJAAiS80c3fnbF7sJAwkJNx0tmVzQyagROdi82el
	O1qLwhXIbsAuFLUiKpmOkWS2pHtXmeJUE9xtRMMEtB+Y72IxSp0XF65HM4vb7iGwR2QayFAYbM+
	Gt11GmaE4ojfERgZbaaB+44O51Xf9vAu253vHIPHP7y3DxkZZfw7ZZo5M1kgRw40iLRJzd+JjRU
	XK7ScZ3tFgrKY22tZaicw9NIFaGGJ7gYkFMI9Sw3GWobcMXiZyz9BXNTOxQZY7xC243TlEOH18r
	/TbStKc2gWD6gtgEdu7DNgzAbohFoQlc60Y=
X-Google-Smtp-Source: AGHT+IEBFQwYrHYLbkSbzaVcAfuT378XDcyZ3odij9a/7yQqHX4eQCLiRdUfs9OW+4Ev4UHqQ1hu0w==
X-Received: by 2002:a05:6000:1862:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-386453e605dmr912922f8f.35.1733761598450;
        Mon, 09 Dec 2024 08:26:38 -0800 (PST)
Message-ID: <bc308e63-5791-4e29-a218-0c83728c116a@suse.com>
Date: Mon, 9 Dec 2024 17:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-10-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-10-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -11,9 +11,12 @@
>      !defined(X86EMUL_NO_SIMD)
>  # ifdef __XEN__
>  #  include <asm/xstate.h>
> -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> +/* has a fastpath for `current`, so there's no actual map */
> +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(currt ent, x)

The typo of the first argument strongly suggests that the macro should
already now evaluate its parameters, also pleasing Misra.

>  # else
>  #  define FXSAVE_AREA get_fpu_save_area()
> +#  define UNMAP_FXSAVE_AREA(x) ((void)x)

If only for consistency and to avoid setting bad precedents - parentheses
please around x.

> @@ -292,6 +295,9 @@ int x86_emul_blk(
>          }
>          else
>              asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
> +
> +        UNMAP_FXSAVE_AREA(fxsr);
> +
>          break;
>      }
>  
> @@ -320,6 +326,9 @@ int x86_emul_blk(
>  
>          if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
>              memcpy(ptr, fxsr, s->op_bytes);
> +
> +        UNMAP_FXSAVE_AREA(fxsr);
> +
>          break;
>      }

So for now the emulator only supports FXSAVE / FXRSTOR. That'll need to change
sooner or later. Is it really appropriate in that light to name the new macro
after FXSAVE, when the underlying machinery uses all XSAVE?

Jan

