Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE489BD03
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701891.1096499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmC5-0006Ot-9B; Mon, 08 Apr 2024 10:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701891.1096499; Mon, 08 Apr 2024 10:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmC5-0006Lb-62; Mon, 08 Apr 2024 10:25:41 +0000
Received: by outflank-mailman (input) for mailman id 701891;
 Mon, 08 Apr 2024 10:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtmC4-0006KC-EN
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 10:25:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 584c95fa-f592-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 12:25:39 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2681325f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 03:25:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j31-20020a5d6e5f000000b0033fc06f2d84sm8622030wrz.109.2024.04.08.03.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 03:25:38 -0700 (PDT)
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
X-Inumbo-ID: 584c95fa-f592-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712571938; x=1713176738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wZzYdb/vuDWgkDB5mfmOcG9DUByeCXJjHJxTajEDocs=;
        b=GUzFrfnm8xT/Z9OhMjrQRkMRUrrgyPBRGv/E4ULPgh/B4kZMSKoatTG1eQlOY02/TF
         atBfqg7p2Uwrvhc9ubBFR6Lr9CQiQPQfS9y+2SN0FhIq82Z41sunrMChEbd9aZEkMYk0
         1IT67EMSjdqll5mUai2sA+w60bcJ71ekFACmZrz7RduJOu2JnVc2R5/2OMp8/ZJ7k0qu
         qPmr6OK2PWNkWsobgicu/EOwADDuSLAonGbgItPG4IZyVaMsdvYkwXrrhyQs2znoKwJr
         mDSQk79zt72RphNct/mQlrDsrISEBCGGcYempvMMVl12HcPSR/oce8LgrLKHRKWrZ9yY
         qVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712571938; x=1713176738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZzYdb/vuDWgkDB5mfmOcG9DUByeCXJjHJxTajEDocs=;
        b=QtETVvA18uoq6U6c/b8SZsrR1iwP58dyhIKR306atU6kpm5TsmKgPUu7s6/IRlZBjz
         4J2Ovqd3P6hjghuK7ji7YE5BfUT006DYCTCEMZ3z+RhAlbtSrs0adtCHPrR8WfRWzlSF
         atlqtZdIZQ5VdMYOlUBm87dCBZ2CSSksrIwE6mN7V48LJeVBpf2upA01tNEqrZi9WnqE
         6dEajFl4yT4Eg0gutHtBAD6vSIp0xQiYkZgNcxn6Ox5f1V3NVZKmjrtpxuI4H0jH75Cy
         y8IoTEuoMZL3u8fa3t2dIocC0aPVV4LJ3LhbDTp8glal6ZyAhpVci1Kmm7p2lqGscffv
         oK2w==
X-Forwarded-Encrypted: i=1; AJvYcCWw8UzcY5PDDbWvw8H+FFPFxSDGk940RpESlD19uGwWKUNysRdKaHTrNNRngnO93/5ia/XNwlA/y6ZweYvXQJABzHBp3ZOPklAyihn8btI=
X-Gm-Message-State: AOJu0YxedX7xVffIRJ2EoZU7qS4nX9J3+B6yIt6P/zs51SddZNGJi7EQ
	R9bzVBWgkstt/QBPNBlcQm6k3XPraDZaJKIAJpI8yLiw3VGVQFxthsGH1UfsTg==
X-Google-Smtp-Source: AGHT+IHXABCgQH4pKXyKdhMXIYs8W3vyQkKm84BGnOotM04oGR+LX0TIWyMV+6EOY9pN57ixzIKimw==
X-Received: by 2002:a5d:6a09:0:b0:343:79e8:a4d6 with SMTP id m9-20020a5d6a09000000b0034379e8a4d6mr4809476wru.25.1712571938566;
        Mon, 08 Apr 2024 03:25:38 -0700 (PDT)
Message-ID: <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
Date: Mon, 8 Apr 2024 12:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE
 binary
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20240328151106.1451104-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 16:11, Ross Lagerwall wrote:
> In addition to building xen.efi and xen.gz, build xen-mbi.exe. The
> latter is a PE binary that can be used with a multiboot2 loader that
> supports loading PE binaries.

I have to admit I find .exe a strange extension outside of the Windows
world. Would it be an option to have no extension at all (xen-mbi), or
use xen.mbi?

> Using this option allows the binary to be signed and verified by Shim.
> This means the same xen-mbi.exe binary can then be used for BIOS boot,
> UEFI Boot and UEFI boot with Secure Boot verification (all with the
> convenience of GRUB2 as a bootloader).

