Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8CA95063B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 15:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776241.1186375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrOJ-0008BS-97; Tue, 13 Aug 2024 13:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776241.1186375; Tue, 13 Aug 2024 13:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrOJ-00088P-5x; Tue, 13 Aug 2024 13:16:47 +0000
Received: by outflank-mailman (input) for mailman id 776241;
 Tue, 13 Aug 2024 13:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdrOH-00088H-7y
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 13:16:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 493523a1-5976-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 15:16:44 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso19049866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 06:16:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f4181439sm69072966b.190.2024.08.13.06.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:16:43 -0700 (PDT)
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
X-Inumbo-ID: 493523a1-5976-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723555004; x=1724159804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nE+YjaYB3HW2xH+wnCXmqLaiWuAx7sHzGq0lrBqgqAU=;
        b=QeVXpkx3Py8iefqcULYlMXHvX6PJL09At0Fy9aFwQY5eUW60o7gah6gDinAzshLiFD
         n+jDxGQYNiVp9ChBYWZGwjrxra+PVHdPz+OZRxWX4zMKqz+RbXSdU9tmNS1OrQHlIKja
         XoYJ68ecPSBYCi0ypEzwGIbDQTwOKVQoElark+oD7duGz92PihewmHwPw80XkTjNxdAs
         EO8gGphi4rnMQ+CChs/bxkuNM28jlGEBUZh0UxnO97LwdHKppjtOig9qmvduTtj8qGMI
         KxUJeM2m1n9+gdZqtCtUX06Fi1ZteRzBpeF6cP/Y8sq5TScMF8S+OJfo3A3JHvsPrZos
         /8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723555004; x=1724159804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE+YjaYB3HW2xH+wnCXmqLaiWuAx7sHzGq0lrBqgqAU=;
        b=AkQ4aohz+qdCzY9UitPyxBBoJnnpPQBIBEYP++cCO8OHJG36gn1QFG7PHGhb+DxabQ
         zpSBvsm6LoaIPRB9rMyPx2zqG41LU7CJFTCEo7xd4nt0Tyb/MZxhEoEDdY7dpMeqbhqk
         UXp946/I3/rUcL70q9HWR79b7HkQZ01LACIqYPyYo5SM8NvWHjv6mX1YgS0evCHlBRWC
         eq5184r9q6LQJLQbV10XnRqs5VrCkg7CmTJsehqoE5p7NXKE0BUWJhJfJ9PtcHl2E9vy
         1ARovFDrIeUFtRS3W9+gfTUbYRn4518fW3nb3RCLyKC4rFLdN8OnVVvQ3n1Htz5BP3VH
         qbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSAgN7PuO+HyU1GIO2ucJuQtJZvgM/+KRCrV5YCcovAWLOj3p79z6Nu4HjMXNidB7l9dy0PGWkFzFVAaWCR1R1UTFngpgC71xJYeBqpN8=
X-Gm-Message-State: AOJu0YzVqfhZGIUNvzu4yuOSOcg6scavMm4TK6rxJU8+BvodEqWkvkcP
	UWNWsN5vK6z0W2JIt5zyXudGw7YQuZ2UPmgyff+fbGLh9aPk9oBhyGas4lz88VHdSx3H6W14HMo
	=
X-Google-Smtp-Source: AGHT+IEoT7q882fVPIeSSScO1d/bcfk0JtfFJKzU3hhckYJ3ZexJyRUlTK4J+J5y9A4VsmnkigfNTw==
X-Received: by 2002:a17:906:bc0c:b0:a7d:a453:dba1 with SMTP id a640c23a62f3a-a80f0b3c9bdmr285726866b.20.1723555003475;
        Tue, 13 Aug 2024 06:16:43 -0700 (PDT)
Message-ID: <e442389f-a1f7-4719-9486-ebbf51225a89@suse.com>
Date: Tue, 13 Aug 2024 15:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] x86/mm: zero stack on stack switch or reset
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-23-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-23-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 17:22, Roger Pau Monne wrote:
> With the stack mapped on a per-CPU basis there's no risk of other CPUs being
> able to read the stack contents, but vCPUs running on the current pCPU could
> read stack rubble from operations of previous vCPUs.
> 
> The #DF stack is not zeroed because handling of #DF results in a panic.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/current.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> index 75b9a341f814..02b4118b03ef 100644
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -177,6 +177,14 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  # define SHADOW_STACK_WORK ""
>  #endif
>  
> +#define ZERO_STACK                                              \
> +    "test %[stk_size], %[stk_size];"                            \
> +    "jz .L_skip_zeroing.%=;"                                    \
> +    "std;"                                                      \
> +    "rep stosb;"                                                \
> +    "cld;"                                                      \

Is ERMS actually helping with backwards copies? I didn't think so, and hence
it may be that REP STOSQ might be more efficient here?

Jan

