Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E5654458
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 16:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468560.727674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8NVO-0005Da-Ho; Thu, 22 Dec 2022 15:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468560.727674; Thu, 22 Dec 2022 15:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8NVO-0005B9-EP; Thu, 22 Dec 2022 15:29:10 +0000
Received: by outflank-mailman (input) for mailman id 468560;
 Thu, 22 Dec 2022 15:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT/F=4U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1p8NVN-0005B1-HW
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 15:29:09 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff14006-820d-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 16:29:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id r26so3371376edc.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Dec 2022 07:29:07 -0800 (PST)
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
X-Inumbo-ID: 5ff14006-820d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JpwE5gAYmj25iRUUytDECz5m6MR4PAtooA0uhdFuniM=;
        b=RgAwp1qEPfe5n+jBz3yTDom2pP1IHh1UCJiiP2A6gDzaZgBYjr6818MiXbiECpm15Q
         SdSVjHyciy0IYgeGBVm2SYCJE2ecdh+c2nv+MfbBXA/rVfSi8JhqBhuUo7AOeLiRYuo6
         9eFZvwWVdFCu2l/yqttjd3a0OIuedbDh6zUAikGC89SK9l+SnJ5jUeD04xp/wceHvP+x
         oF/VYGwO7fKa0RX7AiMk5xp6RfyJL9RFFaMlUb4E+2e+/i0uC2Ikksv4GsBpvnyNSrFC
         kgpWu2iHRcCdHcUpcURGfxyvNBIR/K9TNDoK8W4VntGQ2Muek2d8YKkFrDZyD2Lky1FJ
         I0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpwE5gAYmj25iRUUytDECz5m6MR4PAtooA0uhdFuniM=;
        b=3mMnJSHmNyDSh6ptNtH1bwQ06XNfb5CsdELHPTsYM8kkH2bjZNl3SUBR6rcS8/utAz
         /Mygsn7ENteQTdFfJVX7Dn6jq3mZfRSzfLfjh+nrdCy+rJWn9SRSY5fxBZvFrAmIsC6U
         HuYtllGumVIzlZ+Hpwlhrb5hlzzQM3CUjzo4RtIt9pxJLzjjYYbBJgqdP9VVBsb/3hQV
         AzJ/cpr7sGbMH9u1YTXC8/rdWX9V22gTAsvv5l6DFDr07IOw+i1C2sbB1DWUMWB8mKUM
         A+RdZifzWklRYauyJsXqoZY8o8WZFBPNskTwwdWEX5ImfAX7pyjEWvV0VBJ5648Qx6w+
         Y2vw==
X-Gm-Message-State: AFqh2kp/G8nq/V+rP649Xr07b8LcFQrd8c8nhRcnU7NnEK6UtG9w31rS
	yST1dy3mA+XhoKu6B/e6tPLCAjMbk3JiNXUpF758EA==
X-Google-Smtp-Source: AMrXdXsJwWU4HcZ0ttkKio4JaHJJSbPZOGjAHbTHYFDgTO/cM2PWqEi4xGlaisMMKBC3wfqhJbTK8DZ1ojrqQYw89Hk=
X-Received: by 2002:aa7:cd08:0:b0:46b:d3b3:669f with SMTP id
 b8-20020aa7cd08000000b0046bd3b3669fmr600122edw.414.1671722947063; Thu, 22 Dec
 2022 07:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-5-carlo.nonato@minervasys.tech> <Y3+MDElm8YQ7/2nS@perard.uk.xensource.com>
In-Reply-To: <Y3+MDElm8YQ7/2nS@perard.uk.xensource.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 22 Dec 2022 16:28:56 +0100
Message-ID: <CAG+AhRUfdnwCYkXw3TR=XrQOWQFt4FTdEsGvcE5kyAmwEyAaeg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] tools/xl: add support for cache coloring configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Anthony,

On Thu, Nov 24, 2022 at 4:21 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Sat, Oct 22, 2022 at 05:51:15PM +0200, Carlo Nonato wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b2901e04cf..5f53cec8bf 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2880,6 +2880,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
> >
> >  =back
> >
> > +=over 4
> > +
> > +=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>
>
> Instead of COLORS_RANGE, maybe NUMBER_RANGE? Or just RANGE?

RANGE seems good.

> > +Specify the LLC color configuration for the guest. B<COLORS_RANGE> can be either
> > +a single color value or a hypen-separated closed interval of colors
> > +(such as "0-4").
>
> Does "yellow-blue" works? Or "red-violet", to have a rainbow? :-)
>
> So, "colors" as the name of a new configuration option isn't going to
> work. To me, that would refer to VM managment, like maybe help to
> categorise VM in some kind of tools, and not a part of the configuration
> of the domain.
>
> Could you invent a name that is more specific? Maybe "cache_colors" or
> something, or "vcpu_cache_colors".

