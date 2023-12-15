Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA0815180
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655364.1023118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFJm-0002xu-E8; Fri, 15 Dec 2023 21:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655364.1023118; Fri, 15 Dec 2023 21:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFJm-0002ul-Ae; Fri, 15 Dec 2023 21:01:58 +0000
Received: by outflank-mailman (input) for mailman id 655364;
 Fri, 15 Dec 2023 21:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFJk-0002dN-6Q
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:01:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d169105-9b8d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 22:01:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF044627A6;
 Fri, 15 Dec 2023 21:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7339C433C8;
 Fri, 15 Dec 2023 21:01:51 +0000 (UTC)
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
X-Inumbo-ID: 2d169105-9b8d-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674113;
	bh=O2RuI3xmzIwwGqozyus2XuyWTx0BEzOms47qRRmXgok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QwAZHZfTXqFj89eq/eW2JglJ9T51SshUy5dM89ykyi5ZxrA/anC6D3BRcMGvIaCS1
	 ZjMjLwUc5qIe9vE8LO65/Y3NpE55ut/LZsqHvR1srQoyBSPI2Tc3UiVEutqCBzM3Ys
	 UZk0i2YhV0zVNBxUezwhcywpUMNhI3YZuCEUugrVzgpjHYGd80mF0VWcdFFVAHSHaa
	 B0EdKpVDg6Vq46ZreXeQ/LEb7iu4Q/ivbWe7vfE5YfHs+8Z5c0O5SglfN9Ok1qYyYK
	 AoyTIes0zSjZZ7kisIryqncvXqFXCaewSKQ2lzB8+Jv7JYfM3oSlLPwqS+Uoj7Ds15
	 piLUQyry2TMiQ==
Date: Fri, 15 Dec 2023 13:01:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312151124490.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com> <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com> <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com> <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com> <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org> <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com> <CA+zSX=YHW3kGFroNDzwQg=EhEe3F_fw3gCd_9W+P2UxC7+g+0A@mail.gmail.com> <0166dd5b-c12e-40d8-88a6-1f3c97bcf2e0@xen.org>
 <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Jan Beulich wrote:
> On 14.12.2023 20:10, Julien Grall wrote:
> > On 14/12/2023 14:15, George Dunlap wrote:
> >> But I do think that it's fair to ask Julien to think about a suitable
> >> wording, since the comment is in a sense to remind him (or other ARM
> >> maintainers) what's needed, and since the eventual solution will be
> >> something to do with the ARM code and architecture anyway.
> > 
> > The comment is for anyone using !NUMA (i.e. all architectures but x86) 
> > :). What about the following (this is Nicola's patch with the comments 
> > reworked):
> 
> This clearly is better, yet then ...
> 
> > --- a/xen/arch/arm/include/asm/numa.h
> > +++ b/xen/arch/arm/include/asm/numa.h
> > @@ -2,8 +2,9 @@
> >   #define __ARCH_ARM_NUMA_H
> > 
> >   #include <xen/mm.h>
> > +#include <xen/types.h>
> > 
> > -typedef u8 nodeid_t;
> > +typedef uint8_t nodeid_t;
> > 
> >   #ifndef CONFIG_NUMA
> > 
> > @@ -11,12 +12,6 @@ typedef u8 nodeid_t;
> >   #define cpu_to_node(cpu) 0
> >   #define node_to_cpumask(node)   (cpu_online_map)
> > 
> > -/*
> > - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> > - * is required because the dummy helpers are using it.
> > - */
> > -extern mfn_t first_valid_mfn;
> > -
> >   /* XXX: implement NUMA support */
> >   #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> >   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> > diff --git a/xen/arch/ppc/include/asm/numa.h 
> > b/xen/arch/ppc/include/asm/numa.h
> > index 7fdf66c3da74..888de2dbd1eb 100644
> > --- a/xen/arch/ppc/include/asm/numa.h
> > +++ b/xen/arch/ppc/include/asm/numa.h
> > @@ -1,8 +1,8 @@
> >   #ifndef __ASM_PPC_NUMA_H__
> >   #define __ASM_PPC_NUMA_H__
> > 
> > -#include <xen/types.h>
> >   #include <xen/mm.h>
> > +#include <xen/types.h>
> > 
> >   typedef uint8_t nodeid_t;
> > 
> > @@ -10,12 +10,6 @@ typedef uint8_t nodeid_t;
> >   #define cpu_to_node(cpu) 0
> >   #define node_to_cpumask(node)   (cpu_online_map)
> > 
> > -/*
> > - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> > - * is required because the dummy helpers are using it.
> > - */
> > -extern mfn_t first_valid_mfn;
> > -
> >   /* XXX: implement NUMA support */
> >   #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> >   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> > index 9b5df74fddab..d874525916ea 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -255,8 +255,10 @@ static PAGE_LIST_HEAD(page_broken_list);
> >    */
> > 
> >   /*
> > - * first_valid_mfn is exported because it is use in ARM specific NUMA
> > - * helpers. See comment in arch/arm/include/asm/numa.h.
> > + * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
> > + *
> > + * TODO: Consider if we can conditionally export first_valid_mfn based
> > + * on whether NUMA is selected.
> >    */
> >   mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
> > 
> > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > index 3d9b2d05a5c8..a13a9a46ced7 100644
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned 
> > long e);
> >   /* Retrieve the MFN mapped by VA in Xen virtual address space. */
> >   mfn_t xen_map_to_mfn(unsigned long va);
> > 
> > +extern mfn_t first_valid_mfn;
> > +
> >   /*
> >    * Create only non-leaf page table entries for the
> >    * page range in Xen virtual address space.
> 
> ... I still disagree with the placement here (should be xen/numa.h imo),

This is where I would call it "good enough" and close it for now. I
think we should commit such a patch (Julien's patch with the placement
in xen/numa.h).

Anything else...


> and I still don't see why we can't carry out the TODO right away, if we
> have to touch all of this anyway. If it's really too much to ask from
> the original contributor, I can certainly see about making a patch myself
> (and I've now added this to my short-term TODO list).

... can still be done later whenever you get to it.

