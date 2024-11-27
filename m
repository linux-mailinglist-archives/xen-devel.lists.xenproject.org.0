Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9129DA3CD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 09:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844514.1260015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDIB-0002Zq-CS; Wed, 27 Nov 2024 08:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844514.1260015; Wed, 27 Nov 2024 08:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDIB-0002X9-90; Wed, 27 Nov 2024 08:20:59 +0000
Received: by outflank-mailman (input) for mailman id 844514;
 Wed, 27 Nov 2024 08:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGDI9-0002X0-Gn
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 08:20:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85548b4e-ac98-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 09:20:54 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-382325b0508so4123358f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 00:20:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60dasm15459818f8f.21.2024.11.27.00.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 00:20:53 -0800 (PST)
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
X-Inumbo-ID: 85548b4e-ac98-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1NTQ4YjRlLWFjOTgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjk1NjU0LjYzMTY0LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732695654; x=1733300454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7++azYOEt1PIwkgm9g6gDrBsAQ4AefoT5/taWZCewm8=;
        b=Qc35Q4/hWmlolkMFc3fUPmTjt+8KOsVIUmwgEUSdg2g8z/+HSpfXKRe3Zjmk23U4Wq
         qtpAdOZA9cMfKMBdYg0sAEWHmMksZzXH+U/ZgwqP0v41j6IymoLUFaiXdJxFt05nEq7F
         aQ7mJUMehUshn4sugNZesDUqJvREBnwZW62UVTAgfXy9XpQ2I8rKs7fhrXJk+0Bc73hX
         Evx2Uqj3YTwyPhhENsQgwmmhpAesuZ+CzWjhxq5ZoHuh6yzE1Y3OZRyaBds8qXkxwOZp
         A+xYP9wAOtm0cxgW9fYavZlJsqMMK0Lbdzd/xwHmsSmWfDlmkKdF8SNHTO0Q1LpvUoyU
         PNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695654; x=1733300454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7++azYOEt1PIwkgm9g6gDrBsAQ4AefoT5/taWZCewm8=;
        b=iPzaNtufgZ3QELsQZnrzx4ZS+KmI2MrmgWRKpHBboNBaFNwRupVOruVw8IyJFHTalj
         IFUSiMNbClhV7wo+EEf1fncTD+MbUSQFPjWeo8jP9KAwKWbIBhtuFm63FqcGR7ieHfyL
         HIEA7FRqDImzMUg33FFmxp6axRJ+F+a+jXQ4/1tjDCajHl5ogTXCcB/QZe2LP6A+x0KY
         RMHC9D4EqFtTw1c1qzH2Up5mDBK8LVEHoAviN9pdIYQxxP4lKSXuifjqYUL82S5ZZUxE
         JD+3eJZfp5P1yPn2legm3JKzBtH9ndqR/eXs4aJLDBhalpCFgV9DN3masQ+h7EliLjgS
         0YXg==
X-Forwarded-Encrypted: i=1; AJvYcCUh2PSS8zoSvshkdM/46SATp7nkhS6wDOXFKEV63TDGw9zt3IwFszziIlBW1aptwUAcDKZdg2emJn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1a4aNkpkFMkxBH2FpEXu39mRpg89SdCzt4c78OGe/GnyFswX6
	XhZvhId8EbkzjH73pGMs/RWhRdPjx1Ku/ARcWQhONRq+kC2kXYSzmRaNYHArhQ==
X-Gm-Gg: ASbGncvhICG8CY9V6LWDxRl7ICigIUepsD/4VlGJZUFwhHdV0sc+jzMG4xD3xVrpLUY
	JoqDTGGvdoaMgnS89j16/nIFj2qlVulOQt6ik5BzZEcvskm2r6M9qdZkbmsHZdEXn7alKuuFhXB
	4KAOvCFMbYsDjNAkD4UdGVzCF4E4FaFNOwF+bFB/LcJhrNK5RY/AzRLRCLA41TojNNxJe/C72Kw
	P7AP5avT1P6/toUj4UVQ/v+QfnFh3JLFD1+bcZD2WpvS9YzbKfqIfrMVILU4jU1uodf4TfJJ6Sp
	LIvRLBOIAgP2YBqTqgSC8iOYrVBFcaNCrAM=
X-Google-Smtp-Source: AGHT+IFMc3rcmhax22J7cwzvNvc5NAq/QI1cq2X0YuPzSlpkXvphKK47SIvet4pz06OC9NekZgOdIA==
X-Received: by 2002:a5d:588e:0:b0:382:41ad:d8e2 with SMTP id ffacd0b85a97d-385c6edd470mr1219374f8f.39.1732695654062;
        Wed, 27 Nov 2024 00:20:54 -0800 (PST)
Message-ID: <a2efdf6c-ab52-4ab6-931e-0801844b4875@suse.com>
Date: Wed, 27 Nov 2024 09:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Javi Merino <javi.merino@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241126205859.23090-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 21:58, Andrew Cooper wrote:
> @@ -1389,8 +1381,7 @@ static void cf_check error_interrupt(void)
>      unsigned int i;
>  
>      /* First tickle the hardware, only then report what went on. -- REW */
> -    apic_write(APIC_ESR, 0);
> -    v = apic_read(APIC_ESR);
> +    v = apic_read_esr();
>      ack_APIC_irq();

As indicated in the earlier reply, I think this comment should be dropped,
plus ...

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>  {
>      unsigned long send_status = 0, accept_status = 0;
> -    int maxlvt, timeout, i;
> +    int timeout, i;
>  
>      /*
>       * Normal AP startup uses an INIT-SIPI-SIPI sequence.
> @@ -444,8 +444,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>      /*
>       * Be paranoid about clearing APIC errors.
>       */
> -    apic_write(APIC_ESR, 0);
> -    apic_read(APIC_ESR);
> +    apic_read_esr();

... the one here. With that and with Javi's change folded into here,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

