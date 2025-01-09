Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8791A07479
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868218.1279750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqYX-000443-Sd; Thu, 09 Jan 2025 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868218.1279750; Thu, 09 Jan 2025 11:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqYX-00041d-PS; Thu, 09 Jan 2025 11:18:29 +0000
Received: by outflank-mailman (input) for mailman id 868218;
 Thu, 09 Jan 2025 11:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVqYV-00040q-TB
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:18:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722ac387-ce7b-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 12:18:26 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so9849845e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:18:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d46sm17386545e9.25.2025.01.09.03.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:18:24 -0800 (PST)
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
X-Inumbo-ID: 722ac387-ce7b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736421506; x=1737026306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UWhs9feB6Sp+Hi/8OiNlRyxfYZ4eXaXibU/Aw8TJAkQ=;
        b=W9+Z3dS15HM8Yl8r+7GA+/hP0SVh74Kiiep3smePdO7oIC1smEb+lK6Vnj2x3KHzD6
         N+KLrNdJ50hq0Vq6OKajo3EQ4PlJc3/Tm0sZ+z4XWEyUqgfbPlgidGybl3d+tNN3KNwS
         U9IKbg6SqWCykgMUDuLDCVs4q5eaOwhW5+3A7YkzeIv5PvhWEtIkyNDKj8U6aGbPBhnS
         LiO6FJIgG7y0VeVPBtGMdSb3dvb3sWveYsNxUUt61y2jFgYl+ASyJCyzAoAzP7Exxt49
         LVhVhsiDhl8wTKjhzk30Yte0nakiQKbja+0kmP0/2/YkIE9uxb8DdnNNjgg1SAN5y19I
         e4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421506; x=1737026306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWhs9feB6Sp+Hi/8OiNlRyxfYZ4eXaXibU/Aw8TJAkQ=;
        b=DtSp0QKxSxsOq8fOALNvy1qJjR7YS6jEnRUAb3wcxruY5xsMFHtmMv4CObda0Lq76i
         VnPejfyeS8iPb0QykbhyyvLuQYL/WdUEwI2xDskqlyYWjDyKedJvV+v1LfGV4BlSw/Wk
         s6eh0sq6iA1RNhfLNASZOn2TpAMsLmt4k6dQ0wq/1bYLyMZ1rKAIU0lCynu8iWd2i0Jx
         gXvWOAUAZrLp8U+M/pRlLdOBWTXTjjsY0m9L6NbUA/LbRHJbFg4q9d918ye8qZDrJ2vd
         DVdtCHvITfqi52GO5ZHHPHTpJKGSykcgd5avlShIXnPknqHSz4PNDitxetG0TY7HNlsW
         4hng==
X-Forwarded-Encrypted: i=1; AJvYcCUk/l7WvKJqddnUS6C++MwH+cmlpiLtPC6m7e6Y0TOxLarrVtZvMnGPByVX6BXlMb/l5MOOKOeeNx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwKBUa71ikMVRgCFgWSI2Etxr9YKYHxvVKWMqK0GHVNcrVvWxP
	wQCHJpJ3gTogSrJhfeLqSo/XDg+qc6CNL0KayNT1ZPtVV/7Hiq63CcqfSu6yWQ==
X-Gm-Gg: ASbGncvHWOa+OTkCbO0M9+wqDXMPxPGK9goYRJeJYDbS/PNWBupqS2Sc3G2oTDAgusa
	f7YUSmy9008BkB9vVXhvj1MxRmiR2DYfV6q+lLl05Z/pKjRJaIC7pd+p0zWrN5vdlb6r5C+RaU6
	nYT9KvAQBo2QVRCGeSqIgySPWd+nyNytkE9pFQXimnttSnuPxWMzgkEJ06D8DsWpAQFdH5iiZZA
	sqfd4bWlisrNGFC9FopCD374ieCXyT1Sdr2ak5NkMy9x7t9zhH27n4dhQq2byLj1qXeHxoHJhnB
	NCMwsh1rLVbibvZSvSTS1BkKR+lXUWFBYG3IWn8S1Q==
X-Google-Smtp-Source: AGHT+IGFWHAXe2D6VKlCC0IANRemBwRSJMrJ7laxduDYApfa+Y5HaOTByJAotwckobAxsAltnYplfA==
X-Received: by 2002:a5d:6c63:0:b0:385:ee59:4510 with SMTP id ffacd0b85a97d-38a872fb0f9mr5268264f8f.9.1736421504996;
        Thu, 09 Jan 2025 03:18:24 -0800 (PST)
Message-ID: <aa88bcec-11e9-4a1a-8c2d-e18ef5bcbc35@suse.com>
Date: Thu, 9 Jan 2025 12:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/11] xen/cpufreq: only set gov NULL when
 cpufreq_driver.target() exists
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -316,7 +316,13 @@ int cpufreq_add_cpu(unsigned int cpu)
>      if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
>                     perf->domain_info.num_processors)) {
>          memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> -        policy->governor = NULL;
> +
> +       /*
> +        * Only when cpufreq_driver.target exists, we need to deliberately set old gov as NULL
> +        * to trigger the according gov starting.
> +        */
> +       if ( cpufreq_driver.target )
> +            policy->governor = NULL;
>  
>          cpufreq_cmdline_common_para(&new_policy);

Looking at __cpufreq_set_policy(), wouldn't the condition better check
.setpolicy being NULL?

Jan

