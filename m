Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C298B5DEE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714260.1115405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T8S-0002ZT-1u; Mon, 29 Apr 2024 15:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714260.1115405; Mon, 29 Apr 2024 15:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T8R-0002X9-Ur; Mon, 29 Apr 2024 15:41:43 +0000
Received: by outflank-mailman (input) for mailman id 714260;
 Mon, 29 Apr 2024 15:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1T8Q-0002X3-Lb
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:41:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f973fe88-063e-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:41:41 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b782405bbso25520895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:41:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b0041a9fc2a6b5sm25341286wmo.20.2024.04.29.08.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:41:40 -0700 (PDT)
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
X-Inumbo-ID: f973fe88-063e-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714405301; x=1715010101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s223/epmC7X+WUARh03qJUAlKInDt1i8v0adBZzYBRQ=;
        b=BBk+jEXNGtHXlI2VQYsP3Ybjq83ug2/oES6oY9kpII2zFv7yJt2oVLlZE9E2lkHEe/
         TMad3B1rmcE4UKLCzi5+yzAK3dF1/OEyvf9t7BANJMr89DZ+kR2poeXUbsPZiaI6cP38
         usbKVN0ZpxG7iTeZR2WVzFFaprPmSqTq3RE45Q2qKU8yGAHNwQLMK1UbN84tj5pMsQdP
         FZxxCMJDcglgslE8JRaNSkWBzTA97dU/08QQdlTdU7JTjfTCQv2Kqv7uHrI3gz0Q5bkz
         dXLxAC/GXVkYixZMhkWAP0CWOTq11zXodpZFgHkuMmLx7Z0arBhOq/JjEWXS+UBwpjzG
         hvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714405301; x=1715010101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s223/epmC7X+WUARh03qJUAlKInDt1i8v0adBZzYBRQ=;
        b=GBobWcfacL8bbM2f/J93BlOn8uQ9v8wzW6k4f0FFB65xUFTAEHdAreRheBaCcD953P
         N3tMhrw1lucxzG1M/ukQ6t3J4UHmbbjWybA3GQda9zhbdRaFggRFQFiuYNuMfoifLIAE
         ghm+HUkXVT69zcUaDPje2J8A2Sm8/FtQIC0ZXBPrk2ShLR/XQFg1Ng1KvWuLQLoGaSGM
         rjQsDWReo1W06g3QPau7Bv9DN3nVJUkpHw4qNz4GnQ+UuGhVLMGkMiOU7yNs/FP1GfBI
         fZzSLpsWEyWSBD8T5bZ8DeriUl0fQY3RJqKUz8CN/MB374LSEoFO5+INC0nsullFqj8Z
         M/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWs5OqxgGfpzn5exp1eadlRXB9eNjc461DcUIV/+M5IUHqW6WRFbDmFwm48PeLutVcIGy0QQQ/F63/c7wRIF37K29+mUB94IlY113Zyj5U=
X-Gm-Message-State: AOJu0Yx59SCgiUIl1iDIdGCimkz8zKoMP9PThyRMVJJJTuiOQiVKbbVR
	6gVKHv6EQcOKvRVXf1dI1XsFrl7iuAkDlbch85GcqsLc3jvkpMTudjM8+TjmuA==
X-Google-Smtp-Source: AGHT+IH1ao93BMXI4lhWiPZDA50BNZOUa3QuWm5sPTw2U1teFqf8+jeKHCX429phFRbllmTuKqQk4w==
X-Received: by 2002:a05:600c:468c:b0:41b:7d6f:1f24 with SMTP id p12-20020a05600c468c00b0041b7d6f1f24mr8937539wmo.21.1714405300957;
        Mon, 29 Apr 2024 08:41:40 -0700 (PDT)
Message-ID: <4811f73b-e8d0-46d9-a7a9-02277dbb7913@suse.com>
Date: Mon, 29 Apr 2024 17:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 3/7] x86/MCE: guard access to Intel/AMD-specific
 MCA MSRs
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <d187db984b9b5413d73849594985e10c2c2fdc03.1713860310.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d187db984b9b5413d73849594985e10c2c2fdc03.1713860310.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 10:52, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/cpu/mcheck/vmce.c
> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
> @@ -141,12 +141,14 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>          case X86_VENDOR_CENTAUR:
>          case X86_VENDOR_SHANGHAI:
>          case X86_VENDOR_INTEL:
> -            ret = vmce_intel_rdmsr(v, msr, val);
> +            ret = IS_ENABLED(CONFIG_INTEL) ?
> +                  vmce_intel_rdmsr(v, msr, val) : -ENODEV;
>              break;
>  
>          case X86_VENDOR_AMD:
>          case X86_VENDOR_HYGON:
> -            ret = vmce_amd_rdmsr(v, msr, val);
> +            ret = IS_ENABLED(CONFIG_AMD) ?
> +                  vmce_amd_rdmsr(v, msr, val) : -ENODEV;
>              break;

Why -ENODEV when ...

>          default:

... below here 0 is put into "ret"? And why not have the default case take
care of unsupported/unrecognized vendors uniformly?

Jan

