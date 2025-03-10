Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180ACA59219
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 11:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906425.1313873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traq7-0007RK-HI; Mon, 10 Mar 2025 10:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906425.1313873; Mon, 10 Mar 2025 10:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traq7-0007PI-Eb; Mon, 10 Mar 2025 10:58:31 +0000
Received: by outflank-mailman (input) for mailman id 906425;
 Mon, 10 Mar 2025 10:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1traq5-0007Ou-Uq
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 10:58:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 988556ca-fd9e-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 11:58:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so23191805e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 03:58:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfc02e8bfsm10019165e9.1.2025.03.10.03.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:58:26 -0700 (PDT)
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
X-Inumbo-ID: 988556ca-fd9e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741604307; x=1742209107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M7NUsoZ3YDpgxf0kMho0qHQQ0xPqGzRseuU60Jh2/Vs=;
        b=fwB55Jbnfv0C561GPdrSjgtkg0LLE2YZxLeh5+nI7J726sy9+IbV/0dvmZ1E8RiGoE
         WHp6mzskcVlL+W2+6KFWqyutNU2vskHxiw8E0ying4gBQnPo2+3fxVgH44JueKQhODRb
         bXExnMRrW70eKVsFtoxPSgcTHD1UrkV+LuOGjRxAMX3J8CNoI7bxdJbuMn7lV82jEKeK
         VPDYmTBf77c/KtiAKVOSQsVwxE+mywQ3HSGHzZm/RFG6cw7VDgF9DNMPzUiLAUH/8Dh2
         TxMvCV8oUDvipy4Ec9qMaeEzEAJqLx7+yiF3bsceYoF/A20XSslhiZqozPc4SVLyAwFk
         sc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604307; x=1742209107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7NUsoZ3YDpgxf0kMho0qHQQ0xPqGzRseuU60Jh2/Vs=;
        b=Tzw8C37ErccRZ4t/ujt+aUiGUAhCQFip8bFQa/Kk0jMlVxL+evtbCwHTcU1TSQg87r
         nslYrRF9DBsvRljCZuBQz6FUFbLGzGyK51620554j3y5ZnvA836wcNymLDuAKMVDlMnW
         mBtxI8hpiLEuVc5Pz/w59Mh1uP3kI/waPc7I1moKR6Kwzwj5whQx6NPBVDGAI4mQUVIb
         GXtRu1F8S6B6hzVweHQI+GAqY+58KhkTwdOirBIzBKdCqAk88dABeTnBxxrQTlnuUQMn
         LjuiLrx4JG4ifU5uyCMnqyC8Bbc5S7JV/MbJV/w87ffYW4WtDz3Um62Mrnw+k0JwhSYc
         wBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzvpfoOeun/6EPr7bs30AkuzRZtME01oemhwxrL40Xl3PAidC4UWjWAgkrcg3l7RNq60bXL244PZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFWEmsSiYCgSWNVc7dyDAIuJLDy2qcAXRxfiW2Yn+4mTLDioed
	aGLwttQunOxYinlBlWW8JuUAyCw2ipcQZGHgVTY8cMDLydQs5K68dlsGK6WQHw==
X-Gm-Gg: ASbGncsjWo7wk+lXTaiKgDmEotDm1T4QH5TV9Dh4tT6we6qpw5itEvuyymyFLM3K9Wp
	WPDOhPZHJdWmhUxGOhlQHWekYDtyaMz2S3Yq3Hp1XTeM3yah70oo4pEwVcjo5lpGPhQ4LL6Svn4
	musnxVUjcnW07SkGrdYwgaVrCnQOqFHxTvxfXIajQtXhvmmCszx5BgnhGuy22BlW9VOQ+O/L0UH
	TzZpGGWYTRKpgPsMJ2PzJSNtpDIfuN9zn+owc7J/m7g8hw58/j3wIZeIiWKqAsQF/jggDYMoKMB
	ErFYzAy3wCLdbv5/grRAqZ7+EkgRTg7rvSFJoskcZmSwJY0EO9QTQe7KxeQLC5BAVzAL/a6Gh89
	Jg6HBTW2GuhpVAOT7XCpCIXDrOOO/rg==
X-Google-Smtp-Source: AGHT+IEc3V2k68rcGEzv5Uk7jGHAOA5Ns2LegZDIzMkv700iJ542xID08Acj6a26RgcOXLrLYjOk8Q==
X-Received: by 2002:a05:600c:19cd:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43cf1b81b78mr28990245e9.30.1741604307261;
        Mon, 10 Mar 2025 03:58:27 -0700 (PDT)
