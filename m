Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F0B3E465
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104757.1455802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4NV-00072E-A4; Mon, 01 Sep 2025 13:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104757.1455802; Mon, 01 Sep 2025 13:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4NV-0006zw-7O; Mon, 01 Sep 2025 13:15:21 +0000
Received: by outflank-mailman (input) for mailman id 1104757;
 Mon, 01 Sep 2025 13:15:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut4NT-0006zn-FG
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:15:19 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b26432-8735-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:15:18 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso246964066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:15:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0d9b1b53sm741761866b.96.2025.09.01.06.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:15:17 -0700 (PDT)
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
X-Inumbo-ID: b4b26432-8735-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756732518; x=1757337318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eV3UJ52v/5RTKbIh6wnLIN6iSdIYD4/QpbMRN6+8CPU=;
        b=Gno6iDLsQh8oD3s/y1zdKUiCghrDNVydCRH+ZrO4N1lwBsTqJ2MCNNWMq8gV4nEY/d
         TjTJGP77OF+sikcUvD1YpMRaoB/MvWJyLjmZuIryAB+wXYsxcAvEzMSU/tL8xPlqmd7K
         xlw+FYUH/TaamNu9wNLKOVDC4cjMwDLjWPKPtU4AtY8jyAe1cxuf4soWyMqewaJxyGzf
         wkYvuTR4vXqaSWhcL/yzGYX6zzwoBSG+bGkNCNJ+opzNDMfF9OjEDUhhwG8tvfqdrPrO
         L0IHM1QCVdw6KqqlO6B/Yjcxw7XiJyDGdeeURaKv6v9UrQe/BMBIPpsECVIhSOlWGvPI
         MGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732518; x=1757337318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV3UJ52v/5RTKbIh6wnLIN6iSdIYD4/QpbMRN6+8CPU=;
        b=wD6K8hiPHs2bxO6+FjAJEq8pjOlBeIq40+Gue1CYFYtGLYRHBXmGkpWXcuOEisUddH
         jE781/5qSoiIjEm9BgSIzuJFW3GTdE9lk0TrP4feqVewAmL+tiXs265WcFxsPnFDY8zJ
         nNlZx9DgjQ3bQ7cvlhHbz4sCW2MWaWcNq47pX7gLOn3BStIW9YIq6AWXg7+W+uMnq8zS
         HwYOJy25CpG4V56etr5SN0TerOiM3jy5L2E9Cye9q/PtXix0icDJ5Q4vylVdAVnD/Kzz
         6nnfRvLTXZTDpMACJKBQdrGGeIVwy4Px7Hpb9ACeOk6v6GbK/X/nOoyRh5FvNHvGm/l6
         XUGA==
X-Forwarded-Encrypted: i=1; AJvYcCWxguU7COJjXYI260ESMJtk5jab+CoQcDEWzM5bxOtnlDd9fcAL4OiZ//8djiZ+B17I++/LTVr+THo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5IUQhEy2hkigNeYjHc586mNQHrerHxQmWXJSlqZ5cSJWlDxjc
	RuJX+kvPBHXXRsEPZvMsU0aI4/EpxKZX8IPU/M84hBzyzyOKzhsof05d8izOx79LgQ==
X-Gm-Gg: ASbGnctyRV0nEvAgLuKrcIU5cGbAJ3D3DT8jjBW2XlS8egffkMx6qrVeJB69eDdDOxJ
	6DI7JxDT5X4+NpgRZdqtIgv4nuza+vz/UGD8ZtyFdSST+IdjWV2wkh1kx+MtaLH3ug9SVVwJrkd
	FZTiu97+9Og7UUeYWoZLNPJN5CRVtgwDFxaUoNd+rG3eHIICOMeryjsWsJ4KrP1pK7mNx8mYVpc
	bD+0e9IY0/op9HW6U29wPQXx77kGaK+sR3H22GOZ7jkWwQpHryY2r16NhQ/EmH9eN+gVJ0eiv4j
	/QKjGHgJU0dlOhO/vHzJ/j70s2s4zUR4+lPfCEMdLpdCn+D9ErDB4d/Fvv28BoBCyfnPPOlPZ5M
	urfu7ocFgCFUGC4ZjRRSRrCk88P6ouDChzJ0SAAb8UKwQkafTEGsF8360KzVOwQIuYiDNvcyVd0
	Vyh8rGc2U=
X-Google-Smtp-Source: AGHT+IH9TD/9JZy9lZOw0+aAjFP30H4uRCdqXXmolB04FhjBTODbFnhJyoZAS+gFdAk5gU58IluTwA==
X-Received: by 2002:a17:906:3757:b0:b04:1249:2b24 with SMTP id a640c23a62f3a-b04124939a7mr486049166b.37.1756732517890;
        Mon, 01 Sep 2025 06:15:17 -0700 (PDT)
Message-ID: <dfd60b94-7e20-4ede-8fab-90bf99c19d16@suse.com>
Date: Mon, 1 Sep 2025 15:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/23] x86/traps: Introduce opt_fred
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> @@ -20,6 +22,9 @@ unsigned int __ro_after_init ler_msr;
>  static bool __initdata opt_ler;
>  boolean_param("ler", opt_ler);
>  
> +int8_t __ro_after_init opt_fred = 0;

Can't this be __initdata now that we have ...

> @@ -299,6 +304,37 @@ void __init traps_init(void)
>      /* Replace early pagefault with real pagefault handler. */
>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>  
> +    /*
> +     * Xen doesn't use GS like most software does, and doesn't need the LKGS
> +     * instruction in order to manage PV guests.  No need to check for it.
> +     */
> +    if ( !cpu_has_fred )
> +    {
> +        if ( opt_fred == 1 )
> +            printk(XENLOG_WARNING "FRED not available, ignoring\n");
> +        opt_fred = 0;
> +    }
> +
> +    if ( opt_fred == -1 )
> +        opt_fred = !pv_shim;
> +
> +    if ( opt_fred )
> +    {
> +#ifdef CONFIG_PV32
> +        if ( opt_pv32 )
> +        {
> +            opt_pv32 = 0;
> +            printk(XENLOG_INFO "Disabling PV32 due to FRED\n");
> +        }
> +#endif
> +        setup_force_cpu_cap(X86_FEATURE_XEN_FRED);

... this? All non-__init uses could use the synthetic feature bit.

Jan

