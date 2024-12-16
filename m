Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E109F2C17
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 09:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857596.1269820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN6eZ-0005SE-2U; Mon, 16 Dec 2024 08:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857596.1269820; Mon, 16 Dec 2024 08:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN6eY-0005Pe-Vc; Mon, 16 Dec 2024 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 857596;
 Mon, 16 Dec 2024 08:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3c03=TJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tN6eX-0005PY-Au
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 08:40:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68915820-bb89-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 09:40:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so24182275e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 00:40:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80601desm7464309f8f.90.2024.12.16.00.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:40:30 -0800 (PST)
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
X-Inumbo-ID: 68915820-bb89-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734338431; x=1734943231; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n7hnVuA6Ir1t7mYwsyCzuoPRED4PVNmOejMrQoICa5A=;
        b=bNUeklhbfWn+2DPBS/b5t5SPLI55lh4L4P/YCscxaXgyengSMfCfySpnRVw7BY/HnJ
         /6JU6WXsSob3EIRWJV+yU00u3/qcjNECaIkdjYAjWf1nW+LhZiW2iye4zMOLbSIpuS2O
         gNl5e+XOlj0iP5Jtyf2y9jVhuA9WjjbJR6B3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338431; x=1734943231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7hnVuA6Ir1t7mYwsyCzuoPRED4PVNmOejMrQoICa5A=;
        b=TNkUVMpbPS79Sq+Zu6CBS6xwbQqOyoiAkCCJb90B0Z4m9OyCN8IIetwtIr5bxvlVJ2
         bXlvEPXWCavWEnYj8LqS/ogOdtP7Zv4P6kP5zt/W5exk47EcmRFe0KF3vz9CGaF61sE6
         CfzTYOcoR3lpI2LJmhGMjEkmfXFRB8o1SyvFBQ03IXDaxtM6BAYZaByet7bZ+io+6hJk
         nb/JevGOfBnnzhgN8XPmQ+jxE45PimDmHcm9971ZKVdin8Y8o82G4JrqdLMCZy83zCQ5
         OSkkEnB7K0dqhxp9KjkkApSDzVRJ+fq/QkR/MVyTEPPhgpvvCNiJtULprS2dhAP35wKg
         s0/w==
X-Forwarded-Encrypted: i=1; AJvYcCX6SmrKUI2BEjhy0Dzh7DNZDaY3cOrr4qjiKFdGisY0KQ3wcectbVoexVz0S9u3zHuFh7Ihxx8ANJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj8zQbUvaya0rOBe5ojkpawnTZwp+xnja8BTtllO8TTJv8NUzP
	Wa3e7AgfUAqcCmoaVk3AlQWOW7XCj/kPZDNIe2VLKDuCqSm8Vhp4t0PcchUSvhI=
X-Gm-Gg: ASbGncuQ5ZSFBvWwFwBZUiBGwKtVSgtSNtlKIXFpqe/jTY3dDDHSp6BkP9d3K9GTHky
	EeIWT9OoYCzEv7u+lVcGI53EiaEA+IGk7XH5LRQImKe8VAO7IWLxcSJ54WYH3jjmYqFgAqH/1jM
	REkiVFUzwBJW8QMxlBl6KKuWSCEtt03AI10mOC/RNjWa29M1/laStYKpDuXcgCDuNKBUPH6xYvW
	OIiT6LQ5wqX2RzXJkLeMYx2mzzeIZhBO1TujCBLZ0dExoojnPFxHsGqAqVv3w==
X-Google-Smtp-Source: AGHT+IHh5wcCZRXGFa0CjTwy/DajjsMEflZRQX0DXrJw7XjGvDIDQqPFRapZoN5QVoAI1NFzpxduuA==
X-Received: by 2002:a05:600c:1d29:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-4362aa40835mr89440485e9.19.1734338430619;
        Mon, 16 Dec 2024 00:40:30 -0800 (PST)
Date: Mon, 16 Dec 2024 09:40:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <Z1_nfT8YfIkYuikB@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
 <Z1wnUzDCPDzHKr6o@macbook.local>
 <alpine.DEB.2.22.394.2412131245300.463523@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2412131245300.463523@ubuntu-linux-20-04-desktop>

