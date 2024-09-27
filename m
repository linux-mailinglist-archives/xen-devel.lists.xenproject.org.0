Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A7987E57
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 08:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806024.1217315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4N4-0005La-3O; Fri, 27 Sep 2024 06:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806024.1217315; Fri, 27 Sep 2024 06:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4N4-0005Js-0m; Fri, 27 Sep 2024 06:22:30 +0000
Received: by outflank-mailman (input) for mailman id 806024;
 Fri, 27 Sep 2024 06:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su4N3-0005AP-13
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 06:22:29 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf581a3-7c98-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 08:22:27 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9bf9d8bso974881a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 23:22:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea1dsm723107a12.53.2024.09.26.23.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 23:22:26 -0700 (PDT)
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
X-Inumbo-ID: ddf581a3-7c98-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727418147; x=1728022947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v60S2eZ8Qf7Jnm/GaAnbTtFhZGJYdUq675Os2EgsL8w=;
        b=HKMHDyU/p9V0QqiPBgBx/FLItAn0s5ToN4Suh3zcBFvZUmEhfXvVq/4Kow/ExtrxuU
         vGfEafTtdBWGXBm93qDGflKbUjTR575bAluhiWfPXzz9tThwS8DYuTB5ZQqmJi3Xe0nF
         4vPB9AkDbfIbqT12XVcEjKyv/wZNbHOmQMKgIJEbaUX5XaJ2+RTMA1S8SQYa0PVV6PL3
         iCb3rWh26iJJ+E5tcZMPYj0nMVODNDitRHm2/JcIghelMsnFmIMoEF0YbC8kJWjtLqXE
         BJuw4d8AI5/GQeZ+ge3D0J1lxEKbAnjV6HfpenfZuk33uIwkshsxF9wzpn8Z8rQaLc9f
         BzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727418147; x=1728022947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v60S2eZ8Qf7Jnm/GaAnbTtFhZGJYdUq675Os2EgsL8w=;
        b=Z8f0h4dzQvc2AI1r/2t2RDh9LjSQI786+CXe/gXnX2S2TccmmF3ERytZk2bOnDUIb1
         85p2PoI7tg+fJO6UPuAHg9St0P8z38QMqf6cS5fIjYSC8l+pym6ey4taa4SEzTl/HDGM
         aCrPBH6DibiUbuBZd6mqjo1WX5Yr2RODRuJdLEN4KuTP3zd3OXbCX/3WK2Amruo/fiN3
         ++ZzgOfVGzLKgZAhgNyvQKgHQKriEJSwlmo6Lj2uiMjPUqBEJ3ipG3KdN2Y0JHKATh6N
         ejZd/4UIKNFt/r2mkae8hRlRjrxRnrYIi5YmrC7DVyQdk8GZzQyAP6L8PZYNn2W5Aq3g
         JYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcy0WTIDXGBYqGautQlI8SE/HDZ487Bx8v5iv/0EPVlX5dSCbsUHI0p/uJX4o7ncuPXO3785TOJMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/RmARd1Cck5b4WbO3KrjW6bXS+hHLEXtIM00Bb5o+CVtXCBdH
	1viLJmL0QREJrxA0RuHp6sWm51mZVodLa2mmdVYghH6gKioAe5dzU30IkJrBYL89FwQboBngHN0
	=
X-Google-Smtp-Source: AGHT+IE4fzkRDfR0qfFIntsfLLwgzmQ1GNUQc7z9jY11gFxFZZjT8ir82kvS3IGiyP3J4PvSWTWSlw==
X-Received: by 2002:a05:6402:5114:b0:5c5:c1dc:9028 with SMTP id 4fb4d7f45d1cf-5c882603d72mr1998003a12.33.1727418146604;
        Thu, 26 Sep 2024 23:22:26 -0700 (PDT)
Message-ID: <e08af274-6f04-4ecf-8f94-853b33748deb@suse.com>
Date: Fri, 27 Sep 2024 08:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <d7263aaef3bd59255a84bd78c4ea4c09c78a5902.1712893887.git.sanastasio@raptorengineering.com>
 <742d3499-208a-4650-bc95-fa59e334bd25@suse.com>
 <82383c10-9724-4729-afe6-81fd08805879@raptorengineering.com>
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
In-Reply-To: <82383c10-9724-4729-afe6-81fd08805879@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 00:14, Shawn Anastasio wrote:
> On 4/24/24 9:46 AM, Jan Beulich wrote:
>> On 12.04.2024 05:55, Shawn Anastasio wrote:
>>> +    /*
>>> +     * Identity map all pages we've allocated for paging structures. This act
>>> +     * itself will allocate more pages, so continue until we've mapped from
>>> +     * `max_alloc_mfn` down to `min_alloc_mfn`. This assumes that the heap grows
>>> +     * downwards, which matches the behavior of alloc_boot_pages.
>>
>> ... as long as you only ever allocate individual pages (which looks
>> to be the case for such incremental allocations, but that imo doesn't
>> go without saying).
>>
> 
> I'm not sure I'm following you. `initial_page_alloc` as well as its
> underlying `alloc_boot_pages` can only ever allocate individual pages
> (or contiguous ranges of pages).

It's this "or contiguous ranges of pages" which constitutes a problem.
Once that happens, a portion of un-allocated pages may remain above
that block. A subsequent single-page allocation may then use one of
those pages, resulting in strict ordering to no longer hold. Or the
space may remain un-allocated, and hence being mapped for no reason.

Jan


