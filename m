Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88CA1E7682
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZJ7-0004lX-Rx; Fri, 29 May 2020 07:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeZJ6-0004lS-8b
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:19:56 +0000
X-Inumbo-ID: cbc07ddc-a17c-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbc07ddc-a17c-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=6zV0oe34hSDj/zcEpfFGNXe/u7D9RyLAlVlrm2Kn2Kg=; b=Clui/u5OW7nAkQJDPf5thdO0x5
 qCl+SXF9d+aAFisb0SOQwTd4m9E+XQx1X1WzRycuc3NgqnCPyFCRmBsxwZJh+duw8JzvgLWHH1qQX
 pvkKZtCKhyuCicHHwsaLPldwg4YBWG9DR0kMDp9bjJgFYjV7QwCeEDSx8ZxphSqUEbbM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeZJ3-0004lN-RA; Fri, 29 May 2020 07:19:53 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeZJ3-0000LL-BG; Fri, 29 May 2020 07:19:53 +0000
Date: Fri, 29 May 2020 09:19:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200529071930.GI1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 28, 2020 at 07:54:35PM +0100, Julien Grall wrote:
> Hi Bertrand,
> 
> Thank you for the patch.
> 
> On 28/05/2020 16:25, Bertrand Marquis wrote:
> > +static int map_runstate_area(struct vcpu *v,
> > +                    struct vcpu_register_runstate_memory_area *area)
> > +{
> > +    unsigned long offset = area->addr.p & ~PAGE_MASK;
> > +    void *mapping;
> > +    struct page_info *page;
> > +    size_t size = sizeof(struct vcpu_runstate_info);
> > +
> > +    ASSERT(runstate_guest(v) == NULL);
> > +
> > +    /* do not allow an area crossing 2 pages */
> > +    if ( offset > (PAGE_SIZE - size) )
> > +        return -EINVAL;
> 
> This is a change in behavior for the guest. If we are going forward with
> this, this will want a separate patch with its own explanation why this is
> done.

I don't think we can go this route without supporting crossing a page
boundary.

Linux will BUG if VCPUOP_register_runstate_memory_area fails, and
AFAICT there's no check in Linux to assure the runstate area doesn't
cross a page boundary. If we want to go this route we must support the
area crossing a page boundary, or else we will break existing
guests.

> > +
> > +#ifdef CONFIG_ARM
> > +    page = get_page_from_gva(v, area->addr.p, GV2M_WRITE);
> 
> A guest is allowed to setup the runstate for a different vCPU than the
> current one. This will lead to get_page_from_gva() to fail as the function
> cannot yet work with a vCPU other than current.
> 
> AFAICT, there is no restriction on when the runstate hypercall can be
> called. So this can even be called before the vCPU is brought up.
> 
> I was going to suggest to use the current vCPU for translating the address.
> However, it would be reasonable for an OS to use the same virtual address
> for all the vCPUs assuming the page-tables are different per vCPU.

Hm, it's a tricky question. Using the current vCPU page tables would
seem like a good compromise, but it needs to get added to the header
as a note, and this should ideally be merged at the start of a
development cycle to get people time to test and report issues.

> Recent Linux are using a per-cpu area, so the virtual address should be
> different for each vCPU. But I don't know how the other OSes works. Roger
> should be able to help for FreeBSD at least.

FreeBSD doesn't use VCPUOP_register_runstate_memory_area at all, so we
are safe in that regard.

I never got around to implementing the required scheduler changes in
order to support stolen time accounting.  Note sure this has changed
since I last checked, the bhyve and KVM guys also had interest in
properly accounting for stolen time on FreeBSD IIRC.

Roger.

