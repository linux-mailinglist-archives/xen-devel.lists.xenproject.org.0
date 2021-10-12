Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A842D42A7F7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207377.363184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJRU-0003lo-M1; Tue, 12 Oct 2021 15:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207377.363184; Tue, 12 Oct 2021 15:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJRU-0003jI-J6; Tue, 12 Oct 2021 15:11:48 +0000
Received: by outflank-mailman (input) for mailman id 207377;
 Tue, 12 Oct 2021 15:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJRT-0003jC-06
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJRS-0003ZK-UY
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:11:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJRS-0003Nc-Ta
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:11:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJRN-0004hC-IT; Tue, 12 Oct 2021 16:11:41 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=OJI774lIs/2GfmpiDFKJPlNU3bksOf/OlkxlAnheqq8=; b=lx2BW0EPJ/Kn+NuYWozm9KgaW2
	dtseHZcsMhzoFWEp1bv2GHyMiOFT0hcKYgiaP76JBBF9PU3HtensiOSUs+PulEC7BIHUDg6Qh2aLe
	nf8yMBsjhJ+LB64I6cFMuz+FZgahJc+cjCGRl5hRri/kLo6MpVFRlMLXEQi3l4HrdpWI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.42413.176126.124248@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 16:11:41 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <alpine.DEB.2.21.2110111300030.25528@sstabellini-ThinkPad-T480s>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
	<1633974539-7380-3-git-send-email-olekstysh@gmail.com>
	<alpine.DEB.2.21.2110111300030.25528@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for DomU"):
> On Mon, 11 Oct 2021, Oleksandr Tyshchenko wrote:
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
> >   currently.
> > - The ACPI case is not covered.
> > 
> > ***
> > 
> > The algorithm to choose extended regions for non-direct mapped
> > DomU is simpler in comparison with the algorithm for direct mapped
> > Dom0. We usually have a lot of unused space above 4GB, and might
> > have some unused space below 4GB (depends on guest memory size).
> > Try to allocate separate 2MB-aligned extended regions from the first
> > (below 4GB) and second (above 4GB) RAM banks taking into the account
> > the maximum supported guest physical address space size and the amount
> > of memory assigned to the guest. The minimum size of extended region
> > the same as for Dom0 (64MB).
> > 
> > Suggested-by: Julien Grall <jgrall@amazon.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

On the basis of that and the diffstat:

Acked-by: Ian Jackson <iwj@xenproject.org>

