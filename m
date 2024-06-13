Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B15906659
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 10:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739683.1146620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHfd6-0007fu-NR; Thu, 13 Jun 2024 08:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739683.1146620; Thu, 13 Jun 2024 08:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHfd6-0007e3-Kb; Thu, 13 Jun 2024 08:16:20 +0000
Received: by outflank-mailman (input) for mailman id 739683;
 Thu, 13 Jun 2024 08:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHfd4-0007dx-RP
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 08:16:18 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34121396-295d-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 10:16:15 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso1005074e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 01:16:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56dd2daasm45696566b.97.2024.06.13.01.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 01:16:14 -0700 (PDT)
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
X-Inumbo-ID: 34121396-295d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718266575; x=1718871375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ET4vw2AlU+0cfjqxdZV81Wk6N10Ew+YwgelARvdfJQ=;
        b=TDj5YQtB8sJp23gQQKCxi6zdas9Grlihk8KaG4bc/yhT6lHjbDC9XmM9M7dHhESRns
         OalvEyjhMMSvH7JsoRi49mDbaVmJSb9VLdOYN7HtCiJqf8OtCnYbXtv26ZgHt8WDnX7q
         /KrkMmR/iGVOgdJUc2Ml3dDAC9QBbMnCT5JJVZP6inYbjShrTT2/f6nKs245X1G5/kze
         9LHcXmWvdx2N6ZcduddELFw98q8kvDObXinE9idGaQ+IS9nSj+0m1mhvzPnEyt2Hrm8m
         P4rKJrbTBi4hfgcxB5AdwhR/s8H61GkJE2efO52ccRN8AznrI4LII7G4apfWFRvkuZpq
         wIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266575; x=1718871375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ET4vw2AlU+0cfjqxdZV81Wk6N10Ew+YwgelARvdfJQ=;
        b=ACd30a8EIyBi9+UxmwkotyjZR+XG7QQ29+T/03QKnsO03MGInShE/8ddGEqYbo7xpb
         v5SDFs4C1xPCYuGVJABrCrRrzF96hwXhPDh44oJ016t0ntZDOg6txbVrX1yqzL3H0aRk
         apLlZWRsEtDOjBB3X7cE7pfZKR8862RiAv8SjGkXB93t7auPc7l7CievtCBCv/X+Xk1J
         MFqByMnuD8xsK8T1BXC/pFAU8kdISJyA9gRufIJ05hjxvEbwRC7pgSSk6qoV3jHQIfOV
         +Leh4s1aJhWSyEF6TiuQJUVuOWTxhcGq5Jr/kCq1w9F/ZzmsOiaxJTesDviCEgUZHjsi
         dO2g==
X-Forwarded-Encrypted: i=1; AJvYcCXNt+YbYg961BleY1N1ZyZ49AkjQ5+sVIuI4sbP/92d/+1xQKu+YdEWZTP7Oz0F9Vr1IgtPAYpaHOJ3mCXDrKCNb4oAboJOdYNzMQYBeAA=
X-Gm-Message-State: AOJu0Yxz/wiUFwUDXDP4yQLaPyw6nR9Mn7lVRWHjhlK8TwIVCxL9bZgm
	5hTanNLQfAWfdHIHUcryXftQEbd6t6xXZ9Mky1EcxuP3XSXmjO2alqQUaHiEyQ==
X-Google-Smtp-Source: AGHT+IEc067c8Jx+141+0kjmU/kly8F3BtRw6SVvxaMDdG7Y6qEkHz8/wu59gOh9k5jSkoIOe1mtVw==
X-Received: by 2002:a19:e00a:0:b0:52c:8811:42f7 with SMTP id 2adb3069b0e04-52c9a3d2020mr3075963e87.19.1718266574844;
        Thu, 13 Jun 2024 01:16:14 -0700 (PDT)
