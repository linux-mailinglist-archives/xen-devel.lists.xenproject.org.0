Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FCB1A03F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 13:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069099.1432938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uit1X-0000cs-Lk; Mon, 04 Aug 2025 11:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069099.1432938; Mon, 04 Aug 2025 11:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uit1X-0000b6-Ir; Mon, 04 Aug 2025 11:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1069099;
 Mon, 04 Aug 2025 11:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uit1V-0000b0-OP
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 11:06:33 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13860420-7123-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 13:06:31 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so5133936a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 04:06:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a2436easm716229766b.135.2025.08.04.04.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 04:06:30 -0700 (PDT)
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
X-Inumbo-ID: 13860420-7123-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754305591; x=1754910391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YXp/tr9Kwb+JyuLu1wWJfvhuzU+rZTRPD+ep8IRX400=;
        b=SPR9ZXZ13HCZdryFaEs7F7x0oSLAoMewHmfkvXa0tPRqG7VTK5lVy+FtM+4KgUPtYn
         DYhggG/KqlJkfaeoJFRtxQ2zvekrdXWcPEvZ5a/KCxdZE3JJERYnixt1W5K4l9ZHT5m8
         eH9mIPeETFeVuLohokIiMdnB4eRcgI8cyxwPAFeJtNcRgrtMZQzZJue4z+qXyjbcvy6W
         BGk7+rLEv8e/AGqtEc9ldqquwcMp5uQaLptwGnw9cLLr5tyJVTWuxYz8yzZOx8iZs5cY
         j7JF/NIMIyFzTZQSrdjdTgTqzeHKLWFn4Qp9DA8BbONOCXm+kQyk6qtTTbpLAyCfuO5v
         oLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305591; x=1754910391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXp/tr9Kwb+JyuLu1wWJfvhuzU+rZTRPD+ep8IRX400=;
        b=BagFvzc445NXuR4IHEGdiWWEiwPGwCX9S1IWJSlYzsnrK6fWjNfpcMFbwqboQfJZdo
         oiTIMjXl5DoGiyIdhXcFSFY6zgSnH05A7ZozZW5cQH6G88WiTNiNyP4MrIw3Ubg9fbfX
         ITBm8FJwpa8KqjY397vLkej6n0niAF20XtdsSxYn90IQpfIEpjYwzYudXFlOIalSpmXF
         F1vLDUIeWHJXH60gbHiSxqX1EQNpvGK8jHg84dQZRXGDnAl7O0Z1pDv5XMXQt6UM5iAZ
         1HAFXmG6rD/sp3mzEzzHiCAEkt+O3m7Ry9hrnZN7/fz86Zxo2G/33fl7duOZYpysuC8n
         Vwpw==
X-Forwarded-Encrypted: i=1; AJvYcCWsmGnni4rbIKuy6QrPYT4YX5t1FKRl5LYUskhZeUyloX2jDwRhRI0FoV56rhQJWZ+nLa/a9GUEUNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+uKlRXE7/RAl1ZEWfSKusz+rynDb4Xo/mvHAhKz5NwyPEfhtQ
	fVRB0a9uBEyMsnrmPSMYIsbf/MbvrOgpNyvSH3FPzLNks7YIT++ieYedKo5CRo6Xmw==
X-Gm-Gg: ASbGncuzvzoIjrk7KcGhkiKcS+79CyckYznrmhMmfOgxlR2LbO3Mz4eTBKfG7zGkfeY
	tkbwGEpbdq3E5shaKxCJUC05QYneAS3eLs/syROhY7FxOLR8EPEX1sfdrY+7CDwBotpfjlw7xvq
	zYSk89PU3GgxfQp/TYuSx2N7UDhKssSQ1wKDdOllH3NOlfA6c9FOjDPycS3Sst1j8jCaQ80rEGm
	TvYMrtPub+AobY57ps253VRfdhT1Gg0Xha6Rgh+eCmJkHrGm7rXkILf0lKeeX7SQWQZIX069Z8o
	eyA/CqIQxMx7d7ljFcr/SgSkDva2WBS27AFuraFiGI3GMFKecaiXhuSnuVmb35duErbzUBgej3w
	TxJnvu2/VotlK5hOg32/4cKUzLxtfqbVf9+Tx/2RlaWQuPwF7QpP2weUC+0pMZNDVR5ZtkaI1x1
	Zl0ieYkgO9fzMy8SX8/A==
