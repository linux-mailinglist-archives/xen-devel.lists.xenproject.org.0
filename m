Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E587D792
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694111.1082996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHrf-0008Pa-07; Sat, 16 Mar 2024 00:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694111.1082996; Sat, 16 Mar 2024 00:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHre-0008NK-TQ; Sat, 16 Mar 2024 00:25:30 +0000
Received: by outflank-mailman (input) for mailman id 694111;
 Sat, 16 Mar 2024 00:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlHrd-0008NE-4K
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:25:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aef409e0-e32b-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 01:25:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6913F6175A;
 Sat, 16 Mar 2024 00:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A21C433C7;
 Sat, 16 Mar 2024 00:25:22 +0000 (UTC)
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
X-Inumbo-ID: aef409e0-e32b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710548724;
	bh=uxSl1Cwa0XXqoDRLEn0FII40cr7kcuL8Vz6zNlWjQ7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KV6P5f7dQQmgM4WWV+qMKHMRY8eMtX38/jp8g7/3gq0bRb38iDtakRjSub0tGB8KS
	 SwvHwl+o2y6QWF2ilLAtv20MvydyexJXoiI0HWh75Pv/MbFFfL+YfH4DODVbK1nR5i
	 jCNXn55inXQebbuFzyXTsM/O4CGDuOCE9pOBNNYAlzsmvhrqpfRgKPCFZZWTwh2rBA
	 Cf7xrZ35k8PelXW2ZZqXVzXsOsUVLahQWqodPFG+qjP09iY9KDqycYrSK5JHENXQXR
	 RWqNB0IkZDWmPgUcwcuvho53fJuIoJHhvWY7BILmzFL/FlStkWFlkDY4ON78kUHuRF
	 reoFVA2DbyG9A==
Date: Fri, 15 Mar 2024 17:25:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3] amd/iommu: clean up unused guest iommu related
 functions
In-Reply-To: <98fef1239e4f0e756daf863a9e4e7bb679baa264.1710518105.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403151724380.853156@ubuntu-linux-20-04-desktop>
References: <98fef1239e4f0e756daf863a9e4e7bb679baa264.1710518105.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Nicola Vetrini wrote:
> Delete unused functions from 'iommu_guest.c'.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> guest_iommu_add_ptr_log has still one caller, but even that seems
> suspicious. I left it in and uniformed its parameter type at the
> moment, so that whether it should be kept can be sorted out later.
> If that caller indeed should be removed as well, then
> no function in the file is actually reachable as far as I can tell.

I couldn't rule it out that guest_iommu_add_ptr_log might be useful so I
would keep it


