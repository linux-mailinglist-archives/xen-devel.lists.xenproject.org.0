Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F0B3C59D
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102416.1455026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8a9-0003Jb-V6; Fri, 29 Aug 2025 23:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102416.1455026; Fri, 29 Aug 2025 23:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8a9-0003HB-Rt; Fri, 29 Aug 2025 23:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1102416;
 Fri, 29 Aug 2025 23:32:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8a8-0003H5-E5
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:32:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8a4-00Cpeg-1Q;
 Fri, 29 Aug 2025 23:32:28 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8a4-008KTD-16;
 Fri, 29 Aug 2025 23:32:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=7XVWKj+YHZljnd+likF6sai6bysi1RJmXfdyZDTolsA=; b=
	eloVgpiYcpoc9Devxlg5zyWyOBxLGfq2Kg2Hts4oOOl0NTYv1DlmALHdpRsKgn6eR5YnZN65fHz0m
	wrvL6ZXX7ZXDl/Uo2KpQSlbiPlY53LrcFSW6vwo+V0f5+z+bHVyp8VkvW6j8OZBEg7e8xgzq4Y4D2
	/iIDYC9TzTvPUDag0=;
From: dmukhin@xen.org
Date: Fri, 29 Aug 2025 16:32:27 -0700
To: Julien Grall <julien@xen.org>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com,
	sstabellini@kernel.org, dmukhin@ford.com,
	Julien Grall <jgrall@amazon.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Message-ID: <aLI4i6b4Rj6dxSgN@kraken>
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-2-dmukhin@ford.com>
 <hlQvT3yzXwHz2dJDxz53PkSVeYE749juFbdANDoY5-sdMFnB1DoFoznSNKcn9avAneT3IersSiDICENwHhosHg==@protonmail.internalid>
 <304cffd8-498d-447f-a8b0-cda694393ec8@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304cffd8-498d-447f-a8b0-cda694393ec8@xen.org>

On Wed, Aug 20, 2025 at 10:33:16PM +0100, Julien Grall wrote:
> Hi Denis,
> 
> On 12/08/2025 23:30, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations:
> >
> >    1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> >
> >    2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
> >       max_init_domid (both Arm and x86).
> >
> > The domain ID allocation covers dom0 or late hwdom, predefined domains,
> > post-boot domains, excluding Xen system domains (domid >=
> > DOMID_FIRST_RESERVED).
> >
> > It makes sense to have a common helper code for such task across architectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Note, fixing dependency on max_init_domid is out of scope of this patch.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> > new common/domid.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use it if
> >    ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
> >    starting from the last used ID.
> >    Implementation guarantees that two consecutive calls will never return the
> >    same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
> >    excluded from the allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
>  > Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>  > ---> Changes since v15:
> > - fixup for check after the first pass in the bitarray in domid_alloc()
> 
> This was a good catch from Jan. Has a unit-test been added for this issue?

So I looked into how to plumb the test.
The boundary conditions tests are there for IDs: 0, DOMID_FIRST_RESERVED-1,
DOMID_FIRST_RESERVED.

But to actually check that 

        domid_t bound = DOMID_FIRST_RESERVED;

        domid = find_next_zero_bit(domid_bitmap, bound, domid_last + 1);
        if ( domid >= bound ...

I need to write a test harness for bit manipulation and it is a project on its
own to make hypervisor's bitops compiled for the host...

> 
> Anyway, my reviewed-by holds.
> 
> Cheers,
> 
> --
> Julien Grall
> 

