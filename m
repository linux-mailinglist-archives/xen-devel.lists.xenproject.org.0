Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA54997F39
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815736.1229845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syoMj-0006gP-R8; Thu, 10 Oct 2024 08:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815736.1229845; Thu, 10 Oct 2024 08:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syoMj-0006el-OB; Thu, 10 Oct 2024 08:17:45 +0000
Received: by outflank-mailman (input) for mailman id 815736;
 Thu, 10 Oct 2024 08:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syoMj-0006ef-2T
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:17:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201433a4-86e0-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 10:17:44 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1200625a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:17:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9370d2246sm444803a12.5.2024.10.10.01.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 01:17:43 -0700 (PDT)
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
X-Inumbo-ID: 201433a4-86e0-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728548264; x=1729153064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KfFjRIz1Yuvbl5Bt9vW8i6ZynIZV+mEcMmGM4N6/pLw=;
        b=SgEFvB1fXvqcD2iOJ6do/zP2xgBltlyVayKdgZdO3aXhEtlKE8wHrr1B6IciBPXbsW
         aoKpIOPuRdXZvvZr1SoeTHEDEwrwNrmjny2h69Rh2DFHYGT33zyZ5lccS/IBoJPqAHmh
         CH3bw9z1pjJehGQ7KSG9m47mC+cq3EXgmxChkzmI/1PW2A8XBtDe3ZKo696y1C/ji07i
         o4t+qlC1RlSmAV6kwbciziT9KEuoLzc0zlIddvZ8hHZG6ZblxotAWbKgc9M9lnfqQTyz
         C5oq4Juh4N/Iuch1k7eejoJQCYVQzy2nUUofKUSE1Va44w6bsw8MppLwVXY0F02SJdHL
         Yitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728548264; x=1729153064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfFjRIz1Yuvbl5Bt9vW8i6ZynIZV+mEcMmGM4N6/pLw=;
        b=hl3A4WmvL+bI997svSm3FTgP4eQOcvefWRK1g7xQoRT6kZjx+vflBqS90Lhjd8FS/e
         6czViYVDRdA5isCnvts6DIeqQyQTlC7ndF50XnT/sVj3n3DbDrS5m5iDOO4Q9+ozDqif
         fFH6eCjZHWuzqe2kfVp3k3Ow9p10uwfFWvyHYrS3mYRphEAZqoVU8NwAWqKby5fmcpBD
         GhNLS4HJkUqWYHlJmko4cl0bGqtPskuSvRH0Jm3yQtgg4JEozuUbFLmMkmqoB6jSVOuX
         AKDmWASWG8A5xSESGFcajx2LLb0QQ9ijh2wKZGlFh7DHIVCMfzE5vyai8vt+gtWQ+/Is
         W0LQ==
X-Gm-Message-State: AOJu0Yw9tXncaKYjrW66zvm0V14o2ZvkQNRCcyzHM0cV6TbVMQnU8MAY
	D5/miOBaoxszZ0TmV92NQPv/vlluhI4GQ15QgOLXj3Vf7QkolKqhit2ySUEd7g==
X-Google-Smtp-Source: AGHT+IHprO0InyX/z4iovA+Lj3INMCpc+yLlH2kBdOBRCfmgQoAsPTgYOxOtRdSXf2H/ilh4hM8nqw==
X-Received: by 2002:a05:6402:1ecb:b0:5c8:78dd:8027 with SMTP id 4fb4d7f45d1cf-5c933554318mr2072193a12.12.1728548263527;
        Thu, 10 Oct 2024 01:17:43 -0700 (PDT)
Message-ID: <e6d4912a-d6d0-41f8-a3e6-fe3eec6c6807@suse.com>
Date: Thu, 10 Oct 2024 10:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Remove dependency between pciback and privcmd
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241010075848.1002891-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2024 09:58, Jiqian Chen wrote:
> --- a/drivers/xen/acpi.c
> +++ b/drivers/xen/acpi.c
> @@ -125,3 +125,20 @@ int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_info);
> +
> +get_gsi_from_sbdf_t get_gsi_from_sbdf = NULL;
> +
> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func)
> +{
> +	get_gsi_from_sbdf = func;
> +}
> +EXPORT_SYMBOL_GPL(xen_acpi_register_get_gsi_func);
> +
> +int xen_acpi_get_gsi_from_sbdf(u32 sbdf)
> +{
> +	if (get_gsi_from_sbdf)
> +		return get_gsi_from_sbdf(sbdf);
> +
> +	return -EINVAL;

Perhaps better -EOPNOTSUPP?

> +}
> +EXPORT_SYMBOL_GPL(xen_acpi_get_gsi_from_sbdf);
> \ No newline at end of file

Can you please take care of this as well while touching the file? Or
maybe you are doing so, but the diff doesn't show it properly?

> @@ -484,6 +483,7 @@ static int pcistub_init_device(struct pcistub_device *psdev)
>  		if (err)
>  			goto config_release;
>  		psdev->gsi = gsi;
> +		xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
>  	}
>  #endif

Why here rather than directly in xen_pcibk_init()? And why no change to
xen_pcibk_cleanup() to remove the hook again on unload? Which will then
raise the question of possible race conditions.

Jan

