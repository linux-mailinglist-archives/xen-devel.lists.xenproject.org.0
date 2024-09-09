Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D274E97168A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794326.1203150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncSZ-0005Wg-FO; Mon, 09 Sep 2024 11:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794326.1203150; Mon, 09 Sep 2024 11:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncSZ-0005UP-BE; Mon, 09 Sep 2024 11:21:31 +0000
Received: by outflank-mailman (input) for mailman id 794326;
 Mon, 09 Sep 2024 11:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sncSX-0005UH-Ns
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:21:29 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e5e2ec-6e9d-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:21:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso244632766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:21:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c82eaesm328434666b.118.2024.09.09.04.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:21:27 -0700 (PDT)
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
X-Inumbo-ID: a7e5e2ec-6e9d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725880887; x=1726485687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zGRQzn6P8lCDbXUr6YsBbwM4cfdX+bVsziJ7LCTDZ24=;
        b=A8NMBs1vKX9kaDlQoBVRWbVGDNo30cY3ty2UUwQeye0+elWPZQFTKJp+eDW/KBYXOD
         9NEMxcFy6Je8RsLkTcWfUc2Kdc7eL5qdHqdzDxEHG9q6LwGks/kpOps5qGLyr0pagwj8
         abzZM+EKKXWRzYdfr04F1Ud9nHr1vbCC34dvmj3KqmHmtXMgHh6s7jMKmsurpKi6nhpd
         kYHx8/2w+z102i7GU9uxnyGBBw64B36MMpZahndz+407D1e7OH47NHXZ4c6u3J6BcPV0
         GVXkzk0Xo99dEwQt69kmrs36UCYtlN6wpWD6wCOgbybpQQ+O8QswqSG+x0FcpaJqvsDn
         K+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880887; x=1726485687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGRQzn6P8lCDbXUr6YsBbwM4cfdX+bVsziJ7LCTDZ24=;
        b=XCs3ChCdx0GpQHLug1aYJrCknfOkEW0gI5Z2TM+u4BlxtX9kc8cekeER1VYr1hv5pd
         NvjpcqOVq8SUfY4Pd4QkW/u+kLMoyzUaNSZ/mc1i8UwOfXfPqgZWcrI6v8pmbNyRJvqn
         j71h1nYUK8n7plFfmv8xKMcPrLOp5cHsrKi4K6pVhzNxFDgT6EyNJtaykpAzc7MxOjVQ
         ML1O3PyX2vlpqTIu58vOHnxC6QB+GcluFYkBzKvJegc33iRCyhUlEOYuyJdUaxARoXJT
         xLa4yqlXE+yAxsQFp3i2UiGyFol07wX2310bLyTqvHOiIfghy7ceOxN3j6AnZXHTugJB
         tmLA==
X-Gm-Message-State: AOJu0YxZV8VDIIoSMTox82jVRZsqma6t0F6SLaigCV3T/qRs0n7mUmXq
	1S8X2pwVQDoGYHTYJ8APw4fOIkxDY2fSRL4bLtzk1ElnY72wJjMN2+qaKFJd6w==
X-Google-Smtp-Source: AGHT+IExj0lyYet9dwSgHEqy2+Q3RRDmJ7r1fI/IWsbk9q/xK3GY8sltX2Sy3LCVeJaTV/3v9kotpQ==
X-Received: by 2002:a17:907:6e8b:b0:a86:9793:350d with SMTP id a640c23a62f3a-a8d1cd6a0ffmr710360166b.62.1725880887197;
        Mon, 09 Sep 2024 04:21:27 -0700 (PDT)
Message-ID: <c05e0a14-269a-4608-9858-d6a64ae96fb9@suse.com>
Date: Mon, 9 Sep 2024 13:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/boot: Add missing __XEN__ definition
To: Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240909110329.84512-1-frediano.ziglio@cloud.com>
 <20240909110329.84512-2-frediano.ziglio@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240909110329.84512-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 13:03, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>  CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
> -CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
> +CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__

Any reason not to similarly make this -D% as a filter expression?

Jan

