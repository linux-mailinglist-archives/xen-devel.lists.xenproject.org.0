Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC9879285
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:54:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691760.1078068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzlY-0004UZ-Ru; Tue, 12 Mar 2024 10:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691760.1078068; Tue, 12 Mar 2024 10:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzlY-0004T3-P2; Tue, 12 Mar 2024 10:53:52 +0000
Received: by outflank-mailman (input) for mailman id 691760;
 Tue, 12 Mar 2024 10:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjzlW-0004Sx-Pl
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:53:50 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce084821-e05e-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 11:53:48 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so511109066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:53:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm3719489eja.106.2024.03.12.03.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:53:47 -0700 (PDT)
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
X-Inumbo-ID: ce084821-e05e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710240828; x=1710845628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rojXMfHXApf8EGOHWtgacoTXPjnXkQP6vbQTBrXJBA=;
        b=bN7uQc0DIlOFx6kpT/UUgT9ChvqPhBvQq1e2bQtUupHVtUurX6qTp9Ni76qHWkFtu5
         l752pwVSWktLBToN6q7kxwnD0X/ya2OMRUHxjVoW2eZauc53L2AAK2OHEvdDqv3jePZe
         kp2P63/v5Q/2TvkuFwCM9Cbs9u87lyjKt1UUkmQjw+aDmbnZ0uATIO29Uenwkzwnxw6K
         Qy2wCjgJiDrL7QHMCmKYYq+HR/j60cT1RVVxFBsJOm/XFsIYMWDrXEsu7wgMtOkN0ome
         KZdugXa1Z5U9BJ43li4SwwGmMMvKivR/d/tIJZdTp0OptYWsWDtHP71YZw42Ebw/BAnk
         FXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240828; x=1710845628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rojXMfHXApf8EGOHWtgacoTXPjnXkQP6vbQTBrXJBA=;
        b=MYd1qlxeM6GCC1r8VugdKBVD7MsCpcxwBYKUnqXIUICjdDPQqJBPO0W/YLoQtYpOQV
         HvkRICa0tR787iUVLPMP294Q0713ItmL/mvzt9Cc/lbdRJh2KFwhM3h4FsDsY9wPko9g
         nKVEof75xJiiN6DQrr3E+c4VIaz0gYfb0E9ThhCwkZe6NpKptakwNCq7kGMuGlbQfWGW
         oWnpPoMkJ//Ms99R5YyOuic8tGhmj2BgcuWgpnAaMSMmr8KNPMEMi1KU99cmL7yPEZ2a
         8lYNgMakiX14gGwYYx901Ic5b23D52DpLcWirh8fQksiEv0JXpLHHri9JF6U300dRcXs
         hqPg==
X-Gm-Message-State: AOJu0YzxN/Q3PGbqMc8COTPuNAK676SI5qje6hlWY4DlcQEu09tu7rBT
	VBsULO/iR5hC5BKJM8dmfzOjzr1fNbD8PERdHAdTlTJUq82iHzOqG7lAp0wI7A==
X-Google-Smtp-Source: AGHT+IGgZQJ0JPYFoWVYHjujLovk/rKXJJzrgrqi4AFrfdCp9sNVKh8sFbV+Nd920ALC50PRV4tkHQ==
X-Received: by 2002:a17:906:6d0e:b0:a46:2aa1:1d with SMTP id m14-20020a1709066d0e00b00a462aa1001dmr2950174ejr.8.1710240827983;
        Tue, 12 Mar 2024 03:53:47 -0700 (PDT)
Message-ID: <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
Date: Tue, 12 Mar 2024 11:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
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
In-Reply-To: <ZfAtahcXWGqckQFW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2024 11:24, Roger Pau Monné wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>                                    RANGESETF_prettyprint_hex);
>>  
>> +    /* Needs to happen after E820 processing but before IOMMU init */
>> +    xhci_dbc_uart_reserve_ram();
> 
> Overall it might be better if some generic solution for all users of
> iommu_add_extra_reserved_device_memory() could be implemented,

+1

> but I'm
> unsure whether the intention is for the interface to always be used
> against RAM.

I think we can work from that assumption for now.

Jan

