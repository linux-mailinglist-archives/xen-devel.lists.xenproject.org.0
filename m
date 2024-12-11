Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054C9ED2AD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855015.1268072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPuo-0003vz-Ae; Wed, 11 Dec 2024 16:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855015.1268072; Wed, 11 Dec 2024 16:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPuo-0003sq-7A; Wed, 11 Dec 2024 16:50:22 +0000
Received: by outflank-mailman (input) for mailman id 855015;
 Wed, 11 Dec 2024 16:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLPun-0003sk-99
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:50:21 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 017032c5-b7e0-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 17:50:19 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so9282905a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 08:50:19 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68dd43cefsm446467566b.50.2024.12.11.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:50:18 -0800 (PST)
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
X-Inumbo-ID: 017032c5-b7e0-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733935819; x=1734540619; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pLMiFfwhC8a0yqC/bDgoQoZXUS/bRDEPn5cFlllzpKA=;
        b=D2mFh1lPiVg8YlTDK/itWfe4VOVuw+UMHXWMRNu7HEbbL+JSwv5cyIcyY7YVap+BtX
         Ibjlgh8pXLvdRISn52GJlZMS/0FsYgtouIuGpFUGexIITNMl731vhxFdab01sl0IpEqi
         DJgtf5g02kGvm1q2yD4E+4Hr8Su/wrjI5R21s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733935819; x=1734540619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLMiFfwhC8a0yqC/bDgoQoZXUS/bRDEPn5cFlllzpKA=;
        b=icmAhnBZYbOc3eTPCgk1cQvMvulinPwFAvw424o77pPq9S/nGUYHWTYF/Ql0L/D/H2
         rZ7NbZHDVpMtph195bAc+ajb5LD8T6hPM79crrb/MnFhqiSX3kDcLUAE5VLB63ctrEwA
         IsFi+v0/wYie1KGtdTcGGGBMLSAtqsyy6WPVRim3H+MUTzzfOvFdQBsx0uVkBOeL1Dl7
         TyzBgi1fxxy0UbgyrvzGRANQzC6cPQG/FYqwSCBs7YF47O95Mq7LCaNy/57cAfuRl37g
         9JkhA9YrOIieykCA8C9qsw65BqTdrkpf3xWakOg8hRhkqlRSBXDhMXDPsOh33ZBFEYF9
         PcOw==
X-Gm-Message-State: AOJu0Yzn1M4Ts97Lekxui3D86jCdzBgu9EzdKLANdIGOVBM0LGNfGOnp
	pHToUNMsISCBy05pR9vjlM63LEx1nVmhqi3IY2e6DsqigZ+iSkW/PKuOXvmZK0w=
X-Gm-Gg: ASbGncsn7tVVKT8hQJIO3cveEk6ChiC1IJTD7sptDT3TkzebKbySlWHkfNRI6ExRdK0
	zH44RlzxRvW1pOXvGXI5l0Gvk1uS9i1ByNZ++4iUAwKyGbosY2w1/nDXW7ieB2Jj4AZQ79L1LDm
	rf3+ngln4TTlbfMPa1F0Ks5DcYUFDmJ2aGGNuzXbvVOIQEsy8hVGQAHs1HjtCsvYYN7tVKNIgPy
	jnClTMLFJ31ezkHDcDGE/C4W35GmljsRuWhSNFzpnRX+AiyU2Ss0ppowlzMHUs=
X-Google-Smtp-Source: AGHT+IFypkB8NucOPuGWCLdC7YWk1nBW+hgxfxNpOufkx5PB3hr0aSkHS8jTvDwIYT+toSTZ31p0Dg==
X-Received: by 2002:a17:906:31cc:b0:aa6:93c4:c68c with SMTP id a640c23a62f3a-aa6b13964d1mr380231366b.41.1733935819147;
        Wed, 11 Dec 2024 08:50:19 -0800 (PST)
Date: Wed, 11 Dec 2024 17:50:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/35] xen/domain: add get_initial_domain_id()
Message-ID: <Z1nCyXhCErGBCozN@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-10-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-10-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:40PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move get_initial_domain_id() to a public API and enable for all architectures.
> That is pre-requisite change for console focus switch logic cleanup.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/include/asm/pv/shim.h |  4 ++--
>  xen/arch/x86/pv/shim.c             |  4 ++--
>  xen/common/domain.c                | 10 ++++++++++
>  xen/include/xen/domain.h           |  2 ++
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
> index 6153e27005986881ad87e9db0b555b30edc59fc0..1515ad1b0680aa11ab91a152a1944fc1bb477a79 100644
> --- a/xen/arch/x86/include/asm/pv/shim.h
> +++ b/xen/arch/x86/include/asm/pv/shim.h
> @@ -31,7 +31,7 @@ long cf_check pv_shim_cpu_up(void *data);
>  long cf_check pv_shim_cpu_down(void *data);
>  void pv_shim_online_memory(unsigned int nr, unsigned int order);
>  void pv_shim_offline_memory(unsigned int nr, unsigned int order);
> -domid_t get_initial_domain_id(void);
> +domid_t pv_shim_initial_domain_id(void);
>  uint64_t pv_shim_mem(uint64_t avail);
>  void pv_shim_fixup_e820(void);
>  const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size);
> @@ -76,7 +76,7 @@ static inline void pv_shim_offline_memory(unsigned int nr, unsigned int order)
>  {
>      ASSERT_UNREACHABLE();
>  }
> -static inline domid_t get_initial_domain_id(void)
> +static inline domid_t pv_shim_initial_domain_id(void)
>  {
>      return 0;
>  }
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index 81e4a0516d18b359561f471f1d96e38977661ca7..17cb30620290c76cf42251f70cfa4199c0e165d1 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -328,7 +328,7 @@ int pv_shim_shutdown(uint8_t reason)
>      }
>  
>      /* Update domain id. */
> -    d->domain_id = get_initial_domain_id();
> +    d->domain_id = pv_shim_initial_domain_id();

Can't you leave this instance using get_initial_domain_id(), it should
DTRT when running in pv-shim mode.

>  
>      /* Clean the iomem range. */
>      BUG_ON(iomem_deny_access(d, 0, ~0UL));
> @@ -1016,7 +1016,7 @@ void pv_shim_offline_memory(unsigned int nr, unsigned int order)
>      }
>  }
>  
> -domid_t get_initial_domain_id(void)
> +domid_t pv_shim_initial_domain_id(void)
>  {
>      uint32_t eax, ebx, ecx, edx;
>  
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 92263a4fbdc57159b4a32d9d4ee038f9f37804ed..2f67aa06ed50e69c27cedc8d7f6eb0b469fe81cd 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -45,6 +45,7 @@
>  
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
> +#include <asm/pv/shim.h>
>  #endif
>  
>  /* Linux config option: propageted to domain0 */
> @@ -2229,6 +2230,15 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +domid_t get_initial_domain_id(void)
> +{
> +#ifdef CONFIG_X86
> +    return pv_shim_initial_domain_id();
> +#else
> +    return 0;
> +#endif
> +}

Maybe there are further changes that make this a not suitable option,
but won't it be better to maybe do something like:

#ifndef HAS_ARCH_INITIAL_DOMID
static inline domid_t get_initial_domain_id(void) { return 0; }
#else
domid_t get_initial_domain_id(void);
#endif

In a generic header, and then in an x86 header you just

#define HAS_ARCH_INITIAL_DOMID

The ifdefary in get_initial_domain_id() if other arches need different
implementations seems undesirable.

Thanks, Roger.

