Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE61E2769
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 18:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdciR-0004q6-8e; Tue, 26 May 2020 16:46:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jdciQ-0004q1-5B
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:46:10 +0000
X-Inumbo-ID: 664aa6a2-9f70-11ea-81bc-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 664aa6a2-9f70-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 16:46:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A0CD20787;
 Tue, 26 May 2020 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590511568;
 bh=98RcdAfJdXvYGhomBt3uJoTyCPPiyKT2lI4hSkGoc6U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ple5w+MpbkZnIDgB7dx2qegDYxlz5l3fOQML0rEwpo5BGTCKuDL4LswMWVG/He8XU
 vO2ref1LVhL+x7z0wBa1Pk9C/JGfldmajj2TuLQo9yldp1JlFhRNJ49yxznh4BJUEC
 1TlvX3/+Mnq+TuTqLewVASgnR+8fulQpzdo/CF3k=
Date: Tue, 26 May 2020 09:46:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
In-Reply-To: <453b58f8-d9ee-bbe7-ac05-b5268620e79f@xen.org>
Message-ID: <alpine.DEB.2.21.2005260941250.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-12-sstabellini@kernel.org>
 <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
 <alpine.DEB.2.21.2004291318270.28941@sstabellini-ThinkPad-T480s>
 <f7f01eca-2415-e102-318f-0c58606fda96@xen.org>
 <453b58f8-d9ee-bbe7-ac05-b5268620e79f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 24 May 2020, Julien Grall wrote:
> On 30/04/2020 14:01, Julien Grall wrote:
> > On 29/04/2020 21:47, Stefano Stabellini wrote:
> > > On Wed, 15 Apr 2020, Julien Grall wrote: But doesn't it make sense to give
> > > domU permission if it is going to get
> > > the memory mapped? But admittedly I can't think of something that would
> > > break because of the lack of the iomem_permit_access call in this code
> > > path.
> > 
> > On Arm, the permissions are only useful if you plan you DomU to delegate the
> > regions to another domain. As your domain is not even aware it is running on
> > Xen (we don't expose 'xen' node in the DT), it makes little sense to add the
> > permission.
> 
> I actually found one use when helping a user last week. You can dump the list
> of MMIO regions assigned to a guest from Xen Console.
> 
> This will use d->iomem_caps that is modified via iomem_permit_access().
> Without it, there is no easy way to confirm the list of MMIO regions assigned
> to a guest. Although...
> 
> > Even today, you can map IOMEM to a DomU and then revert the permission right
> > after. They IOMEM will still be mapped in the guest and it will act normaly.
> 
> ... this would not help the case where permissions are reverted. But I am
> assuming this shouldn't happen for Dom0less.

Thank you for looking into this


> Stefano, I am not sure what's your plan for the series itself for Xen 4.14. I
> think this patch could go in now. Any thoughts?

For the series: I have addresses all comments in my working tree except
for the ones on memory allocation (the thread "xen: introduce
reserve_heap_pages"). It looks like that part requires a complete
rewrite, and it seems that the new code is not trivial to write. So I am
thinking of not targeting 4.14. What do you think? Do you think the new
code should be "easy" enough that I could target 4.14?

For this patch: it is fine to go in now, doesn't have to wait for the
series.

