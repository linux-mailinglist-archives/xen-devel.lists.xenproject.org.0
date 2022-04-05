Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0874F3EC2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 22:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299283.509876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq9W-0002cY-C6; Tue, 05 Apr 2022 20:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299283.509876; Tue, 05 Apr 2022 20:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbq9W-0002ZC-8F; Tue, 05 Apr 2022 20:51:50 +0000
Received: by outflank-mailman (input) for mailman id 299283;
 Tue, 05 Apr 2022 20:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbq9T-0002Yz-Va
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 20:51:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34940f5d-b522-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 22:51:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AA0561A27;
 Tue,  5 Apr 2022 20:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D35C385A1;
 Tue,  5 Apr 2022 20:51:44 +0000 (UTC)
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
X-Inumbo-ID: 34940f5d-b522-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649191904;
	bh=gwoZZkEoIL8R/gdTJMJIG8CvIsCJ56P/SL+aQ/q+E2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PxLlt36j4Jcm5CM2ygweXh84PVJF+iRp2ot0BxJGZh95s2i0r2UM0j5XCYs9QrJIS
	 0SmRYsYhLMC33Qx1RSDRUwzLK8UIbKywqkiaCN2Simc1ZwRiVgeJScv99RKWwRPIq8
	 tX/Kd/DX3SYqO2XGFnpAXAkEKzEXZCDqFLnWxOwf6zY4FOVFp/ZQq60wzv21n2uO1/
	 /Gq1eYoKciqkVX5kwJoQnMKuw1lJj+xmPE2ZbJIQBhRiowlWIKXTvZL6/K1itmLrXa
	 Eo2xgzA+29RzyAmFUfm4Gq1OQJHEtHYYl+KqlbffTWwSVrtJR/btv6RXPIMeIyg9ig
	 md+ous3NHsomA==
Date: Tue, 5 Apr 2022 13:51:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 07/19] xen/arm: mm: Don't open-code Xen PT update in
 remove_early_mappings()
In-Reply-To: <b62e61bd-ea54-e41e-17de-a07dbfe477b7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051350410.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-8-julien@xen.org> <alpine.DEB.2.22.394.2204011700520.2910984@ubuntu-linux-20-04-desktop> <b62e61bd-ea54-e41e-17de-a07dbfe477b7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Apr 2022, Julien Grall wrote:
> On 02/04/2022 01:04, Stefano Stabellini wrote:
> > On Mon, 21 Feb 2022, Julien Grall wrote:
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > Now that xen_pt_update_entry() is able to deal with different mapping
> > > size, we can replace the open-coding of the page-tables update by a call
> > > to modify_xen_mappings().
> > > 
> > > As the function is not meant to fail, a BUG_ON() is added to check the
> > > return.
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > 
> > Nice!
> > 
> > 
> > > ---
> > >      Changes in v2:
> > >          - Stay consistent with how function name are used in the commit
> > >          message
> > >          - Add my AWS signed-off-by
> > > ---
> > >   xen/arch/arm/mm.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > index 7b4b9de8693e..f088a4b2de96 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -599,11 +599,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
> > >     void __init remove_early_mappings(void)
> > >   {
> > > -    lpae_t pte = {0};
> > > -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START),
> > > pte);
> > > -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START +
> > > SZ_2M),
> > > -              pte);
> > > -    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
> > > +    int rc;
> > > +
> > > +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> > > +                             _PAGE_BLOCK);
> > > +    BUG_ON(rc);
> > 
> > Am I right that we are actually destroying the mapping, which usually is
> > done by calling destroy_xen_mappings, but we cannot call
> > destroy_xen_mappings in this case because it doesn't take a flags
> > parameter?
> 
> You are right.
> 
> > 
> > If so, then I would add a flags parameter to destroy_xen_mappings
> > instead of calling modify_xen_mappings just to pass _PAGE_BLOCK.
> > But I don't feel strongly about it so if you don't feel like making the
> > change to destroy_xen_mappings, you can add my acked-by here anyway.
> 
> destroy_xen_mappings() is a function used by common code. This is the only
> place so far where I need to pass _PAGE_BLOCK and I don't expect it to be used
> by the common code any time soon.
> 
> So I am not in favor to add an extra parameter for destroy_xen_mappings().
> 
> Would you prefer if I open-code the call to xen_pt_update?

No need, just add a one-line in-code comment like:

    /* destroy the _PAGE_BLOCK mapping */

