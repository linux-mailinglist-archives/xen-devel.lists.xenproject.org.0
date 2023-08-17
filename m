Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC791780169
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 00:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585659.916832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWlwP-0000AI-LF; Thu, 17 Aug 2023 22:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585659.916832; Thu, 17 Aug 2023 22:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWlwP-00006y-I4; Thu, 17 Aug 2023 22:58:09 +0000
Received: by outflank-mailman (input) for mailman id 585659;
 Thu, 17 Aug 2023 22:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWlwN-00006n-La
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 22:58:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84617a81-3d51-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 00:58:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FC3A617D5;
 Thu, 17 Aug 2023 22:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8207DC433C8;
 Thu, 17 Aug 2023 22:57:59 +0000 (UTC)
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
X-Inumbo-ID: 84617a81-3d51-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692313080;
	bh=9pWg9ZAP3oO595t4vbf2cp6nnRkMPEXuRJfNRTj+eEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X2A7oPYvYOqMezcnRMECw4YWk6tSmxrCO+eEQMQVwUh7haxhiayFWbcH0aaRJ4F7t
	 XEmQfojvgYE2Ss5pkZnyviJrs0RQL8O57qD5+Xj3zuxySQzivy0iE3u38OWqs4YTYH
	 5Y6ntHLd3fXHoTKyXsmKbe5YBccw/AdJSV7WVTqMShVG4gSGiWlrq/MUohpQNklJw1
	 Jd6ugHJWV6D4GlJHBQFknP963brSttUK+U4733eeLPhiyXLXOYuEGV4MXepz1Ue7Rv
	 2cVAbYA1ExnJuSeGSOEF3ZYDNcTFXQNlvLgmStJKKh9FUx1ta8iS60sx9n+gp2j50Y
	 JTDD/IhcLyDNA==
Date: Thu, 17 Aug 2023 15:57:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    roberto.bagnara@bugseng.com
Subject: Re: [PATCH 1/3] xen/arm: vmmio: The number of entries cannot be
 negative
In-Reply-To: <20230817214356.47174-2-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308171557230.6458@ubuntu-linux-20-04-desktop>
References: <20230817214356.47174-1-julien@xen.org> <20230817214356.47174-2-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The number of virtual MMIO regions cannot be negative. So switch
> the field 'num_entries' and 'max_num_entries' to 'unsigned int'.
> 
> The new type is then propagated to the caller and the vGIC
> code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain.c           | 3 ++-
>  xen/arch/arm/include/asm/mmio.h | 6 +++---
>  xen/arch/arm/include/asm/vgic.h | 6 +++---
>  xen/arch/arm/io.c               | 2 +-
>  xen/arch/arm/vgic-v2.c          | 2 +-
>  xen/arch/arm/vgic-v3.c          | 2 +-
>  xen/arch/arm/vgic.c             | 2 +-
>  xen/arch/arm/vgic/vgic-init.c   | 2 +-
>  8 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 6113ca785c78..28e3aaa5e482 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -694,7 +694,8 @@ int arch_domain_create(struct domain *d,
>                         struct xen_domctl_createdomain *config,
>                         unsigned int flags)
>  {
> -    int rc, count = 0;
> +    unsigned int count = 0;
> +    int rc;
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>  
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 79e64d9af804..b22cfdac5be9 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -75,8 +75,8 @@ struct mmio_handler {
>  };
>  
>  struct vmmio {
> -    int num_entries;
> -    int max_num_entries;
> +    unsigned int num_entries;
> +    unsigned int max_num_entries;
>      rwlock_t lock;
>      struct mmio_handler *handlers;
>  };
> @@ -86,7 +86,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>  void register_mmio_handler(struct domain *d,
>                             const struct mmio_handler_ops *ops,
>                             paddr_t addr, paddr_t size, void *priv);
> -int domain_io_init(struct domain *d, int max_count);
> +int domain_io_init(struct domain *d, unsigned int max_count);
>  void domain_io_free(struct domain *d);
>  
>  void try_decode_instruction(const struct cpu_user_regs *regs,
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index aa9f49409edc..6901a05c0669 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -304,8 +304,8 @@ extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
>  extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
>                                    unsigned int rank);
>  extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
> -int vgic_v2_init(struct domain *d, int *mmio_count);
> -int vgic_v3_init(struct domain *d, int *mmio_count);
> +int vgic_v2_init(struct domain *d, unsigned int *mmio_count);
> +int vgic_v3_init(struct domain *d, unsigned int *mmio_count);
>  
>  extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
>                          enum gic_sgi_mode irqmode, int virq,
> @@ -352,7 +352,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
>  
>  bool vgic_evtchn_irq_pending(struct vcpu *v);
>  
> -int domain_vgic_register(struct domain *d, int *mmio_count);
> +int domain_vgic_register(struct domain *d, unsigned int *mmio_count);
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis);
>  void domain_vgic_free(struct domain *d);
>  int vcpu_vgic_init(struct vcpu *v);
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 172583df047f..96c740d5636c 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -224,7 +224,7 @@ void register_mmio_handler(struct domain *d,
>      write_unlock(&vmmio->lock);
>  }
>  
> -int domain_io_init(struct domain *d, int max_count)
> +int domain_io_init(struct domain *d, unsigned int max_count)
>  {
>      rwlock_init(&d->arch.vmmio.lock);
>      d->arch.vmmio.num_entries = 0;
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 35363fee098c..2a2eda2e6f4c 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -731,7 +731,7 @@ static const struct vgic_ops vgic_v2_ops = {
>      .lpi_get_priority = vgic_v2_lpi_get_priority,
>  };
>  
> -int vgic_v2_init(struct domain *d, int *mmio_count)
> +int vgic_v2_init(struct domain *d, unsigned int *mmio_count)
>  {
>      if ( !vgic_v2_hw.enabled )
>      {
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 1b7173da1e30..05a009409ab8 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1812,7 +1812,7 @@ static const struct vgic_ops v3_ops = {
>      .lpi_get_priority = vgic_v3_lpi_get_priority,
>  };
>  
> -int vgic_v3_init(struct domain *d, int *mmio_count)
> +int vgic_v3_init(struct domain *d, unsigned int *mmio_count)
>  {
>      if ( !vgic_v3_hw.enabled )
>      {
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 97d6f6106638..afcac791fe4b 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -85,7 +85,7 @@ static void vgic_rank_init(struct vgic_irq_rank *rank, uint8_t index,
>          write_atomic(&rank->vcpu[i], vcpu);
>  }
>  
> -int domain_vgic_register(struct domain *d, int *mmio_count)
> +int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>  {
>      switch ( d->arch.vgic.version )
>      {
> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
> index 76b85ea8231b..f8d7d3a226d0 100644
> --- a/xen/arch/arm/vgic/vgic-init.c
> +++ b/xen/arch/arm/vgic/vgic-init.c
> @@ -101,7 +101,7 @@ static void vgic_vcpu_early_init(struct vcpu *vcpu)
>   *
>   * was: kvm_vgic_create
>   */
> -int domain_vgic_register(struct domain *d, int *mmio_count)
> +int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>  {
>      switch ( d->arch.vgic.version )
>      {
> -- 
> 2.40.1
> 

