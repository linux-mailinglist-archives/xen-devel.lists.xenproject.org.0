Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8E2D50DE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 03:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48924.86589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBis-0003ub-3l; Thu, 10 Dec 2020 02:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48924.86589; Thu, 10 Dec 2020 02:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBir-0003tv-W4; Thu, 10 Dec 2020 02:30:25 +0000
Received: by outflank-mailman (input) for mailman id 48924;
 Thu, 10 Dec 2020 02:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBiq-0003tB-1I
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:30:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efbef8a4-8b7f-41ae-bfed-d1116a81e6e2;
 Thu, 10 Dec 2020 02:30:23 +0000 (UTC)
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
X-Inumbo-ID: efbef8a4-8b7f-41ae-bfed-d1116a81e6e2
Date: Wed, 9 Dec 2020 18:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607567422;
	bh=PdaMRgLLFYsRMRdD15V8WbneeRY6Ve49Y+a9ouPszoU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=MKBtfF870VSV7oIWK/93lGGVs+Gz9P5jdsBZSgepUS7C/fOIikaVWn9VoB6OYZyBm
	 d28m0fjvLMw9JjwR8OQFnmGaGsQh+NPcmuXQVO+OGh4Cpdwj/yZjZg0grnlGwntudD
	 PflyUFclYm/1DW1gfj+XQQQhfK5YpHujxXykBJPkI5cXeTgsVtRNuz89DWXFoPFieW
	 vRaq63Rcpp70lM9oVe74riKdnCuKLdTftPyTuvUWz4TEVr75BvN+zM0HbJ4EJJyeLr
	 cYJ/kLm6mlaVRKmtdFzqvbEBRaXdNdkC4rQB4uf7baQ6M+b8IGa3NTdlsruq34egbe
	 3unM1ZIgrcZzg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, jbeulich@suse.com, 
    xadimgnik@gmail.com
Subject: Re: [PATCH V3 14/23] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <31e35f5d-5ab4-19bf-e36b-8e7c0b7bf7d4@gmail.com>
Message-ID: <alpine.DEB.2.21.2012091750420.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-15-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2012091357430.20986@sstabellini-ThinkPad-T480s> <31e35f5d-5ab4-19bf-e36b-8e7c0b7bf7d4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Oleksandr wrote:
> > > +#ifdef CONFIG_IOREQ_SERVER
> > > +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
> > > +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> > > +                             struct vcpu *v, mmio_info_t *info);
> > > +#else
> > > +static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
> > > +                                          struct vcpu *v)
> > > +{
> > > +    return IO_UNHANDLED;
> > > +}
> > > +
> > > +static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> > > +                                           struct vcpu *v, mmio_info_t
> > > *info)
> > > +{
> > > +    return IO_UNHANDLED;
> > > +}
> > > +#endif
> > If we are providing stub functions, then we can also provide stub
> > functions for:
> > 
> > ioreq_domain_init
> > ioreq_server_destroy_all
> > 
> > and avoid the ifdefs.
> I got your point. These are common IOREQ interface functions, which
> declarations live in the common header, should I provide
> stubs in the common ioreq.h?
 
I'd prefer that, but if Jan and Paul don't want to have them I won't insist.
 
 
> > > +bool ioreq_complete_mmio(void);
> > > +
> > > +static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
> > > +{
> > > +    /*
> > > +     * TODO: For Arm64, the main user will be PCI. So this should be
> > > +     * implemented when we add support for vPCI.
> > > +     */
> > > +    ASSERT_UNREACHABLE();
> > > +    return true;
> > > +}
> > > +
> > > +static inline void msix_write_completion(struct vcpu *v)
> > > +{
> > > +}
> > > +
> > > +static inline bool arch_vcpu_ioreq_completion(enum io_completion
> > > io_completion)
> > > +{
> > > +    ASSERT_UNREACHABLE();
> > > +    return true;
> > > +}
> > > +
> > > +/*
> > > + * The "legacy" mechanism of mapping magic pages for the IOREQ servers
> > > + * is x86 specific, so the following hooks don't need to be implemented
> > > on Arm:
> > > + * - arch_ioreq_server_map_pages
> > > + * - arch_ioreq_server_unmap_pages
> > > + * - arch_ioreq_server_enable
> > > + * - arch_ioreq_server_disable
> > > + */
> > > +static inline int arch_ioreq_server_map_pages(struct ioreq_server *s)
> > > +{
> > > +    return -EOPNOTSUPP;
> > > +}
> > > +
> > > +static inline void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
> > > +{
> > > +}
> > > +
> > > +static inline void arch_ioreq_server_enable(struct ioreq_server *s)
> > > +{
> > > +}
> > > +
> > > +static inline void arch_ioreq_server_disable(struct ioreq_server *s)
> > > +{
> > > +}
> > > +
> > > +static inline void arch_ioreq_server_destroy(struct ioreq_server *s)
> > > +{
> > > +}
> > > +
> > > +static inline int arch_ioreq_server_map_mem_type(struct domain *d,
> > > +                                                 struct ioreq_server *s,
> > > +                                                 uint32_t flags)
> > > +{
> > > +    return -EOPNOTSUPP;
> > > +}
> > > +
> > > +static inline bool arch_ioreq_server_destroy_all(struct domain *d)
> > > +{
> > > +    return true;
> > > +}
> > > +
> > > +static inline int arch_ioreq_server_get_type_addr(const struct domain *d,
> > > +                                                  const ioreq_t *p,
> > > +                                                  uint8_t *type,
> > > +                                                  uint64_t *addr)
> > > +{
> > > +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
> > > +        return -EINVAL;
> > > +
> > > +    *type = (p->type == IOREQ_TYPE_PIO) ?
> > > +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> > > +    *addr = p->addr;
> > This function is not used in this patch and PIOs are left unimplemented
> > according to a few comments, so I am puzzled by this code here. Do we
> > need it?
> Yes. It is called from ioreq_server_select (common/ioreq.c). I could just skip
> PIO case and use
> *type = XEN_DMOP_IO_RANGE_MEMORY, but I didn't want to diverge.
 
I see. OK then.

