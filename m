Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC98C4EA3
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721323.1124655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ody-0001XA-PV; Tue, 14 May 2024 09:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721323.1124655; Tue, 14 May 2024 09:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ody-0001Tx-M5; Tue, 14 May 2024 09:40:22 +0000
Received: by outflank-mailman (input) for mailman id 721323;
 Tue, 14 May 2024 09:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6odx-0001SY-4i
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:40:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f98bdeae-11d5-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:40:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34e667905d2so3615570f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:40:19 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbca98sm13211119f8f.112.2024.05.14.02.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:40:17 -0700 (PDT)
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
X-Inumbo-ID: f98bdeae-11d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715679618; x=1716284418; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz6ZgprpL01AnBFkJIjoqqgc4nrYCjjDmKPGTX+S+lQ=;
        b=N9XTBSvMCqsn/DfwTeE2lr11aJciGpmwaA/kfpPRjJWb6/2wAMXMETBYiBDguITiDq
         w88J8L92uUPfGbvqLIN2W4ihWS2jm4YHIPKHCVutRTyUtgx+PHkbgb8zWwhzOcbEnhSO
         aMfhJAOFGelgNOMimxT416EhaD7hMeBlZ/xHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679618; x=1716284418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz6ZgprpL01AnBFkJIjoqqgc4nrYCjjDmKPGTX+S+lQ=;
        b=a6mV+MBrXHnsL3C6QnoZ8wqLcVqwLJ0WKvJ/ajGuZZJywH+mrvNUkP7llkW6fXVn6s
         5pZtfxj1bONVErHMP2x9BGvQi7XaSEwxcBe3+lk+N+1hCuGxXXxIgVA2OX/87XJXxL+H
         Q6NVn4b05T+yCdm469VUGkMSp1tYeredzbw+UvG0JR5FPxLihp3sPFPc+zGJGLac1sRi
         yDmZxRedJKMzmwQpBxGydvp0/81oJi+dWJ17uC/PqyxLfnZ+RHSnQlBqWMqA6t9EL3rD
         hxXiWT/zYDuv2T48MeJZJF40MRzaJi+TfdF2Xpr7E4jRiZqlTuc/Epdh+l3WM1nxfkPk
         KHzg==
X-Gm-Message-State: AOJu0Yw+RLtioREzyTgJVXoa1wI9A7slZZVsSGP0ysUcsbMIt4MrDQ/u
	le27f+ufxUuOU5rpi+H/NIp+wrXLD16fZZ4Ahe/KJKHgkzvw9Pare1hZ8XYGwTz4xAbDdXQ0IWk
	h
X-Google-Smtp-Source: AGHT+IEuiPUSp88xCtbS36VqFmmn68MDC6tZUSihDB11SAq8lyr5gf+8Orle4O65EowrznHhi4SzNA==
X-Received: by 2002:adf:fe04:0:b0:34f:f540:bdc9 with SMTP id ffacd0b85a97d-3504a63300amr7932140f8f.9.1715679617892;
        Tue, 14 May 2024 02:40:17 -0700 (PDT)
Date: Tue, 14 May 2024 11:40:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Message-ID: <ZkMxgDPYgaKnmRRE@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-8-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> PMAP will be used in a follow-up patch to bootstrap map domain
> page infrastructure -- we need some way to map pages to setup the
> mapcache without a direct map.
> 
> The functions pmap_{map, unmap} open code {set, clear}_fixmap to break
> the loop.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     The PMAP infrastructure was upstream separately for Arm since
>     Hongyan sent the secret-free hypervisor series. So this is a new
>     patch to plumb the feature on x86.
> 
>     Changes in v2:
>         * Declare PMAP entries earlier in fixed_addresses
>         * Reword the commit message
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index b4ec0e582e..56feb0c564 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -27,6 +27,7 @@ config X86
>  	select HAS_PCI
>  	select HAS_PCI_MSI
>  	select HAS_PIRQ
> +	select HAS_PMAP

Shouldn't it be selected by HAS_SECRET_HIDING rather than being
unconditionally selected?

>  	select HAS_SCHED_GRANULARITY
>  	select HAS_SECRET_HIDING
>  	select HAS_UBSAN
> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
> index 516ec3fa6c..a7ac365fc6 100644
> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -21,6 +21,8 @@
>  
>  #include <xen/acpi.h>
>  #include <xen/pfn.h>
> +#include <xen/pmap.h>
> +
>  #include <asm/apicdef.h>
>  #include <asm/msi.h>
>  #include <acpi/apei.h>
> @@ -53,6 +55,8 @@ enum fixed_addresses {
>      FIX_PV_CONSOLE,
>      FIX_XEN_SHARED_INFO,
>  #endif /* CONFIG_XEN_GUEST */
> +    FIX_PMAP_BEGIN,
> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,

This would better have

#ifdef CONFIG_HAS_PMAP

guards?

>      /* Everything else should go further down. */
>      FIX_APIC_BASE,
>      FIX_IO_APIC_BASE_0,
> diff --git a/xen/arch/x86/include/asm/pmap.h b/xen/arch/x86/include/asm/pmap.h
> new file mode 100644
> index 0000000000..62746e191d
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/pmap.h
> @@ -0,0 +1,25 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <asm/fixmap.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
> +
> +    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
> +
> +    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
> +
> +    l1e_write_atomic(pl1e, l1e_empty());
> +    flush_tlb_one_local(linear);
> +}
> +
> +#endif /* __ASM_PMAP_H__ */

We usually add a:

/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */

Footer.  No strict requirement, but it's nice so that your editor
already picks the correct defaults for tabs &c.

Thanks, Roger.

