Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67855B1A420
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 16:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069476.1433328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivuH-00051V-RT; Mon, 04 Aug 2025 14:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069476.1433328; Mon, 04 Aug 2025 14:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivuH-0004zY-Oc; Mon, 04 Aug 2025 14:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1069476;
 Mon, 04 Aug 2025 14:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivuG-0004z5-IA
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 14:11:16 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1828f84-713c-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 16:11:14 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af934d7c932so444770866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 07:11:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm734329866b.90.2025.08.04.07.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 07:11:13 -0700 (PDT)
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
X-Inumbo-ID: e1828f84-713c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754316674; x=1754921474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aWUcRSxQ1NfAzjaIlR6NYYQ0pE/+POBSjsXAe//cB5o=;
        b=WQLQoVom0VbivAVnvitlLkc4lJz/czAJhMsQk6nvrUaQ3yhStDvPtE6TFda5HVvyub
         tk/qW58iC6u2H8ea64veentvLLO+l4dWpOnQUsifIWB+F/soayyDqSepbYETcz+BxxmL
         PV95xlw2UNkYifoVOiaIh+zLeVrRsVuSBe37E0EKw9lrb6DWt933MaFi2QMC0tY+0e+o
         eESKZFZRAV4D8jy8z+dRWXposYMAbRjw1FOuXb0M5jmEBltdXoeueCTRsFF0Tl3ofrZ3
         JvNdghubf0kmFUC5TLF1018IGAthDM7bI1oeNFGU4gTjhq/jXRbNpwAWM13XbDtZZ3ip
         3IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316674; x=1754921474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWUcRSxQ1NfAzjaIlR6NYYQ0pE/+POBSjsXAe//cB5o=;
        b=ciNzE3ZYeI4c1glmPtfQGtNfUJspFA8+gmt5Ynx3rJybox4HDheCS5UqZj8I/bnUN5
         5rCXv8x3YpN4kRHsWPwGkOD/QL7Q+XjT5vY5JhzmUpiOViJfLDEBIsdFA2e2yWdKDuQN
         zIyCqtuuSAD1Bl+J7mYwz6JHeYYOKhh/Xysn1yO2FQMOAAT3wOwe0NL9QqtwuQeFAnup
         91Nqng1TVWcUBOE29XTJ1hEyYfPFDFEQpk5XWJfSm13QCuXTUr5JRoMeytmqqXU41gUC
         ZZZY06PdaGx50zm5Lbguz/nPJsh7wpatu9H5F2gauyMFaGsb7kIxSpvK2j8gd7WYBngz
         wJlA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZTN08L53W5TEPfapnh/OGgrtBKH6EzWJaq23r2jkXt0P73MfEr9Fcg6hDqGE883duyWMIwL3pUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRpwnDljQXSKNxhxctojnlPedc/6YABf0LGICEFr0285x5UvW/
	GLppYWff8MnR6a7DcbQjfDz3uY0TGu4XUue6XhxP/PhDpsSoJONQkk1ofkZgqBrRnA==
X-Gm-Gg: ASbGncsLR3NCjKa3ETpmZWtFgf8G1KlsdNi3XLApTDS48gdbjpG+pRbBu+Pu/N/uTRR
	CdwG73dwKS88oNmZ21Dhf5MxgUoCuLNhTlF2MY6w+cQyH0DO4ksVSXO3og+l0iqCoK5ygd+yi+/
	9QB+oq8knNeHl7qZ/C3YF4VfnzLHYHp9z4d8RMufXP9QuYtLuGbgYyc/Xx52r6zr695EpXiib7z
	Ptt9fa1XZ70eVmBWTzfml3AD4uOxFxxtHdsswxqX7oirNuIjOhxmvahJp9DsdCfqE76JoOSsrBx
	7AkO9AygD36BmW98h6mMx+Fh08u/hToY2XXKOHeANzKc76zrSADra2QLkp6cYHlNaLL/97EuSft
	2mZ4vi75tVoC5+tzzmIYJoY+xHEfs8n166Hgb0AA8ivdMjtbXJZ47Dmxb3JsRDX/IfZ6AkwPXLz
	+fgYjl+80=
X-Google-Smtp-Source: AGHT+IH9CoZYqCB7Zk33rFlxDLCOtglCEGIzhxRkqdculDM6ruGxq8pwoPTjK/O/3z3oGMLXsad0MA==
X-Received: by 2002:a17:907:6d14:b0:af9:1be8:c2aa with SMTP id a640c23a62f3a-af94018ff02mr1062368866b.45.1754316673882;
        Mon, 04 Aug 2025 07:11:13 -0700 (PDT)
Message-ID: <01442213-1bcb-465c-9e0d-252864ba88c8@suse.com>
Date: Mon, 4 Aug 2025 16:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] xen/dom0less: abstract Arm-specific p2m type
 name for device MMIO mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <b9f7a13262cb3b482fb3d5cbbee6c72781fbfdc2.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b9f7a13262cb3b482fb3d5cbbee6c72781fbfdc2.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Rename `p2m_mmio_direct_dev` to a more architecture-neutral alias
> `p2m_mmio_direct` to avoid leaking Arm-specific naming into common Xen code,
> such as dom0less passthrough property handling.
> 
> This helps reduce platform-specific terminology in shared logic and
> improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).
> 
> No functional changes — the definition is preserved via a macro alias
> for Arm.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, but no, ...

> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -137,6 +137,8 @@ typedef enum {
>      p2m_max_real_type,  /* Types after this won't be store in the p2m */
>  } p2m_type_t;
>  
> +#define p2m_mmio_direct p2m_mmio_direct_dev

... this isn't what I suggested. When Arm has three p2m_mmio_direct_*,
randomly aliasing one to p2m_mmio_direct is imo more likely to create
confusion than to help things. Imo you want to introduce ...

> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>                                 gaddr_to_gfn(gstart),
>                                 PFN_DOWN(size),
>                                 maddr_to_mfn(mstart),
> -                               p2m_mmio_direct_dev);
> +                               p2m_mmio_direct);

... a per-arch inline function which returns the type to use here.
The name of the function would want to properly reflect the purpose;
my limited DT knowledge may make arch_dt_passthrough_p2m_type() an
entirely wrong suggestion.

Jan

