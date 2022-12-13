Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A664BFC7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461445.719532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ECx-0001IE-Bg; Tue, 13 Dec 2022 22:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461445.719532; Tue, 13 Dec 2022 22:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ECx-0001Fh-7q; Tue, 13 Dec 2022 22:57:07 +0000
Received: by outflank-mailman (input) for mailman id 461445;
 Tue, 13 Dec 2022 22:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5ECw-0001Ds-2L
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:57:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762f9b1b-7b39-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:57:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3D46B81240;
 Tue, 13 Dec 2022 22:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DD5C433D2;
 Tue, 13 Dec 2022 22:57:01 +0000 (UTC)
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
X-Inumbo-ID: 762f9b1b-7b39-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670972222;
	bh=RZF7YxK9C6fEgXEoXwg7SW0/uTk3r5OCdO1nma8FaRI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ES+3TkobSpNzhjHnBM8KzrgGtuhffCyh57yLxEo2Pi8UxcR6tgUg9BkR7ssaD2cgo
	 k39CvC9aDA80c383xiW4VoTXd8RqL58gwu5Qz2cpuTU6EBXw7oa3JzgquwWKugGrT7
	 9MJRBdCv9hsufdZGBpEdJAdW8YTyLWwPSyqM0EEvmn8d/3VBh9Xn4+6DH3OmJ0qlVX
	 JSXZiafmwR/2lvArmMNyYtfvzxAwhXc86kwEkPhr8+I3UqWG2Tdv1rz3XKH5L4B3HU
	 0mO0xZG1TDB7C+zeiRxkKe12MeA2as3G89rTw1aTKh6ko4ktTUfCg+4C1bwoXwgXYd
	 x1U9t3Kgp+5Nw==
Date: Tue, 13 Dec 2022 14:56:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 18/18] xen/arm64: mm: Rework switch_ttbr()
In-Reply-To: <aa82a916-5c2b-83eb-328d-ac234eabc77c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212131456450.315094@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-19-julien@xen.org> <alpine.DEB.2.22.394.2212121748560.3075842@ubuntu-linux-20-04-desktop> <aa82a916-5c2b-83eb-328d-ac234eabc77c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Dec 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 13/12/2022 02:00, Stefano Stabellini wrote:
> > On Mon, 12 Dec 2022, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
> > > still on.
> > > 
> > > Switching TTBR is like replacing existing mappings with new ones. So
> > > we need to follow the break-before-make sequence.
> > > 
> > > In this case, it means the MMU needs to be switched off while the
> > > TTBR is updated. In order to disable the MMU, we need to first
> > > jump to an identity mapping.
> > > 
> > > Rename switch_ttbr() to switch_ttbr_id() and create an helper on
> > > top to temporary map the identity mapping and call switch_ttbr()
> > > via the identity address.
> > > 
> > > switch_ttbr_id() is now reworked to temporarily turn off the MMU
> > > before updating the TTBR.
> > > 
> > > We also need to make sure the helper switch_ttbr() is part of the
> > > identity mapping. So move _end_boot past it.
> > > 
> > > The arm32 code will use a different approach. So this issue is for now
> > > only resolved on arm64.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > This patch looks overall good to me, aside from the few minor comments
> > below. I would love for someone else, maybe from ARM, reviewing steps
> > 1-6 making sure they are the right sequence.
> > 
> > 
> > > ---
> > > 
> > >      Changes in v2:
> > >          - Remove the arm32 changes. This will be addressed differently
> > >          - Re-instate the instruct cache flush. This is not strictly
> > >            necessary but kept it for safety.
> > >          - Use "dsb ish"  rather than "dsb sy".
> > > 
> > >      TODO:
> > >          * Handle the case where the runtime Xen is loaded at a different
> > >            position for cache coloring. This will be dealt separately.
> > > ---
> > >   xen/arch/arm/arm64/head.S     | 50 +++++++++++++++++++++++------------
> > >   xen/arch/arm/arm64/mm.c       | 39 +++++++++++++++++++++++++++
> > >   xen/arch/arm/include/asm/mm.h |  2 ++
> > >   xen/arch/arm/mm.c             | 14 +++++-----
> > >   4 files changed, 82 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > > index 663f5813b12e..1f69864492b6 100644
> > > --- a/xen/arch/arm/arm64/head.S
> > > +++ b/xen/arch/arm/arm64/head.S
> > > @@ -816,30 +816,46 @@ ENDPROC(fail)
> > >    * Switch TTBR
> > >    *
> > >    * x0    ttbr
> > > - *
> > > - * TODO: This code does not comply with break-before-make.
> > >    */
> > > -ENTRY(switch_ttbr)
> > > -        dsb   sy                     /* Ensure the flushes happen before
> > > -                                      * continuing */
> > > -        isb                          /* Ensure synchronization with
> > > previous
> > > -                                      * changes to text */
> > > -        tlbi   alle2                 /* Flush hypervisor TLB */
> > > -        ic     iallu                 /* Flush I-cache */
> > > -        dsb    sy                    /* Ensure completion of TLB flush */
> > > +ENTRY(switch_ttbr_id)
> > > +        /* 1) Ensure any previous read/write have completed */
> > > +        dsb    ish
> > > +        isb
> > > +
> > > +        /* 2) Turn off MMU */
> > > +        mrs    x1, SCTLR_EL2
> > > +        bic    x1, x1, #SCTLR_Axx_ELx_M
> > 
> > do we need a "dsb   sy" here? we have in enable_mmu
> 
> Hmmm... The explanation of the dsb + isb in enable_mmu makes no sense. The isb
> doesn't flush the I-cache, it just flushes the pipeline.
> 
> For the dsb, I am not convinced it is necessary because we already have the
> 'dsb nsh' above and in any case the barrier seems to be too strong.
> 
> I guess that will be another patch... (probably at a lower priority).
> 
> Now back to your question of the 'dsb' here. There is already a 'dsb ish'
> above. So memory access before turning off the MMU should be completed.
> Also...
> 
> > 
> > 
> > > +        msr    SCTLR_EL2, x1
> > > +        isb
> 
> ... this isb will ensure the completion of SCTLR before the TLBs are flushed
> before. And there should be no memory access (or than instructions here). So I
> don't think the a dsb is needed.
> 
> Would you mind to explain why you think there is one needed?

