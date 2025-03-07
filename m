Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3583A56771
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 13:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904969.1312747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWPp-0006Es-9W; Fri, 07 Mar 2025 12:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904969.1312747; Fri, 07 Mar 2025 12:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqWPp-0006CP-6Z; Fri, 07 Mar 2025 12:02:57 +0000
Received: by outflank-mailman (input) for mailman id 904969;
 Fri, 07 Mar 2025 12:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqWPo-0006CH-43
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 12:02:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a32f59c-fb4c-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 13:02:55 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bdcd0d97dso10006905e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 04:02:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c015d1csm5057822f8f.44.2025.03.07.04.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:02:53 -0800 (PST)
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
X-Inumbo-ID: 1a32f59c-fb4c-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741348974; x=1741953774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pN5nrAwn2fzCZ1r0R5lcDNw58qTDSLSmSVYAfxI1/0U=;
        b=UcVHp1ldSoSEUN/R6qjKTP0Nr3GWUI5vDSEIFpyyzWwkoK6NpW9Jwp0eX+QoQYmjXt
         nzZ7J1bN5NmsuuvgEPDu1HI2qXAh7XMrEl2+E8wcMrFwRCikBNrhdGhARJpnjbHQ1M+e
         Hf68YpJgDY0Liwzo1yZ460CSaKfLWKk4pFTt7oMohIelaXVqmhXyTQsq4MzjySxGoSDH
         yAZYc+hPcQbU6pwGMoqbMSGAzaiPHWoE1oshNgiqwN1Xzh/m7jtXdo2JRigL5DzIwVzw
         2SlY62MWkT95X+nE2Yy8BMcsSrg69QmKDwQY6sdIpumCKj1HagJKbsP2Z2ecGEHHPoi1
         iWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348974; x=1741953774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN5nrAwn2fzCZ1r0R5lcDNw58qTDSLSmSVYAfxI1/0U=;
        b=wMr8lkmbgY8y0WC5esRhZMPp4VzajFfg15H3UC6/Ty4v80fj8vwnBOhqx4GxAUVZCY
         Ti3/Zp/UUh5SgsHDlRhwdogEO+2c0WeGdca8j63ckt7fqHo7Iecl7iUnuTXNjMS5ercQ
         Rv9HVjiOMzINpP6s6Z2numicL8pNm2af5uQee/dbQi6qDQwtR3vr0pNv4kHolK5JgM2n
         65vo/qPFgQneM63UZA10eqy9TOUJSniJx4x2sUjEgEqztZYT0lA1SmVJ6493AXAIDQqG
         U4inWoKhENQCOInmEivSGACZC3kwL7IrcNjzEuccFAyiveFNpcJMh6MsWD0SfxRXvBvK
         uVsw==
X-Forwarded-Encrypted: i=1; AJvYcCUbHt6GCfDRWPKEIQzsd29lmnPSThFCoj/vs3t33oynMr79Umqpqpot0DxlyRvNu/VsxO49e+5sBXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYSY9g7P4QgWpOgWVC1FwLYEZP6GtMT54joma5HFg7TBgmhhgl
	liC4qC/wuHQ7+XOjDAQrlzgacjq0euSX01xvv43kUeLzxXA8efJ46UxHMiQP9A==
X-Gm-Gg: ASbGncuuCdbfl7WHC7+NpIdMRDHteqG9yVqtlWSiAUoBJ8UHgtBnT/FpA1TkktApHkb
	bYXOHi9FM5FvVO5BPai7Vbyqq7/8S8bC5jBBJ3SIgahY4YEpbp97fl65RylHzLhLUIx9sCv0CXE
	PQTo1m/umzTKVZ9mp/xqTku8YifNrs9bflCPz9ICwo5oDZBY8Xk2/SgfwTqwD46xks3HDtJKH1z
	3F+0TrbNKTck70pTGslK2GA4QNnl6rxeIEJYFgFUnZt/q4j0LPzZDuYKxpSOjBIq9wvcql7inl1
	+cvA0ociEI4SBHL7xijmpHMy38d+RtK+m4kyGXUTI9uvRdJz/UU0cgJyuxdrBwvDqtrPmlS2YCw
	a+/emzr4oTr3mhly02n80zRhQVS0Hbg==
