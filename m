Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A950B9D8AE6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842997.1258658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcU7-0002ue-BM; Mon, 25 Nov 2024 17:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842997.1258658; Mon, 25 Nov 2024 17:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcU7-0002rx-79; Mon, 25 Nov 2024 17:02:51 +0000
Received: by outflank-mailman (input) for mailman id 842997;
 Mon, 25 Nov 2024 17:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFcU5-0002rr-OM
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:02:49 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17bc28b2-ab4f-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 18:02:46 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso2246838e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 09:02:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d41af02sm4288477a12.87.2024.11.25.09.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:02:44 -0800 (PST)
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
X-Inumbo-ID: 17bc28b2-ab4f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE3YmMyOGIyLWFiNGYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTU0MTY2LjE0NjQ5Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732554165; x=1733158965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5fZgSYLTOoaY0Y2ERGQC8XjxzOjjg1layygbVCyDB4=;
        b=UgTaqdYo+iSlXSBhHj/1/is0vNqHL/mPmVAOw2q90EAOeTl3cOuIdRIJdp/FXu0GsS
         FaaWahApz3JI0SFI6cXqJ2a3zK6fQsz8QY76h/DWs3UG8ONvXtAoK5ohT4nNk1/69Zqs
         rMnEdyDci+eT8uj9++SHCmzB6uBa9Ded7DkgjLxG6gFr4Fz35q1sA5RZYCGtmsGrou3E
         rRroeV/GPYt2goTGGkd1lvGtI/6LR+TXR7Zi8m1Zq6+/oPWA3TJb0fuWfo1P8ObL0ZeG
         hIP4uJRPgEi4x1LRnNP+cCssSKeqaS0fgDNhD9ZIhgbjevvvGY9gUy+ML8YFWF/EHNm/
         vt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732554165; x=1733158965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5fZgSYLTOoaY0Y2ERGQC8XjxzOjjg1layygbVCyDB4=;
        b=H6GRIYTFbYa39WP2o2KVKALfmZmO9F7tMErngKGNL9AfRdpuCDEotLBzEtON1wIdCF
         b9+faAVGgYUGSZx3aqRZ71CaGOrqq/0Vi2ym5cgnucmqNz6WLy9Zo2yjU5j4vnbZwRfj
         OFTt6MYsSDrQiZO7Zdfro7VnpvWbx9BQo7NUrd9xYQX+zfyfewXgXivBtz78v+C7jtQA
         0EP4qE5yKXgV8WXDFW8bRUOYKGXyBRNltvdJumVWfhvdBzqUZ0VsVtRJkaG5qKVUVHeu
         HRSt46lUKkbj2ICq1m/w9SIGhmqhZfWzkkazIFzaP/bHEE+dfkVwHilYMcf0i+BFQ2NM
         WG4A==
X-Gm-Message-State: AOJu0YyuvIKmidBQDgt3q+m0YRacmh0t1/TqMe0Q9eFkplUwRry8NXX4
	d0uCpepM4AXPkaXWfNVTtGewhCzkTsbxeNYuRTg8xYAJT1IodT2wPm4Opm+reg==
X-Gm-Gg: ASbGncvczYbiENZioQ1DOXHPKILPKPWI2WuLtfeJnKXjCZdmrWhf3OVqH1SySj8MkUt
	ZTVDehLXXcYflL893gZ60X0f+Bji0gdu5oAeWqPwy666O8d7lB+FQ3w6ciewj/zMPIorqzGtW6X
	u1OKFzA2IjfxEEF1xnQQqVnDPT1cpgSLS0uV5BTzQNSP7EnPdNdmEGkXgMBd2jN4c5gpAyJ6Sy0
	ckeI9md/O6/3oNSirfjucn//4bAjm+82+w6tDdC/urn2VX7HlbiEQjJ6chWAYM9no6BrR7K1rP6
	kRO20mT8040CqLbDrc7hou+2fJaYR+C3Tvc=
X-Google-Smtp-Source: AGHT+IGt3FsQ2uRWz5jdUgBHX3oBYJwy3UK1RzRp+LTl2nKRcjuSH2fD+91wYeDXy7Sbs/sFYh8y1g==
X-Received: by 2002:a05:6512:3c8c:b0:53d:d957:9f93 with SMTP id 2adb3069b0e04-53dd9579fcamr5918959e87.0.1732554165307;
        Mon, 25 Nov 2024 09:02:45 -0800 (PST)
Message-ID: <e7dab79f-2884-4f60-8f98-2c671dbe7963@suse.com>
Date: Mon, 25 Nov 2024 18:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86: Add Intel architectural LBR featureset bits
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-2-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
In-Reply-To: <20241118084914.22268-2-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> From: Tu Dinh <ngoc-tu.dinh@vates.tech>
> 
> Expose ARCH_LBR feature to guests.
> 
> Extend CPU featureset with 3 words for CPUID leaf 0x1c.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

First a general remark: Please Cc maintainers on patch submissions.

> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -656,7 +656,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>              p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
>          }
>  
> -        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
> +        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0x1cu);

We'll need to update this again and again (AMXC, AVX10) if we continue using
literal numbers here. This wants switching to ARRAY_SIZE(), and imo ideally
in a separate prereq patch (which could likely go straight in).

> --- a/tools/misc/xen-cpuid.c
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -271,6 +271,8 @@ static void recalculate_misc(struct cpu_policy *p)
>  
>      p->basic.raw[0xc] = EMPTY_LEAF;
>  
> +    zero_leaves(p->basic.raw, 0xe, 0x1b);
> +
>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
>  
>      /* Most of Power/RAS hidden from guests. */
> @@ -303,6 +305,7 @@ static void recalculate_misc(struct cpu_policy *p)
>          zero_leaves(p->basic.raw, 0x2, 0x3);
>          memset(p->cache.raw, 0, sizeof(p->cache.raw));
>          zero_leaves(p->basic.raw, 0x9, 0xa);
> +        p->basic.raw[0x1c] = EMPTY_LEAF;

I'm not convinced this wants to live here. The leaf rather wants clearing
when the feature isn't there in the policy. See e.g. [1] and [2].

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -505,6 +505,13 @@ static void generic_identify(struct cpuinfo_x86 *c)
>  			    &c->x86_capability[FEATURESET_Da1],
>  			    &tmp, &tmp, &tmp);
>  
> +	if (c->cpuid_level >= 0x1c)
> +		cpuid(0x1c,
> +			  &c->x86_capability[FEATURESET_1Ca],
> +			  &c->x86_capability[FEATURESET_1Cb],
> +			  &c->x86_capability[FEATURESET_1Cc],
> +			  &tmp);

Nit: Indentation (arguments want to align vertically).

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -284,7 +284,7 @@ XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
>  XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG instruction */
> -XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
> +XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*S  Architectural Last Branch Record */

'S' is too early. You first need to implement everything, and only then
you can make the feature visible to guests. It'll also only be by that
time that it'll be (halfway) clear whether 'S' is appropriate, or whether
for starters it wouldn't better be 's'. Same for the other markers below.

Jan

