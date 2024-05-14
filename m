Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B488C4E9A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721307.1124635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oKi-0003pI-W1; Tue, 14 May 2024 09:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721307.1124635; Tue, 14 May 2024 09:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oKi-0003mP-TH; Tue, 14 May 2024 09:20:28 +0000
Received: by outflank-mailman (input) for mailman id 721307;
 Tue, 14 May 2024 09:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6oKh-0003mI-GR
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:20:27 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320a25e0-11d3-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:20:25 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-61bed5ce32fso57407657b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:20:25 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54d6afasm66365541cf.24.2024.05.14.02.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:20:23 -0700 (PDT)
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
X-Inumbo-ID: 320a25e0-11d3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715678424; x=1716283224; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzF0v9ZrsRWn8EzKCq+LtNfaFlXPhw3/JvfSXyguUS8=;
        b=sL2dOOcLEE8Fq40yfQpb+Zp7D66unNpluSXpcjMxin1utUrptTB0HcdJBcaWm1RW/o
         KCAM2vuuC6+gQAX/48n2TpuTz0bgERNnYzOSP8fCOk/bwKSiyiPs7YpBQstBloMJ+YNZ
         vlCymnnvGkcUH9WVXrZd3654lCNRaudHvG2XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715678424; x=1716283224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzF0v9ZrsRWn8EzKCq+LtNfaFlXPhw3/JvfSXyguUS8=;
        b=XqCGf/W3Awk1zi3k7f1c5RUPlUsE29qdBycaZ9GCX0zUXB/c+z4Xjo/9Z+/lzde9ID
         J3s6c3KNq0qdx4x0T0i4z9qSDaEb1E7DF95A7QBixO8Avsz4nORyBI93KHzZDs5+mQ72
         bZqjzg5OEWW95pYwhQqzOz926Da9zaKHiLOmY+Pe7cQVrhu+eElBdbvB3yoWz9JZIFUN
         NM/IEEAaFrNos7gEZFT9AyxIRLHpQ/WenOdKlDNlyVlb+bHMdTzjNzn6gF5l8L8Aggbd
         N5A61ngyaEyWSaU5non8/zp87MwwIKDxKQkNkqNs7mEh3OiKegdGtfE2CLdDHlEcDnpf
         RtiA==
X-Gm-Message-State: AOJu0YybnhrM5N237fDKDpd8VNauFHkyVSHBJ5h3oGsK+kkDiWusmy+x
	95bp5a8tHhROWXQm69G+H9h1j4hYgbe6v1b10wQ4jEFzW5Ku+2n6LCjz6HMO0dY=
X-Google-Smtp-Source: AGHT+IHg6YYOkkD6bd6AcpKdnJjLtOfz/i55XfXIHfBdLkoAJ4MpkIXZLFva4SVVZ3KDuYbZDuj8eQ==
X-Received: by 2002:a81:a0cd:0:b0:61b:33f6:9bbb with SMTP id 00721157ae682-622affdf582mr117239747b3.28.1715678423737;
        Tue, 14 May 2024 02:20:23 -0700 (PDT)
Date: Tue, 14 May 2024 11:20:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Message-ID: <ZkMs1cknBFBWZoJG@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-7-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:33PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also add a helper function to retrieve it. Change arch_mfns_in_direct_map
> to check this option before returning.
> 
> This is added as a Kconfig option as well as a boot command line option.
> While being generic, the Kconfig option is only usable for x86 at the moment.
> 
> Note that there remains some users of the directmap at this point. The option
> is introduced now as it will be needed in follow-up patches.

It's hard for me to evaluate whether the option name and the help text
is correct, because the implementation is not yet complete.  It would
be best if this was introduced after the implementation has gone in,
so that the reviewer can evaluate that the text matches the
implementation.  Now it's mostly a promise of what's yet to be
implemented.

> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     Changes in V2:
>         * Introduce a Kconfig option
>         * Reword the commit message
>         * Make opt_directmap and helper generic
> 
>     Changes since Hongyan's version:
>         * Reword the commit message
>         * opt_directmap is only modified during boot so mark it as
>           __ro_after_init
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index e760f3266e..743d343ffa 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
>  hardware guarantees (with, where available and known to Xen, respective
>  tweaks applied).
>  
> +### directmap (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Enable or disable the directmap region in Xen.

Enable or disable fully populating the directmap region in Xen.

> +
> +By default, Xen creates the directmap region which maps physical memory
                                                          ^ all?
> +in that region. Setting this to no will sparsely populate the directmap,

"Setting this to no" => "Disabling this option will sparsely..."

> +blocking exploits that leak secrets via speculative memory access in the
> +directmap.
> +
>  ### dma_bits
>  > `= <integer>`
>  
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 7e03e4bc55..b4ec0e582e 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -28,6 +28,7 @@ config X86
>  	select HAS_PCI_MSI
>  	select HAS_PIRQ
>  	select HAS_SCHED_GRANULARITY
> +	select HAS_SECRET_HIDING
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 98b66edaca..54d835f156 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -622,11 +622,17 @@ void write_32bit_pse_identmap(uint32_t *l2);
>  /*
>   * x86 maps part of physical memory via the directmap region.
>   * Return whether the range of MFN falls in the directmap region.
> + *
> + * When boot command line sets directmap=no, the directmap will mostly be empty
> + * so this will always return false.
>   */
>  static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
>      unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>  
> +    if ( !has_directmap() )
> +        return false;
> +
>      return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>  }
>  
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f84e1cd79c..bd6b1184f5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1517,6 +1517,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      if ( highmem_start )
>          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
>  
> +    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");

IMO this wants to be printed as part of the speculation mitigations, see
print_details() in spec_ctrl.c

> +
>      /*
>       * Walk every RAM region and map it in its entirety (on x86/64, at least)
>       * and notify it to the boot allocator.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 565ceda741..856604068c 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -80,12 +80,29 @@ config HAS_PMAP
>  config HAS_SCHED_GRANULARITY
>  	bool
>  
> +config HAS_SECRET_HIDING
> +	bool
> +
>  config HAS_UBSAN
>  	bool
>  
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> +config SECRET_HIDING
> +    bool "Secret hiding"
> +    depends on HAS_SECRET_HIDING

IMO 'SECRET_HIDING' is too generic, this wants a more specific name.
Maybe SPARCE_DIRECTMAP or some such.

> +    help
> +		The directmap contains mapping for most of the RAM which makes domain
> +		memory easily accessible. While making the performance better, it also makes
> +		the hypervisor more vulnerable to speculation attacks.
> +
> +		Enabling this feature will allow the user to decide whether the memory
> +		is always mapped at boot or mapped only on demand (see the command line
> +		option "directmap").
> +
> +		If unsure, say N.
> +
>  config MEM_ACCESS
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 7c1bdfc046..9b7e4721cd 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -174,6 +174,11 @@ paddr_t __ro_after_init mem_hotplug;
>  static char __initdata opt_badpage[100] = "";
>  string_param("badpage", opt_badpage);
>  
> +bool __ro_after_init opt_directmap = true;
> +#ifdef CONFIG_HAS_SECRET_HIDING
> +boolean_param("directmap", opt_directmap);
> +#endif
> +
>  /*
>   * no-bootscrub -> Free pages are not zeroed during boot.
>   */
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 7561297a75..9d4f1f2d0d 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -167,6 +167,13 @@ extern unsigned long max_page;
>  extern unsigned long total_pages;
>  extern paddr_t mem_hotplug;
>  
> +extern bool opt_directmap;
> +
> +static inline bool has_directmap(void)
> +{
> +    return opt_directmap;

This likely wants:

return IS_ENABLED(CONFIG_HAS_SECRET_HIDING) && opt_directmap;

So that when HAS_SECRET_HIDING is build time disabled the compiler can
likely eliminate the code.

Thanks, Roger.

