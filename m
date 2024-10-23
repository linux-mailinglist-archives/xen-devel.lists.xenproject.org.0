Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD429AD210
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 19:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824885.1239073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ek0-0005xD-It; Wed, 23 Oct 2024 17:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824885.1239073; Wed, 23 Oct 2024 17:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ek0-0005vi-Fe; Wed, 23 Oct 2024 17:01:48 +0000
Received: by outflank-mailman (input) for mailman id 824885;
 Wed, 23 Oct 2024 17:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5M=RT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t3ejy-0005vb-S7
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 17:01:46 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bbe8e31-9160-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 19:01:45 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb6110c8faso71621241fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 10:01:45 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b535sm4593289a12.68.2024.10.23.10.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 10:01:43 -0700 (PDT)
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
X-Inumbo-ID: 7bbe8e31-9160-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729702904; x=1730307704; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oxpaVRCQxGt2WsbSTmzTFH95eCwt6zyG1YD0NUX3Jyk=;
        b=SEdWIF4z+QqZ8+mmBPsNFCg+tbvEo4xF5TFBx0ukSdHhyLdsHr40YUkJ69WVLglIeE
         GoR4k+/bapS4Bg281PsSthY2RQcRrh4XVID9V5MIyWB1id7o/87VLN9f43qT+N6qhmK7
         ciLleUVmTPXqUHLZmuZ4uGRuNhCZlmFh+y6aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702904; x=1730307704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxpaVRCQxGt2WsbSTmzTFH95eCwt6zyG1YD0NUX3Jyk=;
        b=Id8r9RtuO2VWCNx69UQdACHcwz/gK/wBh/EYtVa5TeQGq630v/KVJicUXk4VM1BYQw
         VP4uBx5xnintAqBNcaU1KdHj+PRrBJx9OfDnW8DrLXfRoQjut45oPGzHzhvmU670D4Y4
         26babAQGUvUyAs+y/emQaC5SUxMG0HL7KUL31u5/nwEuTUs0OqlYOdnjWi0CZ1n8lmDZ
         UyOsc8uxvXKNF0TW+vhY2+e+s+dea3z62J2YQHPszEbWtk51BjjwEMwNjukJxC8ApcW1
         bJx43XMIPvXLg94NOoYbhUp2lcCQhtO0IYC5omrQVE9DK0cdttsXNEcJwRpaFDCbmHSe
         JBnA==
X-Gm-Message-State: AOJu0YzcTrSSCc1F2EkuwmXDBzE2mSLWBVcnTNIo2OaBJibJs1n6BsMX
	u0/8qat+xS+uISZD15Bj3g47t53xtH9G+J0eN9wgmCRnFTjzAD7HQGMeidh2E3U=
X-Google-Smtp-Source: AGHT+IEeN/OlsMozfgz0yy1/TK3Uxg5D2ahdPyoong2nWX69MamTGAD6faTnnNsxdU748kZYGRvsZg==
X-Received: by 2002:a05:651c:2123:b0:2fb:55b2:b199 with SMTP id 38308e7fff4ca-2fc9d5e0ebcmr18911231fa.37.1729702903416;
        Wed, 23 Oct 2024 10:01:43 -0700 (PDT)
Date: Wed, 23 Oct 2024 18:01:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/boot: Fix microcode module handling during PVH
 boot
Message-ID: <Zxkr9il-X0hK2GFv@macbook.local>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023105756.641695-3-andrew.cooper3@citrix.com>

On Wed, Oct 23, 2024 at 11:57:55AM +0100, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
> transition period"), the use of __va(mbi->mods_addr) constitutes a
> use-after-free on the PVH boot path.
> 
> This pattern has been in use since before PVH support was added.  Inside a PVH
> VM, it will go unnoticed as long as the microcode container parser doesn't
> choke on the random data it finds.
> 
> The use within early_microcode_init() happens to be safe because it's prior to
> move_xen().  microcode_init_cache() is after move_xen(), and therefore unsafe.
> 
> Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
> bi->mods[].mod is a safe way to access the module list during PVH boot.
> 
> Note: microcode_scan_module() is still bogusly stashing a bootstrap_map()'d
>       pointer in ucode_blob.data, which constitutes a different
>       use-after-free, and only works in general because of a second bug.  This
>       is unrelated to PVH, and needs untangling differently.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Refectored/extracted from the hyperlaunch series.
> 
> There's no good Fixes tag for this, because it can't reasonably be "introduce
> PVH", nor can the fix as-is reasonably be backported.  If we want to fix the
> bug in older trees, we need to plumb the mod pointer down alongside mbi.
> ---
>  xen/arch/x86/cpu/microcode/core.c    | 40 +++++++++++-----------------
>  xen/arch/x86/include/asm/microcode.h |  8 +++---
>  xen/arch/x86/setup.c                 |  4 +--
>  3 files changed, 22 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 8564e4d2c94c..1d58cb0f3bc1 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -35,6 +35,7 @@
>  #include <xen/watchdog.h>
>  
>  #include <asm/apic.h>
> +#include <asm/bootinfo.h>
>  #include <asm/cpu-policy.h>
>  #include <asm/nmi.h>
>  #include <asm/processor.h>
> @@ -152,11 +153,8 @@ static int __init cf_check parse_ucode(const char *s)
>  }
>  custom_param("ucode", parse_ucode);
>  
> -static void __init microcode_scan_module(
> -    unsigned long *module_map,
> -    const multiboot_info_t *mbi)
> +static void __init microcode_scan_module(struct boot_info *bi)

Sorry to be pedantic, can't you keep bi as const?

>  {
> -    module_t *mod = (module_t *)__va(mbi->mods_addr);
>      uint64_t *_blob_start;
>      unsigned long _blob_size;
>      struct cpio_data cd;
> @@ -178,13 +176,13 @@ static void __init microcode_scan_module(
>      /*
>       * Try all modules and see whichever could be the microcode blob.
>       */
> -    for ( i = 1 /* Ignore dom0 kernel */; i < mbi->mods_count; i++ )
> +    for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
>      {
> -        if ( !test_bit(i, module_map) )
> +        if ( !test_bit(i, bi->module_map) )
>              continue;
>  
> -        _blob_start = bootstrap_map(&mod[i]);
> -        _blob_size = mod[i].mod_end;
> +        _blob_start = bootstrap_map(bi->mods[i].mod);
> +        _blob_size = bi->mods[i].mod->mod_end;
>          if ( !_blob_start )
>          {
>              printk("Could not map multiboot module #%d (size: %ld)\n",
> @@ -204,21 +202,17 @@ static void __init microcode_scan_module(
>      }
>  }
>  
> -static void __init microcode_grab_module(
> -    unsigned long *module_map,
> -    const multiboot_info_t *mbi)
> +static void __init microcode_grab_module(struct boot_info *bi)

Same here re bi being const?

There are some further below, that I think all should keep the const
keywoard?

Otherwise looks good:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

