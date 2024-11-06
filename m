Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A089BF06D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831129.1246299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8h6s-0003uz-7u; Wed, 06 Nov 2024 14:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831129.1246299; Wed, 06 Nov 2024 14:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8h6s-0003sw-4H; Wed, 06 Nov 2024 14:34:14 +0000
Received: by outflank-mailman (input) for mailman id 831129;
 Wed, 06 Nov 2024 14:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8h6q-0003sk-NF
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:34:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dd0c452-9c4c-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 15:34:07 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso720934866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 06:34:07 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb18140a6sm288441666b.195.2024.11.06.06.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 06:34:06 -0800 (PST)
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
X-Inumbo-ID: 2dd0c452-9c4c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJkZDBjNDUyLTljNGMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAzNjQ3LjM1MjY5NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730903647; x=1731508447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zKohzV+Hi0+Y/7hjJZy0JZs/usHdZoFKGVTbo5xN8Cg=;
        b=nhb5F5nYRJ6qIvz8CSYcV3MEbRF+IPkbwIe683j768/oTnByvbQ2BYSf9HtKlmTQt+
         LuhFhQRhil26MSnhx0VGmOZZ5TG+9qnDhmoYuLK+KI73GCL03X2aBVojE8JUNLtNpGgM
         jdGVEuznMTEttf0KZp1jdhGM31Aansp03yF/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903647; x=1731508447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKohzV+Hi0+Y/7hjJZy0JZs/usHdZoFKGVTbo5xN8Cg=;
        b=j/n5BpUdmAGJW9dL5yPfIO0e6pnFcbr/aEldywykvm2+7adF20AHtYPV+1ABkCfVGO
         7b4EOYvggYl1Tj2/w1D6Ee2zRKrcPbHOzst7yEkiN7RSxbABvV63qqxxQaaoW/jDl33r
         iA2AgfcbHanyTzf1lhOExLiOc2uwOO8iOmLfzxdQxgh2b5/ZBH0HxqoAa00gaRdI+2hM
         GGjc0yG7XEBiLGgYz9EE7kgYi0nRWpLVcgGU5YrHYbyse1/I+KpmraWI6/C7MMOpI3Dn
         MpPBCRtDaLGKmXMWYq72v2eSNq3GChuua6A/PlcF97XQDQwqbY/QgI0jKKK61xXkeLjB
         R2nw==
X-Forwarded-Encrypted: i=1; AJvYcCWhHoakxfze8aD+Pr/g+BCTQqNSvuH9hgG03XIYSZTV3JQZfUCi3wnLHdmZ1s0SsZ9+Nf+ul7CjJxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJVSu2JptKXWQsgQLjKdcJXcdzpnxLrrKsKPMbyF9rMXI7kYAG
	5NChybtxmkCFsexzqAE7WFgKmAhvfCFh4AuXqieInCXZ9OnRyHudUib0AB7Men0ug1Dr+NPDw8u
	s
X-Google-Smtp-Source: AGHT+IEb75xrB9mL1DJ/s3lJGpXkQe3Za8VJghAEDwlnXMQDgfmyGjo5LcLuW1JDP3qPIQ9S6pBXig==
X-Received: by 2002:a17:907:94cf:b0:a99:f945:8776 with SMTP id a640c23a62f3a-a9e6557ddd2mr2114805466b.24.1730903646696;
        Wed, 06 Nov 2024 06:34:06 -0800 (PST)
Message-ID: <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
Date: Wed, 6 Nov 2024 14:34:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241102172551.17233-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
> With all boot modules now labeled by type, it is no longer necessary to
> track whether a boot module was identified via the module_map bitmap.
>
> Introduce a set of helpers to search the list of boot modules based on type and
> the reference type, pointer or array index, desired. Then drop all uses of
> setting a bit in module_map and replace its use for looping with the helpers.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v7:
> - collapse the three module_map patches into one,
>   - x86/boot: remove module_map usage from microcode loading
>   - x86/boot: remove module_map usage from xsm policy loading
>   - x86/boot: remove module_map usage by ramdisk loading

Definitely nicer for having been collapsed together.

> ---
>  xen/arch/x86/cpu/microcode/core.c   | 12 ++++-----
>  xen/arch/x86/include/asm/bootinfo.h | 42 ++++++++++++++++++++++++++++-
>  xen/arch/x86/setup.c                | 28 +++++++++++--------
>  xen/xsm/xsm_policy.c                | 19 +++++--------
>  4 files changed, 70 insertions(+), 31 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index f46464241557..b09cf83249f6 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
>  
>      if ( opt_scan ) /* Scan for a CPIO archive */
>      {
> -        for ( idx = 1; idx < bi->nr_modules; ++idx )
> +        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)

