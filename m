Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C51910000
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744306.1151322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDp7-00032k-JZ; Thu, 20 Jun 2024 09:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744306.1151322; Thu, 20 Jun 2024 09:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDp7-00030Q-Gv; Thu, 20 Jun 2024 09:11:17 +0000
Received: by outflank-mailman (input) for mailman id 744306;
 Thu, 20 Jun 2024 09:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKDp6-00030I-Cg
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:11:16 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bb73a9a-2ee5-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 11:11:15 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso5932261fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:11:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9aa0589a7sm33788545ad.159.2024.06.20.02.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 02:11:14 -0700 (PDT)
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
X-Inumbo-ID: 0bb73a9a-2ee5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718874675; x=1719479475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KJLIla7Hi8D3/VqgY3rNh7e9s8feuuJzjDlTKt+1ktw=;
        b=FQhxC+VB97gzmvmY05HbwGciiSttT8wPqIy0bZunWSlKG1lBKcTdT5JSE7GkT9mpng
         xPLez+1BLqacotPHDNjt2Kufl0dvUiM+tONfWUKBl8zUb4MJzSLh8xXFsi3nlhNqfwPO
         34SlD4g7fUcpq//Omj/wQrRLIpUiXUiUHom9Xn70599jDf9y4yxxDp8Y6Odbnmfdzu1K
         N7bEtbPxiXpz2vSf+gYOhx3jOSBIDl7Z5iEsHqgmfKPUsG/rnMHE4bIbpZgRmcmeRV9u
         vCd5bLRshxoBqIe0vMY46PiB7Y/V8bdaSlv0jRAtGT+SFEbASErY/K5QPBkHV8On3Bmc
         /fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874675; x=1719479475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJLIla7Hi8D3/VqgY3rNh7e9s8feuuJzjDlTKt+1ktw=;
        b=UV1ksBXSUnJUFnH/yF5tw19aGXZj49jsjTNNYGxEkAtPboHTEQFmE1XVLDV74vhlda
         7QdLDcHpmO4EXbF2IxY3t/z3osYPYij0DzvbBOQmgOfj/l7qQ3y+vaz49EnoCiOfr49+
         BGYYgDYX8OtT9ZzP/NedqqTVjw1G2fwVlZKjju9YpEdhNVpayKQvjXtKiVD6AuoAcvAo
         UyWrvJizk7svvYi/5NEJ3Ouq6ZSW84VVC+58YVrvJFcoVHQGU6BTOx67naa8CWReWG0M
         aU/hqdtahXua5yOVqCo9QgBN4ZAJO/GPR3M9hHSgV5E2XrUDH6NkXdeHw9CaJn4X+Cwb
         x3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVC0lo0GAJ5IIiFLxk6qdsMBIdBsEsL0RDfR/vtl5vefsCgTDA9tFxjVrIVUVgQ/1xtK7lGdVWGWFyQYbXjZZaIB9qfvpJ5oqL0Mg3yNQQ=
X-Gm-Message-State: AOJu0YxbIOp5U9KSQtnslv2NF+FFbAWzUh9cHGwKeOi2CAAkyIYBbXRF
	oQz0s4fSqNKgTVWhvs54NGLR7qKVIPU64mmDPIyseaxsea7gj/JE7b76d1QF3Q==
X-Google-Smtp-Source: AGHT+IGmBabIZwC+o1P7ltsvkNzZBXF2yyin05UHybtl71k/F2gcNXkuO5YHk1e0ltSJ3BeWlIBiwA==
X-Received: by 2002:a2e:7d14:0:b0:2ec:174b:75bb with SMTP id 38308e7fff4ca-2ec3cea1b81mr28023181fa.28.1718874674762;
        Thu, 20 Jun 2024 02:11:14 -0700 (PDT)
Message-ID: <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com>
Date: Thu, 20 Jun 2024 11:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule 21.2
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
 <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 19:09, Alessandro Zucchelli wrote:
> Rule 21.2 reports identifiers reserved for the C and POSIX standard
> libraries: all xen's translation units are compiled with option
> -nostdinc, this guarantees that these libraries are not used, therefore
> a justification is provided for allowing uses of such identifiers in
> the project.
> Builtins starting with "__builtin_" still remain available.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 447c1e6661..9fa9a7f01c 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
>  # Series 21.
>  #
>  
> +-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
> +standard libraries: if these libraries are not used there is no reason to avoid such
> +identifiers. All xen's translation units are compiled with option -nostdinc,
> +this guarantees that these libraries are not used. Some compilers could perform
> +optimization using built-in functions: this risk is partially addressed by
> +using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
> +still remain available."

While the sub-section "Reserved Identifiers" is part of Section 7,
"Library", close coordination is needed between the library and the
compiler, which only together form an "implementation". Therefore any
use of identifiers beginning with two underscores or beginning with an
underscore and an upper case letter is at risk of colliding not only
with a particular library implementation (which we don't use), but
also of such with a particular compiler implementation (which we cannot
avoid to use). How can we permit use of such potentially problematic
identifiers?

Further, as to the rule mentioning file scope identifiers: Why is that?
The text in the C99 specification does not preclude their use, it merely
restricts what they may be used for. Why does Misra go yet farther?

Finally, why "partially addressed"? What part is unaddressed?

> +-config=MC3R1.R21.1,macros={safe , "!^__builtin_$" }
> +-config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}

First: Why the differences in = vs += and in absence vs presence of .*

Second: The rules, according to my understanding, are about us defining
or declaring such identifiers, not about us using them. There shouldn't
be any #define, #undef, or declaration (let alone definition) of such
entities. All we do is _use_ them as e.g. expansion of #define-s. Thus:
Why is a deviation needed here in the first place? Then again - maybe
I'm reading this wrong, especially the leading ! may perhaps be some
form of negation.

Jan

