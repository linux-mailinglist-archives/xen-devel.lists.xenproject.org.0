Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35549A7B834
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937796.1338681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bMu-0000Si-0x; Fri, 04 Apr 2025 07:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937796.1338681; Fri, 04 Apr 2025 07:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bMt-0000Qw-UI; Fri, 04 Apr 2025 07:21:35 +0000
Received: by outflank-mailman (input) for mailman id 937796;
 Fri, 04 Apr 2025 07:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bMs-0000Qq-7L
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:21:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e93c556-1125-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:21:33 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so1441971f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:21:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b69a8sm3609287f8f.49.2025.04.04.00.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:21:30 -0700 (PDT)
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
X-Inumbo-ID: 6e93c556-1125-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743751291; x=1744356091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LMnymf/VfBwR0jIoVq/ftYd/r6MZUFff08R2K/rxggc=;
        b=IDlL+XC0lwycS4DOCatUX2xzv2lsFsI5Rw1xLfMXsaMP0/U1wUxXzW+7oE6LeZEdp5
         7QMRakPx8WuuxTNWTGGhs58lcBrALZEDikfD3uUMiWDywTPaJUWbRV4QZ113UdAEpptg
         VcluCz36djNkY2f7mnKCwSjjvfzYO7jdWD97uO6vETgXLyPZQrOibXopj4GpG0TJbR0C
         J9qMj0Wm0B1ONv5utCbuFHpKzrSiIccEQfao7CJQoMMVGCT0fHu1j0qYVngCukDf6zjE
         qEHKrQEep54/Dc7racD0oT8ML7z1IcnQz14R89Cu2kheNj8u4vK81IELit4bnHUnlVJS
         AhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751291; x=1744356091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMnymf/VfBwR0jIoVq/ftYd/r6MZUFff08R2K/rxggc=;
        b=vmZtDlWB06CHEHX6GmqhCjSzNiJzeq0kVFIMKbYR9Vj7BN6Y8Z+rGCF7WKCE7ULIIn
         0pcfp89l4IVDBIYBxqg87O4c4KTZP5izEybWrfeEONh7U/kRZdXjINqrMO2qoJm7xHDH
         QNdzR9e4Xh8hEHFViBiruIPCrwLB9+Bwz4926PC8D/D/5QrJi6xW4e64TqP+Zp8lcIYh
         RioGO8x/GIT9koz4s4bcJqx85Yn67/KenroPAibP6xl41kaw0rWpFFv15Zm6cJBX02XH
         xsP9Raki4MXdwpMc2AxmMs2d+8rytW2pJT+wZmlZFZDUnO6K58U3G8J9xbEqlngbz9/1
         j97A==
X-Forwarded-Encrypted: i=1; AJvYcCU7ve6rjQxADSTNw3sjQQgmy74vm2I9uC9NgcOBG0YqoY5KQRTBnWznVPq8k2iRsG37JelytxpU3zM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj2HVa4YovO1B0Z9pwWUleSLoTPtEhekf5XsQRWuQCQsR+7JMy
	BCX5KpxvaB7LYvXCEaSY1EUXR7BrEUo4p4Ml4RnfV4wZau+m3sosBS0+GsHp2Q==
X-Gm-Gg: ASbGncsJVYvEGXbg1hmhkq1WO39/5IlnxSbQW7NlCTFa2VdhH8c4GHgtrer8BRkRLjZ
	7zzte4rAsc7xMOTuZwTKk4gY8FX9rX+pwKZydDHB/gQXFpx0XsNms+Kez5gxCBIXe3Q3uZnROvH
	lwzgO0jRs4gVxuyr5PPs/1lnBhMHBZ9oqkDtf6MejoH4EkxPH5kzTUthCyGOpMldmxHN9YONH5j
	4jIk8Gmmjzn/AJwyy1W3GsDddJfZ88nZGw9ztgjPF5v/2vTt79kVBGEEE6C9bmi22RvruAC+iDd
	fw8+D3ixJpqRNygCIaYxtTTykEsvKA7CbvUeiFYc+HjGS9nJ8wAXcc+Y+EX3DQeD9AYQNIGfder
	rcO7hZXNjI2lcAgVwY5E9F7772PA0Jg==
X-Google-Smtp-Source: AGHT+IGzprJQUAUbYFvLAn+CAXMfk0V0XcJhdi3H1UJJxCaX2LLBFEEcTxtcj4OEjLAQoU93XJ0UYg==
X-Received: by 2002:a5d:64ce:0:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39d1475e1acmr1231574f8f.52.1743751291049;
        Fri, 04 Apr 2025 00:21:31 -0700 (PDT)
Message-ID: <046801a7-1990-4629-a8ec-395c7fb233af@suse.com>
Date: Fri, 4 Apr 2025 09:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop XSAVEOPT and CLWB build flags
To: "Alexander M. Merritt" <alexander@edera.dev>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
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
In-Reply-To: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2025 01:22, Alexander M. Merritt wrote:
> The new toolchain baseline knows both the XSAVEOPT and CLWB instructions.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/205
> Signed-off-by: Alexander M. Merritt <alexander@edera.dev>
> ---
>  xen/arch/x86/arch.mk              |  2 --
>  xen/arch/x86/flushtlb.c           | 28 +---------------------------
>  xen/arch/x86/include/asm/system.h |  7 -------
>  3 files changed, 1 insertion(+), 36 deletions(-)

For XSAVEOPT there's more work to do, even if not connected via HAVE_AS_XSAVEOPT.
Look for "xsaveopt" (case-insensitively) in xstate.c. Imo (just like was asked
for for the RDRAND counterpart patch) this wants doing all in one go.

Jan

