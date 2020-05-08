Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99A1CB272
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:04:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4XP-0007LG-J6; Fri, 08 May 2020 15:03:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ij8=6W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jX4XO-0007LB-Kb
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:03:42 +0000
X-Inumbo-ID: 1984abce-913d-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1984abce-913d-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588950220;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FwIDSNXsGMfTsMPP+jwB/EU2ayOwIRuK6CAOtUnYjCw=;
 b=Fm03/03SoiT/9tCrZi3CKv6AgBsUJd4UxSU3KcMOzRr5a0uSzBmyv78b
 8jubL+wWTY+J1RDWF57tj5KwJBdbHE3pOvpJyAYoAoXNv/U2uWffUMRtG
 4MruiwObJdymjVgESvvVr2yxRc5iwH1IA2XTSzedwRbuHPceqoZ0Kd714 s=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: H5Im5vXfE0UWUo+Rvkj7MbX3sNPeEG/41REr6BiDqzjtfnFlTAI+f2B8AkJREXUV7eSAR9Qr1p
 QTCMHs0LrxObQNkqQwPau40VNUsGEzabdMBiKo10rVCAdE0dyxKa4c3L/qETv9770qf1dKiHYo
 l81eza+vmrVgDHBQ1TTay3mztpQNodMC9Xm3cOVwNv8mI+yyNyQ5SXFXrEy7OJgboRcacew90v
 Zuaf/rs4vkoLgLaHGrFbAjlHhUDJMxR/2DQWH8b9ISeMsTOKlgmXf6GoUJA2G6NZ2T/kfNM1Wy
 D+A=
X-SBRS: 2.7
X-MesageID: 17357810
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17357810"
Date: Fri, 8 May 2020 17:03:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
Message-ID: <20200508150312.GJ1353@Air-de-Roger>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 08, 2020 at 02:43:38PM +0200, Jan Beulich wrote:
> The op has a register/unregister flag, and hence registration shouldn't
> happen unilaterally. Introduce unregister_vpci_mmcfg_handler() to handle
> this case.
> 
> Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -558,6 +558,47 @@ int register_vpci_mmcfg_handler(struct d
>      return 0;
>  }
>  
> +int unregister_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
> +                                  unsigned int start_bus, unsigned int end_bus,
> +                                  unsigned int seg)
> +{
> +    struct hvm_mmcfg *mmcfg;
> +    int rc = -ENOENT;
> +
> +    ASSERT(is_hardware_domain(d));
> +
> +    if ( start_bus > end_bus )
> +        return -EINVAL;
> +
> +    write_lock(&d->arch.hvm.mmcfg_lock);
> +
> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> +        if ( mmcfg->addr == addr + (start_bus << 20) &&
> +             mmcfg->segment == seg &&
> +             mmcfg->start_bus == start_bus &&
> +             mmcfg->size == ((end_bus - start_bus + 1) << 20) )
> +        {
> +            list_del(&mmcfg->next);
> +            if ( !list_empty(&d->arch.hvm.mmcfg_regions) )
> +                xfree(mmcfg);
> +            else
> +            {
> +                /*
> +                 * Cannot unregister the MMIO handler - leave a fake entry
> +                 * on the list.
> +                 */
> +                memset(mmcfg, 0, sizeof(*mmcfg));
> +                list_add(&mmcfg->next, &d->arch.hvm.mmcfg_regions);

Instead of leaving this zombie entry around maybe we could add a
static bool in register_vpci_mmcfg_handler to signal whether the MMIO
intercept has been registered?

> +            }
> +            rc = 0;
> +            break;
> +        }
> +
> +    write_unlock(&d->arch.hvm.mmcfg_lock);
> +
> +    return rc;
> +}
> +
>  void destroy_vpci_mmcfg(struct domain *d)
>  {
>      struct list_head *mmcfg_regions = &d->arch.hvm.mmcfg_regions;
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -559,12 +559,18 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>          if ( !ret && has_vpci(currd) )
>          {
>              /*
> -             * For HVM (PVH) domains try to add the newly found MMCFG to the
> -             * domain.
> +             * For HVM (PVH) domains try to add/remove the reported MMCFG
> +             * to/from the domain.
>               */
> -            ret = register_vpci_mmcfg_handler(currd, info.address,
> -                                              info.start_bus, info.end_bus,
> -                                              info.segment);
> +            if ( info.flags & XEN_PCI_MMCFG_RESERVED )

Do you think you could also add a small note in physdev.h regarding
the fact that XEN_PCI_MMCFG_RESERVED is used to register a MMCFG
region, and not setting it would imply an unregister request?

It's not obvious to me from the name of the flag.

Thanks, Roger.

