Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A1CC3A9BE
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 12:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156811.1485796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyHe-0000iA-AJ; Thu, 06 Nov 2025 11:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156811.1485796; Thu, 06 Nov 2025 11:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGyHe-0000fM-6b; Thu, 06 Nov 2025 11:36:06 +0000
Received: by outflank-mailman (input) for mailman id 1156811;
 Thu, 06 Nov 2025 11:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGyHc-0000ei-IT
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 11:36:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2600a71-bb04-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 12:35:56 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b719ca8cb8dso179155466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 03:35:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937d305sm198005766b.24.2025.11.06.03.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 03:35:55 -0800 (PST)
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
X-Inumbo-ID: c2600a71-bb04-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762428956; x=1763033756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=26CQNjsr1hLzCIO63Cz9PrrOZQd1ql3hb2hWGWjj6co=;
        b=EVLT3rfNt4qeszwYLSRMKAhNDqVAb3/NYlQYESMENyt0HtGC8TMFZAE9nEXh4hbtK2
         gCMiAzaCUjJjbKXPRNhA92xWKKF3elLxEoRfcZpTkUmOdU+Soc1FK+uIfauronH+aohQ
         Ji7hno/9sFXt3FHczNsOGh7gAguooOOCdmCXmMRQzX478II2LXJcwmc1nZKjNfF3k1dT
         7yDnvMn8HBehLsmR8/r3dHJVqqdPZzLgPCshfLtR1zMdq0qFP61bKJExvFeI89/KYUIJ
         BucExKff2aFqFz6fUMi1EnpHGlCcJQDlTQ6910YtHSjxWtn4CKV5Zmlkkhpsu1EG+yhc
         wdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428956; x=1763033756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26CQNjsr1hLzCIO63Cz9PrrOZQd1ql3hb2hWGWjj6co=;
        b=La188I2Tly3Pjo8nRTQ4rE7cF3OZW+aZKRjP3+CXvutPfTj2XkIBbMj6b+NJAuRhzZ
         U0zFpfqhZ4z0Go8nHvzm5YA8ekAtR6xflekkCiTrqmTqd59JyOuMvMry9ntjIth70kCD
         Yg9PsoHzToWGCPeV3mslBiqNlBrFy79fGC5PVsSCyE5OHVtF4+hoMoDbhLRjhsk0EIK7
         toZ1FfzlPy1Jl03Wr/zf4Apc/pbxcN7r068x9wTdKHwX6auKwM0y1MNGnxU8o67+AtA3
         wOkv8INVvrV0UCS2M6yJH2zAoP5GwIeE/XF7w1RtsxAkxrBO0Ow2HhTb/RH7DBKWcUtC
         NPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8HZjVGOQZ4w8USAGKU4p0m2gY7IKpdbBEf7qY8sqgo62oP1Qpi3lHuKzrAQQMFQWs09jHj+YG7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLpWScIGdJrbWiUr+a7z3f8ZtlmNprrpLu7LsA1DY/jNRIAOs/
	5dXu/Itj1e21ai2eJwVsmbQZjRHPXBGqlda+rRbb5H+s5PsHehM/Z2cWdqLn18Owvg==
X-Gm-Gg: ASbGncvUfbi6x80MCxGP2d/+NZC3aaorZFr/ljJYpNu0QZX9fLc6u21Besl1jhg0sJ/
	8C2u4Nps9H4rcmffrWtaOTuIemUnb6fvxcw+Kni86kJmCWFSC3kh6p7yUOp85SX/GPmLy3fwmsY
	aJ4wPiyPJrryOErdB2Wr505DsXpHD0gyhZo0Y1sx+4KDbO4sXWuel9X9QGv9KqqOvAb62jr28fw
	s6e6LYyLRzz75ziysEUTK+QJmTFa26WEyJTzFwUQdKKvbKh4YzEkC8SqRBQf3aAMHzv7Qe7VJyR
	ckmA9J9e2lddcrnwogCqK3DXcfRwWgRf+xIvYuHlORqzRxxubPvJx5F+izUtXZ10GVI/movq69H
	zXJ1NY4eBcdCJPowN/umka69Nfasd7qlOkfuJSUBWA0mqrQRwHSYLF0ogo7VFNENmPpxD8Bn8TW
	rMVb69jrYCEn3hSgDMGDJ5kl7SGNpYM/d7fp2ia9BBo8iuT7TDntlQp6OAjnd7
X-Google-Smtp-Source: AGHT+IGmuSyOm+ppv1cGSso+CB8aBeWNnLEewZn1+/PmiK33b0/7rYEShYhnhcfoFfKaIyUtOFpzhg==
X-Received: by 2002:a17:906:d553:b0:b72:52c2:b8ca with SMTP id a640c23a62f3a-b726568767cmr696173866b.59.1762428955760;
        Thu, 06 Nov 2025 03:35:55 -0800 (PST)
Message-ID: <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
Date: Thu, 6 Nov 2025 12:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251031161716.1222956-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 17:17, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -1,6 +1,6 @@
>  obj-$(CONFIG_AMD_SVM) += svm/
>  obj-$(CONFIG_INTEL_VMX) += vmx/
> -obj-y += viridian/
> +obj-$(CONFIG_VIRIDIAN) += viridian/

With this, what is the point of the additions to viridian_load_{domain,vcpu}_ctxt()?
You're adding dead code there, aren't you?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              rc = -EINVAL;
>          break;
>      case HVM_PARAM_VIRIDIAN:
> -        if ( (value & ~HVMPV_feature_mask) ||
> -             !(value & HVMPV_base_freq) )
> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
> +            rc = -ENODEV;
> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>              rc = -EINVAL;

I find the check for value to be (non-)zero a little dubious here: If any caller
passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
in that case as well. Things would be different if 0 was a valid value to pass in.

Jan

