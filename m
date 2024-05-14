Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D558C4D6E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721197.1124405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6n8I-0000Cu-B9; Tue, 14 May 2024 08:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721197.1124405; Tue, 14 May 2024 08:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6n8I-0000BE-8C; Tue, 14 May 2024 08:03:34 +0000
Received: by outflank-mailman (input) for mailman id 721197;
 Tue, 14 May 2024 08:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6n8F-0000Ac-WE
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:03:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f169b24-11c8-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:03:22 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a88339780so62548066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:03:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf91sm691714166b.1.2024.05.14.01.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:03:23 -0700 (PDT)
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
X-Inumbo-ID: 6f169b24-11c8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715673804; x=1716278604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1LY1qdhRQMDOmOQYsJeYpKNF6BoOvEzcGeZU9pEyvA=;
        b=SD79d1vdQmQDkFni4NG/Heymy6kQLmx2zdqMvHGwa3+K8/0X9J/+OgSkVtxksY+n1D
         orC/NYifRspzRBr30FIwdpqiTy7kr75XCB/1IcAS6MIEcegpvqQdcRVBnLx3hFn+srYk
         TCanaXYN9ta8WabBkQ80gbv4uqsZE3ywfEt95olagjIhlBdGhYRE6c9rSDHEjAI0pLRm
         ya6sP13YP8/0cv2XvVVE6xmz638GW3R+uXIrExaba9czdkCms695OmOfnehTH9LSKDpt
         r9EjFZW3gHvuNdhgKEa/pp/ZB0h3ZO+7t81sLLYs8wHXmd13qZy+Y0qk8LiZdWbFNrR8
         4fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673804; x=1716278604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1LY1qdhRQMDOmOQYsJeYpKNF6BoOvEzcGeZU9pEyvA=;
        b=TrSTPWjBrXDq6Hf0BNeO9IIZm+7AkJZFIh+0ll71flJAn6Kj1nt8otilCL3XXW5xTk
         U57GSi0A2hBPjclnT5MHAdxSBc9BxCZs7b41T79v5FtTVGwuO09GSOfekFEhyPwJWvVZ
         o4lIXjDmPn8WfKHfOCKGER3y8jl+/KL0f789qN0jEoFU29sfvdG4fDO7YrV7YlJcBnjE
         mCRM+JZJs48H53gju5b6OsnBFuKCU+1A9UCZoG5TYRXwFkwBkXtwPliokA21PRub9T7k
         ImSJmgmGy9nQgc6QfxY2mWAjgEeTS0lcr2rN+gHBDYCD7A8AtAPL45qX3FJ06dbN5s/6
         ImtA==
X-Gm-Message-State: AOJu0YwAbawf9/aBb4kwNcXxo8fAetrCSe1iizgUUx7ULPwHZ16L2O7n
	8URoi9c72YlPsLKTbkyBwLkgh1O87TNPYRG6i+FR0Mqh4v5sxBpXmzzRyPiVnQ==
X-Google-Smtp-Source: AGHT+IE6zymnrKmqHJ+7ljBSFMQD6NG0f7VxTiRwiD7lJ3PzB0CSs0318JVuU8uOf/9EdpUWIktp8g==
X-Received: by 2002:a17:906:fe4a:b0:a59:a8a4:a59d with SMTP id a640c23a62f3a-a5a2d66aa6dmr908319466b.62.1715673804137;
        Tue, 14 May 2024 01:03:24 -0700 (PDT)
Message-ID: <7998ecee-659d-4180-8b14-110c2907021f@suse.com>
Date: Tue, 14 May 2024 10:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 01/19] x86: Create per-domain mapping of guest_root_pt
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
 <20240513111117.68828-2-eliasely@amazon.com> <ZkIxdtiDc_pnPWdx@macbook>
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
In-Reply-To: <ZkIxdtiDc_pnPWdx@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2024 17:27, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 11:10:59AM +0000, Elias El Yandouzi wrote:
>> @@ -317,6 +317,14 @@ extern unsigned long xen_phys_start;
>>  #define ARG_XLAT_START(v)        \
>>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>>  
>> +/* pv_root_pt mapping area. The fourth per-domain-mapping sub-area */
>> +#define PV_ROOT_PT_MAPPING_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
>> +#define PV_ROOT_PT_MAPPING_ENTRIES      MAX_VIRT_CPUS
>> +
>> +/* The address of a particular VCPU's PV_ROOT_PT */
>> +#define PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v) \
>> +    (PV_ROOT_PT_MAPPING_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
> 
> I know we are not there yet, but I wonder if we need to start having
> some non-shared per-cpu mapping area in the page-tables.  Right now
> this is shared between all the vCPUs, as it's per-domain space
> (instead of per-vCPU).

In turn requiring per-vCPU page tables, posing a problem when a guest
uses the same page tables for multiple vCPU-s.

Jan

