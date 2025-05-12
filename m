Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F90AB3495
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981142.1367530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQ8A-0000ME-NY; Mon, 12 May 2025 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981142.1367530; Mon, 12 May 2025 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQ8A-0000K2-Kk; Mon, 12 May 2025 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 981142;
 Mon, 12 May 2025 10:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQ89-0000Jw-7D
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:11:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775cf145-2f19-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:11:27 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso8023936a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:11:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219341d50sm605612866b.67.2025.05.12.03.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:11:26 -0700 (PDT)
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
X-Inumbo-ID: 775cf145-2f19-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747044687; x=1747649487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTrE+vs0DOehU0Z66/Y/RLnJByJiyzgoYdPLSY5fUWg=;
        b=D8LdD+YV2bc7A+6p3ToCt3x7PDUy/pZn8uLKXK0Lhl9cTgziMgJboCajsE1IVQI3fd
         Bkj2sY/oUtuJVASeuj2OlND4+/kNMCs946YJ+NgOrhVv5QDrqMhMr0yZO9oJwJ8A852e
         4/LVBoqPsA3KWMtNEA8K9kKU/0SdF+fkSLrezc2dP7utTwuqFM48yqhC4hp1uUA13mJX
         rxl/eoZmM52V+ZnqiHsLMp+CExS+xmat8mN7eEroAoIiYMCGVOSMb0KXxtAvi7MMNvUk
         Q/OERLhyTlgZ8GV4rDnHXmDOglXl+kaXSZPTlsytS/TgDFrLS5CEfUX630i+EgzWd4KF
         Rj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044687; x=1747649487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTrE+vs0DOehU0Z66/Y/RLnJByJiyzgoYdPLSY5fUWg=;
        b=mKiL+0IPC/IIb7BJa02flW8J6SQYzEHD+vxhw9k6FLVoFPoJk7acxAkFFek8Lug7bO
         Svo3diljyQH26HUut6baqhpsaG3ReD6fx54wgeUB7vTsRyxZ/yOKsEpi5eC7kTVAW4f9
         HdLy6X5pX1fuzFznsTCxOUtSr8nKTHVozYe6hsba9kdXeGhsMu4q48n8Y7VgpLjP1mbr
         4JPkExvFmKm6Z6eiheeJO+xPFPwy/62YX7BIB2zA990mZMtUUq2L9p5IPtyCvD4HPU1t
         LqozKPh8PTGx0khZsDxkUuCZTnxG9REXI4nb/0XjL/xfX83v7m3us9m49S1Sq1ncGZM3
         COFw==
X-Forwarded-Encrypted: i=1; AJvYcCWypgKrhDa2qSwTdRHyIL1cIanFbO6lNSLuEmlsc/1vKFodju7h6TUH/rekguTdEq26gd/o8TTDXFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlZCTeJk7GpUJ4/OPqhD4wVXAuKF6PO4tn0ej8yUDDXeYhwvqq
	pwBSb5Y8tNhZoTeqHRdEHhq/hHsaXwOkU2VNqibKCV4fkaWvoz6a2c9Y/JbyIQ==
X-Gm-Gg: ASbGncv0akRvg/3TQ2sDV5NJkv/p+rqBnY1toP6w7l8BEat3EdEqNvMtiHBr1gwuO9U
	i+RASiaYd1Ei8r64XEclnW7wFzK/ky3aFVVQKgS8XBhxDyLYyePdCJDj/7P2dJJ4op7fQtnZmcr
	DeP4/XEkeV7SsLhLqCkwaNaq4jO8mG+yLadUxIAO+wq8bIYV/Ui40CknjhOFS64EUKMD3y+iWV7
	Nbrzy+X1PRQjN+bRkhYveU0yzvBmnvXdNUp0QmgGZEJvLKLuA/MVGatBJ0emd4+uIBmsAdGEfAu
	yBNz5uHWf8c0NspYXJIWOKONkDHFObdainfOPcNToJLtMKN38hMVr9W74iT9MI/k6kWUB8g+B6g
	2jxPfiQBDZ8En9cH1APHCBNFLlaI+I2gWpKhMv+xr+Q4dVr0=
X-Google-Smtp-Source: AGHT+IFNdhv2H60dSEZXp87d9U2M84Y86kktv3xZiC7nQ1YQpgpathtF21rYvK5HI1JgzZmdzQVdrw==
X-Received: by 2002:a17:906:3b91:b0:ad2:23b6:149c with SMTP id a640c23a62f3a-ad223b61518mr852509666b.43.1747044686721;
        Mon, 12 May 2025 03:11:26 -0700 (PDT)
Message-ID: <c1fe060c-4dbd-407b-b141-5ae088fb0fe2@suse.com>
Date: Mon, 12 May 2025 12:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Work around MISRA R13.2 complaint
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250510001848.2993380-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250510001848.2993380-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.05.2025 02:18, Andrew Cooper wrote:
> Rule 13.2 states: "The value of an expression and its persistent side effects
> shall be the same under all permitted evaluation orders".
> 
> Eclair complains about a Rule 13.2 violations because validate_far_branch()
> assigns to rc,

Followed by "goto", i.e. not taking the path to ...

> and the entirety of commit_far_branch() is also assigned to rc.

... that assignment. This pretty clearly looks like a tool shortcoming to
me, and I think it would be a good idea to ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -333,12 +333,14 @@ do {                                                                    \
>                                : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
>  })
>  
> -#define commit_far_branch(cs, newip) ({                                 \
> -    validate_far_branch(cs, newip);                                     \
> -    _regs.r(ip) = (newip);                                              \
> -    singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
> -    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
> -})
> +#define commit_far_branch(cs, newip) (                                  \
> +        ({                                                              \
> +            validate_far_branch(cs, newip);                             \
> +            _regs.r(ip) = (newip);                                      \
> +            singlestep = _regs.eflags & X86_EFLAGS_TF;                  \
> +        }),                                                             \
> +        ops->write_segment(x86_seg_cs, cs, ctxt)                        \
> +    )

... add a brief comment here clarifying why this odd a statement is used.

Jan

