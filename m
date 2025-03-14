Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C6A60C2B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914093.1319901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0lC-00020y-JX; Fri, 14 Mar 2025 08:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914093.1319901; Fri, 14 Mar 2025 08:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0lC-0001yb-Gu; Fri, 14 Mar 2025 08:51:18 +0000
Received: by outflank-mailman (input) for mailman id 914093;
 Fri, 14 Mar 2025 08:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0lA-0001yV-Hc
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:51:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c3e2939-00b1-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:51:14 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so1621125f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:51:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b37sm4916561f8f.37.2025.03.14.01.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:51:13 -0700 (PDT)
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
X-Inumbo-ID: 7c3e2939-00b1-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741942274; x=1742547074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZKQPJjOBvbwXWimtb+HpEUVwOR9avKHpxfrv5k7xys=;
        b=WrX00fQwHaN7e1wL8flvY4knnTzRpFoaOY1HOkhytYU16+96cLhX0c6aQZLCwQRi8l
         cvOucfkIRotyRyHxKKJ+8LteXhnWofDeH4tPlFIA65dAkC+ZwxKxSHOfdQUZwL9oM5WY
         nnAJtJerdQo3kI1utJCU7QbCXDPeUUksGcWAj+VcUgF6geLs5mKzN/WCwNg8Nswe0R6M
         hkhVpDIyzyQ04wUZWHR8y3dj1zHeCniAXONPA4REh1EmY8nZTprzyRRnRQZszk7Phmf8
         DBz7KKr4mCbEXnt2HacNBpsuTUevzBH28kqSa66j1KCY98pT3m6RcavJz8lEMda1W5Sm
         14tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741942274; x=1742547074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZKQPJjOBvbwXWimtb+HpEUVwOR9avKHpxfrv5k7xys=;
        b=l9h37TA2tvN9fdgX5HsnwMV0sKZk2u/3pl83DIWQUjvHvB3ThdSfpJjGs/nLGbh587
         Q2yhY0LsRT2eQ+PlIvJM6uGgNTQHXO27c74ADgEGdmWkcDspFnrH2vPbLE10jnfE33w8
         p+q984LdCRZZRMQivth/QCrRqqW2O3OUGThLyHjC9kGanUuveemv1qgca6VsLoB9fRsv
         zkzk0QiAtWnaq1wxsaXvRriWY76MG32rPQ4NbyqN5qkqgUfCneIFqqo8dwqXX6dy+YsB
         BjmdREPQb7VCTMboiG6y2fzDEh07uRxrwQZoRAewd9rTdQkO3NLBjH3E8OfbcqIR28KA
         9J0A==
X-Forwarded-Encrypted: i=1; AJvYcCVtQBRQdgyGuFwthPL/9D4DA9xaHfVkXimQonFJ5wDw+wKUMXFdlzNgwB9FnkHFo8amW7xLa5m2quY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwZh+tSnGXaMp0lzipJYcs1wbCiPs9jKxRskTdDRsSSG80QkI1
	9i285GTSRDinSx4PSxNEiKVIMfKYJzE4JHdg1LFOQrPfoZcfwz3sD0LGPRUGXw==
X-Gm-Gg: ASbGncuNfWcDZLCzCsGi1bEEKTQDwpc4+Vcsl2MMKWjmkFYxpkl4bJk+racqHtZ3LTg
	QKizi+tW95ewZkSdOeUtrqBe5aCqWeI3cxnzP1+hmK6m/K95kewJbZjYFYNu0bDSa/I+f68qDr2
	Gje+NLcR0ck0hoWvilLrYj47Y9g+3t0EuPiyXXrdvibNOXqvdSGdC0HF9mYhUetneL+8HxSIEz9
	EaNNJDOMN4plDc+xjEREI+1RURUTvmvf8Sl6rIrPjdKr54clPpTca70/wty6AkoFWohnLWbDW7T
	QfswpRKP9op2VoWL5KHX/+ajmqvOVVCNTte54f4kSGkWrdnFp9LqzARZM+T0YfPsbNyWwOwZTZk
	yKex3zfmHzLXhJ9dWQufsgy8Vhezlpw==
X-Google-Smtp-Source: AGHT+IE7kcQ0xC+f+oLPER2GXtKYNBh0qZYfCpplu+yHPVdkdasU5yD+eL4gGtx/m/wSr0T624jtVQ==
X-Received: by 2002:a05:6000:25e9:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-3972029e75fmr1702406f8f.42.1741942273767;
        Fri, 14 Mar 2025 01:51:13 -0700 (PDT)
