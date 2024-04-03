Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D953D896493
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700309.1093238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruBT-0007LA-R3; Wed, 03 Apr 2024 06:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700309.1093238; Wed, 03 Apr 2024 06:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruBT-0007JS-OC; Wed, 03 Apr 2024 06:33:19 +0000
Received: by outflank-mailman (input) for mailman id 700309;
 Wed, 03 Apr 2024 06:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rruBR-0007JM-Nk
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:33:17 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d2d8026-f184-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 08:33:15 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-516be63af88so377743e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:33:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b004161df7c9dbsm3366892wmb.32.2024.04.02.23.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:33:14 -0700 (PDT)
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
X-Inumbo-ID: 0d2d8026-f184-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712125995; x=1712730795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nad+2Bc6gc43hIHI2DHPViTbwfGiH8lFaSB2NR0MYMI=;
        b=H4jE6tUxB5I0b9AL80LHxcx7UNICaJKMk7mMUp/mQKYi7dCJgqLW1Zs0gp4LQpjQ3h
         6AfLXrb/BBnhnLWM+lPJ5lMXbIbnOvQSmwlyA7B+bSVsXsT9Cm1aS3XnRoZSfGk7dPh0
         Fk5sJqATZ4Y8eYC3IoZz4R7SiJUPTT9StiWZ64UM3XRawEitKXxC0TbLbq25BuPP24t3
         YkhknkDYJXasT3Q7PvNX3DqNGNru2YWsTLLRavsxuE1WRIqZrGRN7CxoWRkAUfYYJhUT
         pIOM9SCF3Aq1EdgbQyUe+zhgWR6TNkMxhCXRSEaVy7Kum8ApYZDihxRhSJKAg2y6msoW
         4ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712125995; x=1712730795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nad+2Bc6gc43hIHI2DHPViTbwfGiH8lFaSB2NR0MYMI=;
        b=MbG6w2N5Z1BAkwsNMczf7TsKOSH5tlVYNLO00Odi33i+ekLuMPAHGIAPF0IraMuKIW
         EqXs/PCaPvLNSC8zTLOMMEFA2O5KWfpsjaPoyo0XrVtCr02VddbYODwiOzhpAzrGAwD3
         2KozJKfPftVm10uMS+7di7b7QrFN1djbi2FU070QI0DZ40aFTPoUBw4xnmDj1qf//M3a
         xpN0Wj0Vqs7pwTJvftROwGiFQ62AvnBJS4z58nMbYhW+mrtjXXSFzcqjOo3IH50nIUh7
         DP+f1V50HMsY3AtTWmvruhHZtEr3wLZBxUcZunVY+/HMKH2QtFP8GM8YTkoUrYYoDHDx
         ou9w==
X-Forwarded-Encrypted: i=1; AJvYcCVn7HZ8ExwATvSWg+7c442Dxdxvt6HzIvnm3Kp0sygNAUr4AO1fstbzc8D8Lw7y0sX33oQQdkPjwHYJ/1Jzc6EDFB00Ut7ttuLC8eqYxSQ=
X-Gm-Message-State: AOJu0Ywty7BGdiT8ex+gaZiP3vx1lh/b7WcnQjuxpOPZ7SDQKaMT3A7v
	xAA64n9NNt3t4O7mnGZJS2p07TN64jloIsn9a1a8+Xr4zkivgz4PNhNbyXFBgA==
X-Google-Smtp-Source: AGHT+IGiyYJDDuAEgf80wIO5hcmhfmk94DdpX9aCeqocf6HsaX+s/Ols1+HymZHqq23pJfKJ9j24uQ==
X-Received: by 2002:a05:651c:19a6:b0:2d8:3a46:8ab6 with SMTP id bx38-20020a05651c19a600b002d83a468ab6mr1074549ljb.17.1712125994933;
        Tue, 02 Apr 2024 23:33:14 -0700 (PDT)
Message-ID: <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com>
Date: Wed, 3 Apr 2024 08:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com>
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
In-Reply-To: <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 09:22, Federico Serafini wrote:
> Use pseudo-keyword fallthrough to meet the requirements to deviate
> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
> terminate every switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/common/sched/credit2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index c76330d79d..0962b52415 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
>              printk(XENLOG_INFO "Disabling context switch rate limiting\n");
>          prv->ratelimit_us = params->ratelimit_us;
>          write_unlock_irqrestore(&prv->lock, flags);
> +        fallthrough;
>  
> -    /* FALLTHRU */
>      case XEN_SYSCTL_SCHEDOP_getinfo:
>          params->ratelimit_us = prv->ratelimit_us;
>          break;

Hmm, the description doesn't say what's wrong with the comment. Furthermore
docs/misra/rules.rst doesn't mention "fallthrough" at all, nor the
alternative of using comments. I notice docs/misra/deviations.rst does, and
there the specific comment used here isn't covered. That would want saying
in the description.

Stefano (and others) - in this context it becomes noticeable that having
stuff scattered across multiple doc files isn't necessarily helpful. Other
permissible keywords are mentioned in rules.rst. The pseudo-keyword
"fallthrough" as well as comments are mentioned on deviations.rst. Could
you remind me of the reason(s) why things aren't recorded in a single,
central place?

Jan