X-Google-Smtp-Source: AGHT+IH/pJHM6DMd+pen4bht6VxEt32yqOG2jbw/3SpbiIAUvMox9lvypCgSXNU92necwuEet9kQeQ==
X-Received: by 2002:a17:906:f205:b0:af9:467d:abc0 with SMTP id a640c23a62f3a-af9467dae3cmr737288566b.50.1754305590700;
        Mon, 04 Aug 2025 04:06:30 -0700 (PDT)
Message-ID: <549bde88-38a3-4920-9309-f898b48d3bda@suse.com>
Date: Mon, 4 Aug 2025 13:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] tools/xl: enable NS16550-compatible UART emulator
 for PVH (x86)
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-8-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:22, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Enable virtual NS16550 for PVH domains in xl.
> 
> {map,unmap}_domain_emuirq_pirq() infrastructure is modified by adding new
> type of interrupt resources 'IRQ_EMU' which means 'emulated device IRQ'
> (similarly to IRQ_MSI_EMU).
> 
> This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mapping
> (vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin corresponding to
> virtual device's IRQ.
> 
> Also, hvm_gsi_eoi() is modified to trigger assertion in hvm_gsi_deassert()
> path for ISA IRQs.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - new patch
> ---
>  tools/libs/light/libxl_x86.c          |  2 +-
>  xen/arch/x86/domain.c                 |  2 ++
>  xen/arch/x86/hvm/vioapic.c            | 10 ++++++++++
>  xen/arch/x86/include/asm/irq.h        |  1 +
>  xen/common/emul/vuart/vuart-ns16550.c | 27 +++++++++++++++++++++++++--
>  xen/drivers/passthrough/x86/hvm.c     |  9 ++++-----
>  6 files changed, 43 insertions(+), 8 deletions(-)

Given this diffstat, how come the patch prefix is "tools/xl:"? You don't even
touch xl ...

> --- a/xen/common/emul/vuart/vuart-ns16550.c
> +++ b/xen/common/emul/vuart/vuart-ns16550.c
> @@ -355,7 +355,9 @@ static void ns16550_irq_assert(const struct vuart_ns16550 *vdev)
>      struct domain *d = vdev->owner;
>      int vector;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        vector = hvm_ioapic_assert(d, vdev->irq, false);
> +    else if ( has_vpic(d) ) /* HVM */
>          vector = hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);

Why not

    if ( has_vpic(d) ) /* HVM */
         vector = hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);
    else if ( has_vioapic(d) ) /* PVH */
        vector = hvm_ioapic_assert(d, vdev->irq, false);

Less code churn and maybe even less generated code.

> @@ -367,7 +369,9 @@ static void ns16550_irq_deassert(const struct vuart_ns16550 *vdev)
>  {
>      struct domain *d = vdev->owner;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        hvm_ioapic_deassert(d, vdev->irq);
> +    else if ( has_vpic(d) ) /* HVM */
>          hvm_isa_irq_deassert(d, vdev->irq);

Same here then.

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -924,12 +924,11 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
>  {
>      struct pirq *pirq = pirq_info(d, gsi);
>  
> -    /* Check if GSI is actually mapped. */
> -    if ( !pirq_dpci(pirq) )
> -        return;
> -
>      hvm_gsi_deassert(d, gsi);
> -    hvm_pirq_eoi(pirq);
> +
> +    /* Check if GSI is actually mapped. */
> +    if ( pirq_dpci(pirq) )
> +        hvm_pirq_eoi(pirq);
>  }

The correctness of this change (in particular hvm_gsi_deassert() now always
running) wants reasoning about in the description.

Jan

