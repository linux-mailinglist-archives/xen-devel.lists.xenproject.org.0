Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342C9107CB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744722.1151826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIZs-0000At-To; Thu, 20 Jun 2024 14:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744722.1151826; Thu, 20 Jun 2024 14:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIZs-00008y-QZ; Thu, 20 Jun 2024 14:15:52 +0000
Received: by outflank-mailman (input) for mailman id 744722;
 Thu, 20 Jun 2024 14:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKIZr-00008s-8p
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:15:51 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97fec7b2-2f0f-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:15:49 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so11286991fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 07:15:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb90a52sm12368294b3a.210.2024.06.20.07.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 07:15:48 -0700 (PDT)
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
X-Inumbo-ID: 97fec7b2-2f0f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718892949; x=1719497749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gbU2ee9jF4hkOpmKc2Nxm5GvPvRgK+PQP3h7UAYtCUw=;
        b=Jjt9DRB3i5z/d+oLh9yc3nJPHFnPHh4WaMGUaE0FMNHt2JD7w0E7yIB8IQyeKJkMpc
         ri1qdQkhFyxpRiWYEu/it9YJ9l7SrmypQqFDJMF9dShSOfeKvUDAgwywvR9nk3WMTXwq
         nWGkJdaQETemZOFp6jwLeLemZE/6TC36QBWy4WUr/Ka1unigmhB/GxgRmvMIUFngZjAQ
         THKWqqUhAwLann8Wv494onFN2qGBkWgKkvMm/xbrdqTiJAHh6LOZ8rOzigGfED/h/wjF
         s0tcsXTG5fGVa4MfuwyE+u9HXL4sIoIvW1eCYVaHLm3OCOoNmMxkvP04JLZLoGO361U6
         hFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892949; x=1719497749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbU2ee9jF4hkOpmKc2Nxm5GvPvRgK+PQP3h7UAYtCUw=;
        b=goPBVul9OQFruHYcxPmQDKtFQQPpJ8gCmtHHB8//BIgkKGGdMvjaDv3ZCirFe0+jlT
         zjxe+V2EdNbuLMCKi4fx5eJE7RI2KjH9wE/meeiOTivtoeP+R9HChLltMNXCr5/mdnpT
         9BSgx6pFByWWSPXZ+n5rBd8DKo5l+0B66ODRhXtBMoJBFMIhMcJnO6U5sXubXzUMDbfb
         Kdi1SvLVEKRGDa1r6NE3dCCwsfXQVv9ZC50KIk9ApNbKS3h0rws9+C8qO60ja+pEAPdc
         PAyykk/r9/tTsMrUlpg5WI8MOL/ea16Pn0mYIAnJJtcEBB5CGoojbqjNO8/NiZE4paWh
         dp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWauhRzHsMVcQguT95WNlO6SUMcdbGfFas7yYoimDsCgODMjXC5O/J2G522kM8Nsjxv82FFuFnQwx2rzkpQgfcdmrV/9U8pt/zH1u9sLBY=
X-Gm-Message-State: AOJu0YyjYulhrDfITdTeVsF/xfBDkNkOu5TpUoagRY9Sze6ZdX9Fc56K
	SwjAbYS7CkBwW2p2DZhmr2dyscZsQBVTbXCfsc+Kda7GL+kNxvhkifK73N3PjQ==
X-Google-Smtp-Source: AGHT+IFQMown054xx4S8PYhqYplypnRCeXdPHxjGhE7O2HwUfzD0YTHbv1q9suBSt2iOabYpiw0Xjg==
X-Received: by 2002:a2e:8811:0:b0:2eb:e9cf:e179 with SMTP id 38308e7fff4ca-2ec3ce9419fmr38769801fa.21.1718892948758;
        Thu, 20 Jun 2024 07:15:48 -0700 (PDT)
Message-ID: <af656be1-3950-45f3-9da9-f377d9e6396c@suse.com>
Date: Thu, 20 Jun 2024 16:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/13] automation/eclair: consider also hypened
 fall-through
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1718892030.git.federico.serafini@bugseng.com>
 <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
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
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 16:02, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -400,7 +400,7 @@ safe."
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all[ -]?through.? \\*/.*$,0..2))))"}

Is is a regex, isn't it? Doesn't the period also need escaping (or enclosing
in square brackets)? (I realize it was like this before, but still.)

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -353,6 +353,10 @@ Deviations related to MISRA C:2012 Rules:
>         However, the use of such comments in new code is deprecated:
>         the pseudo-keyword "fallthrough" shall be used.
>       - Tagged as `safe` for ECLAIR. The accepted comments are:
> +         - /\* fall-through \*/
> +         - /\* Fall-through. \*/
> +         - /\* Fall-through \*/
> +         - /\* fall-through. \*/
>           - /\* fall through \*/
>           - /\* fall through. \*/
>           - /\* fallthrough \*/

Nit: Can the capital-F and non-capital-f variants please be next to each other?

Jan