Message-ID: <15510eaa-021a-4d7f-8756-c6abdf631dce@suse.com>
Date: Mon, 10 Mar 2025 11:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
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
In-Reply-To: <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 10:09, Julien Grall wrote:
> Hi Luca,
> 
> On 07/03/2025 07:58, Luca Fancellu wrote:
>> When Xen is built without HAS_PASSTHROUGH, there are some parts
>> in arm where iommu_* functions are called in the codebase, but
>> their implementation is under xen/drivers/passthrough that is
>> not built.
>>
>> So provide some stub for these functions in order to build Xen
>> when !HAS_PASSTHROUGH, which is the case for example on systems
>> with MPU support.
>>
>> For gnttab_need_iommu_mapping() in the Arm part, modify the macro
>> to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.
>>
>> Fixes: 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v4 changes:
>>   - re-introduced stub for iommu_use_hap_pt, Stefano suggested
>>     it is ok to have it in iommu.h.
>>   - Reworded comment in iommu_domain_init from Jan suggestion
>>
>> v3 Changes:
>>   - removed stub for iommu_use_hap_pt, another solution will be
>>     done for the instance in common arm code.
>>   - Moved a comment close to the macro it was referred to
>>   - add comment to iommu_domain_init() stub
>>   - modified commit message
>>   - Add fixes tag
>>
>> v2 Changes:
>>   - modify gnttab_need_iommu_mapping to use IS_ENABLED
>>   - removed macro that didn't allow some of the parameter to be
>>     evaluated
>>   - Changed commit message
>> ---
>> ---
>>   xen/arch/arm/include/asm/grant_table.h |  5 +--
>>   xen/include/xen/iommu.h                | 50 +++++++++++++++++++++++++-
>>   2 files changed, 52 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
>> index d3c518a926b9..c5d87b60c4df 100644
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -73,8 +73,9 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>>   #define gnttab_status_gfn(d, t, i)                                       \
>>       page_get_xenheap_gfn(gnttab_status_page(t, i))
>>   
>> -#define gnttab_need_iommu_mapping(d)                    \
>> -    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>> +#define gnttab_need_iommu_mapping(d)                                     \
>> +    (IS_ENABLED(CONFIG_HAS_PASSTHROUGH) && is_domain_direct_mapped(d) && \
>> +     is_iommu_enabled(d))
>>   
>>   #endif /* __ASM_GRANT_TABLE_H__ */
>>   /*
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 77a514019cc6..5ac038521e23 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>>   
>>   extern unsigned int iommu_dev_iotlb_timeout;
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +
>>   int iommu_setup(void);
>>   int iommu_hardware_setup(void);
>>   
>> @@ -122,6 +124,28 @@ int arch_iommu_domain_init(struct domain *d);
>>   void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>>   void arch_iommu_hwdom_init(struct domain *d);
>>   
>> +#else
>> +
>> +static inline int iommu_setup(void)
>> +{
>> +    return -ENODEV;
>> +}
>> +
>> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
>> +{
>> +    /*
>> +     * Return as the real iommu_domain_init() would: Success when
>> +     * !is_iommu_enabled(), following from !iommu_enabled when !HAS_PASSTHROUGH
>> +     */
>> +    return 0;
>> +}
>> +
>> +static inline void iommu_hwdom_init(struct domain *d) {}
>> +
>> +static inline void iommu_domain_destroy(struct domain *d) {}
>> +
>> +#endif /* HAS_PASSTHROUGH */
>> +
>>   /*
>>    * The following flags are passed to map (applicable ones also to unmap)
>>    * operations, while some are passed back by lookup operations.
>> @@ -209,6 +233,8 @@ struct msi_msg;
>>   #ifdef CONFIG_HAS_DEVICE_TREE
>>   #include <xen/device_tree.h>
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +
>>   int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>>   int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>>   int iommu_dt_domain_init(struct domain *d);
>> @@ -238,6 +264,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>    */
>>   int iommu_remove_dt_device(struct dt_device_node *np);
>>   
>> +#else
>> +
>> +static inline int iommu_assign_dt_device(struct domain *d,
>> +                                         struct dt_device_node *dev)
>> +{
>> +    return -EINVAL;
>> +}
>> +
>> +static inline int iommu_add_dt_device(struct dt_device_node *np)
>> +{
>> +    return 1;
> 
> I would suggest to add a comment explain what 1 means. IIRC, this means 
> "no iommu" present.
> 
> Other than that:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Then also
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

