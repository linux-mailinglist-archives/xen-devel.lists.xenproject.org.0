Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483A4F9F8B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 00:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301796.515111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncwwX-00024x-Ri; Fri, 08 Apr 2022 22:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301796.515111; Fri, 08 Apr 2022 22:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncwwX-00021x-OS; Fri, 08 Apr 2022 22:19:01 +0000
Received: by outflank-mailman (input) for mailman id 301796;
 Fri, 08 Apr 2022 22:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncwwV-00021p-Mm
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 22:18:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e171128d-b789-11ec-a405-831a346695d4;
 Sat, 09 Apr 2022 00:18:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D017B60DED;
 Fri,  8 Apr 2022 22:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D559BC385A3;
 Fri,  8 Apr 2022 22:18:54 +0000 (UTC)
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
X-Inumbo-ID: e171128d-b789-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649456335;
	bh=P72IJTfyX5wTvkkZ91YmO4OIrFD4AplLOs/qTBkcNW0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UU+N2DunvjyfDzXP1EQbtkjJj1H8ppNt2riqkNqybXU/MjVrkE7lXu+ayoFffQ2UP
	 nESomDbsTfB/q2DS0xwetv5F9OXLOqt1gLqgxfZbAXhJSUxpVTK+Ir3olDW/EIdtXi
	 uOiMLOi1RfgAbp4MFy964KQQn5ta6YPaEJFZTtuIcwWWiSObNUiBDs1YVqWEz68Jyt
	 IGZwW5uotLIJ0pGhhtxX15e2h9Nm6Oy+JGcpreUw7+fpJ6lUV2EDU0jsAbYrInjTPw
	 gaULCbsC6PVuazqTaqOX7lRZQOWeMJixUfo+MK7K5XN/F5UDh9QqYy+XsteDbBT8aS
	 bnTNIoJbz1u6A==
Date: Fri, 8 Apr 2022 15:18:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
In-Reply-To: <DU2PR08MB732540A4196E8634B4D8A579F71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204081516400.3066615@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-7-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop> <DU2PR08MB732540A4196E8634B4D8A579F71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Mar 2022, Penny Zheng wrote:
> Hi Stefano
> 
> Sorry for the late response, got sidetracked an emergency issue. ;/
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabelliHini@kernel.org>
> > Sent: Friday, March 18, 2022 10:00 AM
> > To: Penny Zheng <Penny.Zheng@arm.com>
> > Cc: xen-devel@lists.xenproject.org; nd <nd@arm.com>; Stefano Stabellini
> > <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>
> > Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign
> > mapping for borrower domain
> > 
> > On Fri, 11 Mar 2022, Penny Zheng wrote:
> > > From: Penny Zheng <penny.zheng@arm.com>
> > >
> > > This commits introduces a new helper guest_physmap_add_shm to set up
> > > shared memory foreign mapping for borrower domain.
> > >
> > > Firstly it should get and take reference of statically shared pages
> > > from owner dom_shared. Then it will setup P2M foreign memory map of
> > > these statically shared pages for borrower domain.
> > >
> > > This commits only considers owner domain is the default dom_shared,
> > > the other scenario will be covered in the following patches.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > ---
> > >  xen/arch/arm/domain_build.c | 52
> > > +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 984e70e5fc..8cee5ffbd1 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -798,6 +798,48 @@ static int __init allocate_shared_memory(struct
> > domain *d,
> > >      return ret;
> > >  }
> > >
> > > +static int __init guest_physmap_add_shm(struct domain *od, struct domain
> > *bd,
> > > +                                        unsigned long o_gfn,
> > > +                                        unsigned long b_gfn,
> > > +                                        unsigned long nr_gfns)
> > 
> > They should probably be gfn_t type
> > 
> >
>  
> Sure, will do.
> 
> > > +{
> > > +    struct page_info **pages = NULL;
> > > +    p2m_type_t p2mt, t;
> > > +    int ret = 0;
> > > +
> > > +    pages = xmalloc_array(struct page_info *, nr_gfns);
> > > +    if ( !pages )
> > > +        return -ENOMEM;
> > > +
> > > +    /*
> > > +     * Take reference of statically shared pages from owner domain.
> > > +     * Reference will be released when destroying shared memory region.
> > > +     */
> > > +    ret = get_pages_from_gfn(od, o_gfn, nr_gfns, pages, &p2mt, P2M_ALLOC);
> > > +    if ( ret )
> > > +    {
> > > +        ret = -EINVAL;
> > > +        goto fail_pages;
> > > +    }
> > > +
> > > +    if ( p2m_is_ram(p2mt) )
> > > +        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw :
> > p2m_map_foreign_ro;
> > > +    else
> > > +    {
> > > +        ret = -EINVAL;
> > > +        goto fail_pages;
> > > +    }
> > 
> > One idea is to initialize p2mt = p2m_ram_rw and pass it to
> > get_pages_from_gfn. Then get_pages_from_gfn can return error immediately
> > if any of the pages are of different type.
> > 
> > This way there is no need for checking again here.
> >
> 
> Right now, the memory attribute of static shared memory is RW as default,
> What if we add memory attribute setting in device tree configuration, sometimes,
> Users want to specify that borrower domain only has RO right, hmm, then the
> Initialization for p2mt could be either p2m_ram_rw or p2m_ram_ro?
> In such case, we could add another parameter in guest_physmap_add_shm to
> show the p2m type...
> Hope I understand what you suggested here.

Yes, I think I understand. I think your suggestion is OK too. However,
your suggestion is much more work than mine: I was only suggesting a
small improvement limited to guest_physmap_add_shm and
get_pages_from_gfn. Your suggestion involves a device tree change that
would have a larger impact on the patch series. So if you are up for it,
I am happy to review it. I am also fine just to have a small improvement
on guest_physmap_add_shm/get_pages_from_gfn.

