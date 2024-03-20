Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5D9880E4E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695825.1085978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrvk-00006O-0n; Wed, 20 Mar 2024 09:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695825.1085978; Wed, 20 Mar 2024 09:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrvj-0008VW-UH; Wed, 20 Mar 2024 09:08:15 +0000
Received: by outflank-mailman (input) for mailman id 695825;
 Wed, 20 Mar 2024 09:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmrvi-0008VQ-Ky
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 09:08:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60e4f019-e699-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 10:08:12 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso69824066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 02:08:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020a170906198e00b00a46d049ff63sm2425212ejd.21.2024.03.20.02.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 02:08:11 -0700 (PDT)
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
X-Inumbo-ID: 60e4f019-e699-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710925692; x=1711530492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/ZwndSap+UjguGMNzzVmaq33gAVfBCyBcru2Ya/D5I=;
        b=IDCfwxexbt+az7o9k/FC2EWEk8pvQLURZbp+2xwv95YQ6uBgAwqXYDca9NXwkGtGqN
         OG/z+eZqGGMxgYlVMqSvbSJd+jv+aG7VcsRs5plGn6/zHKefWfLTcuzolCBQbadrxkEd
         hC7xLzVY3C8FUo2+r7mZNgaX5kqYJ0fpU/gllKZA5rXutmQYKXyn4/nNEXIPy/A8KfEx
         MpWgs+Nhj2Y409tI9CY7EC4tPMurORDw/OK4p+EnOdevmW2iuCyNz9lwqCaLCUZcd5Ok
         kDC1tk4ESXDJi0SC79EvWqUJWOL19+dNQCtZZlWVkOVQpdZOmdsc+1olAGYyL/jgGzxT
         o/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710925692; x=1711530492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/ZwndSap+UjguGMNzzVmaq33gAVfBCyBcru2Ya/D5I=;
        b=RCovrkEIWlcAd7NdBFavnLMofu1LQSbGRTiGdufe/qNPsH6v1r+nmXmw3pvm7RGzDL
         3ZnZZC5LZ3a5IlJAiQJbhz4gr+b9EBkqLtBaC4BSFru2hNdfQgUjinCAyHLAS4i+odZv
         cCMiCFTnrSDvmcZqP6lyOMvxw8FNCPeaB/wUKNd/BkvWtYJaGB0aHKg5vP1t8H4tl/2n
         c8dsq3U79ad7tl+k4aYLKeG1s1QW8lfgA/EdxcZQPeX+iRfo8zl4+aipVLffoTsrdI6e
         HAiXgYnaQKMQTqpEEoIHubccsniX1I+DJztx3oG2ogJWNqfKycyHHPfDbiOic4NGXpwM
         3IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPKNyynBG4xOBnAKGzU5XVDvxgV6YOy/VFPcDByWilexs4KMWQtUCwQQ786ZLBx+cXN89Ehou/YVY2Ajd4PlgRL5UGU0loMinO7UZ2KDA=
X-Gm-Message-State: AOJu0Yy4mO6thQBvkMdfJ8JBIur8shP8uqqrjycpiY5nOWna0CYTOPbH
	3rFMDLTxf2NriRnNhAWun1wJyl2/jZJFlAtOwrCADGNY7lTO/X3OoFjl9OYFsg==
X-Google-Smtp-Source: AGHT+IEi5QcEdgX9OfmpO5GHMu9SBhlRMR/xskEeRhCYZ9vemBd4NtsHAiuRkOVDoSCzFjah6zPJeg==
X-Received: by 2002:a17:906:c794:b0:a46:be85:4410 with SMTP id cw20-20020a170906c79400b00a46be854410mr5875104ejb.74.1710925692208;
        Wed, 20 Mar 2024 02:08:12 -0700 (PDT)
Message-ID: <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com>
Date: Wed, 20 Mar 2024 10:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012
 Rule 17.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
 <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 09:50, Simone Ballarin wrote:
> MISRA C:2012 Rule 17.1 states:
> The features of `<stdarg.h>' shall not be used
> 
> The Xen community wants to avoid using variadic functions except for
> specific circumstances where it feels appropriate by strict code review.
> 
> Add deviation for functions related to console output (printk and similar).
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
>  docs/misra/deviations.rst                     |  5 ++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9ac3ee4dfd..7c3559a3a0 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>  -doc_end
>  
> +#
> +# Series 17.
> +#
> +
> +-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}

This isn't concole output related.

> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}

These three and ...

> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}

... these three aren't either.

> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> +-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> +-doc_end

Further, is there a reason xyzprintk() are all listed individually?
Surely if we'd introduce a new flavor, we'd want that excluded too.

Finally, {,g}dprintk() in neither of their incarnation use any of the
va_* items listed. Why do they need mentioning here?

Jan

