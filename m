Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FAA842D9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945549.1343739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qro-00071Q-UW; Thu, 10 Apr 2025 12:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945549.1343739; Thu, 10 Apr 2025 12:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qro-0006vw-Qn; Thu, 10 Apr 2025 12:18:48 +0000
Received: by outflank-mailman (input) for mailman id 945549;
 Thu, 10 Apr 2025 12:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2qrn-0006sP-Gf
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:18:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f048ae-1605-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:18:45 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso302563f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:18:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdf6dsm4681065f8f.90.2025.04.10.05.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:18:44 -0700 (PDT)
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
X-Inumbo-ID: f2f048ae-1605-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744287525; x=1744892325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XlbzHtSp4pngYxsCukm4n0mN9sBjwgHb/MkNTr7262w=;
        b=hFwCvZu97H2fbUVmOkfPv2eiRVxA9+kAxZGGJIkiDrR8V2v3dFmjkK3/FZZ2hdQADt
         2vqflVNX2eO81Fzb+5xJA+lgswyMrQ1XYbuDuKE33244/gLJKgVti0/PLSxnyz0Wpb8D
         vNNneBSnTdQqz7FsxcISgZrJJroCz1E/DBFgzuVBZb5QsTyQASOoouRyBuYnfaEQIGXn
         H9R3AoaxHpyjEaWhP45vAhTz1KQObiZTWg7rQbfUhms71UdLTToQKM2kdKyHQ6lSzJrQ
         I+nL25CUNwd1ectJY6KYUmTOspTc+J6e4IfANLAuSWZQrA32G9aFor7nZAKaxtKqr96E
         IGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287525; x=1744892325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlbzHtSp4pngYxsCukm4n0mN9sBjwgHb/MkNTr7262w=;
        b=Lm4O9Ij4VNvivOE+u76ugmmnax6T99yjmw2z8asqrsgDm6bQ2Yyu+ZIh+XI+w9rjgF
         EhHPgm/QLh/RltD+rlR74Hyo+/mdLpIxoVXjX3nkzGHEHctm9sW3rac9fJNobMUKyz8+
         7wOlT1kxhBxCr6mk+ebkF/oZ7IvDwaORP16aynbrGHIXnHZWXi9uI3SHnUiRS8deV5oc
         GOlPmrhRgqwexWS8Nv0CIskdQwLAHCu9w9thmb7H5TwljYKISSE3kfeIsBBhJV2vctkp
         PcYLRNgpr9AiUZsTeshrvQsy/8+QjtKkXvGA/+xn6Q1uwi1Nnjx3cDGNTEaY8fOn2/AU
         JvsA==
X-Forwarded-Encrypted: i=1; AJvYcCXe33DMOupBAzlwSgLIkYnUEk8FPWzNZZxnA6Ifhv9+jA2ukbanjA9TPHmebm4309yfqR1VMajmml4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuT+NvdOgGVv+rP34lkEN1tDgg8VzAaCD5i7Vw28YiX11YRvrr
	Hszxr3wsBXCd24/I/ruH44Vq6nHxIhEivSgEvjlrX7zP8tuckZHO1/6n7Vfi3w==
X-Gm-Gg: ASbGncvDhal68iUluuzPG1JkJD/qYvO2tAj5RcgPYPRT96wrZs1hNW2OJwc0qtfGIDH
	Dfdjlz+dJkNwEXb02978NiYIcJ2jMLEyjB1D1lvzc9A7zid0yfIbcyXKFWB9rEcI7moWXNsRlaT
	GGv6H0DPvzFtQ5G8SFfKcqOwa4YnkCifgW2bZ/tqhwAmg7dSeed661lm8rvbWz6EFs3fZed0a9y
	ZX1IPa7H4InilIeCuoqVYT3sd/xx9Jy/dPU/Hs5PM2vT2xZU7GNgJ3QNc47uZm9WfxYGA7nOz9C
	mclyGKpqGcW8d1l9H+5BEdDTPIMg2rzI47au2s7h+0RZ7CTVhYkHTmfpRZ05EOe2DPF8Wtzric6
	tjWazyJzyEGVYMxLCmUNOQcR4ljzNbFR4ghat
X-Google-Smtp-Source: AGHT+IGE5xT+or3OdICpuM/dmn6Yaeon7opX6C1o8WPkWoVOFQKPGzZOF1v1Fc8D/yZ8aceYRzDlaQ==
X-Received: by 2002:a05:6000:1a8e:b0:38f:2ffc:1e99 with SMTP id ffacd0b85a97d-39d8f4f9ddamr2179637f8f.49.1744287525101;
        Thu, 10 Apr 2025 05:18:45 -0700 (PDT)
Message-ID: <0adfe521-eda5-4d84-b6bf-72062a96cff7@suse.com>
Date: Thu, 10 Apr 2025 14:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot domain
To: Alejandro Vallejo <agarciav@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-17-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Introduce the ability to assign capabilities to a domain via its definition in
> device tree. The first capability enabled to select is the control domain
> capability. The capability property is a bitfield in both the device tree and
> `struct boot_domain`.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

The R-b feels kind of redundant with the subsequent S-o-b.

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -257,6 +257,18 @@ static int __init process_domain_node(
>              bd->max_vcpus = val;
>              printk("  max vcpus: %d\n", bd->max_vcpus);
>          }
> +        else if ( strncmp(prop_name, "capabilities", name_len) == 0 )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
> +            {
> +                printk("  failed processing domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            printk("  caps: ");
> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
> +                printk("c");
> +            printk("\n");
> +        }

Like for the other patch: What about other bits being set in the value read?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>  {
>      char *cmdline = NULL;
>      size_t cmdline_size;
> +    unsigned int create_flags = 0;
>      struct xen_domctl_createdomain dom0_cfg = {
>          .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>          .max_evtchn_port = -1,
> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( bd->domid == DOMID_INVALID )
>          /* Create initial domain.  Not d0 for pvshim. */
>          bd->domid = get_initial_domain_id();
> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
> +        create_flags |= CDF_privileged;

Seeing that builder_init() in the non-DT case sets the new bit unconditionally,
isn't the shim's only domain suddenly getting CDF_privileged set this way? Oh,
no, you then ...

> +    d = domain_create(bd->domid, &dom0_cfg,
> +                      pv_shim ? 0 : create_flags);

... hide the flag here. Any reason to have the intermediate variable in the
first place (can't resist: when there's already a wall of local variables here)?

Jan

