Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742D84F7D7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 15:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678733.1056226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYS78-0008R2-9l; Fri, 09 Feb 2024 14:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678733.1056226; Fri, 09 Feb 2024 14:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYS78-0008Of-70; Fri, 09 Feb 2024 14:44:26 +0000
Received: by outflank-mailman (input) for mailman id 678733;
 Fri, 09 Feb 2024 14:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rYS77-0008OZ-Ft
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 14:44:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6cfae60-c759-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 15:44:23 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41068e36cbbso5686685e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 06:44:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfcc86000000b0033afb963d0dsm1965253wrj.101.2024.02.09.06.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 06:44:22 -0800 (PST)
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
X-Inumbo-ID: b6cfae60-c759-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707489862; x=1708094662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3Yj7hO4QutSZqSdyo1ZNc+oTsKD4Eomw49ZUTIRolA=;
        b=bvk7ZAbKkTDTYMnHRjBsTzj7uZlNzJ+eoLdh1Wd6yZyASIiUDF5Uwpkq7L0wtACCir
         sWhGbc4mdsvfnd8EoAAc4kA6IZ8epxf3HIYPRWwR0ew27MynCMrW2nsCtksk1BkHeX+z
         +dTnsK7u7mvtVi1owvwbS1GSfQnETZQasCJnvb4vPaQlI80YlGjAKJTrJ0FQGEkqlVoI
         MSJA0iBnH927UfpdJ+s3diwxQgK4MiGhpYn60eVFE3kOi7S31O5dcvsVOtKQU+v5wwP+
         ab5zJmqWlapfbJZq1ipSn/h5YcMhraON1wSjL/XK5jvG1ogekEfdHlZDpt9IgmW79ADw
         reVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489862; x=1708094662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3Yj7hO4QutSZqSdyo1ZNc+oTsKD4Eomw49ZUTIRolA=;
        b=f7h+8m+to9sBtuirRPh5Ch5y6/5ZIzbiWsC9GwZU6QYpChyUoGEkyI9T9GaQhW0DFo
         ENAp5Ksp+iymS5qSuutpDUBcaktpjh4Z0defp5OIkhRFQDYTsXlPdCqmT5zcSspils0o
         UwQ7eCxZbs98szLo+VXRTjsPdYRotZoHnvTXUYBxNL5GD9qktiBU6v0kf5vLSZ6Enuix
         bc4hvFqlwd1PpdJn76lvcMqM8jBx6KhuzNpTftyKXGBpNbVxv2qw26y03Kfaw9W5u8nk
         TOAOsD/R5kJ9CCk4PPy2nnWEwZdiBu/G+EEDHXpN/8e3Eye4t1DrPGZJAJxjqQmat7PQ
         lX5g==
X-Gm-Message-State: AOJu0YwrFGBDViLmlGbefIb18PHohaGczNPIxcO4WcMhxKQAurm0uR0H
	xv3bO30evLZNy9r0ouOphb1ds0ISqiZVq2At2G3logOkZAcYpa73vgqs312I2Q==
X-Google-Smtp-Source: AGHT+IFueh0D+GOWMixyDaV3FDC80b7a5zZIwWVjD+liFaVSmCBP5njLHbpXK5LvQPRzZMHyonFmEw==
X-Received: by 2002:a05:600c:3d97:b0:40f:e806:2f19 with SMTP id bi23-20020a05600c3d9700b0040fe8062f19mr1642822wmb.22.1707489862377;
        Fri, 09 Feb 2024 06:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1lJsHYrv2gf15lpbCN/IZ1SZasveslzAbbahxHRlMReJAtAxioSVU0WlVb4c7jrvJQ26BStecsUVqL/MAmOJhJ4WVHmYR4Sw6zsBW20gAWnPE
Message-ID: <5a495da2-f012-4411-8620-7e765a92bd1b@suse.com>
Date: Fri, 9 Feb 2024 15:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] VT-d: move dev_invalidate_iotlb() to the sole file
 it's used from
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <0d14f148-32e0-4dac-b5e8-3230adfc5f9d@suse.com> <ZcXhauUax5WHD93J@macbook>
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
In-Reply-To: <ZcXhauUax5WHD93J@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.02.2024 09:25, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:57:12PM +0100, Jan Beulich wrote:
>> ..., thus allowing it and qinval_device_iotlb_sync() to become static.
>> There's nothing x86-specific about the function anyway. While moving,
>> adjust types to better match ./CODING_STYLE (albeit use of fixed-width
>> types for parameters is retained to limit the effective change).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> +static int dev_invalidate_iotlb(struct vtd_iommu *iommu, uint16_t did,
>> +                                paddr_t addr, unsigned int size_order,
>> +                                uint64_t type)
>> +{
>> +    struct pci_dev *pdev, *temp;
>> +    int ret = 0;
>> +
>> +    if ( !ecap_dev_iotlb(iommu->ecap) )
>> +        return ret;
>> +
>> +    list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
>> +    {
>> +        bool sbit;
>> +        int rc = 0;
>> +
>> +        switch ( type )
>> +        {
>> +        case DMA_TLB_DSI_FLUSH:
>> +            if ( !device_in_domain(iommu, pdev, did) )
>> +                break;
>> +            /* fall through if DSI condition met */
>> +        case DMA_TLB_GLOBAL_FLUSH:
>> +            /* invalidate all translations: sbit=1,bit_63=0,bit[62:12]=1 */
>> +            sbit = 1;
>> +            addr = (~0UL << PAGE_SHIFT_4K) & 0x7FFFFFFFFFFFFFFF;
> 
> Given the MISRA stuff, won't it be better to append 'UL' here while
> moving?

Sure, done.

Jan

