Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695BA5E89E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911068.1317625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVkj-00012t-5c; Wed, 12 Mar 2025 23:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911068.1317625; Wed, 12 Mar 2025 23:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVkj-00010w-2p; Wed, 12 Mar 2025 23:44:45 +0000
Received: by outflank-mailman (input) for mailman id 911068;
 Wed, 12 Mar 2025 23:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVkh-00010q-13
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:44:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f742799e-ff9b-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:44:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0C8A45C4389;
 Wed, 12 Mar 2025 23:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17203C4CEDD;
 Wed, 12 Mar 2025 23:44:36 +0000 (UTC)
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
X-Inumbo-ID: f742799e-ff9b-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741823079;
	bh=Fzoai9hNhVa4E3SBOu5UK3XBi19c5TScm/jhwTK3riE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DgSbPWk7bOs2M+FubEa7dzrCGQsSMJFTzdpd3KJiu4Qo15YF57dgNYfXvwsR3eruW
	 UxnUJ1hmGOBMYHRHoVZbmURiKYgfLE/gJ4tlr9LBORPJEyO2vWRFkGYZSoaq0RhiGq
	 PfunB3UAAkgouDvrLR1o2qEjN6TttDsPxEEa828BgA0ppPa2xh7h2hBJUc7bwgxE/v
	 yfOV5ddLIE44cE9XzLCYPJoxhTfO2dQKdbs3vimV8r4XylFEBlkYAm7MjPnGGrBtGV
	 MIq6S3YMuX6aDM86QrhldmvT4C35dg0H6X+sadRk+lKSVRHhkmW01i0KEAulZ0E8wp
	 IWnJN3Cgs7tEg==
Date: Wed, 12 Mar 2025 16:44:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v1 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
In-Reply-To: <20250312040632.2853485-19-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121643380.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-19-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> Function arch_do_sysctl is to perform arch-specific sysctl op.
> Some functions, like psr_get_info for x86, DTB overlay support for arm,
> are solely available through sysctl op, then they all shall be wrapped
> with CONFIG_SYSCTL
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/arch/arm/Kconfig           |  2 +-
>  xen/arch/arm/Makefile          |  2 +-
>  xen/arch/arm/sysctl.c          |  2 --
>  xen/arch/riscv/stubs.c         |  2 +-
>  xen/arch/x86/Makefile          |  2 +-
>  xen/arch/x86/include/asm/psr.h |  2 ++
>  xen/arch/x86/psr.c             | 18 ++++++++++++++++++
>  xen/arch/x86/sysctl.c          |  2 --
>  xen/include/xen/hypercall.h    |  8 ++++++++
>  9 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a26d3e1182..001e65b336 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -140,7 +140,7 @@ config HAS_ITS
>          depends on GICV3 && !NEW_VGIC && !ARM_32
>  
>  config OVERLAY_DTB
> -	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED && SYSCTL
>  	help
>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>  
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index fb0948f067..5819c7e4d3 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -54,7 +54,7 @@ obj-y += smpboot.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  obj-y += time.o
>  obj-y += traps.o
>  obj-y += vcpreg.o
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 2d350b700a..32cab4feff 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,7 +15,6 @@
>  #include <asm/arm64/sve.h>
>  #include <public/sysctl.h>
>  
> -#ifdef CONFIG_SYSCTL

Why remove CONFIG_SYSCTL here?


