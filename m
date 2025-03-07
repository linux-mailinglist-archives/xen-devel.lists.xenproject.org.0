Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F6A56434
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904817.1312636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUHO-0007EF-5e; Fri, 07 Mar 2025 09:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904817.1312636; Fri, 07 Mar 2025 09:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqUHO-0007Br-2o; Fri, 07 Mar 2025 09:46:06 +0000
Received: by outflank-mailman (input) for mailman id 904817;
 Fri, 07 Mar 2025 09:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqUHN-0007Bl-0l
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:46:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa906c71-fb38-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 10:46:01 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so18036075e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 01:46:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bcbcbe64fsm71740575e9.0.2025.03.07.01.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 01:46:00 -0800 (PST)
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
X-Inumbo-ID: fa906c71-fb38-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741340761; x=1741945561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4W6pX3E98C87U4EFHMStWMN+RiCAN79IXQGEvb8aLu8=;
        b=NDC2D97ZjGghj2DnSFXAptiUW5kSESzeO2jIzrV+dihCq0n/0okH8iPmXsaTKE3dQZ
         vn7weUyZHrmuk9mBq0l1+0FZSZkqDXFh5EOdKCKGUULZ53BGsJWVBwsYc9C2BjyDxYTt
         DnhsxQZPq1A13Mj8iKo2YHUQXHCDWPpup7ADE3corCHcDCFY6GVIO3mX1BaOajDeI2Re
         fMjfN7l6d+pQY/dICMYisDAepvXA9PGRXAcpu14WqAiP2Vyd2slVGUqZ2pUz3jq3fr1W
         B1+bOVzySlxDkIfJK+2zadIDuS2in0FlU9uY0MR8qSRnJeRLPmjJHEYAMdfjhGqvS+vQ
         ukDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741340761; x=1741945561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W6pX3E98C87U4EFHMStWMN+RiCAN79IXQGEvb8aLu8=;
        b=mava6h1akmIHqGva2CvgorhBGywY2HhRj9neHBu0m+9FhNFiyfKwxE4EZZbyzijY3a
         42fSuwjn51axwJmR8E5y3N5kpysJ6iuPB7p2j9P843ILv3a0rp3ndifb8Hf1DUe+zC/w
         XUlmw1lLWaotZSOvPpk5HkF57Ur0p0dd3KBspGMYPuuvWZ53W5ju6Q23o+1qzmaYQKp9
         RI+U5cuxZ4hoJV3qYl5CqMIUE6E7/DDTkwpG1rREf/nOFtvpJ1RVuXITt+61pRq+ihMj
         /dox82rsvD7Kfa4deYhaGUPM7+GEICxODlDonpYcT+P/NkSB0r+xHZ6+UiAtqwCQqNl+
         9yLg==
X-Gm-Message-State: AOJu0Yw911hc0Fpzy1k80mUpqudWqc/jQ7ud82UPj+YHi7qGZS7lV4Bn
	3xoJ3GLwKT7T4xUk9GnTbZgSo/dvIeaMJIr/xMk00X91qNS8MLjPuUFHxjJr6g==
X-Gm-Gg: ASbGnctk6CwFCYbz0N8g6M8FVDbCe8gtuscEscwDXVA2+150q/TlPt3tQUwnG0ylr9n
	pZOIfm58QekwL7hsHtWHadWM07z3miw0YAqyl8OLXkx7fb27Chesz/wlCZxBRul3RKlM6hy7/GF
	LWuy21U7Pw+Fc/nGSvWHZP/xi/AbnAfOnc7eeOH0MptQch3to0OSuzf6ut8uEvW3w7LyWJ3PPGy
	N8PUBKwDhGTIdLwc/wpNpbyWJIG8Tf8T+LwadNIp5kZqlt7F1nUA7F7mozJXMzVzXYA7fTfbYfp
	/leL+Lfp+URwKbcsjJmU6BKVeZ+EqklLTtl95NrPrzPIi7vqwWUPuI446yepL8fG/iSc7kFm+oN
	ljmYbQoD9n0Bg04anwbcHqGr7mn952g==
X-Google-Smtp-Source: AGHT+IEr92KhGuc9/ENtlyaZeoemPjdIGwgcUEKsgyXU0ooMcGKhxnoGtOpHmuNBjKjBO4qibCRLdw==
X-Received: by 2002:a05:600c:5103:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43c601cf53amr25915405e9.14.1741340760538;
        Fri, 07 Mar 2025 01:46:00 -0800 (PST)
