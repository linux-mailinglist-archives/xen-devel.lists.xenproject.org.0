Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EC23C22E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36GS-0001gK-Vq; Tue, 04 Aug 2020 23:22:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36GR-0001g1-4O
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:22:35 +0000
X-Inumbo-ID: 21acce81-2bec-40b8-baa3-a7af217f98a2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21acce81-2bec-40b8-baa3-a7af217f98a2;
 Tue, 04 Aug 2020 23:22:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8424C20842;
 Tue,  4 Aug 2020 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583353;
 bh=+541hY4oQwMDk7KvaXCUPFlpnBiTi3iZNAh1Io4ZNyo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=uZeXslBW7+BXNpDxNO/2AX4Z6qXOe+X9eufVXoyyRp/5mzUw5CaHbqkiGamhT6D3K
 dhYY9rE2tItHGkQiiryDjtrMhGv2zJLlJKHil8nnwj8MVwjfLEDUrtevakblWSKFuP
 uILaSDMKeIKDjibKGP7qbUTcP/QN+qfQXGOB4HQc=
Date: Tue, 4 Aug 2020 16:22:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch makes possible to forward Guest MMIO accesses
> to a device emulator on Arm and enables that support for
> Arm64.
> 
> Also update XSM code a bit to let DM op be used on Arm.
> New arch DM op will be introduced in the follow-up patch.
> 
> Please note, at the moment build on Arm32 is broken
> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone

Speaking of buffered_ioreq, if I recall correctly, they were only used
for VGA-related things on x86. It looks like it is still true.

If so, do we need it on ARM? Note that I don't think we can get rid of
it from the interface as it is baked into ioreq, but it might be
possible to have a dummy implementation on ARM. Or maybe not: looking at
xen/common/hvm/ioreq.c it looks like it would be difficult to
disentangle bufioreq stuff from the rest of the code.


> wants to enable CONFIG_IOREQ_SERVER due to the lack of
> cmpxchg_64 support on Arm32.
> 
> Please note, this is a split/cleanup of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

[...]


> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>   */
>  void leave_hypervisor_to_guest(void)
>  {
> +#ifdef CONFIG_IOREQ_SERVER
> +    /*
> +     * XXX: Check the return. Shall we call that in
> +     * continue_running and context_switch instead?
> +     * The benefits would be to avoid calling
> +     * handle_hvm_io_completion on every return.
> +     */

Yeah, that could be a simple and good optimization


> +    local_irq_enable();
> +    handle_hvm_io_completion(current);
> +#endif
>      local_irq_disable();
>  
>      check_for_vcpu_work();
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 4e2f582..e060b0a 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -11,12 +11,64 @@
>  #include <asm/vgic.h>
>  #include <asm/vpl011.h>
>  #include <public/hvm/params.h>
> +#include <public/hvm/dm_op.h>
> +#include <public/hvm/ioreq.h>
>  #include <xen/serial.h>
>  #include <xen/rbtree.h>
>  
> +struct hvm_ioreq_page {
> +    gfn_t gfn;
> +    struct page_info *page;
> +    void *va;
> +};
> +
> +struct hvm_ioreq_vcpu {
> +    struct list_head list_entry;
> +    struct vcpu      *vcpu;
> +    evtchn_port_t    ioreq_evtchn;
> +    bool             pending;
> +};
> +
> +#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
> +#define MAX_NR_IO_RANGES  256
> +
> +#define MAX_NR_IOREQ_SERVERS 8
> +#define DEFAULT_IOSERVID 0
> +
> +struct hvm_ioreq_server {
> +    struct domain          *target, *emulator;
> +
> +    /* Lock to serialize toolstack modifications */
> +    spinlock_t             lock;
> +
> +    struct hvm_ioreq_page  ioreq;
> +    struct list_head       ioreq_vcpu_list;
> +    struct hvm_ioreq_page  bufioreq;
> +
> +    /* Lock to serialize access to buffered ioreq ring */
> +    spinlock_t             bufioreq_lock;
> +    evtchn_port_t          bufioreq_evtchn;
> +    struct rangeset        *range[NR_IO_RANGE_TYPES];
> +    bool                   enabled;
> +    uint8_t                bufioreq_handling;
> +};
> +
>  struct hvm_domain
>  {
>      uint64_t              params[HVM_NR_PARAMS];
> +
> +    /* Guest page range used for non-default ioreq servers */
> +    struct {
> +        unsigned long base;
> +        unsigned long mask;
> +        unsigned long legacy_mask; /* indexed by HVM param number */
> +    } ioreq_gfn;
> +
> +    /* Lock protects all other values in the sub-struct and the default */
> +    struct {
> +        spinlock_t              lock;
> +        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
> +    } ioreq_server;
>  };
>  
>  #ifdef CONFIG_ARM_64
> @@ -93,6 +145,29 @@ struct arch_domain
>  #endif
>  }  __cacheline_aligned;
>  
> +enum hvm_io_completion {
> +    HVMIO_no_completion,
> +    HVMIO_mmio_completion,
> +    HVMIO_pio_completion,
> +    HVMIO_realmode_completion

realmode is an x86-ism (as pio), I wonder if we could get rid of it on ARM


> +};
> +
> +struct hvm_vcpu_io {
> +    /* I/O request in flight to device model. */
> +    enum hvm_io_completion io_completion;
> +    ioreq_t                io_req;
> +
> +    /*
> +     * HVM emulation:
> +     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
> +     *  The latter is known to be an MMIO frame (not RAM).
> +     *  This translation is only valid for accesses as per @mmio_access.
> +     */
> +    struct npfec        mmio_access;
> +    unsigned long       mmio_gla;
> +    unsigned long       mmio_gpfn;
> +};
> +
>  struct arch_vcpu
>  {
>      struct {
> @@ -206,6 +281,11 @@ struct arch_vcpu
>       */
>      bool need_flush_to_ram;
>  
> +    struct hvm_vcpu
> +    {
> +        struct hvm_vcpu_io hvm_io;
> +    } hvm;
> +
>  }  __cacheline_aligned;
>  
>  void vcpu_show_execution_state(struct vcpu *);
> diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
> new file mode 100644
> index 0000000..83a560c
> --- /dev/null
> +++ b/xen/include/asm-arm/hvm/ioreq.h
> @@ -0,0 +1,103 @@
> +/*
> + * hvm.h: Hardware virtual machine assist interface definitions.
> + *
> + * Copyright (c) 2016 Citrix Systems Inc.
> + * Copyright (c) 2019 Arm ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_ARM_HVM_IOREQ_H__
> +#define __ASM_ARM_HVM_IOREQ_H__
> +
> +#include <public/hvm/ioreq.h>
> +#include <public/hvm/dm_op.h>
> +
> +#define has_vpci(d) (false)
> +
> +bool handle_mmio(void);
> +
> +static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
> +{
> +    /* XXX */
> +    BUG();
> +    return true;
> +}
> +
> +static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
> +{
> +    return p->addr;
> +}
> +
> +static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
> +{
> +    unsigned long size = p->size;
> +
> +    return p->addr + size - 1;
> +}
> +
> +struct hvm_ioreq_server;
> +
> +static inline int p2m_set_ioreq_server(struct domain *d,
> +                                       unsigned int flags,
> +                                       struct hvm_ioreq_server *s)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline void msix_write_completion(struct vcpu *v)
> +{
> +}
> +
> +static inline void handle_realmode_completion(void)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
> +static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
> +{
> +}
> +
> +static inline void hvm_get_ioreq_server_range_type(struct domain *d,
> +                                                   ioreq_t *p,
> +                                                   uint8_t *type,
> +                                                   uint64_t *addr)
> +{
> +    *type = (p->type == IOREQ_TYPE_PIO) ?
> +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> +    *addr = p->addr;
> +}
> +
> +static inline void arch_hvm_ioreq_init(struct domain *d)
> +{
> +}
> +
> +static inline void arch_hvm_ioreq_destroy(struct domain *d)
> +{
> +}
> +
> +#define IOREQ_IO_HANDLED     IO_HANDLED
> +#define IOREQ_IO_UNHANDLED   IO_UNHANDLED
> +#define IOREQ_IO_RETRY       IO_RETRY
> +
> +#endif /* __ASM_X86_HVM_IOREQ_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 5fdb6e8..5823f11 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
>                                          mfn_t mfn)
>  {
>      /*
> -     * NOTE: If this is implemented then proper reference counting of
> -     *       foreign entries will need to be implemented.
> +     * XXX: handle properly reference. It looks like the page may not always
> +     * belong to d.

Just as a reference, and without taking away anything from the comment,
I think that QEMU is doing its own internal reference counting for these
mappings.


>       */
> -    return -EOPNOTSUPP;
> +
> +    return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_ram_rw);
>  }
>  
>  /*


