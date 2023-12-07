Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA628085D5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649774.1014658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBC23-0000TY-LM; Thu, 07 Dec 2023 10:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649774.1014658; Thu, 07 Dec 2023 10:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBC23-0000R8-IH; Thu, 07 Dec 2023 10:55:03 +0000
Received: by outflank-mailman (input) for mailman id 649774;
 Thu, 07 Dec 2023 10:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBC22-0000Qm-HI
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:55:02 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 107cf1a0-94ef-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 11:54:59 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so933351f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:54:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b004083729fc14sm1591192wmq.20.2023.12.07.02.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:54:58 -0800 (PST)
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
X-Inumbo-ID: 107cf1a0-94ef-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701946498; x=1702551298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUP+ULI1dScA5/5TTFx8KWT5Lk5bvkCC1yGd2krqwGk=;
        b=demvU7kscDS4Ac2vqSILF+NoH8LgUGgnRJ818mDKBparld9jycsuzwuNoDCVnAjymy
         euS9U4aWYkHBhTrpOdfCMO51Q28hjPAz9uz5zfeLVWIith7n78MLdkMkh+bdNrFmB3IO
         TBLCcZXT9HR8TxTamT91fSl4k9EkecJtZiVZURZkpKt9JWMxAdEAmLB4Rcdm3HplYnI1
         SIEuuT8a8xVAT22bQZipEfMG3UZ9doJ44ngPrI7ZvdWv+J0oc3tci4Vmk80kB79l8QTN
         iapHB1vUZzNs8LxwKxXmlErvlBEzCdGOlQtVpW6YmMwoO6YSxCc/yhcgz8bKUvhxpxb/
         8YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946498; x=1702551298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUP+ULI1dScA5/5TTFx8KWT5Lk5bvkCC1yGd2krqwGk=;
        b=L/IRRl8euMyy/gWjUT6IYCqUG/HDUN/AaOGXqGKzPGK+fNS3+YtJB8KltNCaKToOZO
         aEWJlbULMNrmeDwyiuu4zqyjsiLOcShSlYVI0xKSN0W8/PS6UBzk2QqSZgJ81ygzXtaq
         HpYrh9vKGdQKIeETCQ4Fv+2OwnaklBcq+/f5obJaArFooUsPQxEYoT4QdSKF7XbkivGH
         +oUJgopRYi5qktaUbNN+fCP6E7g1bkq+mkkT4XWj3pYrAILj1ydrGIQYutTEF4mUB0rh
         7vlSTAIHMdb0ltd68RWmKFqycqKAX7B8PIbkuTihEaDR3OLubO7vfLvfPApxfwCeMCCo
         ogFw==
X-Gm-Message-State: AOJu0YzdZwV/m//7uCmqQFcTQP56WY4x0NHnmxLt5lM6ujI1y/UOeGZW
	3sXH3D5MEGGBM5BN9hYtB0lp
X-Google-Smtp-Source: AGHT+IHlCMPgO4CtIVSG7pzjXdxsBNuEYoT3tkXgYFBARn7Cs20gobhbnNOy8e8N61sH9eteOIenyg==
X-Received: by 2002:a05:600c:755:b0:40c:873:c93f with SMTP id j21-20020a05600c075500b0040c0873c93fmr1479247wmn.167.1701946498537;
        Thu, 07 Dec 2023 02:54:58 -0800 (PST)
Message-ID: <30b48e9b-0630-4df9-ac6b-5ece418bf4b0@suse.com>
Date: Thu, 7 Dec 2023 11:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: address violations of MISRA C:2012 Rule 14.4
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
 <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 10:48, Simone Ballarin wrote:
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
>  {
>      ch->msi.msg = *msg;
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc = iommu_update_ire_from_msi(&ch->msi, msg);
>  
> @@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          ch->msi.hpet_id = hpet_blockid;
>          ret = iommu_setup_hpet_msi(&ch->msi);
> @@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>          ret = __hpet_setup_msi_irq(desc);
>      if ( ret < 0 )
>      {
> -        if ( iommu_intremap )
> +        if ( iommu_intremap != iommu_intremap_off )
>              iommu_update_ire_from_msi(&ch->msi, NULL);
>          return ret;
>      }
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 7f8e794254..72dce2e4ab 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>  {
>      entry->msg = *msg;
>  
> -    if ( iommu_intremap )
> +    if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc;
>  
> @@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
>              destroy_irq(entry[nr].irq);
>  
>          /* Free the unused IRTE if intr remap enabled */
> -        if ( iommu_intremap )
> +        if ( iommu_intremap != iommu_intremap_off )
>              iommu_update_ire_from_msi(entry + nr, NULL);
>      }
>  

All of this would logically be part of patch 1. Is there a particular reason
why it wasn't done right there?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1320,7 +1320,7 @@ x86_emulate(
>          ea.bytes = 2;
>          goto srcmem_common;
>      case SrcMem:
> -        if ( state->simd_size )
> +        if ( state->simd_size != simd_none )
>              break;
>          ea.bytes = (d & ByteOp) ? 1 : op_bytes;
>      srcmem_common:
> @@ -1460,7 +1460,7 @@ x86_emulate(
>          /* Becomes a normal DstMem operation from here on. */
>      case DstMem:
>          generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
> -        if ( state->simd_size )
> +        if ( state->simd_size != simd_none )
>          {
>              generate_exception_if(lock_prefix, X86_EXC_UD);
>              break;
> @@ -8176,7 +8176,7 @@ x86_emulate(
>          goto done;
>      }
>  
> -    if ( state->rmw )
> +    if ( state->rmw != rmw_NONE )
>      {
>          ea.val = src.val;
>          op_bytes = dst.bytes;
> @@ -8205,7 +8205,7 @@ x86_emulate(
>  
>          dst.type = OP_NONE;
>      }
> -    else if ( state->simd_size )
> +    else if ( state->simd_size != simd_none )
>      {
>          generate_exception_if(!op_bytes, X86_EXC_UD);
>          generate_exception_if((vex.opcx && (d & TwoOp) &&

I'd be (somewhat reluctantly) okay with ack-ing this part of the patch.

Jan

