Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF496ACB2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 01:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789648.1199243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slcnW-00019l-FX; Tue, 03 Sep 2024 23:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789648.1199243; Tue, 03 Sep 2024 23:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slcnW-00016a-CF; Tue, 03 Sep 2024 23:18:54 +0000
Received: by outflank-mailman (input) for mailman id 789648;
 Tue, 03 Sep 2024 23:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slcnU-00016U-S2
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 23:18:52 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e111de2f-6a4a-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 01:18:50 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so702602266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 16:18:50 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb0e5sm748608966b.12.2024.09.03.16.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 16:18:49 -0700 (PDT)
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
X-Inumbo-ID: e111de2f-6a4a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725405530; x=1726010330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh30vOHE46AppWpSAnrJXV/URG528mvkcYlXLiKgSJw=;
        b=Zcq2wxA9+NIk3Ae+VvpjssfEX5qNuGbHSWW5G7VaLY190U2yWywNSn/TKVbw6xBLoZ
         cSRob9JeNATsz7B+Ue6OwwRsigXQlx/Tfi16mYU3/8BDBJTedpUSHStyoX4UOLp+069v
         CG9lWf93s+Xzb1lIhfEoQY+XdwJQ2dpH+n1us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725405530; x=1726010330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh30vOHE46AppWpSAnrJXV/URG528mvkcYlXLiKgSJw=;
        b=qpcfxnZ2mQCnNMo2eiGpmuByOtHjj3EungQ+NPQ4j9VpsvzZIXRfa6hUo9DGgI5BUG
         DECWRXa8I9hhXpwuh8VUGay/1qs/cGBNNqV1nCc72xND2A/T0UEmRImhpKmGCXLi+Z5p
         COGTj3Rt/X3CPl2hlb/Jb06RL+VMfbx10VEsnA7QftebU2K/6LSy9I6JgKZ0d2td72+P
         faPJtkCuUkUrm5zSyWLF4wHOXhUnhlFGGJ5uP71P4EMGytpnrM3cdv0CbRdsj+HcuKqc
         0/+rvIt+Xe5+xx6HG48q6W5TMGYg7G1m4afAyIRZ/4r0dDlyUZf9u4TBEToj06YOGbYP
         Xj1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvZV+xCHK1qkYWGcfWO7yK1NOQ8z2OsbzYCBUH45ojFcDJyUBxLCv8/0S5bfZIJUrJE1ulQM6Vkp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1IBMiSqt3sOtwhaJPIeLAEOGqn0FjP1p7apa3Kvo9JNXUP2f6
	feyJW/wF9IdnHObs4dGJV+AJhbToSQiF4aALQQXyCIdnOWfJDbMhIzY/bn/QrAE=
X-Google-Smtp-Source: AGHT+IFFoK/KXSG/I67KRSP4zI6oVQ50CHXV32em+RVKa72mLRjtAm1wrCROiiE6I8NA4pHJPg/6YQ==
X-Received: by 2002:a17:907:970f:b0:a86:894e:cd09 with SMTP id a640c23a62f3a-a897f78bdb5mr1507565666b.9.1725405529694;
        Tue, 03 Sep 2024 16:18:49 -0700 (PDT)
Message-ID: <1a185804-2ffe-4d70-8219-b55992836ac6@citrix.com>
Date: Wed, 4 Sep 2024 00:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/44] x86/boot: move mmap info to boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-5-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240830214730.1621-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
> Transition the memory map info to be held in struct boot_info.
>
> No functional change intended.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/include/asm/bootinfo.h |  5 +++++
>  xen/arch/x86/setup.c                | 12 +++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index d2ca077d2356..e785ed1c5982 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -8,11 +8,16 @@
>  #ifndef __XEN_X86_BOOTINFO_H__
>  #define __XEN_X86_BOOTINFO_H__
>  
> +#include <xen/types.h>
> +
>  struct boot_info {
>      unsigned int nr_mods;
>  
>      const char *boot_loader_name;
>      const char *cmdline;
> +
> +    paddr_t mmap_addr;
> +    uint32_t mmap_length;

memmap please.

> @@ -1200,13 +1206,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      {
>          memmap_type = "Xen-e820";
>      }
> -    else if ( mbi->flags & MBI_MEMMAP )
> +    else if ( boot_info->mmap_addr )
>      {
>          memmap_type = "Multiboot-e820";
> -        while ( bytes < mbi->mmap_length &&
> +        while ( bytes < boot_info->mmap_length &&
>                  e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
>          {
> -            memory_map_t *map = __va(mbi->mmap_addr + bytes);
> +            memory_map_t *map = __va(boot_info->mmap_addr + bytes);
>  
>              /*
>               * This is a gross workaround for a BIOS bug. Some bootloaders do

This is some very gnarly logic.  pvh_init() plays with e820_raw behind
the scenes and doesn't set MBI_MEMMAP.

Perhaps for later cleanup too, this logic wants folding into the new
multiboot_fill_boot_info() and leave __start_xen().

~Andrew

