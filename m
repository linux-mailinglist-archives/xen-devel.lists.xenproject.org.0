Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971EB8857A3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696328.1087196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnG1Q-0007oI-3j; Thu, 21 Mar 2024 10:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696328.1087196; Thu, 21 Mar 2024 10:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnG1Q-0007lZ-0z; Thu, 21 Mar 2024 10:51:44 +0000
Received: by outflank-mailman (input) for mailman id 696328;
 Thu, 21 Mar 2024 10:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnG1O-0007lT-Dv
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:51:42 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff594960-e770-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 11:51:40 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512f892500cso952779e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:51:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a1709060c0a00b00a44899a44ddsm8449326ejf.11.2024.03.21.03.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 03:51:39 -0700 (PDT)
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
X-Inumbo-ID: ff594960-e770-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711018300; x=1711623100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3WxriO6Uu9DKi+i9uSCc9XftNbhqvLeJRBNd7zSoiQ=;
        b=H2PwDRQDys5ufpJhx0jpS+FuwtnsM22hGNqJf9jOTjYzlGaWQhMSHwlJxT8Y+kR9Yv
         AtDMRGJ2od+XZYbFS4mv3vt2JMbSsPOMAu0olQMlOUWnalKIDL5yK65lOmAY587Z+5sk
         dXp+8AEH/kZYgIpokZY2pklvFuXVPFK1L9W3cTlurOrpxOlgsO5pO15zcXSWWhdrTpZY
         oabiimJ15fBIDBwE8d6zkoXaVrZ4eVZXY/s+uveHgAgXuJqdul5DusPcf5Gq3v+vXQQK
         zqLOi2H5ZF5lu/EPcdYbg0fLzcbRy+Tx+fyYs5sNsJu86mPzKNwgmqfX3CoiGDvXU2hr
         tNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711018300; x=1711623100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3WxriO6Uu9DKi+i9uSCc9XftNbhqvLeJRBNd7zSoiQ=;
        b=mR+q5E4yF/2vS+wMS4nUDjnb+5kas7jkEWCSdeiRDRHTrEvNrOZKPuhmH0WazkbOge
         Ol4d859z7UzilKbf+DW72+qMLCX4XGhFJ1qTstveV6lbHxJqrjwEn1nUVn7SjMTNznK7
         l91VSYygAEQr2na9IMbNhBYSh5C4/0lx0JJG49J8/jIRVVmFK22P95C7SZgL6eY5ZX3d
         k8nv7pGKYLM8EG+upkuWvlmpxKVcK29pQQXm0vidEt2ds8beF5HfO76dIXWeq5TKHnu4
         pTp5zIwf5hJVNmtnfoCpI77COo+8wcoqAElRyv5W+o3nAaNdFtozQDpcNa1Gza/+LXvU
         7bcg==
X-Gm-Message-State: AOJu0Yz5h/H+AkrfaSkLVCCq+X6/pHzR6XGfaunehnLF91BWzGg3pPR1
	foeiIgIOIudkZkEZuBE/i+9twOAwe59/zezZtJ5YkaTgoOgwtWizXWoteSqI0g==
X-Google-Smtp-Source: AGHT+IHSWvoV0hKGUyBPLugS7SZ+eF7Mgt4TfisSQpQ82ky5i3H7PIz6IPWCSM3YJV1cdX05TIcg+w==
X-Received: by 2002:a19:5e1e:0:b0:513:cc18:d4c6 with SMTP id s30-20020a195e1e000000b00513cc18d4c6mr1567047lfb.41.1711018299766;
        Thu, 21 Mar 2024 03:51:39 -0700 (PDT)
Message-ID: <3cff3eaa-f05f-4a93-ac24-31975856827f@suse.com>
Date: Thu, 21 Mar 2024 11:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] VT-d: Disable IOMMU if cx16 isn't supported
Content-Language: en-US
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1711016106.git.teddy.astie@vates.tech>
 <d7f4916c3cfee5fc62b6384559b614f0a7e562f1.1711016106.git.teddy.astie@vates.tech>
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
In-Reply-To: <d7f4916c3cfee5fc62b6384559b614f0a7e562f1.1711016106.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 11:28, Teddy Astie wrote:
> No hardware has VT-d support while not having cx16 support, consider disabling IOMMU in this case to avoid potentially buggy code.

Like in patch 2 (which for whatever reason made it through quite a bit earlier),
why "consider"? Your change does disable the IOMMU in that case, you don't merely
consider doing so.

> @@ -394,8 +373,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
>      remap_rte->reserved = 0;
>      /* Indicate remap format. */
>      remap_rte->format = 1;
> -
> -    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
> +    

Please don't introduce lines with trailing blanks.

> @@ -2630,6 +2598,15 @@ static int __init cf_check vtd_setup(void)
>      int ret;
>      bool reg_inval_supported = true;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk(XENLOG_ERR VTDPREFIX
> +               "IOMMU: CPU doesn't support CMPXCHG16B, disabling\n");
> +
> +        ret = -ENOSYS;
> +        goto error;
> +    }

One thing I forgot to mention when replying to patch 2, applying here
equally: vtd_setup() isn't necessarily the first bit of IOMMU setup done.
For x2APIC enabling earlier calls out of x2apic_bsp_setup() exist, which
also need taking care of.

Jan

