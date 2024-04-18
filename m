Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC08A94B8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 10:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708106.1106698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMu8-0005Vg-4F; Thu, 18 Apr 2024 08:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708106.1106698; Thu, 18 Apr 2024 08:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMu8-0005Sn-0N; Thu, 18 Apr 2024 08:14:00 +0000
Received: by outflank-mailman (input) for mailman id 708106;
 Thu, 18 Apr 2024 08:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMu6-0005Sh-KY
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 08:13:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e25a9e-fd5b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 10:13:56 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-418e4cd1fecso2783025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 01:13:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b0034a0d3c0715sm1025811wrs.50.2024.04.18.01.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 01:13:55 -0700 (PDT)
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
X-Inumbo-ID: 99e25a9e-fd5b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713428035; x=1714032835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/QFEkzQtkqWOX/3y1fSOehqDrOYjutE6TZyM81YF1c=;
        b=B4EIVWrBCywh+0aTtz0GFvI6OKwYBhrX/E7/YqO4h1ZWO2EeXLWJhftnZunSrFN3/+
         rd36iKhtjCYj7qEY6fnp40XUbpV35mIze3P5MFGndfseeIkafw5P3a8Z6aAYdyJCp74r
         Ah9epqjnHj802xgV222PzN42NIE2pmgtTXszlWV7zH3eVqo9Ov5qQL8ROKD3e2JiY8Lt
         9L2weMph69Nrl4kJpuDLzAcJSGZWWStuS7ZgKpXigZziWU5f537i+JWYLBGK0RqMIM7G
         PBm1MTB5bTSmQ4uRnyAlqCYIwA7EFFWsF3wfAUy9nIYyOtMbYYk9vJtdm6uM+oUzCPsc
         shvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713428035; x=1714032835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/QFEkzQtkqWOX/3y1fSOehqDrOYjutE6TZyM81YF1c=;
        b=q4ulHMg+R9Sbwa9RHEzWwxJkz3w6xnWC148ucWFbJc2aK83Z+2B2QB2/K1Ss+aFdTQ
         Evl/BfenzoQFEGcKhhHXaXN7FM3RYhHuNTfd8L21lhPi4CK12q4rS3R5mMNCwp/h2rN0
         L2tHfOBHs3ccBqyLtYPNRs7gT/YGphDnfBywJfFHmNHvraJGWlN5h11T8Z7T9All7k8T
         0rhh6pGRZx02XiXsDe72cPpeH1aKAOehgFg00Al2z4qJO5/pDStqu3IIaHQVUD2OlYS3
         CbPfeKkzHvXDfx3ECe/LuCjqZzV3aXObGy262hmBjRCYayV9d+6AkekA90N04/zFHyVQ
         Ph+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4JwKnN3Y0SubeNHzeQtjVLrRGfztJLMunYabjKAxbn5eDu6zzYB1d/+lnhEacm8R9KZ3wuNiumvLT8bv8AKziXYmpOoe6X2tUMkMiraI=
X-Gm-Message-State: AOJu0YzP4kAVMYYkvzK0Igcg6vM6HGvmdSZsZPqPnEaLIwYKKu1Cz35Q
	J7jWZ8y3PanakKiGDFr/Zyi6yYGhGe7/l9ke8jaOzA3UFQ0w8+ZXKHI3mWHAtA==
X-Google-Smtp-Source: AGHT+IG1wLqJ77V65vA040SHaaeSkiMk6Q7kFikNs71sbW/4MD28QWUsvKQP0EuRt0pqJdDv1Usw2A==
X-Received: by 2002:a05:600c:3ba3:b0:418:de77:909e with SMTP id n35-20020a05600c3ba300b00418de77909emr934530wms.14.1713428035617;
        Thu, 18 Apr 2024 01:13:55 -0700 (PDT)
Message-ID: <b66ea826-f670-4a9d-89cb-4de6cb3ec9fc@suse.com>
Date: Thu, 18 Apr 2024 10:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] Implemented AMD SEV discovery and enabling.
Content-Language: en-US
To: Andrei Semenov <andrei.semenov@vates.fr>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
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
In-Reply-To: <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.04.2024 17:36, Andrei Semenov wrote:
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>

A couple more nits on top of what Andrew said. First: Please no patches
(which aren't blindingly trivial) without description.

> @@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
>  	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
>  }
>  
> +#ifdef CONFIG_HVM
> +static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
> +{
> +	unsigned int  eax, ebx, ecx, edx;
> +	uint64_t syscfg;
> +
> +	if (!smp_processor_id()) {
> +
> +		cpuid_count(0x80000000,0,&eax, &ebx, &ecx, &edx);

No blank line above here please.

> +		if (eax <  0x8000001f)
> +			return;
> +
> +		cpuid_count(0x8000001f,0,&eax, &ebx, &ecx, &edx);
> +
> +		if (eax & 0x1)
> +			setup_force_cpu_cap(X86_FEATURE_SME);
> +
> +		if (eax & 0x2) {
> +			setup_force_cpu_cap(X86_FEATURE_SEV);

I guess this goes along with what Andrew said: Using synthetic features here
looks suspicious. These want to be recorded as an ordinary leaf.

> +			max_sev_asid = ecx;
> +			min_sev_asid = edx;
> +		}
> +
> +		if (eax & 0x3)
> +			pte_c_bit_mask = 1UL << (ebx & 0x3f);
> +	}
> +
> +	if (!(cpu_has_sme || cpu_has_sev))
> +		return;
> +
> +	if (!smp_processor_id()) {
> +		if (cpu_has_sev)

Two if()-s like these want folding, unless it is made clear that very
soon (see above as to the missing description) further content is going
to appear inside the outer one.

> +			printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",

%#x is preferred over 0x%x.

> +			min_sev_asid, max_sev_asid);
> +	}
> +
> +	rdmsrl(MSR_K8_SYSCFG, syscfg);
> +
> +	if (syscfg & SYSCFG_MEM_ENCRYPT) {
> +		return;
> +	}

No need for braces in cases like this one.

Jan

