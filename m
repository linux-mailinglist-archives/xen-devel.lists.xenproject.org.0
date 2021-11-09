Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA2D44B950
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 00:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224152.387271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaOW-0006PD-SA; Tue, 09 Nov 2021 23:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224152.387271; Tue, 09 Nov 2021 23:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaOW-0006MX-Nu; Tue, 09 Nov 2021 23:19:12 +0000
Received: by outflank-mailman (input) for mailman id 224152;
 Tue, 09 Nov 2021 23:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkaOV-0006LU-1t
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 23:19:11 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d0f587-41b3-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 00:19:09 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B07561184;
 Tue,  9 Nov 2021 23:19:08 +0000 (UTC)
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
X-Inumbo-ID: 70d0f587-41b3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636499948;
	bh=FFjPKzikGdtAZlqMGgATjqEKTT6MB/ASWMyaUFJxqcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rWyO2fM6V2O7NBZlotkpDhQq1p3bjUmbJULFekPajRxjf5Z32f4T7bzjYRVERV0K8
	 cefIXsZgmPqQzPHoUB8KaoyOS1rB9MRjrXjMn40wFj4EuYs63a+MQuem3ZripdHChs
	 W4Ni0Iw4fRXqibI7V+MWZ8ULt+wbkdTtFsGczJNW7zoBZ6nTk23tvcbl2ZPucjg2Uw
	 DRC4hr/6V3YOGqmXBpBW4pu0ZyWQRwtU0x/kdzmpaAyEhNtMXgM4PfrQbM5MCRAeMz
	 /ptYH/kVqyy1uDIXOahMAujLs34LiS6ut97KSPK1VjoXAyAeyaJaXCqkg1qwuOUY+7
	 X+XJv2B7ofBRQ==
Date: Tue, 9 Nov 2021 15:19:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Penny.Zheng@arm.com, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, iwj@xenproject.org, 
    Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH for-4.16] xen/arm: don't assign domU static-mem to dom0
 as reserved-memory
In-Reply-To: <9ba4f9ea-d393-bcb6-22ac-0cdb930ad15a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111091518330.440530@ubuntu-linux-20-04-desktop>
References: <20211109004808.115906-1-sstabellini@kernel.org> <9ba4f9ea-d393-bcb6-22ac-0cdb930ad15a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Nov 2021, Julien Grall wrote:
> On 09/11/2021 00:48, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > DomUs static-mem ranges are added to the reserved_mem array for
> > accounting, but they shouldn't be assigned to dom0 as the other regular
> > reserved-memory ranges in device tree.
> > 
> > In make_memory_nodes, fix the error by skipping banks with xen_domain
> > set to true in the reserved-memory array. Also make sure to use the
> > first valid (!xen_domain) start address for the memory node name.
> > 
> 
> This is a bug fix. So please add a Fixes tag. In this case, I think it should
> be:
> 
> Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")

Thanks, will add



> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > 
> > This patch should be considered for 4.16 as it fixes an incorrect
> > behavior.
> > 
> > The risk is low for two reasons:
> > - the change is simple
> > - make_memory_node is easily tested because it gets called at every
> >    boot, e.g. gitlab-ci and OSSTest exercise this path
> > 
> > I tested this patch successfully with and without xen,static-mem.
> > 
> > ---
> >   xen/arch/arm/domain_build.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 1fbafeaea8..56d3ff9d08 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -874,11 +874,17 @@ static int __init make_memory_node(const struct domain
> > *d,
> >       if ( mem->nr_banks == 0 )
> >           return -ENOENT;
> >   +    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> > +        ;
> > +    /* No reserved-memory ranges to expose to Dom0 */
> I find this comment a bit misleading because make_memory_node() will also be
> called to create normal memory region. I would drop "reserved-memory" and add
> a comment on top of the loop explaining what the loop does.

Yeah, I agree, I moved it and changed it


> > +    if ( i == mem->nr_banks )
> > +        return 0;
> > +
> >       dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
> >                  reg_size, nr_cells);
> 
> I think you need to adjust nr_cells otherwise we would write garbagge in the
> DT if we need to exclude some regions.

Good point! Fixed in the next version


> >         /* ePAPR 3.4 */
> > -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
> > +    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> >       res = fdt_begin_node(fdt, buf);
> >       if ( res )
> >           return res;
> > @@ -888,11 +894,14 @@ static int __init make_memory_node(const struct domain
> > *d,
> >           return res;
> >         cells = &reg[0];
> > -    for ( i = 0 ; i < mem->nr_banks; i++ )
> > +    for ( ; i < mem->nr_banks; i++ )
> >       {
> >           u64 start = mem->bank[i].start;
> >           u64 size = mem->bank[i].size;
> >   +        if ( mem->bank[i].xen_domain )
> > +            continue;
> > +
> >           dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
> >                      i, start, start + size);


