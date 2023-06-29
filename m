Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F687430DB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 01:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557217.870371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0jp-0003RX-0r; Thu, 29 Jun 2023 23:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557217.870371; Thu, 29 Jun 2023 23:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0jo-0003Oe-TE; Thu, 29 Jun 2023 23:07:44 +0000
Received: by outflank-mailman (input) for mailman id 557217;
 Thu, 29 Jun 2023 23:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qF0jn-0003OY-Mw
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 23:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf107eaf-16d1-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 01:07:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 277366157B;
 Thu, 29 Jun 2023 23:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644A7C433C8;
 Thu, 29 Jun 2023 23:07:38 +0000 (UTC)
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
X-Inumbo-ID: bf107eaf-16d1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688080059;
	bh=eHuxqGCOgEpGzPJjVKPT+fqxuNUX2ko7dB92ou2+uW0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C7csTxqxqzNxB/cbYbTunsfo7spfdHc9fF6G4aW9eO2ehxs8FuP2dfZYs0Nf+GHCI
	 BiwR+uUewrJU35FFT/2BwaBbwbIw5Y6YkJ0Ny0onfNpUG198i1mK+21xjjSthKcmji
	 WbwOqgXTiULvJfzdzbzuodyhUapjgyLCMHj0k/x/lTmYtiole4mkEUiuGqmObYbYMr
	 HdfFUX25Jz6sQLjje5ceTHug0ukPRP61xB7CghmylEeWf4bI20ALarycYuLyst924/
	 4gZc7H+fXidyv80j8NiS3X9ALDK5Pp5/JSDggi84lJvAgbb98C3WBdYVFgCpkahtgv
	 ZBhu3GAL2BtkA==
Date: Thu, 29 Jun 2023 16:07:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Luca.Fancellu@arm.com, 
    michal.orzel@amd.com, Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>, 
    federico.serafini@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
In-Reply-To: <49bf12fb-8c71-40d9-a40b-ddcfa24356df@xen.org>
Message-ID: <alpine.DEB.2.22.394.2306291607280.3936094@ubuntu-linux-20-04-desktop>
References: <20230629210150.69525-1-julien@xen.org> <49bf12fb-8c71-40d9-a40b-ddcfa24356df@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2023, Julien Grall wrote:
> Sorry I forgot to CC Bertrand and Stefano.
> 
> 
> On 29/06/2023 22:01, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > Both the stub and the x86 prototypes for replace_grant_host_mapping()
> > and create_grant_host_mapping() will define the first parameter (and
> > third for the former) as uint64_t. Yet Arm will define it as
> > 'unsigned long'.
> > 
> > While there are no differences for 64-bit, for 32-bit it means
> > that the address should be truncated as 32-bit guest could support
> > up to 40-bit addresses.
> > 
> > So replace 'unsigned long' with 'uint64_t' for the first parameter
> > (and third parameter for replace_grant_host_mapping()).
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > 
> > Cc: federico.serafini@bugseng.com
> > ---
> >   xen/arch/arm/include/asm/grant_table.h | 6 +++---
> >   xen/arch/arm/mm.c                      | 6 +++---
> >   2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/xen/arch/arm/include/asm/grant_table.h
> > b/xen/arch/arm/include/asm/grant_table.h
> > index f2d115b97d8b..d3c518a926b9 100644
> > --- a/xen/arch/arm/include/asm/grant_table.h
> > +++ b/xen/arch/arm/include/asm/grant_table.h
> > @@ -36,10 +36,10 @@ static inline bool gnttab_release_host_mappings(const
> > struct domain *d)
> >       return true;
> >   }
> >   -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> > +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> >                                 unsigned int flags, unsigned int
> > cache_flags);
> > -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> > -                               unsigned long new_gpaddr, unsigned int
> > flags);
> > +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> > +                               uint64_t new_gpaddr, unsigned int flags);
> >     /*
> >    * The region used by Xen on the memory will never be mapped in DOM0
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index 0a3e1f3b64b6..53773368d036 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
> >       return;
> >   }
> >   -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> > +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> >                                 unsigned int flags, unsigned int
> > cache_flags)
> >   {
> >       int rc;
> > @@ -1600,8 +1600,8 @@ int create_grant_host_mapping(unsigned long gpaddr,
> > mfn_t frame,
> >           return GNTST_okay;
> >   }
> >   -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> > -                               unsigned long new_gpaddr, unsigned int
> > flags)
> > +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> > +                               uint64_t new_gpaddr, unsigned int flags)
> >   {
> >       gfn_t gfn = gaddr_to_gfn(gpaddr);
> >       struct domain *d = current->domain;
> 
> -- 
> Julien Grall
> 

