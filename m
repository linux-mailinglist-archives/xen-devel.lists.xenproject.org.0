Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DF74BFCC
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jul 2023 00:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560778.876937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGLm-0006Cg-2v; Sat, 08 Jul 2023 22:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560778.876937; Sat, 08 Jul 2023 22:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIGLl-0006AK-W1; Sat, 08 Jul 2023 22:24:21 +0000
Received: by outflank-mailman (input) for mailman id 560778;
 Sat, 08 Jul 2023 22:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIGLl-0006AC-G6
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 22:24:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e703fbc-1dde-11ee-b237-6b7b168915f2;
 Sun, 09 Jul 2023 00:24:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0C926023F;
 Sat,  8 Jul 2023 22:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97977C433C8;
 Sat,  8 Jul 2023 22:24:16 +0000 (UTC)
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
X-Inumbo-ID: 2e703fbc-1dde-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688855058;
	bh=gve7EL/o01er41M/hJovg8UNy+5NeOpVbO08ligNgIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MHgOXUC/V3f3ubnd7KmVMYT1LLVISx5s6MHB1jQyOOjf4sZeBFnr2j37x/FQZ681x
	 zyo71irGMS2Im0LVLZALv6d60R/5V4Wzd8FubOZpQzf+hC4lU3Uoleuj+Fu5thsr6z
	 /+UOLcuQXoCbpOEmVAiwsBQRQc8yMPRFBejI5PppXB7tG7lMtTz9HbquUPMJpIkG1V
	 Pt/Zi2lCaZ1MiS9HKRSnMz2Tjw+GXnTqG47eJZGdW8xg3qtdZ3ky+fRlGZe2zzml75
	 2KgO0TnMRI4jTqc96TwDWpM52zEcd6wyFoEDhtqG23hzWzsiW95LihuH9exxDk8913
	 AANqlpBD/HU1w==
Date: Sat, 8 Jul 2023 15:24:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 07/10] x86 boot: define paddr_t and add macros for
 typedefing struct pointers
In-Reply-To: <20230701071835.41599-8-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081522410.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-8-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> Pointer fields within structs need to be defined as fixed size types in
> the x86 boot build environment. Using a typedef for the field type
> rather than a struct pointer type enables the type definition to
> be changed in the 32-bit boot build and the main hypervisor build,
> allowing for a single common structure definition and a common header file.

Sorry for my ignorance, but why?

struct boot_module is not used as part of any ABI, right? It is
populated by Xen at boot by hand. Why do we need a specific memory
layout for it?



> Introduces DEFINE_STRUCT_PTR_TYPE and DEFINE_PTR_TYPE which will
> generate typedefs with a _ptr_t suffix for pointers to the specified
> type. This is then used in <xen/bootinfo.h> for pointers within structs
> as preparation for using these headers in the x86 boot build.
> 
> The 32-bit behaviour is obtained by inclusion of "defs.h" first with a
> check for such an existing definition on the <xen/types.h> version.
> 
> paddr_t is used in <xen/bootinfo.h> so a definition is added here to
> the x86 boot environment defs.h header.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>


> ---
> Changes since v2: This is two v2 patches merged into one for v3.
> Changes since v1: New in v2 of series.
> 
>  xen/arch/x86/boot/defs.h            |  9 +++++++++
>  xen/arch/x86/include/asm/bootinfo.h |  4 +++-
>  xen/include/xen/bootinfo.h          |  9 +++++----
>  xen/include/xen/types.h             | 11 +++++++++++
>  4 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
> index f9840044ec..bc0f1b5cf8 100644
> --- a/xen/arch/x86/boot/defs.h
> +++ b/xen/arch/x86/boot/defs.h
> @@ -60,4 +60,13 @@ typedef u64 uint64_t;
>  #define U16_MAX		((u16)(~0U))
>  #define UINT_MAX	(~0U)
>  
> +typedef unsigned long long paddr_t;
> +
> +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
> +    typedef uint64_t struct_name ## _ptr_t;
> +
> +#define DEFINE_PTR_TYPE(type) \
> +    typedef uint64_t type ## _ptr_t;
> +DEFINE_PTR_TYPE(char);
> +
>  #endif /* __BOOT_DEFS_H__ */
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 30c27980e0..989fb7a1da 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -6,6 +6,7 @@ struct arch_bootmodule {
>      uint32_t flags;
>      unsigned headroom;
>  };
> +DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
>  
>  struct arch_boot_info {
>      uint32_t flags;
> @@ -14,11 +15,12 @@ struct arch_boot_info {
>  #define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
>  #define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
>  
> -    char *boot_loader_name;
> +    char_ptr_t boot_loader_name;
>  
>      uint32_t mmap_length;
>      paddr_t mmap_addr;
>  };
> +DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
>  
>  struct __packed mb_memmap {
>      uint32_t size;
> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> index 2f4284a91f..8389da4f72 100644
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -35,17 +35,18 @@ struct boot_module {
>      mfn_t mfn;
>      size_t size;
>  
> -    struct arch_bootmodule *arch;
> +    arch_bootmodule_ptr_t arch;
>      struct boot_string string;
>  };
> +DEFINE_STRUCT_PTR_TYPE(boot_module);
>  
>  struct boot_info {
> -    char *cmdline;
> +    char_ptr_t cmdline;
>  
>      unsigned int nr_mods;
> -    struct boot_module *mods;
> +    boot_module_ptr_t mods;
>  
> -    struct arch_boot_info *arch;
> +    arch_boot_info_ptr_t arch;
>  };
>  
>  #endif
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 6aba80500a..e807ffe255 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -71,4 +71,15 @@ typedef bool bool_t;
>  #define test_and_set_bool(b)   xchg(&(b), true)
>  #define test_and_clear_bool(b) xchg(&(b), false)
>  
> +#ifndef DEFINE_STRUCT_PTR_TYPE
> +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
> +    typedef struct struct_name * struct_name ## _ptr_t;
> +#endif
> +
> +#ifndef DEFINE_PTR_TYPE
> +#define DEFINE_PTR_TYPE(type) \
> +    typedef type * type ## _ptr_t;
> +DEFINE_PTR_TYPE(char);
> +#endif
> +
>  #endif /* __TYPES_H__ */
> -- 
> 2.25.1
> 
> 

