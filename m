Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A52A27388
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881541.1291716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJQ6-0003vG-J5; Tue, 04 Feb 2025 13:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881541.1291716; Tue, 04 Feb 2025 13:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJQ6-0003sz-GN; Tue, 04 Feb 2025 13:56:54 +0000
Received: by outflank-mailman (input) for mailman id 881541;
 Tue, 04 Feb 2025 13:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfJQ5-0003st-E3
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:56:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e250789a-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:56:51 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361f796586so65746055e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:56:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6ffc9eb9dsm723862066b.27.2025.02.04.05.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:56:50 -0800 (PST)
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
X-Inumbo-ID: e250789a-e2ff-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738677411; x=1739282211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iPlKm8UWaOjOB+33JGaHIeo7U7ermgjcucBQvv8OpzU=;
        b=YvISpQlC907arXBZeL0mXeL3F86En+4YcO4GwkmbbaqZ0afVyqzOKWruLFRq6fX77i
         LXsMBj7WimiHSDMUPwufseDY/lAV+i/kQkZyVirCATXmRRuHseaAoxPwvricApFASBph
         SLJBOcDpgI8Ihd8VYG9eWIOLhWUIabv8MGKMoMVK7TrmZ2Q+DukpzmoWwdSSGQODn9PW
         lUcR0lY8jFcQ2l6RgCbfXBY0K7uVmWsYmMNH7cH4DhVTZvGXVSdSndaNHD/E161WuSQf
         rMiAne6HnuHwUZpjXxTXvVA0MuSN4z5Ld8KS7/mYmP+dafb6peBD06QhHDYdjwNVyxZV
         ZnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677411; x=1739282211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPlKm8UWaOjOB+33JGaHIeo7U7ermgjcucBQvv8OpzU=;
        b=c276ndJy1Ik9x7rc8Q/D0T/1DDwWgFJzL8WpzKLXXOtjKvoR9pQYZuAYkAI7u2DjS1
         Y8z8j9+Ls+IRvXYDyaZ8g+eXJXyi6NIJrlliFTK6tjuQIOEEF0Uyl16fPc/Xl2o0l99b
         69WHYRelwpH9sgstyOqxzGLB3x0rL+ChPl1A/sy+Vh6YklpHyLfteAfuwDnNgYILXrAg
         J6nt9gShbDTWfBEXlmMTlAoFbxDEc2MtABxVYwKCAinDyjXp3zEuQhn1Ru/TrSely56f
         gy5Z5Q8tgiT8ELmSsV4jFeJ5joiT0yuIEyjDNHkWQxfxWAmN9oegNToaPM3VnpL9xtgm
         SuBw==
X-Forwarded-Encrypted: i=1; AJvYcCV+6NY/di9BjB4KRz8hUE5vxcRLnOG76fHaWUKaUKI0wRnkluRxaQBZhas1W4ls+7YKsRM5ZEhtyvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhDOm7xsqC2WrxVyRXoBUfHuQyTpT7ZWg/M3e4Q0W1VzUhTtcX
	4vGbc/DvcYEdsgITwP2icT442+ZRyc+U0tMzO47dZwzNM1cBJOEJbZif8Jk3iA==
X-Gm-Gg: ASbGnctf/VaHHL8C8u3fWjIPvDobSGt3UzaXBosmzTyeyn2R6PQpDHhixmueAwsyzCh
	2AH9uHe5fSv7HAGzBcwtkwRg3EavNg6N8Kut4rxmDgbpVM7V4lk9UFkHoFDC7OIdWQfiwYUI6ph
	0E6+W2inYYLQLRXWeuExyZc11/HGwKcg04kVnB+dsPlhsysfcbZrWq+E8mQm1GRnMS5XioGLqtl
	ufPVTyKydAN+QYFX5SBInxs7jnnHpK7HAVnDX+YboU+8H4hSrhFWZPJRfkcUChYRdT038in7gfA
	gS95CzozMEwsVc/nBVjNYuEItoZcgspIEgeboZ/0aUOzDmuq5e6AGF7mUydKsl6W0XoTZAZKOxA
	V
X-Google-Smtp-Source: AGHT+IFO/6lsXT2H3q27pwSMd8J2z2idEqv1bmSf84ORDYOVD1/2c2+2NU550GXenwr/SQOCFPI9ew==
X-Received: by 2002:a05:6000:18ab:b0:38d:b125:3790 with SMTP id ffacd0b85a97d-38db1253951mr790224f8f.10.1738677410809;
        Tue, 04 Feb 2025 05:56:50 -0800 (PST)
Message-ID: <1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com>
Date: Tue, 4 Feb 2025 14:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <131ecfd1b39b4ca4fe3e5d7f7e28a130c301e0fd.1738587493.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <131ecfd1b39b4ca4fe3e5d7f7e28a130c301e0fd.1738587493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 14:12, Oleksii Kurochko wrote:
> @@ -160,6 +158,18 @@ static inline struct page_info *virt_to_page(const void *v)
>  
>  pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
>  
> +static inline mfn_t vmap_to_mfn_(vaddr_t va)

Btw., for static functions (and variables) a prefixing underscore is
fine to use. Its identifiers that don't have file scope which shouldn't.

> +{
> +    pte_t *entry = pt_walk(va, NULL);

Oh, noticing the anomaly only here: Why would pt_walk() return a pointer
to a PTE, rather than the pte_t by value? All this does is encourage
open-coded accesses (even writes), when especially writes are supposed
to be going through pt_update().

> +    BUG_ON(!pte_is_mapping(*entry));
> +
> +    return mfn_from_pte(*entry);
> +}
> +
> +#define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)

You've lost the parenthesizing of va.

Jan

