Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9634F3E95
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 22:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299273.509854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq5b-0000Ue-Fu; Tue, 05 Apr 2022 20:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299273.509854; Tue, 05 Apr 2022 20:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq5b-0000RO-BY; Tue, 05 Apr 2022 20:47:47 +0000
Received: by outflank-mailman (input) for mailman id 299273;
 Tue, 05 Apr 2022 20:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbq5a-0000R7-BE
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 20:47:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a478f8ba-b521-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 22:47:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63BFF61A5A;
 Tue,  5 Apr 2022 20:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA82C385A1;
 Tue,  5 Apr 2022 20:47:42 +0000 (UTC)
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
X-Inumbo-ID: a478f8ba-b521-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649191662;
	bh=jThJHvveHPmh9n3msvqSSDJayKeD4lI9Qar2n78Bs4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kQK8Kg/dhzICHW0mC05ogn1UgUxaNzAPvNQZVX90LV0M1dkSAx1tZuEWbXjDrXNJu
	 GNrFYBP4/4Dtiz1FLGaHWdNEMk07egCSMJEtuBK9a+55BPQjWIhAHQrGpvbGPqLE0e
	 23S5t/ETqVVsDAq+7Lit0GpwYef8/ikKYdmQgi5gFR90rwqfTK0DRXcExGg8MR0JWT
	 uojG5C7o3GfReK61T1Rtqqn6CSgA711Axb84dK6An2OqlXB9n/7/2Cv+maZdlCf0ts
	 vgDl7H2tgJZfvvcNINaa9Gy2tCLAYjyqRxwcm6lxGQVt1pO/UcbOz79T4ZiHxgxp23
	 xeJ+EoANDMaZg==
Date: Tue, 5 Apr 2022 13:47:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous
 bit
In-Reply-To: <3a164544-7760-1f57-1af6-c80020b604f0@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051347100.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-6-julien@xen.org> <alpine.DEB.2.22.394.2204011639430.2910984@ubuntu-linux-20-04-desktop> <3a164544-7760-1f57-1af6-c80020b604f0@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Apr 2022, Julien Grall wrote:
> On 02/04/2022 00:53, Stefano Stabellini wrote:
> > On Mon, 21 Feb 2022, Julien Grall wrote:
> > > @@ -1333,21 +1386,34 @@ static int xen_pt_update(unsigned long virt,
> > >       while ( left )
> > >       {
> > >           unsigned int order, level;
> > > +        unsigned int nr_contig;
> > > +        unsigned int new_flags;
> > >             level = xen_pt_mapping_level(vfn, mfn, left, flags);
> > >           order = XEN_PT_LEVEL_ORDER(level);
> > >             ASSERT(left >= BIT(order, UL));
> > >   -        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level,
> > > flags);
> > > -        if ( rc )
> > > -            break;
> > > +        /*
> > > +         * Check if we can set the contiguous mapping and update the
> > > +         * flags accordingly.
> > > +         */
> > > +        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
> > > +        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
> > 
> > Here is an optional idea to make the code simpler. We could move the
> > flags changes (adding/removing _PAGE_CONTIG) to xen_pt_check_contig.
> > That way, we could remove the inner loop.
> > 
> > xen_pt_check_contig could check if _PAGE_CONTIG is already set and based
> > on alignment, it should be able to figure out when it needs to be
> > disabled.
> 
> My initial attempt was to do everything in a loop. But this didn't pan out as
> I wanted (I felt the code was complex) and there are extra work to be done for
> the next 31 entries (assuming 4KB granularity).
> 
> Hence the two loops. Unfortunately, I didn't keep my first attempt. So I can't
> realy show what I wrote.

I trusted you that the resulting code with a single loop was worse.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

