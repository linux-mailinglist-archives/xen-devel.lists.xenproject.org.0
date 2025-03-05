Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EDA5037C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 16:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902464.1310431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqgM-00062Y-7X; Wed, 05 Mar 2025 15:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902464.1310431; Wed, 05 Mar 2025 15:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqgM-0005zS-4B; Wed, 05 Mar 2025 15:29:14 +0000
Received: by outflank-mailman (input) for mailman id 902464;
 Wed, 05 Mar 2025 15:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpqgK-0005zM-Mj
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 15:29:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95f027f3-f9d6-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 16:29:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso32146255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 07:29:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426cbc2sm20468645e9.4.2025.03.05.07.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 07:29:09 -0800 (PST)
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
X-Inumbo-ID: 95f027f3-f9d6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741188550; x=1741793350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oNDkK58mw5ZjaV7FPUZTTBPBeYcmvKikiYOS7YUQLsc=;
        b=Jd67d+pbEY8waCMEMIUsPetk6lMT36t9R3n9FJuTXw93K7A1hbYNkZ4rRJimMwfZba
         Rq2T5fApzqfDCdHfDRsB7Ir0jCa06ipx5uTxEGlRckfJPE4VAKeQaoKljY0ANhsHDcz2
         5qd05SMIGjtcTenbeLU5GNBghnnRxYFvSFB8g+tRNJ+6vpwzSUyXkoespmcpE+nIdbF+
         vxedLIK6vi5sqJmTfahWHwReT83DwzKbiiE+Fx+Byu/348oDgcoCqmjqG0Y4cQ6QS+Cm
         KE0B2/v9gCYXPf3OMWKgnHW/eUk5kdSr/i6nLJ9ONuK9h/hn5POl5k+XKdkfjfjE5lZd
         rj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741188550; x=1741793350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNDkK58mw5ZjaV7FPUZTTBPBeYcmvKikiYOS7YUQLsc=;
        b=KzxSH90yKBQZvH949+Foys6uC/P/SF9SGLOldhkL6o6G+vpuiQdlkCshaz2aaAiY4w
         s1RfIPhsWUoRCX7pPKQOzNTslvmWU+CtD9OnlwjBSh8uVUvyBVZIhAbEMW4QBTazO3A6
         iyMvH8l5LYJYFJRhrlzoumSxJhqLctpHHh3kyWYLbAWzIs0YEPMxY0qi8NRGdl/DC5vO
         qQnbjLgfu8B09+SAcrqK5F0OWLj3RfeQyLgYn3mQKaRB9Vd+YyK/Oo92Sk8yRb7xwxho
         aTS2mfsbsonzgAbtV8UCXgh12mt48ccJ7ei7pWYW1G4tSkPHmC/XQ+Bd45/vQ3I+6sFx
         IctA==
X-Forwarded-Encrypted: i=1; AJvYcCUOrGB0VX3GfwAZnjbJjn7Tj+u2tuJGZiOsTn0fMEE9Nw46NfzcBLmHozs3lSHbj5iWOV/UBWclrWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQAK4I+55opXwE+10lg3T1j6WHM74k62ea+Di9jSeXHhb2Daez
	dbVDHzhUFhqDk6d0ZgsJ1WsSQIBLMqnUM9cCzD7BlB+ric1010DmmQyM+T4MkipPLK26UhgmI0s
	=
X-Gm-Gg: ASbGnct04UU2RIZ9YDmdQqQH488TxW1lDFQKBp3E/5yns2o7reBWU5zxom0Ot72yB/Q
	l7MppiicnKlV6RfVeN6SehW7zGJVN5ErFQW/X31mxHh+HcSZZozXgAclXMDJV3e2dyan9BcVB7Z
	QTyRAlmSLFzT/oMxHlv9r/EnAYhfc3Y27bbQJBLBXSZNwRmfDyIHdexbx31iUKSAqZObkjW4Nmg
	tqTfnxA8ybMKNpWUoqd/2ccegpatwwvCVwxbQVC1R831aVdB5ZUVHS5ZsOA4m06JgpainBpf3HR
	NZHPikYrGwDF2qhmqa9KXQds7bOmjfHSdKh8CF0FWALC2F3sKnjr2jc6vKVCiD1p/5VqsrK8rB2
	RQcEQfVAs6RAjA38FVlUptkPxhog2fQ==
X-Google-Smtp-Source: AGHT+IFj1L/kQvsFUj8Tlz/wBXAtq/xDvp053+gqZ4aQa7Sffh/p7vefJp5PZQF7bZDp6pfxoIribw==
X-Received: by 2002:a05:600c:511c:b0:439:6712:643d with SMTP id 5b1f17b1804b1-43bd2973fd3mr24470445e9.9.1741188550162;
        Wed, 05 Mar 2025 07:29:10 -0800 (PST)
Message-ID: <825fb979-7f1b-4079-955a-33111d7b4623@suse.com>
Date: Wed, 5 Mar 2025 16:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-9-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-9-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -11,9 +11,12 @@
>      !defined(X86EMUL_NO_SIMD)
>  # ifdef __XEN__
>  #  include <asm/xstate.h>
> -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
> +/* Has a fastpath for `current`, so there's no actual map */
> +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
> +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
>  # else
>  #  define FXSAVE_AREA get_fpu_save_area()
> +#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
>  # endif
>  #endif

While preparing to commit this I felt a little uneasy. The mapping aspect
is ...

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
>  

... is entirely invisible at the use sites. This imo calls for making
mistakes, and hence the existing macro better would be adjusted to become
MAP_FXSAVE_AREA().

Jan

