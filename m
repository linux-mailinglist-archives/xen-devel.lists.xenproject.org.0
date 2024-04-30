Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026E8B6DAC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714648.1115908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jMG-0003z9-9F; Tue, 30 Apr 2024 09:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714648.1115908; Tue, 30 Apr 2024 09:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jMG-0003wN-5v; Tue, 30 Apr 2024 09:01:04 +0000
Received: by outflank-mailman (input) for mailman id 714648;
 Tue, 30 Apr 2024 09:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1jMF-0003wH-4R
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:01:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2acfac5f-06d0-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 11:01:01 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so43851375e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 02:01:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b0041bfb176a87sm10182736wms.27.2024.04.30.02.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 02:01:00 -0700 (PDT)
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
X-Inumbo-ID: 2acfac5f-06d0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714467660; x=1715072460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btcu+7TWLKE8WeJYmCQ1Y/QjSK4AAkiI27ykfNR6YX8=;
        b=TaRYN6Zzff5nExh9tDr1OEUtpPKKxCjFn6xkEk2JVL+2eInMMdKZU0l4zImG+emhhl
         r+KIyRgZW69FTtqAxqYpQ1s2iD081KgPFKQ2NFRH2NbNbGVv48AfAVpGgvjFHBvmz5J3
         C0ZvBflUUH1bm+NUdUEbFZkdlg6mPP8FTzd5n0PCCO1Vw3ZsiWEI17BvpJPC8TxvW5wt
         7o0VM1HgfEZBcIwxAIHtRYvHuP3wPzY0foNiLAzyLrUAdJeCyY4Z5xKDyFd5HVbZyXvu
         QsXGhc8XBuoiBPeWJMzMhhBX5WWp+UCfQF0H6yC43pv2281RJvjtSkgFg5rU3LkuW+OK
         XYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714467660; x=1715072460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btcu+7TWLKE8WeJYmCQ1Y/QjSK4AAkiI27ykfNR6YX8=;
        b=GxXCL0uJt11Dy8cQck8l30I363q6b64NDtIH7xxhZopFEUxxkWUIjM3iZuNdZHl6xl
         vQY2g+C+ucXo2vXvz5IDhz2OtaGpv2srFoxWjx2LQmgAiqfCfZfvfWL2APs5jfo8G13y
         qMtjA63M+F0i5+DzNF8aSKlHyTRlFgZVp23VjnRDtK5wtsl79IoFwZRICcwLFXfOmB43
         4cDjMa2l3rPBhV/fpF03aq94YaXkG+kEUlVKmeF110rYDPe/GzUuGI8zPvd2YdyKY1L8
         55XaEv79D4yWO1UZPkHxGpX3HwyG6VIPyVDGMvS3XeDn+C1R58L0NjOfIB4VaXsnLYqB
         hE8w==
X-Forwarded-Encrypted: i=1; AJvYcCUI54IQWzZ+N+qBQkiQSDARtQIQj4OMTFgp1wlq6wI7IxmxG8s0r37DM5zMPv2iLhMlM93RX3jJhUZ0NLfDeoOLvN+3ryNn3EIpYVmIZfY=
X-Gm-Message-State: AOJu0YxeTPrhgrqXoInxrz+vHeG2ncYo3efKzlRqLhfRtUw1ExPFdpwH
	I6OjDB9+qM1bB6FHmNf+ZwGMdVjdxPUH33dQlx9lgzO9JAUDv9+siyC91F6AYgeRKxi63JYjo1o
	=
X-Google-Smtp-Source: AGHT+IE6v93OeUiQVnpFZmxfawoBHkF0/d+hgxfY/oFy3LItG76cfg9BAOomPvVDu4xM11je6zHZPA==
X-Received: by 2002:a05:600c:1c13:b0:41c:503:9ae4 with SMTP id j19-20020a05600c1c1300b0041c05039ae4mr7844384wms.25.1714467660655;
        Tue, 30 Apr 2024 02:01:00 -0700 (PDT)
Message-ID: <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
Date: Tue, 30 Apr 2024 11:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b819bd65
Content-Language: en-US
To: "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6630a5ea2588_2c1971e1c10965b@gitlab-sidekiq-catchall-v2-ddbc855b7-4zkpr.mail>
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
In-Reply-To: <6630a5ea2588_2c1971e1c10965b@gitlab-sidekiq-catchall-v2-ddbc855b7-4zkpr.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 10:03, GitLab wrote:
> 
> 
> Pipeline #1272869158 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: b819bd65 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b819bd65f4fb25be582f66ba2e4134f61d86f459 )
> Commit Message: revert "x86/mm: re-implement get_page_light() u...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1272869158 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1272869158 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 3 failed jobs.
> 
> Job #6745823842 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823842/raw )
> 
> Stage: test
> Name: adl-pci-hvm-x86-64-gcc-debug
> Job #6745823720 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823720/raw )
> 
> Stage: analyze
> Name: eclair-x86_64

This flags start_nested_{svm,vmx}() as regressions, when the regression was
previously spotted already. Is that intended? I.e. shouldn't the comparison
be to the previous pipeline run, such that issues are pointed out only for
what is actually being added anew with the patch / batch under test?

> Job #6745823721 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823721/raw )
> 
> Stage: analyze
> Name: eclair-ARM64

Similarly this appears to point out regressions which were previously spotted.

Jan

