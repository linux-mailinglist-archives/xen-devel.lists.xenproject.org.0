Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34083C7EE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671642.1045093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2ad-0001G5-Ji; Thu, 25 Jan 2024 16:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671642.1045093; Thu, 25 Jan 2024 16:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2ad-0001EW-Gf; Thu, 25 Jan 2024 16:28:31 +0000
Received: by outflank-mailman (input) for mailman id 671642;
 Thu, 25 Jan 2024 16:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2ac-0001EQ-VY
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:28:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c57415f1-bb9e-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 17:28:28 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55cdaa96f34so1772918a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:28:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c8-20020a056e020cc800b0036197f7f157sm3760360ilj.2.2024.01.25.08.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:28:27 -0800 (PST)
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
X-Inumbo-ID: c57415f1-bb9e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706200108; x=1706804908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pQid3mXTBuu2fPYArxOPPVeK5fmBM9o7miluHzNukM=;
        b=NSQuqGLaJrbhTORHNH27AUAk9NUoTZOQ93x0Kq/l6MbnlPtPFiTuLjrNgpgRjW2BvA
         KcTBN/EsktZr/SCHXjJl8huGBbo6tc2kht4LrKgIogMdPlufJGHNl16dkLdQw9P19cLz
         uVmtOVkB/QAbV+uUlMuRt/Nxinja3p8k9T7ysOAjOwF7s02m98mzH+p0G+1jBCDsBOPZ
         5DQqt5xBncb1zGWMOLLw3oXfr6rDoxf/yWDA4TtTZQbYU0eHbPKuFICQRFWVUFlBIntK
         YxDTqnl35WMOoqk8GeUD9/CJmqd3ev61gp6XeMwUlbuPHrTfPumhxrM2lVJ0/74O5mhZ
         2EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200108; x=1706804908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pQid3mXTBuu2fPYArxOPPVeK5fmBM9o7miluHzNukM=;
        b=HLyUai0cleTHu7h9IONh7uvvMAYh/pYIgTuE+KfamK5otcMqCmApOIjKrzP3+0+kys
         S3HKW9vjod4M5hdLh94w9uFs0RVGOOalubpexVRiJAjGC+GdfIR4sOouWomKkdg+ZLHm
         k6q7fSy7tc9Waqyqbk6hNywkuM9Dr0D9BvcdY0UZ1KGCIAsWHel5X6qa6GpmZnmjizNP
         yrWHkC+6fxppvy2Kz27jKshmz7ncFuJ8keCmlwrRZaVDoLX/X/HCqR8uLFK9DECseD2A
         EIGiqz4A8+m8Uv6sOmsBRSS5YY29oMHyL79SYA1Qpf0ftT8RXMMEYQB8HOa6ogu1mRGS
         Y32A==
X-Gm-Message-State: AOJu0YxXnZX6wBTb4MJ3WGnxUXtj5ppLjOwFEbSc9lLeht7jx0/FhV7M
	X1d8nwi6XE0B8bXs7iTb+vlgNwnPTvw4cSCHz6CVRTMX9dNC5byMfPi2BJlrng==
X-Google-Smtp-Source: AGHT+IEFpJsA+MLudHTE9ZnetRgYlKLjKi16iZCopjx1vfBq5aDfxxFq17R3AipJqGUxT8xtpFQj9w==
X-Received: by 2002:a17:906:fcd9:b0:a2f:ebb:f200 with SMTP id qx25-20020a170906fcd900b00a2f0ebbf200mr146015ejb.9.1706200108317;
        Thu, 25 Jan 2024 08:28:28 -0800 (PST)
Message-ID: <316b72bf-177b-4bcb-8941-e1013096f7cd@suse.com>
Date: Thu, 25 Jan 2024 17:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 04/27] acpi: vmap pages in
 acpi_os_alloc_memory
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-5-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-5-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also, introduce a wrapper around vmap that maps a contiguous range for
> boot allocations. Unfortunately, the new helper cannot be a static inline
> because the dependencies are a mess. We would need to re-include
> asm/page.h (was removed in aa4b9d1ee653 "include: don't use asm/page.h
> from common headers") and it doesn't look to be enough anymore
> because bits from asm/cpufeature.h is used in the definition of PAGE_NX.
> 
> Lastly, with the move to vmap(), it is now easier to find the size
> of the mapping. So pass the whole area to init_boot_pages() rather than
> just the first page.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



