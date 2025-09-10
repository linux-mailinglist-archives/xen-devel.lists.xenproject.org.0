Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36508B518EC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 16:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118341.1464160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLUy-0004Hu-17; Wed, 10 Sep 2025 14:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118341.1464160; Wed, 10 Sep 2025 14:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwLUx-0004G6-US; Wed, 10 Sep 2025 14:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1118341;
 Wed, 10 Sep 2025 14:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwLUw-0004G0-13
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 14:08:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2538b94-8e4f-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 16:08:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b0787fdb137so128400866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 07:08:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62bfef68629sm3471775a12.15.2025.09.10.07.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 07:08:31 -0700 (PDT)
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
X-Inumbo-ID: a2538b94-8e4f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757513312; x=1758118112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZws/mfXdszWuaUA7T2svwUlHS5P35/6VJ79GmkU27Q=;
        b=MdCWmcj1L5+Yg9xllsAY5X6Ci+ADLyzUgBWWCTFcpSlCADfsVoylw+l4fIDUjt+kCu
         nATt5FhsZswwjFrJl/Kd/96TEzOaddWYW7sm3BKCJwyQvnw3QEAuRA61+MIHr21g67Xz
         WBdkDDVycYZq+lQ4xSVS23+BPfl3W3OSUemdmh4iFQ0SNjsbs7jSmWf5SJ+LGorlZ2li
         ii/hCxgXBWTkxZnKSlMRHgYhC4+qJOkEGoNsBe7Z8UUIPZpOV0p3JqevuoTssySOjnyN
         X5BBDz2jOpJfF9vj9riezX3AYIagWl24gULN1nL7Cqb4Gd37Z4YZd9pdxDA6UDkBXuQK
         FKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513312; x=1758118112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZws/mfXdszWuaUA7T2svwUlHS5P35/6VJ79GmkU27Q=;
        b=O/x5ER8pkymANt6I5Rnops0GV3tQquQkK5lYR/v7TNWRKfmnIPlt24yNkefjC8QvUG
         69WPwNeF3sWkfKR6mBTp6a0nUWSkl9H0rKviTi+hGpl7CKpEmNG6CVe9/AfECbFpuasd
         K2eaP+eKS3bDW8k5GJLxoU2Nm5sGJ01tTQuYLR7vNVeUkO6FePpIjtYai0iUmHUwZG1x
         Mah3uOWOb5Uoxz0sHdG5ruJY2syXlC3cOazwsASJXbl9ddKcj32XWNT/kmJWO6dZXxP0
         6bdD4RA6VcnquxqxsVOs6R9YPcMYoAyT0P3KWaA8Uk2qDP9cBhJ5P9CeSYhMnXZgBCt5
         80DA==
X-Forwarded-Encrypted: i=1; AJvYcCUZU5/j4EYLTavW/ZQrD10VKMkw4oXMO6pPo082Sg+85ugxvCKHNolSrNTnrQZ3fwxCsulB8P06+8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytQBdK8LlctKfSVUE4Keefa0z0PdK9M3ZfRKOIJZceEi5cBgF8
	niQK4I5GLGa5qPO5YXyKXYUo6qKytsxP1Ku5X5J+WMNGokngDv0WzfQK/GfX21ZzvJg9eQ5bWij
	kb0c=
X-Gm-Gg: ASbGnctswmVq/NsY9MFfBekxuQ0wffVg3mLsoa6pnJdO0ZED1ucFyRu/LS6T21ehxdl
	GUd+qw2tizQp9wiWEXPqgsJ9MJZOHy8J+iemzeS4zWyuO66T3OUIwpRgqO5Uq75icaMcyPmZ5fx
	jWxEcRjjRV3GT8H0yQX9rbZWx8qcxgtKNeJN0uJj5O6kxpw+WZ90vTnNAB+F9bvL/71yTFP+r9f
	c3UhHIU1yzQC7Mf4k9pNjbH1vcPCKtmubqlyE9Bbg0bbKbAVK9as7QhaRBlZh6/1ziqWBNx8sIR
	Y6c2Iov0nWu+rffY2k5YkZvsSSOG3MawTu5+/pc/np5COR1JjVO0YYS+2+gtTd/8L7sMCS3A41U
	h12DwVhyYY1Bo9AL1AtG+K2blBaWznsNg39RZ1talYoqQmvsd4e50uBokc3IzRq1EX7ZhrUynMR
	jmymrW3Dok4KJZJtZVNvl0gIUMbz7W
X-Google-Smtp-Source: AGHT+IEYYKaEpHGxVULfQGgkz7zh9AHw+3nhfM1aHWoWlvtsrYeuD8q0X+mmrfV1PCsnclZIIwX52g==
X-Received: by 2002:a17:906:6a23:b0:b04:8d69:6717 with SMTP id a640c23a62f3a-b04b16db0cemr1571092266b.43.1757513311987;
        Wed, 10 Sep 2025 07:08:31 -0700 (PDT)
Message-ID: <e4a0f7d6-6c8c-41b2-9bb4-19f2403c7d3d@suse.com>
Date: Wed, 10 Sep 2025 16:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Flag PG_log_dirty is for paging log dirty support, not vram tracking support.
> However data structure sh_dirty_vram{} and function paging_log_dirty_range()
> designed for vram tracking support, are guarded with PG_log_dirty.
> We release both from PG_log_dirty, and also move paging_log_dirty_range(),
> remamed with p2m_log_dirty_range(), into p2m.c, where it logically belongs.

Aren't these two independent changes? One to deal with struct sh_dirty_vram,
the other to move and rename paging_log_dirty_range()? Irrespective, in the
interest of making progress:
Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -1110,6 +1110,10 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>  
>  #endif /* CONFIG_HVM */
>  
> +/* get the dirty bitmap for a specific range of pfns */

... comment style corrected here (happy to do so while committing).

Aiui the patch is independent of the earlier two, and hence could go in ahead
of them. Sadly once again nothing like this is stated anywhere, so please
confirm.

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -133,13 +133,20 @@ struct paging_mode {
>      (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
>                    PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
>  
> -#if PG_log_dirty
> +#ifdef CONFIG_HVM
> +/* VRAM dirty tracking support */
> +struct sh_dirty_vram {
> +    unsigned long begin_pfn;
> +    unsigned long end_pfn;
> +#ifdef CONFIG_SHADOW_PAGING
> +    paddr_t *sl1ma;
> +    uint8_t *dirty_bitmap;
> +    s_time_t last_dirty;
> +#endif
> +};
> +#endif

Subsequently I think we will want to do more cleanup here. Us using a shadow
mode struct also in HAP code is bogus and, afaics, wasteful. The three latter
members are used only by shadow code, so HAP could have its own, smaller
variant of the type. And each type could be private to the hap/ and shadow/
subtrees respectively.

Jan

