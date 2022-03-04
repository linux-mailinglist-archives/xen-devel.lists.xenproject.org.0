Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560754CE041
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 23:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284952.484196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQGVB-0002KL-2P; Fri, 04 Mar 2022 22:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284952.484196; Fri, 04 Mar 2022 22:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQGVA-0002Hh-Ul; Fri, 04 Mar 2022 22:34:20 +0000
Received: by outflank-mailman (input) for mailman id 284952;
 Fri, 04 Mar 2022 22:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYUj=TP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nQGV9-0002Hb-L4
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 22:34:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a63e8d5-9c0b-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 23:34:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 733EBB8267A;
 Fri,  4 Mar 2022 22:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBA0C340E9;
 Fri,  4 Mar 2022 22:34:15 +0000 (UTC)
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
X-Inumbo-ID: 3a63e8d5-9c0b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646433256;
	bh=0ebbo65qulgWXdNvja7rdvXSwwm0zXnuWaiv+v5qJws=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y/DuXe2BZnb3D9B1aZj+4t/7WE7qT4O0UA2SOOmPJs6b4ctr6XRDixsxSSm/0/91m
	 1rA5W22pmJacqZLPhmGwIxT+goOIbiq9sRGsgBlyYbnEKSK3g4nyrHsl2r67MoLOxO
	 kCwWROsLynVZ+9fuZoNbpm4SVBDFD5ZT7Vl29a0R/7QQ8uo1I6DuK88b5APxQNXk4V
	 +sDSJN0+JePxY/S8yi5sR/tyE1jveXBVm0PUXCUuJZRMi8EnI772sHhq6pgSNMa9/n
	 L7fJDaTjbzF2mEsvQ02LNJxjyVZPr0+hMEWPEgYSVl9BEU8FIyM1i/TPmtsOWYMi/l
	 kEssZ/UeOr8sA==
Date: Fri, 4 Mar 2022 14:34:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, stefanos@xilinx.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    wl@xen.org, paul@xen.org, roger.pau@citrix.com
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
In-Reply-To: <4ad9d776-88b7-30ea-01a7-3f6bfc1a6bde@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2203041430360.3261@ubuntu-linux-20-04-desktop>
References: <20220301124022.10168-1-ayankuma@xilinx.com> <20220301124022.10168-4-ayankuma@xilinx.com> <alpine.DEB.2.22.394.2203031736140.3261@ubuntu-linux-20-04-desktop> <4ad9d776-88b7-30ea-01a7-3f6bfc1a6bde@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Mar 2022, Ayan Kumar Halder wrote:
> On 04/03/2022 01:43, Stefano Stabellini wrote:
> > On Tue, 1 Mar 2022, Ayan Kumar Halder wrote:
> > > If the abort was caused due to access to stage1 translation table, Xen
> > > will assume that the stage1 translation table is in the non MMIO region.
> > > It will try to resolve the translation fault. If it succeeds, it will
> > > return to the guest to retry the instruction. If not, then it means
> > > that the table is in MMIO region which is not expected by Xen. Thus,
> > > Xen will forward the abort to the guest.
> > > 
> > > Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> > > ---
> > > 
> > > Changelog :-
> > > 
> > > v1..v8 - NA
> > > 
> > > v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
> > > instructions (for which ISS is not..." into a separate patch of its own.
> > > The reason being this is an existing bug in the codebase.
> > > 
> > >   xen/arch/arm/io.c    | 11 +++++++++++
> > >   xen/arch/arm/traps.c | 12 +++++++++++-
> > >   2 files changed, 22 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> > > index bea69ffb08..ebcb8ed548 100644
> > > --- a/xen/arch/arm/io.c
> > > +++ b/xen/arch/arm/io.c
> > > @@ -128,6 +128,17 @@ void try_decode_instruction(const struct
> > > cpu_user_regs *regs,
> > >           return;
> > >       }
> > >   +    /*
> > > +     * At this point, we know that the stage1 translation table is in the
> > > MMIO
> > > +     * region. This is not expected by Xen and thus it forwards the abort
> > > to the
> > > +     * guest.
> > > +     */
> > > +    if ( info->dabt.s1ptw )
> > > +    {
> > > +        info->dabt_instr.state = INSTR_ERROR;
> > > +        return;
> > > +    }
> > > +
> > >       /*
> > >        * Armv8 processor does not provide a valid syndrome for decoding
> > > some
> > >        * instructions. So in order to process these instructions, Xen must
> > > diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > > index 120c971b0f..e491ca15d7 100644
> > > --- a/xen/arch/arm/traps.c
> > > +++ b/xen/arch/arm/traps.c
> > > @@ -1923,6 +1923,7 @@ static void do_trap_stage2_abort_guest(struct
> > > cpu_user_regs *regs,
> > >       bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
> > >       mmio_info_t info;
> > >       enum io_state state;
> > > +    bool check_mmio_region = true;
> > >         /*
> > >        * If this bit has been set, it means that this stage-2 abort is
> > > caused
> > > @@ -1987,7 +1988,16 @@ static void do_trap_stage2_abort_guest(struct
> > > cpu_user_regs *regs,
> > >            */
> > >           if ( !is_data || !info.dabt.valid )
> > >           {
> > > -            if ( check_p2m(is_data, gpa) )
> > > +            /*
> > > +             * If the translation fault was caused due to access to stage
> > > 1
> > > +             * translation table, then we try to set the translation
> > > table entry
> > > +             * for page1 translation table (assuming that it is in the
> > > non mmio
> >                        ^ stage1
> > 
> > Do you mean to say maybe:
> Yes, it should be stage1. Sorry for typo.
> > 
> > If the translation fault was caused by an access to stage 1 translation
> > table, then no need to change the stage 2 p2m.
> > 
> > ?
> 
> The translation fault was caused due to access to stage1 translation table. As
> per my understanding, the address of stage1 tables is in stage2 translation
> table entries. Thus, Xen needs to modify the corresponding stage2 p2m entries.

OK, I follow what you are saying and what this patch is doing now. I suggest:

If the translation fault was caused due to access to the stage 1
translation table, then we try to set the p2m entry for the stage 1
translation table, but we don't handle stage 1 translation tables in
MMIO regions.