With which "UEFI boot" really means "chainloader" from grub? That isn't
required though, is it? I.e. "UEFI boot" ought to work also without
involving grub?

> The new binary is created by modifying xen.efi:
> * Relocations are stripped since they are not needed.

Because of the changed entry point, aiui. What hasn't become clear to
me is what difference in functionality there's going to be between
booting this new image in "UEFI boot" mode vs using xen.efi. Clearly
xen.efi's own (EFI-level) command line options won't be available. But
it feels like there might be more.

> * The image base address is set to 0 since it must necessarily be below
>   4 GiB and the loader will relocate it anyway.

While technically okay, what is the reason for this adjustment? 

> * The PE entry point is set to the multiboot2 entry point rather than
>   the normal EFI entry point. This is only relevant for BIOS boot since
>   for EFI boot the entry point is specified via a multiboot2 tag.

Hmm, I may then be confused about the terminology further up: What is
"BIOS boot" then? So far I've taken that as the equivalent of xen.gz's
way of being booted (i.e. grub without EFI underneath).

> @@ -123,6 +124,19 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
>  
>  orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
>  
> +ifeq ($(XEN_BUILD_PE),y)
> +$(TARGET)-mbi.exe: $(TARGET).efi $(obj)/efi/modify-mbi-exe
> +	$(OBJCOPY) --remove-section=.reloc $< $@.tmp
> +	$(obj)/efi/modify-mbi-exe $@.tmp
> +	$(OBJCOPY) --set-start=0x$$($(NM) -pa $@.tmp | awk '/T start$$/{print $$1}') $@.tmp $@.tmp2

I understand section removal is better done by objcopy. Changing the entry
point could be done by the new tool, though (by passing it the designated
address)?

As to stripping .reloc - generally this needs accompanying by setting the
"relocations stripped" flag in the COFF(?) header. Here, however, I take
it this is not only not needed, but actually not wanted. This imo wants
saying somewhere; the individual steps done here could do with brief
comments anyway, imo.

> --- /dev/null
> +++ b/xen/arch/x86/efi/modify-mbi-exe.c
> @@ -0,0 +1,77 @@
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +#include <fcntl.h>
> +
> +struct mz_hdr {
> +    uint16_t signature;
> +#define MZ_SIGNATURE 0x5a4d
> +    uint16_t last_page_size;
> +    uint16_t page_count;
> +    uint16_t relocation_count;
> +    uint16_t header_paras;
> +    uint16_t min_paras;
> +    uint16_t max_paras;
> +    uint16_t entry_ss;
> +    uint16_t entry_sp;
> +    uint16_t checksum;
> +    uint16_t entry_ip;
> +    uint16_t entry_cs;
> +    uint16_t relocations;
> +    uint16_t overlay;
> +    uint8_t reserved[32];
> +    uint32_t extended_header_base;
> +};
> +
> +struct coff_hdr {
> +    uint32_t signature;
> +    uint16_t cpu;
> +    uint16_t section_count;
> +    int32_t timestamp;
> +    uint32_t symbols_file_offset;
> +    uint32_t symbol_count;
> +    uint16_t opt_hdr_size;
> +    uint16_t flags;
> +};

I can't spot any use of this struct.

Jan

> +#define IMAGE_BASE_OFFSET 48
> +#define NEW_IMAGE_BASE 0x0
> +
> +int main(int argc, char **argv)
> +{
> +    int fd;
> +    struct mz_hdr mz_hdr;
> +    const uint64_t base_addr = NEW_IMAGE_BASE;
> +
> +    if ( argc != 2 )
> +    {
> +        fprintf(stderr, "usage: %s <image>\n", argv[0]);
> +        return 1;
> +    }
> +
> +    fd = open(argv[1], O_RDWR);
> +    if ( fd < 0 ||
> +         read(fd, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
> +    {
> +        perror(argv[1]);
> +        return 2;
> +    }
> +
> +    if ( mz_hdr.signature != MZ_SIGNATURE ||
> +         !mz_hdr.extended_header_base )
> +    {
> +        fprintf(stderr, "%s: Wrong DOS file format\n", argv[1]);
> +        return 2;
> +    }
> +
> +    if ( lseek(fd, mz_hdr.extended_header_base + IMAGE_BASE_OFFSET, SEEK_SET) < 0 ||
> +         write(fd, &base_addr, sizeof(base_addr)) != sizeof(base_addr) )
> +    {
> +        perror(argv[1]);
> +        return 3;
> +    }
> +
> +    close(fd);
> +
> +    return 0;
> +}


