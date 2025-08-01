Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213CB17AA7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 02:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066645.1431808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdv4-0006W9-KX; Fri, 01 Aug 2025 00:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066645.1431808; Fri, 01 Aug 2025 00:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhdv4-0006Tp-Ho; Fri, 01 Aug 2025 00:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1066645;
 Fri, 01 Aug 2025 00:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8vk=2N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhdv3-0006Tg-7Y
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 00:46:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdd3cfb9-6e70-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 02:46:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 680536020E;
 Fri,  1 Aug 2025 00:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CCDC4CEEF;
 Fri,  1 Aug 2025 00:46:39 +0000 (UTC)
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
X-Inumbo-ID: fdd3cfb9-6e70-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754009201;
	bh=CCe2GZHM4uVATboKMdjFdbk2lwhfV2iwx9tR1JVkoiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J0bp/24nPISprMc84zATF5LGaYN34pjygGGNjDi0pazLNDJGnEF2ClQKAOavx21Zo
	 ibwirPqFttW6qFHeAlOaTck0zwL8kCCKXBGTt/ODeOmfughk7gl0HOK3IAskmb0Rm7
	 96+tLbUHFkWPwCLJi0nkiL+JaY6CQ5cmdhkeAhe0WE+riVTw6TorIcMj3ZggPAZsUf
	 kEwToXiwtlGYBgSvnd9Hy0DKt02YbMV1M4fZVnY5Af1y6kwEnnUzUQx+DtQnP9LP+m
	 IAX2XyOU8VlMKch1oisT5HDNf97aIvYWu18a4MS7KfYmjjKG2jnvCeTJUwr2SIbJm9
	 Zb1ZMePL2Schg==
Date: Thu, 31 Jul 2025 17:46:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 7/8] tools/xl: enable NS16550-compatible UART emulator
 for PVH (x86)
