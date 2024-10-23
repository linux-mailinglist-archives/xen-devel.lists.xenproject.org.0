Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838289AD217
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 19:04:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824894.1239083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3emc-0006b7-4X; Wed, 23 Oct 2024 17:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824894.1239083; Wed, 23 Oct 2024 17:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3emc-0006Yj-15; Wed, 23 Oct 2024 17:04:30 +0000
Received: by outflank-mailman (input) for mailman id 824894;
 Wed, 23 Oct 2024 17:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5M=RT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t3ema-0006YZ-As
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 17:04:28 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc7a15a0-9160-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 19:04:27 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso79371421fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 10:04:27 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb6696b4easm4615881a12.12.2024.10.23.10.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 10:04:26 -0700 (PDT)
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
X-Inumbo-ID: dc7a15a0-9160-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729703067; x=1730307867; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYfJtlp/QhBe4rxr2UNwqjGS5HXn9ENDB3RWlELOULY=;
        b=ohwyVLLYc0Fv/cjUuXhgKSRrchm3Ndy75h9yIH02ziCjxMV6B1j4xt+QVyhdZ9+gqi
         cTIzscCZ3jwhjRQbgCDaoy/nsIZx5ZgILVxJjhp10O+z0asb9hz8KlPDxdKfjqujxAuj
         bRYZutk+Gi3sRNLQ7Tt4fe5H0GBT1hzVvm/tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703067; x=1730307867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYfJtlp/QhBe4rxr2UNwqjGS5HXn9ENDB3RWlELOULY=;
        b=Bqx1r0lOPH1brjaVFcsKvm2T3+WsGUE9o9rkNlabBZAc1nWGiDXYOI+DJ3GPijH3cM
         EzFHhhKhHtHPH1vVrvSkx+XAeY/XVdQrhm+SGkzCnFIWLd7Pwi4VBYSWF8WgTLDjALje
         kxcWJI9K04Fry6L5gnb/3asfg0CTQZWGwU+IW/rP3X58Ps7cix4A+W2tdLxju12cplrZ
         yfPbDBBowUhA2uG5cdd6oUqudDpZlm1skJgLTrXlds1HAaW7URR3UUKHkA8ffAPg+4mJ
         NVD2cMGgs8zTajjHUjTdSFyquxY7qPV0b8YCzdlCAlRP3xV3CvaC+1i0S8gffdPaYSRr
         oy+g==
X-Gm-Message-State: AOJu0Yx68/J/AL9e0tzZXrO6P00WBqV9Y47tsyOVB4X1s2SNN56ljoWC
	Uyf5Kn+osn4V+7nLk9beTMlPu1d4QvflMCam/Y5qNntu79HhCPrOCtSZcBkELXo=
X-Google-Smtp-Source: AGHT+IGuJS999R5j+JqPc+R5WucRoXUGv9whB88gh3cegtFWqASKRO40eJNQashsQTmFA1sFhcYy3A==
X-Received: by 2002:a2e:be84:0:b0:2fb:6243:321c with SMTP id 38308e7fff4ca-2fc9d361763mr19007821fa.13.1729703066843;
        Wed, 23 Oct 2024 10:04:26 -0700 (PDT)
Date: Wed, 23 Oct 2024 18:04:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/boot: Fix XSM module handling during PVH boot
Message-ID: <Zxksmm0xEv9nGYT7@macbook.local>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
 <20241023105756.641695-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023105756.641695-4-andrew.cooper3@citrix.com>

On Wed, Oct 23, 2024 at 11:57:56AM +0100, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> As detailed in commit 0fe607b2a144 ("x86/boot: Fix PVH boot during boot_info
> transition period"), the use of __va(mbi->mods_addr) constitutes a
> use-after-free on the PVH boot path.
> 
> This pattern has been in use since before PVH support was added.  This has
> most likely gone unnoticed because no-one's tried using a detached Flask
> policy in a PVH VM before.
> 
> Plumb the boot_info pointer down, replacing module_map and mbi.  Importantly,
> bi->mods[].mod is a safe way to access the module list during PVH boot.
> 
> As this is the final non-bi use of mbi in __start_xen(), make the pointer
> unusable once bi has been established, to prevent new uses creeping back in.
> This is a stopgap until mbi can be fully removed.
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
>  xen/arch/x86/setup.c  |  5 ++++-
>  xen/include/xsm/xsm.h | 12 +++++-------
>  xen/xsm/xsm_core.c    |  7 +++----
>  xen/xsm/xsm_policy.c  | 16 +++++++---------
>  4 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index c75b8f15fa5d..8974b0c6ede6 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1088,6 +1088,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      bi = multiboot_fill_boot_info(mbi, mod);
>      bi->module_map = module_map; /* Temporary */
>  
> +    /* Use bi-> instead */
> +#define mbi DO_NOT_USE
> +
>      /* Parse the command-line options. */
>      if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
>      {
> @@ -1862,7 +1865,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>                                    RANGESETF_prettyprint_hex);
>  
> -    xsm_multiboot_init(module_map, mbi);
> +    xsm_multiboot_init(bi);
>  
>      /*
>       * IOMMU-related ACPI table parsing may require some of the system domains
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 627c0d2731af..4dbff9d866e0 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -17,7 +17,6 @@
>  
>  #include <xen/alternative-call.h>
>  #include <xen/sched.h>
> -#include <xen/multiboot.h>
>  
>  /* policy magic number (defined by XSM_MAGIC) */
>  typedef uint32_t xsm_magic_t;
> @@ -778,11 +777,10 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
>  #endif /* XSM_NO_WRAPPERS */
>  
>  #ifdef CONFIG_MULTIBOOT
> -int xsm_multiboot_init(
> -    unsigned long *module_map, const multiboot_info_t *mbi);
> +struct boot_info;
> +int xsm_multiboot_init(struct boot_info *bi);

This one seems to also drop a const?

This also propagates to the functions below.

With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

