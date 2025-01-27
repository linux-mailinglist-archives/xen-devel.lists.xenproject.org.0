Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF0A1D516
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877718.1287858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMwL-0002Tj-7G; Mon, 27 Jan 2025 11:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877718.1287858; Mon, 27 Jan 2025 11:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMwL-0002RA-3z; Mon, 27 Jan 2025 11:06:01 +0000
Received: by outflank-mailman (input) for mailman id 877718;
 Mon, 27 Jan 2025 11:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMwK-0002R2-5X
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:06:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afa2ec7e-dc9e-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 12:05:58 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aab925654d9so836683966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:05:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e12090sm562093066b.29.2025.01.27.03.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:05:57 -0800 (PST)
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
X-Inumbo-ID: afa2ec7e-dc9e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737975958; x=1738580758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NNHBCSlOcRiuXlHNRAgql38aYjNqbCAxYmxfI+H8MNE=;
        b=Tso65KdtZlq5qJr/jCcFu5mDaP8ZbJMaq1cI997Vo86M1ZNUkdEkyLS+Hc+AiRhIt2
         8fwPs60Jbf8THKbq/sRPQBMEyd7P/mP8pd4dhUNRS4ngZjx36Blbbdl6NQpFCvYMP27k
         rp1+yKOL5snZlTqWW01Eg9IKyQKrwvUfMbMRGebOsr3+MenK63p56Fj+B9aMeS+hCaXj
         IiCxVQONbZ9OzM0/eFRW/dgRaaa9pTA7gO+1rC15Ie9+f52oq8AZH+5OhOfNYhyiI9+2
         zuC/jIs8Z4nBIcktdLYIIqqexcoZAALt+MUhHAB0UAPxeQ+rjGFiRods3/BAiET0itay
         kElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975958; x=1738580758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNHBCSlOcRiuXlHNRAgql38aYjNqbCAxYmxfI+H8MNE=;
        b=kp28ugTPteJTD/8Kdj5BqhuKreAUAZyimqqR21JDV7xUpfNZ2spxEFFlN7mfNQcyr/
         TqNGOL/1QtqjRPMPeBFhw0u06D6c5Sx+0aa27GDscvQv/SlwRp8Bg+lR1mpUDycx6/N6
         uVr8rFKBZGf/ShNJppL5sXMaYoFE1kwleAmpiYqAUDqan+HfgOjLoZT9s9DEZXC4B8sz
         3wTIXV5gaTq2cHtl9YC1ZSmdk7w/6kaCSrGw/BgO52pVdKHaTjy+UsVP1uJnQFCISMv8
         Dqs4c/kTWy6sAR2ryPCl56PV69cj1HtOkoYT2a9tHJXEupM7Dr9Nbf1LwPrvUOAAMYdb
         125g==
X-Forwarded-Encrypted: i=1; AJvYcCVdbRJ72j4Lj0yFTuOdfJUbz9SBEEEtlEBsLh+XaMYOcLVXAoRcrirKIFoq/IXd0MI8i1s9SBQa1Nc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZ5vXnaqF/TaTeq6Gq69o4QFs7pWcuGkzw556h0DK3KdgJfrUX
	yVw92FLJCslAPC4+1kZ2W9iek1Ay/+LeEpt0sHjVfrON9Xz3onAwBS9sZNkhWg==
X-Gm-Gg: ASbGncv7MZs3/kUWTFhNh0xbmPKv9KPgxoOn+fDmqY/NPQSWdX/J+HCGp9xgUbocmAi
	cAVRyCVLArOL2SHJCCQlJWMg/lsa6e7aQBgnvhlHGA922fpWzBzuKlirTZoQu5Wo30yrObC68AG
	koQ1n60QhCscNVKSY7Spf7Q2VgS7dAwHfH4yFpTroj741u/qHzk7DImzQWlyBJALyF8jR/KqiWY
	YyfHdKVbLCE0UCxEboox/83u/m18eI6iYIE0uqR0k1BbNcBxXqYDzY7UbyTDnSqEzIX3HbXo6LN
	i5wbv8h0KgRLM/G8tt1AWx5qdWcLMCn9xHK4CZbYB0zBHnWCKD3r4aW43XPRY26pzw==
X-Google-Smtp-Source: AGHT+IH8bQdzTmZHSVkjgbBbLgsVKMx9tVeB3fK7uMCAGX6OGMWZfFrPxhY74Ys+0Z78b5yxRrOkiQ==
X-Received: by 2002:a17:907:3e9b:b0:ab2:bd0b:acdf with SMTP id a640c23a62f3a-ab38b43bc08mr3824307366b.36.1737975957663;
        Mon, 27 Jan 2025 03:05:57 -0800 (PST)
Message-ID: <1f1ab2d4-73ad-4562-b3c5-0b423b56aed2@suse.com>
Date: Mon, 27 Jan 2025 12:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xrstor()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-12-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-12-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> v2->v3:
>   * const-ified v in fpu_xrstor()
>   * Removed v in fpu_fxrstor()

On this basis the parameter could also be removed from fpu_fxsave(), by
passing in fip_width instead.

Jan

