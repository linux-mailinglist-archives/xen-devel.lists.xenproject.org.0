Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6AAC80D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 18:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000065.1380500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKg2z-0006IP-WA; Thu, 29 May 2025 16:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000065.1380500; Thu, 29 May 2025 16:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKg2z-0006GC-Sy; Thu, 29 May 2025 16:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1000065;
 Thu, 29 May 2025 16:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKg2z-0006G6-7X
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 16:24:01 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5384f927-3ca9-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 18:23:59 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso1213455e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 09:23:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85b35a9csm3164641fa.31.2025.05.29.09.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 09:23:58 -0700 (PDT)
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
X-Inumbo-ID: 5384f927-3ca9-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748535839; x=1749140639; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKVZ8hM5JL9F4sY2jyOFCDZ+62Qu1GrwyfvDaA5kM10=;
        b=JYvUh0/Q9WhpntmupqRU6ONlrBaA5pWoMH21YROGrc7S2gVHC/5hzGeuCaXhGpYnZg
         hfFz1pxU94frO8EsS4t42j9mVZVJ663TTfRvTWG6Mmdv8KKKb60zDIYpRvJlapzsCC4X
         nghFJCrgd1kl7XRhK/gPOZZP/rmSjvGreMNI7FgxgHt30FmwLduk3BZlol+YQ+oDHhe4
         7uUalDGZ5WWXnZIj78xsolmcwV3+Upj6O7IilnoHhB4y2lalXJ9C6zJuZwaCT6uU2onS
         7tflxaQ/wEO8tfxX7d4dZVYCK0bF3Q6v2qynM9zEl5JqGCx0qrTQT3pss0I2brGHECM1
         SJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748535839; x=1749140639;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKVZ8hM5JL9F4sY2jyOFCDZ+62Qu1GrwyfvDaA5kM10=;
        b=Uf7I1lVbmiZdUNIVXqtJbZNQYeK5p58AWm2sNEZUmWSG/n8j+iq/TbXQ8EhMz91X7S
         vqy4RDU3SWU0INxmTTwpxEsBSf7mIJ0hdBVrvJssTxx7+Q580TPWAlG5HL0tjb+5UUMM
         umGTlrBL7aufGTopoMFopyam8dRN6UOTdl8JZM6VZFQIzzYSOm+iLbSL3loxxqQCIbkC
         Nw3OFfbHBGbioqVHYUEgGdK/m5Vahrcphr6XWESvL0o91NqARSG1Rg5vFF0IiAKXJD3D
         Ownc16W690F2nzJzCCzMXtArDHYn5UdpMvEtNCk0Kjh3SAZhUl+8zuG+twZgJlI1+Fwi
         oHxA==
X-Gm-Message-State: AOJu0Yw69uP5Kx2Iz9ZP3xCl3Dxq0/jtpbreJ1w4ZRmnZE3UFjT6BcSc
	DAWHJFfHnxDWpSDfCDif8wIJAKVWbLAe2vPqHQATMLvPEt3izlikChQ+
X-Gm-Gg: ASbGncutCPUMxtpt8Aaen7g0yBq9Z+16xGgm9IteTS+2NJIfvs0MEfUUI2clNpF1LMB
	n5AXz6xGvyzpFu7pJeUobOGUnS222/KQIh51h4/a4+pyMBM5cjiZp80kki37B0Rv6fzjbOu2eNs
	ktyuAnpVvhY2KPoC8aHIiyOYW09Jn4ph6xA3tsl1xz99z5kpEwl00QlcrGSQee/fEeSm/iZQZW2
	BBO1GcmdkEa/jnmzwE0HdoW17VSIbmeDrsOjce9ZR8qq/4r4A5J5gItox8/GZ1XVQvib9BRPw+A
	Hrkem34OJ0323l5+z8Uq+hlyDl4ztBCZwxW0z8V3PAc8BFhvb2NhdUfc6iUAeqI/RXSSlLuG7xF
	it5Wm1PPJtvzUO/PQ/e08d08=
X-Google-Smtp-Source: AGHT+IH5310xo/6BN95Ny48JOPY+x8KYx47NMZ1mnhTFARZ7rLFIQvy0ro3E7hNYDXsjgLGmC8lDWQ==
X-Received: by 2002:a2e:ad90:0:b0:32a:8035:3f64 with SMTP id 38308e7fff4ca-32a8ce40d86mr2530711fa.33.1748535838995;
        Thu, 29 May 2025 09:23:58 -0700 (PDT)
Date: Thu, 29 May 2025 18:23:58 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Message-ID: <aDiKHvtbApmT9OmH@zapote>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
 <20250529155024.1284227-2-edgar.iglesias@gmail.com>
 <b77eb813-300a-4962-980e-02b236e2c5ca@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77eb813-300a-4962-980e-02b236e2c5ca@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Thu, May 29, 2025 at 04:59:21PM +0100, Julien Grall wrote:
> Hi Edgar,

Hi Julien,


