Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134EAB8368
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985123.1371058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVLJ-0004Pf-Q9; Thu, 15 May 2025 09:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985123.1371058; Thu, 15 May 2025 09:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVLJ-0004NY-Nb; Thu, 15 May 2025 09:57:33 +0000
Received: by outflank-mailman (input) for mailman id 985123;
 Thu, 15 May 2025 09:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFVLI-0004NG-22
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:57:32 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03d9e706-3173-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:57:30 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso107636266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:57:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad236cb21a2sm899774066b.159.2025.05.15.02.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:57:29 -0700 (PDT)
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
X-Inumbo-ID: 03d9e706-3173-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747303050; x=1747907850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XPNXpks1FLUZUm/Ssr6yCnVSVUh8hwwVt+UGkvE7YzU=;
        b=Ms1x13u8GW4/E3b5fbFneIH4Qpm226SBglGjaOmRX+wCrDLNB+siYP+vAKkd9ODMoz
         JQqtNp6xLhQIYPgkdlJ6J9hyTZ6rTCTRWkjs1juL5gEznmuofRCVpwGMc7v0yGBd+tDo
         +pj6iE+zVdJl528R9BoMqjtp2CjyD7nuZZWXlvvMy0ci66v01pzGqJrQpERjC5cgtOy6
         M/qH09IgD87Sse0Y02LcpS0VapY5QwxLGuXhgAavIUcpUVRGwGkq0ZWX05MXAlY82/84
         WkfLfBd4maBMQV/e4/jBpXbVpsuM7kApfYz2WNuYXHmyGBS/pWpW9yomITF3XDrA6/sp
         llPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747303050; x=1747907850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPNXpks1FLUZUm/Ssr6yCnVSVUh8hwwVt+UGkvE7YzU=;
        b=H0/Mcg+y1KFT6U5957oXRC9RTFx9PUS6donfyFZ1h4k35nN964uFYaNVUGTxsF9T0O
         VG6hVViooZwXwCLlbqAKeX6Ihq3IEvsPYaNFsGOs6GIbJyRUctMwxsFFew+D3/OZxBO+
         i0I+9ehhTILUEd8kQnXekFGrnDTmOkDl3RpkpJZLPUtJcKtLv6oUa1quq0aaWEkpu0XM
         KcgNGL3vIZi9Fj1q4cp+oyNX3STgmqcSOM0o+fGy51+vaZVLkRE6Bbynl3uOHSYzkUdR
         W1zGu9dvLAkorrLNixO7N6SWdb9oLmciaaXgyMhsPXCIAkMttmdKwq6M+u077uxpr/FE
         brZA==
X-Forwarded-Encrypted: i=1; AJvYcCVcBaTnE78EIGeRz9REGmHcFpqdWW9v7Gq0Zfyz4iti3glOjLPiUpqogiMMBEaj+4vxycTPciz9RSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK+7w0Oljh1GhnaA/SxtiVxuFbkmsr4OKC6cNwXLdHgCGrJoEA
	YNqiXw46xgCqW4e9hL86EIQINu+ftN60SR65vkh4esy0o5BTv7GKBYxgiUmpyA==
X-Gm-Gg: ASbGncuCAN26CawMRcICRGVgotcobqGgQEgHrjG4D6qeh7lZjvosm8qUVLBxvmCRimZ
	OVqDBJiArJsnNqaHoO2TXjyz9F2EUSB4/9ZsEbWJgTqFiCSd1ZqbNcO9u9SgzNC2BbHwANFv57x
	NS4p20phD5kcQT9xf6TlLxOAbLk9iRef+as90dKc/FLXJuUqJ8cL7p6zsVRttOAxuTSHnwmYw8z
	XCWxaqsSTjZBFLLwO1N2QCfCXqLo8n02C+/s+Q6liajq5SxKdahL5EROgdnY/FdE9PBpPzSBaV/
	L7Kk3POPqqwytizNlTYkUyizEP9gIcKZC4Q2VqGA20z7865j3l0FoCJc9eXytyptbGHnEdDsRrB
	P01mM4Aor9p1sSaNMuWZ6MbWb9tl3Ldz1KkG1
X-Google-Smtp-Source: AGHT+IFggB8uGPpAMLv+GkVnXYg7zYm2kaiTFhvZE5yo92vueMt5Z2JY2Mj6qwUaxb7mzsxfxNo6Cg==
X-Received: by 2002:a17:907:d106:b0:ad2:39f2:3aa1 with SMTP id a640c23a62f3a-ad4f72924e3mr686147866b.44.1747303049978;
        Thu, 15 May 2025 02:57:29 -0700 (PDT)
Message-ID: <5f8a2840-2080-4b04-8298-0f5e22eaf5c0@suse.com>
Date: Thu, 15 May 2025 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] xen/riscv: implement setup_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <6f17bbf0eb6240d7389d389f0973af6fda5cce29.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6f17bbf0eb6240d7389d389f0973af6fda5cce29.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> @@ -58,6 +59,89 @@ int platform_get_irq(const struct dt_device_node *device, int index)
>      return dt_irq.irq;
>  }
>  
> +static int _setup_irq(struct irq_desc *desc, unsigned int irqflags,
> +                      struct irqaction *new)
> +{
> +    bool shared = irqflags & IRQF_SHARED;
> +
> +    ASSERT(new != NULL);
> +
> +    /*
> +     * Sanity checks:
> +     *  - if the IRQ is marked as shared
> +     *  - dev_id is not NULL when IRQF_SHARED is set
> +     */
> +    if ( desc->action != NULL && (!(desc->status & IRQF_SHARED) || !shared) )
> +        return -EINVAL;
> +    if ( shared && new->dev_id == NULL )
> +        return -EINVAL;
> +
> +    if ( shared )
> +        desc->status |= IRQF_SHARED;
> +
> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    new->next = desc->action;
> +#endif

Didn't you indicate you'd drop this?

Jan