Message-ID: <2f365e4a-1d01-4f1c-85b4-25be22545822@suse.com>
Date: Fri, 14 Mar 2025 09:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250314011528.2608217-1-dmukhin@ford.com>
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
In-Reply-To: <20250314011528.2608217-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 02:20, dmkhn@proton.me wrote:
> Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
> readability.
> 
> No functional changes.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/hvm/dm.c          |  2 +-
>  xen/arch/x86/hvm/irq.c         | 17 +++++++++--------
>  xen/arch/x86/hvm/vlapic.c      | 10 +++++-----
>  xen/arch/x86/hvm/vpic.c        |  4 ++--
>  xen/arch/x86/include/asm/irq.h |  2 +-
>  xen/arch/x86/io_apic.c         | 12 ++++++------
>  xen/arch/x86/irq.c             |  6 +++---
>  7 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index a1f7a4d30a..36d47664e9 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -90,7 +90,7 @@ static int set_pci_intx_level(struct domain *d, uint16_t domain,
>  static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
>                               uint8_t level)
>  {
> -    if ( isa_irq > 15 )
> +    if ( isa_irq >= NR_ISAIRQS )
>          return -EINVAL;
>  
>      switch ( level )
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 1eab44defc..1f7d8ca43e 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -209,7 +209,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int isa_irq,
>      unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
>      int vector = -1;
>  
> -    ASSERT(isa_irq <= 15);
> +    ASSERT(isa_irq < NR_ISAIRQS);
>  
>      spin_lock(&d->arch.hvm.irq_lock);
>  
> @@ -231,7 +231,7 @@ void hvm_isa_irq_deassert(
>      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>      unsigned int gsi = hvm_isa_irq_to_gsi(isa_irq);
>  
> -    ASSERT(isa_irq <= 15);
> +    ASSERT(isa_irq < NR_ISAIRQS);
>  
>      spin_lock(&d->arch.hvm.irq_lock);
>  
> @@ -266,12 +266,12 @@ static void hvm_set_callback_irq_level(struct vcpu *v)
>          if ( asserted && (hvm_irq->gsi_assert_count[gsi]++ == 0) )
>          {
>              vioapic_irq_positive_edge(d, gsi);
> -            if ( gsi <= 15 )
> +            if ( gsi < NR_ISAIRQS )
>                  vpic_irq_positive_edge(d, gsi);
>          }
>          else if ( !asserted && (--hvm_irq->gsi_assert_count[gsi] == 0) )
>          {
> -            if ( gsi <= 15 )
> +            if ( gsi < NR_ISAIRQS )
>                  vpic_irq_negative_edge(d, gsi);
>          }
>          break;
> @@ -328,7 +328,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
>      u8 old_isa_irq;
>      int i;
>  
> -    if ( (link > 3) || (isa_irq > 15) )
> +    if ( (link > 3) || (isa_irq >= NR_ISAIRQS) )
>          return -EINVAL;
>  
>      spin_lock(&d->arch.hvm.irq_lock);
> @@ -440,7 +440,8 @@ void hvm_set_callback_via(struct domain *d, uint64_t via)
>          {
>          case HVMIRQ_callback_gsi:
>              gsi = hvm_irq->callback_via.gsi;
> -            if ( (--hvm_irq->gsi_assert_count[gsi] == 0) && (gsi <= 15) )
> +            if ( (--hvm_irq->gsi_assert_count[gsi] == 0) &&
> +                 (gsi < NR_ISAIRQS) )
>                  vpic_irq_negative_edge(d, gsi);
>              break;
>          case HVMIRQ_callback_pci_intx:
> @@ -464,7 +465,7 @@ void hvm_set_callback_via(struct domain *d, uint64_t via)
>                    (hvm_irq->gsi_assert_count[gsi]++ == 0) )
>          {
>              vioapic_irq_positive_edge(d, gsi);
> -            if ( gsi <= 15 )
> +            if ( gsi < NR_ISAIRQS )
>                  vpic_irq_positive_edge(d, gsi);
>          }
>          break;
> @@ -764,7 +765,7 @@ static int cf_check irq_check_link(const struct domain *d,
>              return -EINVAL;
>  
>      for ( link = 0; link < ARRAY_SIZE(pci_link->route); link++ )
> -        if ( pci_link->route[link] > 15 )
> +        if ( pci_link->route[link] >= NR_ISAIRQS )
>          {
>              printk(XENLOG_G_ERR
>                     "HVM restore: PCI-ISA link %u out of range (%u)\n",

Up to here I agree with the adjustments made, but ...

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
>               * will end up back here.  Break the cycle by only injecting LVTERR
>               * if it will succeed, and folding in RECVILL otherwise.
>               */
> -            if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
> +            if ( (lvterr & APIC_VECTOR_MASK) >= NR_ISAIRQS )
>                  inj = true;
>              else
>                  set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
> @@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
>  
>  bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
>  {
> -    if ( unlikely(vec < 16) )
> +    if ( unlikely(vec < NR_ISAIRQS) )
>          return false;
>  
>      if ( hvm_funcs.test_pir &&
> @@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
>  {
>      struct vcpu *target = vlapic_vcpu(vlapic);
>  
> -    if ( unlikely(vec < 16) )
> +    if ( unlikely(vec < NR_ISAIRQS) )
>      {
>          vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
>          return;
> @@ -523,7 +523,7 @@ void vlapic_ipi(
>          struct vlapic *target = vlapic_lowest_prio(
>              vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
>  
> -        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
> +        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
>              vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
>          else if ( target )
>              vlapic_accept_irq(vlapic_vcpu(target), icr_low);
> @@ -531,7 +531,7 @@ void vlapic_ipi(
>      }
>  
>      case APIC_DM_FIXED:
> -        if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
> +        if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
>          {
>              vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
>              break;

... the 16 here has a different origin (in the local APIC spec). Changes
further down look okay again.

Jan

