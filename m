Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A19548D5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 14:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778610.1188655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sew8E-0000lp-60; Fri, 16 Aug 2024 12:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778610.1188655; Fri, 16 Aug 2024 12:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sew8E-0000j4-1s; Fri, 16 Aug 2024 12:32:38 +0000
Received: by outflank-mailman (input) for mailman id 778610;
 Fri, 16 Aug 2024 12:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sew8C-0000iy-2Y
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 12:32:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d35b12a-5bcb-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 14:32:34 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so2596122e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 05:32:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838393566fsm247319266b.104.2024.08.16.05.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 05:32:33 -0700 (PDT)
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
X-Inumbo-ID: 9d35b12a-5bcb-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723811554; x=1724416354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gphdtdL9Rqu44KfG8IipZg0tMS7RgLwEBzoRq/G1nU4=;
        b=WA8A2rfPTyjHVG5FaoKF9i1gFPTard5p6lh2ED7SRybnICTu8xdDrnUc7sCmWepJI8
         phlDaog1YwFEEVXS5sNlxqFrWOYKNBxw1KEKKcU8rVTCZiCamiPWCz9BXG8ow2/8JEfD
         HmKOG6E5BcV1RvafIj0USetSRz3R/JkZYkyNrv3ebNeXWRsSVg4hojAxQWMMJNlZBFNw
         DRNPqFgu9WrDkcBGjmziJhAUeBxiCYaBgyh6fWXWSAPoXr8+130him++gCymunIcOWJx
         JYm+xucZBgRD7mcKYKAuwcdRPDoqoopwmgQpd8SK7cMtpvqT1gE1UF8V+LOzE0CgXCB3
         yTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811554; x=1724416354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gphdtdL9Rqu44KfG8IipZg0tMS7RgLwEBzoRq/G1nU4=;
        b=Sm6YI6iOR3iVH4yOGGmc0RlqxJm//YsLPM6sQATEHnuKXgRsbyO+U5u3q1f3dbZ84n
         B/aHvFOARWIDOajHQI6q3bE/wo5VvapKnLNRpBEyZN2DTO9RUFH3QOPJwJHsxdi093gQ
         u6jfTUiN638zFZV4ol5kwq5jBCKjALYN5C24NTyoYEc1vE7eJVlsdhRLnUqf1xZ6XPKE
         Xi8iPwLIcPS9VdK0xscRk8Ybd1n5D/hYX+Mwtp0vssIK6kV/6abduCqH2nDeYEtekkcc
         2d0KHsYso9LnhwaS10Q2FqlGoutmIlF+Xo9pMfvIRGdGOqLq1TK8OcpGPGWPYMBLQQxP
         Lu+w==
X-Forwarded-Encrypted: i=1; AJvYcCWi0hQ7DeR8lKIh0iysIjkxuqF7IJb7aNAtDDjv6D5oVvexQlcaQtu9hln5bLLwxT1K4bcr+DN5jakc2ah9Urlc7ejM4pD3yc2JHvTfogw=
X-Gm-Message-State: AOJu0Yz3IoeYhvGGIOmVsE56T8LSGoiuX7nPtTT906lR8fXhscQfrR+t
	Nm25PDN/YZPjszX7JQleY/NYFLMynkCvCwo7Q4ddliOAiqsL7A11mbXwQvPybw==
X-Google-Smtp-Source: AGHT+IFYWKWs+TxFQghPuEuymzeEx+DGhtV8uTnEubGQBSKN8l+CDAPYBYlR8PfQL1Z9nevJaP8Fww==
X-Received: by 2002:a05:6512:33d5:b0:530:e228:276f with SMTP id 2adb3069b0e04-5331c6ba93dmr2026632e87.36.1723811554172;
        Fri, 16 Aug 2024 05:32:34 -0700 (PDT)
Message-ID: <253638c4-2256-4bdd-9f12-7f99e373355e@suse.com>
Date: Fri, 16 Aug 2024 14:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
 <9e3bfd3afdee65f913fe418e2f6e061c4c39aaf9.camel@gmail.com>
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
In-Reply-To: <9e3bfd3afdee65f913fe418e2f6e061c4c39aaf9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.08.2024 14:06, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
>>>   
>>> +static unsigned long sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
>>> +static unsigned long sbi_fw_id, sbi_fw_version;
>>
>> __ro_after_init for perhaps all three of them?
>>
>> Considering SBI_SPEC_VERSION_{MAJOR,MINOR}_MASK, at least the first
>> of them also doesn't need to be unsigned long, but could be unsigned
>> int?
> 
> sbi_spec_version can be really unsigned int as according to the spec
> only 32 bits are used:
> ```
>    struct sbiret sbi_get_spec_version(void);
>    Returns the current SBI specification version. This function must
>    always succeed. The minor number
>    of the SBI specification is encoded in the low 24 bits, with the
>    major number encoded in the next 7
>    bits. Bit 31 must be 0 and is reserved for future expansion.
> ```
> 
> For sbi_fw_id, sbi_fw_version it is not mentioned the same thing, so we
> can just assume ( despite of the fact that now this values are very
> small and it is unlikely to be bigger the UINT_MAX ) that it will be
> always fit in uint32_t.
> 
> But I think it would be better to leave unsigned long for everyone as
> according to the specification this functions returns sbiret structure
> which consist of 2 longs ( error and value ) and it is good idea to
> follow the specification.

Okay with me (for these two) then.

Jan

