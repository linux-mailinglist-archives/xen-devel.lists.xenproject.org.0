Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E6457A9F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Nov 2021 03:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228324.395060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moGF8-0001q6-Ah; Sat, 20 Nov 2021 02:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228324.395060; Sat, 20 Nov 2021 02:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moGF8-0001nz-7h; Sat, 20 Nov 2021 02:36:42 +0000
Received: by outflank-mailman (input) for mailman id 228324;
 Sat, 20 Nov 2021 02:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAp4=QH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1moGF7-0001nt-DV
 for xen-devel@lists.xenproject.org; Sat, 20 Nov 2021 02:36:41 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b003d3ea-49aa-11ec-9787-a32c541c8605;
 Sat, 20 Nov 2021 03:36:39 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A6161A38;
 Sat, 20 Nov 2021 02:36:37 +0000 (UTC)
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
X-Inumbo-ID: b003d3ea-49aa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637375798;
	bh=UCystQLtnuRhjyd7uhfmMLfoucOCOaU357iQhWa2I8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TSa3eCbprLXEYi8p4EQqGSg7oZAjoEUHJ0rFRVUJ9VBl6gAMbE5uEbunw133Hvn2X
	 YyY8zamDrjZjsDMVHXU0g6mq3un7wtUaWyJ5otO3ITuNDZHMKQ+kKtVzFf3Pk+fJHA
	 j2egM0PD4FidzdI61K/qIho7UyBuVf4q1XG9qozPzv4Bb3H+EDEbGuKsQzqPOUXRWd
	 La1mxvI0FwOH2R2Mg/OHnP/Rzaz9Ex8sEok27kgMte2pNBO2Qzw1Wnkc7rK6cN5nUT
	 mGGKCihIOLesTWCK8TcMw2xJ5gtxvjgSJ360MEBtnTVvHJdZcitbkMRB+E3mE6nJQe
	 AZ5JA/gMIpk4Q==
Date: Fri, 19 Nov 2021 18:36:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 4/4] arm/xen: Read extended regions from DT and init
 Xen resource
In-Reply-To: <ee5a226b-0e12-8823-0961-bf2fe0bd494e@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111191820130.1412361@ubuntu-linux-20-04-desktop>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com> <1635264312-3796-5-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2110271803060.20134@sstabellini-ThinkPad-T480s> <237f832d-5175-5653-18ee-058a7d7fa7a6@gmail.com>
 <alpine.DEB.2.22.394.2111181701110.1412361@ubuntu-linux-20-04-desktop> <ee5a226b-0e12-8823-0961-bf2fe0bd494e@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-126447730-1637374814=:1412361"
Content-ID: <alpine.DEB.2.22.394.2111191821110.1412361@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-126447730-1637374814=:1412361
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2111191821111.1412361@ubuntu-linux-20-04-desktop>

