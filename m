Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CE9B4445
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827119.1241622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hcf-0006po-3t; Tue, 29 Oct 2024 08:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827119.1241622; Tue, 29 Oct 2024 08:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hcf-0006nU-14; Tue, 29 Oct 2024 08:30:41 +0000
Received: by outflank-mailman (input) for mailman id 827119;
 Tue, 29 Oct 2024 08:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hcd-0006nO-N4
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:30:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13992568-95d0-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 09:30:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so47717355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:30:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b5707e8sm166615745e9.36.2024.10.29.01.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:30:37 -0700 (PDT)
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
X-Inumbo-ID: 13992568-95d0-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730190638; x=1730795438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y+8QlVPJHCEiOHvzIbb7ZOpZ1kfzA4TcpPdaqlOqjs=;
        b=XAr25rh9dLC5Uic4y9CT3g8bjW0XHaHX+Ni1IiSaWLbewcQzlvNOIPNQ38I825u8P6
         A4XOi2ateFN3uCG/t1jfoWZPGsssUZwXTHC66eLXUuGxzLJashr++KI+QqJW55chjIrL
         t4XFlzdCuwY+19k4qsHNulXNpKigtenB/rEI/GSYygtp4iPG92jEWgUPLiamG6b3GXNK
         Ym6MqL12Ko6kxZB2xErpl50t6R8c5uo65mpqtkICoJUXeetC/vy7C+3hzbknkS2baloG
         OG76iYxdyveiBLVgY2PMuW8V9O1kTJemAAqKTC5Ms2Pn3GoXZyAOYrgzN003yZzmeN3B
         FvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190638; x=1730795438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y+8QlVPJHCEiOHvzIbb7ZOpZ1kfzA4TcpPdaqlOqjs=;
        b=IQB4764dObsdHQzxI9CymN/Lk+AEk85x2Wko8PvJRu7aaFJb6XHOtIDbBMmp14RYLk
         egx+VksI/Q2DmxAL59+WuBnZGz2Yr8jyIqWzS7pADVpL1Hy4tvH2uPbw31+gexB/qWmu
         tDNgXYQuaJrKYYoBw/oT3l2YyLRLUeP/3cYLhtrl87B4c01TUrgLtcy64sKQ3b32IPSS
         BVs3GaGn0upGEyn21P4FC9wABY/ZaSId9/uaxhr+vtXsyNsb4XTaP3X45lrF+YwKPVLq
         ZK+Zsq0Z98dhhDg5b2c4SBJyxHBhAIP92y31xWCOlzyX/WDeWEf7SoFQFLXEl55UX36O
         rI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8ISCzP9q1c6DDIkBKBZ7mmosfP96SYEZYNeVKs56pqODM9zvu8m/9VoHhw67GPhdm42ZhHwZG5+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf5JSN9igK6tG8wtf2pkigpj+ll1OAqrV/ASwrgXa0mebIjAL9
	aEwCiMgUJDNN8nvtasmNIE2TOF7uF4SLV09YMJV4De7b554He7ygIx4HhQgBIg==
X-Google-Smtp-Source: AGHT+IGLD2jgcvyLPl9EivJVmybeeLdbu+TMZyF3nVtD2Hkusn9kle4l1YecNiiLOSLflowZ1ddMGQ==
X-Received: by 2002:a05:600c:4e86:b0:430:57f2:bae5 with SMTP id 5b1f17b1804b1-4319ad0f60dmr74693115e9.27.1730190638224;
        Tue, 29 Oct 2024 01:30:38 -0700 (PDT)
Message-ID: <fa1ad41c-a310-41f3-809a-b00af614b6dc@suse.com>
Date: Tue, 29 Oct 2024 09:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] x86/hvm: Map/unmap xsave area in
 hvmemul_{get,put}_fpu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-7-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2371,7 +2371,8 @@ static int cf_check hvmemul_get_fpu(
>          alternative_vcall(hvm_funcs.fpu_dirty_intercept);
>      else if ( type == X86EMUL_FPU_fpu )
>      {
> -        const fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
> +        const struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
> +        const fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
>  
>          /*
>           * Latch current register state so that we can back out changes
> @@ -2397,6 +2398,8 @@ static int cf_check hvmemul_get_fpu(
>              else
>                  ASSERT(fcw == fpu_ctxt->fcw);
>          }
> +
> +        vcpu_unmap_xsave_area(curr, xsave_area);
>      }

Same question as for the other patch: Mainly a cosmetic change, with no
actual map/unmap?

> @@ -2411,7 +2414,8 @@ static void cf_check hvmemul_put_fpu(
>  
>      if ( aux )
>      {
> -        fpusse_t *fpu_ctxt = &curr->arch.xsave_area->fpu_sse;
> +        struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
> +        fpusse_t *fpu_ctxt = &xsave_area->fpu_sse;
>          bool dval = aux->dval;
>          int mode = hvm_guest_x86_mode(curr);
>  
> @@ -2465,6 +2469,8 @@ static void cf_check hvmemul_put_fpu(
>  
>          fpu_ctxt->fop = aux->op;
>  
> +        vcpu_unmap_xsave_area(curr, xsave_area);
> +
>          /* Re-use backout code below. */
>          backout = X86EMUL_FPU_fpu;
>      }

Same here. Because of the overhead concern, such places may be worthwhile to
gain brief comments.

Jan

