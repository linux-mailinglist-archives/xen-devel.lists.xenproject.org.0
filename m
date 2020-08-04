Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7F23C22D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36Gm-0001jY-L1; Tue, 04 Aug 2020 23:22:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36Gl-0001jM-OY
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:22:55 +0000
X-Inumbo-ID: cd8bc00f-d201-478f-963e-677910a22c88
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd8bc00f-d201-478f-963e-677910a22c88;
 Tue, 04 Aug 2020 23:22:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35A7C2073E;
 Tue,  4 Aug 2020 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583374;
 bh=RYhMPLQdbmgiruH5kzVLc3tXrt8T11wvJwMZFyGZBg4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=M074Fw57RaXO3uIS8dZ28VuB1V21hPegAyU84JS8AS7CUA/98yXR2ZrtA2APpitOP
 osUwNOOPVyxwiETRwTWdGk4SzvOpVIky3Prj59CIEBpeCHYzVIa6PM/wJdom0FlNQZ
 SPUqVwZBskJEs3i3RDdKzH55OkyFETAaNmPXWNwg=
Date: Tue, 4 Aug 2020 16:22:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more
 correct way
In-Reply-To: <1596478888-23030-10-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2008041556390.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-10-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch makes possible to use device passthrough again.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libxl/libxl_arm.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 620b499..4f748e3 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -9,6 +9,10 @@
>  #include <assert.h>
>  #include <xen/device_tree_defs.h>
>  
> +#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
> +#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
> +#define GUEST_VIRTIO_MMIO_SPI   33

They should be in xen/include/public/arch-arm.h

Is one interrupt enough if there are multiple virtio devices? Is it one
interrupt for all virtio devices, or one for each device?

Of course this patch should be folded in the patch to add virtio support
to libxl.


>  static const char *gicv_to_string(libxl_gic_version gic_version)
>  {
>      switch (gic_version) {
> @@ -27,8 +31,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      uint32_t nr_spis = 0;
>      unsigned int i;
> -    uint32_t vuart_irq;
> -    bool vuart_enabled = false;
> +    uint32_t vuart_irq, virtio_irq;
> +    bool vuart_enabled = false, virtio_enabled = false;
>  
>      /*
>       * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> @@ -40,6 +44,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          vuart_enabled = true;
>      }
>  
> +    /*
> +     * XXX: Handle properly virtio
> +     * A proper solution would be the toolstack to allocate the interrupts
> +     * used by each virtio backend and let the backend now which one is used
> +     */
> +    if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
> +        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
> +        virtio_irq = GUEST_VIRTIO_MMIO_SPI;
> +        virtio_enabled = true;
> +    }
> +
>      for (i = 0; i < d_config->b_info.num_irqs; i++) {
>          uint32_t irq = d_config->b_info.irqs[i];
>          uint32_t spi;
> @@ -59,6 +74,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>              return ERROR_FAIL;
>          }
>  
> +        /* The same check as for vpl011 */
> +        if (virtio_enabled && irq == virtio_irq) {
> +            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
> +            return ERROR_FAIL;
> +        }
> +
>          if (irq < 32)
>              continue;
>  
> @@ -68,10 +89,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>              nr_spis = spi + 1;
>      }
>  
> -
> -    /* XXX: Handle properly virtio */
> -    nr_spis = 1;
> -
>      LOG(DEBUG, "Configure the domain");
>  
>      config->arch.nr_spis = nr_spis;
> @@ -663,10 +680,6 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> -#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
> -#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
> -#define GUEST_VIRTIO_MMIO_SPI   33
> -
>  static int make_virtio_mmio_node(libxl__gc *gc, void *fdt)
>  {
>      int res;
> -- 
> 2.7.4
> 

