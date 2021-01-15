Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F022F6FEA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 02:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67584.120726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DlW-0005gi-Ru; Fri, 15 Jan 2021 01:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67584.120726; Fri, 15 Jan 2021 01:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DlW-0005gM-ON; Fri, 15 Jan 2021 01:19:02 +0000
Received: by outflank-mailman (input) for mailman id 67584;
 Fri, 15 Jan 2021 01:19:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0DlW-0005fW-02
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:19:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e024ac5-e4c6-4f11-a8b1-2351f4dfff45;
 Fri, 15 Jan 2021 01:18:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFE5522CBE;
 Fri, 15 Jan 2021 01:18:58 +0000 (UTC)
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
X-Inumbo-ID: 4e024ac5-e4c6-4f11-a8b1-2351f4dfff45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610673539;
	bh=EF/hR0bvr8LA5u4cMoZSig2KlaxkINiz55ZKE7U43Xc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HdR1T9lN1sT2I7GBmONQSI739QKFjH+dZj5E81cFEfvaThyCZirPi8BEno6nqfHfX
	 P2JvFbUEmtWjSbHbJI+jeGyKRiYtmuy48cId3zrBJP9hpGDIgLgiBZapJ7t6U2P7FT
	 zkQfL421Foy9hw/8uudW6KBqPcyqpmpm1yqqCEUCfo9nxde0gMaHdH8/qrSuyBqhvo
	 hNPBCbY6aX0tx1qxvflH8hRpB7xUZC3Qrzei9a5Bm1r4DSwUnhz3hH9e5iGPyoioqh
	 7tkUKKv/5aRVEOPOSNyr4ViQsPzgxow2J319J1SH3LdWo7A9mswZC4b9MlAlVqazIF
	 4x5EKi5x0s/8A==
