Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D48AA852
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708731.1107805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhY0-0001ir-A1; Fri, 19 Apr 2024 06:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708731.1107805; Fri, 19 Apr 2024 06:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhY0-0001hL-7R; Fri, 19 Apr 2024 06:16:32 +0000
Received: by outflank-mailman (input) for mailman id 708731;
 Fri, 19 Apr 2024 06:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxhXz-0001hF-LY
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:16:31 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b5df755-fe14-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 08:16:28 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2da08b06e0dso19500931fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 23:16:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e32-20020a5d5960000000b0033ec9ddc638sm3559950wri.31.2024.04.18.23.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 23:16:27 -0700 (PDT)
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
X-Inumbo-ID: 5b5df755-fe14-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713507387; x=1714112187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1m1bw45xU791MkkSjUkpVIGbrlsbBc7ZN3voO5GNdhc=;
        b=fFc0uWShHETrpsZfCnTelc1LbQnfmSzv9dCloYDHz48jyCdNB0K2t5qAh0kunB5Y8u
         gV96TCE9Fu8bNna6//KPDqeFxHCER80jklM7/0Ynw/x215qYa2tvBCrb89BWM5zfdes7
         Qqjlne20jULSpETAR4YqpJ9GaQf5wZRw5GdWdzB3RE8dh3J++ZCQW08T5xZcEBjV3fqu
         jPSxRjXNCmyHwh2yiToFB6TYWABUflucaJrjg38eIYbEoPdrWAc7537VE9P24d0DG/9b
         DmwaKVY+GdL4WV6rzrCSt1MxZdXv/w+AyrtI5A338S+GDeZ5rwag091Xeaped0mPbt1A
         lKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713507387; x=1714112187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m1bw45xU791MkkSjUkpVIGbrlsbBc7ZN3voO5GNdhc=;
        b=pFS+Y/pYHUgcRVmBqnZXHCHMw1wjUvyHM9Eo7WfDccBriOqO1g6//R1i/bXSTBXwce
         Krlmg9XfnX1+zU/O1c6Eo9X17dgM1aNyeXQlmkypu5yKzJgxkfzIdgZztMOiplcGcsUi
         n6Dpi9bzLEbm/7FfAoozyZW0RFSH8EseSXHziI6HSl8AH9rA8HMnr4O7EZSNvDUuwpZx
         rnK2To6+9h4RJ35OMYm8ee7IbcC/VOt4MbPX6xGMk+CaLrO1pM7apnQgVUk+EfLB1jO4
         eZnvXyUfKP59gzwfTu3okFUB/lZZEQSpDVh8LCP05xZejc0yF1tUduh+6Db2CSf0sO16
         CZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXuaS9dDXA0X7J1fgI5bvTqJO/JfmeUfQrKDr2r9EUYwBP1CCoBXegRj8uxMT836qVe4mozGNHHy4LHcDIvVXr5iXZ+zByYTZJIyy2c6f4=
X-Gm-Message-State: AOJu0Yzv65wgcQDGaRCXPcXHiE+qbg6tFLJ0Nj12f/UCzeJ4OfypqDxA
	OUUPdcdoKzdzwc7R8fm1YLwaajMoNtgl8Y11othDKhbcZXYFHOBVutbByY4LPg==
X-Google-Smtp-Source: AGHT+IHN9eYeaJZFlMj5WgvcoLuV3cst3xn3AnQg3Uqc8E8Oj6UgONScWLgUIg6kv1ksDr0TCnhIuQ==
X-Received: by 2002:a2e:9687:0:b0:2d6:cbf2:ed2b with SMTP id q7-20020a2e9687000000b002d6cbf2ed2bmr628567lji.30.1713507387535;
        Thu, 18 Apr 2024 23:16:27 -0700 (PDT)
Message-ID: <ce455101-ea44-412e-bcea-a216e2acc350@suse.com>
Date: Fri, 19 Apr 2024 08:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-2-xin.wang2@amd.com>
 <e3f7b726-f7df-4aee-b69f-638cf492d18b@suse.com>
 <2e273d57-cd9b-4e05-a9c4-bd9782884e23@amd.com>
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
In-Reply-To: <2e273d57-cd9b-4e05-a9c4-bd9782884e23@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.04.2024 04:27, Henry Wang wrote:
> On 4/18/2024 8:37 PM, Jan Beulich wrote:
>> On 09.04.2024 06:53, Henry Wang wrote:
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -223,6 +223,13 @@ typedef uint64_t xen_pfn_t;
>>>    */
>>>   #define XEN_LEGACY_MAX_VCPUS 1
>>>   
>>> +/*
>>> + * Maximum number of memory map regions for guest memory layout.
>>> + * Used by XEN_DOMCTL_get_mem_map, currently there is only one region
>>> + * for the guest magic pages.
>>> + */
>>> +#define XEN_MAX_MEM_REGIONS 1
>> Why is this in the public header? I can only find Xen-internal uses.
> 
> It will also be used in the init-dom0less app which is the toolstack side.

I've looked there. It's only a convenience to use it there. Imo you want to
do the buffer sizing dynamically (utilizing the change to the hypercall
implementation that I talked you into) and drop this constant from the
public interface.

Jan

