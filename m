Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F4816798
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 08:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655675.1023381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8GM-00064L-9n; Mon, 18 Dec 2023 07:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655675.1023381; Mon, 18 Dec 2023 07:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8GM-000629-6e; Mon, 18 Dec 2023 07:42:06 +0000
Received: by outflank-mailman (input) for mailman id 655675;
 Mon, 18 Dec 2023 07:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rF8GK-000622-Mz
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 07:42:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed6c652f-9d78-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 08:42:00 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so26026435e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 Dec 2023 23:42:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c384d00b004030e8ff964sm42972289wmr.34.2023.12.17.23.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Dec 2023 23:41:59 -0800 (PST)
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
X-Inumbo-ID: ed6c652f-9d78-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702885320; x=1703490120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUOu6YYXKQBzpeitVPIjuzsau7+hn+uuhnA8u1uaQ/I=;
        b=WxOM4VRCSGAoSotGpyMhySh49vmWbfJ/2y/ucuTy5s4nG/sVqHkJU2YDFip+0qaYe5
         8UH9+tac/5rikgGCsrE/8KvmMgz01rV5e+qTwfGrw98BR2IYiwDwTI/wSUBmovnEYtZg
         /FAQ1jGnIl2DMDyFpn0zI3r+MpIjiyjdf/CqerwhXWRQvG31M7CL4Ds50eNIdAzBGxLV
         hJmNpkCVCKqXh6Etlj9k9/xJr9xqukce8DRLJxe37zUOE2MQv7ifEJoYVvN3cMBpPFZg
         oNeqrqjomf64dBAPJX1iUXEsP+5oRul8HnmzOgcuCJddpQRFeJeR+yHMlCPqUkuSDOSC
         7xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702885320; x=1703490120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUOu6YYXKQBzpeitVPIjuzsau7+hn+uuhnA8u1uaQ/I=;
        b=beAko5jMBRT5bFl7vErDOwGL4iFI9mwnP6EzYZ52ulIAy43OWYyis4albmtfxSzfDW
         lA7xQbAwT7yN8qixCDvENwzDBaGL/NMf7HMWbQlVgGn47ao4CaeTMdxTH5j58tFcNcVT
         V7aHqb5BAmLvCMWnpZLg2Ghz8alN/RQge8y/i75f0cGiKZbz7u8Dw6StluFAN3MSMr80
         7RCYZlT7UyUE/i++dzhvnJrFw+mZFI7eQmODaHQG2FJJkWEXwKBF1i4+sXW5gA/K+aDc
         kzFURPYdaoozBXXOvEBBdilqQ2Atxkq9Eo9amUo+zoGtwbw12HzHdUr+wwI2TTxKINep
         poTg==
X-Gm-Message-State: AOJu0YxNMUWCVBw5vOdEcR+nuytaiVQ1EoZvb77sawb2xFxEFZqkCYr+
	wbArK9IQciHwlsUChGwp9cKj
X-Google-Smtp-Source: AGHT+IFkY+JBZGBm1N86XLV9Rs0yLe8I4VmRrLCnqPBJ6S9ia/ip3gsQL1+dKZzUF724gtoKJnnEQg==
X-Received: by 2002:a1c:6a0e:0:b0:40c:2617:69c4 with SMTP id f14-20020a1c6a0e000000b0040c261769c4mr7958415wmc.78.1702885320230;
        Sun, 17 Dec 2023 23:42:00 -0800 (PST)
Message-ID: <a011c39d-7154-47d3-8604-073bcabb645b@suse.com>
Date: Mon, 18 Dec 2023 08:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
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
In-Reply-To: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 10:26, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -327,6 +327,34 @@ therefore have the same behavior of a boolean"
>  -config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
>  -doc_end
>  
> +#
> +# Series 16.
> +#
> +
> +-doc_begin="Switch clauses ending with continue, goto, return statements are
> +safe."
> +-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with a call to a function that does not give
> +the control back are safe."
> +-config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
> +safe."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with failure method \"BUG()\" are safe."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses not ending with the break statement are safe if an
> +explicit comment indicating the fallthrough intention is present."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
> +-doc_end
> +
>  #
>  # Series 20.
>  #
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -276,6 +276,34 @@ Deviations related to MISRA C:2012 Rules:
>         therefore have the same behavior of a boolean.
>       - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>  
> +   * - R16.3
> +     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with a call to a function that does not give
> +       the control back are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with failure method \"BUG()\" are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Existing switch clauses not ending with the break statement are safe if
> +       an explicit comment indicating the fallthrough intention is present.
> +       However, the use of such comments in new code is deprecated:
> +       pseudo-keyword "fallthrough" shall be used.
> +     - Tagged as `safe` for ECLAIR. The accepted comments are:
> +         - /\* fall through \*/
> +         - /\* fall through. \*/
> +         - /\* fallthrough \*/
> +         - /\* fallthrough. \*/
> +         - /\* Fall through \*/
> +         - /\* Fall through. \*/
> +         - /\* Fallthrough \*/
> +         - /\* Fallthrough. \*/

I was puzzled by there being 4 bullet points here, but 5 additions to the
other file. I don't think the wording here is sufficiently unambiguous towards
the use of the pseudo-keyword. If that's to remain a single bullet point, imo
the pseudo-keyword needs mentioning first, and only the talk should be about
comments as an alternative.

Jan

