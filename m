Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151495878F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 15:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780391.1190016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOX6-00042Y-7i; Tue, 20 Aug 2024 13:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780391.1190016; Tue, 20 Aug 2024 13:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOX6-00040P-4i; Tue, 20 Aug 2024 13:04:20 +0000
Received: by outflank-mailman (input) for mailman id 780391;
 Tue, 20 Aug 2024 13:04:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgOX5-00040J-CC
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 13:04:19 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f3772b-5ef4-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 15:04:17 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so570331766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 06:04:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cf05dsm759233866b.53.2024.08.20.06.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:04:16 -0700 (PDT)
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
X-Inumbo-ID: b4f3772b-5ef4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724159057; x=1724763857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uhMhLWYWQVu/sP4fsE+nEyTVmqswCs8OSCI5tqcY4Xc=;
        b=Lp+bKs/zSEbVLaLvd4nw8CO8ZqOrx0VZZUidm41wKrQpERxzIJ0fvVShjYyZEcfAGA
         1PqRhGHIR0MqijcrcKHPl6pYuTi6y06sVJlpe8QVM72xT1ibZo45Oj0Dzhdra7/68yXl
         MxH7pkcFS/Qh/1iA/1X1VIVO0QS9Kn9w459TTuHGRglN2nrj9zZ7IQf60fjVkyGwbng/
         lwC3kqOziK+15zXqh/1Uj8iPmZG9nWW+Rq8mSjSI9id4Qj7MyFrxnNxu5aWGPDDVhi+x
         GwjwtwiTD5wIg8ftPbd78APqmS38ASYLrfW5wqlA2SBLu/gRk9aQZYjs+HS9r9u8YVtq
         +L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724159057; x=1724763857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhMhLWYWQVu/sP4fsE+nEyTVmqswCs8OSCI5tqcY4Xc=;
        b=jPJair6yu36/EnLpzl95SbtWFtLFyseipBv2c0WDu1ZwZ05iSaFaE9DE22VwZc9A2H
         VThp+dmbOmt3Hiu7k+2h1CJJ65NwUBt+z4nwVRhlUK9rzgcRDO2GGfEyTAaAoDZ8F99P
         d3pHVJa7U8+o4UxoYf6WqdC3TM49pbOnTLW7ftQjnTYaoc8PBk65ocJe8lnpigolj3jm
         E4ZOCsRzKgsYD4zd7/iS1kDebtD8DiLh+6sqQrwV8SXl+jQUOTxSeDBqxAPy1cswGY6B
         c/ZbS/lWBA8UrJcGVh0U77v6gX4JN5ovzrkCcyDohLqHvA1r79BxCKdnL0y7uvW+r8zy
         444A==
X-Forwarded-Encrypted: i=1; AJvYcCWdO3EuT045VKim7W4SB7VHaPJFPyeR7Gh6VXQGrnn3gs3hJib2TwA02b3/MNGsgF6dVwPbJ/wUYCJJ3BMcApWDwQsajbPUXjKAlkNm/eI=
X-Gm-Message-State: AOJu0Yzl1K+9qHsObuWDmb5gjqevQMP30oR7+EnIhrjnaMiBYZZAAXAA
	/aWf8PFRvcj2tka0VO9Go2HCfxwmCBNv1ijEdFZhiY07ayK9l7tVMEV9vkHt0Q==
X-Google-Smtp-Source: AGHT+IHKDwiZezHMcEf9hq4xShckH19SbCjgu3b0VykYyCU3cJDmQAm83THF6b/TjcRsDT68A9pwDw==
X-Received: by 2002:a17:906:c103:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a8647b0a2afmr124424866b.48.1724159056598;
        Tue, 20 Aug 2024 06:04:16 -0700 (PDT)
Message-ID: <80a934ea-9968-4609-aac9-4790c16af891@suse.com>
Date: Tue, 20 Aug 2024 15:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86: Compensate relocation in case of EFI
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
 <20240814083428.3012-5-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240814083428.3012-5-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 10:34, Frediano Ziglio wrote:
> If code is loaded by EFI the loader will relocate the image
> under 4GB. This causes offsets in x86 code generated by
> sym_offs(SYMBOL) to be relocated too (basically they won't be
> offsets from image base).

In turn meaning that ...

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -380,7 +380,8 @@ x86_32_switch:
>          lgdt    gdt_boot_descr(%rip)
>  
>          /* Store Xen image load base address in place accessible for 32-bit code. */
> -        lea     __image_base__(%rip),%esi
> +        lea     __image_base__(%rip), %esi
> +        sub     $sym_offs(__image_base__), %esi

... the comment needs updating too then, as %esi won't necessarily hold
the load base address any longer (if I understand correctly what's going
on here).

Jan

