Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9B4232EB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 23:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202533.357499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXs6e-0001o3-Tn; Tue, 05 Oct 2021 21:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202533.357499; Tue, 05 Oct 2021 21:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXs6e-0001lj-QE; Tue, 05 Oct 2021 21:36:12 +0000
Received: by outflank-mailman (input) for mailman id 202533;
 Tue, 05 Oct 2021 21:36:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXs6d-0001ld-T1
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 21:36:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41ca3360-2624-11ec-bf18-12813bfff9fa;
 Tue, 05 Oct 2021 21:36:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05D06615A3;
 Tue,  5 Oct 2021 21:36:09 +0000 (UTC)
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
X-Inumbo-ID: 41ca3360-2624-11ec-bf18-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633469770;
	bh=YqAo10Q6c6Ntcw77oIEBE73z4W5HOSuzMrtpiAVLMUM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZLjeiNJVK7lxK+7DhTTGcVKC19QZJBpioOwBqqXFiFovTLWat7TrudAIYhCmbz8LT
	 Z22pJzRq+lsYTbqVy9HDRyndV6CFWbA71IU1FyR3jUfJEn6Y7TypEH7gl3BWVOqsR/
	 SQ6oxtsd2IV+C5AjRuvt2QWwvcKeV1FImiK67AW/ZrOJ+gY350eUvbXDYbF8X/Ub3+
	 hCnJ5z90rwjuIhk+AFv1fha1VjcCU9yqtjxYL9UEl57uCaQgE4u+DZIA/c5RICcmFb
	 FbHple7JOfOsMLzzxOBD6qlWL/yucuY31cxsaxFa1PPBcwNcoooRXZqtNOTBmv48Sr
	 ZaYxSmVIeT88g==
Date: Tue, 5 Oct 2021 14:36:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V4 3/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <c0184478-4af1-d9e8-a527-49ae7eebcc70@gmail.com>
Message-ID: <alpine.DEB.2.21.2110051435200.3209@sstabellini-ThinkPad-T480s>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com> <1632955927-27911-4-git-send-email-olekstysh@gmail.com> <c0184478-4af1-d9e8-a527-49ae7eebcc70@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Oct 2021, Oleksandr wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > The extended region (safe range) is a region of guest physical
> > address space which is unused and could be safely used to create
> > grant/foreign mappings instead of wasting real RAM pages from
> > the domain memory for establishing these mappings.
> > 
> > The extended regions are chosen at the domain creation time and
> > advertised to it via "reg" property under hypervisor node in
> > the guest device-tree. As region 0 is reserved for grant table
> > space (always present), the indexes for extended regions are 1...N.
> > If extended regions could not be allocated for some reason,
> > Xen doesn't fail and behaves as usual, so only inserts region 0.
> > 
> > Please note the following limitations:
> > - The extended region feature is only supported for 64-bit domain
> >    currently.
> > - The ACPI case is not covered.
> > 
> > ***
> > 
> > The algorithm to choose extended regions for non-direct mapped
> > DomU is simpler in comparison with the algorithm for direct mapped
> > Dom0. As we have a lot of unused space above 4GB, provide single
> > 2MB-aligned region from the second RAM bank taking into the account
> > the maximum supported guest address space size and the amount of
> > memory assigned to the guest. The maximum size of the region is 128GB.
> > The minimum size is 64MB.
> > 
> > Suggested-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Acked-by: Ian Jackson <iwj@xenproject.org>
> > Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> > Tested-by: Michal Orzel <michal.orzel@arm.com>
> 
> I though a bit more on this and decided to make a patch more functional by
> trying to also allocate extended region below 4GB, I think we could do with
> it.
> Actually if guest memory size is less than GUEST_RAM0_SIZE, we are able to
> provide unused space. I have tested with with various guest memory sizes and
> it worked fine. Also I decided to drop limit for maximum extended region size
> (128GB), we don't apply this limit in Dom0 and I don't see why we need it
> here, moreover the calculation became more obvious. I will drop all acks and
> send updated version. Are there any objections?

I am OK with it; it looks like you made good improvements. One caveat is
that I volunteer to review again no problem, but we'll need a new ack
from Ian Jackson to commit.