Date: Thu, 14 Jan 2021 17:18:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 16/23] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
In-Reply-To: <1606732298-22107-17-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141717150.31265@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-17-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-972880717-1610673539=:31265"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-972880717-1610673539=:31265
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch implements reference counting of foreign entries in
> in set_foreign_p2m_entry() on Arm. This is a mandatory action if
> we want to run emulator (IOREQ server) in other than dom0 domain,
> as we can't trust it to do the right thing if it is not running
> in dom0. So we need to grab a reference on the page to avoid it
> disappearing.
> 
> It is valid to always pass "p2m_map_foreign_rw" type to
> guest_physmap_add_entry() since the current and foreign domains
> would be always different. A case when they are equal would be
> rejected by rcu_lock_remote_domain_by_id(). Besides the similar
> comment in the code put a respective ASSERT() to catch incorrect
> usage in future.
> 
> It was tested with IOREQ feature to confirm that all the pages given
> to this function belong to a domain, so we can use the same approach
> as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().
> 
> This involves adding an extra parameter for the foreign domain to
> set_foreign_p2m_entry() and a helper to indicate whether the arch
> supports the reference counting of foreign entries and the restriction
> for the hardware domain in the common code can be skipped for it.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - new patch, was split from:
>      "[RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features"
>    - rewrite a logic to handle properly reference in set_foreign_p2m_entry()
>      instead of treating foreign entries as p2m_ram_rw
> 
> Changes V1 -> V2:
>    - rebase according to the recent changes to acquire_resource()
>    - update patch description
>    - introduce arch_refcounts_p2m()
>    - add an explanation why p2m_map_foreign_rw is valid
>    - move set_foreign_p2m_entry() to p2m-common.h
>    - add const to new parameter
> 
> Changes V2 -> V3:
>    - update patch description
>    - rename arch_refcounts_p2m() to arch_acquire_resource_check()
>    - move comment to x86’s arch_acquire_resource_check()
>    - return rc in Arm's set_foreign_p2m_entry()
>    - put a respective ASSERT() into Arm's set_foreign_p2m_entry()
> ---
> ---
>  xen/arch/arm/p2m.c           | 24 ++++++++++++++++++++++++
>  xen/arch/x86/mm/p2m.c        |  5 +++--
>  xen/common/memory.c          | 10 +++-------
>  xen/include/asm-arm/p2m.h    | 19 +++++++++----------
>  xen/include/asm-x86/p2m.h    | 16 +++++++++++++---
>  xen/include/xen/p2m-common.h |  4 ++++
>  6 files changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 4eeb867..5b8d494 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1380,6 +1380,30 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
>      return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
>  }
>  
> +int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn)
> +{
> +    struct page_info *page = mfn_to_page(mfn);
> +    int rc;
> +
> +    if ( !get_page(page, fd) )
> +        return -EINVAL;
> +
> +    /*
> +     * It is valid to always use p2m_map_foreign_rw here as if this gets
> +     * called then d != fd. A case when d == fd would be rejected by
> +     * rcu_lock_remote_domain_by_id() earlier. Put a respective ASSERT()
> +     * to catch incorrect usage in future.
> +     */
> +    ASSERT(d != fd);
> +
> +    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
> +    if ( rc )
> +        put_page(page);
> +
> +    return rc;
> +}
> +
>  static struct page_info *p2m_allocate_root(void)
>  {
>      struct page_info *page;
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 7a2ba82..4772c86 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1321,7 +1321,8 @@ static int set_typed_p2m_entry(struct domain *d, unsigned long gfn_l,
>  }
>  
>  /* Set foreign mfn in the given guest's p2m table. */
> -int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn)
> +int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn)
>  {
>      return set_typed_p2m_entry(d, gfn, mfn, PAGE_ORDER_4K, p2m_map_foreign,
>                                 p2m_get_hostp2m(d)->default_access);
> @@ -2621,7 +2622,7 @@ int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
>       * will update the m2p table which will result in  mfn -> gpfn of dom0
>       * and not fgfn of domU.
>       */
> -    rc = set_foreign_p2m_entry(tdom, gpfn, mfn);
> +    rc = set_foreign_p2m_entry(tdom, fdom, gpfn, mfn);
>      if ( rc )
>          gdprintk(XENLOG_WARNING, "set_foreign_p2m_entry failed. "
>                   "gpfn:%lx mfn:%lx fgfn:%lx td:%d fd:%d\n",
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 3363c06..49e3001 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1134,12 +1134,8 @@ static int acquire_resource(
>      xen_pfn_t mfn_list[32];
>      int rc;
>  
> -    /*
> -     * FIXME: Until foreign pages inserted into the P2M are properly
> -     *        reference counted, it is unsafe to allow mapping of
> -     *        resource pages unless the caller is the hardware domain.
> -     */
> -    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
> +    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
> +         !arch_acquire_resource_check() )
>          return -EACCES;
>  
>      if ( copy_from_guest(&xmar, arg, 1) )
> @@ -1207,7 +1203,7 @@ static int acquire_resource(
>  
>          for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>          {
> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>                                         _mfn(mfn_list[i]));
>              /* rc should be -EIO for any iteration other than the first */
>              if ( rc && i )
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 28ca9a8..4f8056e 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -161,6 +161,15 @@ typedef enum {
>  #endif
>  #include <xen/p2m-common.h>
>  
> +static inline bool arch_acquire_resource_check(void)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is supported on Arm.
> +     */
> +    return true;
> +}
> +
>  static inline
>  void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
>  {
> @@ -392,16 +401,6 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, unsigned int order)
>      return gfn_add(gfn, 1UL << order);
>  }
>  
> -static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
> -                                        mfn_t mfn)
> -{
> -    /*
> -     * NOTE: If this is implemented then proper reference counting of
> -     *       foreign entries will need to be implemented.
> -     */
> -    return -EOPNOTSUPP;
> -}
> -
>  /*
>   * A vCPU has cache enabled only when the MMU is enabled and data cache
>   * is enabled.
> diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
> index 4603560..8d2dc22 100644
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -382,6 +382,19 @@ struct p2m_domain {
>  #endif
>  #include <xen/p2m-common.h>
>  
> +static inline bool arch_acquire_resource_check(void)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is not supported on x86.
> +     *
> +     * FIXME: Until foreign pages inserted into the P2M are properly
> +     * reference counted, it is unsafe to allow mapping of
> +     * resource pages unless the caller is the hardware domain.
> +     */
> +    return false;
> +}
> +
>  /*
>   * Updates vCPU's n2pm to match its np2m_base in VMCx12 and returns that np2m.
>   */
> @@ -647,9 +660,6 @@ int p2m_finish_type_change(struct domain *d,
>  int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
>                            unsigned long end);
>  
> -/* Set foreign entry in the p2m table (for priv-mapping) */
> -int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
> -
>  /* Set mmio addresses in the p2m table (for pass-through) */
>  int set_mmio_p2m_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
>                         unsigned int order);
> diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
> index 58031a6..b4bc709 100644
> --- a/xen/include/xen/p2m-common.h
> +++ b/xen/include/xen/p2m-common.h
> @@ -3,6 +3,10 @@
>  
>  #include <xen/mm.h>
>  
> +/* Set foreign entry in the p2m table */
> +int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn);
> +
>  /* Remove a page from a domain's p2m table */
>  int __must_check
>  guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
> -- 
> 2.7.4
> 
--8323329-972880717-1610673539=:31265--

