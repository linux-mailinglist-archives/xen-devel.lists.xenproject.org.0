Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4ECAB835C
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985113.1371047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVIN-0003qI-Ck; Thu, 15 May 2025 09:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985113.1371047; Thu, 15 May 2025 09:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVIN-0003oA-A6; Thu, 15 May 2025 09:54:31 +0000
Received: by outflank-mailman (input) for mailman id 985113;
 Thu, 15 May 2025 09:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFVIM-0003o4-7q
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:54:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957a4238-3172-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:54:25 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso107232666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:54:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad22562ed61sm987136966b.31.2025.05.15.02.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:54:24 -0700 (PDT)
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
X-Inumbo-ID: 957a4238-3172-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747302865; x=1747907665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk560i6SJnRty0xcdm0Tr4hUCdi0a1YYgcQMFFm97ys=;
        b=NvKocEO9+xOCO1gWlgE6oLKowmXLZ5iimcInIShWlqE7EoeT3tbCAC2L7PHrTmcZAo
         p/5eXvU8jnUkJolH9lujPL7Sm4U817nB0xq7AoNPo6qrJf3tTJEk+34b7CqxOV37dAoR
         3L8kZlAqKNsF54sjlDUC1x/ngy+jZ5khXCMXsph4xeeWzLh92sMgz0JKzTIUwtzl0n3F
         jxFP6s+KfHhXpwwTQdkNGXA08s9J1NGYMCcpdB7JbyvoGeyHj8iV/NGQB3PJ5sotg3QJ
         13q1XgaZ/1EI5GKdOye+8LXpf8aQWm/cK66BG4Y9qdZSPBtB8tp2P+G2c0+P66u9Ncxo
         X9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302865; x=1747907665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk560i6SJnRty0xcdm0Tr4hUCdi0a1YYgcQMFFm97ys=;
        b=Bi+FYKAnTE02TRy/L5e1U46wcNrv/Zuv0koc2eIbo4n5OrF7zLdJV+SydWL61OLop7
         IQQRTeARXXRYMc/wN2rXP5HhD/tIQQRNmr3kI4PAz9lvHwCJFAumMBZI5Lqr4q4jcrXw
         qJ8StXrdYyETjsvdNIgBm60LlVIbjTZpmaDir/EyMD6kvfkFkoJ1u+LE8u7tapkh1Z4L
         pUfyJQ79N+XCIYWpv1NdwdmRMpQf/XVcZbT49j6sb2vp0szJNbEkOm+VzXYrgm4EJYIQ
         67ormWXB+R1AhE1brTF+yT+pF75VDO1CU36buj/HGEoWzFQCRJ7dr1BjJOGw7tesqsfJ
         9XKA==
X-Forwarded-Encrypted: i=1; AJvYcCV/sTdmwk8YsRgTwUgCWpmtTXWlCZwM1+8uiRVRJVKHsUqSLBJo2CGrfm7U6i+Wxv0bafnxupCfEu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1UOMzosmG86pxph1aIE0Ss8vapIqS3fDTMxON4+oMuNasU1dh
	qH9OeJxmYDEnV0aYtHvf3clcF75L/1+2W0NLMGhkcClnmzH35J5NynLh7V65pQ==
X-Gm-Gg: ASbGncvXHQV5LZdL7PwmJnuES2AYKV86SoMEtxn6a8jRYiFka3JfxAYlEQuHVhrBKC/
	jzk6FOUPxRwWTLWSrwpc51mHsCoRhu5MKUxH+hhRTR+jlAO18WgT3TJ5Vf1+fVmazaQZs94kmkD
	12fI3yOvKLuSEjN9gMCiQze4IdQ2fqBF6KZz9eF7NA0xHbK9viue9Vzw/75dPtMtLmuQBGf7bYb
	zwFeh7iaMN582d3XIftj7IZZr500t9drq78nOT48CuN9e0/nFkh6s358Oo8Yh/UNCKbqgDXO6N6
	nVPh5b0h7TDhXyvbAr483jBnt/OKtl18gCwLubnWVlIouFedb3USoC2PBBLU01eGTDRtW5KtwWm
	6NLG3eE0UvFaL/+wR1DOWY7mjChU5qTKFG8TS
X-Google-Smtp-Source: AGHT+IGLBojilIdHsatJKVv+PcQ3rfurAV87meLx+GFX7Q2XEGsmYjw5CsabDt+vCX8a+TX+jWt2gA==
X-Received: by 2002:a17:906:4e84:b0:ad5:1497:48ae with SMTP id a640c23a62f3a-ad514974a31mr133606066b.61.1747302864771;
        Thu, 15 May 2025 02:54:24 -0700 (PDT)
Message-ID: <1ca8df48-7e2d-4ad3-b1ad-8b4530fd22be@suse.com>
Date: Thu, 15 May 2025 11:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] xen/riscv: add external interrupt handling for
 hypervisor mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <5688ed044febf734d9c75aa2e6f52affccd3fce9.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5688ed044febf734d9c75aa2e6f52affccd3fce9.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> +static void cf_check aplic_set_irq_type(struct irq_desc *desc, unsigned int type)
> +{
> +    /*
> +    * Interrupt 0 isn't possible based on the spec:
> +    *   Each of an APLIC’s interrupt sources has a fixed unique identity number in the range 1 to N,
> +    *   where N is the total number of sources at the APLIC. The number zero is not a valid interrupt
> +    *   identity number at an APLIC. The maximum number of interrupt sources an APLIC may support
> +    *   is 1023.
> +    *
> +    * Thereby interrupt 1 will correspond to bit 0 in sourcecfg[] register,
> +    * interrupt 2 ->sourcecfg[1] and so on.
> +    *
> +    * And that is the reason why we need -1.
> +    */
> +    unsigned int irq_bit = desc->irq - 1;
> +
> +    spin_lock(&aplic.lock);
> +
> +    switch(type)

Nit: style

> +    {
> +    case IRQ_TYPE_EDGE_RISING:
> +        writel(APLIC_SOURCECFG_SM_EDGE_RISE, &aplic.regs->sourcecfg[irq_bit]);
> +        break;
> +
> +    case IRQ_TYPE_EDGE_FALLING:
> +        writel(APLIC_SOURCECFG_SM_EDGE_FALL, &aplic.regs->sourcecfg[irq_bit]);
> +        break;
> +
> +    case IRQ_TYPE_LEVEL_HIGH:
> +        writel(APLIC_SOURCECFG_SM_LEVEL_HIGH, &aplic.regs->sourcecfg[irq_bit]);
> +        break;
> +
> +    case IRQ_TYPE_LEVEL_LOW:
> +        writel(APLIC_SOURCECFG_SM_LEVEL_LOW, &aplic.regs->sourcecfg[irq_bit]);
> +        break;
> +
> +    case IRQ_TYPE_NONE:
> +        fallthrough;

This is pointless (and hampering readability) when there are no other statements.

With both taken care of:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

