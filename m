Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225693F8CE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766859.1177392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRn7-0003XP-No; Mon, 29 Jul 2024 14:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766859.1177392; Mon, 29 Jul 2024 14:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRn7-0003Vi-L8; Mon, 29 Jul 2024 14:56:01 +0000
Received: by outflank-mailman (input) for mailman id 766859;
 Mon, 29 Jul 2024 14:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYRn5-0003Vb-EB
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:55:59 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a96b9e37-4dba-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 16:55:57 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f04c29588so6391801e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:55:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac60369sm516869566b.90.2024.07.29.07.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 07:55:56 -0700 (PDT)
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
X-Inumbo-ID: a96b9e37-4dba-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722264957; x=1722869757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S5EEaYouypDnIwmtZs+E2u3r89NVpG5/evnwm/MoRfw=;
        b=ciAL3mwZNkPk+bYTAIHIIXK0weYb46y2QiwJq2eXzADJ8ejaPgCHq01LPrvkGoKJdG
         LgBv5MZUvGGNErPEOp4MVnsb+LmQgSFxfUBnKuS4MPlTLe4BaRCmo2orbio7r2R+ScFZ
         HOEsfbTdc/aEK1hQLEwNyIAP+l4xh8c4f7JOiYlgtObRS8CPVfin2e4krc5zg8ghPUT+
         D0GMG8Nq0TENAvDX0hDPQeAidaLJ6V7sb23d2bROew4IEF0aNcjXWV8zR90ISkmCqRW2
         HpDmbpp7HEqRjXy2286z8y5CELFqCFTSKR9WNn/3P0oiqgiHu5T7QsFswlaMDGIj9x/9
         onpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264957; x=1722869757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5EEaYouypDnIwmtZs+E2u3r89NVpG5/evnwm/MoRfw=;
        b=MT4+YqRTFQYkQDo0u98iy6Qd4ZCeJNIhfr7DUOx7mv/DFzhV3hY13ovVbjjxsHMn5i
         Cnk2Mx+IX4EC/10UWiOgamwmyZLzyw+TcDOJ/tpgG4BQKrgZTATEQy17Zl86G0LKjFjK
         to3a1yWygOmiFR6r8RViwhrT2rD3PZxRSN6oSyXmAoWBPBDlL24Pm0yi3886MmP2687I
         XMQajdjs1wfBzK+yAfA2YPDpwNOhC+7KihWHNpnGMvLZEbrLkggdKoWa4f3sEkM4R1qx
         cPsJomrtP8n3EZusFsewfVedmVUfcY393IcgWJBmgQUHwFtjJFMAoBTanChn3vIn97ck
         5xxg==
X-Forwarded-Encrypted: i=1; AJvYcCU2gr2/PVknmcaH9Ily2LVqbOSAbbHW4L4iwycjF5EW+GefQV4TUO4kqXaBE0soY/2+SQpAUsMALxX8Tb0GYalgmej6SPAoqd6b9BUe/jo=
X-Gm-Message-State: AOJu0Yy6PLKgA5HlCPpyKPDIjLNOphlgjeTJQA84wpLbLSi2Sc8ObYIk
	0V6/65aEGKqFtjky9RCwQAEqeAZfkXCoVMTppu1Wb21xp3Sj1DiROZCrDjIGLQ==
X-Google-Smtp-Source: AGHT+IHa5Uo99km7B125x7mifT5FhSBXJlkSUuj8eHPLF/dewcXjPe3wQZA1YXXoul9XN8pWqLTDFQ==
X-Received: by 2002:a05:6512:4859:b0:52c:850b:cfc6 with SMTP id 2adb3069b0e04-5309b2c3a7bmr4747317e87.38.1722264956729;
        Mon, 29 Jul 2024 07:55:56 -0700 (PDT)
Message-ID: <baa57ab0-60c9-49b0-9601-09bea081ddd7@suse.com>
Date: Mon, 29 Jul 2024 16:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: add no_instrument_function attributes
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240729142421.137283-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 16:24, Stewart Hildebrand wrote:
> In preparation for using -finstrument-functions option, we need to tag a
> few functions that don't work well with such instrumentation. If we
> don't intervene, we would end up with linker errors such as undefined
> reference to __bad_cmpxchg.

I can't spot mention of such a side effect from the documentation. Talk
there is of function calls being added at function entry and exit.
Nothing is being said that calls to other functions would also be
affected.

> --- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
> +++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
> @@ -5,6 +5,7 @@
>  
>  extern void __bad_xchg(volatile void *ptr, int size);
>  
> +__attribute__((no_instrument_function))

I guess it would be nice to have

#define no_instrument __attribute__((no_instrument_function))

in xen/compiler.h. I also don't think these annotations want placing
ahead of the entire declaration, but rather where other similar
annotations would also go.

Jan