X-Google-Smtp-Source: AGHT+IGjlg2oResXOCCANO0t/Q1utFTcD0DxPhWdGOQj8GYLMy7jzkxFtYjWpWlq5f+EgllcImyTAg==
X-Received: by 2002:a05:600c:1c85:b0:43b:d531:ca94 with SMTP id 5b1f17b1804b1-43c601cdb67mr19719025e9.3.1741348974209;
        Fri, 07 Mar 2025 04:02:54 -0800 (PST)
Message-ID: <e5924368-4474-456a-a805-78b34ca31776@suse.com>
Date: Fri, 7 Mar 2025 13:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
 <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
 <cc4c694c-9d31-4239-a469-18580d74d35a@suse.com>
 <FD7FAEC0-2678-450E-A85F-24ADFEEE1B03@arm.com>
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
In-Reply-To: <FD7FAEC0-2678-450E-A85F-24ADFEEE1B03@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2025 12:23, Luca Fancellu wrote:
>>>>> +
>>>>> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
>>>>> +{
>>>>> +    /*
>>>>> +     * Return as the real iommu_domain_init() would: Success when
>>>>> +     * !is_iommu_enabled(), following from !iommu_enabled when !HAS_PASSTHROUGH
>>>>> +     */
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static inline void iommu_hwdom_init(struct domain *d) {}
>>>>> +
>>>>> +static inline void iommu_domain_destroy(struct domain *d) {}
>>>>> +
>>>>> +#endif /* HAS_PASSTHROUGH */
>>>>> +
>>>>> /*
>>>>>  * The following flags are passed to map (applicable ones also to unmap)
>>>>>  * operations, while some are passed back by lookup operations.
>>>>> @@ -209,6 +233,8 @@ struct msi_msg;
>>>>> #ifdef CONFIG_HAS_DEVICE_TREE
>>>>> #include <xen/device_tree.h>
>>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>> +
>>>>> int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>>> int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>>>>> int iommu_dt_domain_init(struct domain *d);
>>>>> @@ -238,6 +264,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>  */
>>>>> int iommu_remove_dt_device(struct dt_device_node *np);
>>>>> +#else
>>>>> +
>>>>> +static inline int iommu_assign_dt_device(struct domain *d,
>>>>> +                                         struct dt_device_node *dev)
>>>>> +{
>>>>> +    return -EINVAL;
>>>>> +}
>>>>> +
>>>>> +static inline int iommu_add_dt_device(struct dt_device_node *np)
>>>>> +{
>>>>> +    return 1;
>>>>
>>>> I would suggest to add a comment explain what 1 means. IIRC, this means "no iommu" present.
>>>
>>> Would it be ok something like in iommu_domain_init:
>>>
>>> /*
>>> * Returns as the real iommu_add_dt_device() would: Error “no iommu" because
>>> * !iommu_enabled due to the fact that !HAS_PASSTHROUGH
>>> */
>>
>> We had been there before, hadn't we? Personally I find the suggested text
>> hard to follow.
> 
> well, I’ve taken your suggestion for iommu_domain_init and adapted here, 
> maybe the adaptation didn’t meet your criteria then :)

I wasn't overly happy with that other comment either.

> But ...
> 
>> How about
>>
>>    /*
>>     * !HAS_PASSTHROUGH => !iommu_enabled (see the non-stub
>>     * iommu_add_dt_device())
>>     */
>>
>> If that's too terse, adding a few words should be fine.
> 
> as long as you are happy with that, I’m happy as well, please let me know
> if you want a v5 with this or if you would do the modificaiton on commit.

I first need to get to looking at v4 as a whole.

Jan

