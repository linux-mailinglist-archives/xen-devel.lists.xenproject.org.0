Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9B8CDF81
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729035.1134180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKh9-0003Yi-Ej; Fri, 24 May 2024 02:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729035.1134180; Fri, 24 May 2024 02:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKh9-0003VA-Bg; Fri, 24 May 2024 02:30:11 +0000
Received: by outflank-mailman (input) for mailman id 729035;
 Fri, 24 May 2024 02:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAKWk-0003tc-KI
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:19:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09d8cb2f-1974-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:19:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBA4B62F9E;
 Fri, 24 May 2024 02:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE25C2BD10;
 Fri, 24 May 2024 02:19:22 +0000 (UTC)
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
X-Inumbo-ID: 09d8cb2f-1974-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716517163;
	bh=ww9wwzaIabqdPH5v4U3tm6QEcQmHmaxF/Yt+pirjSPU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ssZlT1lj9Zv7nDQYLzT8SnolJr8VbY+FEWccmnq6v74gq9vvHv134yqtntovF2U3+
	 PvijpMk3St2FmkTML6kGjk7v7Chznc/7RAaeaFmvAb63gp6iEd2bB8+MaEucvkD0dd
	 r8ZuYcYAU9gAuwiRAW0Hw39Aj+roNtXvciAJakODwdG+TDFR8H8eMpA97EOgVzpMhT
	 Y2+m0xZgkgDdUpVzK6MoZASXLSvBAddo6zmpUpm2ev+ZSOHwD6sQ7ESH4a2kNsvaWE
	 WRj+lnzqpBzXXhxA7cHLr5dHB2L1RzgojSDyGeYa7JRD7UHYIKAY6PokXJ983EnbCz
	 orWVek/To9fMw==
Date: Thu, 23 May 2024 19:19:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony@xenproject.org>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 3/9] tools/arm: Introduce the "nr_spis" xl config
 entry
In-Reply-To: <02e22734-2e0c-4a0a-8c5a-42beee0cc396@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405231802010.2557291@ubuntu-linux-20-04-desktop>
References: <20240523074040.1611264-1-xin.wang2@amd.com> <20240523074040.1611264-4-xin.wang2@amd.com> <02e22734-2e0c-4a0a-8c5a-42beee0cc396@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> On 23/05/2024 08:40, Henry Wang wrote:
> > Currently, the number of SPIs allocated to the domain is only
> > configurable for Dom0less DomUs. Xen domains are supposed to be
> > platform agnostics and therefore the numbers of SPIs for libxl
> > guests should not be based on the hardware.
> > 
> > Introduce a new xl config entry for Arm to provide a method for
> > user to decide the number of SPIs. This would help to avoid
> > bumping the `config->arch.nr_spis` in libxl everytime there is a
> > new platform with increased SPI numbers.
> > 
> > Update the doc and the golang bindings accordingly.
> > 
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> > ---
> > v4:
> > - Add Jason's Reviewed-by tag.
> > v3:
> > - Reword documentation to avoid ambiguity.
> > v2:
> > - New patch to replace the original patch in v1:
> >    "[PATCH 05/15] tools/libs/light: Increase nr_spi to 160"
> > ---
> >   docs/man/xl.cfg.5.pod.in             | 14 ++++++++++++++
> >   tools/golang/xenlight/helpers.gen.go |  2 ++
> >   tools/golang/xenlight/types.gen.go   |  1 +
> >   tools/libs/light/libxl_arm.c         |  4 ++--
> >   tools/libs/light/libxl_types.idl     |  1 +
> >   tools/xl/xl_parse.c                  |  3 +++
> >   6 files changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 8f2b375ce9..416d582844 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -3072,6 +3072,20 @@ raised.
> >     =back
> >   +=over 4
> > +
> > +=item B<nr_spis="NR_SPIS">
> > +
> > +An optional 32-bit integer parameter specifying the number of SPIs (Shared
> 
> We can't support that much SPIs :). The limit would be 991 SPIs.

I change it


> > +Peripheral Interrupts) to allocate for the domain. If the value specified
> > by
> > +the `nr_spis` parameter is smaller than the number of SPIs calculated by
> > the
> > +toolstack based on the devices allocated for the domain, or the `nr_spis`
> > +parameter is not specified, the value calculated by the toolstack will be
> > used
> > +for the domain. Otherwise, the value specified by the `nr_spis` parameter
> > will
> > +be used.
> 
> I think it would be worth mentioning that the number of SPIs should match the
> highest interrupt ID that will be assigned to the domain (rather than the
> number of SPIs planned to be assigned).

I added it


> > +
> > +=back
> > +
> >   =head3 x86
> >     =over 4
> > diff --git a/tools/golang/xenlight/helpers.gen.go
> > b/tools/golang/xenlight/helpers.gen.go
> > index b9cb5b33c7..fe5110474d 100644
> > --- a/tools/golang/xenlight/helpers.gen.go
> > +++ b/tools/golang/xenlight/helpers.gen.go
> > @@ -1154,6 +1154,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
> >   x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
> >   x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
> >   x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
> > +x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
> >   if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil
> > {
> >   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
> >   }
> > @@ -1670,6 +1671,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
> >   xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
> >   xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
> >   xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
> > +xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
> >   if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
> >   return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
> >   }
> > diff --git a/tools/golang/xenlight/types.gen.go
> > b/tools/golang/xenlight/types.gen.go
> > index 5b293755d7..c9e45b306f 100644
> > --- a/tools/golang/xenlight/types.gen.go
> > +++ b/tools/golang/xenlight/types.gen.go
> > @@ -597,6 +597,7 @@ ArchArm struct {
> >   GicVersion GicVersion
> >   Vuart VuartType
> >   SveVl SveType
> > +NrSpis uint32
> >   }
> >   ArchX86 struct {
> >   MsrRelaxed Defbool
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index 1cb89fa584..a4029e3ac8 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -181,8 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >         LOG(DEBUG, "Configure the domain");
> >   -    config->arch.nr_spis = nr_spis;
> > -    LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
> > +    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
> 
> I am not entirely sure about using max(). To me if the user specifies a lower
> limit, then we should throw an error because this is likely an indication that
> the SPIs they will want to assign will clash with the emulated ones.
> 
> So it would be better to warn at domain creation rather than waiting until the
> IRQs are assigned.
> 
> I would like Anthony's opinion on this one. Given he is away this month, I
> guess we could get this patch merged (with other comments addressed) and have
> a follow-up if wanted before 4.19.

I left it as is for now


> > +    LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
> >         switch (d_config->b_info.arch_arm.gic_version) {
> >       case LIBXL_GIC_VERSION_DEFAULT:
> > diff --git a/tools/libs/light/libxl_types.idl
> > b/tools/libs/light/libxl_types.idl
> > index 79e9c656cc..4e65e6fda5 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -722,6 +722,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                  ("vuart", libxl_vuart_type),
> >                                  ("sve_vl", libxl_sve_type),
> > +                               ("nr_spis", uint32),
> 
> From my understandig, any change in the .idl requires a corresponding
> LIBXL_HAVE_... in include/libxl.h. This is in order to allow external
> toolstack (such as libvirt) to be able to select at build time between
> multiple version of libxl.

I added it


> >                                 ])),
> >       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> >                                 ])),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index c504ab3711..e3a4800f6e 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -2935,6 +2935,9 @@ skip_usbdev:
> >           }
> >       }
> >   +    if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
> > +        b_info->arch_arm.nr_spis = l;
> > +
> >       parse_vkb_list(config, d_config);
> >         d_config->virtios = NULL;
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

