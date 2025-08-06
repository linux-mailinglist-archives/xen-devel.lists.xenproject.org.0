Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93CB1C894
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 17:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071936.1435276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfx2-0002Ps-1e; Wed, 06 Aug 2025 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071936.1435276; Wed, 06 Aug 2025 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfx1-0002OG-V7; Wed, 06 Aug 2025 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 1071936;
 Wed, 06 Aug 2025 15:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujfx0-0002OA-D8
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 15:21:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9dbab6b-72d8-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 17:21:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso219615e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 08:21:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e586a011sm58055005e9.19.2025.08.06.08.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 08:21:07 -0700 (PDT)
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
X-Inumbo-ID: f9dbab6b-72d8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754493667; x=1755098467; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFkt3LZ1PZeSOrFz8Ehh/G8gRUbh1lOJkQZ/mc4FHNI=;
        b=Ix25wE2lFTtDud/ZHhKt+64ja7IZj3bc5S9CCgPn9yYicnugXLBD9GKXgzOlPmZDhF
         PlqeDuZceY7VY0FItz8LP0JtIKWAtzVaqyc/ClqXNBV3UV/yMWvpV4MZ/F/5glQLKUxk
         vvEsy830coe48FcO6K3CLq+qmtClhvfKm9thg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493667; x=1755098467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFkt3LZ1PZeSOrFz8Ehh/G8gRUbh1lOJkQZ/mc4FHNI=;
        b=bDlltsEk5AKbfgO1BE2bsrnN947B1zKR5hwdSrJSDRSpOvTsk8EGddkWxdveAElSAD
         /aRKWbStUNycsWoZ8k0le3V6KbXpzeLLtIQZ9+HP2xWUzEWln5wcFqALJXlSWF+iVTrO
         0V3i76OzVQV+HVZqBrOsdjoFlTyGI95b34HEHGa9i23YHIf3rV1B37Af+arifKNUqosT
         jGpWkvCIb8/oMVXEUShjDw0C465jKXkvW9q3dNRrBpii+YbS6r4fJG2LJkaQLMzmrBiy
         wfzXSWl8zZGGy4yiBGJN6so9hpMdvZSyCVb3PXwscdli5VMQxCAtU8dgotcRAk6gpiMu
         RM3Q==
X-Gm-Message-State: AOJu0Yy6Vco+LS/ey6r3+xxg2be3m7+X0kYFLLzkfL/hRilmS29Axd1S
	sRmR+S4EwbuS3TLqEHBjuJsx/bMku+mBsf/0/9ytWge5M1+yPXxNeZIn57DepYJZzVo=
X-Gm-Gg: ASbGnctlLeCISQV5lR2QD/QILC0SedR7hZobUpuK+//mYvRWbNMz4kjaQ4SUIQ7KZ+R
	q1hsYGHzGw1d7qmi0JQbmq1wsDmSKXTBYfGTKi5Sj77+jN+H+qNPPtEOCeUqn578PWrFv1orm43
	3N9iaNgonL//tiqhAZjPl7Wr8NGMxBFRNdiVTOcBkfXWd43Qf8dE2c8msAkM20UOFDdpf+c5iKl
	cYDSodX4tmNT7OfUYBCWWCIZKnXktaSvXSD3Zuc4SS+YW2wkyFUBdDJ8vB2DuO5XU0QofRiJtVP
	KxRqMeQkG9n68CGqxp6Ld4tObeGhHvVmA3Qp6OlQUpRn+u+Ee2R47i8M7aJ5By26yVzGydFwWDc
	rY8lpEHqmSuY4Jvkm3L1nHqn4uLXRMwO3D+teBCC3l0do60803OOzofIgVOwfGWe6FWcxEutYlO
	A5
X-Google-Smtp-Source: AGHT+IFTSQU/2FyKTR1t/4aeMl2yGmvuQyIPZuYJ5l++MfwfTNmtxFa+9s4MtMiRJ3y0EPLv9ELx9Q==
X-Received: by 2002:a05:600c:1c88:b0:459:94a7:220f with SMTP id 5b1f17b1804b1-459ec7b9738mr4997615e9.26.1754493667373;
        Wed, 06 Aug 2025 08:21:07 -0700 (PDT)
Date: Wed, 6 Aug 2025 17:21:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
Message-ID: <aJNy4iP4t2c9xQ6_@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250731192130.3948419-7-dmukhin@ford.com>

