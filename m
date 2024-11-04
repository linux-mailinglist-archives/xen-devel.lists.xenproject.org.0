Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E79BB061
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829916.1244842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tpE-0001QU-HU; Mon, 04 Nov 2024 09:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829916.1244842; Mon, 04 Nov 2024 09:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tpE-0001Nx-Dj; Mon, 04 Nov 2024 09:56:44 +0000
Received: by outflank-mailman (input) for mailman id 829916;
 Mon, 04 Nov 2024 09:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7tpC-0001Nr-Ju
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:56:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 156c5a44-9a93-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:56:38 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4319399a411so34617455e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:56:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9aa83asm178576685e9.31.2024.11.04.01.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:56:37 -0800 (PST)
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
X-Inumbo-ID: 156c5a44-9a93-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1NmM1YTQ0LTlhOTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzE0MTk4LjQzOTI5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730714198; x=1731318998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bcqT19pfZiiw5qYOmvKN9z8fJypk9wQLp0IGwqczJoQ=;
        b=gtX0xrjvmHb9eNO4ix3uo5YG/uCDK7b4X5nr5qPbA424pVH2gNfxw7IuoDWBFM9nrw
         kh9ZoDz9GIugamDDlB8aSYIWE8IqXK/1RxrrriH/oAdhN/8O31WG+JPWPUbRDhITTaO7
         7mLN1ZJhyN21ud87d5+98j3/z7xS+ighb2uBQwlKKPCzO3JqtY/vh+eXXscTA/HeTd+V
         gDRcgmfcITqoYNG5H97vPWrM/qsoh4UJ5Z+cp5l+BjWM6+81mSjZUCsZpA9NLQ3YthYV
         m9ZaRL+4smHls0EPL4y/Vu5HJxbiNss8LaFTihcBjThK0jqzY+zudMvH47uQuq0/vLFm
         basQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714198; x=1731318998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcqT19pfZiiw5qYOmvKN9z8fJypk9wQLp0IGwqczJoQ=;
        b=KvT8DVmfBQuTV7GiYwKbTAJXHBk/LRnCh7+8z/RdC6YjKC4tlrS8jp93dPrDrPoKxv
         Wc90nNRFr330QpKIoccNxV7Wvl9EIaHLsRXnWTvoRIqbzSDfJRQttwPaHuRQue7kASfK
         +DZi5YgtqYR/bYIFoEInI7qUth2io/nlP7f/2fp1vPwrhKk41gFRtBKPfTqUwZE57az/
         UHm2bD+bhig+p66wyXgCCfaL5ejf9LDz4wqKWLgBRqUAZVTY1Uc/Cs6UNVE7ioApTfgY
         Gb9K7lflVaCUJPxpMUi/Tq1pZk7uexRgitvQrZzenwqmTMgOVP1hFfOHoff4w7xv1QbG
         anQg==
X-Forwarded-Encrypted: i=1; AJvYcCXTWkQtGkx6B8lEQegKaLuRV/rT2GQxE+o990r78cAItyvizSdKf5NZSkBEWjSWIA2e3w648iYwu0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLD75dbp+R5iO29f9Alhw1N33nU1swx71UMvXDNddSoAxL/UxF
	XLy7fojw+VtIs1eIVnGEbQ9H/B2j1Jzfg92ARzCctENX0wc3aAeht0vwGbS64Q==
X-Google-Smtp-Source: AGHT+IGj1p0jkMoJaRZ0BcA5SQs9GrcHQQ/LnHNmZfZd7D0s+dEtt5nvDLO3oh4rHrtrvCffKsqkDQ==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4319ac70754mr290361625e9.1.1730714197779;
        Mon, 04 Nov 2024 01:56:37 -0800 (PST)
Message-ID: <64059351-dd82-4393-8852-ff60d6d8d5bb@suse.com>
Date: Mon, 4 Nov 2024 10:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241031085713.6156-1-roger.pau@citrix.com>
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
In-Reply-To: <20241031085713.6156-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2024 09:57, Roger Pau Monne wrote:
> @@ -71,6 +72,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>  
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>  
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> + * format repurposes the vector field to store the offset into the Interrupt
> + * Remap table.  This breaks directed EOI, as the CPU vector no longer matches
> + * the contents of the RTE vector field.  Add a translation cache so that
> + * directed EOI uses the value in the RTE vector field when interrupt remapping
> + * is enabled.
> + *
> + * Intel VT-d Xen code still stores the CPU vector in the RTE vector field when
> + * using the remapped format, but use the translation cache uniformly in order
> + * to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + *
> + * The matrix is accessed as [#io-apic][#pin].
> + */
> +static uint8_t **io_apic_pin_eoi;

__ro_after_init?

> @@ -273,6 +292,17 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Might be called before io_apic_pin_eoi is allocated.  Entry will be
> +         * initialized to the RTE value once the cache is allocated.

With the movement of the allocation to enable_IO_APIC(), isn't this part of
the comment stale now?

> +         * The vector field is only cached for raw RTE writes when using IR.
> +         * In that case the vector field might have been repurposed to store
> +         * something different than the CPU vector, and hence need to be cached
> +         * for performing EOI.
> +         */
> +        if ( io_apic_pin_eoi )
> +            io_apic_pin_eoi[apic][pin] = e.vector;

The conditional here is necessary anyway, isn't it (for the allocation
being conditional itself)?

With the adjustments (or clarification of why they cannot be made)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

If the adjustments can be confirmed I'd also be happy to make them while
committing, to save another round-trip.

Jan

