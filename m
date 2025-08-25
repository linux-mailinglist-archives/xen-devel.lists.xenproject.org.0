Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916DB345AA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093419.1448943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ3B-0006tp-RC; Mon, 25 Aug 2025 15:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093419.1448943; Mon, 25 Aug 2025 15:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ3B-0006qj-NK; Mon, 25 Aug 2025 15:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1093419;
 Mon, 25 Aug 2025 15:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZ3A-0006k2-BP
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:24:00 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f9662d-81c7-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:23:59 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134609so5593425a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:23:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312aecdbsm5184422a12.20.2025.08.25.08.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:23:58 -0700 (PDT)
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
X-Inumbo-ID: 85f9662d-81c7-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756135439; x=1756740239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c9LJCtAqBNDA1jku0euT32N89xyi1sVZi7wQt6DNJo0=;
        b=ax0AvrWJf6xlEdzmpFVdaPrRQzc8h3SNJUfsyn6xecaly7WOUSxHbvGSKdwtxTpPxL
         VUxF01UqRUCY29G49O5qEX+w7Qzt27VGGTP2AYrgwIuLCJ/EIcXnTElaGQletiPjK4Vc
         5UMpyHnoP5PiIRs/0Wu8f87ZLnXE+c6Z2HU7tFtvPv+9euCq9opijoGdEQNfSR4OfXEd
         BaxCcL5nxQbAATWg00ton623/mBJXUtIwcjCUXu2A5uuftetwjZ+0Mi2pAvVZtV0lfBk
         Bel1BOocamjSAAF1BWl+7tGK5be2mKGBw6i5kX7uAcy8vhGMGgY+0j5Tbi7Ss4lg+P+9
         QdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756135439; x=1756740239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9LJCtAqBNDA1jku0euT32N89xyi1sVZi7wQt6DNJo0=;
        b=OcHs75kvUSf3yfvqKRUB+68c+/gPToieGy011t9jF/5JUslJVmRsPSVGl4LchgyHpi
         WdeLMxkCnWULAMg0nAFl59y2VB10Cj+AueRHVFx3VpzLjHvWQJP1LWPpxAOFY7Wmuz/h
         YJo/34YIIkGujIqzuxiOOApaqMbC1/wlmAp0fNYllJCZ0BTJRG8T+Szi61qvvL9exN02
         ws8zkSKWNAtMN5/lhpZ5o7U4gxqJdHUoKFJOeaaMJa7dep3vt9LKk4nA5dYvEur/+vlO
         eV6DR1hQZa2rz8m+ElZNhEluChERxCVPASVBAuS9t5iS+H5kPuTmvon6jJR5Tty2gESz
         mygw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnTcDv/bskJMsaZwVmb+FrEQpdtw/v8rlMzBv/PxKHjr5XNtlVo7POWFPfhShKKagqIkiiaTw3Yk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgDtL2jBqy+szWuubWJFoz/MlpCLL3cRGQ0uVtnlwezqgcAVJN
	9iL4TUDETDEk28N7MosHAbWkhOCpBKf7ESh4FndHL7E4tRx2p1YYanvJ8cRZhXjD5U+TFy8nzNX
	HvQw=
X-Gm-Gg: ASbGncsVEFBf0UcunMdKYyGlswHQlAvNd1/S9FoTkuRVmL9swnElphgDQqtBNLui73c
	dJF9CShDHE5wJkhzaQX7YpNLev6fbNPOHadUTVtn1L6+5UKMdbszVI1UQkQ/AuNMnJa/iLbuWDl
	3SmRaWryHetd48xVhrRfbO4QrIvB5ell2Qg+QC2Fdic22MEgDu7elj2pT1lEwb/Ap/RmpCb830c
	LVOvbilW7whgX/Foh88hdODrsYCUWRlMA9A1BcJ+nz1tMyGxlgDqfICcoFtGZmh1//15BTYskp9
	DRCnp8yTSYiozsCkq1Emklbb3BVHJA2eDlAbNFFbLeqv+dJ0hPvEjSc5kGJVLHDSOTrrNm3IsPN
	8RgYBoypS/u0y8KYHnfJfelyRnwoL5xM4feRZIUUwtED1IoCoqveFRZ0T80tHMKKDsmjrtrDscD
	CdvA4p7hM=
X-Google-Smtp-Source: AGHT+IGtQW+pOtI2/Bc96XftUIh7geAz2XWSZPldN48U6MqtAazhFt4wIGi+RG4AqokpCYg0/DdrkQ==
X-Received: by 2002:a05:6402:1d4b:b0:618:6a75:2d76 with SMTP id 4fb4d7f45d1cf-61c1b21df4dmr8883432a12.0.1756135439006;
        Mon, 25 Aug 2025 08:23:59 -0700 (PDT)
Message-ID: <385daefe-78bd-4c22-826a-836b61d12026@suse.com>
Date: Mon, 25 Aug 2025 17:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/13] xen/cpufreq: get performance policy from
 governor set via xenpm
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> Even if Xen governor is not used in amd-cppc active mode, we could
> somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
> apply through which governor they choose, such as:
> If user chooses performance governor, they want maximum performance, then
> the policy shall be CPUFREQ_POLICY_PERFORMANCE
> If user chooses powersave governor, they want the least power consumption,
> then the policy shall be CPUFREQ_POLICY_POWERSAVE
> Function cpufreq_policy_from_governor() is responsible for above transition,
> and it shall be also effective when users setting new governor through xenpm.
> 
> userspace are forbidden choices, and if users specify such options,

Odd use of plural here, when only one bad variant is named.

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -206,6 +206,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
>      if ( new_policy.governor == NULL )
>          return -EINVAL;
>  
> +    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
> +    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
> +    {
> +        printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n",
> +               new_policy.governor->name);
> +        return -EINVAL;
> +    }

Don't you also need to check for CPPC mode, or else you reject "userspace" for
other drivers as well?

Jan

