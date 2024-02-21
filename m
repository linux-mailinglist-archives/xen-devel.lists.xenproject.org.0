Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0EE85E072
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 16:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684072.1063749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rco7q-0002nx-6N; Wed, 21 Feb 2024 15:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684072.1063749; Wed, 21 Feb 2024 15:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rco7q-0002m3-3f; Wed, 21 Feb 2024 15:03:10 +0000
Received: by outflank-mailman (input) for mailman id 684072;
 Wed, 21 Feb 2024 15:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rco7o-0002lx-Fr
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 15:03:08 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 514c7ce0-d0ca-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 16:03:06 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33d2710f3acso3165235f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 07:03:06 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfe902000000b0033cf24700e5sm17073229wrm.39.2024.02.21.07.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 07:03:05 -0800 (PST)
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
X-Inumbo-ID: 514c7ce0-d0ca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708527786; x=1709132586; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0lmC0kXh+qRlgHgi5grcPHTJtMDtOQOJnj+ljZmAjw=;
        b=L2GYW2dPSGqWheK36CgnVbnod5LX4HRiLeizprMLpdkHJO+E6xFuWUmCyENWXavSw1
         MiIoju7KY9v42DcUD1r7gS30cFPgJq70x76fNfFMq4JpAqFivmz4MaqQQImPOMY6pnP2
         pETnuCs6eTpcN5UYAnrYIdOziWcLKt2JW6fBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708527786; x=1709132586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0lmC0kXh+qRlgHgi5grcPHTJtMDtOQOJnj+ljZmAjw=;
        b=LSZapRPbPpS1a97FhnTyKa0+AZ+w4xxwZ0SRBGvKW9Cmg8mHGCZYkswPTrORAkbnj/
         SJrv7/lBmGVIWbm898naPVEElgTh+7AoJkC3HK2F+zz+v+jR1K6t+CQWCipC7PLnFquN
         wmuvRy4433sMJ6YZKHzFcFLPNwSoqPbGmtFLnfC5xVSQ53nagdQxuWMvYlRsywTQNEp2
         9rhwgAMufK0N6Q8psnbWTqbLxbetkTPrW0wa9wXbT7MUCBaypvnW2ockfT59/g+IZoVP
         nXFDqp5pQ1yPDt3H3Wwa7g2RIR5Ws6Uy8Q73GweV3D0qucrUWgd6EASPYWqVTwJhdAUF
         dh2Q==
X-Gm-Message-State: AOJu0YyUnME9npBSYCWssGArY7EmXcWRjlpW1atZ5kAv35Ne7tedJgo9
	i++Ua8z9fKGE+jks7IcCzzs85a3likA7k061+pgNuGbv0IbwJs388COAgNF1PjY=
X-Google-Smtp-Source: AGHT+IH+UwhX1wSEGNJtpA8AZncuYndy8Qb1tQLKki7gTlFDMwq/oKN9wZ+VOIdTiJW/bMsAwzv6Mw==
X-Received: by 2002:a5d:4404:0:b0:33d:e27:f053 with SMTP id z4-20020a5d4404000000b0033d0e27f053mr14120345wrq.6.1708527785596;
        Wed, 21 Feb 2024 07:03:05 -0800 (PST)
Date: Wed, 21 Feb 2024 15:03:04 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Message-ID: <09290ba4-6915-4f0d-8e16-3e14713d02ba@perard>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112061317.418658-6-Jiqian.Chen@amd.com>

On Fri, Jan 12, 2024 at 02:13:17PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index f2d9d14b4d9f..448ba2c59ae1 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_domain_gsi_permission(xc_interface *xch,
> +                             uint32_t domid,
> +                             uint32_t gsi,
> +                             bool allow_access)
> +{
> +    struct xen_domctl domctl = {};
> +
> +    domctl.cmd = XEN_DOMCTL_gsi_permission;
> +    domctl.domain = domid;
> +    domctl.u.gsi_permission.gsi = gsi;
> +    domctl.u.gsi_permission.allow_access = allow_access;

This could be written as:
    struct xen_domctl domctl = {
        .cmd = XEN_DOMCTL_gsi_permission,
        .domain = domid,
        .u.gsi_permission.gsi = gsi,
        .u.gsi_permission.allow_access = allow_access,
    };

but your change is fine too.


> +
> +    return do_domctl(xch, &domctl);
> +}
> +
>  int xc_domain_iomem_permission(xc_interface *xch,
>                                 uint32_t domid,
>                                 unsigned long first_mfn,
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index a1c6e82631e9..4136a860a048 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1421,6 +1421,8 @@ static void pci_add_dm_done(libxl__egc *egc,
>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>      uint32_t domainid = domid;
>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> +    int gsi;
> +    bool has_gsi = true;

Why is this function has "gsi" variable, and "gsi = irq" but the next
function pci_remove_detached() does only have "irq" variable?

So, gsi can only be positive integer, right? Could we forgo `has_gsi` and
just set "gsi = -1" when there's no gsi?

>      /* Convenience aliases */
>      bool starting = pas->starting;
> @@ -1482,6 +1484,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>                                  pci->bus, pci->dev, pci->func);
>  
>      if ( access(sysfs_path, F_OK) != 0 ) {
> +        has_gsi = false;
>          if ( errno == ENOENT )
>              sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
> @@ -1497,6 +1500,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        gsi = irq;

Why do you do this, that that mean that `gsi` and `irq` are the same? Or
does `irq` happen to sometime contain a `gsi` value?

>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>          if (r < 0) {
>              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> @@ -1505,7 +1509,10 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc = ERROR_FAIL;
>              goto out;
>          }
> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +        if ( has_gsi )
> +            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
> +        if ( !has_gsi || r == -EOPNOTSUPP )
> +            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>          if (r < 0) {
>              LOGED(ERROR, domainid,
>                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);

Looks like this error message could be wrong, I think we want to know if
which call between xc_domain_irq_permission() and
xc_domain_gsi_permission() has failed.

> @@ -2185,6 +2192,7 @@ static void pci_remove_detached(libxl__egc *egc,
>      FILE *f;
>      uint32_t domainid = prs->domid;
>      bool isstubdom;
> +    bool has_gsi = true;
>  
>      /* Convenience aliases */
>      libxl_device_pci *const pci = &prs->pci;
> @@ -2244,6 +2252,7 @@ skip_bar:
>                             pci->bus, pci->dev, pci->func);
>  
>      if ( access(sysfs_path, F_OK) != 0 ) {
> +        has_gsi = false;
>          if ( errno == ENOENT )
>              sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
> @@ -2270,7 +2279,10 @@ skip_bar:
>               */
>              LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
>          }
> -        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
> +        if ( has_gsi )
> +            rc = xc_domain_gsi_permission(ctx->xch, domid, irq, 0);

Why do you use the xc_domain_gsi_permission() with "irq" here, but not
in pci_add_dm_done() ?

> +        if ( !has_gsi || rc == -EOPNOTSUPP )
> +            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
>          if (rc < 0) {
>              LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
>          }


These changes to libxl are quite confusing, there's a mixed up between
"gsi" and "irq", it's hard to follow.

Thanks,

-- 
Anthony PERARD

