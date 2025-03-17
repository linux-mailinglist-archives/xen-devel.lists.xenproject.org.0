Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F509A657B8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917401.1322329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD9W-0003mW-Qv; Mon, 17 Mar 2025 16:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917401.1322329; Mon, 17 Mar 2025 16:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD9W-0003kc-O9; Mon, 17 Mar 2025 16:17:22 +0000
Received: by outflank-mailman (input) for mailman id 917401;
 Mon, 17 Mar 2025 16:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuD9U-0003kW-HX
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:17:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c25fd92-034b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:17:18 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso25239875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:17:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2bb5f987sm54728735e9.24.2025.03.17.09.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:17:17 -0700 (PDT)
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
X-Inumbo-ID: 4c25fd92-034b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742228238; x=1742833038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VgH47IMTEeiUqKRelK2afkBy3BVJidm/2lK9JkBNksA=;
        b=fWjR4U+6Y1h/EO+Y7eVXXJzytTJPr4qjeucVIGh3V4gexmnBn7Cz332UdiSBAc0T2A
         J7Png5c+7EzGM0xkll7EJ58NysnJxA0jMuw/nSzzsvXxBT/mNnB4+/kQtTcz6ywT1ASz
         ZTo5hS6qnakaedWBE+CeGfhAC2usRrvFE1nbNwXTtQr6QzUW8Hx78grvleBNJj9ddqO7
         dCFwEP/310ml4J+TITdi78prksnCSCeDpNgZweGPPJsbwxyWHFFoBQWwFockwh82PIo2
         xKJQt2ZrNcDQhXC+LKBQ9/C/FpeL5WTrRof1GZVDFWcaO9452fyhpeHBBxEkrAt3mmZD
         EiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228238; x=1742833038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgH47IMTEeiUqKRelK2afkBy3BVJidm/2lK9JkBNksA=;
        b=aYc43MSLTA080/opItSCDmAEjs6/FGKzstMkJVWN0dX5YTnN4ZUOWVoLkbjdsTH9sD
         0ixFZShIKrm57yY4Orju5oD0midxKX7LxFqof7ElNRGJt77z+k70z/gEyhe0ek7MxbR7
         Vu09gOf8ifemYflwTbdV/x/D46Nko2+5K2JjHwo9dDWXvc01Ksw4/1GDMJv7hGGcsBwd
         sMMm0V9AAirpCBFYsurzszJc5C0bngl9TskEgcl1pqN6Gv8FtCfFo7iqpGo+AZycRwRv
         FiQdRg8qIL9IFHxmM0nUDZIvUcVayAkpiLAorJ+tcpAl/xtdrSMw2uiub70b3zzoqlDL
         kYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlJPpIIFLK9PVvJnB2hBzIcVEOSzvAh+x/WbtScA2O+8CGLYKUABCjhlxiRJCFYvZ/LRoSdX/6p/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6/7ZdzxwAZBqRgimjkKFgaObunrouzOZxbyoODProGn69jiQK
	5ZsNdSU9bw478IQ2YVJ3xuBxlnqtgvenZNeRNuaI6Nyz0cOsEIX2ddUqXA87mA==
X-Gm-Gg: ASbGncujH/iVMBU/ZlbmDX4jikf0F5mEd/KvSCA9H33KbFgFnhbBhHG7W8ONPyYSxkm
	EsUb44EQHCFpU1ckU1KIgJpFcGyQ1fgfFLJ3EyuaNP6O56Ua8876e74Gr09nlv3wFnnyDTZvVif
	1dbbfDrTwHQI3llx6Qx8JBunDg0ktv9NrO8hMFgGKzre0ZaQ9MJROxb9h5oH5RqtdndGLDA0mIb
	XcD8MpR26DlCi+rfJ9ayoqvlchpG7M+vPaCq8tIfDEiF67r8Z6M+2bvpsfVWlHv1rU9ttFXHI9p
	ZnYJu3b4Yy1ABbXY1A6EonMZXL/eTdhqzdHkiuGcZ+S4VA6vExltk3EbD7hUdzxkVhDsSVqJ6gn
	f9CdHeRYzuddYaHQqfHkjoG7im2QoncQxaxDEfyDF
X-Google-Smtp-Source: AGHT+IEb0smSXMzcaisFO77azjoVodEt+VvAn9+Y8gMiG47+ZLFsOsDtq/GFokoBw0WFZ1Xm5nS5+A==
X-Received: by 2002:a05:600c:35c6:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d1ec80fb4mr124156075e9.8.1742228237918;
        Mon, 17 Mar 2025 09:17:17 -0700 (PDT)
Message-ID: <6d1d75f5-2884-4e93-b4e2-3ea9c2f4b6a4@suse.com>
Date: Mon, 17 Mar 2025 17:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain
 pci_sbdf_t
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1742063500.git.sultanovandriy@gmail.com>
 <3dfb3e32d06f204f9eb2087ea0d570140c95feda.1742063500.git.sultanovandriy@gmail.com>
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
In-Reply-To: <3dfb3e32d06f204f9eb2087ea0d570140c95feda.1742063500.git.sultanovandriy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.03.2025 11:08, Andrii Sultanov wrote:
> Following a similar change to amd_iommu struct, make two more structs
> take pci_sbdf_t directly instead of seg and bdf separately. This lets us
> drop several conversions from the latter to the former and simplifies
> several comparisons and assignments.
> 
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
> 
> ---
> 
> This particular commit does not have any effect on code size:
> add/remove: 0/0 grow/shrink: 2/6 up/down: 96/-96 (0)
> Function                                     old     new   delta
> _einittext                                 22092   22156     +64

I'm puzzled by this: _einittext being last (and not itself a function);
how can it grow? What follows it (as per the linker script) is
.altinstr_replacement, yet I wouldn't expect that to change in size.

> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -268,7 +268,13 @@ int cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc);
>  void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
>  
>  extern struct ioapic_sbdf {
> -    u16 bdf, seg;
> +    union {
> +        struct {
> +            uint16_t bdf;
> +            uint16_t seg;
> +        };
> +        pci_sbdf_t sbdf;
> +    };
>      u8 id;
>      bool cmdline;
>      u16 *pin_2_idx;
> @@ -279,7 +285,14 @@ unsigned int ioapic_id_to_index(unsigned int apic_id);
>  unsigned int get_next_ioapic_sbdf_index(void);
>  
>  extern struct hpet_sbdf {
> -    u16 bdf, seg, id;
> +    union {
> +        struct {
> +            uint16_t bdf;
> +            uint16_t seg;
> +        };
> +        pci_sbdf_t sbdf;
> +    };
> +    uint16_t id;
>      enum {
>          HPET_NONE,
>          HPET_CMDL,

Oh, yet more fragile aliasing. No, please don't. Just have a single pci_sbdf_t
there.

Jan

