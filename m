Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566998B9534
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715599.1117352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qn0-0004FR-JU; Thu, 02 May 2024 07:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715599.1117352; Thu, 02 May 2024 07:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qn0-0004D3-GX; Thu, 02 May 2024 07:23:34 +0000
Received: by outflank-mailman (input) for mailman id 715599;
 Thu, 02 May 2024 07:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Qn0-0004Ch-03
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:23:34 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e10f52e3-0854-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 09:23:31 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34d7b0dac54so871235f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:23:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v28-20020a5d591c000000b0034db47c7e6dsm516329wrd.115.2024.05.02.00.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:23:31 -0700 (PDT)
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
X-Inumbo-ID: e10f52e3-0854-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714634611; x=1715239411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnK5z9LmLAEqd86FdaoU8oE0NAXd83I44namarsqDQ4=;
        b=QNsDS1ghNEW/rPoGOUT3ElF9nYaIG9PsXXUvoEt/LDGJfMD56XU9R93KrU2owjBVaO
         0ZHnKIWwOQj1q0HRT7tPd/e2taooGpwdeL/jE2BMyDbdw5k2z42nmP6FmKyPEdVzt60+
         8hwzdFCuIpcPcK+2FdWPkrJktszppaATSb8sLUXqt7AsLWgRKvtWmX3j/Tlh52XW0VuI
         82S6UQNh7Q+odG1D8A7x2cAbC3EMGvwWOJcCQgGt3hG6MsWeHF4lECmXU7FRRGHCpsSq
         LEBQw84/LstCL1bGiYtDQhRYShNJ+kFFZ22VM/nugsxqzU5ioiKjijD5wNzEmdGt0pEl
         56/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714634611; x=1715239411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnK5z9LmLAEqd86FdaoU8oE0NAXd83I44namarsqDQ4=;
        b=wNZVV5IFz2icaUoMg9JR8xbh28o6LfxSWM4AJilwmTxq3+1OYsRsLIafZiRX7W4Dbe
         lGW5iOaKZ2wvMdCJe5+rA07ByoNuNgVk4W5qg9MUXrgl6PFqbq+Rjff2AYdK0HwdclAg
         IBQq2JOv5Yl/WfciQ0MWSQyVvzq31QY3ibHZKPz6VPKbnve2+PTbhXPUonAEQalDcGR0
         dhmtrF14rTU65wGf0i44vSIPYAASsJBqxr+Jd6pv0084C6PgVa3d0e2zElLIqFPMWpPA
         PbCKZspiCtTotHP1z4VINF07VKGsmPRqeLmy6oHqNs9MaGLdO2cub4jQuMVEbn0th9HU
         qQcA==
X-Forwarded-Encrypted: i=1; AJvYcCUlKOBT6To1kquoVQVLE5o4aDhTOu7/HsMCcYIJ1A9VwBKQGitYsssiZwNurChhyK6LrgREpoTwD71nJTLGjnzGelfothCm8YOQnGa5nPM=
X-Gm-Message-State: AOJu0YyyzHQYxVZT8ccjtdysHvK+e4irAEk0plEFEAt6qp3VLjIyeguJ
	1Ysag8ji4Dw12TM+iTTzQr9hjQyO+hFeYhjTVLvzAl6zGilGqylmJeI+md9rHg==
X-Google-Smtp-Source: AGHT+IEl9vSHt9jbD2VL4V1KRu8iHVSUSGBOGxZDil2TWdNNXEygH5DxID2cVj9FaWxfH753FGc3gQ==
X-Received: by 2002:a05:6000:1b0a:b0:34d:c8d4:3e63 with SMTP id f10-20020a0560001b0a00b0034dc8d43e63mr1255902wrz.24.1714634611433;
        Thu, 02 May 2024 00:23:31 -0700 (PDT)
Message-ID: <0f39a067-70d2-4652-910a-5d05db6a3ebc@suse.com>
Date: Thu, 2 May 2024 09:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20240430153423.80875-1-roger.pau@citrix.com>
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
In-Reply-To: <20240430153423.80875-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 17:34, Roger Pau Monne wrote:
> None of the implementations support set_foreign_p2m_entry() yet, neither they
> have a p2m walk in domain_relinquish_resources() in order to remove the foreign
> mappings from the p2m and thus drop the extra refcounts.

While I don't mind the cod adjustment into the more safe direction, I find
this justification odd: RISC-V has no domain_relinquish_resources() at all
right now, and PPC has it properly as a stub only. Judgement on what there
is (or not) can only be made one non-stub implementations exist.

IOW provided PPC and RISC-V people agree, I'm fine putting this in, but
preferably with an adjusted description. To be honest with how you put it,
it's not even really clear to me what (practical) problem, if any, you're
trying to address.

Jan

> Adjust the arch helpers to return false and introduce a comment that clearly
> states it is not only taking extra refcounts that's needed, but also dropping
> them on domain teardown.
> 
> Fixes: 4988704e00d8 ('xen/riscv: introduce p2m.h')
> Fixes: 4a2f68f90930 ('xen/ppc: Define minimal stub headers required for full build')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/ppc/include/asm/p2m.h   | 7 ++++---
>  xen/arch/riscv/include/asm/p2m.h | 7 ++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
> index 25ba05466853..f144ef8e1a54 100644
> --- a/xen/arch/ppc/include/asm/p2m.h
> +++ b/xen/arch/ppc/include/asm/p2m.h
> @@ -81,10 +81,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
>  static inline bool arch_acquire_resource_check(struct domain *d)
>  {
>      /*
> -     * The reference counting of foreign entries in set_foreign_p2m_entry()
> -     * is supported on PPC.
> +     * Requires refcounting the foreign mappings and walking the p2m on
> +     * teardown in order to remove foreign pages from the p2m and drop the
> +     * extra reference counts.
>       */
> -    return true;
> +    return false;
>  }
>  
>  static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
> index 87b13f897926..387f372b5d26 100644
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -79,10 +79,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
>  static inline bool arch_acquire_resource_check(struct domain *d)
>  {
>      /*
> -     * The reference counting of foreign entries in set_foreign_p2m_entry()
> -     * is supported on RISCV.
> +     * Requires refcounting the foreign mappings and walking the p2m on
> +     * teardown in order to remove foreign pages from the p2m and drop the
> +     * extra reference counts.
>       */
> -    return true;
> +    return false;
>  }
>  
>  static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)


