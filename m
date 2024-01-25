Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B982683C48A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671557.1044953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0YK-0008Hm-Cf; Thu, 25 Jan 2024 14:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671557.1044953; Thu, 25 Jan 2024 14:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0YK-0008FN-A3; Thu, 25 Jan 2024 14:18:00 +0000
Received: by outflank-mailman (input) for mailman id 671557;
 Thu, 25 Jan 2024 14:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0YI-0008FH-OG
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:17:58 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89cb61b0-bb8c-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 15:17:57 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cf1524cb17so35162571fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:17:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ck12-20020a056e02370c00b003627a7f95a7sm3152941ilb.0.2024.01.25.06.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:17:56 -0800 (PST)
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
X-Inumbo-ID: 89cb61b0-bb8c-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706192277; x=1706797077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5fQXMPxMD8d8Klb1wbUEWroUKuBsn+nFLixeJAmMys=;
        b=DIjgRlMz2XuRzBy55fPIovZMuPSeNNSA2Pf77dc6vtL/79sK77ZSRW4aOKIMgjk5If
         lwIBEI+XKhhIzQLAbuI86bqRze29nKtQz9KoML+1++vcnw5ru0gGFZr4n6RZ4/sC0HKb
         3/a1YTDSEsu8I7IYIURfgzeW8+Yc7H548FfJz6SB5BzK+1U31mVLV8eAvlszjFpmiKQ3
         ncGvRxPK0UwwfTrFRDkDPeqAqUSXpyKXhhdW9wt7FUJ64xjDq0OimPcqEI4ToDsHi2d3
         3O3x/JnXBw3Zy2LYtlqrVHHFm0tCDEbXWHIkXgHlr9UKUqGCpnOWf3a4CU/gttax/56V
         w2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706192277; x=1706797077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5fQXMPxMD8d8Klb1wbUEWroUKuBsn+nFLixeJAmMys=;
        b=FNAWubIT9pVthATXhKhI3IMqZa52hjPOLAQinCy6dJru7h1t97y9WRaoxcN1x/qWNs
         5GEH7hKK5xs2FOlz9375+Rk1k4AHaBX4rcy6MsNS1pw2Wo4tHBUucfNrkB6B/NaZHhtb
         T2KWMg/RPSP81UKOFtivLtFnVph0BNIgyO8cYqF1uG4HdGPVNROG+EBKR6xNAVQQx66m
         p+XnT1RwfYumx/rBhhLass5wHMMMUxsqpBYYoIamLZTE4gdb4mOi6heEMXq25S5aFfkE
         gSZtViuJLi7siM+8mCpqueHoOT2Qjf4SKEpo81OclQMW9G3v8Ooz9aitkhcWIdBs2d45
         9gyQ==
X-Gm-Message-State: AOJu0YzWGn/4SGlpDyBJ/1/J2DWE3tU4Kp9MOZEQYetm7mkxx9+KDIb8
	uOFChcAZ8QuqpfY/PKlPVKZe5m2UuoH2BPnce+K6yEPmP54LbLFs3TTW/KWbLA==
X-Google-Smtp-Source: AGHT+IHHn1IECyxt7jsjj6zdwojDaJKS6OyOvWzDPZTgjn/xWwMtYN1IyUI0T7RsMQxvdj9q+b9GjA==
X-Received: by 2002:a2e:9158:0:b0:2cf:3238:ebe3 with SMTP id q24-20020a2e9158000000b002cf3238ebe3mr494846ljg.55.1706192277336;
        Thu, 25 Jan 2024 06:17:57 -0800 (PST)
Message-ID: <719c3002-46f8-47de-afd7-c17fded0e4e6@suse.com>
Date: Thu, 25 Jan 2024 15:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/iommu: switch hwdom IOMMU to use a rangeset
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-3-roger.pau@citrix.com>
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
In-Reply-To: <20240124172953.29814-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 18:29, Roger Pau Monne wrote:
> The current loop that iterates from 0 to the maximum RAM address in order to
> setup the IOMMU mappings is highly inefficient, and it will get worse as the
> amount of RAM increases.  It's also not accounting for any reserved regions
> past the last RAM address.
> 
> Instead of iterating over memory addresses, iterate over the memory map regions
> and use a rangeset in order to keep track of which ranges need to be identity
> mapped in the hardware domain physical address space.
> 
> On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
> arch_iommu_hwdom_init() in nanoseconds is:
> 
> x old
> + new
>     N           Min           Max        Median           Avg        Stddev
> x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
> +   5       1025012       1033036       1026188     1028276.2     3623.1194
> Difference at 95.0% confidence
>         -2.26214e+10 +/- 4.42931e+08
>         -99.9955% +/- 9.05152e-05%
>         (Student's t, pooled s = 3.03701e+08)
> 
> Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.
> 
> Note there's a change for HVM domains (ie: PVH dom0) that get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't
> allow creating read-only mappings, but so far there are no such mappings
> created for PVH dom0 in arch_iommu_hwdom_init().
> 
> No change intended in the resulting mappings that a hardware domain gets.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