On Fri, Dec 13, 2024 at 12:45:34PM -0800, Stefano Stabellini wrote:
> On Fri, 13 Dec 2024, Roger Pau Monné wrote:
> > On Thu, Dec 05, 2024 at 08:42:03PM -0800, Denis Mukhin via B4 Relay wrote:
> > > From: Denis Mukhin <dmukhin@ford.com>
> > > 
> > > Add new emulation flag for virtual UART on x86 and plumb it through the stack.
> > > 
> > > This change enables NS8250 emulator initialization.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > >  tools/libs/light/libxl_x86.c      |  6 +++++-
> > >  tools/ocaml/libs/xc/xenctrl.ml    |  1 +
> > >  tools/ocaml/libs/xc/xenctrl.mli   |  1 +
> > >  tools/python/xen/lowlevel/xc/xc.c |  4 +---
> > >  xen/arch/x86/domain.c             |  8 +++++---
> > >  xen/arch/x86/include/asm/domain.h |  7 ++++---
> > >  xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
> > >  7 files changed, 30 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> > > index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b101b9a7159eb0fe0178 100644
> > > --- a/tools/libs/light/libxl_x86.c
> > > +++ b/tools/libs/light/libxl_x86.c
> > > @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> > >  {
> > >      switch(d_config->c_info.type) {
> > >      case LIBXL_DOMAIN_TYPE_HVM:
> > > -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> > > +        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
> > > +        /* Virtual UART is selected at Xen build time */
> > > +        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;
> > > +
> > >          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> > >              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
> > >          break;
> > > diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> > > index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
> > > --- a/tools/ocaml/libs/xc/xenctrl.ml
> > > +++ b/tools/ocaml/libs/xc/xenctrl.ml
> > > @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
> > >    | X86_EMU_PIT
> > >    | X86_EMU_USE_PIRQ
> > >    | X86_EMU_VPCI
> > > +  | X86_EMU_VUART
> > >  
> > >  type x86_arch_misc_flags =
> > >    | X86_MSR_RELAXED
> > > diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> > > index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
> > > --- a/tools/ocaml/libs/xc/xenctrl.mli
> > > +++ b/tools/ocaml/libs/xc/xenctrl.mli
> > > @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
> > >    | X86_EMU_PIT
> > >    | X86_EMU_USE_PIRQ
> > >    | X86_EMU_VPCI
> > > +  | X86_EMU_VUART
> > >  
> > >  type x86_arch_misc_flags =
> > >    | X86_MSR_RELAXED
> > > diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
> > > index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2166ec9a95bc1dcd1781 100644
> > > --- a/tools/python/xen/lowlevel/xc/xc.c
> > > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > > @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
> > >  
> > >  #if defined (__i386) || defined(__x86_64__)
> > >      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> > > -        config.arch.emulation_flags = XEN_X86_EMU_ALL &
> > > -                                      ~(XEN_X86_EMU_VPCI |
> > > -                                        XEN_X86_EMU_USE_PIRQ);
> > > +        config.arch.emulation_flags = XEN_X86_EMU_HVM_ALLOWABLE;
> > >  #elif defined (__arm__) || defined(__aarch64__)
> > >      config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> > >  #else
> > > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > > index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075bf834da5f9670dd54 100644
> > > --- a/xen/arch/x86/domain.c
> > > +++ b/xen/arch/x86/domain.c
> > > @@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> > >          if ( is_hardware_domain(d) &&
> > >               emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> > >              return false;
> > > +
> > > +        emflags &= ~X86_EMU_VUART;
> > 
> > I think you want to allow X86_EMU_VUART only for domains created by
> > Xen itself, so X86_EMU_VUART can only be valid if system_state <
> > SYS_STATE_active.
> > 
> > >          if ( !is_hardware_domain(d) &&
> > > -             /* HVM PIRQ feature is user-selectable. */
> > > -             (emflags & ~X86_EMU_USE_PIRQ) !=
> > > -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > > +             xen_emflags_allowable(emflags) != XEN_X86_EMU_HVM_ALLOWABLE &&
> > >               emflags != X86_EMU_LAPIC )
> > >              return false;
> > >      }
> > > @@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
> > >  
> > >      emflags = config->arch.emulation_flags;
> > >  
> > > +    if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
> > > +        emflags |= XEN_X86_EMU_VUART;
> > 
> > Doesn't this need to be limited to domains created by Xen itself, as
> > otherwise it's the toolstack that should specify the XEN_X86_EMU_VUART
> > flag, and even then the recommendation would be to use the vUART from
> > QEMU?
> 
> While I agree with you that this feature is really useful mostly for the
> domains created by Xen, as for those there is no other way to get early
> output, I think Denis has been also testing successfully this feature
> with PVH or HVM domains created by the toolstack.
> 
> I'll let you decide whether you want to expose the feature to xl created
> domains, but yes my understanding is that they already work with this
> series. One benefit would be that for PVH domains you could get early
> output without having to start QEMU, but I'll leave this to you.

I'm not opposed to allowing usage of the Xen emulated uart for
toolstack created domains, but then the option needs to be integrated
with xl/libxl IMO, so that it can be specified in the xl.cfg file, and
propagated from the toolstack into Xen using the emulation_flags
field.  Just like all other emulated devices that are controlled by
emulation_flags.

Thanks, Roger.

