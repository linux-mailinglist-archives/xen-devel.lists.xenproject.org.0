Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7647A97F7D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963976.1354860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Tqx-0005bY-IS; Wed, 23 Apr 2025 06:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963976.1354860; Wed, 23 Apr 2025 06:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Tqx-0005Z2-Fi; Wed, 23 Apr 2025 06:45:03 +0000
Received: by outflank-mailman (input) for mailman id 963976;
 Wed, 23 Apr 2025 06:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Tqv-0005Yw-Ty
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:45:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c53921-200e-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 08:44:52 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso41801715e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:44:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330casm17418044f8f.22.2025.04.22.23.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:44:51 -0700 (PDT)
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
X-Inumbo-ID: 75c53921-200e-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745390692; x=1745995492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w4o5Jmzbz+z/6zOW4ycF8K1RVhT9ZQ/7CsXF09EuTRw=;
        b=bnlmnf8BRLjzgi7Aq92OYeJTahXu7WWJngF6x/RAAX/tyZVVngDcRGfB7Q5Ivg59NK
         VdEcJdxJ7JLGk9/0pow55uZzsfB25TJf5HVIjcWQK8cXJYcUgLK0b5r9YJkT3r5TLjB2
         8i6fSSvkVLBUtisQafPDWH0WmsL7e5/MVeqQ9SlrB/zcCBfwPfozMOAzWjK8cI5a52T7
         C8maDX66YORCkikxPp5iE6QL9K9Nqm0+T/Xu+aZeNz3x+MSo85NdLoaZTFZJ362CSfMU
         TnqCCtBVLfKvGkC11mJBx7Q+8/Kie4HO7Dbrk9hu3qSzCnozKhqCygf+OVffo4zZXcNo
         YEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745390692; x=1745995492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4o5Jmzbz+z/6zOW4ycF8K1RVhT9ZQ/7CsXF09EuTRw=;
        b=m1Av0pgMvE4lxxYm0Q1tym0c2ZUaqmvHPaAMt3e8iUiVpyJHAIde33ipQLoS1PMl7X
         bPfexPBg0KcoMcTBKoo6t83YpPEIkggUpuZm60QJKqFr690/JHzq3PrFmIv81Cbfc8SY
         O3Y54c6eF+lnb821AAXGNbtXnK5Gb1LQzpRIEyakYzG2NUc/uSDWsRis8MYc2l2sELm9
         nlfnAY+0gz4mjeSZ+ItF5C80EhHgJ1/d4k2BUP7rFnYc1R/tq6PZ1ofjGSi7iSjQQWGv
         130Tu/jdo7k6uXYaEIBm2MRiHN+OyXEZUOEopp5AMGyYxoR5/MnKwVjXhxbSjWvF3rb8
         /nkg==
X-Forwarded-Encrypted: i=1; AJvYcCUG6NftPrqTUarBrJwsqjVWhIAToSGnvjHYVhyNQxjNA5BCQIf9pTi27tX48KRiFldPq7RgXsn2wUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt1TJDyvgSqOcmAIaQy/V4Yxx3WaXZtUmOr0uAZhJWbm5RsMrT
	ooEKEpY9ZbxYpOHQLfP2haR+cyrcX4VBKOyCgBOGoMRc/CuD7+040AuO28FmbA==
X-Gm-Gg: ASbGnctWOFWn4TF36LaR24QnqrsCl3CL1oq5JouikuXRY+qNmq7JCkn+rGHHWTQpQS1
	zBp3GYAQENnCOQzSYKi4o5NAzQLgVhN+fMRRR3R/+my3mrmAEGPYu4BCdeRPaQUuBUoe5qrTOxn
	EvGuJeLNqa6RDrP02NAD0cOxlYsy3G/+P7AK0Wl5nA0l8/d44e1awpzWB/IqVxRac8kHG9ZtxqS
	WVNCwTuxus3WAEdcqRQr414WzyXm9YGGoQcmWH21PLOSdaaZye2xLj0dNQjdMR/zS4uRcJowbZm
	XEMUjKpZ24ft7SrY4EyIx7QGq6cDtD0K7bFxrcuvAjQatV/M4E4rPNuek+wlnoirmMUZUM0YyGX
	NaJy4f9/0buWLNm4snmsQiSSz2Q==
X-Google-Smtp-Source: AGHT+IHyWV1taKXTrt0fEc7mU/TzUFLyjTMvpy7HPfwpOOtnsuettNWrkOU+mEisKh/Tus4e2Kz8mg==
X-Received: by 2002:a05:6000:2501:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39efba397f5mr14396546f8f.3.1745390692110;
        Tue, 22 Apr 2025 23:44:52 -0700 (PDT)
Message-ID: <139aa595-8b41-44e7-b205-415443c8c357@suse.com>
Date: Wed, 23 Apr 2025 08:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] misra: add deviation of Rule 5.5
To: victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
 <56fb2180c59a9d6bbc7b983dd8bfd6a2122e405c.1745364478.git.victorm.lira@amd.com>
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
In-Reply-To: <56fb2180c59a9d6bbc7b983dd8bfd6a2122e405c.1745364478.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 01:43, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 5.5 states that:
> "Identifiers shall be distinct from macro names".
> 
> A common pattern in Xen is to have a function-like macro that acts as a
> "wrapper" for the function to be called:
> before calling the function, the macro adds additional checks or
> increase/decrease the number of parameters depending on the
> configuration.
> 
> Update ECLAIR configuration and deviations.rst.
> 
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
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ffa23b53b7..303b06203a 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -114,6 +114,14 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
> 
> +-doc_begin="Clashes between function-like macros and function names are
> +deliberate since a common pattern in Xen is to have a function-like macro
> +that acts as a \"wrapper\" for the function to be called:
> +before calling the function, the macro adds additional checks or
> +increase/decrease the number of parameters depending on the configuration."
> +-config=MC3A2.R5.5,reports+={deliberate, "all_area(macro(function_like())||decl(kind(function)))"}
> +-doc_end
> +
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index d116aca7b9..a93ef1ff44 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -130,6 +130,14 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - R5.5
> +     - Clashes between function-like macros and function names are
> +       deliberate

They may or may not be deliberate, depending on context. I don't think it's a
good move to deviate this more widely than necessary. If I get the expression
above (in deviations.ecl) right, even

void func1(int);
void func2(int);

#define func1() func2(0)
#define func2() func1(0)

would be deviated, which I don't think we want. Especially when, in a less
contrived scenario, the clash may not easily be visible.

Jan

> since a common pattern in Xen is to have a function-like
> +       macro that acts as a "wrapper" for the function to be called:
> +       before calling the function, the macro adds additional checks or
> +       increase/decrease the number of parameters depending on the configuration.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending on the
>         type of guest to service.
> --
> 2.47.0


