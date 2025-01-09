Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B982EA0715D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867919.1279456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVolW-0005xt-0F; Thu, 09 Jan 2025 09:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867919.1279456; Thu, 09 Jan 2025 09:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVolV-0005wQ-TK; Thu, 09 Jan 2025 09:23:45 +0000
Received: by outflank-mailman (input) for mailman id 867919;
 Thu, 09 Jan 2025 09:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVolU-0005wK-Rl
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:23:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bc532ab-ce6b-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 10:23:43 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso5329855e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:23:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddd113sm49604675e9.25.2025.01.09.01.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 01:23:42 -0800 (PST)
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
X-Inumbo-ID: 6bc532ab-ce6b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736414623; x=1737019423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2viDDTUr2f5ynhC6H7ht9PYN7Rsdi7Q9mOfRDowWPhg=;
        b=JwQWC/2Gxi16xHZokZMiP01bhudEnj2BRlXozrjANqx72NhZeI7O3Ifflt3b+8MMCM
         NB12i5l1rKcRxy5xf4wbEBPKJXiODHVrZO0NhvKMNQkRT7sFRWKbVOG+oKBtmxRnXv55
         nIz8M3qxO1x5e7zsW3K6n07pd3GkYs6Ru1yGy1mdRJPyY2OEdpaYFRM84dnIc49ct0vb
         RUe0umXjU0rijkDtHUty5oX/D6lFj+f59xUgli1MMx5QvpEY76ApOC1yCncSFbFxCKxk
         yjmyDkFtFzc9uAtcvsJKvjmv7QUEy1ABjevBV+da8eWTK5UlHxiAkZ75E+bZQkvBia+1
         czqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736414623; x=1737019423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2viDDTUr2f5ynhC6H7ht9PYN7Rsdi7Q9mOfRDowWPhg=;
        b=GTTTumRelCxeGiJTcw+s2YzpU7i5nJh57ZN0Rj+lrzvgNq9+wZSP5POsunSiRIRnu1
         Vba3WanJek8AjdiNCpANfwd2F0MPOIy2UA3AP94292A1Ziv7ZilN3qVQbW3AGhL+Kn9M
         ZnxLdTbRYvPPcg6nAXaruM9PNHFp4F5vigfSAPa7MkxC9UA2vHR3lngq+qqcL6WpIBEF
         onmgJYjo92iyjQ+h+W9AX812Tdjb2vpJPdO8JOwSZOuYS9EOy3Iw9+Ygfn/+4Z58a0J4
         SLM1ZBwMTzy/AL1NfOowtqva+mlDr0CZNDUsY+7jyoBN0RqKlY3YycfL7jnO4PLK/AvX
         eQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWuj0eDWd3f4iSlm61emBAOsJomaDpjWlHCTYou6ZCG7QDb0hLmgSzSbOfFNJ24wfrErlribaJk/7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmpGZ87v7PFWoszKaFGXHyFGtLbbsV6pqK6m3XcO9r8V8aCcFz
	edshTfmY/p5hL4KvHQAw+g7+w45+nsbvdv86G+mK+JYloXOjcr4Wr9NLZCH3rQ==
X-Gm-Gg: ASbGnct5XG5QtJPgNHZvTnV660l1fYQV7xIK0nZnyfxShlwu+g37VhY4p9XywvuuXkJ
	bvV0nC4wt8lVF+7q48n5ZDjqtYiO34lYBScpCzWMQvn0N7qBpkDy+vBGCxYhECu7uu4fCTA2bap
	vw29EmrV5VKeMX/MAegPh3yKpCoBDJBe2bbyd4nxfiUAAHLVm3AqldFcsZisBJPU/J2MSAkZv5Y
	ybNcU8D+71aAKAsHtBZ530TXagIiALyEhgE7V0Hawz8IvZC7nyH5FQXcBczc/kn+nrX4yOKades
	5VZeQHQDSGtmUIa0z7PDZRompriVRkt/ngroI9ZK9A==
X-Google-Smtp-Source: AGHT+IFTF5rTQ23ubzfbgb6f7mk097eOUcRygQHvGBv9v86gBJD5sxS/iZnpzSRMAnx0DPtSeni8VQ==
X-Received: by 2002:a05:600c:154e:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-436e2697066mr53354395e9.12.1736414622945;
        Thu, 09 Jan 2025 01:23:42 -0800 (PST)
Message-ID: <e831eb1c-be8e-49f2-81af-ba4ed5ab40dd@suse.com>
Date: Thu, 9 Jan 2025 10:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: Support Hygon architecture CPU during NMI
 initialization.
To: banmengtao <banmengtao@zju.edu.cn>
Cc: banmengtao <jiuxie@outlook.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250104111109.2726-1-banmengtao@zju.edu.cn>
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
In-Reply-To: <20250104111109.2726-1-banmengtao@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 12:11, banmengtao wrote:
> From: banmengtao <jiuxie@outlook.com>
> 
> When I installed Xen on Ubuntu 22.04 and rebooted into the kernel, it kept freezing and threw an exception: "Unsupported processor. Unknown vendor 16."

That's no really an exception, though.

> This patch fixes the issue where the Hygon CPU could not be recognized when entering the Xen kernel.

You mention two issues (freezing and the log message). I find it hard to
believe (without better details) that both are addressed by just the
change below. Please clarify. The patch title may also need adjustment,
as more general NMI setup (e.g. for the watchdog) lives elsewhere. The
change here is about oprofile only.

> --- a/xen/arch/x86/oprofile/nmi_int.c
> +++ b/xen/arch/x86/oprofile/nmi_int.c
> @@ -398,6 +398,7 @@ static int __init cf_check nmi_init(void)
>  
>  	switch (vendor) {
>  		case X86_VENDOR_AMD:
> +		case X86_VENDOR_HYGON:
>  			/* Needs to be at least an Athlon (or hammer in 32bit mode) */
>  
>  			switch (family) {
> @@ -435,6 +436,11 @@ static int __init cf_check nmi_init(void)
>  				model = &op_athlon_spec;
>  				cpu_type = "x86-64/family16h";
>  				break;
> +			case 0x18:
> +				model = &op_athlon_spec;
> +				cpu_type = "x86-64/family18h";
> +				break;
> +
>  			}
>  			break;

Note how AMD Fam 17 and 19 aren't present here either. Yet Xen boots fine
there. So (as mentioned above already) quite likely there's more to the
problems you observe on Hygon.

Finally (nit): If already you add a blank line, please add it ahead of the
new case block rather than after it.

Jan

