Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F0996D28
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814568.1228150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXHk-0004WN-GR; Wed, 09 Oct 2024 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814568.1228150; Wed, 09 Oct 2024 14:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXHk-0004Us-Di; Wed, 09 Oct 2024 14:03:28 +0000
Received: by outflank-mailman (input) for mailman id 814568;
 Wed, 09 Oct 2024 14:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syXHi-0004Ul-SY
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:03:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe674ba-8647-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:03:24 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c924667851so511312a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:03:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c92c985eaasm193308a12.45.2024.10.09.07.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:03:23 -0700 (PDT)
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
X-Inumbo-ID: 3fe674ba-8647-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728482604; x=1729087404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6PIlW1t2b/KgprALibq1bw2jyq0vz9W2l2iV16kPdvA=;
        b=Bgf9UVWZFjADd5ApsklcXKS+qenu0etRGNp3gldyM7qkk9pQgPp5CP5xQKxUb4EqoV
         w6o4bD+IctPZ2/CySMmtU53nzjwlYERLmoXReK2Dg0H07CtSbaCSbscTMADqAENrqBA7
         mMCJ50jkVQMjNCYBE1WSVAj7zk5MIumLYAIDShPvWRkpBxQH69Re/fnFdU2XF9mT4wL9
         4cF6XO+kgu2CH3tV1WwfSZGoP6k5x4Pp4fpyB9JQvQBcugZulMebCv7g0j3ImGLAWpuY
         naKZIG1LFCGGfuhsJmRZ13NVkcjlnHOUFZxHRLNfCx+8Dr3b2t4++LwGgy6hk+w+xKZL
         C9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728482604; x=1729087404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PIlW1t2b/KgprALibq1bw2jyq0vz9W2l2iV16kPdvA=;
        b=SZRm7GLrBotpO+gDCe7Co5F6pv42+HLhZq/eUuo2NaDj2Z+8OOVWoGYiaEgY/5jJJl
         kwC0UtL+Fs/QD6vzAeXSQmM7kQ9v15lX4a1GiZHdzSbXa5bOS+36c+4+C06tgeXdIKL9
         bY4R3rr7mRl6sae8WG58RmpN+RpniwZ8ZNxr+PlQNhMI3F+WHaffqmiRuAiXeWc8OO50
         Z5aH/k39SJkE6LexoBpJuJHAQqGadmz80AiKPiugKmA8HV3OqZWChiRygdH9whn77Zfy
         o0Covw6fq92As9X7qnDuM/p/S53go2N92AZ6mWjchhdgd7zhGQ8gdVYySMRthLHE6v+c
         +w3A==
X-Forwarded-Encrypted: i=1; AJvYcCWgUI4dYnfdQmXs4RlPKpS+UGt0TPv/lJ37xAZKfT6O5e374tF/8XfEA7IT1Pv2fpqssU0wp9aOCUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdwFns7X3y7GFDMDDCaX9FFRIpU/rF70vu8TquGnc38m5W5PH8
	OBBnuPjEe2Uv4cLBp7GWK7j5yji4tnyGIRjZ5ttm+Mi+0gyzzk5ecrSUyQE5hQ==
X-Google-Smtp-Source: AGHT+IGK/1Dg1jxmC4SetnMRZ29xDh0j5rBxq7ZzWlkJYSvQSKJDMeiZbRN5OgXeefQyVnYO95u1cw==
X-Received: by 2002:a05:6402:35d1:b0:5c8:bb09:ae49 with SMTP id 4fb4d7f45d1cf-5c91d583dbemr1953595a12.8.1728482603463;
        Wed, 09 Oct 2024 07:03:23 -0700 (PDT)
Message-ID: <f75dde2d-9c39-4be0-8465-6496a56cc658@suse.com>
Date: Wed, 9 Oct 2024 16:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:38, Alejandro Vallejo wrote:
> Make it so the APs expose their own APIC IDs in a LUT. We can use that
> LUT to populate the MADT, decoupling the algorithm that relates CPU IDs
> and APIC IDs from hvmloader.
> 
> While at this also remove ap_callin, as writing the APIC ID may serve
> the same purpose.

... on the assumption that no AP will have an APIC ID of zero.

> @@ -341,11 +341,11 @@ int main(void)
>  
>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
>  
> +    smp_initialise();
> +
>      apic_setup();
>      pci_setup();
>  
> -    smp_initialise();

I can see that you may want cpu_setup(0) to run ahead of apic_setup(). Yet
is it really appropriate to run boot_cpu() ahead of apic_setup() as well?
At the very least it feels logically wrong, even if at the moment there
may not be any direct dependency (which might change, however, down the
road).

> --- a/tools/firmware/hvmloader/mp_tables.c
> +++ b/tools/firmware/hvmloader/mp_tables.c
> @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
>  /* fills in an MP processor entry for VCPU 'vcpu_id' */
>  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
>  {
> +    ASSERT(CPU_TO_X2APICID[vcpu_id] < 0xFF );

Nit: Excess blank before closing paren.

And of course this will need doing differently anyway once we get to
support for more than 128 vCPU-s.

> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -29,7 +29,34 @@
>  
>  #include <xen/vcpu.h>
>  
> -static int ap_callin;
> +/**
> + * Lookup table of x2APIC IDs.
> + *
> + * Each entry is populated its respective CPU as they come online. This is required
> + * for generating the MADT with minimal assumptions about ID relationships.
> + */
> +uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];

I can kind of accept keeping it simple in the name (albeit - why all caps?),
but at least the comment should mention that it may also be an xAPIC ID
that's stored here.

> @@ -104,6 +132,12 @@ static void boot_cpu(unsigned int cpu)
>  void smp_initialise(void)
>  {
>      unsigned int i, nr_cpus = hvm_info->nr_vcpus;
> +    uint32_t ecx;
> +
> +    cpuid(1, NULL, NULL, &ecx, NULL);
> +    has_x2apic = (ecx >> 21) & 1;

Would be really nice to avoid the literal 21 here by including
xen/arch-x86/cpufeatureset.h. Can this be arranged for?

Jan