> 
> On 29/05/2025 16:50, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add a per-domain way to optionally disable traps for accesses
> > to unmapped addresses.
> > 
> > The domain flag is general but it's only implemented for ARM for now.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >   tools/libs/light/libxl_arm.c  |  3 +++
> >   xen/arch/arm/dom0less-build.c |  3 +++
> >   xen/arch/arm/domain.c         |  3 ++-
> >   xen/arch/arm/domain_build.c   |  3 ++-
> >   xen/arch/arm/io.c             | 36 +++++++++++++++++++++++++++++++++--
> >   xen/common/domain.c           |  3 ++-
> >   xen/include/public/domctl.h   |  4 +++-
> 
> Looking at the changelog, I saw you removed the go bindings (although, they
> were in patch 3). But I don't quite understand why.

I got a little confused. The file tools/golang/xenlight/helpers.gen.go
has the following at the top:
// Code generated by gengotypes.py. DO NOT EDIT.
// source: libxl_types.idl


So I got the impression that we shouldn't be editing it.
Should I edit it manually? Or should I try to rerun gengotypes.py
to generate these bindings?


> 
> Also, I think you need to update the OCaml bindings.

I see, I'll have a look.

> 
> 
> >   7 files changed, 49 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index 75c811053c..9530996e72 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >           config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
> >       }
> > +    /* Trap accesses to unmapped areas. */
> > +    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> > +
> >       return 0;
> >   }
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index a49764f0ad..a4e0a33632 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
> >           panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
> >   #endif
> >       }
> > +
> > +    /* Trap accesses to unmapped areas. */
> > +    d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> >   }
> >   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 45aeb8bddc..be58a23dd7 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >       unsigned int max_vcpus;
> >       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> >       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> > -                                   XEN_DOMCTL_CDF_xs_domain );
> > +                                   XEN_DOMCTL_CDF_xs_domain |
> > +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
> >       unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
> >       if ( (config->flags & ~flags_optional) != flags_required )
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index b189a7cfae..7ff9c1b584 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2003,7 +2003,8 @@ void __init create_dom0(void)
> >   {
> >       struct domain *dom0;
> >       struct xen_domctl_createdomain dom0_cfg = {
> > -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> > +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> > +                 XEN_DOMCTL_CDF_trap_unmapped_accesses,
> >           .max_evtchn_port = -1,
> >           .max_grant_frames = gnttab_dom0_frames(),
> >           .max_maptrack_frames = -1,
> > diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> > index 5a4b0e8f25..adfc822e7e 100644
> > --- a/xen/arch/arm/io.c
> > +++ b/xen/arch/arm/io.c
> > @@ -21,6 +21,32 @@
> >   #include "decode.h"
> > +/* Handler for unmapped ranges. Writes ignored, reads return all ones.  */
> > +static int unmapped_read(struct vcpu *v, mmio_info_t *info, register_t *r,
> > +                         void *priv)
> > +{
> > +    uint64_t mask = GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0);
> 
> NIT: Looking at the other part of io.c, we are using GENMASK. Any reason to
> not use the same?

Looking closer at it now and no, there's no good reason. I'll change
to GENMASK in v3.


> 
> > +
> > +    /* Mask off upper bits.  */
> > +    *r = UINT64_MAX & mask;
> > +    return 1;
> > +}
> > +
> > +static int unmapped_write(struct vcpu *v, mmio_info_t *info, register_t r,
> > +                          void *priv)
> > +{
> > +    return 1;
> > +}
> > +
> > +static const struct mmio_handler_ops unmapped_ops = {
> > +    .read = unmapped_read,
> > +    .write = unmapped_write
> > +};
> > +
> > +static const struct mmio_handler unmapped_handler = {
> > +    .ops = &unmapped_ops
> > +};
> > +
> >   static enum io_state handle_read(const struct mmio_handler *handler,
> >                                    struct vcpu *v,
> >                                    mmio_info_t *info)
> > @@ -175,11 +201,17 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> >       handler = find_mmio_handler(v->domain, info->gpa);
> >       if ( !handler )
> >       {
> > +        bool trap_unmapped = v->domain->options &
> > +                                         XEN_DOMCTL_CDF_trap_unmapped_accesses;
> >           rc = try_fwd_ioserv(regs, v, info);
> >           if ( rc == IO_HANDLED )
> >               return handle_ioserv(regs, v);
> > -
> > -        return rc;
> > +        else if ( rc == IO_UNHANDLED && !trap_unmapped )
> > +        {
> > +            /* Fallback to the unmapped handler. */
> > +            handler = &unmapped_handler;
> > +        } else
> 
> Style:
> 
> else if ( ... )
> {
> }
> else
> {
> }

Will fix for v3.

Thanks,
Edgar


> 
> > +            return rc;
> >       }
> >       /*
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index abf1969e60..ac4f58f638 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
> >            ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> >              XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
> >              XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> > -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> > +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> > +           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
> >       {
> >           dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
> >           return -EINVAL;
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 5b2063eed9..be19ab5e26 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
> >   #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> >   /* Should we expose the vPMU to the guest? */
> >   #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> > +/* Should we trap guest accesses to unmapped addresses? */
> > +#define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
> >   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> > -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
> > +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
> >       uint32_t flags;
> 
> -- 
> Julien Grall
> 

