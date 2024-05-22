Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90768CBEF6
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 12:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727443.1131915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iqX-0003kj-7L; Wed, 22 May 2024 10:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727443.1131915; Wed, 22 May 2024 10:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iqX-0003hh-43; Wed, 22 May 2024 10:05:21 +0000
Received: by outflank-mailman (input) for mailman id 727443;
 Wed, 22 May 2024 10:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9iqW-0003hb-6A
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 10:05:20 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb53c015-1822-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 12:05:19 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52742fdd363so242618e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 03:05:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c814dsm1745026166b.118.2024.05.22.03.05.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 03:05:18 -0700 (PDT)
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
X-Inumbo-ID: cb53c015-1822-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716372319; x=1716977119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44FK3+ZDN+NKpxUSF4D8wmATvQF1ajJL4qiJab6qpH0=;
        b=EcFk24fZeV6fLD0bzSlQ7ASh+ElhDbC7lX+5DIK7AYFWSTx3GFtUGP1VlVM7tm6lem
         LHqPFuiHgUQhhEHs78gXs4iirPV1U5m0PKX8t5A1IF+opO/W3A7eEWtwafCVcyb6P5uf
         HrUWSQs6I7htV4cvT3Fk+j9pD8UvmxJh+Kqp5JcM3CudgBPKPUbOY7hAvapR2V/GjPVg
         xaxEviCKKPYVGdmuEL80Bd8WdqGdg9z+kSmRXXJqHKKEKNPRyDs9fC2+WW+g9m2kqLob
         W70FzPUKs0K1Sb0fIdplJ9cn1pRHzgKsfL/+Vnh+0CHwV8x4wmnPbUYu69LG4VSq6656
         Nmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716372319; x=1716977119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44FK3+ZDN+NKpxUSF4D8wmATvQF1ajJL4qiJab6qpH0=;
        b=XboyjCVir5HTcxPL8LQTs9tiV+pedwxn6dMhpZFpfiddfRTsMCpLD0vVCyI1LJvjMT
         lPIR84CcRT98r+q9u+xgLfJZjQyMyYVYAxQrAkA+AfoAI+qWGzYADdu1FF30vDncEXMf
         NLU5GDARzMSkOOnsykxt3IEFnY4RXwO8R+MwHk821wsFA/ceQYHSYBKAPFQ3yiO2N6dw
         2HkS3euGFDrEFpVM23McCuZKwi2J8PiJ+RcLR2G2s5qc1Q5WQlfpL7kHJ2zjyaxUYghQ
         Y+XM02e0LWpX3IFZc8PwxU2NgdcvnFrFl6TCcS/qHHMmRpQULOavmfMqM5iVA9OOiRtv
         Mx/w==
X-Gm-Message-State: AOJu0Yz3n+rI2m7HrPlL0XycNjnws/S41klreWIJCycmAZaGcc2DAQcL
	vtNjuyGa+xvSS7o/LwacC9nlJeJLAhEGl3GUt4ultgJ/9KaMo7u0pXhVYRSC019agvZkSRh4sAY
	=
X-Google-Smtp-Source: AGHT+IEe/OjtgVdqneqvwLczqW7tRhjXM/vYH+P+kj/aHzrRtWv1QXljEVsA2UeFeh757XpXWyZiLA==
X-Received: by 2002:a19:4311:0:b0:51c:1d6b:5171 with SMTP id 2adb3069b0e04-526bfc01ae0mr828472e87.56.1716372318609;
        Wed, 22 May 2024 03:05:18 -0700 (PDT)
Message-ID: <1b607d3b-429e-4841-a3b0-ed3a39e12ed7@suse.com>
Date: Wed, 22 May 2024 12:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <664dc165759df_5e9362b92d249399c762@prd-scan-dashboard-0.mail>
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
In-Reply-To: <664dc165759df_5e9362b92d249399c762@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2024 11:56, scan-admin@coverity.com wrote:
> ** CID 1598431:  Memory - corruptions  (OVERRUN)
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1598431:  Memory - corruptions  (OVERRUN)
> /xen/common/trace.c: 798 in trace()
> 792         }
> 793     
> 794         if ( rec_size > bytes_to_wrap )
> 795             insert_wrap_record(buf, rec_size);
> 796     
> 797         /* Write the original record */
>>>>     CID 1598431:  Memory - corruptions  (OVERRUN)
>>>>     Overrunning callee's array of size 28 by passing argument "extra" (which evaluates to 31) in call to "__insert_record".
> 798         __insert_record(buf, event, extra, cycles, rec_size, extra_data);
> 799     
> 800     unlock:
> 801         spin_unlock_irqrestore(&this_cpu(t_lock), flags);
> 802     
> 803         /* Notify trace buffer consumer that we've crossed the high water mark. */

How does the tool conclude "extra" evaluating to 31, when at the top of
the function it is clearly checked to be less than 28?

> ** CID 1598430:  Uninitialized variables  (UNINIT)
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1598430:  Uninitialized variables  (UNINIT)
> /xen/arch/x86/mm/shadow/multi.c: 2109 in trace_shadow_emulate()
> 2103             d.va = va;
> 2104     #if GUEST_PAGING_LEVELS == 3
> 2105             d.emulation_count = this_cpu(trace_extra_emulation_count);
> 2106     #endif
> 2107             d.flags = this_cpu(trace_shadow_path_flags);
> 2108     
>>>>     CID 1598430:  Uninitialized variables  (UNINIT)
>>>>     Using uninitialized value "d". Field "d.emulation_count" is uninitialized when calling "trace".
> 2109             trace(event, sizeof(d), &d);
> 2110         }
> 2111     }
> 2112     #endif /* CONFIG_HVM */
> 2113     
> 2114     /**************************************************************************/

This, otoh, looks to be a valid (but long-standing) issue, which I'll make
a patch for.

Jan

