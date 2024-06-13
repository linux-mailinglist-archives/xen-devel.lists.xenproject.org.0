Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E49069AA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739758.1146702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhO0-0000So-5u; Thu, 13 Jun 2024 10:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739758.1146702; Thu, 13 Jun 2024 10:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhO0-0000Pu-2n; Thu, 13 Jun 2024 10:08:52 +0000
Received: by outflank-mailman (input) for mailman id 739758;
 Thu, 13 Jun 2024 10:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHhNz-0000Po-CY
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 10:08:51 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee2a7115-296c-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 12:08:50 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso1149090e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 03:08:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5952f85fsm41422066b.11.2024.06.13.03.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 03:08:49 -0700 (PDT)
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
X-Inumbo-ID: ee2a7115-296c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718273329; x=1718878129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X4dmGxxpXaLEGno/tSpoArXj5CLMuZyTfgyBDtG9zfM=;
        b=NrtE4v248cp29DLiDKUu0+JsT/cfWXlzKj6rxINFyYnmAyQjXA8a8uHssHs/Q1o2Rk
         K0oVHDMPNR2b3efe4LPdV6GXft/Q+Dx8LTd4V+PzpE0JzMmwMuO1PNecYLPRf9mw+tv0
         KikqEYvhSrbTH0k4+VlROycrjmsipryt7oMeZaIPnV4iH2bZmjmpq83jZsAMDCuoqEmD
         PCH0jIlTTkOYeBUd8wsgxRk/Py8Jc0XmpnIZbzNjR+hw5D3E2E922l4j70cpS5qo4lQT
         xklzT4kOKAoNGSmGpsswhrhwFwEYT/naLsrwD6XkzzjcUtbTHefOLsGGGRmHR9hyhpVW
         LL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273329; x=1718878129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4dmGxxpXaLEGno/tSpoArXj5CLMuZyTfgyBDtG9zfM=;
        b=ey5eq0M5ne2PxAHpRP9QCnWVfvBgM29bB0RA3zfgftImrquaKZZgJ6D36qtOHJ3ZPJ
         6q9mZBdrsT8qPV71h3BGz0NC0PT2AEVhLTplqxq1M0t4Q34bs7gxZuuU7NZiRjIVHx2n
         kslPcCMHgi6BBq6pgHQpPm8hwizdm8feT7Gk8eiA3LguVciNidBWRaPB3jcKeEh94oNW
         Iw/5Ak9RcBSouMPVFJX1dUv9sQZX84oq6kQdLYLrkrhfLJASCe7KDOVkrjiyReXq1+JO
         p6l2vuGicpxJV6P/EObnRMr74dt9ks6rrwReUAm2+veTx3bjQ3L4qEdtCJIz3LkYIRTW
         vohw==
X-Forwarded-Encrypted: i=1; AJvYcCXEJP1W/7SnoTh5Bo8duoh3Pp3JPvs6vjSsWTsYaWzU9nA/YId762eBjmJKGj+0VrN+T0K0ex+HlylBOTowUXLBjbCC+v+7riKGkaxnv3w=
X-Gm-Message-State: AOJu0Yya4EWh1IMO9IOFEaL1lW45H3QjHRXot/ZoGSllnRrWAFojhmym
	fmkGclEOBoNJVlnF1ygOndsz5X/kNuVK+cb4+6YdkmRj8ckg0qJprqKnFXVxcQ==
X-Google-Smtp-Source: AGHT+IHJuQxWZwcDvYSvaXnCRzzSLalRxQMVVVKS5m1NW2fsbtmTFOHUGEzYNJX1VMbTyD+xpwUJyw==
X-Received: by 2002:a05:6512:10cf:b0:52c:8b03:99d1 with SMTP id 2adb3069b0e04-52c9a40301amr4760939e87.48.1718273329548;
        Thu, 13 Jun 2024 03:08:49 -0700 (PDT)
Message-ID: <55f46457-4182-4e1b-a792-e94cc6c16864@suse.com>
Date: Thu, 13 Jun 2024 12:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C Rule
 17.7
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <a5137c812eefab7e0417670386b0fee35468504d.1718264354.git.federico.serafini@bugseng.com>
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
In-Reply-To: <a5137c812eefab7e0417670386b0fee35468504d.1718264354.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 11:07, Federico Serafini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -364,6 +364,17 @@ Deviations related to MISRA C:2012 Rules:
>         by `stdarg.h`.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R17.7
> +     - Not using the return value of a function do not endanger safety if it
> +       coincides with the first actual argument.
> +     - Tagged as `safe` for ECLAIR. Such functions are:
> +         - __builtin_memcpy()
> +         - __builtin_memmove()
> +         - __builtin_memset()
> +         - __cpumask_check()
> +         - strlcat()
> +         - strlcpy()

These last two aren't similar to strcat/strcpy in what they return, so I'm
not convinced they should be listed here. Certainly not with the "coincides"
justification.

Jan

