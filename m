Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2FB09B13
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047987.1418304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceBi-0003K8-HE; Fri, 18 Jul 2025 06:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047987.1418304; Fri, 18 Jul 2025 06:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceBi-0003Hf-Dn; Fri, 18 Jul 2025 06:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1047987;
 Fri, 18 Jul 2025 06:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uceBg-0003HZ-Lp
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:03:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e442d31a-639c-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 08:03:14 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45617887276so11949825e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:03:14 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e80246asm68721705e9.10.2025.07.17.23.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:03:13 -0700 (PDT)
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
X-Inumbo-ID: e442d31a-639c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752818594; x=1753423394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYeBo+jdZBAO63vn9yLD2wrk659rVe779CKQjRzl1U=;
        b=QOqkh4TM67sprHS+/lRbdPtPOgtKlOduKeW/QakzMvqyGjrGCFN0mtbFe/m5R7Yh3C
         taWc/q0oBtVmv1XEBgfdb6mOQWJrZdlTL/WcsXMoiGu/AEem8NMzPu7BUU+FRXrPYpwc
         WQkGADHOecgYWhQlTvbmAaYc+zBVSail345lWXNFrqZMqSlopiVz9I8c5MdpriqkpCaZ
         S7EjfkAMxF+Ce5jrvNBFSZwLbmYmxXRco8YPttoAnoMgt7enx/X/1HGoDaUb2Nwh8Yc6
         ipBXsMpnhgaRbOBJmaxIstIZa2H62oXnaKGL66SvjSF5XlfmXP6sT3g6ba5gGKIbv25d
         IhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752818594; x=1753423394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfYeBo+jdZBAO63vn9yLD2wrk659rVe779CKQjRzl1U=;
        b=FzP5KIl1SxiXvZ/AAWpU7xLQb36t6wyansSVoUbEgt32Qyr6wwgij5cvNC65kwYbav
         Q26PIbpKu8YjHGHhi4rV1cb8mXYqDXMn6OOJv0LJ38fkH/f8Oz1yrqXGref6vjOnIdLM
         RUKTxqq5cfC4y3XU2Jl5QiC1JsW+AgbBNh/XZk1Q+bPNPRGfJHVL4aTQlRr0sTPX2+Td
         I1s1sxSKGLSH9HKSX+YFdBTa/vCtxPUNYFSzNxLZ4TzHirTnrxLZreLMonMM96s9i4wm
         xBZ5MTjPCojaqd5OEBRk2Rs39Yp8wjrX1Odhfjkwpf5aSj8t9GFu+tz61R6iE32JDo1G
         jFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWazt5RoQQZeLyP7tNRxoUaTTDcUPJ1u7ay+hBlbHuOyku+6cEhtCiY13+P4bnSzzZdCd4Jvor+Te0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/c5w57X5t/jLQTrYlAJ8n2QWrpsQeMdUTj/bRTKTXLsV3twt3
	um6DovB2xpzrzRmkqIAlhPXQWRynhT/4gDkkZlYaeH+XMdr7H+85460eNU78fJDRKQ==
X-Gm-Gg: ASbGncusjhN6iauUhXvCdKacsAURIO4SuxWJ/hREyrVt0Htd5Mzfui/UDdppecYBOjH
	uHHZDv1fZZv2aGRT4NmJVjWbkxhaFld35Lk07bapVhzOom6Tjpxk/7dEHiCbM89jv5GN8RAI2qT
	gEx4CjZi5jS/PMKCrsriRleAGiLHibyAgRa/e1aUa14EqzqWNcG0K4LGYYpDu1udkm4swvNoTC6
	ES9oBkF7ZwEkkUxu+ISISeG0jnX6CjxomzS5gPLbKx2kgHYDYskmEvaMibK3K3c9HfZscQM3Yuc
	Ua/uHV/dEe83EWVU/ybNC/1C1D/bEkA2gwBj2ltNfP9kRGGxear5YzC8hlGxtr83GNp+G3ymosU
	XQd/tt1WwBoIa569bW2J/s6Gs0pLtYLs0s8Rfm1xpVvPrrASDhWVa0O4i1tci1A29TF3abOdAYL
	N5vp9ra3oGQAicDAcKNeCxjGDojbnUEEIQSfCnyE3FJDNYNqWfu1mB3funspEzKe1yGU4=
X-Google-Smtp-Source: AGHT+IGj38xQFnpfMrDnikPsrVmvCIu7jhCQpZUnCHQf4P6UZZPJAMg/A1Opi4rd0sgeQIIcpExBOA==
X-Received: by 2002:a05:600c:4706:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-4562edaa08cmr86833965e9.8.1752818593876;
        Thu, 17 Jul 2025 23:03:13 -0700 (PDT)
Message-ID: <e5df1958-0a19-4371-a7e4-68f93698cc38@suse.com>
Date: Fri, 18 Jul 2025 08:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/idle: Fix the C6 eoi_errata[] list to include
 NEHALEM_EX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250717162856.2233585-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250717162856.2233585-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 18:28, Andrew Cooper wrote:
> NEHALEM_EX is affected by the erratum too.
> 
> Change the comment to be the full text, rather than interpretation of it.
> 
> Fixes: 95807bcae47e ("C6 state with EOI issue fix for some Intel processors")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(maybe also a weak Reported-by:?) with (nit) ...

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -584,18 +584,24 @@ bool errata_c6_workaround(void)
>      {
>  #define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>          /*
> -         * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
> -         * Core C6 During an Interrupt Service Routine"
> +         * Errata AAJ72/etc: EOI Transaction May Not be Sent if Software
> +         * Enters Core C6 During an Interrupt Service Routine
>           *
> -         * There was an errata with some Core i7 processors that an EOI
> -         * transaction may not be sent if software enters core C6 during an
> -         * interrupt service routine. So we don't enter deep Cx state if
> -         * there is an EOI pending.
> +         * If core C6 is entered after the start of an interrupt service
> +         * routine but before a write to the APIC EOI (End of Interrupt)
> +         * register, and the core is woken up by an event other than a fixed
> +         * interrupt source the core may drop the EOI transaction the next
> +         * time APIC EOI register is written and further interrupts from the
> +         * same or lower priority level will be blocked.
> +         *
> +         * Software should check the ISR register and if any interrupts are in
> +	 * service only enter C1.

... the indentation issue here corrected.

Jan