>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>  }
> -#endif
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 0321ad57f0..28590efb65 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>  
>  /* sysctl.c */
>  
> +#ifdef CONFIG_SYSCTL
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
>      BUG_ON("unimplemented");
>  }
>  
> -#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index c763f80b0b..1949c4276e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  obj-y += platform_hypercall.o
>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  endif
>  
>  extra-y += asm-macros.i
> diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
> index d21a59d98f..e466da7428 100644
> --- a/xen/arch/x86/include/asm/psr.h
> +++ b/xen/arch/x86/include/asm/psr.h
> @@ -75,8 +75,10 @@ static inline bool psr_cmt_enabled(void)
>  int psr_alloc_rmid(struct domain *d);
>  void psr_free_rmid(struct domain *d);
>  
> +#ifdef CONFIG_SYSCTL
>  int psr_get_info(unsigned int socket, enum psr_type type,
>                   uint32_t data[], unsigned int array_len);
> +#endif
>  int psr_get_val(struct domain *d, unsigned int socket,
>                  uint32_t *val, enum psr_type type);
>  int psr_set_val(struct domain *d, unsigned int socket,
> diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
> index 5815a35335..34d5de8d2c 100644
> --- a/xen/arch/x86/psr.c
> +++ b/xen/arch/x86/psr.c
> @@ -133,9 +133,11 @@ static const struct feat_props {
>       */
>      enum psr_type alt_type;
>  
> +#ifdef CONFIG_SYSCTL
>      /* get_feat_info is used to return feature HW info through sysctl. */
>      bool (*get_feat_info)(const struct feat_node *feat,
>                            uint32_t data[], unsigned int array_len);
> +#endif
>  
>      /* write_msr is used to write out feature MSR register. */
>      void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
> @@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
>      return true;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static bool cf_check cat_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], unsigned int array_len)
>  {
> @@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  /* L3 CAT props */
>  static void cf_check l3_cat_write_msr(
> @@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_L3_CBM,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = cat_get_feat_info,
> +#endif
>      .write_msr = l3_cat_write_msr,
>      .sanitize = cat_check_cbm,
>  };
>  
> +#ifdef CONFIG_SYSCTL
>  /* L3 CDP props */
>  static bool cf_check l3_cdp_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], uint32_t array_len)
> @@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  static void cf_check l3_cdp_write_msr(
>      unsigned int cos, uint32_t val, enum psr_type type)
> @@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
>      .type[0] = PSR_TYPE_L3_DATA,
>      .type[1] = PSR_TYPE_L3_CODE,
>      .alt_type = PSR_TYPE_L3_CBM,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = l3_cdp_get_feat_info,
> +#endif
>      .write_msr = l3_cdp_write_msr,
>      .sanitize = cat_check_cbm,
>  };
> @@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_L2_CBM,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = cat_get_feat_info,
> +#endif
>      .write_msr = l2_cat_write_msr,
>      .sanitize = cat_check_cbm,
>  };
>  
> +#ifdef CONFIG_SYSCTL
>  /* MBA props */
>  static bool cf_check mba_get_feat_info(
>      const struct feat_node *feat, uint32_t data[], unsigned int array_len)
> @@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
>  
>      return true;
>  }
> +#endif
>  
>  static void cf_check mba_write_msr(
>      unsigned int cos, uint32_t val, enum psr_type type)
> @@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
>      .cos_num = 1,
>      .type[0] = PSR_TYPE_MBA_THRTL,
>      .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>      .get_feat_info = mba_get_feat_info,
> +#endif
>      .write_msr = mba_write_msr,
>      .sanitize = mba_sanitize_thrtl,
>  };
> @@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
>      return socket_info + socket;
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  int psr_get_info(unsigned int socket, enum psr_type type,
>                   uint32_t data[], unsigned int array_len)
>  {
> @@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
>  
>      return -EINVAL;
>  }
> +#endif /* CONFIG_SYSCTL */
>  
>  int psr_get_val(struct domain *d, unsigned int socket,
>                  uint32_t *val, enum psr_type type)
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index d7da476379..1b04947516 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -91,7 +91,6 @@ static long cf_check smt_up_down_helper(void *data)
>      return ret;
>  }
>  
> -#ifdef CONFIG_SYSCTL

and also here?


>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
> @@ -105,7 +104,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
>  }
> -#endif
>  
>  long arch_do_sysctl(
>      struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> index 15b6be6ec8..d0ea64b332 100644
> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -29,10 +29,18 @@ arch_do_domctl(
>      struct xen_domctl *domctl, struct domain *d,
>      XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  
> +#ifdef CONFIG_SYSCTL
>  extern long
>  arch_do_sysctl(
>      struct xen_sysctl *sysctl,
>      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
> +#else
> +static inline long arch_do_sysctl(struct xen_sysctl *sysctl,
> +                                  XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
>  
>  extern long
>  pci_physdev_op(
> -- 
> 2.34.1
> 

