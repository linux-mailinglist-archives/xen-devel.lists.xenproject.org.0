Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A3A97FA2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963989.1354869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TxC-0007Rg-79; Wed, 23 Apr 2025 06:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963989.1354869; Wed, 23 Apr 2025 06:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TxC-0007Pl-4Z; Wed, 23 Apr 2025 06:51:30 +0000
Received: by outflank-mailman (input) for mailman id 963989;
 Wed, 23 Apr 2025 06:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7TxA-0007Pf-Kb
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:51:28 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6053246c-200f-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 08:51:26 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so5949883f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:51:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330d8sm18094878f8f.33.2025.04.22.23.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:51:25 -0700 (PDT)
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
X-Inumbo-ID: 6053246c-200f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745391086; x=1745995886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Dvwzb+yt+8N+8e2Iu4VzObQRc5psyPUeFfrGwZ1Y0=;
        b=D1BL284LfL7Z5B+B+/vDTZDVoEk21Y9b0ggIrjFVHqPLlvyMVFX6Ia68ql8nOSE6Ij
         Z4yZLsOKqUR36LHaxvsbnyqgknhYEpAvIpOOzb8mBGFLO+0b+BfwBDNinQAyAhJ0EX0X
         fWOWYCaFgDhsT/wOqA8CF3Qt7QHM5/OWaqu8a6i4kYJFYQvjkWpv7e0NAjOKlJGdVtYh
         PLEf6EESfpzUy60X1KlKAVit6FqAE31l+Lwu16C72hpLdLHoOj72MBQyDGVr5CBGOGc9
         GLsWG7IsxEswbjiOeSpX1/UvSmfiY0XfgdfK2bpntBcTlEqlWaO4adNzNGa7TmZHS+0Q
         I/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391086; x=1745995886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Dvwzb+yt+8N+8e2Iu4VzObQRc5psyPUeFfrGwZ1Y0=;
        b=M0E1zPJc4unDb1u2wdoKT4XpW+k1Z1V26vTXuXCfhhQlHNHGHGJTPlKv9BqBmTkKRr
         dpJJqYWZslvg+qs3SQuM/H8PrhWxuicKc8xDv0pwR4St0ioINkkFoM6trEHbIDGumBEm
         hLwEUBic5HtBjRbQYETjMQQNM8NHTdMpGb30bErmVMxzA3P24n200H18oPFoBCPv19yp
         AzH2i/EZ0soC3MvLy5glDB1pHA52deq/mRqDkvcIIwdUElv8mgBn1f7rR2lmzXBuRuAp
         eCVzLzj3C7fsyHkT/eRw6Kz+l85/zQF3sPKufP4QFDTU5RAKoDDz2or0JREnDND/8hjt
         eq3A==
X-Forwarded-Encrypted: i=1; AJvYcCU1wPKhMXEe0dKujuYd72mqksdO/pPLQJdHc2tB9XVdvu7Ie2p8RywEH294/4u+pPbeO5zIoClLtfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQCPWNSMNbmjQi/ll6o3irVwYUFBlia80VTeHBLubrqo3GFP4G
	1ciueS0NBC/9eIX2sSGQnkYMCqprOsr4VBIgkwcG5HqfG3P0ldWXZwnaDFXdew==
X-Gm-Gg: ASbGncvNDainJnq2sMrxfculymWk2ZsSR1eAiP2dSXzXMnhizsr8KB0frIzc3V4uEZ0
	PYasiaHcRRfpjQ+zC74tNfzt6aFqUvo2jLVIjvekx+T3j/ioqNxbw70MNUAZ0azxTTysFgtjvMH
	tmAC4NheY7sOWO6PCfWIGln5qVI/L7zt3PGvIqZC+vyzAovL+ZkEmEg9pNTp7shB2nIdAeHG4cg
	5Efgh26GqLaHndhMqfFeiO0xTiwI/HRE2vYkmSzUNgvP+lr7PD578iJshWOu3e6npv1jYwClOFP
	IK2WhNdgxOXIFluJsMXL3H3lEz1tcLY00XKcB4gn2aHSKypWnh1m0orRFwrr7vxRYritfRfkgBQ
	ZcbOrtvMMKHf3l8JSODJetwydZJb7Zr5HzxFZ
X-Google-Smtp-Source: AGHT+IGtULPeukIvMQdYlsupqfs3vcDZR8sZm8Lb7vKuxS3BoGSrGfxxPBx33RXGA+I92gZfwpmOAQ==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39efbb02156mr12876531f8f.49.1745391085717;
        Tue, 22 Apr 2025 23:51:25 -0700 (PDT)
Message-ID: <b595b675-a697-4dea-a698-9b3df08a4d3b@suse.com>
Date: Wed, 23 Apr 2025 08:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] misra: add deviation of Rule 10.1 for unary minus
To: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
 <e2bb53abc608d3908aef7fb497f208ca25d2c0e8.1745364478.git.victorm.lira@amd.com>
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
In-Reply-To: <e2bb53abc608d3908aef7fb497f208ca25d2c0e8.1745364478.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 01:43, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The unary minus operator applied to an unsigned quantity has
> a semantics (wrap around) that is well-known to all Xen developers.
> Thus, this operation is deemed safe.

Please, as you have it in the other two patches, can the rule title be
reproduced in such patches? As it stands, without mentioning the doc
version either, someone finding this later on may be left with a pretty
wide ambiguity as to what's meant.

> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  docs/misra/deviations.rst                        | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 303b06203a..2cfce850bd 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -347,6 +347,12 @@ constant expressions are required.\""
>    "any()"}
>  -doc_end
> 
> +-doc_begin="Unary minus operations on non-negative integers have a semantics (wrap around) that is well-known to all Xen developers."

Why "non-negative"? A variable of type "int" holding a non-negative value is,
aiui, well within the bounds of the rule here. It's unsigned types where the
use of unary minus would constitute a violation. You actually say so ...

> +-config=MC3A2.R10.1,etypes+={safe,
> +  "stmt(node(unary_operator)&&operator(minus))",
> +  "src_expr(definitely_in(0..))"}
> +-doc_end
> +
>  #
>  # Series 11
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index a93ef1ff44..8c1f97358a 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -321,6 +321,12 @@ Deviations related to MISRA C:2012 Rules:
>         If no bits are set, 0 is returned.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R10.1
> +     - Applying the unary minus operator to an unsigned quantity has a
> +       semantics (wrap around) that is well-known to all Xen developers.
> +       For this reason, the operation is safe.
> +     - Tagged as `safe` for ECLAIR.

... here, just that this one's getting blurred by using "quantity" when
"type" is meant. Imo we need to be pretty precise here, using terminology
that's used by the standard or the Misra rules, and not anything "coming
close enough" in someone's perception.

Jan

