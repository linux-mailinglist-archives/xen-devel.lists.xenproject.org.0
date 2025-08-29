Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C18B3C4C2
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 00:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102311.1454966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us7TG-0008BX-Re; Fri, 29 Aug 2025 22:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102311.1454966; Fri, 29 Aug 2025 22:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us7TG-00088h-Nk; Fri, 29 Aug 2025 22:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1102311;
 Fri, 29 Aug 2025 22:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us7TF-00088b-HM
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 22:21:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b65b46e-8526-11f0-8dd7-1b34d833f44b;
 Sat, 30 Aug 2025 00:21:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A823C4399D;
 Fri, 29 Aug 2025 22:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CD8C4CEF0;
 Fri, 29 Aug 2025 22:21:15 +0000 (UTC)
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
X-Inumbo-ID: 7b65b46e-8526-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756506076;
	bh=TQUxTM33UCETVGRvFCiO3PQQDxuqJgksyKo4X7L6qsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cT5cyEsFzUQoL+Q0YydimX6OtY/lbzJbxYhQVa9WlC0CLBf0vTavwZ7+PtYezMuqu
	 cjH6hM1vG0ytVsWSV1on2mD37KuVGLgmL9VfcQ2Kk/jSTap+lrKAVhsWVJo2pCRECf
	 waTtNYzUNFVtCKKVgpVOI1Vp1daotNYEhQvfaeRt8siuFMoScnbzA0NyZUuQXgt2Z6
	 TqdsDgqtnH08awRfK6wABkx9NwuRe0Wx85EWGAuVyju3EdUUXSigi0al7IdQ/zyFyZ
	 SLIDwmaFFh2GNvfiyyDaGb4QkscSitOVE2ZQqGwdx8P/BLm0LhIuqEGJhuYR0MdF6+
	 Y29RGyCjU3Oew==
Date: Fri, 29 Aug 2025 15:21:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 15/15] emul/ns16x50: implement IRQ emulation via
 vIOAPIC
In-Reply-To: <20250828235409.2835815-16-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291508330.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-16-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which cannot
> be asserted on vIOAPIC.

One option is to enable the vPIT for PVH domains when the NS16550
emulator is enabled. Would that resolve the problem? That would be a
simpler solution compared to adding IRQ_EMU because the IRQ_* logic is
already quite complex.

