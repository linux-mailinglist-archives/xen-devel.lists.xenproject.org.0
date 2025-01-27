Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D95A1D4D4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877681.1287827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMiy-0006QY-HZ; Mon, 27 Jan 2025 10:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877681.1287827; Mon, 27 Jan 2025 10:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMiy-0006OP-EK; Mon, 27 Jan 2025 10:52:12 +0000
Received: by outflank-mailman (input) for mailman id 877681;
 Mon, 27 Jan 2025 10:52:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMix-0006AP-1U
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:52:11 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a614eb-dc9c-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 11:52:08 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaec111762bso918280066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:52:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6aa40824asm118455866b.134.2025.01.27.02.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:52:07 -0800 (PST)
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
X-Inumbo-ID: c0a614eb-dc9c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737975127; x=1738579927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IyjeDF8OKBxz6ia6vXzbKX4nJegmuau8imeDrdNM1bU=;
        b=G8bIfIa5fFDY9FXUSwz4jqOT7FhDUwDXTxBUHWWO7+tj87CQAPI7xzgH+EVkVTz8+k
         umww9r5pfg3gxVqN/DHkHjbBT9ydcWLUJW5JSG1nQkYxL8mzlp2s+NNOC3vs1IbhJDfK
         TL2JVUsFYMTCbWpuVesMwxPBbK0gC2X1AIDe/62TKyyVvvQz7qarO2ZaIFd46Jnq3u+5
         Cq5iWq191kAnRkgnQZsme8uNlFvI7cJtBQEiVc4vHUXVcXk7zs8SjDzweCheUZ1mjgNM
         CgeUHWxPDuLy1B7VyTQ23AJQYYU2b1Xj23jx1glRXgy0fGbLbJ6GeAY6CYtdC19aPjev
         6akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975127; x=1738579927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyjeDF8OKBxz6ia6vXzbKX4nJegmuau8imeDrdNM1bU=;
        b=mAeRa5MAj0uzGkcyR5240IjUWW2oqTB6/JoRYo1pOtYmFCD/3k9fGNOCs+cVmjEsSs
         sS5PHFWYalZOd3DEZK4C7OAn/Ynm867Zi7ZBr3G1I9jfK46KWdiIy08ZCIWxGGTr4d0o
         FuFUo2u/ZRMi5d0UU7BK1c7EFwwaUeuCDPn6hxD9rL2sNWP/h8UH3u4HtPmqzWzHH8Nw
         MM/DyEUZdPPNZbhAuUhldxYjrgdXBSWUL5/umy//lcrND3nG7+AYGN8zNI8cGPOooGYb
         aHG/wANCXukrsvcXc7Q4UMfkN58fSDa/mRuuECmtXRLVB/74cgRRrel67jeUpJUb3im6
         bVFA==
X-Forwarded-Encrypted: i=1; AJvYcCXY0NUaw6ITO8JvUNY/2BppiJV+Ap8gdMDH26aNMJwCb0kIUx9UakGTGs4+JedmbU6Ri4khteUGtJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE3h460q4qcRN/sFgE2mccVZ0A8dA5Kz0OL6CWHb/bzZubaRRi
	n6QqTP+TwBrP9thl8N4s1/gRJwgphCobAHPwl+tvYt9dGTPw//nhW6pxRxBMRg==
X-Gm-Gg: ASbGnctUKrjTNMGVwirXVPyDKCh54jIYYUS5lKFYnIqmxm3a+qbewJXPv89LbNwquSj
	inytrg6qFvDkqtY0rsKUSnzkonJuLM6xYf3mVyanYrrVu6WxbL/IMfOS+JBVYGhMgaGbChEloSO
	avQF48+Xz93gGeyZ9oiR/zV3HIYzHQ9rpEe+H3cM4J3rzazWXtOvgBnRobkJ3Vc6eBKw1Genh8b
	7tJuXizZPCHyt0Q651j0HRnjIotlvb80Fbjcen/vL82HoLbxQMNRmFdcAP/E9yR5iZJtwqj85jJ
	JpAPTryWS7ygQRrXdVGajrS0496PIpc7HG/N1qo+8ZRf67yqaqT9P+ZeFTRHsm7AEg==
X-Google-Smtp-Source: AGHT+IEbxacT0Rf7glIV5zqQTQpKB3fYs6ygwCctur3iH2OIEYbdv0+TAfSzoLAAPaA0iPTY1QPe+A==
X-Received: by 2002:a17:906:6a26:b0:aa6:b473:ea4c with SMTP id a640c23a62f3a-ab38b0b920fmr3551212766b.10.1737975127295;
        Mon, 27 Jan 2025 02:52:07 -0800 (PST)
Message-ID: <bc5185ca-9001-4699-82d0-88e629ae6503@suse.com>
Date: Mon, 27 Jan 2025 11:52:09 +0100
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
> Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
> linked into xen. unmap is a no-op during tests.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
despite ...

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

... the comment here kind of suggesting that ...

>  # else
>  #  define FXSAVE_AREA get_fpu_save_area()
> +#  define UNMAP_FXSAVE_AREA(x) ((void)(x))

... use of this new construct is solely decoration, and could hence as
well be omitted.

Jan