What about llc_colors? LLC stands for Last Level Cache and I'm trying to use
it everywhere else since it's what is really implemented (not any cache is
colored, just the last level) and it's shorter than cache_colors.

> > +=back
> > +
> >  =head3 x86
> >
> >  =over 4
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index b9dd2deedf..94c511912c 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -615,6 +615,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >      struct xs_permissions rwperm[1];
> >      struct xs_permissions noperm[1];
> >      xs_transaction_t t = 0;
> > +    DECLARE_HYPERCALL_BUFFER(unsigned int, colors);
> >
> >      /* convenience aliases */
> >      libxl_domain_create_info *info = &d_config->c_info;
> > @@ -676,6 +677,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >              goto out;
> >          }
> >
> > +        if (d_config->b_info.num_colors) {
> > +            size_t bytes = sizeof(unsigned int) * d_config->b_info.num_colors;
> > +            colors = xc_hypercall_buffer_alloc(ctx->xch, colors, bytes);
>
> Hypercall stuff is normally done in another library, libxenctrl (or
> maybe others like libxenguest). Is there a reason to do that here?

I moved this in xc_domain_create().

> > +            memcpy(colors, d_config->b_info.colors, bytes);
> > +            set_xen_guest_handle(create.arch.colors, colors);
> > +            create.arch.num_colors = d_config->b_info.num_colors;
> > +            create.arch.from_guest = 1;
>
> "arch" stuff is better dealt with in libxl__arch_domain_prepare_config().
> (unless it isn't arch specific in the next revision of the series)

Yes, removing arch specific parts is the current way of implementing it.

> > +            LOG(DEBUG, "Setup %u domain colors", d_config->b_info.num_colors);
>
>
>
> > +        }
> > +
> >          for (;;) {
> >              uint32_t local_domid;
> >              bool recent;
> > @@ -922,6 +933,7 @@ retry_transaction:
> >      rc = 0;
> >   out:
> >      if (t) xs_transaction_end(ctx->xsh, t, 1);
> > +    if (colors) xc_hypercall_buffer_free(ctx->xch, colors);
> >      return rc;
> >  }
> >
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index d634f304cd..642173af1a 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -557,6 +557,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >      ("ioports",          Array(libxl_ioport_range, "num_ioports")),
> >      ("irqs",             Array(uint32, "num_irqs")),
> >      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> > +    ("colors",           Array(uint32, "num_colors")),
>
> So the colors is added to arch specific config in
> xen_domctl_createdomain, maybe we should do the same here and move it to
> the "arch_arm" struct. Or if that is declared common in hypervisor, then
> it is file to leave it here.

Yes, it will be declared in common.

> Also, "colors" needs to be rename to something more specific.
>
> >      ("claim_mode",        libxl_defbool),
> >      ("event_channels",   uint32),
> >      ("kernel",           string),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index 1b5381cef0..e6b2c7acff 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
> >      XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
> >                     *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
> >      XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
> > -                   *mca_caps;
> > -    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
> > +                   *mca_caps, *colors;
> > +    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
> > +        num_colors;
>
> Please, add a new lines instead of increasing the number of declared
> variable on a single line.
>
> >      int pci_power_mgmt = 0;
> >      int pci_msitranslate = 0;
> >      int pci_permissive = 0;
> > @@ -1370,6 +1371,53 @@ void parse_config_data(const char *config_source,
> >      if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
> >          b_info->max_memkb = l * 1024;
> >
> > +    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
> > +        int k, p, cur_index = 0;
> > +
> > +        b_info->num_colors = 0;
> > +        /* Get number of colors based on ranges */
> > +        for (i = 0; i < num_colors; i++) {
> > +            uint32_t start = 0, end = 0;
> > +
> > +            buf = xlu_cfg_get_listitem(colors, i);
> > +            if (!buf) {
> > +                fprintf(stderr,
> > +                    "xl: Unable to get element %d in colors range list\n", i);
> > +                exit(1);
> > +            }
> > +
> > +            if (sscanf(buf, "%u-%u", &start, &end) != 2) {
> > +                if (sscanf(buf, "%u", &start) != 1) {
>
> I think you want %"SCNu32" instead of %u as both start and end are
> uint32_t.

Ok.

> > +                    fprintf(stderr, "xl: Invalid color range: %s\n", buf);
> > +                    exit(1);
> > +                }
> > +                end = start;
> > +            }
> > +            else if (start > end) {
>
> Can you put the "else" on the same line as "}" ?

Yep.

> > +                fprintf(stderr,
> > +                        "xl: Start color is greater than end color: %s\n", buf);
> > +                exit(1);
> > +            }
> > +
> > +            /* Check for overlaps */
> > +            for (k = start; k <= end; k++) {
> > +                for (p = 0; p < b_info->num_colors; p++) {
> > +                    if (b_info->colors[p] == k) {
> > +                        fprintf(stderr, "xl: Overlapped ranges not allowed\n");
>
> Why is that an issue? Could overlap just been ignored?

That requirement comes from the hypervisor. It assumes a sorted array without
repeated elements for simplicity. The hypervisor checks that again indeed
(it does that in v4, at least) so yes, it's a bit useless. I'll drop this.

> > +                        exit(1);
> > +                    }
> > +                }
> > +            }
> > +
> > +            b_info->num_colors += (end - start) + 1;
> > +            b_info->colors = (uint32_t *)realloc(b_info->colors,
> > +                                sizeof(*b_info->colors) * b_info->num_colors);
> > +
> > +            for (k = start; k <= end; k++)
> > +                b_info->colors[cur_index++] = k;
>
> This `b_info->colors` feels like it could be a bitmap like for "vcpus"
> or other config that deal with ranges.
>
> libxl has plenty of functions to deal with bitmap that xl can use,
> starting with libxl_bitmap_alloc(), maybe it would make dealing with
> cache color easier, like no need to check for overlaps, but there
> doesn't seems to be a function to deal with a growing bitmap so one
> would have to find the highest cache value before allocating the bitmap
> are deal with realloc.
>
> I guess using bitmap or not kind of depend of the interface with the
> hypervisor, if it take a list of number, then a list of number is fine
> here too.

I discarded bitmaps because it's not that easy to iterate over the index of
set bits and because they imposed, in the way we used them, a fixed number
of colors. At that time I wasn't really thinking of having a dynamic bitmap.
For now I will leave things as they are (using plain arrays) because it
would require other changes in the hypervisor, but this can be something
to do in the future, at least just for the passage of data between toolstack
and Xen.

> Thanks,
>
> --
> Anthony PERARD

Thank


On Thu, Nov 24, 2022 at 4:21 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Sat, Oct 22, 2022 at 05:51:15PM +0200, Carlo Nonato wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index b2901e04cf..5f53cec8bf 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2880,6 +2880,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
> >
> >  =back
> >
> > +=over 4
> > +
> > +=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>
>
> Instead of COLORS_RANGE, maybe NUMBER_RANGE? Or just RANGE?
>
> > +Specify the LLC color configuration for the guest. B<COLORS_RANGE> can be either
> > +a single color value or a hypen-separated closed interval of colors
> > +(such as "0-4").
>
> Does "yellow-blue" works? Or "red-violet", to have a rainbow? :-)
>
> So, "colors" as the name of a new configuration option isn't going to
> work. To me, that would refer to VM managment, like maybe help to
> categorise VM in some kind of tools, and not a part of the configuration
> of the domain.
>
> Could you invent a name that is more specific? Maybe "cache_colors" or
> something, or "vcpu_cache_colors".
>
> > +=back
> > +
> >  =head3 x86
> >
> >  =over 4
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index b9dd2deedf..94c511912c 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -615,6 +615,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >      struct xs_permissions rwperm[1];
> >      struct xs_permissions noperm[1];
> >      xs_transaction_t t = 0;
> > +    DECLARE_HYPERCALL_BUFFER(unsigned int, colors);
> >
> >      /* convenience aliases */
> >      libxl_domain_create_info *info = &d_config->c_info;
> > @@ -676,6 +677,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >              goto out;
> >          }
> >
> > +        if (d_config->b_info.num_colors) {
> > +            size_t bytes = sizeof(unsigned int) * d_config->b_info.num_colors;
> > +            colors = xc_hypercall_buffer_alloc(ctx->xch, colors, bytes);
>
> Hypercall stuff is normally done in another library, libxenctrl (or
> maybe others like libxenguest). Is there a reason to do that here?
>
> > +            memcpy(colors, d_config->b_info.colors, bytes);
> > +            set_xen_guest_handle(create.arch.colors, colors);
> > +            create.arch.num_colors = d_config->b_info.num_colors;
> > +            create.arch.from_guest = 1;
>
> "arch" stuff is better dealt with in libxl__arch_domain_prepare_config().
> (unless it isn't arch specific in the next revision of the series)
>
> > +            LOG(DEBUG, "Setup %u domain colors", d_config->b_info.num_colors);
>
>
>
> > +        }
> > +
> >          for (;;) {
> >              uint32_t local_domid;
> >              bool recent;
> > @@ -922,6 +933,7 @@ retry_transaction:
> >      rc = 0;
> >   out:
> >      if (t) xs_transaction_end(ctx->xsh, t, 1);
> > +    if (colors) xc_hypercall_buffer_free(ctx->xch, colors);
> >      return rc;
> >  }
> >
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index d634f304cd..642173af1a 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -557,6 +557,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >      ("ioports",          Array(libxl_ioport_range, "num_ioports")),
> >      ("irqs",             Array(uint32, "num_irqs")),
> >      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> > +    ("colors",           Array(uint32, "num_colors")),
>
> So the colors is added to arch specific config in
> xen_domctl_createdomain, maybe we should do the same here and move it to
> the "arch_arm" struct. Or if that is declared common in hypervisor, then
> it is file to leave it here.
>
> Also, "colors" needs to be rename to something more specific.
>
> >      ("claim_mode",        libxl_defbool),
> >      ("event_channels",   uint32),
> >      ("kernel",           string),
> > diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> > index 1b5381cef0..e6b2c7acff 100644
> > --- a/tools/xl/xl_parse.c
> > +++ b/tools/xl/xl_parse.c
> > @@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
> >      XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
> >                     *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
> >      XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
> > -                   *mca_caps;
> > -    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
> > +                   *mca_caps, *colors;
> > +    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
> > +        num_colors;
>
> Please, add a new lines instead of increasing the number of declared
> variable on a single line.
>
> >      int pci_power_mgmt = 0;
> >      int pci_msitranslate = 0;
> >      int pci_permissive = 0;
> > @@ -1370,6 +1371,53 @@ void parse_config_data(const char *config_source,
> >      if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
> >          b_info->max_memkb = l * 1024;
> >
> > +    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
> > +        int k, p, cur_index = 0;
> > +
> > +        b_info->num_colors = 0;
> > +        /* Get number of colors based on ranges */
> > +        for (i = 0; i < num_colors; i++) {
> > +            uint32_t start = 0, end = 0;
> > +
> > +            buf = xlu_cfg_get_listitem(colors, i);
> > +            if (!buf) {
> > +                fprintf(stderr,
> > +                    "xl: Unable to get element %d in colors range list\n", i);
> > +                exit(1);
> > +            }
> > +
> > +            if (sscanf(buf, "%u-%u", &start, &end) != 2) {
> > +                if (sscanf(buf, "%u", &start) != 1) {
>
> I think you want %"SCNu32" instead of %u as both start and end are
> uint32_t.
>
> > +                    fprintf(stderr, "xl: Invalid color range: %s\n", buf);
> > +                    exit(1);
> > +                }
> > +                end = start;
> > +            }
> > +            else if (start > end) {
>
> Can you put the "else" on the same line as "}" ?
> > +                fprintf(stderr,
> > +                        "xl: Start color is greater than end color: %s\n", buf);
> > +                exit(1);
> > +            }
> > +
> > +            /* Check for overlaps */
> > +            for (k = start; k <= end; k++) {
> > +                for (p = 0; p < b_info->num_colors; p++) {
> > +                    if (b_info->colors[p] == k) {
> > +                        fprintf(stderr, "xl: Overlapped ranges not allowed\n");
>
> Why is that an issue? Could overlap just been ignored?
>
> > +                        exit(1);
> > +                    }
> > +                }
> > +            }
> > +
> > +            b_info->num_colors += (end - start) + 1;
> > +            b_info->colors = (uint32_t *)realloc(b_info->colors,
> > +                                sizeof(*b_info->colors) * b_info->num_colors);
> > +
> > +            for (k = start; k <= end; k++)
> > +                b_info->colors[cur_index++] = k;
>
> This `b_info->colors` feels like it could be a bitmap like for "vcpus"
> or other config that deal with ranges.
>
> libxl has plenty of functions to deal with bitmap that xl can use,
> starting with libxl_bitmap_alloc(), maybe it would make dealing with
> cache color easier, like no need to check for overlaps, but there
> doesn't seems to be a function to deal with a growing bitmap so one
> would have to find the highest cache value before allocating the bitmap
> are deal with realloc.
>
> I guess using bitmap or not kind of depend of the interface with the
> hypervisor, if it take a list of number, then a list of number is fine
> here too.
>
>
> Thanks,
>
> --
> Anthony PERARD

