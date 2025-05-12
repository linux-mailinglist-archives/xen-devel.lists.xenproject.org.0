Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B5AB38B9
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981462.1367859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET7n-00022S-E4; Mon, 12 May 2025 13:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981462.1367859; Mon, 12 May 2025 13:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uET7n-0001zb-BE; Mon, 12 May 2025 13:23:19 +0000
Received: by outflank-mailman (input) for mailman id 981462;
 Mon, 12 May 2025 13:23:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uET7l-0001zV-Tk
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:23:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4306e0b9-2f34-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 15:23:15 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fcf1dc8737so4600991a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:23:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e7csm5629155a12.64.2025.05.12.06.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:23:15 -0700 (PDT)
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
X-Inumbo-ID: 4306e0b9-2f34-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747056195; x=1747660995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T6/9KfdoDtBR/pnkYhsv1uWvVd/ELl83YK4VN8D1KqY=;
        b=Ro0rWo712GXlRsSmuYmHFmQ/hM+lfq6xrHfW9iKdXWu0d/M5FQ31reiLNwo+234yAC
         tm6Kl08qk2uS3BO3ENNMl6nJJwmhwztaA9WS2Ob9zbYGwLGG3c16cxdtggSx3XX4uzWV
         q/5RRh5iQP4di0k8Jl3otUHPly2UM3OkfRKbWabAKcppZq//IqTpAzYhdiokMY6Kh7wa
         sPSwFgIag8/5eHae1FDdkj+MrL6DkYbJoiNcL4//9VnjW+eLMsha3qKDy3CEXZh1pZY7
         6cLJ67+QvxxQwP2cjihDm0nowHVflHjcQTdEVyGOzzB61x1Ms8lBwqbtCDW9TXH9mkIF
         EanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056195; x=1747660995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6/9KfdoDtBR/pnkYhsv1uWvVd/ELl83YK4VN8D1KqY=;
        b=ldIECoR6Y6Omv/48lHu3h/jmNUg4HNpYrj98ExAXWuU01VGwFvS9cUBgKP4C8h4cKo
         zfifMZIyOZbRPs1el3dPn86xJx4hpm0BvyDY07t5mtorugKW5Dr2GYqi5H9hOBcH7fis
         n52KOAo9KHEtZOFrMibEOi8Fe6qh7dgBKY6vAkz41PMyA0dZNFzX5pdpPBr/KwWXYpfG
         LmuUfs2+ZBKoRlWVmDyWuB0TCIjue0tRugPU4Iyb5RCrtlVnfEBFJwoBSqdkHx78rp3G
         TSEhsAkBKfqxwG6Tjtc04y+Bi+X61heZoUPT1MhAOnw2JlrDEGi9+ROA2paTfHD+RCkI
         S0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCL6d0Bqrh/18mxNDJZ7EyHCvZtbGltPXADyq5RQKlLxSLdOAMRNJLAZSIBhxdl/jZzUKOwF5FIME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqVMA2ku7M3mMXVl6aLGRHouSaKNItvwvjlkVU1Y4wSF77mslr
	Nqmj7fz9hOkgRE44F4OOp5yZdFNdkJUAzVASaDhtOAoM6Yvs0/rMlgmURpD6JQ==
X-Gm-Gg: ASbGncvuGmz2Kdmz01fi/rNaza3AJBS9jzY7k8XL23cFz//s8grHsLZf/T/Aq6ZDDbX
	T5rFqGFQTNqJ6xaOwmOhtLgLcbtPSrjq0QJLlKeFdRyThfrzx3r/su/Ta23Q+mob9Sx1UC0kKiL
	7gqZJE2S0CNGSAPSy74xSwyHtALabVJlJkk4WcCGenqZQ9BPnAMxxA5xRBLzGHeCAXazDt9vf8L
	XK3FTD/SYISc8FKnbC0vKNlZSXSgSO5AhWRgnAgdGZo7YOLsD0FOOHRQ69bSiTW6GQb4zKozOhI
	8Ats6SBRIlnEqXGkezc1n1VvZmK1ErguZUIyYsET70ZpDcxJZv2HoyoehFhmIqlz1yxJ+JxAUpL
	4RzuWtBPjhF1mv01l0i99jtmYMlPFWz5RfEg3
X-Google-Smtp-Source: AGHT+IH0/RBCLmYofkPGYSOzdt/Kr3Q5JAUYhGYBrca1+mpvJ1kGEZnVdD/JO2dj2+4dbRWmz5WJjQ==
X-Received: by 2002:a05:6402:5241:b0:5f6:59e5:5c6e with SMTP id 4fb4d7f45d1cf-5fca07e9956mr10913568a12.26.1747056195352;
        Mon, 12 May 2025 06:23:15 -0700 (PDT)
Message-ID: <c5b5e7c1-36cb-4e92-9a40-6b7819cd83a0@suse.com>
Date: Mon, 12 May 2025 15:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/smp: Drop booting_cpu
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250512120015.3445217-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250512120015.3445217-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 14:00, Andrew Cooper wrote:
> Since commit 434596bbd44a ("x86/smpboot: Write the top-of-stack block in
> cpu_smpboot_alloc()"), smp_processor_id() is unconditionally usable on APs.
> Drop the global variable.
> 
> Also drop the parameter from start_secondary().  It was introduced as unused
> in commit e9ac3bbccab0 ("Move initial stack-pointer adjustment into assembly
> bootstrap code.") in 2005.  At the time, the caller was a shared codepath with
> __start_xen() with a parameter on the stack, but that never mattered for
> start_secondary() which ultimately reset_stack_and_jump()'s out of context.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



