Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04F8D0599
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730841.1136094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc2W-0003B9-Hl; Mon, 27 May 2024 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730841.1136094; Mon, 27 May 2024 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBc2W-00038M-EP; Mon, 27 May 2024 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 730841;
 Mon, 27 May 2024 15:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBc2U-00037V-Pr
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:13:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aceacbfe-1c3b-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 17:13:30 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45eso2560281a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:13:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579c2026406sm3047825a12.37.2024.05.27.08.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:13:29 -0700 (PDT)
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
X-Inumbo-ID: aceacbfe-1c3b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716822810; x=1717427610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvbTbEsKmn4mnDBuGKxl6geDipRxQV4dq73yiizKjYY=;
        b=bWzRVmhfOIi0HOsmOI+0bN2sSHfZGq3uilo1VldEtqYZRp35+gO9Y9JaMu2Uz7D4s9
         pYG85VPs+ws9NFhW52DRF+oxEeHDrRhbnJhAw9RJyZWZ9AIBNMSRctZup83TWtrfglTk
         Qs1321y5wxijNDOdBzO0VUovAdr1z2tb81YITwuFSeLl2YkGg+8dpuyeBCPzyUkNhJfl
         AJAbLNmimpLziLbwjXn3F5U+JyW7wtjiR9VvrAdlQJCJM9kFz9Ct146rSXsCgsdL03ru
         ezWhq3/QvKux1/fLpumyqGMyizPbawnR70QFu+SQFdo+SstRPfXsy0jaoCzcrihkDnz8
         9CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716822810; x=1717427610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvbTbEsKmn4mnDBuGKxl6geDipRxQV4dq73yiizKjYY=;
        b=gyAClc0k3AD+Uye1qFwwXObDkPnkb5MtXr0I3Hgs6rjlcMuImOOzA/mgb2DSvV8XHU
         sfG5EKF/8+70RIELj5THcuUXEJXn/PVXwwN+zP7NaN3V3tLZtYJCtXvOvAYCqz8GtEDX
         aRK8Be9CyapMirPn5B5S469rEjVbj+zjqmc3YoxlrWmfbDacZCAQu8YYl2AUI9FEbQnh
         CaKZk0eWGhTcw4U84LV3W64h0CopMVvLe1sVwSuvHvGbQon8ZZjSwpie7YtzuhkE5sdC
         vTtko1Y9rkqhDt5YK/UaBvaIh8yP4o79Am7pK5Xogh0meCZZecn/ZjQo3oZrVsx+6inf
         cPmg==
X-Forwarded-Encrypted: i=1; AJvYcCVmBbWNEWScqRBaIbTum5k7Ag5gCpALVZ79Wh3Gyild5VX3zkNaRFtJ5C6Mr5DfoskLKd6TNoomD/FEzV7x4H11VQPXub57yIvjhFgzL40=
X-Gm-Message-State: AOJu0YwT5Zrt8DGiqGmTw+u4P5XlHVr5OgyBw1k7PDRVDWgQwmn2TpG5
	6/4tMXJ+ONecUqLGn+qzdmnGyf7o+HUJZWzQt/5IOoHuxZ5uCOfVj1FyzOJlhw==
X-Google-Smtp-Source: AGHT+IE/uJGMOHzeNk5N+KyK1QM5Qndle606c2a6aXzqOCAXMvaPXORbHOa/tEReLnSkVKQvOgx6UA==
X-Received: by 2002:a50:d655:0:b0:578:6410:1d50 with SMTP id 4fb4d7f45d1cf-57864101db2mr7029360a12.34.1716822809714;
        Mon, 27 May 2024 08:13:29 -0700 (PDT)
Message-ID: <86e1e74b-f1e3-4e16-b87e-a9c512dcc655@suse.com>
Date: Mon, 27 May 2024 17:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/4] automation/eclair_analysis: avoid an ECLAIR
 warning about escaping
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
 <f489cc3d668830eab2f2ce724164d65dc623baa7.1716814609.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <f489cc3d668830eab2f2ce724164d65dc623baa7.1716814609.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 16:53, Nicola Vetrini wrote:
> The parentheses in this regular expression should be doubly
> escaped because they are undergo escaping twice.

Do you maybe mean "undergo expansion twice"?

Jan

> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index b9b377c56b25..cf62a874d928 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -405,8 +405,8 @@ explicit comment indicating the fallthrough intention is present."
>  #
>  
>  -doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\(.*\)$)))"}
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\(.*\)$)))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}


