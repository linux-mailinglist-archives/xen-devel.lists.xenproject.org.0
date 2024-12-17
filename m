Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D169A9F5127
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859492.1271640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaYQ-0005as-8i; Tue, 17 Dec 2024 16:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859492.1271640; Tue, 17 Dec 2024 16:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaYQ-0005Z3-63; Tue, 17 Dec 2024 16:36:14 +0000
Received: by outflank-mailman (input) for mailman id 859492;
 Tue, 17 Dec 2024 16:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNaYP-0005Yv-0L
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:36:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e811ef-bc95-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:36:10 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso60136265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:36:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602c9d7sm122234165e9.16.2024.12.17.08.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:36:09 -0800 (PST)
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
X-Inumbo-ID: 05e811ef-bc95-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734453370; x=1735058170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JUGEkVyrqvqSF4KL5lb1zcyA71E+u6asaMgmp+ljBIE=;
        b=MVoXHqHT/VHwSNXF8IU4ouWrlT8gMyUJRuMqeMs5/M2BSAkq5yGDTr6zvHHlWPixy/
         1BjcI13jgzDybjss9kKHFoYn4XvgyipqNjkE98qynFhrY22pZ/v5PNunlNYY5Ry+a6Z1
         ebo45v2DIoxdkzFdnQSrlr4GFQLThi2mNW0rwbt33YjJn5x8mXQk/CMHnwjQ6XaYj4O1
         zGNc5QrgqXd1lu1tazBDdI2us2OjXAFW6+7Eord4mpZOUjBV6xLQb0AyPppuoRBqnka+
         MDW3T7z+ntlRDhTA/1XnX7h2TdKLj90sNAVV4n9vWl9ZY2RqCGWMksZSf7HYPdEjWgjj
         TbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453370; x=1735058170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUGEkVyrqvqSF4KL5lb1zcyA71E+u6asaMgmp+ljBIE=;
        b=F2v8Ibej8KKEs73ceI0+EvffZVgAEptlxmHW5wmW8Thz/HWWTSxZHaBgamKxyZHfJc
         sKk4XHryOlcoQR7YTZ/m7/kPefKO/EVGu+THsIeCPf/dB79nSyOOaRqnKu4L09ebijuY
         P9oK76aHzqR2IU22ChIkPr+88AOwunfxXyKW3Z8gry5CCYAYA3ZE73OHkRJKlm/DqLzc
         Z27mIddyPelMu1Iq4CW+sCEWz30b1nnPqF09wvpS5qaAeAFbdS+/oBwHRL+Pa7Lw7tRM
         BUTOXWgoOB5h5EdDVXR9vccIp5ZcgHVW9GlZpPV7KMqp0vf2Fa61eXYJgmsh8LM2c/CX
         /2LA==
X-Forwarded-Encrypted: i=1; AJvYcCV08seUyOR1l3hhPlDHdj+QGIhQvNoCZM2YnhE3txgvckQ+Kxs3WlsaRLZqUXMyhOjgOJsgCWIpRpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOnZy5HpzHsHkYB+36HqI3UrUhcxbr5K5E7CIPmcjwRHtWjK/x
	YElT88E4yRzD3y4PEa0YWUrBdp2DWNzrPJDFyiu1AaqPM+4UprFY8xOAxMkpKg==
X-Gm-Gg: ASbGncuh03x+1jVUMVA+gFDVks1xbbfOMhNpAF4HjvdQtKj/rccXdr2KAqpiSe8YEJs
	1Zk6s2ecF01cnMN3AKA98Hjrkh7LMIu7w8d+7BEc/+sTiTE7k9WJvtLCYqj3UIoBi6S/nlFdTuH
	JFXM0ikqYiir4k66ooBB9T61ymI00VCYSxVsl+4RK3ZxpsdrPVpDxU6hbaRpmaURUmslDITpK+8
	fEk8gnMFmd1zSVBLWn+irzHDHC/GRxrZyXu98/PfE5ctOOtq8bEXzI4yZv4GRH7uBlfH8hcZ793
	GytddIlI4X0U4v9cioLhijOU7Raci8cjjsobGV/akg==
X-Google-Smtp-Source: AGHT+IGCnt9jTe2BOR8MnTpTMnQqxfmgG7pxkgcf+g+zJqEmiXXLrRXVIh3lhl48r9FRkTLhCquSjQ==
X-Received: by 2002:a05:600c:5029:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-4362aa93dc9mr137719375e9.24.1734453370218;
        Tue, 17 Dec 2024 08:36:10 -0800 (PST)
Message-ID: <abeaddb8-6792-4766-9f29-9b0544c746b7@suse.com>
Date: Tue, 17 Dec 2024 17:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Unflattening and relocation of host device tree
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 17:32, Oleksii Kurochko wrote:
> The current patch series introduces the relocation of the host device tree file
> to free up low memory and also it is expected that discard_initial_modules()
> will be called sooner or later, it will discard the FDT boot module,
> and remove_early_mappings() will destroy the early mappings.
> 
> In addition to relocation, unflattening is introduced to create the tree of
> struct device_node for the host device tree.
> 
> To implement this, several things have been introduced:
>  - destroy_xen_mappings() function, which removes page mappings from Xen's
>    page tables. This is necessary for clear_fixmap().
>  - {set,clear}_fixmap() functions to manage mappings in the fixmap region,
>    which are expected to be used in copy_from_paddr() to copy the FDT to Xen's
>    heap.
>  - Introduce new config CONFIG_QEMU which is going to be used to cover changes
>    connected to QEMU virtual board. It will be used during introduction of stubs
>    for clean_and_invalidate_dcache_va_range() and clean_dcache_va_range(),
>    which are expected to be used in copy_from_paddr() and flush_page_to_ram(),
>    which in turn are expected to be used during the call to xvmalloc_array() in
>    relocate_fdt().
>    In case of QEMU cached related functions are implemented as returning 0 as
>    QEMU doesn't model cache ( and so CMO extensions ). For others cases, it is
>    introduced as -ENOSUPP as h/w could support CMO extension ( or hardware
>    specific insertions ) and it will need to update implementation of the
>    mentioned functions.
>  - The introduction of copy_from_paddr() to copy the FDT to an address
>    allocated in Xen's heap.
> 
> ---
> Changes in v3:
>  - Add some Acks for the patches. All the patches are Acked except:
>      [PATCH v3 1/7] xen/riscv: update layout table in config.h
>      [PATCH v3 5/7] xen/riscv: implement data and instruction cache operations
>  - Other changes please look at the specific patch.
> ---
> Changes in v2:
>  - Update the cover letter.
>  - Introduce new patch with aligning of upper bounds in the layout table in
>    config.h with the definitions below which are inclusive.
>  - Other changes please look at the specific patch.
> ---
> 
> Oleksii Kurochko (7):
>   xen/riscv: update layout table in config.h
>   xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page
>     tables
>   xen/riscv: reorder includes in asm/page.h alphabetically
>   xen/riscv: add {set,clear}_fixmap() functions for managing fixmap
>     entries

Please can you avoid re-posting patches that were already committed (the
latter three)?

Jan

