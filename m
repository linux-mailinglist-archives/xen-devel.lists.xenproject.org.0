Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209425AA56A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 03:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397144.637627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvxm-0005su-1S; Fri, 02 Sep 2022 01:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397144.637627; Fri, 02 Sep 2022 01:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvxl-0005qO-Ua; Fri, 02 Sep 2022 01:59:17 +0000
Received: by outflank-mailman (input) for mailman id 397144;
 Fri, 02 Sep 2022 01:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTvxk-0005WC-Dt
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:59:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8229f5b-2a62-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:59:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57FEA60B4A;
 Fri,  2 Sep 2022 01:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC28DC433D6;
 Fri,  2 Sep 2022 01:59:12 +0000 (UTC)
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
X-Inumbo-ID: d8229f5b-2a62-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662083953;
	bh=LJWxUcaoKkGNDEB6WfgguSAcJ9dxDaxVrCgSQH66V48=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fY4qIv2vqofT8d3nHtKOjamsUmlA0vzTw4cKiNgPBrV2eSA/dQKtJG0P2Ltmff8Ao
	 0MBcts/qdgwxIOm/UaZRMaS9xaxyTPHynM8vuSaih0wtBvNAzI3KktPHBEh76rxb1P
	 Q3HG6PB4R/ufcDmCpfGRJbn66Xwz1dQYc0sxZey/7ANCmuW13ecfIk4eAUHKuf5Aqp
	 nVI9gjeMw/IdCFsCqOjq236P0LDpy1if5+YVbhYUPpk/gzLGpUidREAVRlwCU0Iy07
	 sKIgISuX7BrsbR6t+Cv0MZV25vAl5SMq/VZT2rLQqKs9+lrLKH1csw6ZloG8n85Hzh
	 UvIlE8FtTUKYQ==
Date: Thu, 1 Sep 2022 18:59:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 5/9] xen/arm: Add additional reference to owner domain
 when the owner is allocated
In-Reply-To: <781b03df-5f0d-109c-6253-2b7c4a079ce1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209011858570.3931@ubuntu-linux-20-04-desktop>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com> <20220721132115.3015761-6-Penny.Zheng@arm.com> <781b03df-5f0d-109c-6253-2b7c4a079ce1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Julien Grall wrote:
> Hi Penny,
> 
> On 21/07/2022 14:21, Penny Zheng wrote:
> > Borrower domain will fail to get a page ref using the owner domain
> > during allocation, when the owner is created after borrower.
> > 
> > So here, we decide to get and add the right amount of reference, which
> > is the number of borrowers, when the owner is allocated.
> > 
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> IMHO, this tag should not have been kept given...
> 
> > ---
> > v6 change:
> > - adapt to the change of "nr_shm_borrowers"
> 
> ... this change. 'reviewed-by' means that the person reviewed the code and
> therefore agree with the logic. So I would only keep the tag if the change is
> trivial (including typo, coding style) and would drop it (or confirm with the
> person) otherwise.
> 
> Stefano, can you confirm you are happy that your reviewed-by tag is kept?

Yes I confirm

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > - add in-code comment to explain if the borrower is created first, we intend
> > to
> > add pages in the P2M without reference.
> > ---
> > v5 change:
> > - no change
> > ---
> > v4 changes:
> > - no change
> > ---
> > v3 change:
> > - printk rather than dprintk since it is a serious error
> > ---
> > v2 change:
> > - new commit
> > ---
> >   xen/arch/arm/domain_build.c | 60 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 60 insertions(+)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index a7e95c34a7..e891e800a7 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -761,6 +761,30 @@ static void __init assign_static_memory_11(struct
> > domain *d,
> >   }
> >     #ifdef CONFIG_STATIC_SHM
> > +static int __init acquire_nr_borrower_domain(struct domain *d,
> > +                                             paddr_t pbase, paddr_t psize,
> > +                                             unsigned long *nr_borrowers)
> > +{
> > +    unsigned long bank;
> 
> NIT: AFAICT nr_banks is an "unsigned int".
> 
> Other than that:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

