Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EF8D5AA4
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 08:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733286.1139432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvyZ-00008z-5U; Fri, 31 May 2024 06:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733286.1139432; Fri, 31 May 2024 06:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvyZ-00007I-2E; Fri, 31 May 2024 06:42:55 +0000
Received: by outflank-mailman (input) for mailman id 733286;
 Fri, 31 May 2024 06:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCvyX-00007C-U7
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 06:42:53 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01388ec3-1f19-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 08:42:52 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso678039a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 23:42:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e73fab00sm53348066b.67.2024.05.30.23.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 23:42:51 -0700 (PDT)
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
X-Inumbo-ID: 01388ec3-1f19-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717137772; x=1717742572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FxhN/r2VrG94jWLE0WWGU0xxbhVXur51NZsN++2qHdw=;
        b=RK4HEm9oXqh6oXfeRAQbpDIIO95i97AYWJA/TobLGBj6hiO8T4LcYxeIGoM5Zs/ME6
         9sz/hqMX0/AN57a8OU7XZW6IqrQmlUqDfZZdBONsEhjW8JTK+N4uwOf877s03UmXSMDj
         Rr8Gr2lr0SVRR0LAfpJX90ZYG6+RNzJoezY5VdDn840wWmGI/YJ5LmEnkvgG3AIVYqOP
         7ZsoIcp9BuxA8a+rG1X/43702X9dxId8lkgjLCcsfr+LVkWZaApY79F0MwQnWEI7OXZn
         h3quQLPJdZXghvssGG5tOI8vSyNzH8LIDOoS11EGl3a3BOURfLGC5dXRMZCXt2Fjoo0x
         IGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717137772; x=1717742572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxhN/r2VrG94jWLE0WWGU0xxbhVXur51NZsN++2qHdw=;
        b=wuTWyR4seZBT/35+Tg9r39EePiR77X4cCF54joNXL8JyzQTH2yZtrDvYy4qTMhwC/5
         34xkzM3PevIlDbXiE8S3s3p/KS/CqYyARFPif1nOfIn7vIKCsyMlTIbxWD78L/ir4DAw
         oAWEqo5Ap0ApRYQT+0b4NiePbPQs1JceNnVwSoVCVzbsJZxd8u/sV/oWUBIhlizKKR57
         gHjDSHzOoG1aMr5Ju3ry5uuDeM7PsMgQpoA7PtkQnP68oEmY2gzSaIbqPlYOToz41XXp
         8sWQqgBKdACMm0lT044dgb60cpGkUJmy1u2Fi3Yqq1DIrHnYBsrY3pytH5T5M/axjRiZ
         8DYw==
X-Forwarded-Encrypted: i=1; AJvYcCWA64+b7HZLNRb5OUzfTE0gUUJXGqLlcYw0xWn/+gDrgqWEtXfBtT90A6Ib1qFyxcdDaQktpgaR/QxDJExxtFC6AWICWvSyYfMjh7/NPos=
X-Gm-Message-State: AOJu0YxI+xxZU9rsOZsC4X5IqfTET+HVMOykpSFQK213dsF5UFsTWKWv
	saiCL1Mif6P8tC7/oys0zLgqM5ZfHt8dd2LlXJp33wZBdtwhx3KKtmLJJaavLA==
X-Google-Smtp-Source: AGHT+IEjokOS0mtq2igit/GyX2pqTJ7AdmL/cF7zNw3hk3ZEkK35GX0M9dzMb8LkDUVqC5MRHNXaYw==
X-Received: by 2002:a17:906:1718:b0:a5a:f16:32b1 with SMTP id a640c23a62f3a-a68205179d0mr58711966b.31.1717137772230;
        Thu, 30 May 2024 23:42:52 -0700 (PDT)
Message-ID: <e5741eb1-1708-463f-8b3a-2d34d6fd4fbc@suse.com>
Date: Fri, 31 May 2024 08:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
 <20240530184027.44609-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240530184027.44609-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 20:40, Andrew Cooper wrote:
> Any non-stub implementation of these is going to have to do something here.

For whatever definition of "something", seeing ...

> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -31,12 +31,12 @@ struct irq_guest
>      unsigned int virq;
>  };
>  
> -static void ack_none(struct irq_desc *irq)
> +void irq_ack_none(struct irq_desc *irq)
>  {
>      printk("unexpected IRQ trap at irq %02x\n", irq->irq);
>  }

... this, which - perhaps apart from the word "trap" - is entirely Arm-
independent, and could hence quite well live in a common code fallback
implementation. Nevertheless with patch 2 clearly being an improvement,
both patches:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

