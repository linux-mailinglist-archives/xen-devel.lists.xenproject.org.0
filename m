Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33934984F3B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 02:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803398.1213944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFRs-0001k5-Ck; Wed, 25 Sep 2024 00:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803398.1213944; Wed, 25 Sep 2024 00:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFRs-0001fm-84; Wed, 25 Sep 2024 00:00:04 +0000
Received: by outflank-mailman (input) for mailman id 803398;
 Wed, 25 Sep 2024 00:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYkR=QX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stFRq-0001Oe-Vx
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 00:00:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c3d4991-7ad1-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 02:00:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CAA58A428E4;
 Tue, 24 Sep 2024 23:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666DFC4CEC4;
 Tue, 24 Sep 2024 23:59:59 +0000 (UTC)
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
X-Inumbo-ID: 1c3d4991-7ad1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727222400;
	bh=+gnXlRITvcCyzwFp7S8vs3IZWHPHRexfgSClkD+TtKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BOhaFHXVbfnqt/s0OsasDwn+8afC9xnQzaVvjf038OOBQ1IYEoryGRaec3INSCSku
	 H48LkkPE3nrKEPCDQS4vy/Ll/3BrXc6r8UqZnH5sasrvV/osgUhDX4d9ME28cEY4kD
	 8bUJkOxhBoAHmWM+m4RVQQsrCvb3TbEkI3tMfHhZhiQC2bn7tAfzQMN0vtevS6tmTU
	 fBHCo/qexI75ueOnP7a0WY4CXqmhWos2WXsw/SyRDwKtZd4HdmkuuRWhH5cUsvaUzO
	 pxbcTOpelLjUDQouvGnrnROnKJqvpMG3HRL/6qRTJ7x0/MOKB+zknJXt3ejRb8o5DE
	 FFTnG12TKtJ4A==
Date: Tue, 24 Sep 2024 16:59:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 4/6] xen/arm: io: Add support for mmio background
 regions
In-Reply-To: <20240924162359.1390487-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241659510.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-5-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add support for mmio background regions. These regions
> can be overlayed by IOREQ handlers and thus act as
> fallback handlers while IOREQ clients haven't registered.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/mmio.h | 11 ++++++++++-
>  xen/arch/arm/io.c               | 18 ++++++++++++------
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index b22cfdac5b..7da542cd79 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -70,6 +70,7 @@ struct mmio_handler_ops {
>  struct mmio_handler {
>      paddr_t addr;
>      paddr_t size;
> +    bool background;
>      const struct mmio_handler_ops *ops;
>      void *priv;
>  };
> @@ -83,9 +84,17 @@ struct vmmio {
>  
>  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>                                mmio_info_t *info);
> +void register_mmio_bg_handler(struct domain *d,
> +                              bool background,
> +                              const struct mmio_handler_ops *ops,
> +                              paddr_t addr, paddr_t size, void *priv);
> +static inline
>  void register_mmio_handler(struct domain *d,
>                             const struct mmio_handler_ops *ops,
> -                           paddr_t addr, paddr_t size, void *priv);
> +                           paddr_t addr, paddr_t size, void *priv)
> +{
> +    register_mmio_bg_handler(d, false, ops, addr, size, priv);
> +}
>  int domain_io_init(struct domain *d, unsigned int max_count);
>  void domain_io_free(struct domain *d);
>  
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 96c740d563..934a2ad2b9 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -159,6 +159,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>  {
>      struct vcpu *v = current;
>      const struct mmio_handler *handler = NULL;
> +    bool has_background;
>      int rc;
>  
>      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> @@ -170,13 +171,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>      }
>  
>      handler = find_mmio_handler(v->domain, info->gpa);
> -    if ( !handler )
> +    has_background = handler && handler->background;
> +    if ( !handler || has_background )
>      {
>          rc = try_fwd_ioserv(regs, v, info);
>          if ( rc == IO_HANDLED )
>              return handle_ioserv(regs, v);
> -
> -        return rc;
> +        else if ( !(rc == IO_UNHANDLED && has_background) ) {
> +            /* Only return failure if there's no background handler.  */
> +            return rc;
> +        }
>      }
>  
>      /*
> @@ -197,9 +201,10 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          return handle_read(handler, v, info);
>  }
>  
> -void register_mmio_handler(struct domain *d,
> -                           const struct mmio_handler_ops *ops,
> -                           paddr_t addr, paddr_t size, void *priv)
> +void register_mmio_bg_handler(struct domain *d,
> +                              bool background,
> +                              const struct mmio_handler_ops *ops,
> +                              paddr_t addr, paddr_t size, void *priv)
>  {
>      struct vmmio *vmmio = &d->arch.vmmio;
>      struct mmio_handler *handler;
> @@ -213,6 +218,7 @@ void register_mmio_handler(struct domain *d,
>      handler->ops = ops;
>      handler->addr = addr;
>      handler->size = size;
> +    handler->background = background;
>      handler->priv = priv;
>  
>      vmmio->num_entries++;
> -- 
> 2.43.0
> 

