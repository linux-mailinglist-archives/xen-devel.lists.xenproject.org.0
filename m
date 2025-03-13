Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D88A5EE53
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911518.1317924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseDh-0004h5-H7; Thu, 13 Mar 2025 08:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911518.1317924; Thu, 13 Mar 2025 08:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseDh-0004f4-E9; Thu, 13 Mar 2025 08:47:13 +0000
Received: by outflank-mailman (input) for mailman id 911518;
 Thu, 13 Mar 2025 08:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseDf-0004er-TB
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:47:11 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0cd1727-ffe7-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:47:11 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39130ee05b0so642403f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:47:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c23ffsm1347978f8f.22.2025.03.13.01.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:47:09 -0700 (PDT)
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
X-Inumbo-ID: c0cd1727-ffe7-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741855630; x=1742460430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AU6rvHXcByakeqgbVAphxHBTNtMFlDzafzFqARxMJ6U=;
        b=c4s+0z+a7A5vHUIYF5GJMPClBV0ZzMR9DuylLzBmHyNM+IMV3GEUaChMoqUXQmX2XA
         vjkZ8tM6NjGzlsMI8zyPOV9CZXhFY6b9+gigsGS69k2jHczDMHYT8CXYuxa0nY0E9fCm
         aiXK4rAIT8G9wZyNXIKMgOAHv4rqd0C3wTWKTzCjZHkuYGGwPNvGBSYAdpJDYQsSKQ3Q
         fiXWLSt40wbmtjiM40pNpVokIasW5sxr34OK+aMqHQ37DIylrYNeP7CYd44othKJnLby
         QbyylSGRPcomcZWfWf8szaGHu1w65Cm+Y7P6Dxxv9AxOkGpRyfZOcNddwGq9NuLnEzbr
         87ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855630; x=1742460430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU6rvHXcByakeqgbVAphxHBTNtMFlDzafzFqARxMJ6U=;
        b=Sv3ooKlnPkq3XZ8CPCJSP2pL4M6m/dDyoOeeKcV3357gnPKR8deBQS2xgQQvxRX/KR
         YajAF19MVQbNWAqe8abI0+gBvtg2a3idqlp6TXwySnfZx5YaLieNorcMxjunPSHTVkxk
         K1NivbzjBycRm0lGMyPbAzFyKgcd+XGh8nPtIJzu8Eh6FFAJaKzet679Fb0Fizd/YnL/
         RU8W10MYEjqPmdn/a+M/rF/pbZgPVBKIDsXLKdm2negzFPsOUMeIow+zLZgwExvcQUH+
         +lmvkaZOsusXRt4EHhWukUcgpqlNTHU75mJLODdJCyszd0xvlA01W8dN9U7zL7nHpvKH
         eY4g==
X-Forwarded-Encrypted: i=1; AJvYcCX+jQ9P07La5jtRY+EHLQyOgx5uSs0M61gJMxVFxYlUjggh+WeGyUb3z3CM0NQnbr78ljnD5YKCEHI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS75G1pqmsZpPwIhp8uu/N+1fe4rYIebKI4F6uyaC/71PyKE8+
	eTp9kLcWrPlvPb0fvb4ngSljPsErnuhk165Xh6pmoW//Uni/+Uewr089QUMRag==
X-Gm-Gg: ASbGncuH0dIVWjpIHLsO1CO/iVPeZ7/zANhLsmFYlHW4LJd4jbd8pp9siVIsjFIuC1v
	jKyzhaWH42zkP+fxogRIM/VohdnB2kCCaKPpanZsQHls/vAPxp8u8twL6Hz+aQusQSjTSmiVxWo
	UaCkyP0/O+VzPyyJBnQTV8JyW3NC/1hVeGpFie9rjj5SV5u1Ykd2V2uGx21EdXb+6/vxR1tbMdA
	8qNNO6iU2yBplrtvmnJW9u+wO/uSP7oSYq2/PAZyUcWAVhooZXF0VPqSBobAW2Pufs70eB6RGDR
	uTuDBCLS6Q856lEYhkJXBL/wXA+pgVaWw8Ar2Q46N8bV3nvOpwOApHaXZQY7Jz1hJ5bAVGMgG3F
	LrSm1jAoA388DH055rUxoSKg8NgWQlA==
X-Google-Smtp-Source: AGHT+IE4wdZ1QKcfwcbVGBWlpmNprZaPKQE4+zB7oY/adxObpkOKBZVGxdan8/7EWI/eggIUUZ+Yvw==
X-Received: by 2002:adf:c043:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39141c97c72mr11826393f8f.51.1741855630471;
        Thu, 13 Mar 2025 01:47:10 -0700 (PDT)
Message-ID: <d753f031-a630-4b13-a0a4-87f319641e9b@suse.com>
Date: Thu, 13 Mar 2025 09:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/19] xen/sysctl: wrap around
 XEN_SYSCTL_page_offline_op
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> @@ -601,10 +603,17 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
>      return alternative_call(xsm_ops.resource_setup_misc);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
>  {
>      return alternative_call(xsm_ops.page_offline, cmd);
>  }
> +#else
> +static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

As before: Less redundancy would result by placing the #ifdef inside the
function body.

Jan


