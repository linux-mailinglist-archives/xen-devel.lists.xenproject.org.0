Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF73A6DFC2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 17:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925908.1328775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkil-0003KV-Fq; Mon, 24 Mar 2025 16:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925908.1328775; Mon, 24 Mar 2025 16:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkil-0003Hn-D5; Mon, 24 Mar 2025 16:32:15 +0000
Received: by outflank-mailman (input) for mailman id 925908;
 Mon, 24 Mar 2025 16:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twkij-0003HR-NT
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 16:32:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89eaeb74-08cd-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 17:32:12 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso40087805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 09:32:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3a10sm11264955f8f.28.2025.03.24.09.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:32:11 -0700 (PDT)
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
X-Inumbo-ID: 89eaeb74-08cd-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742833932; x=1743438732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5kaSVk0ST/etckDd+a/tJAqpPMEgS9quh109L3+C6g=;
        b=AO8K9SHU2jZooEbDnf72ear5KYuTlmEzRMh3JYmtq2XiNnjoVRQU8boIyF5LlKSoLD
         AK1OKpES7ipB15ueorbMN5ydsKTyIl+9QFaGwokCcwAlYVfhO/J49ypCb00hljc7CsCI
         YFdaIraIfJr44W68uA/4G7dEeQmHshTpAju/XSgWWvq5M10OXNjKjC1BUTCzzRTMvRzo
         82eFs5kMEm07yWw4cMbuakP4dfxyraQzJk/CnBGMeH8q1OmhBfTYGKo3lfCLSAT25TW7
         HW+ZN9/V8c0Ri64Qs7U2GtE3msixUEWchWyxjM/X7olY/zMBMMyrviHFOV5jwtl2cUtH
         eYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833932; x=1743438732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5kaSVk0ST/etckDd+a/tJAqpPMEgS9quh109L3+C6g=;
        b=u45kgJKD7b2rS11sthdf2zO7OUnXPyOme2OkWWc/XHNVrMMeSALU4LMM+FE4b0zUlr
         hDc+8CZuSuVW/TyQWkB/3OxwwN3DxEBmXGrhDz+6De1Uf7c0U9PgKLXOa2V9aFC1l2Jw
         BZgSx0u+vPvoEN83veII/r6lSBwOqtW7cYt8btglOYV11XUW22Jsrzgot694fDd3wp0t
         0zHSJgOdRpnQWns4GaAuyWHDN+t3V+eFEJyCOv9koQWJ08nryrifOf8VxnHSMF8gH5pO
         c1jZT2QJFXRbi3sNr4X4YpL0o+F98I6eXNraMCmbfVkH0U7M/L3+Nah6tt3btEjGuO/J
         R72Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPyGHUqOoHNO6hwFadX80qY1yS35y0dKHbsp4kwqEq8H0mViHUhF6YrPre5aHdAQLD1it+6oLBufE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4T9y+Bt+G1oPGBUNwKy8//psL/VTbQDqiRAiMytbfKbt7v0PT
	Nah6uI9m7NUc0e5fg8MpKS5QvmIJ+ylgcVxzHp6rVIz7Ue5CV1oIW5R5BtCNAQ==
X-Gm-Gg: ASbGncuUTkmHxrxsGhfBKC5n1D5wm07UPWzPairupy2ROKnh5yEojKNrfjnGMfTRBDW
	zBJ7htikNvhV7h+Tv9WVWL2aV5o2vooA4kykvVEZnongn7WWSJleo5qxxEOAmpP9GXIG680fWhu
	nWGJuZWc8vPJ2TwMtnR2J+QU2u/VIIU2KbQXyc37ynDWkwgBscphKQfs0rR7Go9POxwCgjGSwLr
	4yqPdsk6lArnwDdSQekPd6dNv/dwcweMw14aaqPtrzwZ2TqM1Cuyb9PFfaLGgx4rBJA32DphP1+
	FozZZS7FztiXef8bPE6OUiCRPJOQSmr1HXtKK0rVYxqYCEKeHLbae60EgjJzkVW8jbFPAW7lmU2
	Y3x7k20jW4IJtCFzx7UpigsjC949lHg==
X-Google-Smtp-Source: AGHT+IFuidGHX2m0cVnQK417eu3KRqvb93jk9UYiMxHzSl5iEI/hghWYwCMQ/wJgJFBulEg8E14GyA==
X-Received: by 2002:a05:600c:83cf:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-43d509ec3famr153377115e9.10.1742833931869;
        Mon, 24 Mar 2025 09:32:11 -0700 (PDT)
Message-ID: <4aab9ce4-db67-4031-ab13-4d88358917ee@suse.com>
Date: Mon, 24 Mar 2025 17:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] xen/cpufreq: only set gov NULL when
 cpufreq_driver.setpolicy is NULL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -353,7 +353,13 @@ int cpufreq_add_cpu(unsigned int cpu)
>      if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
>                     pmpt->domain_info.num_processors)) {
>          memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
> -        policy->governor = NULL;
> +
> +       /*
> +        * Only when cpufreq_driver.setpolicy == NULL, we need to deliberately
> +        * set old gov as NULL to trigger the according gov starting.
> +        */
> +       if ( cpufreq_driver.setpolicy == NULL )
> +            policy->governor = NULL;
>  
>          cpufreq_cmdline_common_para(&new_policy);

Indentation looks off-by-1 here.

Also (I may have asked this before, but couldn't find an indication in this
submission, including in the cover letter): Is this independent of all earlier
patches in the series, and could hence go in right away?

Jan

