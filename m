Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDD866C58
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685314.1065820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWQB-0004iI-BR; Mon, 26 Feb 2024 08:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685314.1065820; Mon, 26 Feb 2024 08:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWQB-0004g2-8A; Mon, 26 Feb 2024 08:33:11 +0000
Received: by outflank-mailman (input) for mailman id 685314;
 Mon, 26 Feb 2024 08:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWQ9-0004fw-Bq
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:33:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa9de41-d481-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:33:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so479056166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:33:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a170907160900b00a3fb7cafad8sm2204014ejd.39.2024.02.26.00.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:33:06 -0800 (PST)
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
X-Inumbo-ID: aaa9de41-d481-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708936387; x=1709541187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AlK1QA3IkmQoJPu/OAS6Z5gNe9NMItGQZvQvtBNbik=;
        b=bbLvutCaKKSCNtnmcTOtiUFM9spTpNk/gmqef8RScUx4md0HkEasTwfaJWjRGMURkP
         E6fssPLDaLrGDhMxR4zV72M8GLIqvvKmeUGk099pS9yIsHevdr3RKwrYgNwKmVcmOqpV
         XT0RiMWhPc/K1U3P9zIdxIAJ9RJGiBMRX5PO7Z/o668Z9FC25T91IlF/Fs0bNE+lJca6
         GPzFLKxfhqAyxdmYs4aiAkpi7DAhtLVJBcXXPEeXbUib7jzUq8Utf162OmExaxdw2fsJ
         iKdT6MCW2517evvGHj9Hjx9Fww/taT32mH7WblZYRbNFV9ilPjMYmqA8R25XXb9fuZKB
         tH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708936387; x=1709541187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AlK1QA3IkmQoJPu/OAS6Z5gNe9NMItGQZvQvtBNbik=;
        b=FuX2sz3oZrjc0HhvtePmJfk7uLa6t2/2Da9nIQV7LHv2h4dwxpX8fssxFEbhcFWF8y
         EhuZaf6E4UnF1iria9mkQcfUjvR1whnaSE4He0N4Et7WHeN8GG9V4chAd99NnnpXtvF1
         q0RZHGQSkuAuEpA1JkLxpeb1ppPWqZmXG56ydkiiFyzv/dkxMDHA8iB0+e5bJbPuzioE
         GkIFpljeSUzybueo4whejtyHdisCTRDlnRmONXtUSxOzX8AdOEeQUpYkik/wjhF/bB3X
         z+lvNIaC302A1t2tym/FIJk+vaO4HD2fbGTfY/be4zcHJSkgm+poHaj9FPqtx6h/shRw
         6CQw==
X-Forwarded-Encrypted: i=1; AJvYcCWMrbkW0IfOcon1/9iAtq2x0bxGWttsQsx8ZghrKZOlqaL/yhjPe+L+w1NEOdLXSZjxjAvtqqi8to2tCnonDR2qtnmvGoeRKyxST1iqJ5U=
X-Gm-Message-State: AOJu0YyYMt3gW/17uRyqjWOauNmLpszlozmgSJjzsDuhh3rbp5SUyUlR
	oUlVh5vLVJtzpS6pjeYGJXWUWcFhhWNm8K6gWw1qElCfkatrMbhlBlQKAdEJWw==
X-Google-Smtp-Source: AGHT+IGsbUSL3lcsTh5mxgyZYAPlYqCNucjER0qehHR/o5ygudRx9tXvAyELpwOLdpYLH2pSq77PUQ==
X-Received: by 2002:a17:907:1707:b0:a42:f801:d664 with SMTP id le7-20020a170907170700b00a42f801d664mr3335006ejc.17.1708936387077;
        Mon, 26 Feb 2024 00:33:07 -0800 (PST)
Message-ID: <bf97563f-0354-43cc-9a3b-7e4a28afeceb@suse.com>
Date: Mon, 26 Feb 2024 09:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
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
In-Reply-To: <20240223120616.73503-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 13:06, Roger Pau Monne wrote:
> The current logic to handle the BRANCH_HARDEN option will report it as enabled
> even when build-time disabled. Fix this by only allowing the option to be set
> when support for it is built into Xen.
> 
> Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Use no_config_param().
> ---
>  xen/arch/x86/spec_ctrl.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> index 421fe3f640df..4ce8a7a0b8ef 100644
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
>  int8_t __read_mostly opt_eager_fpu = -1;
>  int8_t __read_mostly opt_l1d_flush = -1;
> -static bool __initdata opt_branch_harden = true;
> +static bool __initdata opt_branch_harden =
> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
>  
>  bool __initdata bsp_delay_spec_ctrl;
>  uint8_t __read_mostly default_xen_spec_ctrl;
> @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
>              opt_l1d_flush = val;
>          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> +        {
> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
>              opt_branch_harden = val;
> +#else
> +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
> +            rc = -EINVAL;
> +#endif
> +        }

If you use #ifdef (rather than IS_ENABLED()) here, the variable probably
shouldn't exist at all when the Kconfig option is off (albeit yet, another
#ifdef would then be needed higher up in the function). Question is - why
don't you use IS_ENABLED() here as well?

Jan

