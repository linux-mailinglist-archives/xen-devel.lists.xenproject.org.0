Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B135594F191
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 17:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775650.1185877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWtd-0007mn-6Q; Mon, 12 Aug 2024 15:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775650.1185877; Mon, 12 Aug 2024 15:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWtd-0007jw-39; Mon, 12 Aug 2024 15:23:45 +0000
Received: by outflank-mailman (input) for mailman id 775650;
 Mon, 12 Aug 2024 15:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdWtb-0007jq-Ay
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 15:23:43 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dafdc32b-58be-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 17:23:41 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso5844376e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 08:23:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb1cd2a8sm238536666b.117.2024.08.12.08.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 08:23:40 -0700 (PDT)
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
X-Inumbo-ID: dafdc32b-58be-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723476221; x=1724081021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qhIYaTMAVJpgePzorqAz+VjGruhNy9tnxPZ1FYjL5e0=;
        b=IQEYmJjddP93X+g053rnl8TogophbyvHkgjaQndiFsivPA04DpJngaMrPZXpQ9D236
         lU3c2AkKHCRlJwA+C19MVgw8UpLXnUXRi+B1VtOJIaZrZ+Iqjw6Y0yGAmHOgvmlBnN5o
         GUuMUg4xnOGA4aciDY4KsODQtTn9sCuEigf5oFetxIsfvgK4nMEWJHDmmWmy9/QrZAWu
         CUE7K6LzwIMrSkrp8aGLQMvDBX+QhbD4tHImsjQc4nlacFKulbFimNCvDAmVe2J2jLTY
         ljTcR5CHjFvzJNIiNhZLe5ucNZmfcv0TA1q6oyMYxsxeAF5+H98QRK5J1+HGKAU3TnrI
         7EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723476221; x=1724081021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhIYaTMAVJpgePzorqAz+VjGruhNy9tnxPZ1FYjL5e0=;
        b=wMvrft2EhSJU03aMa68b6N4ksdk5ifb7g7LJjG5RPmJYz85M/zGAW60DF2Q4UlSri5
         vizwqRrJwj6f3LY4+TuQVbCiN8FuyhJY2QIdK6RZvw2AVW5gsDlvUzltbBz8w+J3btRb
         2GuXOMZ/brvtM1m3i4Oz73noOM+xIyN3jWdkfU8elZZBEpEQUjh+j0j9Fd2FvbF7iyb7
         zMgaqAJUnaHm5Xw3BHHCkr9EmFZq9mInhG5suFizHwCpxBxpwBlhKTQLM6d1plU1hUfm
         LXJZBA7cFfOS8+OyYwOJysG1vcZWKA7EGBR6Ebl+mnXo+eSzmoZVejTsyHhbX3IvqnlH
         1heQ==
X-Forwarded-Encrypted: i=1; AJvYcCUka9u+h7A7HnEGiQNCjQLPIkqpuHu+29CT3bTq1z0K+nr6vtkCmMesAQh7QRrPH1Gj5/hWO+wnPEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbhbsr2acLBmS4/4lsd5tgNg5xgDpc1+1EWkw5RFfH8niB/Kit
	6kFnGn4esAe6ym3HKj3DxwCIegl01nLB+fKA/cCwVCchrAiFxrZCjykb6ciYNg==
X-Google-Smtp-Source: AGHT+IFMEtYoxOESwPbTH52lSLHbxRrjOF7w4ReMkt5csNmk/I/Q5vf0LIxb9iW6VoUfPhoTudKBCQ==
X-Received: by 2002:a05:6512:239c:b0:52f:368:5018 with SMTP id 2adb3069b0e04-5321368447dmr415174e87.43.1723476220637;
        Mon, 12 Aug 2024 08:23:40 -0700 (PDT)
Message-ID: <7f001aa8-ee42-4617-8fc4-e4a45d4228e2@suse.com>
Date: Mon, 12 Aug 2024 17:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/fpu: Split fpu_setup_fpu() in two
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240808134150.29927-1-alejandro.vallejo@cloud.com>
 <20240808134150.29927-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240808134150.29927-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 15:41, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1164,10 +1164,25 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>      seg.attr = ctxt.ldtr_arbytes;
>      hvm_set_segment_register(v, x86_seg_ldtr, &seg);
>  
> -    /* Cover xsave-absent save file restoration on xsave-capable host. */
> -    vcpu_setup_fpu(v, xsave_enabled(v) ? NULL : v->arch.xsave_area,
> -                   ctxt.flags & XEN_X86_FPU_INITIALISED ? ctxt.fpu_regs : NULL,
> -                   FCW_RESET);
> +    /*
> +     * On Xen 4.1 and later the FPU state is restored on later HVM context in
> +     * the migrate stream, so what we're doing here is initialising the FPU
> +     * state for guests from even older versions of Xen.
> +     *
> +     * In particular:
> +     *   1. If there's an XSAVE context later in the stream what we do here for
> +     *      the FPU doesn't matter because it'll be overriden later.
> +     *   2. If there isn't and the guest didn't use extended states it's still
> +     *      fine because we have all the information we need here.
> +     *   3. If there isn't and the guest DID use extended states (could've
> +     *      happened prior to Xen 4.1) then we're in a pickle because we have
> +     *      to make up non-existing state. For this case we initialise the FPU
> +     *      as using x87/SSE only because the rest of the state is gone.

Was this really possible to happen? Guests wouldn't have been able to
turn on CR4.OSXSAVE, would they?

Jan