On Fri, 19 Nov 2021, Oleksandr wrote:
> On 19.11.21 03:19, Stefano Stabellini wrote:
> > On Wed, 10 Nov 2021, Oleksandr wrote:
> > > On 28.10.21 04:40, Stefano Stabellini wrote:
> > > 
> > > Hi Stefano
> > > 
> > > I am sorry for the late response.
> > > 
> > > > On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
> > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > 
> > > > > This patch implements arch_xen_unpopulated_init() on Arm where
> > > > > the extended regions (if any) are gathered from DT and inserted
> > > > > into passed Xen resource to be used as unused address space
> > > > > for Xen scratch pages by unpopulated-alloc code.
> > > > > 
> > > > > The extended region (safe range) is a region of guest physical
> > > > > address space which is unused and could be safely used to create
> > > > > grant/foreign mappings instead of wasting real RAM pages from
> > > > > the domain memory for establishing these mappings.
> > > > > 
> > > > > The extended regions are chosen by the hypervisor at the domain
> > > > > creation time and advertised to it via "reg" property under
> > > > > hypervisor node in the guest device-tree. As region 0 is reserved
> > > > > for grant table space (always present), the indexes for extended
> > > > > regions are 1...N.
> > > > > 
> > > > > If arch_xen_unpopulated_init() fails for some reason the default
> > > > > behaviour will be restored (allocate xenballooned pages).
> > > > > 
> > > > > This patch also removes XEN_UNPOPULATED_ALLOC dependency on x86.
> > > > > 
> > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > ---
> > > > > Changes RFC -> V2:
> > > > >      - new patch, instead of
> > > > >       "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to
> > > > > provide
> > > > > unallocated space"
> > > > > ---
> > > > >    arch/arm/xen/enlighten.c | 112
> > > > > +++++++++++++++++++++++++++++++++++++++++++++++
> > > > >    drivers/xen/Kconfig      |   2 +-
> > > > >    2 files changed, 113 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> > > > > index dea46ec..1a1e0d3 100644
> > > > > --- a/arch/arm/xen/enlighten.c
> > > > > +++ b/arch/arm/xen/enlighten.c
> > > > > @@ -62,6 +62,7 @@ static __read_mostly unsigned int xen_events_irq;
> > > > >    static phys_addr_t xen_grant_frames;
> > > > >      #define GRANT_TABLE_INDEX   0
> > > > > +#define EXT_REGION_INDEX    1
> > > > >      uint32_t xen_start_flags;
> > > > >    EXPORT_SYMBOL(xen_start_flags);
> > > > > @@ -303,6 +304,117 @@ static void __init xen_acpi_guest_init(void)
> > > > >    #endif
> > > > >    }
> > > > >    +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
> > > > > +int arch_xen_unpopulated_init(struct resource *res)
> > > > > +{
> > > > > +	struct device_node *np;
> > > > > +	struct resource *regs, *tmp_res;
> > > > > +	uint64_t min_gpaddr = -1, max_gpaddr = 0;
> > > > > +	unsigned int i, nr_reg = 0;
> > > > > +	struct range mhp_range;
> > > > > +	int rc;
> > > > > +
> > > > > +	if (!xen_domain())
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	np = of_find_compatible_node(NULL, NULL, "xen,xen");
> > > > > +	if (WARN_ON(!np))
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	/* Skip region 0 which is reserved for grant table space */
> > > > > +	while (of_get_address(np, nr_reg + EXT_REGION_INDEX, NULL,
> > > > > NULL))
> > > > > +		nr_reg++;
> > > > > +	if (!nr_reg) {
> > > > > +		pr_err("No extended regions are found\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
> > > > > +	if (!regs)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	/*
> > > > > +	 * Create resource from extended regions provided by the
> > > > > hypervisor to
> > > > > be
> > > > > +	 * used as unused address space for Xen scratch pages.
> > > > > +	 */
> > > > > +	for (i = 0; i < nr_reg; i++) {
> > > > > +		rc = of_address_to_resource(np, i + EXT_REGION_INDEX,
> > > > > &regs[i]);
> > > > > +		if (rc)
> > > > > +			goto err;
> > > > > +
> > > > > +		if (max_gpaddr < regs[i].end)
> > > > > +			max_gpaddr = regs[i].end;
> > > > > +		if (min_gpaddr > regs[i].start)
> > > > > +			min_gpaddr = regs[i].start;
> > > > > +	}
> > > > > +
> > > > > +	/* Check whether the resource range is within the hotpluggable
> > > > > range
> > > > > */
> > > > > +	mhp_range = mhp_get_pluggable_range(true);
> > > > > +	if (min_gpaddr < mhp_range.start)
> > > > > +		min_gpaddr = mhp_range.start;
> > > > > +	if (max_gpaddr > mhp_range.end)
> > > > > +		max_gpaddr = mhp_range.end;
> > > > > +
> > > > > +	res->start = min_gpaddr;
> > > > > +	res->end = max_gpaddr;
> > > > > +
> > > > > +	/*
> > > > > +	 * Mark holes between extended regions as unavailable. The
> > > > > rest of
> > > > > that
> > > > > +	 * address space will be available for the allocation.
> > > > > +	 */
> > > > > +	for (i = 1; i < nr_reg; i++) {
> > > > > +		resource_size_t start, end;
> > > > > +
> > > > > +		start = regs[i - 1].end + 1;
> > > > > +		end = regs[i].start - 1;
> > > > > +
> > > > > +		if (start > (end + 1)) {
> > > > Should this be:
> > > > 
> > > > if (start >= end)
> > > > 
> > > > ?
> > > Yes, we can do this here (since the checks are equivalent) but ...
> > > 
> > > > > +			rc = -EINVAL;
> > > > > +			goto err;
> > > > > +		}
> > > > > +
> > > > > +		/* There is no hole between regions */
> > > > > +		if (start == (end + 1))
> > > > Also here, shouldn't it be:
> > > > 
> > > > if (start == end)
> > > > 
> > > > ?
> > >     ... not here.
> > > 
> > > As
> > > 
> > > "(start == (end + 1))" is equal to "(regs[i - 1].end + 1 ==
> > > regs[i].start)"
> > > 
> > > but
> > > 
> > > "(start == end)" is equal to "(regs[i - 1].end + 1 == regs[i].start - 1)"
> >   OK. But the check:
> > 
> >    if (start >= end)
> > 
> > Actually covers both cases so that's the only check we need?
> 
> Sorry, I don't entirely understand the question.
> Is the question to use only a single check in that loop?
> 
> Paste the updated code which I have locally for the convenience.
> 
>  [snip]
> 
>     /*
>      * Mark holes between extended regions as unavailable. The rest of that
>      * address space will be available for the allocation.
>      */
>     for (i = 1; i < nr_reg; i++) {
>         resource_size_t start, end;
> 
>         start = regs[i - 1].end + 1;
>         end = regs[i].start - 1;
> 
>         if (start > (end + 1)) {
>             rc = -EINVAL;
>             goto err;
>         }
> 
>         /* There is no hole between regions */
>         if (start == (end + 1))
>             continue;
> 
>         tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
>         if (!tmp_res) {
>             rc = -ENOMEM;
>             goto err;
>         }
> 
>         tmp_res->name = "Unavailable space";
>         tmp_res->start = start;
>         tmp_res->end = end;
> 
>         rc = insert_resource(&xen_resource, tmp_res);
>         if (rc) {
>             pr_err("Cannot insert resource %pR (%d)\n", tmp_res, rc);
>             kfree(tmp_res);
>             goto err;
>         }
>     }
> 
> [snip]
> 
> 
> 1. The first check is to detect an overlap (which is a wrong configuration,
> correct?) and bail out if true (for example, regX: 0x81000000...0x82FFFFFF and
> regY: 0x82000000...0x83FFFFFF).
> 2. The second check is just to skip current iteration as there is no
> space/hole between regions (for example, regX: 0x81000000...0x82FFFFFF and
> regY: 0x83000000...0x83FFFFFF).
> Therefore I think they should be distinguished.
> 
> Yes, both check could be transformed to a single one, but this way the
> overlaps will be ignored:
> if (start >= (end + 1))
>     continue;
> 
> Or I really missed something?

You are right it is better to distinguish the two cases. I suggest the
code below because I think it is a clearer, even if it might be slightly
less efficient. I don't feel too strongly about it though.

		resource_size_t start, end;

		/* There is no hole between regions */
		if ( regs[i - 1].end + 1 == regs[i].start )
			continue;

		if ( regs[i - 1].end + 1 > regs[i].start) {
			rc = -EINVAL;
			goto err;
		}

		start = regs[i - 1].end + 1;
		end = regs[i].start - 1;
--8323329-126447730-1637374814=:1412361--

