Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBD9F0C28
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 13:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856655.1269209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM4hz-0008Sx-M2; Fri, 13 Dec 2024 12:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856655.1269209; Fri, 13 Dec 2024 12:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM4hz-0008Q4-ID; Fri, 13 Dec 2024 12:23:51 +0000
Received: by outflank-mailman (input) for mailman id 856655;
 Fri, 13 Dec 2024 12:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nQu=TG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tM4hy-0008Py-Cu
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 12:23:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b058c91-b94d-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 13:23:49 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so214673066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 04:23:48 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm897822866b.65.2024.12.13.04.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 04:23:47 -0800 (PST)
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
X-Inumbo-ID: 1b058c91-b94d-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734092628; x=1734697428; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjd9VIIJ7/vP5y7gch1pC+dY9ZIqfQZ1Z3Z/fG94xg=;
        b=PzABCKXKmYiny+2kUwg8mk6e/BP1HApbimTb136cLgrTpXk/WsJUvwjHSouddfDgKi
         7pnStwYMFjMvnBmUxNHlNC1kzkzQRiDG4BrIrE63pg/oP4ZFn2BAkZcPJjP1Ufhg7QvN
         lC93suPjw5Rd6jmXmRJvINVh1Bto/mypQ53dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734092628; x=1734697428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRjd9VIIJ7/vP5y7gch1pC+dY9ZIqfQZ1Z3Z/fG94xg=;
        b=GMPJhTCtaaoBWBW6mWFLyD3VURypAWpC4O8DIa30NxDLJerW1tkPQi9dBzPj6ClReQ
         Vssfgn7/1QheckFJ3W5Y4avX8CGQAzYormC8V7u7pBVzY1MAEnBUtbvX1ek9ZKAr2UYn
         vWfzOet05cAIiuIxwTwquSOIEGvnjXEQpOnA61vugdqJ/q7HPLdb5zl1yGFkY8bZX0TI
         tf27rCN3HTEQtPZpB52QSs0weMTX3E4jg7H4ojuUWPFIPNpwao3LQcYUMLYWg0pBWCZH
         hf4/7PcC6uUaOD1Fi8kGA+4KvNUFOIEqNLxlTieAZesJN35PgILOIzexRA2f+ReMwI7X
         wTpQ==
X-Gm-Message-State: AOJu0YwiS7RUfDgASPN+wIUeWXtVRmDh/Drf9wm5hikj+UnfS1pvZAiQ
	oA1UJLuqzbzdYcpZzFeKd8LGFonILHrMNV7epdC0ZBXiGrOSWbKBg7wh0oxTHUX5ZXFgSAN3PtU
	d
X-Gm-Gg: ASbGnct3bb6pZ81vnFX40XTVw9Z4l44qOsyvJq+4ZNqrBLItmG2SWBMgtGzVCnOugYL
	1s8YfeeL5QBlkgBKjRKRA6Q2G/BB2r3VPDMt//54SMjRM1Lm+wRTXQrsAujxW1n7VrACcaNHsgG
	qH11mOACbYX3ea8RSdXAPw7q475QOw9WVHbgjVNEM42W0loluvfpg3T7h75jqz30G/dnJwZpQQR
	ur3U3ugdBg/QZ5sWaNHF34cSoDMoaFC6a0JmfkJB7bCdDJvozQhQIFsAJe3/Y9ilw==
X-Google-Smtp-Source: AGHT+IHwO9zooK0KVHOxa5Tr5V4hFoFYnV1fK5q6/tobMDEdl9g8Fe7dL1XHd2Yz3nw0+W/NZ7dtVQ==
X-Received: by 2002:a05:6402:2392:b0:5d6:48ef:c19f with SMTP id 4fb4d7f45d1cf-5d648efc1b9mr337889a12.29.1734092628239;
        Fri, 13 Dec 2024 04:23:48 -0800 (PST)
