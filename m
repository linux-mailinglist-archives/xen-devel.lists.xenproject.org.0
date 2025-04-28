Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EACA9E9C4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970207.1358950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9J9V-0000so-Oa; Mon, 28 Apr 2025 07:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970207.1358950; Mon, 28 Apr 2025 07:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9J9V-0000q2-Ly; Mon, 28 Apr 2025 07:43:45 +0000
Received: by outflank-mailman (input) for mailman id 970207;
 Mon, 28 Apr 2025 07:43:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9J9U-0000pw-8S
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:43:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81deef8b-2404-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 09:43:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so45867725e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 00:43:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29ba29sm148947785e9.7.2025.04.28.00.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 00:43:41 -0700 (PDT)
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
X-Inumbo-ID: 81deef8b-2404-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745826222; x=1746431022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6coqWLi2TgHzMLlt5v+nz4yb1DsAqZd6VeM+WiOGb2M=;
        b=Ir2GpL4K5Ub1wgUzRu/orWfWBG+3FZ7wSRzIaU/4TkJDo7lybhLjJXqAXxAjz3WJ1G
         yT0z9NArshl4g1e96OO12W0B2yc5RW3eS3yau/AhnDnWG4sPnHS9U9VN1ZKWAcBQ3/sk
         yJ/oO8IkEbm+MHmcRM9rkoquBSNftLkyuNtcaRFTMIuT8+w8dZEczs685QdrAmBSI+5B
         kqrhKGbbGtz14o6eDYsFuVIZ5xAco0EZYN7msmvo2fsr7D7y4Vw+bkMGQP2sxfs5EKlX
         Mm3GCBjaeGVIA5hzF9zEe+GZlw/kYZaDbgbe3pleqXX3vK3LNBRas1O2Wqrgtw6f8Brg
         Yfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826222; x=1746431022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6coqWLi2TgHzMLlt5v+nz4yb1DsAqZd6VeM+WiOGb2M=;
        b=MNY9Ug+bm2/Z9lxrMmn5rT3SjFVLQ7Geln0qhs/knXMxyfnAtGJiYVHBIcnoKHr70n
         VlVo8MU5jLU6asJUQl0uaWdsMCDfJ1OPNrmucYmuUhoDI7M8nH5RdCekMvBf15C5gtIs
         ggv7zRKaTCqEQd2yM6Za80OvAQpfqunPQsuLeW9OHn8MB6YDTZWG3A3lyllgJEnBqam2
         oICKjg2FHufkR3IKM/5YGsUPI/D3y7DO3VBmejByyxInD9Kj6MaZyfW+IVh/71X5E197
         gnhCFgza2w3WVDQX4/+aTfl8vNoH2g45uTOj7E/qhEx+1qIkPYhDz7g8n70BRLb5aDFs
         0Vzg==
X-Forwarded-Encrypted: i=1; AJvYcCVBUw2SVs/53RxC5SKYqRrQJ7g2kgZLp/e8M28dAvuj2zGts2Rr78AGjfpsAiPLiwvxDqC2wWP3LQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmHgL/wQI9V9rWxbfsLvwqRM7OvwLvlCQxGgiP5BSvSD0w3TSR
	PE1jRhPg5FKivMgwXYd6ZpoA+fAyRdVIe6C9s4fD2upbfeKHXt8cEIcvllzFvA==
X-Gm-Gg: ASbGnctmxJYl6Gf90A3ZcAyyVf7Q3jdENrJiNfoiNPe1MzQUz2VTvOpBJmAAXl6Wyy9
	sX4R6s6deVu+RzpGY5YpwU7D4sA6x5irgi3933mwCJp1Hv4JHnYB7KWWAx1+uXejpgLPH/jAvMM
	xzbQcSc+w507NZWTAdOlzOFXUGad9G5v1HlobzHyi/a8aJj8F1zijGLdC7NVfXi4qk0wfKvQjY3
	n9tM5CS+gUp+N+E8BqwwbFbgO1+c1LNXoGdfFdNHk4EONqRD+gaxPQPZyWVK4YxCN+m7AdyUEtq
	9r8yw8y3N9FvzShMe1wrwek8FUk/WOqyAvQp4bd00zIfbRkvFjAELjpmYJC/krxIBNBq33IxHiI
	cunaN8PvuzlGFzf4BIpItWz40WA==
X-Google-Smtp-Source: AGHT+IHKymcv4A74sU73KKaYeIxU+buoshK9YKlT3ig0JkuxBjKlf/o9pg79eaYaEhza3R21OC8SiA==
X-Received: by 2002:a05:600c:3d08:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-440ab36222bmr73002075e9.30.1745826222032;
        Mon, 28 Apr 2025 00:43:42 -0700 (PDT)
Message-ID: <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com>
Date: Mon, 28 Apr 2025 09:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
To: victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
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
In-Reply-To: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 02:00, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 14.3 states that "Controlling expressions shall not be
> invariant".
> 
> Add a SAF comment to deviate the rule for build configurations without
> CONFIG_LLC_COLORING enabled.

I was surprised by this supposedly being the only violation. And indeed it
wasn't very hard to find more. For example, we have a number of
"while ( num_online_cpus() > 1 && ... )", which become compile-time
constant (false) when NR_CPUS=1.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2038,6 +2038,7 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,
> 
>      spin_lock(&heap_lock);
> 
> +    /* SAF-14-safe MISRA C R14.3 condition always false without LLC_COLORING */
>      for ( i = 0; i < domain_num_llc_colors(d); i++ )
>      {
>          unsigned long free = free_colored_pages[domain_llc_color(d, i)];

Hmm, this way the deviation applies even when LLC_COLORING=y.

As to the comment wording - looks like we're pretty inconsistent with that
right now. I, for one, don't think the Misra rule needs (re)stating there;
the SAF index points at all the data that's needed if one cares about the
specifics of the deviation.

Jan

