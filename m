Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674F898A39
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700929.1094763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOB3-0007s6-EL; Thu, 04 Apr 2024 14:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700929.1094763; Thu, 04 Apr 2024 14:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOB3-0007pG-Bf; Thu, 04 Apr 2024 14:34:53 +0000
Received: by outflank-mailman (input) for mailman id 700929;
 Thu, 04 Apr 2024 14:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsOB2-0007pA-2H
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:34:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dee01b1-f290-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 16:34:49 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343cfa6faf0so250685f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 07:34:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o5-20020a5d6845000000b00343b252b096sm2693810wrw.23.2024.04.04.07.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 07:34:49 -0700 (PDT)
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
X-Inumbo-ID: 7dee01b1-f290-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712241289; x=1712846089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f2Z/bUHj9MWmTO5PVF+hQl2fdHntcYSQfksFN+TjXw=;
        b=W8pj1gMpwPS6nKU8EnuaQyPzO8ZnaDKv/CrJ5jxeeY0XxDZjqczxRa6SyIBRh49MHh
         PWe4wKTptWbDpv0ff/6It11dDV6khZZ3xPL6HkIOEredgdhlPkzFSWfHsvsqSXA10MfE
         YXdaGK8npTdnuBHwpavWmP50spUn3krYGYqIiqsbIYtt/ZCjWlUWCsBQGiXIAXO1UgzF
         OyXaI+GWUdK0S/8GZQ+bqnVDeopYJ0VZpLaoG2EpIdHJOZsl9QNbdUFTMNgUe9p7iMkh
         /RbHGoETjqqUU2cvJNj24iD5rlgJV3ibd3dvNB+TtQm2UCVJG555PcwrlnVVQAKePjOC
         sA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712241289; x=1712846089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f2Z/bUHj9MWmTO5PVF+hQl2fdHntcYSQfksFN+TjXw=;
        b=kN815/PcE3PdgNaMo3XHTUuYpoVGH7OZnMx4ebXXNAKz6Pl/kupiCu41+bKthShp5m
         ts1m59mpTS0Dx1E1nhBJssjnsAPBAOCNnhcBmmxF4IUUMQmazOgmPazKMJBRcCow914S
         tLZeBOZgghlDIArpuDV3sPxL9ZYF9vLGZ3Lnd5j/Viuqh5juKP/N6XJCbhHQiA3QYjW+
         4DOV8OGFKY5+VZJgyM8YeuJ0u/vahOQaXjH/VlFZiTFYA/a0jNVmn2PArqKL7V+dnuKy
         ZoclxbRpBsaSlX3BhhffuOhsMtdExWcosLUskcUL7CDOuAIlStsoxPX77zACvfZvB4lf
         Al/w==
X-Forwarded-Encrypted: i=1; AJvYcCXvC5v1ESgWUTOdy5d+R158JxeCReQs2e0kOjc0/K0bYhyA9gh+0lmmmewiz0ZFTbd2/D0RuzaAu5mVn2XHjoO50se1stqydHrXT+NKopo=
X-Gm-Message-State: AOJu0YxA4IKfVSXkPuU6a7ZW6dlWkrLtuJQbZduQ7f88fLzY4A7Bs73q
	mULmzefY3gg9Jh5nirGAGzieE43uUauqQYW471f9bU1zP7dfSlqHpqFItpoysw==
X-Google-Smtp-Source: AGHT+IGyavB3vywYH5R43bM6PkSkgaxWyDeIAiAJpG5ZHYWYK07MrQqZW3Me49nStnw+UoBAI7ELIA==
X-Received: by 2002:adf:ce0c:0:b0:33f:84a1:7eb8 with SMTP id p12-20020adfce0c000000b0033f84a17eb8mr2226465wrn.1.1712241289324;
        Thu, 04 Apr 2024 07:34:49 -0700 (PDT)
Message-ID: <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
Date: Thu, 4 Apr 2024 16:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012
 Rule 13.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
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
In-Reply-To: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 16:21, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -333,6 +333,14 @@ of the short-circuit evaluation strategy of such logical operators."
>  -config=MC3R1.R13.5,reports+={disapplied,"any()"}
>  -doc_end
>  
> +-doc_begin="Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the func parameters without evaluating them."
> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))))"}
> +-doc_end

alternative_vcall(), for now at least, is x86-only. Why blindly deviate it also
for Arm?

> +-doc_begin="Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very specific cases where by code inspection you can see that its usage is correct. The BUILD_BUG_ON checks check that EFI_TIME and struct xenpf_efi_time fields match."
> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^chk_fld$))))"}
> +-doc_end

As indicated on earlier occasions - when a macro isn't global, its deviation
better wouldn't be global either. An identically named macro may be introduced
elsewhere, and may not need deviating there.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -279,6 +279,18 @@ Deviations related to MISRA C:2012 Rules:
>         the short-circuit evaluation strategy for logical operators.
>       - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>  
> +   * - R13.6
> +     - Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the
> +       func parameters without evaluating them.

Just to mention it: The return type of the function isn't really of interest
there. What's being checked is that the argument types match the corresponding
parameter ones, which otherwise would "naturally" be done by the compiler when
seeing function calls. Might be useful to state no more and no less than what
is really needed.

Further, according to the discussion on the matter: alternative_call() is
quite similar in this regard, just that it uses typeof(). Imo it should be
deviated here as well right away, no matter whether Eclair can actually be
configured to also check typeof() and alignof().

Jan

