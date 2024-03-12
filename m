Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECD878F18
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 08:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691669.1077876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjweE-0001kW-Ik; Tue, 12 Mar 2024 07:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691669.1077876; Tue, 12 Mar 2024 07:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjweE-0001hr-Fa; Tue, 12 Mar 2024 07:34:06 +0000
Received: by outflank-mailman (input) for mailman id 691669;
 Tue, 12 Mar 2024 07:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjweD-0001hl-Dr
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 07:34:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e66fd71d-e042-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 08:34:03 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so38755266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 00:34:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m17-20020a170906721100b00a450b817705sm3532551ejk.154.2024.03.12.00.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 00:34:02 -0700 (PDT)
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
X-Inumbo-ID: e66fd71d-e042-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710228843; x=1710833643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrNpcXD6eUIWdRESCtT423UkYapmLYv0TBI81BSSLpE=;
        b=KiUjnGZ1BWXrQMoz/dKJKywBs+DIsYRFZUic2Di+JwDXNz/zdtMcEM4hGck54NsPvO
         Jjhh+W7nBZ/5SviytmISL7XHwrZPY9p4p2jGoyTm3KJlgQdy3eAHDBjvINlWP2i7fQF2
         rykKSqKLmfDkOCQesUNATQk/m6x3lpuuLmIluMvgOeiN5tNPtVf6EXwfy9YF6Uso2+wW
         zRwPm2m/+l8qwfDHnPJ2GpxfQor7j34YH6g3pFC9AY3FaYHbmT90CQUqjAd8v4Pr270N
         ATj5a2Csn8HHgI/z7JEy9/TX/PXRx7mJWTUNz7Q7wWFOHEfiD9Kow28+Hi0gbeF3ZDOg
         i7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710228843; x=1710833643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrNpcXD6eUIWdRESCtT423UkYapmLYv0TBI81BSSLpE=;
        b=Rq/IE6ptRSCKvLq8WQzpwBRhCk4mZ9/1kmxR8rX2ATog95284FVYqrRCVdZ9+M8uKE
         n4ivtFmlVtiviYABr2ULN4wlvrVFfCeyZ5YcueuoLQnBKAPta6bLKI9c4RnaTos9ooU+
         C1yO6L4w91A4bVeTbLwXt4qeP+M69ZLU4nlNQ0QhQFlEKJOEpe3MeeQUI3C/Wq2TnX4Y
         6lgOneFsufMeAFIoqKp22u2CMDlXkjgEkm9fCufJs4PH4g/Gg2V94l8Z69Wm+dXWcjYw
         W6unBl2CKDU2xzW4oZPv2lFhdJdDPqrvNN5b71D4j1j9lUH2Ey9RWSQu6zCtUVrz/9/l
         vzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqqRFzOzwTnOQ1CvzLDvN5lQIWKX2sTRXgseO2Zun1JXMjH1zGglIzFwScxJWDX3vlg12DPb+3a0Y3E36YGz6p0nnA9hYeeuuB6vPwl7A=
X-Gm-Message-State: AOJu0Yw3V44W4c2xL1OQ2tcyHX6ecFHDGSMqJBZbgoHuWopSxrdiZXkX
	WA8xBeT3PUYUx+X8BialsbKOl6f7Y4YRAc9UdlLi/2u/DYMPqgFgf6rQcUXFBw==
X-Google-Smtp-Source: AGHT+IEFQ8QjUBbADZqCQgOjb0TFFo203/77NCNxrvg2+j0ifU4XDqxNpoSdxHhb/EjB72xf84Sxbw==
X-Received: by 2002:a17:906:b18f:b0:a46:220c:a55 with SMTP id w15-20020a170906b18f00b00a46220c0a55mr3427898ejy.73.1710228842871;
        Tue, 12 Mar 2024 00:34:02 -0700 (PDT)
Message-ID: <7b9f3e46-8a70-403f-a98c-e53bea04b389@suse.com>
Date: Tue, 12 Mar 2024 08:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
 <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
 <294ff8fb-825c-4950-857a-166b65474a53@amd.com>
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
In-Reply-To: <294ff8fb-825c-4950-857a-166b65474a53@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 04:44, Henry Wang wrote:
> On 3/12/2024 1:07 AM, Jan Beulich wrote:
>> On 08.03.2024 02:54, Henry Wang wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -41,6 +41,11 @@
>>>   #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>   /* Flag to indicate the node specified is virtual node */
>>>   #define XENMEMF_vnode  (1<<18)
>>> +/*
>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>> + * or static allocation.
>>> + */
>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>   #endif
>> If this is for populate_physmap only, then other sub-ops need to reject
>> its use.
>>
>> I have to admit I'm a little wary of allocating another flag here and ...
>>
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -205,6 +205,8 @@ struct npfec {
>>>   #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>>>   #define _MEMF_no_scrub    8
>>>   #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
>>> +#define _MEMF_force_heap_alloc 9
>>> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>>>   #define _MEMF_node        16
>>>   #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>>>   #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
>> ... here - we don't have that many left. Since other sub-ops aren't
>> intended to support this flag, did you consider adding another (perhaps
>> even arch-specific) sub-op instead?
> 
> Not really, I basically followed the discussion from [1] to implement 
> this patch. However I understand your concern. Just want to make sure if 
> I understand your suggestion correctly, by "adding another sub-op" you 
> mean adding a sub-op similar as "XENMEM_populate_physmap" but only with 
> executing the "else" part I want, so we can drop the use of these two 
> added flags? Thanks!
> 
> [1] 
> https://lore.kernel.org/xen-devel/3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org/

In which case please check with Julien (and perhaps other Arm maintainers)
before deciding on whether to go this alternative route.

Jan

