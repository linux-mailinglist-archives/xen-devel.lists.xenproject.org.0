Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6A915EF6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747220.1154567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzli-00022W-At; Tue, 25 Jun 2024 06:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747220.1154567; Tue, 25 Jun 2024 06:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzli-000201-77; Tue, 25 Jun 2024 06:35:06 +0000
Received: by outflank-mailman (input) for mailman id 747220;
 Tue, 25 Jun 2024 06:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzlg-0001zv-Pg
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:35:04 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9b4bd0-32bd-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 08:34:59 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so56123651fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:34:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a7a557sm7968555a91.15.2024.06.24.23.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:34:58 -0700 (PDT)
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
X-Inumbo-ID: 0b9b4bd0-32bd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719297299; x=1719902099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MMmL82UsFNEjpvybl7VhZ0LSIom4J5ANnVyWqMHiS4A=;
        b=eGDFlvqgDvH3O+1PczuWSwQXhMAUEq8oJeSmdz4TtKgIUtYkY3lrZGTPsxYLWf32gu
         PUGvLTdXTTSiIVn9GklLWGny4ABKDHEbqQNkM6KilSZkuZ6Ifc/mL4HamlB9o0ci1qaA
         P1LFgdWMTJRs4TsrURPd2W7x7drpIxg0fo2mzmzwO6Df5HlI3PXJ/qrn5ZfJY+N4PSdS
         37VzZvqeB4ZgJdxnoLsNIk0M6USykV8tIB55R/Q/6AoPJsI9yrg5usGeFSboUTI7SVaZ
         1CrrCoyMD4QYhEdQNV3fZDFdYrNtYkOwASLFc/mWf40b8nNioPKqGXmm+v0gegur4Hmk
         lW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719297299; x=1719902099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMmL82UsFNEjpvybl7VhZ0LSIom4J5ANnVyWqMHiS4A=;
        b=dwNN1/E/ZJ/QiLnXxh08WJ5Zr1ma8Xjy7Gd7n4XzLEpnjMSgfbu78+18mjj+C09PqE
         bzCxpx+iLJaylZ6SQXq83P7iQ0RhxFcCtQ8qosVCNl2gfQCXrh5K3OCRHJzlBe49u1Lu
         9pF4WH+cft9/hGRJG+9hAI6Bfn02Nh1hV5OQyFAv24fLHYqlESawnZhHABA4EwvbMwRG
         XBLc06Om68Xsdb3uhdfryIzXuRfbo/BmaeXTC6LFbhFxrOGjanfbhH/6tSqqIuBFpepq
         cmP3F1fRLQXEhc34qJ83nLr2CpaLv4pCmykLn8zzPAphemz5QwFaTCTbXsGUrK4J5/Vh
         C7sA==
X-Forwarded-Encrypted: i=1; AJvYcCXVUoiBT6P0FCYNMWKue8OBID6zBwCwys3IrMRdDrlETxTomyFuGCZ6QMphUFvImB1b079XPPHOadqTxYwKPqW98VCocnUsmQ2I35fWO88=
X-Gm-Message-State: AOJu0YyGlF5uarxNKnLq4wwobYpBiAnY9lZXKUQqn2zSuQw0O/ezqNTa
	1S4sW/Xrkto8p6AuiVyrG0EKMVmd2E1ojf5LD8DSKMmMmATWtN9BrauUoLnuOw==
X-Google-Smtp-Source: AGHT+IGPd+EASAwSjoxRaD3cn5DoyRpG4sErL2WySDyDPY6Y89V2wwFfbX+H/LC62zCYSJiZemtD2g==
X-Received: by 2002:a2e:9248:0:b0:2e9:8a0a:ea05 with SMTP id 38308e7fff4ca-2ec5931d897mr56846631fa.17.1719297299118;
        Mon, 24 Jun 2024 23:34:59 -0700 (PDT)
Message-ID: <0fe07e0f-fe6d-4722-9f89-a78294a8b3a1@suse.com>
Date: Tue, 25 Jun 2024 08:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] common/sched: address a violation of MISRA C Rule
 17.7
To: victorm.lira@amd.com
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <a5f00432063ead8d4ae09315c1b09617a12b22f7.1719274203.git.victorm.lira@amd.com>
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
In-Reply-To: <a5f00432063ead8d4ae09315c1b09617a12b22f7.1719274203.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 02:15, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Rule 17.7: "The value returned by a function having non-void return type
> shall be used"
> 
> This patch fixes this by adding a check to the return value.
> No functional changes.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  xen/common/sched/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d84b65f197..e1cd824622 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2789,7 +2789,10 @@ static int cpu_schedule_up(unsigned int cpu)
>      BUG_ON(cpu >= NR_CPUS);
>  
>      if ( idle_vcpu[cpu] == NULL )
> -        vcpu_create(idle_vcpu[0]->domain, cpu);
> +    {
> +        if ( vcpu_create(idle_vcpu[0]->domain, cpu) == NULL )
> +            return -ENOMEM;
> +    }

First: Two such if()s want folding.

>      else
>          idle_vcpu[cpu]->sched_unit->res = sr;
>  

Then: Down from here there is

    if ( idle_vcpu[cpu] == NULL )
        return -ENOMEM;

which your change is rendering redundant for at least the vcpu_create()
path.

Finally, as we're touching error handling here (and mayby more a question
to the maintainers than to you): What about sr in the error case? It's
being allocated earlier in the function, but not freed upon error. Hmm,
looks like cpu_schedule_down() is assumed to be taking care of the case,
yet then I wonder how that can assume that get_sched_res() would return
non-NULL - afaict it may be called without cpu_schedule_up() having run
first, or with it having bailed early with -ENOMEM.

Jan

