Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53D9F178B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 21:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857182.1269591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMCXe-0005IS-DH; Fri, 13 Dec 2024 20:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857182.1269591; Fri, 13 Dec 2024 20:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMCXe-0005GR-AR; Fri, 13 Dec 2024 20:45:42 +0000
Received: by outflank-mailman (input) for mailman id 857182;
 Fri, 13 Dec 2024 20:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tMCXc-0005GL-Ro
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 20:45:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34e6012a-b993-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 21:45:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0382C5C5FE0;
 Fri, 13 Dec 2024 20:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDA2C4CED6;
 Fri, 13 Dec 2024 20:45:34 +0000 (UTC)
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
X-Inumbo-ID: 34e6012a-b993-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734122735;
	bh=dByUPsNZ25l6EpZmsuACLXZwiypAYy/TalLHbnBsEN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s15HAtgSJE2fkZtO+bXT6grgvWDG8an93nICmDwIj6Qanl2FD8tUmXnYimHYQM9J5
	 JRszlxpCeJXFyDPKYaXHdaD5e4JdO/8AHD6WoMabrUFpEWs2Lke5vtR7r49cCQuE4m
	 xTGoTw8BixTf7XxuqimXiipvW5bcRs+EOWGcGB9gDUUDWCSRlSwvZkZ9J7zVqXEt6Y
	 yNqSAb98ZetGAnZ6pSOwrvuiFkcmBBMPJ4wtbr7rEigcUvZbqZM8iE9KA0ZudR/KJn
	 Ss0nN6p1F3tcbY8P9RQexEkbpWZ6cN5q+bAyWbBwpwj3KpPJZtGtpxuZwhILuVH/lx
	 YkSoNgm2sFRMw==
Date: Fri, 13 Dec 2024 12:45:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
In-Reply-To: <Z1wnUzDCPDzHKr6o@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2412131245300.463523@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com> <Z1wnUzDCPDzHKr6o@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-108919309-1734122502=:463523"
Content-ID: <alpine.DEB.2.22.394.2412131241530.463523@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-108919309-1734122502=:463523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2412131241531.463523@ubuntu-linux-20-04-desktop>

On Fri, 13 Dec 2024, Roger Pau Monné wrote:
> On Thu, Dec 05, 2024 at 08:42:03PM -0800, Denis Mukhin via B4 Relay wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Add new emulation flag for virtual UART on x86 and plumb it through the stack.
> > 
> > This change enables NS8250 emulator initialization.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  tools/libs/light/libxl_x86.c      |  6 +++++-
> >  tools/ocaml/libs/xc/xenctrl.ml    |  1 +
> >  tools/ocaml/libs/xc/xenctrl.mli   |  1 +
> >  tools/python/xen/lowlevel/xc/xc.c |  4 +---
> >  xen/arch/x86/domain.c             |  8 +++++---
> >  xen/arch/x86/include/asm/domain.h |  7 ++++---
> >  xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
> >  7 files changed, 30 insertions(+), 11 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> > index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b101b9a7159eb0fe0178 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >  {
> >      switch(d_config->c_info.type) {
> >      case LIBXL_DOMAIN_TYPE_HVM:
> > -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> > +        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
> > +        /* Virtual UART is selected at Xen build time */
> > +        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;
> > +
> >          if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> >              config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
> >          break;
> > diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> > index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
> > --- a/tools/ocaml/libs/xc/xenctrl.ml
> > +++ b/tools/ocaml/libs/xc/xenctrl.ml
> > @@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
> >    | X86_EMU_PIT
> >    | X86_EMU_USE_PIRQ
> >    | X86_EMU_VPCI
> > +  | X86_EMU_VUART
> >  
> >  type x86_arch_misc_flags =
> >    | X86_MSR_RELAXED
> > diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> > index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
> > --- a/tools/ocaml/libs/xc/xenctrl.mli
> > +++ b/tools/ocaml/libs/xc/xenctrl.mli
> > @@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
> >    | X86_EMU_PIT
> >    | X86_EMU_USE_PIRQ
> >    | X86_EMU_VPCI
> > +  | X86_EMU_VUART
> >  
> >  type x86_arch_misc_flags =
> >    | X86_MSR_RELAXED
> > diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
> > index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2166ec9a95bc1dcd1781 100644
> > --- a/tools/python/xen/lowlevel/xc/xc.c
> > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
> >  
> >  #if defined (__i386) || defined(__x86_64__)
> >      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> > -        config.arch.emulation_flags = XEN_X86_EMU_ALL &
> > -                                      ~(XEN_X86_EMU_VPCI |
> > -                                        XEN_X86_EMU_USE_PIRQ);
> > +        config.arch.emulation_flags = XEN_X86_EMU_HVM_ALLOWABLE;
> >  #elif defined (__arm__) || defined(__aarch64__)
> >      config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> >  #else
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075bf834da5f9670dd54 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >          if ( is_hardware_domain(d) &&
> >               emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> >              return false;
> > +
> > +        emflags &= ~X86_EMU_VUART;
> 
> I think you want to allow X86_EMU_VUART only for domains created by
> Xen itself, so X86_EMU_VUART can only be valid if system_state <
> SYS_STATE_active.
> 
> >          if ( !is_hardware_domain(d) &&
> > -             /* HVM PIRQ feature is user-selectable. */
> > -             (emflags & ~X86_EMU_USE_PIRQ) !=
> > -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > +             xen_emflags_allowable(emflags) != XEN_X86_EMU_HVM_ALLOWABLE &&
> >               emflags != X86_EMU_LAPIC )
> >              return false;
> >      }
> > @@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
> >  
> >      emflags = config->arch.emulation_flags;
> >  
> > +    if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
> > +        emflags |= XEN_X86_EMU_VUART;
> 
> Doesn't this need to be limited to domains created by Xen itself, as
> otherwise it's the toolstack that should specify the XEN_X86_EMU_VUART
> flag, and even then the recommendation would be to use the vUART from
> QEMU?

While I agree with you that this feature is really useful mostly for the
domains created by Xen, as for those there is no other way to get early
output, I think Denis has been also testing successfully this feature
with PVH or HVM domains created by the toolstack.

I'll let you decide whether you want to expose the feature to xl created
domains, but yes my understanding is that they already work with this
series. One benefit would be that for PVH domains you could get early
output without having to start QEMU, but I'll leave this to you.
--8323329-108919309-1734122502=:463523--

