Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C421267D1B7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 17:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485132.752125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5DU-0008U1-8I; Thu, 26 Jan 2023 16:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485132.752125; Thu, 26 Jan 2023 16:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5DU-0008QE-55; Thu, 26 Jan 2023 16:35:12 +0000
Received: by outflank-mailman (input) for mailman id 485132;
 Thu, 26 Jan 2023 16:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL5DS-0008Fu-PJ
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 16:35:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 652f58c7-9d97-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 17:35:08 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id hw16so6509860ejc.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 08:35:08 -0800 (PST)
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
X-Inumbo-ID: 652f58c7-9d97-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eY8MqaP/PKYZ/s1JBiUJ0LQ4pGCWSOlUG8pefKZmdXg=;
        b=g33B0RAz1kGKhaAH+77KhFDGg3hPTJCMoK2/EpzhzJo16+3Qh51ZzWazPD2EM7t2yg
         FfUGc78vBdJcCJaeUWS8OUnpkPcCSHJ4VmL0RPF8hSHX7DH/IQgdBrZrq2ilvipa5TPt
         Q7ky46onwxn2wJV5V45YvGo13jQTn0DAYTGRkOl0mxMb0rxDTlQYxsct89ALSnAbty69
         RmU/jPBB8h2A1Tcb2nOkkORIt52Gfg44DeZ+xw/cMfS7a3MjmI2Dc32Mh0YqV+5g2eiM
         bcyB0VczL7eU553xJDJHikdVzUOnC4lOFuOreCJ5CZttfImGhmhu9Nr1LTie8fpij4tO
         xprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY8MqaP/PKYZ/s1JBiUJ0LQ4pGCWSOlUG8pefKZmdXg=;
        b=PZ8OniEA7wuYiiePqSgMjxS/RoP7RMZ8MhxNXgJPIW6aPIANwHMKeRVLFwWf/yELzn
         eKxh9tX92bQZCvoU3HY27ZRzm5dLw3X3tC6a2H4fZ3Q7fqYnJ+bOWZUp5e2zPAokgvp3
         YD+0zEiNgM4ZJJAK6mLrZ4z9iqcilmc+PtP22mDRMnc0NzeRcITz0ODbsfCCHZWyMgM6
         Z1JzjWBcSslzrBSVcalIqyn5kHFKKO3GRAgM7Cvm2il0QG94MGIBWuKHUBTDw6+IGyrv
         z0bJzxG2zUWS6rwBqyizJtNAto0sEq7LbXGhvxcCZjquxU06Y/q8oLWITaalktNHdANL
         /sKQ==
X-Gm-Message-State: AFqh2kof1ENVVczFPTLNlzdD7IImnfAWNmJny/nD9tDCb94V2yzSLPNq
	bwBdRfqX6JeK51LieQVgU+ZnQsdWtS4PMHA5qBpMWg==
X-Google-Smtp-Source: AMrXdXvWV9BcG0zVt1RjwAsW/HnA/RUgqErGWu7AP4OVUk0pQuS0bJbbBjjk4BVqtCfkM3O2ZN1/7T3M+FK6xkOY+d4=
X-Received: by 2002:a17:906:1ccb:b0:86a:7123:d366 with SMTP id
 i11-20020a1709061ccb00b0086a7123d366mr4827149ejh.300.1674750907847; Thu, 26
 Jan 2023 08:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-6-carlo.nonato@minervasys.tech> <Y9KMio62otVChUcq@perard.uk.xensource.com>
In-Reply-To: <Y9KMio62otVChUcq@perard.uk.xensource.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 17:34:56 +0100
Message-ID: <CAG+AhRUNuK-mCB5hZWEktXsLMWdM39odhLjGBw1jbgS_gqhBdA@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] tools: add support for cache coloring configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Anthony,

On Thu, Jan 26, 2023 at 3:22 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Mon, Jan 23, 2023 at 04:47:29PM +0100, Carlo Nonato wrote:
> > diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> > index e939d07157..064f54c349 100644
> > --- a/tools/libs/ctrl/xc_domain.c
> > +++ b/tools/libs/ctrl/xc_domain.c
> > @@ -28,6 +28,20 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
> >  {
> >      int err;
> >      DECLARE_DOMCTL;
> > +    DECLARE_HYPERCALL_BUFFER(uint32_t, llc_colors);
> > +
> > +    if ( config->num_llc_colors )
> > +    {
> > +        size_t bytes = sizeof(uint32_t) * config->num_llc_colors;
> > +
> > +        llc_colors = xc_hypercall_buffer_alloc(xch, llc_colors, bytes);
> > +        if ( llc_colors == NULL ) {
> > +            PERROR("Could not allocate LLC colors for xc_domain_create");
> > +            return -ENOMEM;
> > +        }
> > +        memcpy(llc_colors, config->llc_colors.p, bytes);
> > +        set_xen_guest_handle(config->llc_colors, llc_colors);
>
> I think this two lines looks wrong. There is a double usage of
> config->llc_colors, to both store a user pointer and then to store an
> hypercall buffer. Also, accessing llc_colors.p field is probably wrong.

> I guess the caller of xc_domain_create() (that is libxl) will have to
> take care of the hypercall buffer. It is already filling the
> xen_domctl_createdomain struct that is passed to the hypercall, so it's
> probably fine to handle hypercall buffer which is part of it.

This is what I did in v3 :) (https://marc.info/?l=xen-devel&m=166930291506578)
However things probably will change again because of a new interface in Xen.

> What happen in the hypervisor when both num_llc_colors and llc_colors
> are set to 0 in the struct xen_domctl_createdomain? Is it fine? That is
> to figure out if all users of xc_domain_create() needs to be updated.

A default coloring configuration is generated if the array is null or its
length is 0. So no problems on the Xen side.

> Also, ocaml binding is "broken", or at least needs updating. This is due
> to the addition of llc_colors into xen_domctl_createdomain, the size
> been different than the expected size.
>
>
> > +    }
> >
> >      domctl.cmd = XEN_DOMCTL_createdomain;
> >      domctl.domain = *pdomid;
> > @@ -39,6 +53,9 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
> >      *pdomid = (uint16_t)domctl.domain;
> >      *config = domctl.u.createdomain;
> >
> > +    if ( llc_colors )
> > +        xc_hypercall_buffer_free(xch, llc_colors);
> > +
> >      return 0;
> >  }
> >
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index beec3f6b6f..6d0c768241 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -638,6 +638,8 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >              .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
> >              .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
> >              .cpupool_id = info->poolid,
> > +            .num_llc_colors = b_info->num_llc_colors,
> > +            .llc_colors.p = b_info->llc_colors,
> >          };
> >
> >          if (info->type != LIBXL_DOMAIN_TYPE_PV) {
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 0cfad8508d..1f944ca6d7 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -562,6 +562,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >      ("ioports",          Array(libxl_ioport_range, "num_ioports")),
> >      ("irqs",             Array(uint32, "num_irqs")),
> >      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> > +    ("llc_colors",       Array(uint32, "num_llc_colors")),
>
> For this, you are going to need to add a LIBXL_HAVE_ macro in libxl.h.
> They are plenty of example as well as an explanation.
> But a good name I guess would be LIBXL_HAVE_BUILDINFO_LLC_COLORS along
> with a short comment.

Ok, thanks for the explanation.

> >      ("claim_mode",        libxl_defbool),
> >      ("event_channels",   uint32),
> >      ("kernel",           string),
>
>
> Thanks,
>
> --
> Anthony PERARD