> Changes in v2:
> - change parameter type to uint32_t
> - remove unused functions
> Changes in v3:
> - also remove amd_iommu_send_guest_cmd
> ---
>  xen/drivers/passthrough/amd/iommu.h       |   7 +-
>  xen/drivers/passthrough/amd/iommu_cmd.c   |   7 -
>  xen/drivers/passthrough/amd/iommu_guest.c | 762 +---------------------
>  3 files changed, 2 insertions(+), 774 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index 1b62c083ba67..65de88217c07 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -346,12 +346,7 @@ void cf_check amd_iommu_crash_shutdown(void);
>  
>  /* guest iommu support */
>  #ifdef CONFIG_HVM
> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
> -void guest_iommu_add_ppr_log(struct domain *d, u32 entry[]);
> -void guest_iommu_add_event_log(struct domain *d, u32 entry[]);
> -int guest_iommu_init(struct domain* d);
> -void guest_iommu_destroy(struct domain *d);
> -int guest_iommu_set_base(struct domain *d, uint64_t base);
> +void guest_iommu_add_ppr_log(struct domain *d, uint32_t entry[]);
>  #else
>  static inline void guest_iommu_add_ppr_log(struct domain *d, uint32_t entry[]) {}
>  #endif
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> index 49b9fcac9410..83c525b84f91 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -389,10 +389,3 @@ void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
>      invalidate_iommu_all(iommu);
>      flush_command_buffer(iommu, 0);
>  }
> -
> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
> -{
> -    send_iommu_command(iommu, cmd);
> -    /* TBD: Timeout selection may require peeking into cmd[]. */
> -    flush_command_buffer(iommu, 0);
> -}
> diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
> index 4c4252eea116..19bd2e5d8e63 100644
> --- a/xen/drivers/passthrough/amd/iommu_guest.c
> +++ b/xen/drivers/passthrough/amd/iommu_guest.c
> @@ -20,28 +20,7 @@
>  
>  #include "iommu.h"
>  
> -#define IOMMU_MMIO_SIZE                         0x8000
> -#define IOMMU_MMIO_PAGE_NR                      0x8
> -#define RING_BF_LENGTH_MASK                     0x0F000000
> -#define RING_BF_LENGTH_SHIFT                    24
> -
> -#define PASMAX_9_bit                            0x8
> -#define GUEST_CR3_1_LEVEL                       0x0
> -#define GUEST_ADDRESS_SIZE_6_LEVEL              0x2
> -#define HOST_ADDRESS_SIZE_6_LEVEL               0x2
> -
>  #define reg_to_u64(reg) (((uint64_t)reg.hi << 32) | reg.lo )
> -#define u64_to_reg(reg, val) \
> -    do \
> -    { \
> -        (reg)->lo = (u32)(val); \
> -        (reg)->hi = (val) >> 32; \
> -    } while (0)
> -
> -static unsigned int get_machine_bdf(struct domain *d, uint16_t guest_bdf)
> -{
> -    return guest_bdf;
> -}
>  
>  static uint16_t get_guest_bdf(struct domain *d, uint16_t machine_bdf)
>  {
> @@ -53,62 +32,6 @@ static inline struct guest_iommu *domain_iommu(struct domain *d)
>      return dom_iommu(d)->arch.amd.g_iommu;
>  }
>  
> -static inline struct guest_iommu *vcpu_iommu(struct vcpu *v)
> -{
> -    return dom_iommu(v->domain)->arch.amd.g_iommu;
> -}
> -
> -static void guest_iommu_enable(struct guest_iommu *iommu)
> -{
> -    iommu->enabled = 1;
> -}
> -
> -static void guest_iommu_disable(struct guest_iommu *iommu)
> -{
> -    iommu->enabled = 0;
> -}
> -
> -/*
> - * The Guest CR3 Table is a table written by the guest kernel, pointing at
> - * gCR3 values for PASID transactions to use.  The Device Table Entry points
> - * at a system physical address.
> - *
> - * However, these helpers deliberately use untyped parameters without
> - * reference to gfn/mfn because they are used both for programming the real
> - * IOMMU, and interpreting a guests programming of its vIOMMU.
> - */
> -static uint64_t dte_get_gcr3_table(const struct amd_iommu_dte *dte)
> -{
> -    return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
> -            (dte->gcr3_trp_30_15 << 15) |
> -            (dte->gcr3_trp_14_12 << 12));
> -}
> -
> -static void dte_set_gcr3_table(struct amd_iommu_dte *dte, uint16_t dom_id,
> -                               uint64_t addr, bool gv, uint8_t glx)
> -{
> -#define GCR3_MASK(hi, lo) (((1UL << ((hi) + 1)) - 1) & ~((1UL << (lo)) - 1))
> -
> -    /* I bit must be set when gcr3 is enabled */
> -    dte->i = true;
> -
> -    dte->gcr3_trp_14_12 = MASK_EXTR(addr, GCR3_MASK(14, 12));
> -    dte->gcr3_trp_30_15 = MASK_EXTR(addr, GCR3_MASK(30, 15));
> -    dte->gcr3_trp_51_31 = MASK_EXTR(addr, GCR3_MASK(51, 31));
> -
> -    dte->domain_id = dom_id;
> -    dte->glx = glx;
> -    dte->gv = gv;
> -
> -#undef GCR3_MASK
> -}
> -
> -static unsigned int host_domid(struct domain *d, uint64_t g_domid)
> -{
> -    /* Only support one PPR device in guest for now */
> -    return d->domain_id;
> -}
> -
>  static unsigned long get_gfn_from_base_reg(uint64_t base_raw)
>  {
>      base_raw &= PADDR_MASK;
> @@ -146,24 +69,6 @@ static unsigned long guest_iommu_get_table_mfn(struct domain *d,
>      return mfn;
>  }
>  
> -static void guest_iommu_enable_dev_table(struct guest_iommu *iommu)
> -{
> -    uint32_t length_raw = get_field_from_reg_u32(iommu->dev_table.reg_base.lo,
> -                                                 IOMMU_DEV_TABLE_SIZE_MASK,
> -                                                 IOMMU_DEV_TABLE_SIZE_SHIFT);
> -    iommu->dev_table.size = (length_raw + 1) * PAGE_SIZE;
> -}
> -
> -static void guest_iommu_enable_ring_buffer(struct guest_iommu *iommu,
> -                                           struct guest_buffer *buffer,
> -                                           uint32_t entry_size)
> -{
> -    uint32_t length_raw = get_field_from_reg_u32(buffer->reg_base.hi,
> -                                                 RING_BF_LENGTH_MASK,
> -                                                 RING_BF_LENGTH_SHIFT);
> -    buffer->size = entry_size << length_raw;
> -}
> -
>  void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
>  {
>      uint16_t gdev_id;
> @@ -184,7 +89,7 @@ void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
>      if ( tail >= iommu->ppr_log.size || head >= iommu->ppr_log.size )
>      {
>          AMD_IOMMU_DEBUG("Error: guest iommu ppr log overflows\n");
> -        guest_iommu_disable(iommu);
> +        iommu->enabled = 0;
>          return;
>      }
>  
> @@ -213,668 +118,3 @@ void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
>  
>      guest_iommu_deliver_msi(d);
>  }
> -
> -void guest_iommu_add_event_log(struct domain *d, u32 entry[])
> -{
> -    uint16_t dev_id;
> -    unsigned long mfn, tail, head;
> -    event_entry_t *log;
> -    struct guest_iommu *iommu;
> -
> -    if ( !is_hvm_domain(d) )
> -        return;
> -
> -    iommu = domain_iommu(d);
> -    if ( !iommu )
> -        return;
> -
> -    tail = iommu->event_log.reg_tail.lo;
> -    head = iommu->event_log.reg_head.lo;
> -
> -    if ( tail >= iommu->event_log.size || head >= iommu->event_log.size )
> -    {
> -        AMD_IOMMU_DEBUG("Error: guest iommu event overflows\n");
> -        guest_iommu_disable(iommu);
> -        return;
> -    }
> -
> -    mfn = guest_iommu_get_table_mfn(d, reg_to_u64(iommu->event_log.reg_base),
> -                                    tail);
> -    ASSERT(mfn_valid(_mfn(mfn)));
> -
> -    log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
> -
> -    /* re-write physical device id into virtual device id */
> -    dev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
> -    iommu_set_devid_to_cmd(&entry[0], dev_id);
> -    memcpy(log, entry, sizeof(event_entry_t));
> -
> -    /* Now shift event log tail pointer */
> -    tail += sizeof(event_entry_t);
> -    if ( tail >= iommu->event_log.size )
> -    {
> -        tail = 0;
> -        iommu->reg_status.lo |= IOMMU_STATUS_EVENT_LOG_OVERFLOW;
> -    }
> -
> -    iommu->event_log.reg_tail.lo = tail;
> -    unmap_domain_page(log);
> -
> -    guest_iommu_deliver_msi(d);
> -}
> -
> -static int do_complete_ppr_request(struct domain *d, cmd_entry_t *cmd)
> -{
> -    uint16_t dev_id;
> -    struct amd_iommu *iommu;
> -
> -    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
> -    iommu = find_iommu_for_device(0, dev_id);
> -
> -    if ( !iommu )
> -    {
> -        AMD_IOMMU_DEBUG("%s: Fail to find iommu for bdf %x\n",
> -                        __func__, dev_id);
> -        return -ENODEV;
> -    }
> -
> -    /* replace virtual device id into physical */
> -    iommu_set_devid_to_cmd(&cmd->data[0], dev_id);
> -    amd_iommu_send_guest_cmd(iommu, cmd->data);
> -
> -    return 0;
> -}
> -
> -static int do_invalidate_pages(struct domain *d, cmd_entry_t *cmd)
> -{
> -    uint16_t gdom_id, hdom_id;
> -    struct amd_iommu *iommu = NULL;
> -
> -    gdom_id = get_field_from_reg_u32(cmd->data[1],
> -                                    IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK,
> -                                    IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_SHIFT);
> -
> -    hdom_id = host_domid(d, gdom_id);
> -    set_field_in_reg_u32(hdom_id, cmd->data[1],
> -                         IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK,
> -                         IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_SHIFT, &cmd->data[1]);
> -
> -    for_each_amd_iommu ( iommu )
> -        amd_iommu_send_guest_cmd(iommu, cmd->data);
> -
> -    return 0;
> -}
> -
> -static int do_invalidate_all(struct domain *d, cmd_entry_t *cmd)
> -{
> -    struct amd_iommu *iommu = NULL;
> -
> -    for_each_amd_iommu ( iommu )
> -        amd_iommu_flush_all_pages(d);
> -
> -    return 0;
> -}
> -
> -static int do_invalidate_iotlb_pages(struct domain *d, cmd_entry_t *cmd)
> -{
> -    struct amd_iommu *iommu;
> -    uint16_t dev_id;
> -
> -    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
> -
> -    iommu = find_iommu_for_device(0, dev_id);
> -    if ( !iommu )
> -    {
> -        AMD_IOMMU_DEBUG("%s: Fail to find iommu for bdf %x\n",
> -                         __func__, dev_id);
> -        return -ENODEV;
> -    }
> -
> -    iommu_set_devid_to_cmd(&cmd->data[0], dev_id);
> -    amd_iommu_send_guest_cmd(iommu, cmd->data);
> -
> -    return 0;
> -}
> -
> -static int do_completion_wait(struct domain *d, cmd_entry_t *cmd)
> -{
> -    bool com_wait_int, i, s;
> -    struct guest_iommu *iommu;
> -    unsigned long gfn;
> -    p2m_type_t p2mt;
> -
> -    iommu = domain_iommu(d);
> -
> -    i = cmd->data[0] & IOMMU_COMP_WAIT_I_FLAG_MASK;
> -    s = cmd->data[0] & IOMMU_COMP_WAIT_S_FLAG_MASK;
> -
> -    if ( i )
> -        iommu->reg_status.lo |= IOMMU_STATUS_COMP_WAIT_INT;
> -
> -    if ( s )
> -    {
> -        uint64_t gaddr_lo, gaddr_hi, gaddr_64, data;
> -        void *vaddr;
> -
> -        data = (uint64_t)cmd->data[3] << 32 | cmd->data[2];
> -        gaddr_lo = get_field_from_reg_u32(cmd->data[0],
> -                                          IOMMU_COMP_WAIT_ADDR_LOW_MASK,
> -                                          IOMMU_COMP_WAIT_ADDR_LOW_SHIFT);
> -        gaddr_hi = get_field_from_reg_u32(cmd->data[1],
> -                                          IOMMU_COMP_WAIT_ADDR_HIGH_MASK,
> -                                          IOMMU_COMP_WAIT_ADDR_HIGH_SHIFT);
> -
> -        gaddr_64 = (gaddr_hi << 32) | (gaddr_lo << 3);
> -
> -        gfn = gaddr_64 >> PAGE_SHIFT;
> -        vaddr = map_domain_page(get_gfn(d, gfn ,&p2mt));
> -        put_gfn(d, gfn);
> -
> -        write_u64_atomic((uint64_t *)(vaddr + (gaddr_64 & (PAGE_SIZE-1))),
> -                         data);
> -        unmap_domain_page(vaddr);
> -    }
> -
> -    com_wait_int = iommu->reg_status.lo & IOMMU_STATUS_COMP_WAIT_INT;
> -
> -    if ( iommu->reg_ctrl.com_wait_int_en && com_wait_int )
> -        guest_iommu_deliver_msi(d);
> -
> -    return 0;
> -}
> -
> -static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
> -{
> -    uint16_t gbdf, mbdf, req_id, gdom_id, hdom_id, prev_domid;
> -    struct amd_iommu_dte *gdte, *mdte, *dte_base;
> -    struct amd_iommu *iommu = NULL;
> -    struct guest_iommu *g_iommu;
> -    uint64_t gcr3_gfn, gcr3_mfn;
> -    uint8_t glx, gv;
> -    unsigned long dte_mfn, flags;
> -    p2m_type_t p2mt;
> -
> -    g_iommu = domain_iommu(d);
> -    gbdf = iommu_get_devid_from_cmd(cmd->data[0]);
> -    mbdf = get_machine_bdf(d, gbdf);
> -
> -    /* Guest can only update DTEs for its passthru devices */
> -    if ( mbdf == 0 || gbdf == 0 )
> -        return 0;
> -
> -    /* Sometimes guest invalidates devices from non-exists dtes */
> -    if ( (gbdf * sizeof(struct amd_iommu_dte)) > g_iommu->dev_table.size )
> -        return 0;
> -
> -    dte_mfn = guest_iommu_get_table_mfn(d,
> -                                        reg_to_u64(g_iommu->dev_table.reg_base),
> -                                        sizeof(struct amd_iommu_dte) * gbdf);
> -    ASSERT(mfn_valid(_mfn(dte_mfn)));
> -
> -    /* Read guest dte information */
> -    dte_base = map_domain_page(_mfn(dte_mfn));
> -
> -    gdte = &dte_base[gbdf % (PAGE_SIZE / sizeof(struct amd_iommu_dte))];
> -
> -    gdom_id = gdte->domain_id;
> -    gcr3_gfn = dte_get_gcr3_table(gdte) >> PAGE_SHIFT;
> -    glx = gdte->glx;
> -    gv = gdte->gv;
> -
> -    unmap_domain_page(dte_base);
> -
> -    /* Do not update host dte before gcr3 has been set */
> -    if ( gcr3_gfn == 0 )
> -        return 0;
> -
> -    gcr3_mfn = mfn_x(get_gfn(d, gcr3_gfn, &p2mt));
> -    put_gfn(d, gcr3_gfn);
> -
> -    ASSERT(mfn_valid(_mfn(gcr3_mfn)));
> -
> -    iommu = find_iommu_for_device(0, mbdf);
> -    if ( !iommu )
> -    {
> -        AMD_IOMMU_DEBUG("%s: Fail to find iommu for bdf %x!\n",
> -                        __func__, mbdf);
> -        return -ENODEV;
> -    }
> -
> -    /* Setup host device entry */
> -    hdom_id = host_domid(d, gdom_id);
> -    req_id = get_dma_requestor_id(iommu->seg, mbdf);
> -    dte_base = iommu->dev_table.buffer;
> -    mdte = &dte_base[req_id];
> -    prev_domid = mdte->domain_id;
> -
> -    spin_lock_irqsave(&iommu->lock, flags);
> -    dte_set_gcr3_table(mdte, hdom_id, gcr3_mfn << PAGE_SHIFT, gv, glx);
> -
> -    spin_unlock_irqrestore(&iommu->lock, flags);
> -
> -    amd_iommu_flush_device(iommu, req_id, prev_domid);
> -
> -    return 0;
> -}
> -
> -static void cf_check guest_iommu_process_command(void *data)
> -{
> -    unsigned long opcode, tail, head, cmd_mfn;
> -    cmd_entry_t *cmd;
> -    struct domain *d = data;
> -    struct guest_iommu *iommu;
> -
> -    iommu = domain_iommu(d);
> -
> -    if ( !iommu->enabled )
> -        return;
> -
> -    head = iommu->cmd_buffer.reg_head.lo;
> -    tail = iommu->cmd_buffer.reg_tail.lo;
> -
> -    /* Tail pointer is rolled over by guest driver, value outside
> -     * cmd_buffer_entries cause iommu disabled
> -     */
> -
> -    if ( tail >= iommu->cmd_buffer.size || head >= iommu->cmd_buffer.size )
> -    {
> -        AMD_IOMMU_DEBUG("Error: guest iommu cmd buffer overflows\n");
> -        guest_iommu_disable(iommu);
> -        return;
> -    }
> -
> -    while ( head != tail )
> -    {
> -        int ret = 0;
> -
> -        cmd_mfn = guest_iommu_get_table_mfn(d,
> -                                            reg_to_u64(iommu->cmd_buffer.reg_base),
> -                                            head);
> -        ASSERT(mfn_valid(_mfn(cmd_mfn)));
> -
> -        cmd = map_domain_page(_mfn(cmd_mfn)) + (head & ~PAGE_MASK);
> -
> -        opcode = get_field_from_reg_u32(cmd->data[1],
> -                                        IOMMU_CMD_OPCODE_MASK,
> -                                        IOMMU_CMD_OPCODE_SHIFT);
> -        switch ( opcode )
> -        {
> -        case IOMMU_CMD_COMPLETION_WAIT:
> -            ret = do_completion_wait(d, cmd);
> -            break;
> -        case IOMMU_CMD_INVALIDATE_DEVTAB_ENTRY:
> -            ret = do_invalidate_dte(d, cmd);
> -            break;
> -        case IOMMU_CMD_INVALIDATE_IOMMU_PAGES:
> -            ret = do_invalidate_pages(d, cmd);
> -            break;
> -        case IOMMU_CMD_INVALIDATE_IOTLB_PAGES:
> -            ret = do_invalidate_iotlb_pages(d, cmd);
> -            break;
> -        case IOMMU_CMD_INVALIDATE_INT_TABLE:
> -            break;
> -        case IOMMU_CMD_COMPLETE_PPR_REQUEST:
> -            ret = do_complete_ppr_request(d, cmd);
> -            break;
> -        case IOMMU_CMD_INVALIDATE_IOMMU_ALL:
> -            ret = do_invalidate_all(d, cmd);
> -            break;
> -        default:
> -            AMD_IOMMU_DEBUG("CMD: Unknown command cmd_type = %lx "
> -                            "head = %ld\n", opcode, head);
> -            break;
> -        }
> -
> -        unmap_domain_page(cmd);
> -        head += sizeof(cmd_entry_t);
> -        if ( head >= iommu->cmd_buffer.size )
> -            head = 0;
> -        if ( ret )
> -            guest_iommu_disable(iommu);
> -    }
> -
> -    /* Now shift cmd buffer head pointer */
> -    iommu->cmd_buffer.reg_head.lo = head;
> -    return;
> -}
> -
> -static int guest_iommu_write_ctrl(struct guest_iommu *iommu, uint64_t val)
> -{
> -    union amd_iommu_control newctrl = { .raw = val };
> -
> -    if ( newctrl.iommu_en )
> -    {
> -        guest_iommu_enable(iommu);
> -        guest_iommu_enable_dev_table(iommu);
> -    }
> -
> -    if ( newctrl.iommu_en && newctrl.cmd_buf_en )
> -    {
> -        guest_iommu_enable_ring_buffer(iommu, &iommu->cmd_buffer,
> -                                       sizeof(cmd_entry_t));
> -        /* Enable iommu command processing */
> -        tasklet_schedule(&iommu->cmd_buffer_tasklet);
> -    }
> -
> -    if ( newctrl.iommu_en && newctrl.event_log_en )
> -    {
> -        guest_iommu_enable_ring_buffer(iommu, &iommu->event_log,
> -                                       sizeof(event_entry_t));
> -        iommu->reg_status.lo |=  IOMMU_STATUS_EVENT_LOG_RUN;
> -        iommu->reg_status.lo &= ~IOMMU_STATUS_EVENT_LOG_OVERFLOW;
> -    }
> -
> -    if ( newctrl.iommu_en && newctrl.ppr_en && newctrl.ppr_log_en )
> -    {
> -        guest_iommu_enable_ring_buffer(iommu, &iommu->ppr_log,
> -                                       sizeof(ppr_entry_t));
> -        iommu->reg_status.lo |=  IOMMU_STATUS_PPR_LOG_RUN;
> -        iommu->reg_status.lo &= ~IOMMU_STATUS_PPR_LOG_OVERFLOW;
> -    }
> -
> -    if ( newctrl.iommu_en && iommu->reg_ctrl.cmd_buf_en &&
> -         !newctrl.cmd_buf_en )
> -    {
> -        /* Disable iommu command processing */
> -        tasklet_kill(&iommu->cmd_buffer_tasklet);
> -    }
> -
> -    if ( iommu->reg_ctrl.event_log_en && !newctrl.event_log_en )
> -        iommu->reg_status.lo &= ~IOMMU_STATUS_EVENT_LOG_RUN;
> -
> -    if ( iommu->reg_ctrl.iommu_en && !newctrl.iommu_en )
> -        guest_iommu_disable(iommu);
> -
> -    iommu->reg_ctrl = newctrl;
> -
> -    return 0;
> -}
> -
> -static uint64_t iommu_mmio_read64(struct guest_iommu *iommu,
> -                                  unsigned long offset)
> -{
> -    uint64_t val;
> -
> -    switch ( offset )
> -    {
> -    case IOMMU_DEV_TABLE_BASE_LOW_OFFSET:
> -        val = reg_to_u64(iommu->dev_table.reg_base);
> -        break;
> -    case IOMMU_CMD_BUFFER_BASE_LOW_OFFSET:
> -        val = reg_to_u64(iommu->cmd_buffer.reg_base);
> -        break;
> -    case IOMMU_EVENT_LOG_BASE_LOW_OFFSET:
> -        val = reg_to_u64(iommu->event_log.reg_base);
> -        break;
> -    case IOMMU_PPR_LOG_BASE_LOW_OFFSET:
> -        val = reg_to_u64(iommu->ppr_log.reg_base);
> -        break;
> -    case IOMMU_CMD_BUFFER_HEAD_OFFSET:
> -        val = reg_to_u64(iommu->cmd_buffer.reg_head);
> -        break;
> -    case IOMMU_CMD_BUFFER_TAIL_OFFSET:
> -        val = reg_to_u64(iommu->cmd_buffer.reg_tail);
> -        break;
> -    case IOMMU_EVENT_LOG_HEAD_OFFSET:
> -        val = reg_to_u64(iommu->event_log.reg_head);
> -        break;
> -    case IOMMU_EVENT_LOG_TAIL_OFFSET:
> -        val = reg_to_u64(iommu->event_log.reg_tail);
> -        break;
> -    case IOMMU_PPR_LOG_HEAD_OFFSET:
> -        val = reg_to_u64(iommu->ppr_log.reg_head);
> -        break;
> -    case IOMMU_PPR_LOG_TAIL_OFFSET:
> -        val = reg_to_u64(iommu->ppr_log.reg_tail);
> -        break;
> -    case IOMMU_CONTROL_MMIO_OFFSET:
> -        val = iommu->reg_ctrl.raw;
> -        break;
> -    case IOMMU_STATUS_MMIO_OFFSET:
> -        val = reg_to_u64(iommu->reg_status);
> -        break;
> -    case IOMMU_EXT_FEATURE_MMIO_OFFSET:
> -        val = iommu->reg_ext_feature.raw;
> -        break;
> -
> -    default:
> -        AMD_IOMMU_DEBUG("Guest reads unknown mmio offset = %lx\n", offset);
> -        val = 0;
> -        break;
> -    }
> -
> -    return val;
> -}
> -
> -static int cf_check guest_iommu_mmio_read(
> -    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *pval)
> -{
> -    struct guest_iommu *iommu = vcpu_iommu(v);
> -    unsigned long offset;
> -    uint64_t val;
> -    uint32_t mmio, shift;
> -    uint64_t mask = 0;
> -
> -    offset = addr - iommu->mmio_base;
> -
> -    if ( unlikely((offset & (len - 1 )) || (len > 8)) )
> -    {
> -        AMD_IOMMU_DEBUG("iommu mmio read access is not aligned:"
> -                        " offset = %lx, len = %x\n", offset, len);
> -        return X86EMUL_UNHANDLEABLE;
> -    }
> -
> -    mask = (len == 8) ? ~0ULL : (1ULL << (len * 8)) - 1;
> -    shift = (offset & 7u) * 8;
> -
> -    /* mmio access is always aligned on 8-byte boundary */
> -    mmio = offset & (~7u);
> -
> -    spin_lock(&iommu->lock);
> -    val = iommu_mmio_read64(iommu, mmio);
> -    spin_unlock(&iommu->lock);
> -
> -    *pval = (val >> shift ) & mask;
> -
> -    return X86EMUL_OKAY;
> -}
> -
> -static void guest_iommu_mmio_write64(struct guest_iommu *iommu,
> -                                    unsigned long offset, uint64_t val)
> -{
> -    switch ( offset )
> -    {
> -    case IOMMU_DEV_TABLE_BASE_LOW_OFFSET:
> -        u64_to_reg(&iommu->dev_table.reg_base, val);
> -        break;
> -    case IOMMU_CMD_BUFFER_BASE_LOW_OFFSET:
> -        u64_to_reg(&iommu->cmd_buffer.reg_base, val);
> -        break;
> -    case IOMMU_EVENT_LOG_BASE_LOW_OFFSET:
> -        u64_to_reg(&iommu->event_log.reg_base, val);
> -        break;
> -    case IOMMU_PPR_LOG_BASE_LOW_OFFSET:
> -        u64_to_reg(&iommu->ppr_log.reg_base, val);
> -        break;
> -    case IOMMU_CONTROL_MMIO_OFFSET:
> -        guest_iommu_write_ctrl(iommu, val);
> -        break;
> -    case IOMMU_CMD_BUFFER_HEAD_OFFSET:
> -        iommu->cmd_buffer.reg_head.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        break;
> -    case IOMMU_CMD_BUFFER_TAIL_OFFSET:
> -        iommu->cmd_buffer.reg_tail.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        tasklet_schedule(&iommu->cmd_buffer_tasklet);
> -        break;
> -    case IOMMU_EVENT_LOG_HEAD_OFFSET:
> -        iommu->event_log.reg_head.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        break;
> -    case IOMMU_EVENT_LOG_TAIL_OFFSET:
> -        iommu->event_log.reg_tail.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        break;
> -    case IOMMU_PPR_LOG_HEAD_OFFSET:
> -        iommu->ppr_log.reg_head.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        break;
> -    case IOMMU_PPR_LOG_TAIL_OFFSET:
> -        iommu->ppr_log.reg_tail.lo = val & IOMMU_RING_BUFFER_PTR_MASK;
> -        break;
> -    case IOMMU_STATUS_MMIO_OFFSET:
> -        val &= IOMMU_STATUS_EVENT_LOG_OVERFLOW |
> -               IOMMU_STATUS_EVENT_LOG_INT |
> -               IOMMU_STATUS_COMP_WAIT_INT |
> -               IOMMU_STATUS_PPR_LOG_OVERFLOW |
> -               IOMMU_STATUS_PPR_LOG_INT |
> -               IOMMU_STATUS_GAPIC_LOG_OVERFLOW |
> -               IOMMU_STATUS_GAPIC_LOG_INT;
> -        u64_to_reg(&iommu->reg_status, reg_to_u64(iommu->reg_status) & ~val);
> -        break;
> -
> -    default:
> -        AMD_IOMMU_DEBUG("guest writes unknown mmio offset = %lx,"
> -                        " val = %" PRIx64 "\n", offset, val);
> -        break;
> -    }
> -}
> -
> -static int cf_check guest_iommu_mmio_write(
> -    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long val)
> -{
> -    struct guest_iommu *iommu = vcpu_iommu(v);
> -    unsigned long offset;
> -    uint64_t reg_old, mmio;
> -    uint32_t shift;
> -    uint64_t mask = 0;
> -
> -    offset = addr - iommu->mmio_base;
> -
> -    if ( unlikely((offset & (len - 1)) || (len > 8)) )
> -    {
> -        AMD_IOMMU_DEBUG("iommu mmio write access is not aligned:"
> -                        " offset = %lx, len = %x\n", offset, len);
> -        return X86EMUL_UNHANDLEABLE;
> -    }
> -
> -    mask = (len == 8) ? ~0ULL : (1ULL << (len * 8)) - 1;
> -    shift = (offset & 7) * 8;
> -
> -    /* mmio access is always aligned on 8-byte boundary */
> -    mmio = offset & ~7;
> -
> -    spin_lock(&iommu->lock);
> -
> -    reg_old = iommu_mmio_read64(iommu, mmio);
> -    reg_old &= ~(mask << shift);
> -    val = reg_old | ((val & mask) << shift);
> -    guest_iommu_mmio_write64(iommu, mmio, val);
> -
> -    spin_unlock(&iommu->lock);
> -
> -    return X86EMUL_OKAY;
> -}
> -
> -int guest_iommu_set_base(struct domain *d, uint64_t base)
> -{
> -    p2m_type_t t;
> -    struct guest_iommu *iommu = domain_iommu(d);
> -
> -    if ( !iommu )
> -        return -EACCES;
> -
> -    iommu->mmio_base = base;
> -    base >>= PAGE_SHIFT;
> -
> -    for ( int i = 0; i < IOMMU_MMIO_PAGE_NR; i++ )
> -    {
> -        unsigned long gfn = base + i;
> -
> -        get_gfn_query(d, gfn, &t);
> -        p2m_change_type_one(d, gfn, t, p2m_mmio_dm);
> -        put_gfn(d, gfn);
> -    }
> -
> -    return 0;
> -}
> -
> -/* Initialize mmio read only bits */
> -static void guest_iommu_reg_init(struct guest_iommu *iommu)
> -{
> -    union amd_iommu_ext_features ef = {
> -        /* Support prefetch */
> -        .flds.pref_sup = 1,
> -        /* Support PPR log */
> -        .flds.ppr_sup = 1,
> -        /* Support guest translation */
> -        .flds.gt_sup = 1,
> -        /* Support invalidate all command */
> -        .flds.ia_sup = 1,
> -        /* Host translation size has 6 levels */
> -        .flds.hats = HOST_ADDRESS_SIZE_6_LEVEL,
> -        /* Guest translation size has 6 levels */
> -        .flds.gats = GUEST_ADDRESS_SIZE_6_LEVEL,
> -        /* Single level gCR3 */
> -        .flds.glx_sup = GUEST_CR3_1_LEVEL,
> -        /* 9 bit PASID */
> -        .flds.pas_max = PASMAX_9_bit,
> -    };
> -
> -    iommu->reg_ext_feature = ef;
> -}
> -
> -static int cf_check guest_iommu_mmio_range(struct vcpu *v, unsigned long addr)
> -{
> -    struct guest_iommu *iommu = vcpu_iommu(v);
> -
> -    return iommu && addr >= iommu->mmio_base &&
> -           addr < iommu->mmio_base + IOMMU_MMIO_SIZE;
> -}
> -
> -static const struct hvm_mmio_ops iommu_mmio_ops = {
> -    .check = guest_iommu_mmio_range,
> -    .read = guest_iommu_mmio_read,
> -    .write = guest_iommu_mmio_write
> -};
> -
> -/* Domain specific initialization */
> -int guest_iommu_init(struct domain* d)
> -{
> -    struct guest_iommu *iommu;
> -    struct domain_iommu *hd = dom_iommu(d);
> -
> -    if ( !is_hvm_domain(d) || !is_iommu_enabled(d) || !iommuv2_enabled ||
> -         !has_viommu(d) )
> -        return 0;
> -
> -    iommu = xzalloc(struct guest_iommu);
> -    if ( !iommu )
> -    {
> -        AMD_IOMMU_DEBUG("Error allocating guest iommu structure.\n");
> -        return 1;
> -    }
> -
> -    guest_iommu_reg_init(iommu);
> -    iommu->mmio_base = ~0ULL;
> -    iommu->domain = d;
> -    hd->arch.amd.g_iommu = iommu;
> -
> -    tasklet_init(&iommu->cmd_buffer_tasklet, guest_iommu_process_command, d);
> -
> -    spin_lock_init(&iommu->lock);
> -
> -    register_mmio_handler(d, &iommu_mmio_ops);
> -
> -    return 0;
> -}
> -
> -void guest_iommu_destroy(struct domain *d)
> -{
> -    struct guest_iommu *iommu;
> -
> -    iommu = domain_iommu(d);
> -    if ( !iommu )
> -        return;
> -
> -    tasklet_kill(&iommu->cmd_buffer_tasklet);
> -    xfree(iommu);
> -
> -    dom_iommu(d)->arch.amd.g_iommu = NULL;
> -}
> -- 
> 2.34.1
> 

