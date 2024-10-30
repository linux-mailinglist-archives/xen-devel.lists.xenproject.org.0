Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC39B5C0B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 07:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827904.1242672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t62Xz-0003NF-PE; Wed, 30 Oct 2024 06:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827904.1242672; Wed, 30 Oct 2024 06:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t62Xz-0003Ko-Lo; Wed, 30 Oct 2024 06:51:15 +0000
Received: by outflank-mailman (input) for mailman id 827904;
 Wed, 30 Oct 2024 06:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t62Xy-0003Ki-1L
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 06:51:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5858017a-968b-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 07:51:10 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so102157666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 23:51:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c816:25ef:94da:68a4:e7f?
 (p200300cab721c81625ef94da68a40e7f.dip0.t-ipconnect.de.
 [2003:ca:b721:c816:25ef:94da:68a4:e7f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f029874sm539342666b.79.2024.10.29.23.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 23:51:09 -0700 (PDT)
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
X-Inumbo-ID: 5858017a-968b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4NTgwMTdhLTk2OGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjcxMDcwLjA0NDEsInNlbmRlciI6ImpiZXVsaWNoQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730271069; x=1730875869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rxchYHo5knL+Vkt/o1xf5OpDVn+3AH3aOdOv6HwX8Ag=;
        b=geYLFHeMIOWb8VjOlChV//PmOVk0vWrj7sJMqlkmq7AIHLfPfUwBUzRKBWhhosmPa2
         i19kmjMDGAYOD0BY1v/sYKEi6bKNc7xLfa2nxdVFCh2enlujKm42Z1OoLeRh3TjQL4XD
         EZkTr+v0k6PTKNJ82aSzxOR1z7+V27idJ8K3CrOYq0ZIfkVFgGfmbVs8X/TPX2qoF2bR
         4SMwBUCAjXt0DlH679Gb4cZQ/kpAW1w5V7684G94LYkG8rgVHwmIlaveEbgqi+vEXtJz
         4Qzbol+6CIW0HvpED3sSXxONZw/SeX/bWH35kGMarBvb82kad6+Xy+SqWGa7NOLEEfZV
         0ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271069; x=1730875869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxchYHo5knL+Vkt/o1xf5OpDVn+3AH3aOdOv6HwX8Ag=;
        b=gfcS2fTv8JNGEktWX24HaAJ3Gm5q9HR3s1PVkVSQxm1y7vDFEQ8F7bI+E+yV62DSKn
         5gXIHFmDBH/zECSPBapE7ETvaIQfoFVSy9PFTmi1eRdIJY0l9UhvnSVCaduQPTQWVr7I
         7OxfY7dcR28dtcjxthPOSvzrBfnsp0khx/UKfVSL/Ta3qPr8luNyIe8s/lF06MHMp+bR
         JM0r/3MlW+hF/fyt9EQ13ih3yN2QwDofwo8M+2CwIQ9VmtpkUBXc7GWoeTROOu2aLbe5
         H24ZEOSbUvkESG6BCdDX9jaKErBGS1qVR//mQCov1F7+if7mCuZaN3qXKRq0KJYbG1tr
         /Oag==
X-Forwarded-Encrypted: i=1; AJvYcCXxuHAVZohcW6EYAoz2hLxYsIPAZqRBn0rlebnBGG2A+a6hOr9nWFrvGPbBeBsq94Po8s99qpD2gPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1tgKirRV5YnisVB365bzBRyZv/9+5ecRdW/oyv8QhBYHl7f/s
	BBiBblULvYG4MG10DbZOXd54XdAAQDhc8eqPSBJUL8AeUrzCaPB8KKOOhP+z3w==
X-Google-Smtp-Source: AGHT+IE95yimQ66gwnbKjNW7UTbSk2zlDHDbnJPw0vLYIxLqieqHGE27DGFyY6BIUJi3J6D52175pg==
X-Received: by 2002:a17:907:72cd:b0:a9a:ca:4436 with SMTP id a640c23a62f3a-a9e40bd0b7fmr116195766b.13.1730271069339;
        Tue, 29 Oct 2024 23:51:09 -0700 (PDT)
Message-ID: <14173e8a-ec20-455a-87bf-ae6d3d9a9051@suse.com>
Date: Wed, 30 Oct 2024 07:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2024 18:55, Andrew Cooper wrote:
> We already have one migration case opencoded (feat.max_subleaf).  A more
> recent discovery is that we advertise x2APIC to guests without ensuring that
> we provide max_leaf >= 0xb.
> 
> In general, any leaf known to Xen can be safely configured by the toolstack if
> it doesn't violate other constraints.
> 
> Therefore, introduce guest_common_{max,default}_leaves() to generalise the
> special case we currently have for feat.max_subleaf, in preparation to be able
> to provide x2APIC topology in leaf 0xb even on older hardware.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll have to update the AMX logic accordingly (maybe also the AVX10 one).

I'd like to point out that this highlights a naming anomaly in
x86_cpu_policies_are_compatible(): update_domain_cpu_policy() passes in
the respective max policy as first argument. Imo the first parameter of
the function would better be named "max" there.

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>  }
>  
> +/*
> + * Guest max policies can have any max leaf/subleaf within bounds.
> + *
> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
> + * - Some VMs we'd like to synthesise leaves not present on the host.
> + */
> +static void __init guest_common_max_leaves(struct cpu_policy *p)
> +{
> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
> +}
> +
> +/* Guest default policies inherit the host max leaf/subleaf settings. */
> +static void __init guest_common_default_leaves(struct cpu_policy *p)
> +{
> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
> +}

Which sadly still leaves open how to suitably shrink the max values,
when they're larger than necessary (for the guest).

Jan

