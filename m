Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42F996FBE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814827.1228511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYeU-0001oU-4w; Wed, 09 Oct 2024 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814827.1228511; Wed, 09 Oct 2024 15:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYeU-0001lO-1t; Wed, 09 Oct 2024 15:31:02 +0000
Received: by outflank-mailman (input) for mailman id 814827;
 Wed, 09 Oct 2024 15:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYeS-0001lI-AL
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:31:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c075cb7-8653-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:30:59 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9982f90e92so199188566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bbca1sm666738966b.5.2024.10.09.08.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:30:58 -0700 (PDT)
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
X-Inumbo-ID: 7c075cb7-8653-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728487859; x=1729092659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a4uFpjjF+UObxoPpfoJyH3WLVar+9/sBTiFTAS35G8A=;
        b=Pj4mmS/FqrFnwIraKn8VdYL31xIpcblYfVUN+ki96Ow4zLHlZfWG5rI/U+WD5S6zos
         IAP0lOVeZl256evJHcaWqMJftPzvQBSU9xjV3nQ2Ut2QrYKzwkK3o6PUpKbjGpmJjvVP
         ndoncvDjHFCiv8gvVXxq89rq1gackPy6dH6LScBtN7MwcW7WyC0gCGKeOtc+dFDvh3mg
         z0aqMt0qgV83g1CNgxZ5OGAMJMtu0tm7lnNihon4FFJC1gzbLnRXWHXHisnAOjVPV0xJ
         mfPn0p9xYDigcjFArdrp8uNjxmx6nUuJ+KkNrWs+1M3uiMOItDMRZVT1zff0ZKq2LYb8
         jrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728487859; x=1729092659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4uFpjjF+UObxoPpfoJyH3WLVar+9/sBTiFTAS35G8A=;
        b=rIqgfShHckWAGIxSuzlU0R6F7yiKp83Cec1IiVgG2hRubUIEYEaPU+wENrtv+h/e/a
         5yZ3Gj4/MHGHWAUhWpW498JIQZRKVf3tV3bylEPmWzG7PxakK7yKPLAntoZgUyYUz2xE
         IpZJiiobGP+etocIk4dtJpH5RKlN2/A2p/4vIFVb1QH2Tp6wTIuDF88jMPzh0yNohSv5
         WsGVKA3Y/TUPdQAtjE3Lm1whla9h9eMTKeNfYkk8yrzA/qagj3hU4DlTG34bGHZg4lxN
         lAEbtPsM5lQxaegAyIjiPLi1pjMHynBpnjsLhejAzRHC/N515OHKJ3jFyYU0T6jKgyNT
         qbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIkQ/CY15Xw/TEzjpwCrS3wntTB474Ct/HW6TgcY5TOnaUwoPgQr6NJCBsr5IVaQ5CbhSr8VK4Rf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUh4TyBpZyFowHzLRSd1IBhzgOPfp7N9Wef/r2vdKxT7vkbroz
	f6ZVGN4ORQSr79yv5UxGmoGv9UwnsmsfL37c1bpx7b1knTPKfxZptCP52J12Cg==
X-Google-Smtp-Source: AGHT+IHYZGVfGxEnSD09RRyo9nXfHkYP4DRGZzSaBW5t4PGD5xKiqfwEa8ixWO84kex8mQ2Ou/FJ9A==
X-Received: by 2002:a17:907:86a9:b0:a8d:2281:94d9 with SMTP id a640c23a62f3a-a9967a7a339mr844631166b.23.1728487858761;
        Wed, 09 Oct 2024 08:30:58 -0700 (PDT)
Message-ID: <77257ccc-2da9-4b9c-bc91-21357486c206@suse.com>
Date: Wed, 9 Oct 2024 17:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/44] x86/boot: introduce boot module types
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-10-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241006214956.24339-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.10.2024 23:49, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -311,6 +311,10 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>      for ( i = 0; i <= bi->nr_modules; i++ )
>          bi->mods[i].mod = &mods[i];

This loop, on its last iteration, has done ...

> +    /* map the last mb module for xen entry */
> +    bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
> +    bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];

... this assignment already, hasn't it?

Jan

