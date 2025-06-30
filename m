Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB70AEDB7F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 13:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029068.1402804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWCwy-0001Q7-Dz; Mon, 30 Jun 2025 11:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029068.1402804; Mon, 30 Jun 2025 11:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWCwy-0001Nd-AB; Mon, 30 Jun 2025 11:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1029068;
 Mon, 30 Jun 2025 11:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWCww-0001NX-G5
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 11:45:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b52b6712-55a7-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 13:45:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso2237512f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 04:45:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55c5f38sm9141562b3a.108.2025.06.30.04.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 04:45:22 -0700 (PDT)
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
X-Inumbo-ID: b52b6712-55a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751283923; x=1751888723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F7A6t9NWEWwY8Zy1mr641xlx/zKNYi4cn7Tits2bsB8=;
        b=KY8EnW87bYMlqJm7SFGEuGvxKans+CfHlp+A2QVM9h/QIGiQVUSMzFlQeyzMeao+fO
         CA61ATLlOxDmNEN4Dmzjs1unze25Cl1Os9gki0XGKdBwS4TeY7XfR0w7RgXybgu96a7Y
         PDRlYijHjG+a08qSKs+gJqCxELZ5lblwVLap0yEWVJbmCBUW3IyB2fG9mxkhNeG++JS3
         k7iFi7rpscGKogb5aIu1NA5AN1OpowSh0UjNxbnfy56JfuhldhgZp+qXgndLNgi/kvMi
         sRHh+hWfatNF/veUMf1UAvvIWJ5EPhc0WjFhiPbI67p0zmeTVZkN7Cj2byA4LGdaGa4T
         8OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751283923; x=1751888723;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7A6t9NWEWwY8Zy1mr641xlx/zKNYi4cn7Tits2bsB8=;
        b=m4MajthP0xHqJrAn8wa5DAIXmsabuHy8RtJeQXI+83uc4+R0tstX4EihKFcG5ayoZ8
         UOKvJ2NMzfRJxGiThyctU0BrE6UTfXbqzzNawiTkNuc8ob+qB3/HNg8Ehc2x9sgnbChZ
         GY1gVF3W9VWK/bbt0fHuVbJl0ngI6XY4N5EYDWZlUQW/OQGKV5FfRe1lzVNOl8gqEMCj
         687sky4f4lH70FnAdTfIEHJZERfNae9jDIT5zjXxrwMYczycyz0+ze/B2idLkvt3e1L2
         rp9sGOD3CDp/6sqyH18Kkt5hdxJ16WbXkjiy6ZiRNu6Wl06EcS38p8YRykxsR7vi3Quh
         OJJQ==
X-Gm-Message-State: AOJu0YxD5EGLbBc88LE9xD3bz5nR9LznYNLU5afu4bmzxeaQnQnupPRo
	KV7a4SBMqwuaj5pD3ZTb/aljwmw4a19JFUY2o4yfOZz71UxnAQkVkiTqflGTmUkHDmN4ZP9QT/O
	E9+I=
X-Gm-Gg: ASbGnctS/fYLBWxtF+pzMrp0rjgFGDpqF8AyGjZs0qWTGk14jGWNzdBqc+aIZcP6IXX
	/PjSDohU3Ol2aU7dm76bHNVhpJrAAuj5mQN6O0QK93QwD40pDRW1elAMGb0ova5UZeG3r67vUIO
	0sZHRHNf4SfdpKo44U6qBPuRz84ICtypJVRpDZA3fv8a48oB27ht/EmPKsTW1Z6TEVjd77M58rZ
	0RBs+Zj7IhFchJoNOjTY/KpeA0Kz9+yzQD4/hEHKAYEDWoLJyn29S7t4lPH+mg/kAaxBmZk8dRZ
	kSmVT6o385K0gFKhrnWBvn8Vc1QpNfGdNamERzsuxoY/DdXJM+DUeEIuuPFcMd6U5Z+phAPA8dQ
	JGmTukPif6e5JLuUo9oIR/9vQhBYBC1Nv4Pp9zj8V2f8kANo=
X-Google-Smtp-Source: AGHT+IGADTwG1thslrgUpt7vUOpQDbrkuQkQ1lQPKJQbr3rsWxLg4V47bYZIdYKjHHpvVqMt/i674w==
X-Received: by 2002:a05:6000:2712:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a8f435de5fmr7367675f8f.6.1751283923074;
        Mon, 30 Jun 2025 04:45:23 -0700 (PDT)
Message-ID: <943ed2bf-07c8-4cd1-a745-1f8648bd0403@suse.com>
Date: Mon, 30 Jun 2025 13:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/SMP: guard socket_cpumask[] access in
 cpu_smpboot_free()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7fa05d3f-2f85-4a42-9549-b68a486e30ea@suse.com>
Content-Language: en-US
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
In-Reply-To: <7fa05d3f-2f85-4a42-9549-b68a486e30ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 13:42, Jan Beulich wrote:
> Before CPU identification has run (and it may not have run at all e.g.
> when AP bringup failed altogether), cpu_data[].phys_proc_id (which is
> what cpu_to_socket() resolves to) can't really be used. The use of
> cpu_to_socket()'s result as an array index cpu_smpboot_free() therefore
> needs guarding, as the function will also be invoked upon AP bringup
> failure, in which case CPU identification may not have run.
> 
> Without "x86/CPU: re-work populating of cpu_data[]" [1] the issue is
> less pronounced: The field starts out as zero, then has the BSP value
> (likely again zero) copied into it, and it is properly invalidated only
> in cpu_smpboot_free(). Still it is clearly wrong to use the BSP's socket
> number here.
> 
> Making the guard work with and without the above patch applied turns out
> interesting: Prior to that patch, the sole invalidation done is that in
> cpu_smpboot_free(). Upon a later bringup attempt, the fields invalidated
> are overwritten by the BSP values again, though. Hence compare APIC IDs,
> as they cannot validly be the same once CPU identification has run.
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00727.html

Fixes: 4824bdfdabeb ("x86: add socket_cpumask")

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sadly there was no feedback at all yet for the referenced patch.
> 
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -958,7 +958,13 @@ static void cpu_smpboot_free(unsigned in
>      unsigned int socket = cpu_to_socket(cpu);
>      struct cpuinfo_x86 *c = cpu_data;
>  
> -    if ( cpumask_empty(socket_cpumask[socket]) )
> +    /*
> +     * We may come here without the CPU having run through CPU identification.
> +     * In that case the socket number cannot be relied upon, but the respective
> +     * socket_cpumask[] slot also wouldn't have been set.
> +     */
> +    if ( c[cpu].apicid != boot_cpu_data.apicid &&
> +         cpumask_empty(socket_cpumask[socket]) )
>      {
>          xfree(socket_cpumask[socket]);
>          socket_cpumask[socket] = NULL;


