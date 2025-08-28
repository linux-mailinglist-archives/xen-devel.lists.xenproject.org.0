Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15BB39B07
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 13:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098374.1452445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraTB-00087V-MA; Thu, 28 Aug 2025 11:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098374.1452445; Thu, 28 Aug 2025 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uraTB-00085o-Is; Thu, 28 Aug 2025 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1098374;
 Thu, 28 Aug 2025 11:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uraTA-00085i-Bx
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 11:07:04 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20268edd-83ff-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 13:07:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61cf429f4c2so26102a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 04:07:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fae316sm1200443066b.28.2025.08.28.04.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 04:07:01 -0700 (PDT)
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
X-Inumbo-ID: 20268edd-83ff-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756379222; x=1756984022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GrzoxHK+mLw4uoFvsR+XZmrG3Uwsuzz/FFHMVbsnUxg=;
        b=L+3U299MwAAzkFYfnDD3t0R8qVrfit7DlrgKdTkew6ivGSjHszDVb0kmG8dTO7RDAJ
         5ijiY7LzZfQxdB+bgpbxXWCQ6W91naggMv7JaPppEBR6f3L6SLPG0yni+oAqdaQj4iRx
         himfo/qYCCw/KQZbxEpwTIrwLmUFb+EVJXFSThxFaagYuaLg98DAdIhmAg2WFURz7zSk
         KDlOczPvag6ZFzP9Q9zJdin4/PIp8KwJKAN/bdzREidu0IXQ0tt/j6okVO/YW9h5Fjn0
         Wu0ESZ8sFVqvBwOJRrAQ25lArNJIA9k/kiOI/g/dWvvKRPit4jZL4uuKmKXv4yGsp4Wr
         6h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756379222; x=1756984022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrzoxHK+mLw4uoFvsR+XZmrG3Uwsuzz/FFHMVbsnUxg=;
        b=OqU6+xfoKv8/H52uxWy7WSJ1Bbpe3UWqjrsyh3JeoKLgEpqPXyIC0HLbRW3zBtVZ2N
         vMwtfgf3G25myyaW+MR9MlDwAKm07iyZAJBzNeTiuO6UYfuRpHiX+lSCc1+YZEDkY/gR
         uxyA28Ef7CXDMXBU+6FDdEojm8UVnu3cEt30Us9OI2sisBg1LU7mgdR5HPu0F+RgMmZY
         7xAA2WhG6vT7k49CKJyx5nR2kYrpUFcbjG9/A/zw89+BRUfFeAQGWw1Ejl0RzqVr90DP
         SdLc8sL2NZVFoKNuePkw8wnxBj+zXqHs4G4Lz2e9ZdNsaXJ76NJZfMvIfrczliU0T/On
         /UQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7yXPiz3dAgC3TsZPrUe93hcae3rE335hQKNi8YcpV24ax+Dz7aWON6Gm/gUk4FC+2XqnkPbsvNSc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6CqKAgQ27A7vEtNmTlj3amG2VwfSG1tDowhZ2TtRCwpIYddVl
	j5rxOHwhe+BZNM2eRs16hAdDZfqrYj2+bcMyIJQYygE8QP/VCxdQRm7/4F3foYKH/g==
X-Gm-Gg: ASbGnct+qRcnNON9JMV4l05DHgA2DJ0C6CJFWPRfMRvZZV1sZeH5XAbx8/hYl/ndgda
	ITxJ9B6BNgi+8CXzZpfN/jvYXfoj54qnoI/WcJM+BWa5d7SzGs1NYSoyuaFviai1KDJUKeJcVfp
	r8+Yb8NQK4yqbuut/a57wfdzikmPZLLRiuPoWYVdgtQlt/N4c3gcaWcxqsdJmauOQlcDm8LAvX1
	Ywaz5sBwp2efced5OKSO3yJOcGWnSXBMSNV7ghMDLf4vwcqy/6+2aY2W8l7Lxtc7amP06V5f2xp
	yb8t0IRdQy4e0ykUDFdtCVb3/TielHIWBmvevPgSp+FtDE2h4NOj7iKzHykwqTzfNznxihukMQ9
	Kio0RLSq8GjU5/lqLlPpTyYLKil9rHw/rKx8C4e6cnGg/Ytmiz5wmIyDhGgdjoHGqRZ3Y2HMF7x
	wmxg6ptr4=
X-Google-Smtp-Source: AGHT+IHEl8mz72gukoVg3FDINC+7qGQqmugM7v+7BCl1fQ3rpyZs2XPkaRjpHEzU4WzFEpxkIVzjcA==
X-Received: by 2002:a17:907:3f9a:b0:afe:d3b2:8b2c with SMTP id a640c23a62f3a-afed3b2972amr348492266b.52.1756379222240;
        Thu, 28 Aug 2025 04:07:02 -0700 (PDT)
Message-ID: <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
Date: Thu, 28 Aug 2025 13:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250828100601.1777197-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:06, Penny Zheng wrote:
> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> +    /*
> +     * In CPPC active mode, we are borrowing governor field to indicate
> +     * policy info.
> +     */
> +    if ( policy->governor->name[0] )
> +        strlcpy(op->u.get_para.u.s.scaling_governor,
> +                policy->governor->name, CPUFREQ_NAME_LEN);
> +    else
> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> +                CPUFREQ_NAME_LEN);

Isn't pulling this ...

>      if ( !cpufreq_is_governorless(op->cpuid) )
>      {
>          if ( !(scaling_available_governors =

... out of this if()'s body going to affect HWP? It's not clear to me whether
that would be entirely benign.

Jan

