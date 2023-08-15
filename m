Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94C77D67F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 01:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584141.914590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW34A-0000L5-DV; Tue, 15 Aug 2023 23:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584141.914590; Tue, 15 Aug 2023 23:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW34A-0000JM-9w; Tue, 15 Aug 2023 23:03:10 +0000
Received: by outflank-mailman (input) for mailman id 584141;
 Tue, 15 Aug 2023 23:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/irL=EA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qW349-0000JE-3o
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 23:03:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f1ec9e-3bbf-11ee-8776-cb3800f73035;
 Wed, 16 Aug 2023 01:03:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A536663B84;
 Tue, 15 Aug 2023 23:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4BEC433C7;
 Tue, 15 Aug 2023 23:03:03 +0000 (UTC)
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
X-Inumbo-ID: e4f1ec9e-3bbf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692140585;
	bh=kbr0ixalSJ0oezzINnR/KcWpxxzNnj5a7iZHvu7zlWs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A6U0szv9JDCe0LvhVHiNZGXHiwsOkFc37LYrjl7G/2iGFhdJE1BJ0tjewK7P4uXkB
	 gmAV6V1yUkY4xNuf1uw0kfMupmb7waZfNjEHmT0p6R/olHOQ1M0riFoGdG/Ghr1D/m
	 9QzZubVFDsn8UuRPFATQuFu9ocugzULxUfAyzbYmyjs7fu2MD/5hZWZLQPSzn++Cpj
	 73OCcrHP+pzo3xBz9wwF+K1PFOt8+6H75dDF6FwZBuMDiwLrRjRd/QT8jjECJDbfFG
	 ur2g7H07bK9jQNUtvCuIPfrk2gHOHmnddtMpCGjzEm0bj27A/9Z/YobyEkaBhPvhhB
	 VllcOo6ar6Y8w==
Date: Tue, 15 Aug 2023 16:03:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3 01/10] xen/version: Calculate xen_capabilities_info
 once at boot