Date: Fri, 13 Dec 2024 13:23:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <Z1wnUzDCPDzHKr6o@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:42:03PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add new emulation flag for virtual UART on x86 and plumb it through the stack.
> 
> This change enables NS8250 emulator initialization.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  tools/libs/light/libxl_x86.c      |  6 +++++-
>  tools/ocaml/libs/xc/xenctrl.ml    |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli   |  1 +
>  tools/python/xen/lowlevel/xc/xc.c |  4 +---
>  xen/arch/x86/domain.c             |  8 +++++---
>  xen/arch/x86/include/asm/domain.h |  7 ++++---
>  xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
>  7 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b101b9a7159eb0fe0178 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> +        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
> +        /* Virtual UART is selected at Xen build time */
> +        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;
> +
>          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
>              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
>          break;
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
>    | X86_EMU_PIT
>    | X86_EMU_USE_PIRQ
>    | X86_EMU_VPCI
> +  | X86_EMU_VUART
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
>    | X86_EMU_PIT
>    | X86_EMU_USE_PIRQ
>    | X86_EMU_VPCI
> +  | X86_EMU_VUART
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
> index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2166ec9a95bc1dcd1781 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
>  
>  #if defined (__i386) || defined(__x86_64__)
>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> -        config.arch.emulation_flags = XEN_X86_EMU_ALL &
> -                                      ~(XEN_X86_EMU_VPCI |
> -                                        XEN_X86_EMU_USE_PIRQ);
> +        config.arch.emulation_flags = XEN_X86_EMU_HVM_ALLOWABLE;
>  #elif defined (__arm__) || defined(__aarch64__)
>      config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>  #else
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075bf834da5f9670dd54 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>          if ( is_hardware_domain(d) &&
>               emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
>              return false;
> +
> +        emflags &= ~X86_EMU_VUART;

I think you want to allow X86_EMU_VUART only for domains created by
Xen itself, so X86_EMU_VUART can only be valid if system_state <
SYS_STATE_active.

>          if ( !is_hardware_domain(d) &&
> -             /* HVM PIRQ feature is user-selectable. */
> -             (emflags & ~X86_EMU_USE_PIRQ) !=
> -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> +             xen_emflags_allowable(emflags) != XEN_X86_EMU_HVM_ALLOWABLE &&
>               emflags != X86_EMU_LAPIC )
>              return false;
>      }
> @@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
>  
>      emflags = config->arch.emulation_flags;
>  
> +    if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
> +        emflags |= XEN_X86_EMU_VUART;

Doesn't this need to be limited to domains created by Xen itself, as
otherwise it's the toolstack that should specify the XEN_X86_EMU_VUART
flag, and even then the recommendation would be to use the vUART from
QEMU?

>      if ( is_hardware_domain(d) && is_pv_domain(d) )
>          emflags |= XEN_X86_EMU_PIT;
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index c1d0d1f47324e8cc678a4c76c43f86820a89e7b3..dacea6e1aad46e9f8710b2202bb81203c5e92807 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -484,7 +484,8 @@ struct arch_domain
>  #define X86_EMU_VPCI     0
>  #endif
>  
> -#define X86_EMU_PIT     XEN_X86_EMU_PIT
> +#define X86_EMU_PIT      XEN_X86_EMU_PIT

Unintended indentation change?

> +#define X86_EMU_VUART    XEN_X86_EMU_VUART
>  
>  /* This must match XEN_X86_EMU_ALL in xen.h */
>  #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
> @@ -492,7 +493,7 @@ struct arch_domain
>                                   X86_EMU_IOAPIC | X86_EMU_PIC |         \
>                                   X86_EMU_VGA | X86_EMU_IOMMU |          \
>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
> -                                 X86_EMU_VPCI)
> +                                 X86_EMU_VPCI | X86_EMU_VUART)
>  
>  #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
>  #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> @@ -507,7 +508,7 @@ struct arch_domain
>  #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>  
>  /* NB: same symbol as in Arm port */
> -#define domain_has_vuart(d) false
> +#define domain_has_vuart(d) (!!((d)->arch.emulation_flags & X86_EMU_VUART))
>  
>  #define gdt_ldt_pt_idx(v) \
>        ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index fc2487986642a7694578ab9d2f5f16d09761bff8..e7922e3f9ddc1742a464d228807279839df31e52 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -283,13 +283,25 @@ struct xen_arch_domainconfig {
>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
>  #define _XEN_X86_EMU_VPCI           10
>  #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
> +#define _XEN_X86_EMU_VUART          11
> +#define XEN_X86_EMU_VUART           (1U<<_XEN_X86_EMU_VUART)
>  
>  #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
>                                       XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
>                                       XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
>                                       XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
>                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
> -                                     XEN_X86_EMU_VPCI)
> +                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_VUART)
> +
> +/* HVM PIRQ feature is user-selectable (libxl). */
> +#define XEN_X86_EMU_HVM_SELECTABLE  (XEN_X86_EMU_VPCI | \
> +                                     XEN_X86_EMU_USE_PIRQ | \
> +                                     XEN_X86_EMU_VUART)

XEN_X86_EMU_HVM_OPTIONAL is maybe clearer?

Albeit PVH is kind of HVM.

> +
> +#define xen_emflags_allowable(x)    ((x) & ~XEN_X86_EMU_HVM_SELECTABLE)
> +
> +#define XEN_X86_EMU_HVM_ALLOWABLE   xen_emflags_allowable(XEN_X86_EMU_ALL)

XEN_X86_EMU_HVM_BASELINE I think would also be better?

Thanks, Roger.