Minor, but we treat for_each_* as if they were for loops, so this either
wants to be

for_each_boot_module_by_type ( idx, bi, BOOTMOD_UNKNOWN )

or

for_each_boot_module_by_type (idx, bi, BOOTMOD_UNKNOWN)

spacing wise.  There's no agreement between maintainers on the extra
spaces inside brackets or not.


However, despite looking at this many times, I've only just realised... 
This semantically changes things in a direction that we won't want.

Today, BOOTMOD_RAMDISK only happens a side effect of being "first
BOOTMOD_UNKNOWN standing at the end".

But the EFI boot code ought to set bi->type=RAMDISK explicitly from the
ramdisk= argument (it can probably set type=MICROCODE too), and future
plans with a large HL config probably will be similar.

Anything which sets type=, and type=RAMDISK in particular, prior to
early_microcode_load() excludes it from the search.  This is definitely
not what we want.


It's a latent bug for now, but I'd suggest keeping the plain for loop, with

            /* Search anything unclaimed or likely to be a CPIO archive. */
            if ( bm->type != BOOTMOD_UNKNOWN &&
                 bm->type != BOOTMOD_RAMDISK )
                continue;

as the selection criteria.  Probably also want to start from idx=0 to
remove assumptions about the dom0 kernel.

Thoughts?



>          {
> +            struct boot_module *bm = &bi->mods[idx];
>              struct cpio_data cd;
>  
> -            if ( !test_bit(idx, bi->module_map) )
> -                continue;
> -
> -            size = bi->mods[idx].mod->mod_end;
> -            data = bootstrap_map_bm(&bi->mods[idx]);
> +            size = bm->mod->mod_end;
> +            data = bootstrap_map_bm(bm);
>              if ( !data )
>              {
>                  printk(XENLOG_WARNING "Microcode: Could not map module %d, size %zu\n",
> @@ -840,7 +838,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>              return -ENODEV;
>          }
>  
> -        if ( !__test_and_clear_bit(idx, bi->module_map) )
> +        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
>          {
>              printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
>              return -ENODEV;
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index fc74e3b224e7..37dfcc14fa7d 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -43,10 +43,50 @@ struct boot_info {
>      size_t memmap_length;
>  
>      unsigned int nr_modules;
> -    unsigned long *module_map; /* Temporary */
>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>  };
>  
> +/*
> + * next_boot_module_index:
> + *     Finds the next boot module of type t, starting at array index start.
> + *
> + * Returns:
> + *      Success - index in boot_module array
> + *      Failure - a value greater than MAX_NR_BOOTMODS
> + */
> +static inline unsigned int __init next_boot_module_index(
> +    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
> +{
> +    unsigned int i;
> +
> +    if ( t == BOOTMOD_XEN )
> +        return bi->nr_modules;
> +
> +    for ( i = start; i < bi->nr_modules; i++ )
> +    {
> +        if ( bi->mods[i].type == t )
> +            return i;
> +    }
> +
> +    return MAX_NR_BOOTMODS + 1;
> +}
> +
> +/*
> + * first_boot_module_index:
> + *     Finds the first boot module of type t.
> + *
> + * Returns:
> + *      Success - index in boot_module array
> + *      Failure - a value greater than MAX_NR_BOOTMODS
> + */
> +#define first_boot_module_index(bi, t)              \
> +    next_boot_module_index(bi, t, 0)
> +
> +#define for_each_boot_module_by_type(i, b, t)       \
> +    for ( i = first_boot_module_index(b, t);        \
> +          i <= (b)->nr_modules;                     \
> +          i = next_boot_module_index(b, t, i + 1) )

(i) = first_...


> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 4c195411d05b..12c9de5a1fbf 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -33,22 +33,18 @@
>  int __init xsm_multiboot_policy_init(
>      struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>  {
> -    int i;
> +    unsigned int i;
>      int rc = 0;
>      u32 *_policy_start;
>      unsigned long _policy_len;
>  
> -    /*
> -     * Try all modules and see whichever could be the binary policy.
> -     * Adjust module_map for the module that is the binary policy.
> -     */
> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
> +    /* Try all unknown modules and see whichever could be the binary policy. */
> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>      {
> -        if ( !test_bit(i, bi->module_map) )
> -            continue;
> +        struct boot_module *bm = &bi->mods[i];
>  
> -        _policy_start = bootstrap_map(bi->mods[i].mod);
> -        _policy_len   = bi->mods[i].mod->mod_end;
> +        _policy_start = bootstrap_map(bm->mod);
> +        _policy_len   = bm->mod->mod_end;

Minor, but you ought to switch to bootstrap_map_bm() here straight away,
which reduces the churn in patch 9.

~Andrew

