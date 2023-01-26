Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E067CD95
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 15:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485059.752006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL38o-00040U-Q7; Thu, 26 Jan 2023 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485059.752006; Thu, 26 Jan 2023 14:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL38o-0003xy-Lt; Thu, 26 Jan 2023 14:22:14 +0000
Received: by outflank-mailman (input) for mailman id 485059;
 Thu, 26 Jan 2023 14:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaYt=5X=citrix.com=prvs=383a151c9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pL38m-0003xs-O8
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 14:22:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2887b0-9d84-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 15:22:03 +0100 (CET)
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
X-Inumbo-ID: cd2887b0-9d84-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674742929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sVjI5Dn1EMQCairDjw6V7ktUOG7PPoBlg5eLRMuJWnM=;
  b=ZUtw0fBIFpWE3FyPvZPNuX1+4J4qWB24srfubEWLdqiBLggW0YcIOcdz
   CP3+KzqknhyBjo+3ip+oJKjA7PcbgfRZFisBfFvqxc8Dg80DjiP81+E7F
   ZgQ0Vra4YcmvIUOmwLeBXCulT++e8OAVBeAFiNXgGC1eGzVqTGFML2Vu1
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94762590
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qEkGLqK3OpvFu0lPFE+RMpUlxSXFcZb7ZxGr2PjKsXjdYENSgWYOz
 jEdXz2BaPeJNDD3KthzO9nk9R4PsZHWn9Y3GwBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wZgPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c55E0wV0
 q0VCAsvdzeDmcuWmq24dPdz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGZoLxBvJ/
 goq+UzeJwsRLtCyxgOf406u38/Ck3nhSZMNQejQGvlC3wTImz175ActfVm0u/6ikWalRslSb
 UcT/0IGqKEo/0vtVd75XhCioVaBvxgRQcRZCPwhrh2Awaq8yw+BC3INVDJpdN0sv8hwTjsvv
 neClsntAnppt7ucVXW187aSoCmsMDMENikeaCQEJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pdEP/7W2+xbAmT3Em3TSZldrvEONBDvjt14nItf/PORE9GQ3895OPqvCaQiMn
 EMmgu+e8skuV46OqjKSFbBl8K6S296JNzjVgFhKFpYn9iiw93PLQb288A2SN28ybJ9aJGaBj
 Fv7/FoIucQNZCfCgbpfOdrZNig88UT3+T0JvNjwZ8EGXJV+fRTvEMpGNR/JhDCFfKTBfMgC1
 XannSSEVy5y5UdPlmDeqwIhPVgDmEgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZTWlUoGDLKhPHGLmWL2EbzsBSJjbXwRg5UHHtNv3yI8QD1xYxMv6exJl3NZc1R9yb6To
 yDVtr5ww1vjn3zXQThmmVg6AI4Dqa1X9CphVQR1ZAbA5pTWSdr3hEvpX8dtLOZPGS0K5aIcc
 sTpjO3ZUqwSEGmZo29BBXQ/xaQ7HCmWacu1F3LNSFACk1RIHmQlJveMktPTyRQz
IronPort-HdrOrdr: A9a23:7joQ56mVd68Hz6agu0E+rrCMl6rpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.97,248,1669093200"; 
   d="scan'208";a="94762590"
Date: Thu, 26 Jan 2023 14:22:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH v4 05/11] tools: add support for cache coloring
 configuration
Message-ID: <Y9KMio62otVChUcq@perard.uk.xensource.com>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-6-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230123154735.74832-6-carlo.nonato@minervasys.tech>

On Mon, Jan 23, 2023 at 04:47:29PM +0100, Carlo Nonato wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index e939d07157..064f54c349 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -28,6 +28,20 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
>  {
>      int err;
>      DECLARE_DOMCTL;
> +    DECLARE_HYPERCALL_BUFFER(uint32_t, llc_colors);
> +
> +    if ( config->num_llc_colors )
> +    {
> +        size_t bytes = sizeof(uint32_t) * config->num_llc_colors;
> +
> +        llc_colors = xc_hypercall_buffer_alloc(xch, llc_colors, bytes);
> +        if ( llc_colors == NULL ) {
> +            PERROR("Could not allocate LLC colors for xc_domain_create");
> +            return -ENOMEM;
> +        }
> +        memcpy(llc_colors, config->llc_colors.p, bytes);
> +        set_xen_guest_handle(config->llc_colors, llc_colors);

I think this two lines looks wrong. There is a double usage of
config->llc_colors, to both store a user pointer and then to store an
hypercall buffer. Also, accessing llc_colors.p field is probably wrong.
I guess the caller of xc_domain_create() (that is libxl) will have to
take care of the hypercall buffer. It is already filling the
xen_domctl_createdomain struct that is passed to the hypercall, so it's
probably fine to handle hypercall buffer which is part of it.

What happen in the hypervisor when both num_llc_colors and llc_colors
are set to 0 in the struct xen_domctl_createdomain? Is it fine? That is
to figure out if all users of xc_domain_create() needs to be updated.

Also, ocaml binding is "broken", or at least needs updating. This is due
to the addition of llc_colors into xen_domctl_createdomain, the size
been different than the expected size.


> +    }
>  
>      domctl.cmd = XEN_DOMCTL_createdomain;
>      domctl.domain = *pdomid;
> @@ -39,6 +53,9 @@ int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
>      *pdomid = (uint16_t)domctl.domain;
>      *config = domctl.u.createdomain;
>  
> +    if ( llc_colors )
> +        xc_hypercall_buffer_free(xch, llc_colors);
> +
>      return 0;
>  }
>  
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index beec3f6b6f..6d0c768241 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -638,6 +638,8 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
>              .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
>              .cpupool_id = info->poolid,
> +            .num_llc_colors = b_info->num_llc_colors,
> +            .llc_colors.p = b_info->llc_colors,
>          };
>  
>          if (info->type != LIBXL_DOMAIN_TYPE_PV) {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 0cfad8508d..1f944ca6d7 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -562,6 +562,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("ioports",          Array(libxl_ioport_range, "num_ioports")),
>      ("irqs",             Array(uint32, "num_irqs")),
>      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> +    ("llc_colors",       Array(uint32, "num_llc_colors")),

For this, you are going to need to add a LIBXL_HAVE_ macro in libxl.h.
They are plenty of example as well as an explanation.
But a good name I guess would be LIBXL_HAVE_BUILDINFO_LLC_COLORS along
with a short comment.

>      ("claim_mode",	     libxl_defbool),
>      ("event_channels",   uint32),
>      ("kernel",           string),


Thanks,

-- 
Anthony PERARD

