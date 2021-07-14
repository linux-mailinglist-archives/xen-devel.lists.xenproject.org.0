Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6043C7AF2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155868.287673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3TVK-0006SS-Ca; Wed, 14 Jul 2021 01:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155868.287673; Wed, 14 Jul 2021 01:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3TVK-0006QB-9D; Wed, 14 Jul 2021 01:16:02 +0000
Received: by outflank-mailman (input) for mailman id 155868;
 Wed, 14 Jul 2021 01:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3TVI-0006Q5-SU
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 01:16:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b787121-e441-11eb-87c8-12813bfff9fa;
 Wed, 14 Jul 2021 01:15:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9149361370;
 Wed, 14 Jul 2021 01:15:57 +0000 (UTC)
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
X-Inumbo-ID: 0b787121-e441-11eb-87c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626225359;
	bh=aUjeoun5m9ngK6wvUZWenH7niUowpGF+oPTUdVLL4Dk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pr5oQCndxOY2Bp4gkvICV8YJQ7xd8nUZyY+pJ+F+2P+mtKQZwiV93xQJwn/yebD/e
	 dASy80nnf8bsbBSEQT98uCVpAsK8vQZ9mfkXFLSMuBaop10j8CUxVQQyrgiGy5xW25
	 /FehCKoMHS4EOI8Gmp6erxiCCDAZOaZY2fKdA3XfqeJ5V596+4xTsg5VLft8SrTiT8
	 osfpolR3d7bQ6GgNp1K3C+s3awYwCxpFYap4uLksT04bi5MEV0BceCWhIANp0YdB/n
	 fF61kWLTVX5E4VsK9mTjQv1rIjfb+auSxmybcO/wKWSbxW+DhOXtWR9Fll1egQN2Qc
	 Nj70iqDSG+b3Q==
Date: Tue, 13 Jul 2021 18:15:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 3/4] xen: arm: Remove mfn_to_gfn() macro
In-Reply-To: <2e955bd5-efe7-f154-c220-77989b921ca8@arm.com>
Message-ID: <alpine.DEB.2.21.2107131815350.23286@sstabellini-ThinkPad-T480s>
References: <20210703171152.15874-1-julien@xen.org> <20210703171152.15874-4-julien@xen.org> <2e955bd5-efe7-f154-c220-77989b921ca8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Jul 2021, Michal Orzel wrote:
> On 03.07.2021 19:11, Julien Grall wrote:
> > From: Julien Grall <julien.grall@arm.com>
> > 
> > The current implementation of mfn_to_gfn() is completely bogus and
> > there are no plan to implement an M2P on Arm. As there are no more
> > users, drop the helper.
> > 
> s/plan/plans/
> > At the same time rework a comment in Arm code that does not make sense.
> > 
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >     Changes in v5:
> >         - Rebase to the latest Xen
> >         - The patch is now arm only because mfn_to_gmfn() has
> >         been dropped on x86 and the arm helper was renamed to
> >         mfn_to_gfn().
> > 
> >     Changes in v4:
> >         - Remove acks as the patch is old
> > 
> >     Changes in v2:
> >         - Add Jan's and Stefano's acked-by
> > ---
> >  xen/include/asm-arm/mm.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> > index ded74d29da0c..07c24654a0b6 100644
> > --- a/xen/include/asm-arm/mm.h
> > +++ b/xen/include/asm-arm/mm.h
> > @@ -326,9 +326,8 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
> >  #define SHARED_M2P_ENTRY         (~0UL - 1UL)
> >  #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
> >  
> > -/* Xen always owns P2M on ARM */
> > +/* We don't have a M2P on Arm */
> >  #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
> > -#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> >  
> >  /* Arch-specific portion of memory_op hypercall. */
> >  long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
> > 
> 