In-Reply-To: <20250731192130.3948419-8-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311745340.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-8-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Enable virtual NS16550 for PVH domains in xl.
> 
> {map,unmap}_domain_emuirq_pirq() infrastructure is modified by adding new
> type of interrupt resources 'IRQ_EMU' which means 'emulated device IRQ'
> (similarly to IRQ_MSI_EMU).
> 
> This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mapping
> (vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin corresponding to
> virtual device's IRQ.
> 
> Also, hvm_gsi_eoi() is modified to trigger assertion in hvm_gsi_deassert()
> path for ISA IRQs.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - new patch
> ---
>  tools/libs/light/libxl_x86.c          |  2 +-
>  xen/arch/x86/domain.c                 |  2 ++
>  xen/arch/x86/hvm/vioapic.c            | 10 ++++++++++
>  xen/arch/x86/include/asm/irq.h        |  1 +
>  xen/common/emul/vuart/vuart-ns16550.c | 27 +++++++++++++++++++++++++--
>  xen/drivers/passthrough/x86/hvm.c     |  9 ++++-----
>  6 files changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 0f039ca65a88..a40647c06cb9 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -54,7 +54,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          break;
>      case LIBXL_DOMAIN_TYPE_PVH:
>          config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
> -        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
> +        libxl__arch_domain_vuart_enable(gc, d_config, config);
>          break;
>      case LIBXL_DOMAIN_TYPE_PV:
>          config->arch.emulation_flags = 0;
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 6a010a509a60..39b0c0b199b9 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -769,12 +769,14 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>          {
>              .caps   = CAP_HVM | CAP_HWDOM,
>              .min    = X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +            .opt    = X86_EMU_NS16550,
>          },
>  
>          /* PVH domU */
>          {
>              .caps   = CAP_HVM | CAP_DOMU,
>              .min    = X86_EMU_LAPIC,
> +            .opt    = X86_EMU_NS16550,
>          },
>  
>          /* HVM domU */
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 7c725f9e471f..86fe3aa4a201 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -177,6 +177,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
>  
>      ASSERT(is_hardware_domain(currd));
>  
> +    /*
> +     * Interrupt is claimed by one of the platform virtual devices (e.g.
> +     * NS16550); do nothing.
> +     */
> +    read_lock(&currd->event_lock);
> +    ret = domain_pirq_to_emuirq(currd, gsi);
> +    read_unlock(&currd->event_lock);
> +    if ( ret != IRQ_UNBOUND )
> +        return 0;
> +
>      /* Interrupt has been unmasked, bind it now. */
>      ret = mp_register_gsi(gsi, trig, pol);
>      if ( ret == -EEXIST )
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index 8c81f66434a8..731d2bbbb1b4 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -221,6 +221,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>  #define IRQ_UNBOUND (-1)
>  #define IRQ_PT      (-2)
>  #define IRQ_MSI_EMU (-3)
> +#define IRQ_EMU     (-4)
>  
>  bool cpu_has_pending_apic_eoi(void);
>  
> diff --git a/xen/common/emul/vuart/vuart-ns16550.c b/xen/common/emul/vuart/vuart-ns16550.c
> index 48bbf58264fe..9ec9aed2c594 100644
> --- a/xen/common/emul/vuart/vuart-ns16550.c
> +++ b/xen/common/emul/vuart/vuart-ns16550.c
> @@ -355,7 +355,9 @@ static void ns16550_irq_assert(const struct vuart_ns16550 *vdev)
>      struct domain *d = vdev->owner;
>      int vector;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        vector = hvm_ioapic_assert(d, vdev->irq, false);
> +    else if ( has_vpic(d) ) /* HVM */
>          vector = hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);
>      else
>          ASSERT_UNREACHABLE();
> @@ -367,7 +369,9 @@ static void ns16550_irq_deassert(const struct vuart_ns16550 *vdev)
>  {
>      struct domain *d = vdev->owner;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        hvm_ioapic_deassert(d, vdev->irq);
> +    else if ( has_vpic(d) ) /* HVM */
>          hvm_isa_irq_deassert(d, vdev->irq);
>      else
>          ASSERT_UNREACHABLE();
> @@ -889,6 +893,17 @@ static int cf_check ns16550_init(struct domain *d,
>                  return rc;
>              }
>  
> +            /* Claim virtual IRQ */
> +            write_lock(&d->event_lock);
> +            rc = map_domain_emuirq_pirq(d, r->addr, IRQ_EMU);
> +            write_unlock(&d->event_lock);
> +            if ( rc )
> +            {
> +                pr_err("%s: virtual IRQ#%"PRIu64": cannot claim: %d\n",
> +                        desc->name, r->addr, rc);
> +                return rc;
> +            }
> +
>              vdev->irq = r->addr;
>          }
>          else
> @@ -919,12 +934,20 @@ static int cf_check ns16550_init(struct domain *d,
>  static void cf_check ns16550_deinit(struct domain *d)
>  {
>      struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
> +    int rc;
>  
>      if ( !vdev )
>          return;
>  
>      spin_lock(&vdev->lock);
>  
> +    rc = unmap_domain_pirq_emuirq(vdev->owner, vdev->irq);
> +    if ( rc )
> +    {
> +        pr_err("%s: virtual IRQ#%d: cannot unclaim: %d\n",
> +                vdev->name, vdev->irq, rc);
> +    }

write_lock(&d->event_lock); ?


>      ns16550_fifo_tx_flush(vdev);
>  
>      spin_unlock(&vdev->lock);
> diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
> index a2ca7e0e570c..22905cd86f95 100644
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -924,12 +924,11 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
>  {
>      struct pirq *pirq = pirq_info(d, gsi);
>  
> -    /* Check if GSI is actually mapped. */
> -    if ( !pirq_dpci(pirq) )
> -        return;
> -
>      hvm_gsi_deassert(d, gsi);
> -    hvm_pirq_eoi(pirq);
> +
> +    /* Check if GSI is actually mapped. */
> +    if ( pirq_dpci(pirq) )
> +        hvm_pirq_eoi(pirq);
>  }
>  
>  static int cf_check _hvm_dpci_isairq_eoi(
> -- 
> 2.34.1
> 
> 