I am not at all sure whether it is needed or not, I was just noticing
that we have the "dsb sy" in enable_mmu and here we don't.

Thinking about it, the only reason for the additional dsb would be to
make sure that the two operations:

  mrs    x1, SCTLR_EL2
  bic    x1, x1, #SCTLR_Axx_ELx_M

are completed before disabling the MMU:

  msr    SCTLR_EL2, x1

Is that actually a requirement? I don't know.


> > > +
> > > +        /*
> > > +         * 3) Flush the TLBs.
> > > +         * See asm/arm64/flushtlb.h for the explanation of the sequence.
> > > +         */
> > > +        dsb   nshst
> > > +        tlbi  alle2
> > > +        dsb   nsh
> > > +        isb
> > > +
> > > +        /* 4) Update the TTBR */
> > > +        msr   TTBR0_EL2, x0
> > >           isb
> > >   -        msr    TTBR0_EL2, x0
> > > +        /*
> > > +         * 5) Flush I-cache
> > > +         * This should not be necessary but it is kept for safety.
> > > +         */
> > > +        ic     iallu
> > > +        isb
> > >   -        isb                          /* Ensure synchronization with
> > > previous
> > > -                                      * changes to text */
> > > -        tlbi   alle2                 /* Flush hypervisor TLB */
> > > -        ic     iallu                 /* Flush I-cache */
> > > -        dsb    sy                    /* Ensure completion of TLB flush */
> > > +        /* 5) Turn on the MMU */
> > 
> > This should be 6)
> 
> I will update it.
> 
> > 
> > 
> > > +        mrs   x1, SCTLR_EL2
> > > +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
> > > +        msr   SCTLR_EL2, x1
> > >           isb
> > >             ret
> > > -ENDPROC(switch_ttbr)
> > > +ENDPROC(switch_ttbr_id)
> > >     #ifdef CONFIG_EARLY_PRINTK
> > >   /*
> > > diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> > > index 9eaf545ea9dd..2ede4e75ae33 100644
> > > --- a/xen/arch/arm/arm64/mm.c
> > > +++ b/xen/arch/arm/arm64/mm.c
> > > @@ -31,6 +31,15 @@ static void __init prepare_boot_identity_mapping(void)
> > >       lpae_t pte;
> > >       DECLARE_OFFSETS(id_offsets, id_addr);
> > >   +    /*
> > > +     * We will be re-using the boot ID tables. They may not have been
> > > +     * zeroed but they should be unlinked. So it is fine to use
> > > +     * clear_page().
> > > +     */
> > > +    clear_page(boot_first_id);
> > > +    clear_page(boot_second_id);
> > > +    clear_page(boot_third_id);
> > 
> > Could this code be in patch #15?
> 
> Yes, I can't remember why I decided to clear them in patch #18.
> 
> > >       if ( id_offsets[0] != 0 )
> > >           panic("Cannot handled ID mapping above 512GB\n");
> > >   @@ -111,6 +120,36 @@ void update_identity_mapping(bool enable)
> > >       BUG_ON(rc);
> > >   }
> > >   +extern void switch_ttbr_id(uint64_t ttbr);
> > > +
> > > +typedef void (switch_ttbr_fn)(uint64_t ttbr);
> > > +
> > > +void __init switch_ttbr(uint64_t ttbr)
> > > +{
> > > +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
> > > +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
> > > +    lpae_t pte;
> > > +
> > > +    /* Enable the identity mapping in the boot page tables */
> > 
> > See below...
> > 
> > > +    update_identity_mapping(true);
> > > +    /* Enable the identity mapping in the runtime page tables */
> > > +    pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
> > > +    pte.pt.table = 1;
> > > +    pte.pt.xn = 0;
> > > +    pte.pt.ro = 1;
> > > +    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
> > > +
> > > +    /* Switch TTBR */
> > > +    fn(ttbr);
> > > +
> > > +    /*
> > > +     * Disable the identity mapping in the runtime page tables.
> > > +     * Note it is not necessary to disable it in the boot page tables
> > > +     * because they are not going to be used by this CPU anymore.
> > > +     */
> > 
> > ...is update_identity_mapping acting on the boot pagetables or the
> > runtime pagetables? The two comments make me think that
> > update_identity_mapping is enabling mapping in the boot pagetables and
> > removing them from the runtime pagetable, which would be strangely
> > inconsistent.
> 
> update_identity_mapping() is acting on the live page-tables (i.e. the one
> pointed by TTBR_EL2).
> 
> Before switch_ttbr(), this will be the boot page-tables. But after, this will
> be the runtime page-tables.
> 
> Would the following comment on top of the declaration of
> update_identity_mapping() clarifies it:
> 
> "Enable/disable the identity mapping in the live page-tables (i.e. the one
> pointed by TTBR_EL2)."

Thank you!

