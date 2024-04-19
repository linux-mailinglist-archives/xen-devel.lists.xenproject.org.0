Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1C8AACA0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708936.1108151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlHA-0008SQ-5p; Fri, 19 Apr 2024 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708936.1108151; Fri, 19 Apr 2024 10:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlHA-0008QA-2U; Fri, 19 Apr 2024 10:15:24 +0000
Received: by outflank-mailman (input) for mailman id 708936;
 Fri, 19 Apr 2024 10:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxlH8-0008Q4-FL
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:15:22 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab8509c-fe35-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:15:21 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so22860961fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:15:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o8-20020adfcf08000000b00345c2f84d5asm4048476wrj.10.2024.04.19.03.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 03:15:20 -0700 (PDT)
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
X-Inumbo-ID: bab8509c-fe35-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713521721; x=1714126521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUBj57HlhotlFW8G1hkkBBBLw4yuTA4KLcgV/wtLSaM=;
        b=QeW69bGUkNh1Kcy2gaoSb394iAAVg1A/d9b7gSNqFKSy4tfvLD2IyDFf8jY8QF+V/B
         Q7LB8iQTv86D6jYGQ3tgWmWyXp+iZ2UdkygnMdITlVNr3HWx51QDagG7bQhEQMshjmdf
         tELlFfYI3+PgTHMX0uYpV6ZSiSe/h6wNO1tZNpx/FmgiFQGq6jBsLWu5BZlLL2zRwhu9
         1d+wQ0F4eAwZ/i3XlUUgYjASEDtQgS1FAbxT6ciB2jC0YlSoAhoY/W+Lptv8A1ciUNN8
         rAplobZxOp569vP4bPdz3cufB5r0J8DGOBHwRifHd5kzNK6wwJGpXVo/pgB7UBo7aP2f
         U2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521721; x=1714126521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUBj57HlhotlFW8G1hkkBBBLw4yuTA4KLcgV/wtLSaM=;
        b=d5pltDcYQafIJuqUwjjyMMmkAmz8xsQV7RduNDWLwxrIrCDn6lfp+KkYFX/V3oTDZv
         EcLK7Z6VBspi7thKWMXU5FNqw93yxnUluuveL3tW4wOD631BzQH7BSlhtvG6EOwayJAh
         IMw5z4XCisdcio6tlR+vveQqp4Fy3a7doBtakOttYOmjraDjRXI/LW2elzNPUmZgjOUP
         N338Bx+XlKd5lm+7FcOY/8sLfMksb70iKxWnzX90LEtzkXVWs/ubHHoMa0jOdiMMbMpS
         HNW1AAkFurqGEyJPu4llPZY5HUXi7oe031rXDYHA4DrC03ixxGuwL3ENhhxXsjVp6PrP
         Umqw==
X-Forwarded-Encrypted: i=1; AJvYcCVyDa31zK0zNjh2SbG072AMNihtheN2rWExpnwBVmzzdVdDLU9dPBsJ6mU8fr6IfxjwpAggAhapPVrl2lbWBdLedJNMnphxxq4xayn6M+A=
X-Gm-Message-State: AOJu0Yz4sLqbkgmI3r/FiiqrI0bpboCy5R6Z0zOFLdSi/s9zyUUNQ3Gm
	V7r+bYKkqt0amUqDIhyfvbGpst7io+sE2VmBrIzy3C7V+TCZJnJful7536Ah5g==
X-Google-Smtp-Source: AGHT+IG2igFoNwk7hAyxzT3w49rz2J9AsC1uTxEUhwTsuSfIAdLrUvGTezQGwPziVXb2CkcwbDdfMg==
X-Received: by 2002:a05:651c:49e:b0:2d9:f818:1736 with SMTP id s30-20020a05651c049e00b002d9f8181736mr1202486ljc.40.1713521720901;
        Fri, 19 Apr 2024 03:15:20 -0700 (PDT)
Message-ID: <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com>
Date: Fri, 19 Apr 2024 12:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
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
In-Reply-To: <20240419100217.12072-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 12:02, Roger Pau Monne wrote:
> Livepatch payloads containing symbols that belong to init sections can only
> lead to page faults later on, as by the time the livepatch is loaded init
> sections have already been freed.
> 
> Refuse to resolve such symbols and return an error instead.
> 
> Note such resolutions are only relevant for symbols that point to undefined
> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> and hence must either be a Xen or a different livepatch payload symbol.
> 
> Do not allow to resolve symbols that point to __init_begin, as that address is
> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> resolutions against it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Fix off-by-one in range checking.

Which means you addressed Andrew's comment while at the same time extending
the scope of ...

> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>                      break;
>                  }
>              }
> +
> +            /*
> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> +             * livepatch payloads don't have init sections or equivalent.
> +             */
> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> +                      st_value < (uintptr_t)&__init_end )
> +            {
> +                printk(XENLOG_ERR LIVEPATCH
> +                       "%s: symbol %s is in init section, not resolving\n",
> +                       elf->name, elf->sym[i].name);

... what I raised concern about (and I had not seen any verbal reply to that,
I don't think).

Jan

