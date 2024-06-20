Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31848910016
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744313.1151333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDtN-0003po-5I; Thu, 20 Jun 2024 09:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744313.1151333; Thu, 20 Jun 2024 09:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDtN-0003nF-1P; Thu, 20 Jun 2024 09:15:41 +0000
Received: by outflank-mailman (input) for mailman id 744313;
 Thu, 20 Jun 2024 09:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKDtL-0003n8-Q8
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:15:39 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d877d6-2ee5-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 11:15:38 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso7758291fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:15:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e70efdsm132891975ad.89.2024.06.20.02.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 02:15:37 -0700 (PDT)
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
X-Inumbo-ID: a8d877d6-2ee5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718874938; x=1719479738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ecg+8Do6KBVsgEIgZxE1KcnUiQXqJiCZhnqnv1stNf0=;
        b=eaWz1UTqOW59e9kyvyFZ5r+ExlUZ7gogr1g4KtoXcZNNspsG8PQutN4sNQHcxJt7YW
         mt9i+21LzZxt0CfhoCniAQAvKa6mr1UpkumGpXDAV0W3b6x/TRfDN9NmdBeYU5uLC9SF
         JUmwX2FI52LEwI1J5LEqz4XvyKUEhgqz6WGkX4pV/9wTdzaypeLdV9u6yTH2OStb9WZO
         Lj+Pr7bd6vUspXzqM+sil7Wn9rKIyfXogewe+ulTx7Eda0FZnlZ1wv9OML/mww3sJIHx
         s9c6/vVb7hPOeSxIbQFyPXfNNXaoLLTOOzBUbHuDaf1d/bHu2yE45e9SC2+TKGgmbvnS
         nu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874938; x=1719479738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecg+8Do6KBVsgEIgZxE1KcnUiQXqJiCZhnqnv1stNf0=;
        b=bHazm15b0Z5sf2yRM7gCJ72tu+m03RBaxNVnbw8vKS8vbiszHYAFaXInyZKZALYGzf
         LmB4VNpwrgYJBP8sPynLeKDJ1Eu9+3fNiBsAYKnMAOIYItjxXbSTnTnLR8yFY7Vi+Rj/
         XIrw9ZtcY+H4ybnjxbhn8+KlmMtHMilVZQWJRrXnCFDw1tgsDzURdx88dYHJsq2zNQL3
         pTjjhcKGguihmP6Y3qUNMKj6ZpUGEe5n4cPWrLHRKCeShdTZjHwqsasPvNp89+UG2YKd
         C0jzmZUFluU7KMjac3WOdsnkeoJsUt40EQ37b1meKX1h47GaJeqU7joS/KGsxYhZt/CA
         Go0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX77Vxu8MSR8V9P4xHlKJc6dD0j0zliQZ3ZO8wUDxoVqgckM1OXtxa5+bFD2HX52Xl1KVrbULKRWjWRMO6n8WSiGNeh19m9wtgkqe0c2Ro=
X-Gm-Message-State: AOJu0YxSOirohcEgozd9o9rSaFIHauORfm02d5fUU9QiOAaqYFLlCqbJ
	ygtxnXPcE9No0Cu2IhKChZql3GbLNhLyBPePOJ7qFKsM+xoXv/LpvBy2Qu26tA==
X-Google-Smtp-Source: AGHT+IEZZTqA4XN1zfyUOX/h0sovw2/SA8OqqPUndSyq639G4VrMUMJKqqMZXb60u3WmG/NROm3muQ==
X-Received: by 2002:a2e:9e16:0:b0:2ea:e74c:40a2 with SMTP id 38308e7fff4ca-2ec3cec1131mr35950061fa.20.1718874938455;
        Thu, 20 Jun 2024 02:15:38 -0700 (PDT)
Message-ID: <4189674e-af5e-4ffd-9558-bf0f1bc3338d@suse.com>
Date: Thu, 20 Jun 2024 11:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/APIC: address violation of MISRA C Rule 21.2
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
 <4a31cfc5e8d4e2c5e159ca4d67ac477feb000073.1718816397.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <4a31cfc5e8d4e2c5e159ca4d67ac477feb000073.1718816397.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 19:09, Alessandro Zucchelli wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The rule disallows the usage of an identifier reserved by the C standard.
> All identfiers starting with '__' are reserved for any use, so the label
> can be renamed in order to avoid the violation.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

While the code change is certainly okay (with a cosmetic remark below),
you sending a change Nicola made requires, aiui, you own S-o-b as well.

> @@ -941,7 +941,7 @@ void __init init_apic_mappings(void)
>      apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
>                  apic_phys);
>  
> -__next:
> +next:

While touching this (or any) label, can you please also make sure that
from now on it respects this section of ./CODING_STYLE (part of the
section "Indentation")?

"Due to the behavior of GNU diffutils "diff -p", labels should be
 indented by at least one blank.  Non-case labels inside switch() bodies
 are preferred to be indented the same as the block's case labels."

Jan

