Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9F877DA3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691357.1077265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcaT-00022f-P8; Mon, 11 Mar 2024 10:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691357.1077265; Mon, 11 Mar 2024 10:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcaT-000219-ML; Mon, 11 Mar 2024 10:08:53 +0000
Received: by outflank-mailman (input) for mailman id 691357;
 Mon, 11 Mar 2024 10:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjcaT-000213-05
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:08:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ba74645-df8f-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 11:08:50 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so5013307a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:08:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j14-20020a170906474e00b00a44adc01f13sm2697155ejs.196.2024.03.11.03.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:08:49 -0700 (PDT)
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
X-Inumbo-ID: 5ba74645-df8f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710151730; x=1710756530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUHS0hw5GthlB6BizdBU0xbbpqvs867SBrZ9HQhcCdQ=;
        b=E0VQHxS6MavwVsm538mM4nKhApZXLfSZ8Ba/IWZ+YIa+oWSKiDKOONaa+mOM1sU+gd
         fLEZ1RXGQiK/Nc8rPGl2GACKvK1gjvWgmKYmgXsXUyYYmzp+I1vRFgCCAlZiIvL70XhC
         Vn46TEyClYmJ4cJAPgO38ZP8x2Ra7XrFB44Wt7WLAazRj0KM+QfbQzaev1jBz7pk1OoD
         94mZ8C6VOiOL0P59QjUkcfCv/h9i43omd9DD/te1e3OOLCAhbH7tcnvTh03hU9vwP11z
         v36zdYnE0lKfPU1zsdvJo3LZPbkOWtqXZLSLH6E8bIn/RRnXIuWrVYtv/h1yGwX6orQJ
         hXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151730; x=1710756530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUHS0hw5GthlB6BizdBU0xbbpqvs867SBrZ9HQhcCdQ=;
        b=hiDxyT7/4o0ZiODAdJ9c29ucleByk2oT6X+Fn/uuINlqB+Ieem8a8DVr3vF5qKfEtH
         bhVZYYnQAhjVg0gOaGqGtlArI8QE6Tbg7h8E5l2uEXzbwiHx1NDfQYlwChirzdNKBvdg
         nWlRxayv9GTtqL6BcEtbu7Vv20zuQYvET5QzliNE+TIP0MJEM/iB1DRKTMq9lt4wfOS1
         YngiqNJ1S81JXF1kfZjEcyJLBD3Sp4odYVr7uvxsdHT+HR7nzLgJoJLs2WxklM7c7EKJ
         oVTgOlqiNjtyxpSBLk463nMQ/OeJbfenO/vTyp3W8X82ssJWLQ9IrhXjWh0QNG2d6oaP
         wvgA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5fnn7hFjkEhINLL1CE3ghVZSSorXZqEVaIFS0Dxk1+YV3RzJaxTg3FGzie+ap6vBB4QSCZTLie7R++v+N3S3c/mRkY8xO2mgRx/8cuk=
X-Gm-Message-State: AOJu0YxTBLIRKaklH+H2zzyHRm/m13Rd3AcwicikjHzkptyKx9d+kv4F
	n+3ZNEy8Nm5m00GRrJ/ORTKr2r+9mDzi/FvDS8DFqU4KHtX+HyOZ5qSBt8SAhA==
X-Google-Smtp-Source: AGHT+IHKWlkOLJ0nPqpfDdjciCyKEVyTDO/m+Cfo6buab+FqcKBTPUwvAQ1nd/M0/jFNcIxRNceWhQ==
X-Received: by 2002:a17:907:8743:b0:a46:27ac:b954 with SMTP id qo3-20020a170907874300b00a4627acb954mr1610930ejc.54.1710151730195;
        Mon, 11 Mar 2024 03:08:50 -0700 (PDT)
Message-ID: <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com>
Date: Mon, 11 Mar 2024 11:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> Add deviation comments to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
> 
> This patch adds deviation comments using the format specified
> in docs/misra/safe.json for headers with just the direct
> inclusion guard before the inclusion guard since they are
> safe and not supposed to comply with the directive.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v3:
> - fix inconsistent deviation ID
> The patch has been introduced in v2.
> ---
>  docs/misra/safe.json                 | 8 ++++++++
>  xen/arch/arm/include/asm/hypercall.h | 1 +
>  xen/arch/x86/include/asm/hypercall.h | 1 +
>  3 files changed, 10 insertions(+)

What about asm-generic/hypercall.h?

> --- a/xen/arch/arm/include/asm/hypercall.h
> +++ b/xen/arch/arm/include/asm/hypercall.h
> @@ -1,3 +1,4 @@
> +/* SAF-5-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -2,6 +2,7 @@
>   * asm-x86/hypercall.h
>   */
>  
> +/* SAF-5-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif

Iirc it was said that this way checking for correct guards is suppressed
altogether in Eclair, which is not what we want. Can you clarify this,
please?

Jan

