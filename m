Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C799385A50A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 14:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682865.1062072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3vb-0003YV-Fl; Mon, 19 Feb 2024 13:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682865.1062072; Mon, 19 Feb 2024 13:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3vb-0003WA-Cv; Mon, 19 Feb 2024 13:43:27 +0000
Received: by outflank-mailman (input) for mailman id 682865;
 Mon, 19 Feb 2024 13:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc3vZ-0003W1-2E
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 13:43:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0af486-cf2c-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 14:43:24 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41264195d5cso9253545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 05:43:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d68c8000000b0033b2799815csm10408696wrw.86.2024.02.19.05.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 05:43:23 -0800 (PST)
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
X-Inumbo-ID: da0af486-cf2c-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708350203; x=1708955003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrPLVACfRMC6xDUdFgYvzOFYlNcALVZD/fl5SsiDjhM=;
        b=WY6vP9c/b72HNFaLlKZLB4I9jG93NQo2JTEBeAbu7ylUUTyyMvteyayLXFU6pM1fE0
         Z3aj7o1IcfhWVSE72f/4W4oVUbm7PkZjC4CGgQbxaoSDk3hvgG4uEYfXAe4oAqLToyvz
         +o4IL0wRwPjRg76qCucZOydgTUKYcYpLoR30V779sTi8XByW91ko44MHSnGPUiefAJJe
         JyWWwxl68q/aBIaMOuuxLeqmZyg7bpiVnU9ozsQtPAagHoXRwyBBFLQTo2whJJ3505UU
         gjkoUxK1ip7udOLt0l9xtm8eDU45+h2dCyh1jERPvLrHgJOFU+GWvZhYesFX49WQq2ET
         MM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708350203; x=1708955003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrPLVACfRMC6xDUdFgYvzOFYlNcALVZD/fl5SsiDjhM=;
        b=Q77hl55G/SRpSKYK4sB0Zi1NaVmwXsaip6eKy4ikesw7HLZbh36jSrJLxc8wpo5z15
         oST2S8B4FMi2sd+ZLcv51UV9QwDqLO8CfvmRrMaUtfh3ZWZubXhe5Ah73o4UsTvGI3Mm
         pkpvFYXc+HZnSe9iD/Iw0Z4vv52vk/ZiOyt/B4oE+79PcWN/J4SwmW4e/i1cGUQqeNlE
         IBD81ToOSWxQOk2HZ8TG6Xwm7OJpkH+gDmOIYw20gRPgdzgxQie8XWqEczZ0srMHZvhi
         55D3qtLq4JnmQBBIN1EgRpUGnnctJH+04BwAKrl6WD85kOIxAxObbMWJFbo0nad9bEoM
         5qiw==
X-Forwarded-Encrypted: i=1; AJvYcCVC8jNtwTrOQUt8pzF0wx+/2FKXE037gZtkq2U+VyMZc5TuC5N6zSPGAXNwaLA5339kfJbCOhuS1LEpYaiiwat7EOaa/puFgXVw6BHBDL8=
X-Gm-Message-State: AOJu0YznM0hUx3vWXmz5uYvYpmQbPHDABFz3aE8h4ai+ImB97dzbwHXz
	X4foTChwhgqf4n1NZkvpbZcIhKbchOox922py79bcLcR9ww27dDiW2dk+ltLXg==
X-Google-Smtp-Source: AGHT+IF2lK8c7rkP6Aiqra5R6gB8ALiWIYO28aXg+KW4O17lox/081/7gX8uH3BrFn9LjncW69ZmOw==
X-Received: by 2002:adf:e504:0:b0:33c:f35c:a395 with SMTP id j4-20020adfe504000000b0033cf35ca395mr8147693wrm.52.1708350203500;
        Mon, 19 Feb 2024 05:43:23 -0800 (PST)
Message-ID: <a6e8bd32-cc32-4084-907d-e2cd6d46e3e6@suse.com>
Date: Mon, 19 Feb 2024 14:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
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
In-Reply-To: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 14:24, Federico Serafini wrote:
> Update ECLAIR configuration to consider safe switch clauses ending
> with __{get,put}_user_bad().
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

As mentioned I'm not happy with this, not the least because of it being
unclear why these two would be deviated, when there's no sign of a
similar deviation for, say, __bad_atomic_size(). Imo this approach
doesn't scale, and that's already leaving aside that the purpose of
identically named (pseudo-)helpers could differ between architectures,
thus putting under question ...

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -368,6 +368,10 @@ safe."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>  -doc_end
>  
> +-doc_begin="Switch clauses ending with constructs \"__get_user_bad()\" and \"__put_user_bad()\" are safe: they denote an unreachable program point."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/__(put|get)_user_bad\\(\\);/))))"}
> +-doc_end

... the global scope of such a deviation. While it may not be a good idea,
even within an arch such (pseudo-)helpers could be used for multiple
distinct purposes.

Jan