Message-ID: <cbd59b32-213b-4b5c-90fb-67906b7ae680@suse.com>
Date: Thu, 13 Jun 2024 10:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: extend existing deviations of
 MISRA C:2012 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20c0779f2d749a682758defc06514772e97c9d89.1718260010.git.federico.serafini@bugseng.com>
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
In-Reply-To: <20c0779f2d749a682758defc06514772e97c9d89.1718260010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 08:38, Federico Serafini wrote:
> Update ECLAIR configuration to deviate more cases where an
> unintentional fallthrough cannot happen.
> 
> Add Rule 16.3 to the monitored set and tag it as clean for arm.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> The v1 of this patch did not receive any comments:
> https://lists.xenproject.org/archives/html/xen-devel/2024-05/msg01754.html
> I am sending this new version with some wording improvements.
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 30 ++++++++++++++-----
>  .../eclair_analysis/ECLAIR/monitored.ecl      |  1 +
>  automation/eclair_analysis/ECLAIR/tagging.ecl |  2 +-
>  docs/misra/deviations.rst                     | 28 +++++++++++++++--
>  4 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 447c1e6661..dd9445578b 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -364,14 +364,29 @@ therefore it is deemed better to leave such files as is."
>  -config=MC3R1.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>  -doc_end
>  
> --doc_begin="Switch clauses ending with continue, goto, return statements are
> -safe."
> --config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
> +-doc_begin="Statements that change the control flow (i.e., break, continue, goto, return) and calls to functions that do not return the control back are \"allowed terminal statements\"."
> +-stmt_selector+={r16_3_allowed_terminal, "node(break_stmt||continue_stmt||goto_stmt||return_stmt)||call(property(noreturn))"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_allowed_terminal"}
> +-doc_end
> +
> +-doc_begin="An if-else statement having both branches ending with an allowed terminal statement is itself an allowed terminal statement."
> +-stmt_selector+={r16_3_if, "node(if_stmt)&&(child(then,r16_3_allowed_terminal)||child(then,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
> +-stmt_selector+={r16_3_else, "node(if_stmt)&&(child(else,r16_3_allowed_terminal)||child(else,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
> +-stmt_selector+={r16_3_if_else, "r16_3_if&&r16_3_else"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_else"}
> +-doc_end
> +
> +-doc_begin="An if-else statement having an always true condition and the true branch ending with an allowed terminal statement is itself an allowed terminal statement."
> +-stmt_selector+={r16_3_if_true, "r16_3_if&&child(cond,definitely_in(1..))"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_true"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with a statement expression which, in turn, ends with an allowed terminal statement are safe."
> +-config=MC3R1.R16.3,terminals+={safe, "node(stmt_expr)&&child(stmt,node(compound_stmt)&&any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
> --doc_begin="Switch clauses ending with a call to a function that does not give
> -the control back (i.e., a function with attribute noreturn) are safe."
> --config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
> +-doc_begin="Switch clauses ending with a do-while-false which, in turn, ends with an allowed terminal statement are safe, except for debug macro ASSERT_UNREACHABLE()."
> +-config=MC3R1.R16.3,terminals+={safe, "!macro(name(ASSERT_UNREACHABLE))&&node(do_stmt)&&child(cond,definitely_in(0))&&child(body,any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
> @@ -383,8 +398,7 @@ safe."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>  -doc_end
>  
> --doc_begin="Switch clauses not ending with the break statement are safe if an
> -explicit comment indicating the fallthrough intention is present."
> +-doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>  -doc_end
>  
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 4daecb0c83..45a60074f9 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -22,6 +22,7 @@
>  -enable=MC3R1.R14.1
>  -enable=MC3R1.R14.4
>  -enable=MC3R1.R16.2
> +-enable=MC3R1.R16.3
>  -enable=MC3R1.R16.6
>  -enable=MC3R1.R16.7
>  -enable=MC3R1.R17.1
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index a354ff322e..07de2e7b65 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -105,7 +105,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 36959aa44a..f693bb59af 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -309,12 +309,34 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `deliberate` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Statements that change the control flow (i.e., break, continue, goto,
> +       return) and calls to functions that do not return the control back are
> +       \"allowed terminal statements\".
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with a call to a function that does not give
> -       the control back (i.e., a function with attribute noreturn) are safe.
> +     - An if-else statement having both branches ending with one of the allowed
> +       terminal statemets is itself an allowed terminal statements.

Nit: "... terminal statements is ... terminal statement."

> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - An if-else statement having an always true condition and the true
> +       branch ending with an allowed terminal statement is itself an allowed
> +       terminal statement.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with a statement expression which, in turn, ends
> +       with an allowed terminal statement are safe (e.g., the expansion of
> +       generate_exception()).
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with a do-while-false which, in turn, ends with an

Maybe more precisely "the body of which"?

> +       allowed terminal statement are safe (e.g., PARSE_ERR_RET()).
> +       Being ASSERT_UNREACHABLE() a construct that is effective in debug builds
> +       only, it is not considered as an allowed terminal statement, despite its
> +       definition.

DYM despite its name? Its definition is what specifically renders it unsuitable
for release builds.

Also I think the sentence wants to either start "ASSERT_UNREACHABLE() being a
..." or wants to be re-ordered to e.g. "Being a construct that is effective in
debug builds only, ASSERT_UNREACHABLE() is not considered ..."

Jan