Alternatively...


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
> Changes since v4:
> - dropped xl bits
> - cosmetic renames
> - fix hvm_gsi_eoi()
> - Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-8-dmukhin@ford.com/
> ---
>  xen/arch/x86/domain.c             |  2 +-
>  xen/arch/x86/hvm/vioapic.c        | 10 ++++++++++
>  xen/arch/x86/include/asm/irq.h    |  3 ++-
>  xen/arch/x86/irq.c                |  4 ++--
>  xen/arch/x86/physdev.c            |  8 ++++----
>  xen/common/emul/vuart/ns16x50.c   | 32 +++++++++++++++++++++++++++++--
>  xen/drivers/passthrough/x86/hvm.c | 13 ++++++++-----
>  7 files changed, 57 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88d2..0815d0b31827 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1048,7 +1048,7 @@ int arch_domain_soft_reset(struct domain *d)
>      write_lock(&d->event_lock);
>      for ( i = 0; i < d->nr_pirqs ; i++ )
>      {
> -        if ( domain_pirq_to_emuirq(d, i) != IRQ_UNBOUND )
> +        if ( domain_irq_to_emuirq(d, i) != IRQ_UNBOUND )
>          {
>              ret = unmap_domain_pirq_emuirq(d, i);
>              if ( ret )
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 7c725f9e471f..fd073f6fba4b 100644
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
> +    write_lock(&currd->event_lock);
> +    ret = domain_irq_to_emuirq(currd, gsi);
> +    write_unlock(&currd->event_lock);
> +    if ( ret != IRQ_UNBOUND )
> +        return 0;

..alternatively, we could have an add-hoc check here? Not very nice but
at least it would be very simple.

In other words, adding vPIT is preferable in my opinion but as a second
option I would consider an ad-hoc check. I would try to avoid adding
IRQ_EMU -- that should be the last resort in my view.


>      /* Interrupt has been unmasked, bind it now. */
>      ret = mp_register_gsi(gsi, trig, pol);
>      if ( ret == -EEXIST )
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index 8bffec3bbfee..3b24decb05e4 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -212,7 +212,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>      __ret ? radix_tree_ptr_to_int(__ret) : 0;                   \
>  })
>  #define PIRQ_ALLOCATED (-1)
> -#define domain_pirq_to_emuirq(d, pirq) pirq_field(d, pirq,              \
> +#define domain_irq_to_emuirq(d, pirq) pirq_field(d, pirq,              \
>      arch.hvm.emuirq, IRQ_UNBOUND)
>  #define domain_emuirq_to_pirq(d, emuirq) ({                             \
>      void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, emuirq);\
> @@ -221,6 +221,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>  #define IRQ_UNBOUND (-1)
>  #define IRQ_PT      (-2)
>  #define IRQ_MSI_EMU (-3)
> +#define IRQ_EMU     (-4)
>  
>  bool cpu_has_pending_apic_eoi(void);
>  
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 079277be719d..7a8093cd3238 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2790,7 +2790,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
>          return -EINVAL;
>      }
>  
> -    old_emuirq = domain_pirq_to_emuirq(d, pirq);
> +    old_emuirq = domain_irq_to_emuirq(d, pirq);
>      if ( emuirq != IRQ_PT )
>          old_pirq = domain_emuirq_to_pirq(d, emuirq);
>  
> @@ -2845,7 +2845,7 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pirq)
>  
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
> -    emuirq = domain_pirq_to_emuirq(d, pirq);
> +    emuirq = domain_irq_to_emuirq(d, pirq);
>      if ( emuirq == IRQ_UNBOUND )
>      {
>          dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 4dfa1c019105..90a9e7d2f120 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -145,7 +145,7 @@ int physdev_unmap_pirq(struct domain *d, int pirq)
>      if ( is_hvm_domain(d) && has_pirq(d) )
>      {
>          write_lock(&d->event_lock);
> -        if ( domain_pirq_to_emuirq(d, pirq) != IRQ_UNBOUND )
> +        if ( domain_irq_to_emuirq(d, pirq) != IRQ_UNBOUND )
>              ret = unmap_domain_pirq_emuirq(d, pirq);
>          write_unlock(&d->event_lock);
>          if ( d == current->domain || ret )
> @@ -191,10 +191,10 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( is_pv_domain(currd) || domain_pirq_to_irq(currd, eoi.irq) > 0 )
>              pirq_guest_eoi(pirq);
>          if ( is_hvm_domain(currd) &&
> -             domain_pirq_to_emuirq(currd, eoi.irq) > 0 )
> +             domain_irq_to_emuirq(currd, eoi.irq) > 0 )
>          {
>              struct hvm_irq *hvm_irq = hvm_domain_irq(currd);
> -            int gsi = domain_pirq_to_emuirq(currd, eoi.irq);
> +            int gsi = domain_irq_to_emuirq(currd, eoi.irq);
>  
>              /* if this is a level irq and count > 0, send another
>               * notification */ 
> @@ -267,7 +267,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          irq_status_query.flags = 0;
>          if ( is_hvm_domain(currd) &&
>               domain_pirq_to_irq(currd, irq) <= 0 &&
> -             domain_pirq_to_emuirq(currd, irq) == IRQ_UNBOUND )
> +             domain_irq_to_emuirq(currd, irq) == IRQ_UNBOUND )
>          {
>              ret = -EINVAL;
>              break;
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index aea38304b60c..1126b53c30df 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -287,7 +287,9 @@ static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
>      const struct vuart_info *info = vdev->info;
>      int vector;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        vector = hvm_ioapic_assert(d, info->irq, false);
> +    else if ( has_vpic(d) ) /* HVM */
>          vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
>      else
>          ASSERT_UNREACHABLE();
> @@ -300,7 +302,9 @@ static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
>      struct domain *d = vdev->owner;
>      const struct vuart_info *info = vdev->info;
>  
> -    if ( has_vpic(d) ) /* HVM */
> +    if ( has_vioapic(d) && !has_vpic(d) ) /* PVH */
> +        hvm_ioapic_deassert(d, info->irq);
> +    else if ( has_vpic(d) ) /* HVM */
>          hvm_isa_irq_deassert(d, info->irq);
>      else
>          ASSERT_UNREACHABLE();
> @@ -803,6 +807,17 @@ static int ns16x50_init(void *arg)
>          return rc;
>      }
>  
> +    /* Claim virtual IRQ */
> +    write_lock(&d->event_lock);
> +    rc = map_domain_emuirq_pirq(d, info->irq, IRQ_EMU);
> +    write_unlock(&d->event_lock);
> +    if ( rc )
> +    {
> +        ns16x50_err(info, "virtual IRQ#%d: cannot claim: %d\n",
> +                    info->irq, rc);
> +        return rc;
> +    }
> +
>      /* NB: report 115200 baud rate. */
>      vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
>      vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
> @@ -822,9 +837,22 @@ static int ns16x50_init(void *arg)
>  static void cf_check ns16x50_deinit(void *arg)
>  {
>      struct vuart_ns16x50 *vdev = arg;
> +    const struct vuart_info *info;
> +    struct domain *d;
> +    int rc;
>  
>      ASSERT(vdev);
>  
> +    d = vdev->owner;
> +    info = vdev->info;
> +
> +    write_lock(&d->event_lock);
> +    rc = unmap_domain_pirq_emuirq(d, info->irq);
> +    write_unlock(&d->event_lock);
> +    if ( rc )
> +        ns16x50_err(vdev, "virtual IRQ#%d: cannot unclaim: %d\n",
> +                    info->irq, rc);
> +
>      spin_lock(&vdev->lock);
>      ns16x50_fifo_tx_flush(vdev);
>      spin_unlock(&vdev->lock);
> diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
> index a2ca7e0e570c..11711d20a7ea 100644
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -923,13 +923,16 @@ static void __hvm_dpci_eoi(struct domain *d,
>  static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
>  {
>      struct pirq *pirq = pirq_info(d, gsi);
> +    int rc;
> +
> +    /* Check if GSI is claimed by one of the virtual devices. */
> +    rc = domain_irq_to_emuirq(d, gsi);
> +    if ( rc != IRQ_UNBOUND )
> +        hvm_gsi_deassert(d, gsi);
>  
>      /* Check if GSI is actually mapped. */
> -    if ( !pirq_dpci(pirq) )
> -        return;
> -
> -    hvm_gsi_deassert(d, gsi);
> -    hvm_pirq_eoi(pirq);
> +    if ( pirq_dpci(pirq) )
> +        hvm_pirq_eoi(pirq);
>  }
>  
>  static int cf_check _hvm_dpci_isairq_eoi(
> -- 
> 2.51.0
> 

