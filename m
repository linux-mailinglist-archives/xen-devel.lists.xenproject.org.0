Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C191E21E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751716.1159754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHpT-0007Cq-U2; Mon, 01 Jul 2024 14:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751716.1159754; Mon, 01 Jul 2024 14:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHpT-0007BC-Pm; Mon, 01 Jul 2024 14:16:27 +0000
Received: by outflank-mailman (input) for mailman id 751716;
 Mon, 01 Jul 2024 14:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOHpS-0007Ay-JI
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:16:26 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fb08cc0-37b4-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 16:16:24 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso35922521fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 07:16:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-743148a5acfsm2201655a12.48.2024.07.01.07.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 07:16:23 -0700 (PDT)
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
X-Inumbo-ID: 7fb08cc0-37b4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719843384; x=1720448184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XANTur0bQEROZt2M8ETI6tgbdcdpVr9a8rKqMnJcvBc=;
        b=OGBUZTGkhgE0FGJ+mBilpeFKdz/3YYi8rSpLXr/IngtgLgAJBOPAQf0n8NaiZNAzx6
         Nfkpo2Z0gZzWp9XGzwP4BX3BUeI8HTZna2DVo8kZD7p2BFjgi4Xj5VXSeimoHYgNwLYf
         oN1pJqwRPj4cA+kQHBiBF5T2R2bwN15p3t2aJU1cCucd4rN+LGEG8Shl/4twin9MepXs
         HcxhoBwQXyzVCr2C021S6lxAVbqR6F/BnueV+xatqRKWGYLnhLTLSaAucQRemX8UoEK0
         J1GtD/9vE/RNGGppnGFRjdh1baUIL4Uv+pxIB+K14aFHgWDDh6OG/qZsbj2mp3xYInLH
         8y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843384; x=1720448184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XANTur0bQEROZt2M8ETI6tgbdcdpVr9a8rKqMnJcvBc=;
        b=pZ/BOJFNJtVyArvOfTGbNuy3DcR3t0tAhaZT8a+Ps55grT2NXb9xidzeKUrc4UYqm3
         fLHg+3GFo5oOkXggkIAeZsrxdCJDktOMS972fRSozG8TKBfg8XcMLAmU6xdTZ2sWyKUn
         6ZTF0BBlYRqjExYm+n76v77gk0LVtKRC+OYoMoRJytDdB1hK5oILOxG78QyD+4mWzK63
         HJ+I7q3QzdMctvB6T+xad8eVcLdA4WSgYAWyXgyAdinrIAN3805xBSMrzZdcR/2Rd7ya
         EQqB6I2w0lpJlGz3bcNY0Poh4YSVB/sXzGaNrWEgNXxxdOjBOeS3qpg1NvV+mvUJsMX8
         Ow3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmxjHFxQIHU0TQ30JM5M1l4WPR/PzMDwYJAmOzsqKzc5DLsFP4o0Q8uc0z7Yxe4R9w1rZB0g4dISls9lKK5+W+pIYa7ylv+4k6GTNvCJ4=
X-Gm-Message-State: AOJu0YxfS2AybB/cNKXcZwXbjQ+T1spqrQYz0GiMSk9d2+IyKlwJGx3Q
	0E2CxQ+jo6NnGTeTDUwAcgcsh5T8IcIUyNsSvYzFjZo12Vd2kJZ/6NLDbNk5Fw==
X-Google-Smtp-Source: AGHT+IESh34zxs4K0U6uM1j43f0tuzuORlGoFQfLhrFMKekJzegWiHLesPEUQxjlOhvD2KXxdNnsAQ==
X-Received: by 2002:a2e:be1a:0:b0:2ec:5255:b4d9 with SMTP id 38308e7fff4ca-2ee5e380a0fmr49738561fa.7.1719843384187;
        Mon, 01 Jul 2024 07:16:24 -0700 (PDT)
Message-ID: <a9133a97-d874-48ae-8ee4-83d752dcedd7@suse.com>
Date: Mon, 1 Jul 2024 16:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] misra: add deviations for direct inclusion guards
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <64e80abfaa68d87e8cb4fee67bc2624eda4f466a.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <64e80abfaa68d87e8cb4fee67bc2624eda4f466a.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 13:10, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
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
> Note that with SAF-9-safe in place, failures to have proper guards later
> in the header files will not be reported

Rebasing mistake, seeing that it's ...

> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -84,6 +84,14 @@
>          },
>          {
>              "id": "SAF-10-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: direct inclusion guard before",
> +            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
> +        },
> +        {
> +            "id": "SAF-11-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"

... SFA-10-safe that's being added and ...

> --- a/xen/arch/arm/include/asm/hypercall.h
> +++ b/xen/arch/arm/include/asm/hypercall.h
> @@ -1,3 +1,4 @@
> +/* SAF-10-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -2,6 +2,7 @@
>   * asm-x86/hypercall.h
>   */
>  
> +/* SAF-10-safe direct inclusion guard before */
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif

... used here?

Jan

