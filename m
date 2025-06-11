Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E99AD547A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011631.1390080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJvh-00019I-1X; Wed, 11 Jun 2025 11:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011631.1390080; Wed, 11 Jun 2025 11:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJvg-00017q-V0; Wed, 11 Jun 2025 11:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1011631;
 Wed, 11 Jun 2025 11:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPJvg-00017k-A7
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:47:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e016766f-46b9-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:47:39 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2924552f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:47:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405fcdsm86149575ad.159.2025.06.11.04.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:47:38 -0700 (PDT)
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
X-Inumbo-ID: e016766f-46b9-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749642459; x=1750247259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2oPiV7xhNtRl/qBq3/r3yErZS0CncZPYNUbUMggOG5g=;
        b=e/VrpFLB6ZgvElAadp3xeTDK+uejBQF+GHOEZ8+PwPP+VtCmLFMVy6lUoU8vOMm5aR
         nlDqrfIG5wxLxEX+m43iIkSkS524bTwH62xTyCPYJSUf5mXUrzbiv6L7o0bvCqPLmnd6
         G6WtacAoclu9Frqkpp6V0M/x/34iM8/oR8xurHNfrUXlxzwDpP8lawfEKWNOq8Yitsc/
         BJXdmWJWv46D5v9ffOuQA9PG2DXL2M3Zl3q2jftAMkGKVS+uqWnLaw/UKxe5L2TvhG7O
         w5Ty1sx0MiA+P5TOycJr5+jiP7EYi1RSpCv1rnM7CJuN5PIJbUZvcwsDppRIZ7eKtrpo
         sZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642459; x=1750247259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oPiV7xhNtRl/qBq3/r3yErZS0CncZPYNUbUMggOG5g=;
        b=vCBhy9D25YUK0ltmc6CMWVtNzSbLdhq5IxxZ2pks2Ic0NDZk1bzCw4I0rKKZ2uSges
         FXhk4PQu2W0EJDFoVjvmWqLgnPXQW7VKhG3MSL7HfbQ3hhO+wU29vaKO30olwCOiQP09
         iqPjFPcuIwsl7F2a5SU2UfVT3pXmE4mYDAu+drhPGfNe9EH/ElQWrogPDOMt/rrIXpII
         XIkHWtmQXw9VjljHSyzZ+JUeX9Df/2QHT6BiftTVxxxD6+yxIH1UIpzxKj3tvVCvMmW0
         TewuF0MiW19JZTZGgotTRSmU7lKoNZG9pgne54Y8ZxWe8HrrjTjwYAFM3IVot2vSvFnz
         lURg==
X-Forwarded-Encrypted: i=1; AJvYcCUIppCdS3UZ7fVlTHrUX0ViwyQVlYPZ+xX2iVZVS4rIP+x3nkXTDq26r6TGfOdJ6ArZr2PD5+h7Dt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKBlkKohqwjSGIzk9t2/9ZbS0NDG6MxqHAAR7s9/QMxihoGFdK
	1DySQBYmMBwb50VK/URbPzbgJWSvoqGB0LcmYY2mb6KPLD45xzCfX/KPGVAzu43NdA==
X-Gm-Gg: ASbGncun8zbJm2QqrdDsIzSQuqlajtJQ9QxkHo019m2hf0fJjpjc155ucwF2p/ZGBMG
	LGMUI2TenQ4u2PwKirY6/CV1GTPcSskcEtd2zd5LQH7J/0TvdFHBwf/B2m+hQzjh+1NfPkKNQlG
	9qnAKNz5XgomQ13r2v/wwWQL32rcMfjhIVBAQNwCizv/KhVyRwwlx3y94/b9Hu9r3aOto3UK2gc
	6wUSm+eZE8DBztWm/YyJgKUXw31kQatt4gWtDmcwq1W0Uzji6nUPQd570ZdPYUuviKr/1urKpQ8
	nQ4D9zinDy9JCvrC0HqBzuPmOS6mDuhS9ugdhyGx9j4qgZgQjFhgXyacVA4QiNjv8WYjH/ZSQBu
	ntWjEOmaG0ayZegX17dWnXXUaClZMOcUPBjSwmOSZg3v5KJk=
X-Google-Smtp-Source: AGHT+IH83YBp6fqv5JecIv7cDC8jHanqvh9DHMJKokYY4hRc6xpazvNjuQaP04IA6Adm9irqsXRo4w==
X-Received: by 2002:a05:6000:2313:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a5586f4375mr2278067f8f.1.1749642458561;
        Wed, 11 Jun 2025 04:47:38 -0700 (PDT)
Message-ID: <e247fad1-af53-4fb1-9411-1b1e494d858d@suse.com>
Date: Wed, 11 Jun 2025 13:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] xen/pmstat: consolidate code into pmstat.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
> @@ -518,34 +687,3 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>  
>      return ret;
>  }
> -
> -int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32) pdc)

You can't change ...

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -588,6 +588,37 @@ out:
>      return ret;
>  }
>  
> +int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)

... types like this, without also adjusting the declaration. I'm about to
make a patch to address the resulting Misra regression.

Jan