On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Enable UART emulator to be individually configured per HVM-domain.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - new patch
> ---
>  docs/man/xl.cfg.5.pod.in             |  9 ++++--
>  tools/golang/xenlight/helpers.gen.go |  4 +--
>  tools/golang/xenlight/types.gen.go   |  3 +-
>  tools/libs/light/libxl_arm.c         | 26 ++++++++++++-----
>  tools/libs/light/libxl_create.c      |  2 +-
>  tools/libs/light/libxl_types.idl     |  3 +-
>  tools/libs/light/libxl_x86.c         | 42 ++++++++++++++++++++++++++++
>  tools/ocaml/libs/xc/xenctrl.ml       |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli      |  1 +
>  tools/xl/xl_parse.c                  |  2 +-
>  xen/arch/x86/domain.c                |  5 ++--
>  11 files changed, 80 insertions(+), 18 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 5362fb0e9a6f..e1d012274eaf 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3032,14 +3032,17 @@ the domain was created.
>  This requires hardware compatibility with the requested version, either
>  natively or via hardware backwards compatibility support.
>  
> -=item B<vuart="uart">
> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
>  
>  To enable vuart console, user must specify the following option in the
> -VM config file:
> +VM config file, e.g:
>  
> +```
>  vuart = "sbsa_uart"
> +```
>  
> -Currently, only the "sbsa_uart" model is supported for ARM.
> +Currently, "sbsa_uart" (ARM) and "ns16550" (x86) are the only supported
> +UART models.
>  
>  =back
>  
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index b43aad7d0064..e56af8a8a8c5 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1160,7 +1160,6 @@ x.TypeUnion = &typePvh
>  default:
>  return fmt.Errorf("invalid union key '%v'", x.Type)}
>  x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
> -x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
>  x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
>  x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
>  if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
> @@ -1169,6 +1168,7 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  x.Altp2M = Altp2MMode(xc.altp2m)
>  x.Altp2MCount = uint32(xc.altp2m_count)
>  x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
> +x.Vuart = VuartType(xc.vuart)
>  if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
>  return fmt.Errorf("converting field Vpmu: %v", err)
>  }
> @@ -1695,7 +1695,6 @@ break
>  default:
>  return fmt.Errorf("invalid union key '%v'", x.Type)}
>  xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
> -xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
>  xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
>  xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
>  if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
> @@ -1704,6 +1703,7 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>  xc.altp2m_count = C.uint32_t(x.Altp2MCount)
>  xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
> +xc.vuart = C.libxl_vuart_type(x.Vuart)
>  if err := x.Vpmu.toC(&xc.vpmu); err != nil {
>  return fmt.Errorf("converting field Vpmu: %v", err)
>  }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 4777f528b52c..2f4153d2510b 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -253,6 +253,7 @@ type VuartType int
>  const(
>  VuartTypeUnknown VuartType = 0
>  VuartTypeSbsaUart VuartType = 1
> +VuartTypeNs16550 VuartType = 2
>  )
>  
>  type VkbBackend int
> @@ -596,7 +597,6 @@ Type DomainType
>  TypeUnion DomainBuildInfoTypeUnion
>  ArchArm struct {
>  GicVersion GicVersion
> -Vuart VuartType
>  SveVl SveType
>  NrSpis uint32
>  }
> @@ -608,6 +608,7 @@ Altp2MCount uint32
>  VmtraceBufKb int
>  Vpmu Defbool
>  TrapUnmappedAccesses Defbool
> +Vuart VuartType
>  }
>  
>  type DomainBuildInfoTypeUnion interface {
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4a19a8d22bdf..f4721b24763c 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -92,14 +92,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
>      int rc;
>  
> -    /*
> -     * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> -     * of SPI VIRQ for pl011.
> -     */
> -    if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
> +    switch ( d_config->b_info.vuart )
> +    {
> +    case LIBXL_VUART_TYPE_SBSA_UART:
> +        /*
> +         * If pl011 vuart is enabled then increment the nr_spis to allow
> +         * allocation of SPI VIRQ for pl011.
> +         */
>          nr_spis += (GUEST_VPL011_SPI - 32) + 1;
>          vuart_irq = GUEST_VPL011_SPI;
>          vuart_enabled = true;
> +        break;
> +
> +    case LIBXL_VUART_TYPE_NS16550:
> +        LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuart);
> +        abort();
> +        break;
> +
> +    case LIBXL_VUART_TYPE_UNKNOWN:
> +    default:
> +        break;
>      }
>  
>      for (i = 0; i < d_config->num_disks; i++) {
> @@ -1372,7 +1384,7 @@ next_resize:
>          FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
>          FDT( make_hypervisor_node(gc, fdt, vers) );
>  
> -        if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
> +        if (info->vuart == LIBXL_VUART_TYPE_SBSA_UART)
>              FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
>  
>          if (info->tee == LIBXL_TEE_TYPE_OPTEE)
> @@ -1725,7 +1737,7 @@ int libxl__arch_build_dom_finish(libxl__gc *gc,
>  {
>      int rc = 0, ret;
>  
> -    if (info->arch_arm.vuart != LIBXL_VUART_TYPE_SBSA_UART) {
> +    if (info->vuart != LIBXL_VUART_TYPE_SBSA_UART) {
>          rc = 0;
>          goto out;
>      }
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 4042ae1a8957..cfd7e827867a 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1815,7 +1815,7 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>                                &d_config->vfbs[i]);
>          }
>  
> -        if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
> +        if (d_config->b_info.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
>              init_console_info(gc, &vuart, 0);
>              vuart.backend_domid = state->console_domid;
>              libxl__device_vuart_add(gc, domid, &vuart, state);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index fe251649f346..fd60c2b26764 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -276,6 +276,7 @@ libxl_checkpointed_stream = Enumeration("checkpointed_stream", [
>  libxl_vuart_type = Enumeration("vuart_type", [
>      (0, "unknown"),
>      (1, "sbsa_uart"),
> +    (2, "ns16550"),
>      ])
>  
>  libxl_vkb_backend = Enumeration("vkb_backend", [
> @@ -722,7 +723,6 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>  
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> -                               ("vuart", libxl_vuart_type),
>                                 ("sve_vl", libxl_sve_type),
>                                 ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
>                                ])),
> @@ -739,6 +739,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>  
>      ("vpmu", libxl_defbool),
>      ("trap_unmapped_accesses", libxl_defbool),
> +    ("vuart", libxl_vuart_type),
>  
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c93..0f039ca65a88 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -2,6 +2,45 @@
>  #include "libxl_arch.h"
>  #include <xen/arch-x86/cpuid.h>
>  
> +static void libxl__arch_domain_vuart_assert(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuart);
> +    abort();
> +}
> +
> +static void libxl__arch_domain_vuart_unsupported(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    if ( d_config->b_info.vuart != LIBXL_VUART_TYPE_UNKNOWN )
> +        libxl__arch_domain_vuart_assert(gc, d_config, config);
> +}
> +
> +static void libxl__arch_domain_vuart_enable(
> +    libxl__gc *gc,
> +    libxl_domain_config *d_config,
> +    struct xen_domctl_createdomain *config)
> +{
> +    switch ( d_config->b_info.vuart )
> +    {
> +    case LIBXL_VUART_TYPE_SBSA_UART:
> +        libxl__arch_domain_vuart_assert(gc, d_config, config);
> +        break;
> +
> +    case LIBXL_VUART_TYPE_NS16550:
> +        config->arch.emulation_flags |= XEN_X86_EMU_NS16550;
> +        break;
> +
> +    case LIBXL_VUART_TYPE_UNKNOWN:
> +    default:
> +        break;
> +    }
> +}
> +
>  int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                        libxl_domain_config *d_config,
>                                        struct xen_domctl_createdomain *config)
> @@ -9,14 +48,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
>          config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        libxl__arch_domain_vuart_enable(gc, d_config, config);

As mentioned in the previous commit, I don't think this works as
expected.  You have added XEN_X86_EMU_NS16550 to XEN_X86_EMU_ALL, and
hence you need to subtract it from the mask as it's done with VPCI.

>          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
>              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
>          break;
>      case LIBXL_DOMAIN_TYPE_PVH:
>          config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
> +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
>          break;
>      case LIBXL_DOMAIN_TYPE_PV:
>          config->arch.emulation_flags = 0;
> +        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
>          break;
>      default:
>          abort();
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7e1aabad6cba..4539e78bb283 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
>    | X86_EMU_PIT
>    | X86_EMU_USE_PIRQ
>    | X86_EMU_VPCI
> +  | X86_EMU_NS16550
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index f44dba61aeab..66a98180d99b 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
>    | X86_EMU_PIT
>    | X86_EMU_USE_PIRQ
>    | X86_EMU_VPCI
> +  | X86_EMU_NS16550
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 28cdbf07c213..b0d266b5bf63 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1498,7 +1498,7 @@ void parse_config_data(const char *config_source,
>          b_info->max_vcpus = l;
>  
>      if (!xlu_cfg_get_string(config, "vuart", &buf, 0)) {
> -        if (libxl_vuart_type_from_string(buf, &b_info->arch_arm.vuart)) {
> +        if (libxl_vuart_type_from_string(buf, &b_info->vuart)) {
>              fprintf(stderr, "ERROR: invalid value \"%s\" for \"vuart\"\n",
>                      buf);
>              exit(1);
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7fd4f7a831dc..6a010a509a60 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -780,9 +780,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>          /* HVM domU */
>          {
>              .caps   = CAP_HVM | CAP_DOMU,
> -            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ |
> +                                      X86_EMU_NS16550),
>              /* HVM PIRQ feature is user-selectable. */
> -            .opt    = X86_EMU_USE_PIRQ,
> +            .opt    = X86_EMU_USE_PIRQ | X86_EMU_NS16550,

Does this need to be part of the patch that adds X86_EMU_NS16550 into
X86_EMU_ALL, as to not break domain creation in the interim?

Thanks, Roger.

