Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA897005DA
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 12:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533773.830692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQFs-0001mj-Tc; Fri, 12 May 2023 10:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533773.830692; Fri, 12 May 2023 10:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQFs-0001kH-QM; Fri, 12 May 2023 10:44:08 +0000
Received: by outflank-mailman (input) for mailman id 533773;
 Fri, 12 May 2023 10:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GX4r=BB=citrix.com=prvs=48968f2ef=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pxQFr-0001kB-3P
 for xen-devel@lists.xen.org; Fri, 12 May 2023 10:44:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c47ff8-f0b1-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 12:44:04 +0200 (CEST)
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
X-Inumbo-ID: e8c47ff8-f0b1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683888244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hz4U37AppMR36JTCO7x5tMz+33q6Ugp3iE+r7h2QfLY=;
  b=D2LFzzX6qhzqB3VcP77WnIQjYbfsJL0DpbGcjXhd5S4D5fIyeQaLT0AA
   hx6HwSzsNcENpI5vQc1vdU24TL2p2U9Bmw/48SW8NgV0SE5FOHuErQQR8
   dsD24QFGPcVAdPF1h/s56E+Y1Juw72uUJAKcvUoM0jKEgedudBwo8Ib+F
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108682800
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:d8G4HqyvEZQv4kFfAA96t+dnwSrEfRIJ4+MujC+fZmUNrF6WrkUPy
 2AZX2rQM/iMYjOhKtoiPYiypBsP6MLUnNJrHQNsqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPKoT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVgX3
 +I7AzMhVzuOvPu30IOHQ9E3hct2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzhjI/
 DKepwwVBDkVbIGR+yTa9Umhi8LljzL8CZgQDp+3o6sCbFq7mTVIVUx+uUGAiee4kEOlW5RcN
 kkd4AIqrK477kvtScPyNzWorXjBshMCVt54F+wh9BrL2qfSpQGDCQAsTDFbb8c9nNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaJykTJmIEeWkLUAoZ/97/iIUyiBvVSZBkCqHdpsbpAzjsx
 CvPoCUgr7ILyMoKzLmgu1TGhTu2od7OVAFdzgzTU3Lj5A5/YoOoT4ip71HB6rBHNonxZlyIo
 HgFltXY9OcPF5CAjgSJQeMEBrbv7PGAWBXbhVNsBIUw7DSF9HuqfIQW6zZ7TG9kKMcHPyTiY
 E7XvQJX67dXPX2jd6gxZJi+Y+wj1aX6HM7pfuzVZNFJJJN2cWe6EDpGPBDKmTq3yQ51zP95Y
 M3AGSqxMZoEIZ0+5iSVbOQx6JQm/Tk/1VLvTKigzBvyhNJye0WpYbsCNVKPaMUw46WFvBjZ/
 r5jCiea9/lMeLagO3eKqOb/OXhPdCFmXs6u96S7Y8bZemJb9Hcd5+g9KF/LU6hshOxrm+jB5
 RlRsWcImQOk1RUrxehnA02PiY8Dv74l9RrX3gR2Zz5EPkTPhq7xhJrzj7NtIdEaGBVLlJaYt
 cUtdcSaGehoQT/a4TkbZpSVhNU8JE/73lrUb3T8PWVXk3tcq+vhpLfZkvbHrnFSXkJbS+Nky
 1Ff6u8racVaHFkzZConQPmu00mwrRAgpQ6GZGOReoM7UBy1oOBXx9nZ0qdfzzckdU+SmVN3F
 m++XX8lmAU6i9ZrrYCZ3vza99vB/ikXNhMyIlQ3JI2ebUHylldPC6caOApUVVgxjF/JxZg=
IronPort-HdrOrdr: A9a23:u6/LXK/D4XnzVmvIvDtuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3AlJEz+GnEI/a3hBbfoa1r6fSYNFrXOUSE5mnzCEy?=
 =?us-ascii?q?UME1kc6SUWW6s8Zs/kMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/niYKQ1PxPS0WB6E0INSG6KrgjUj7PzzBnITzpI?=
 =?us-ascii?q?9tsSpHz5hPGaHji6VTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,269,1677560400"; 
   d="scan'208";a="108682800"
Date: Fri, 12 May 2023 11:43:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
 <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>

On Thu, May 11, 2023 at 01:20:43PM +0530, Viresh Kumar wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 24ac92718288..0405f6efe62a 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1619,6 +1619,18 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
>  Specifies the transport mechanism for the Virtio device, only "mmio" is
>  supported for now.
>  
> +=item B<grant_usage=STRING>
> +
> +Specifies the grant usage details for the Virtio device. This can be set to
> +following values:
> +
> +- "default": The default grant setting will be used, enable grants if
> +  backend-domid != 0.

I don't think this "default" setting is useful. We could just describe
what the default is when "grant_usage" setting is missing from the
configuration.

> +- "enabled": The grants are always enabled.
> +
> +- "disabled": The grants are always disabled.

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index c10292e0d7e3..17228817f9b7 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -283,6 +283,12 @@ libxl_virtio_transport = Enumeration("virtio_transport", [
>      (1, "MMIO"),
>      ])
>  
> +libxl_virtio_grant_usage = Enumeration("virtio_grant_usage", [
> +    (0, "DEFAULT"),
> +    (1, "DISABLED"),
> +    (2, "ENABLED"),

libxl already provide this type, it's call "libxl_defbool". It can be
set to "default", "false" or "true".



> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 97c80d7ed0fa..9cd7dbef0237 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1363,22 +1365,29 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                      iommu_needed = true;
>  
>                  FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> -                                           disk->backend_domid) );
> +                                           disk->backend_domid,
> +                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
>              }
>          }
>  
>          for (i = 0; i < d_config->num_virtios; i++) {
>              libxl_device_virtio *virtio = &d_config->virtios[i];
> +            bool use_grant = false;
>  
>              if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
>                  continue;
>  
> -            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +            if ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_ENABLED) ||
> +                ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_DEFAULT) &&
> +                 (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID))) {

I think libxl can select what the default value should be replace with
before we start to setup the guest. There's a *_setdefault() phase were
we set the correct value when a configuration value hasn't been set and
thus a default value is used. I think this can be done in
    libxl__device_virtio_setdefault().
After that, virtio->grant_usage will be true or false, and that's the
value that should be given to the virtio backend via xenstore.

> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index eadcb7124c3f..0a0fae967a0f 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -46,11 +46,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>                                        flexarray_t *ro_front)
>  {
>      const char *transport = libxl_virtio_transport_to_string(virtio->transport);
> +    const char *grant_usage = libxl_virtio_grant_usage_to_string(virtio->grant_usage);
>  
>      flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
>      flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>      flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
>      flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(back, "grant_usage", GCSPRINTF("%s", grant_usage));

Currently, this mean that we store "default" in this node. That mean
that both the virtio backend and libxl have to do computation in order
to figure out if "default" mean "true" or "false". And both have to find
the same result. I don't think this is necessary, and libxl can just
tell enabled or disable. This would be done in libxl before we run this
function. See previous comment on this patch.

Thanks,

-- 
Anthony PERARD

