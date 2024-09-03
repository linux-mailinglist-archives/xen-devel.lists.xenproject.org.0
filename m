Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0396ACE4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 01:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789653.1199251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slcy0-0004AI-Cg; Tue, 03 Sep 2024 23:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789653.1199251; Tue, 03 Sep 2024 23:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slcy0-00048P-9v; Tue, 03 Sep 2024 23:29:44 +0000
Received: by outflank-mailman (input) for mailman id 789653;
 Tue, 03 Sep 2024 23:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slcxy-00048J-6L
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 23:29:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640c5682-6a4c-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 01:29:40 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso25492766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 16:29:40 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891dacb2sm738601166b.183.2024.09.03.16.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 16:29:38 -0700 (PDT)
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
X-Inumbo-ID: 640c5682-6a4c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725406179; x=1726010979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RrPzwPuE9Si3DyppcazGQDOLksEjUEIjgO3AvAHf0xw=;
        b=G5K8mVs+iqAJEqVcXYoIkOANDQIG0uwVUKhVWavnFffTg6uR8Uq+CSjRUXpNVaq889
         8GWzjOSdZQnMFa0Ddc9Dmrz1e9suGvtPfA2OnkJrYh2jKV/tj4ZrK1FuYtRGdQRjZGM3
         zi6ZCVvNCdS9t37wiu7H2r8YBKQxOa/olfV6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725406179; x=1726010979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrPzwPuE9Si3DyppcazGQDOLksEjUEIjgO3AvAHf0xw=;
        b=Mg1RmjfqPDCTZMKF9wrWWqWvmOIxkDSp6PJKyZPdER+0FxryPYhy+4PqFly0Q1PzYJ
         d8FIOB6EtZeR2AUVvXVzc2AztYhjVXRKLc5Lgo6VjRreybqTuFaboo+pdBDB9Rg6YC3c
         cKv+ZRpjYzW7GIBkejb36cQGTLT15eFoeHpucA9Iac30r8D8dAjnuNnPOgpPzf8LdV6Q
         VZvZUyzJLiEf6gXLMEJwsrbklrl21k/E9koNM6y8D6UlLN3rDW/JK3NgHgzofzdSsEqz
         FhKfnqDh/qdY7YFmInygYseMdYMae6SsOPiJpxSQNCreoIR91RApVnziONxyW/tvJwrt
         hoew==
X-Forwarded-Encrypted: i=1; AJvYcCWOxlIZWuGGrcg0nwfVpXycoAeKIp0VsR79hoWYyJtfp5+77Q0Zt8G4t3Sf8XMX0l2paQ9cJRWzlXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzooCWEf0xpbA5PgN0DP7wb0+EjhNtTLAK3TQNIn04wNZ/G2wwr
	TZa6G1xTTpWckCG/ZUXfVUYLGFVaFUUgw2zhrLU9eLR2YtZRjXjZUQXcX3wWWNs=
X-Google-Smtp-Source: AGHT+IH1WSmJ/yYOgfdAPYOLgJCB0EMbuG0PneZWaSU6rdBnQsDRM/XpNgTLTeKmrKhpX6SXIpzy7g==
X-Received: by 2002:a17:907:2da4:b0:a86:9fac:6939 with SMTP id a640c23a62f3a-a8a43199cc9mr16374266b.30.1725406179083;
        Tue, 03 Sep 2024 16:29:39 -0700 (PDT)
Message-ID: <bc8987f6-e2cf-4ab7-b493-6fd00b89108a@citrix.com>
Date: Wed, 4 Sep 2024 00:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/44] x86/boot: introduce struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-6-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240830214730.1621-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index e785ed1c5982..844262495962 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -8,10 +8,16 @@
>  #ifndef __XEN_X86_BOOTINFO_H__
>  #define __XEN_X86_BOOTINFO_H__
>  
> +#include <xen/multiboot.h>
>  #include <xen/types.h>
>  
> +struct boot_module {
> +    module_t *early_mod;

This could do with a /* Transitionary only */ comment.  In this patch
it's not too bad, but it does get worse as new fields are added, before
being removed.

I'd also drop the "early_" part.  I know it's the initial_images array
we're converting, but "early_" doesn't convey any extra meaning, and it
makes a number of lines get quite hairy.

> +};
> +
>  struct boot_info {
>      unsigned int nr_mods;
> +    struct boot_module *mods;

struct boot_module modules[MAX_NR_BOOTMODS + 1];

Probably at the end of the structure.  In turn it ...

>  
>      const char *boot_loader_name;
>      const char *cmdline;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index c6b45ced00ae..28fdbf4d4c2b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -278,12 +278,17 @@ custom_param("acpi", parse_acpi_param);
>  
>  static const char *cmdline_cook(const char *p, const char *loader_name);
>  
> +/* Max number of boot modules a bootloader can provide in addition to Xen */
> +#define MAX_NR_BOOTMODS 63
> +
>  static const module_t *__initdata initial_images;
>  static struct boot_info __initdata *boot_info;
>  
> -static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
>  {
>      static struct boot_info __initdata info;
> +    static struct boot_module __initdata boot_mods[MAX_NR_BOOTMODS + 1];

... drops this static.

> +    unsigned int i;
>  
>      info.nr_mods = mbi->mods_count;
>  
> @@ -303,6 +308,14 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
>          info.mmap_length = mbi->mmap_length;
>      }
>  
> +    info.mods = boot_mods;
> +
> +    for ( i=0; i < info.nr_mods; i++ )

i = 0

> +        boot_mods[i].early_mod = &mods[i];
> +
> +    /* map the last mb module for xen entry */
> +    boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];

The comment is good, but note how this is just one extra iteration of
the loop, (so use <= for the bound).

~Andew

