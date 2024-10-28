Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF79B31A5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826548.1240832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Pn2-0001za-U7; Mon, 28 Oct 2024 13:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826548.1240832; Mon, 28 Oct 2024 13:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Pn2-0001xJ-Qb; Mon, 28 Oct 2024 13:28:12 +0000
Received: by outflank-mailman (input) for mailman id 826548;
 Mon, 28 Oct 2024 13:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Pn1-0001xD-F0
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:28:11 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 799a5fc2-9530-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 14:28:10 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso44071065e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431935a4b40sm109831045e9.24.2024.10.28.06.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:28:09 -0700 (PDT)
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
X-Inumbo-ID: 799a5fc2-9530-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730122090; x=1730726890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7HBNqbFF9X8mKCO5Z8knz09Y7B6QAme8icCEIxi+Cg=;
        b=IQ8aQBxm0gTtlIIKt+awzJhlEikfKxlhKoIqZmWQrdIHWhhZyxc+JN2hgB158qYHOR
         O036FZD2poOYtQRSKFenzFaiK8Xom8z3gDKUAq8hpMVU9cUR73IqzqYvhwm2YpcfaG9R
         52nnSZg1OHc/FLLFNcYW+q/YuA6aY5WMie/tjrftWfMiX/S05vr+qWEvD+2StOM0ZgVL
         YksdNpZol17F040zqg3t50VVJoU3vuSOBLYtzlzChC0Q2bmB77wMWl6/E2b6T7susmO4
         r0CQDhCaIElZSqrtaEGZh+MzszbfjU0hDI/+26zF0W/bVmKTDQF/X1v0S5kvp4gV8JDu
         rHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122090; x=1730726890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7HBNqbFF9X8mKCO5Z8knz09Y7B6QAme8icCEIxi+Cg=;
        b=Zz2BEdgAWXBpQmhwoxYSUVQ1z1V84bSWk33FqidLpAJ5pIhP8AB4DoRGHUzVof1S5C
         kIGpI22/muBF6Sa4NMH9ZbGMGnRph2+rkdFivuFXUGEXs0Ui7sBnbos2Gfy0Wa5ZHwF+
         mXTNzhHArLSx/+WQ5kZLFi4xSHNADa60JHAD3fDfm+DOcS+oiAeX6uU3lQWvOKjxc2/A
         ca/cMCsfzDuLP85oaHmfgJjeuNkf1rQo+oh/1yAzJC+HSHOBBsIF/IiwFMJeX7Uo9CgO
         tuv7vxowfFwSa7fyFAlmbCVn6wR9SF/YeEDjdQGZcZEWji8QoxBEXhv63kIc5C+Fy9G/
         tJtA==
X-Forwarded-Encrypted: i=1; AJvYcCXw5pxfvxxiEscC07oG+GT7zseHbplO+GyyZOWAUV1FM+xXHPQ+wMXAX5hotBd67FL2OKdtRaWGLGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwayK7MPR3pg6aeXz3YRmI1ttjgmdDe7kCaXd+Ye+f5ke2Gdev
	brAUDbR8/Mn3IQyWuawphFjiQLMOEwawRO8uBNgxaJJcVanyTG57ehlEijBW2Q==
X-Google-Smtp-Source: AGHT+IFdsIXLQ0MfdPRABp0cJYVFbU6Re2xzor7kTLYCC6dH4d+rOVvCS6AsmyEhdhgx3qVrmhd1RA==
X-Received: by 2002:a05:600c:3b86:b0:431:9397:9ace with SMTP id 5b1f17b1804b1-4319ac95708mr74379895e9.10.1730122089783;
        Mon, 28 Oct 2024 06:28:09 -0700 (PDT)
Message-ID: <35e4edff-c370-4cef-8693-4d5cac86ab0f@suse.com>
Date: Mon, 28 Oct 2024 14:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] x86/ucode: Turn microcode_init_cache() into a
 presmp_initcall
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> There's no need for microcode_init_cache() to be called exactly where it is in
> __start_xen().  All that matters is it must be after xmalloc() is available
> and before APs start up.
> 
> As a consequence, microcode_init_cache() runs a little later on boot now.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -819,8 +819,9 @@ static int __init early_update_cache(const void *data, size_t len)
>      return rc;
>  }
>  
> -int __init microcode_init_cache(struct boot_info *bi)
> +static int __init cf_check microcode_init_cache(void)
>  {
> +    struct boot_info *bi = &xen_boot_info;

I take it that this not becoming pointer-to-const is related to your reply to
Roger elsewhere, where he asked for adding const, while you expect the const
to need dropping again in the course of Daniel's work?

Jan

