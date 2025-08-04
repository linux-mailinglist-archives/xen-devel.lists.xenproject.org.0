Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ECDB1A3E1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069412.1433261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivbz-0005SQ-0b; Mon, 04 Aug 2025 13:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069412.1433261; Mon, 04 Aug 2025 13:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivby-0005Qi-To; Mon, 04 Aug 2025 13:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1069412;
 Mon, 04 Aug 2025 13:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivbx-0005OJ-3e
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:52:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d2415ad-713a-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 15:52:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af66f444488so596081466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:52:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9215cdc53sm691622366b.78.2025.08.04.06.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 06:52:18 -0700 (PDT)
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
X-Inumbo-ID: 3d2415ad-713a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754315539; x=1754920339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/F1MKbyo2whIItkwM3f1Kx9gvYWDGVzVy/Y65aOS0wk=;
        b=KKBoiE+47cdTIleptPJhtzsoliIXw/m3dlAyUL9sZvvpQLqGodZ7/bArmTXTXzQqyw
         D4poXEhMJH9aE6XYXh1S0VtDEerZY2P+CyguEllcdFe0sxWJ+d56tSCWQxixFSMpZccP
         b7iR/lNGVSud+sBBhDmJce2f9xNCgwwB75FN/9U8nIulLfqSNRUJ94qTKPcVcxWrUUNk
         tdhAp4XZnVGvXt6JeOEvOVG8qvahJlwdZY6jCc2+4Teasky4sP4KbJpHCpbNDi1J2t10
         9e7lkld47Yfj1ZeUG37jv9BTv8cdlWfv3H+vmF5jWF4C4mjuuavW9K2GlTflggtYQb5p
         sXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315539; x=1754920339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/F1MKbyo2whIItkwM3f1Kx9gvYWDGVzVy/Y65aOS0wk=;
        b=gI8QTkc8R9GuibfTZWHrD3RMFc18a2Y1pKNtQ/LALIGufch5JJeweDFYY2aEyDEXDJ
         tsTzEASp8HjSCBK86B9O1+sbzujCbAhnM92zWNvlEkbzww2MO7q/dbg6asUIEr3GAMtR
         lnRXpK4WYwGgopV0aINKGqZ3n3IXOBZYLuXcBrCoPkcj6J0cBTQC0zPnuStzlA06zO7o
         JJvyhyDbouk4ch7UU2FwuP1zvvw/AQHIsRU3wPj7gieKcLYjdm/xHsT/4/89OYjhI82E
         G/Zv1sNjUhbFppKXWzVC90FKuKqkmsBr3rhbYDxu5CHW9I31NUo16qGkX/enbxkuQb5Q
         DkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBrPbsKNQCriqziRq5rbWDb++gZpquXWR6/rq0OyAhnEPbvEhS+JpA0/iV1UicupqEkX56B86Ffdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5BO4HYC+GhJU59kt522qFqkqZMTswKJ0Rw3hR6ZTx9N7hVMqx
	YJF7ss1oItnO/Dy2Md+S3+GeJXaHkjXk4D+WkMRPMFlPdXVHph6suTcj8MYcsCAJNg==
X-Gm-Gg: ASbGncv6j0HkNIlaFQwMs/yci4pn0t7o0l54Ua5OzeWMCLD35yTQeNIF9KFF0nbIlDq
	ESgRuZ/NUfrtP0liMhENsjki/9p/nNz7TswpjWDxkBjsylqruaiMixKuzVF+g3J0gpQ45idSHpp
	8e+5NS4k0BQJ2F/SHJZYpsFN9BLMd3MbNzDMlWvY+ypw/5ZZwuzjB3AK6dXZj5wq6zlOr2YtfdB
	ThHezc2ES/WmB0vwaxqvPzn0d96DqzleH8Rmd6m5nkr9qL6XCHrwBoXEX9WuIDeaHUFDpI3y7s8
	kl2AdWsfZmESbUoAjGMa6NLUl4A3ftBTsbx/EJM0N0RcN4KEgFsaPg8KIpUUugl4vR9CJSNLh3x
	YzQgZPKzeGCt2R4536FD8afE5wdWl8C9S5cWFtkROL0pt8LAK9ApHAeelMYiBucv4Fp/aJkSzpd
	lfoEaKGuiAKyCGEZfBKw==
X-Google-Smtp-Source: AGHT+IHJxHUoohHWFrjuy5qfOCv55/tLt5fsA7q+Frsw3ncGw4xMD7FUVC2IWnhnkKFtD+RU8WaJ+Q==
X-Received: by 2002:a17:907:3e8d:b0:adb:23e0:9297 with SMTP id a640c23a62f3a-af940014680mr949623866b.17.1754315539092;
        Mon, 04 Aug 2025 06:52:19 -0700 (PDT)
Message-ID: <829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com>
Date: Mon, 4 Aug 2025 15:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] xen/riscv: implement sbi_remote_hfence_gvma()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <b0649cf7b071d0a1cdd7fc9b8d73abea5d0646b4.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b0649cf7b071d0a1cdd7fc9b8d73abea5d0646b4.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
> covering the range of guest physical addresses between start_addr and
> start_addr + size for all VMIDs.
> 
> The remote fence operation applies to the entire address space if either:
>  - start_addr and size are both 0, or
>  - size is equal to 2^XLEN-1.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -89,6 +89,25 @@ bool sbi_has_rfence(void);
>  int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>                            size_t size);
>  
> +/*
> + * Instructs the remote harts to execute one or more HFENCE.GVMA
> + * instructions, covering the range of guest physical addresses
> + * between start_addr and start_addr + size for all VMIDs.

... I'd like to ask that you avoid fuzzy terminology like this one. Afaict
you mean [start, start + size). Help yourself and future readers by then
also saying it exactly like this. (Happy to make a respective edit while
committing.)

> + * Returns 0 if IPI was sent to all the targeted harts successfully
> + * or negative value if start_addr or size is not valid.

This similarly is ambiguous: The union of the success case stated and the
error case stated isn't obviously all possible states. The success
statement in particular alludes to the possibility of an IPI not actually
reaching its target.

> + * The remote fence operation applies to the entire address space if either:
> + *  - start_addr and size are both 0, or
> + *  - size is equal to 2^XLEN-1.

Whose XLEN is this? The guest's? The host's? (I assume the latter, but it's
not unambiguous, unless there's specific terminology that I'm unaware of,
yet which would make this unambiguous.)

Jan