Message-ID: <cc4c694c-9d31-4239-a469-18580d74d35a@suse.com>
Date: Fri, 7 Mar 2025 10:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
 <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
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
In-Reply-To: <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2025 10:20, Luca Fancellu wrote:
> Hi Julien,
> 
>> On 7 Mar 2025, at 09:09, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 07/03/2025 07:58, Luca Fancellu wrote:
>>> When Xen is built without HAS_PASSTHROUGH, there are some parts
>>> in arm where iommu_* functions are called in the codebase, but
>>> their implementation is under xen/drivers/passthrough that is
>>> not built.
>>> So provide some stub for these functions in order to build Xen
>>> when !HAS_PASSTHROUGH, which is the case for example on systems
>>> with MPU support.
>>> For gnttab_need_iommu_mapping() in the Arm part, modify the macro
>>> to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.
>>> Fixes: 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v4 changes:
>>>  - re-introduced stub for iommu_use_hap_pt, Stefano suggested
>>>    it is ok to have it in iommu.h.
>>>  - Reworded comment in iommu_domain_init from Jan suggestion
>>> v3 Changes:
>>>  - removed stub for iommu_use_hap_pt, another solution will be
>>>    done for the instance in common arm code.
>>>  - Moved a comment close to the macro it was referred to
>>>  - add comment to iommu_domain_init() stub
>>>  - modified commit message
>>>  - Add fixes tag
>>> v2 Changes:
>>>  - modify gnttab_need_iommu_mapping to use IS_ENABLED
>>>  - removed macro that didn't allow some of the parameter to be
>>>    evaluated
>>>  - Changed commit message
>>> ---
>>> ---
>>>  xen/arch/arm/include/asm/grant_table.h |  5 +--
>>>  xen/include/xen/iommu.h                | 50 +++++++++++++++++++++++++-
>>>  2 files changed, 52 insertions(+), 3 deletions(-)
>>> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
>>> index d3c518a926b9..c5d87b60c4df 100644
>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>> @@ -73,8 +73,9 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>>>  #define gnttab_status_gfn(d, t, i)                                       \
>>>      page_get_xenheap_gfn(gnttab_status_page(t, i))
>>>  -#define gnttab_need_iommu_mapping(d)                    \
>>> -    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>> +#define gnttab_need_iommu_mapping(d)                                     \
>>> +    (IS_ENABLED(CONFIG_HAS_PASSTHROUGH) && is_domain_direct_mapped(d) && \
>>> +     is_iommu_enabled(d))
>>>    #endif /* __ASM_GRANT_TABLE_H__ */
>>>  /*
>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>> index 77a514019cc6..5ac038521e23 100644
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>>>    extern unsigned int iommu_dev_iotlb_timeout;
>>>  +#ifdef CONFIG_HAS_PASSTHROUGH
>>> +
>>>  int iommu_setup(void);
>>>  int iommu_hardware_setup(void);
>>>  @@ -122,6 +124,28 @@ int arch_iommu_domain_init(struct domain *d);
>>>  void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>>>  void arch_iommu_hwdom_init(struct domain *d);
>>>  +#else
>>> +
>>> +static inline int iommu_setup(void)
>>> +{
>>> +    return -ENODEV;
>>> +}
>>> +
>>> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
>>> +{
>>> +    /*
>>> +     * Return as the real iommu_domain_init() would: Success when
>>> +     * !is_iommu_enabled(), following from !iommu_enabled when !HAS_PASSTHROUGH
>>> +     */
>>> +    return 0;
>>> +}
>>> +
>>> +static inline void iommu_hwdom_init(struct domain *d) {}
>>> +
>>> +static inline void iommu_domain_destroy(struct domain *d) {}
>>> +
>>> +#endif /* HAS_PASSTHROUGH */
>>> +
>>>  /*
>>>   * The following flags are passed to map (applicable ones also to unmap)
>>>   * operations, while some are passed back by lookup operations.
>>> @@ -209,6 +233,8 @@ struct msi_msg;
>>>  #ifdef CONFIG_HAS_DEVICE_TREE
>>>  #include <xen/device_tree.h>
>>>  +#ifdef CONFIG_HAS_PASSTHROUGH
>>> +
>>>  int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>  int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>  int iommu_dt_domain_init(struct domain *d);
>>> @@ -238,6 +264,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>   */
>>>  int iommu_remove_dt_device(struct dt_device_node *np);
>>>  +#else
>>> +
>>> +static inline int iommu_assign_dt_device(struct domain *d,
>>> +                                         struct dt_device_node *dev)
>>> +{
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static inline int iommu_add_dt_device(struct dt_device_node *np)
>>> +{
>>> +    return 1;
>>
>> I would suggest to add a comment explain what 1 means. IIRC, this means "no iommu" present.
> 
> Would it be ok something like in iommu_domain_init:
> 
> /*
>  * Returns as the real iommu_add_dt_device() would: Error “no iommu" because
>  * !iommu_enabled due to the fact that !HAS_PASSTHROUGH
>  */

We had been there before, hadn't we? Personally I find the suggested text
hard to follow. How about

    /*
     * !HAS_PASSTHROUGH => !iommu_enabled (see the non-stub
     * iommu_add_dt_device())
     */

If that's too terse, adding a few words should be fine.

Jan

