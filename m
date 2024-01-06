Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D2C825D90
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jan 2024 02:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662411.1032514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvBP-0004TF-Dv; Sat, 06 Jan 2024 01:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662411.1032514; Sat, 06 Jan 2024 01:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLvBP-0004RC-B5; Sat, 06 Jan 2024 01:09:03 +0000
Received: by outflank-mailman (input) for mailman id 662411;
 Sat, 06 Jan 2024 01:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLvBN-0004R6-Gb
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2024 01:09:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a9f5ee9-ac30-11ee-9b0f-b553b5be7939;
 Sat, 06 Jan 2024 02:08:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C30F6CE202D;
 Sat,  6 Jan 2024 01:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED018C433C8;
 Sat,  6 Jan 2024 01:08:52 +0000 (UTC)
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
X-Inumbo-ID: 2a9f5ee9-ac30-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704503334;
	bh=NfVZjfWzs8nDOd9iio1oKnFbEtq/60amzNF7MWOYcM4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZXjHYLI9ogABKfGjalClEsedmCckAO4vdhqWoYXDbGuNj5lVELgfkdFvF9j6CCm5O
	 7xpekBgoN+ZdMKC6yyHuawmhSydbAPvEOXmgZgsHlxam+KL7R8Rzdwo5YWXqoVJSvn
	 yZDWngJaeXzYvPs8Gkm1wet/b+nbQ/PtKqV8kiU9HVyKXGtnvywFc5UPABPGgUM9+o
	 Lj/0tDo83Sv1BpcsYQFD5T9o9O16fV9RxJW1fq4jDfp08YM1JW8uMzgi6B4GvV70tp
	 YmIJEbVdiT9lco+9alOawqy3OBnz0//p1oN6VpUSua+F1gY6END55QEwXO82yApotz
	 SQOoBTv5bQWEA==
Date: Fri, 5 Jan 2024 17:08:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiqian Chen <Jiqian.Chen@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Huang Rui <Ray.Huang@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
In-Reply-To: <20240105070920.350113-5-Jiqian.Chen@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com> <20240105070920.350113-5-Jiqian.Chen@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jan 2024, Jiqian Chen wrote:
> Some type of domain don't have PIRQ, like PVH, current
> implementation is not suitable for those domain.
> 
> When passthrough a device to guest on PVH dom0, this
> pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
> at domain_pirq_to_irq.
> 
> So, change it to use gsi to grant/revoke irq permission.
> And change the caller of XEN_DOMCTL_irq_permission to
> pass gsi to it instead of pirq.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

I realize there is no explanation or comment right now, but I think this
change would benefit from a in-code comment in xen/include/public/domctl.h
E.g.:

/* XEN_DOMCTL_irq_permission */
struct xen_domctl_irq_permission {
    uint32_t pirq;           /* pirq is the GSI on x86 */
    uint8_t allow_access;    /* flag to specify enable/disable of IRQ access */
    uint8_t pad[3];
};


> ---
>  tools/libs/light/libxl_pci.c |  6 ++++--
>  tools/libs/light/libxl_x86.c |  5 ++++-
>  xen/common/domctl.c          | 12 ++++++++++--
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..e1341d1e9850 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>      unsigned long long start, end, flags, size;
>      int irq, i;
>      int r;
> +    int gsi;
>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>      uint32_t domainid = domid;
>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        gsi = irq;

A question for Roger and Jan: are we always guaranteed that gsi == irq
(also in the PV case)?

Also I don't think we necessarily need the gsi local variable, I would
just add an in-code comment below...


>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>          if (r < 0) {
>              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> @@ -1494,10 +1496,10 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc = ERROR_FAIL;
>              goto out;
>          }

... like this:

/* xc_domain_irq_permission takes a gsi, here we assume irq == gsi */
r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);


> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +        r = xc_domain_irq_permission(ctx->xch, domid, gsi, 1);
>          if (r < 0) {
>              LOGED(ERROR, domainid,
> -                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> +                  "xc_domain_irq_permission irq=%d (error=%d)", gsi, r);
>              fclose(f);
>              rc = ERROR_FAIL;
>              goto out;
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index d16573e72cd4..88ad50cf6360 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -654,12 +654,15 @@ out:
>  int libxl__arch_domain_map_irq(libxl__gc *gc, uint32_t domid, int irq)

you could just rename the int irq parameter to int gsi ?


>  {
>      int ret;
> +    int gsi;
> +
> +    gsi = irq;
>  
>      ret = xc_physdev_map_pirq(CTX->xch, domid, irq, &irq);
>      if (ret)
>          return ret;
>  
> -    ret = xc_domain_irq_permission(CTX->xch, domid, irq, 1);
> +    ret = xc_domain_irq_permission(CTX->xch, domid, gsi, 1);
>      return ret;
>  }
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f5a71ee5f78d..eeb975bd0194 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -653,12 +653,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          unsigned int pirq = op->u.irq_permission.pirq, irq;
>          int allow = op->u.irq_permission.allow_access;

here we could benefit from renaming pirq to gsi, at least it becomes
clear:

unsigned int gsi = op->u.irq_permission.pirq, irq;


> -        if ( pirq >= current->domain->nr_pirqs )
> +        if ( pirq >= nr_irqs_gsi )
>          {
>              ret = -EINVAL;
>              break;
>          }
> -        irq = pirq_access_permitted(current->domain, pirq);
> +
> +        if ( irq_access_permitted(current->domain, pirq) )
> +            irq = pirq;
> +        else
> +        {
> +            ret = -EPERM;
> +            break;
> +        }
> +
>          if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
>              ret = -EPERM;
>          else if ( allow )
> -- 
> 2.34.1
> 