In-Reply-To: <20230815210650.2735671-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308151602500.6458@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1301399219-1692140585=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1301399219-1692140585=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 15 Aug 2023, Andrew Cooper wrote:
> The arch_get_xen_caps() infrastructure is horribly inefficient for something
> that is constant after features have been resolved on boot.
> 
> Every instance used snprintf() to format constants into a string (which gets
> shorter when %d gets resolved!), and which get double buffered on the stack.
> 
> Switch to using string literals with the "3.0" inserted - these numbers
> haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).
> 
> Use initcalls to format the data into xen_cap_info, which is deliberately not
> of type xen_capabilities_info_t because a 1k array is a silly overhead for
> storing a maximum of 77 chars (the x86 version) and isn't liable to need any
> more space in the forseeable future.
> 
> This speeds up the the XENVER_capabilities hypercall, but the purpose of the
> change is to allow us to introduce a better XENVER_* API that doesn't force
> the use of a 1k buffer on the stack.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> v3:
>  * CC new-arch folks so they're aware
> v2:
>  * New
> 
> Moving to __initcall() also allows new architectures to not implement this
> API, and I'm going to recommend strongly that they dont.  Its a very dubious
> way of signalling about 3 bits of info to the toolstack, and inefficient to
> use (the toolstack has to do string parsing on the result figure out if
> PV64/PV32/HVM is available).
> ---
>  xen/arch/arm/setup.c        | 20 +++++++-------------
>  xen/arch/x86/setup.c        | 31 ++++++++++---------------------
>  xen/common/kernel.c         |  3 ++-
>  xen/include/xen/hypercall.h |  2 --
>  xen/include/xen/version.h   |  2 ++
>  5 files changed, 21 insertions(+), 37 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 44ccea03ca14..3592c9ebc1cd 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -27,6 +27,7 @@
>  #include <xen/cpu.h>
>  #include <xen/pfn.h>
>  #include <xen/virtual_region.h>
> +#include <xen/version.h>
>  #include <xen/vmap.h>
>  #include <xen/trace.h>
>  #include <xen/libfdt/libfdt-xen.h>
> @@ -1286,24 +1287,17 @@ void __init start_xen(unsigned long boot_phys_offset,
>      switch_stack_and_jump(idle_vcpu[0]->arch.cpu_info, init_done);
>  }
>  
> -void arch_get_xen_caps(xen_capabilities_info_t *info)
> +static int __init init_xen_cap_info(void)
>  {
> -    /* Interface name is always xen-3.0-* for Xen-3.x. */
> -    int major = 3, minor = 0;
> -    char s[32];
> -
> -    (*info)[0] = '\0';
> -
>  #ifdef CONFIG_ARM_64
> -    snprintf(s, sizeof(s), "xen-%d.%d-aarch64 ", major, minor);
> -    safe_strcat(*info, s);
> +    safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
>  #endif
>      if ( cpu_has_aarch32 )
> -    {
> -        snprintf(s, sizeof(s), "xen-%d.%d-armv7l ", major, minor);
> -        safe_strcat(*info, s);
> -    }
> +        safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
> +
> +    return 0;
>  }
> +__initcall(init_xen_cap_info);
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 2bfc1fd00f8c..206f0c50a136 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2049,35 +2049,24 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      unreachable();
>  }
>  
> -void arch_get_xen_caps(xen_capabilities_info_t *info)
> +static int __init cf_check init_xen_cap_info(void)
>  {
> -    /* Interface name is always xen-3.0-* for Xen-3.x. */
> -    int major = 3, minor = 0;
> -    char s[32];
> -
> -    (*info)[0] = '\0';
> -
>      if ( IS_ENABLED(CONFIG_PV) )
>      {
> -        snprintf(s, sizeof(s), "xen-%d.%d-x86_64 ", major, minor);
> -        safe_strcat(*info, s);
> +        safe_strcat(xen_cap_info, "xen-3.0-x86_64 ");
>  
>          if ( opt_pv32 )
> -        {
> -            snprintf(s, sizeof(s), "xen-%d.%d-x86_32p ", major, minor);
> -            safe_strcat(*info, s);
> -        }
> +            safe_strcat(xen_cap_info, "xen-3.0-x86_32p ");
>      }
>      if ( hvm_enabled )
> -    {
> -        snprintf(s, sizeof(s), "hvm-%d.%d-x86_32 ", major, minor);
> -        safe_strcat(*info, s);
> -        snprintf(s, sizeof(s), "hvm-%d.%d-x86_32p ", major, minor);
> -        safe_strcat(*info, s);
> -        snprintf(s, sizeof(s), "hvm-%d.%d-x86_64 ", major, minor);
> -        safe_strcat(*info, s);
> -    }
> +        safe_strcat(xen_cap_info,
> +                    "hvm-3.0-x86_32 "
> +                    "hvm-3.0-x86_32p "
> +                    "hvm-3.0-x86_64 ");
> +
> +    return 0;
>  }
> +__initcall(init_xen_cap_info);
>  
>  int __hwdom_init xen_in_range(unsigned long mfn)
>  {
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 52aa28762782..f822480a8ef3 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -30,6 +30,7 @@ enum system_state system_state = SYS_STATE_early_boot;
>  
>  static xen_commandline_t saved_cmdline;
>  static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
> +char __ro_after_init xen_cap_info[128];
>  
>  static int assign_integer_param(const struct kernel_param *param, uint64_t val)
>  {
> @@ -537,7 +538,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          memset(info, 0, sizeof(info));
>          if ( !deny )
> -            arch_get_xen_caps(&info);
> +            safe_strcpy(info, xen_cap_info);
>  
>          if ( copy_to_guest(arg, info, ARRAY_SIZE(info)) )
>              return -EFAULT;
> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> index f307dfb59760..15b6be6ec818 100644
> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -56,6 +56,4 @@ common_vcpu_op(int cmd,
>      struct vcpu *v,
>      XEN_GUEST_HANDLE_PARAM(void) arg);
>  
> -void arch_get_xen_caps(xen_capabilities_info_t *info);
> -
>  #endif /* __XEN_HYPERCALL_H__ */
> diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
> index 93c58773630c..4856ad1b446d 100644
> --- a/xen/include/xen/version.h
> +++ b/xen/include/xen/version.h
> @@ -19,6 +19,8 @@ const char *xen_deny(void);
>  const char *xen_build_info(void);
>  int xen_build_id(const void **p, unsigned int *len);
>  
> +extern char xen_cap_info[128];
> +
>  #ifdef BUILD_ID
>  void xen_build_init(void);
>  int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
> -- 
> 2.30.2
> 
--8323329-1301399219-1692140585=:6458--

