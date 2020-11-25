Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B467F2C49CE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 22:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38088.70724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki2FR-0002yl-Gu; Wed, 25 Nov 2020 21:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38088.70724; Wed, 25 Nov 2020 21:22:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki2FR-0002yM-Dk; Wed, 25 Nov 2020 21:22:45 +0000
Received: by outflank-mailman (input) for mailman id 38088;
 Wed, 25 Nov 2020 21:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ki2FQ-0002yH-01
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:22:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6b2cdd3-60ca-488d-8696-759cdb4b2f4a;
 Wed, 25 Nov 2020 21:22:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3567F206B5;
 Wed, 25 Nov 2020 21:22:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ki2FQ-0002yH-01
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:22:44 +0000
X-Inumbo-ID: e6b2cdd3-60ca-488d-8696-759cdb4b2f4a
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e6b2cdd3-60ca-488d-8696-759cdb4b2f4a;
	Wed, 25 Nov 2020 21:22:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3567F206B5;
	Wed, 25 Nov 2020 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606339362;
	bh=/dp5Lg3Nm/ZwwlaZbc9dAyCuGMPyOMed/wnoftDLQZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DtWpPOH6o1TCGeJbRTM9jAfdZ9CimHPH/Gb4o/68yEUp0c+GWrwQFgN5sX3SDZhlN
	 d1LHafmNi91t0ypcUAoaQOA79ETM79TtKGcvo1Bp+8dm1ejjo0M1yOSACWDlUCc0fZ
	 yptQ2kRZmJHIA1xlpTqBuXw8GRgKseJpuvO+thLw=
Date: Wed, 25 Nov 2020 13:22:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 2/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
In-Reply-To: <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2011251320300.7979@sstabellini-ThinkPad-T480s>
References: <cover.1606326929.git.rahul.singh@arm.com> <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Nov 2020, Rahul Singh wrote:
> If mem-sharing, mem-paging, or log-dirty functionality is not enabled
> for architecture when HAS_PCI is enabled, the compiler will throw an
> error.
> 
> Move code to x86 specific file to fix compilation error.
> 
> Also, modify the code to use likely() in place of unlikley() for each
> condition to make code more optimized.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> 
> Changes in v4:
> - fixed minor comments
> 
> ---
>  xen/drivers/passthrough/pci.c       |  8 +-------
>  xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++++
>  xen/include/xen/iommu.h             |  2 ++
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3c6ab1bcb6..4c21655b7d 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -20,7 +20,6 @@
>  #include <xen/iommu.h>
>  #include <xen/irq.h>
>  #include <xen/param.h>
> -#include <xen/vm_event.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
>  #include <xen/event.h>
> @@ -1418,12 +1417,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> -    /* Prevent device assign if mem paging or mem sharing have been 
> -     * enabled for this domain */
> -    if ( d != dom_io &&
> -         unlikely(mem_sharing_enabled(d) ||
> -                  vm_event_check_ring(d->vm_event_paging) ||
> -                  p2m_get_hostp2m(d)->global_logdirty) )
> +    if( !arch_iommu_use_permitted(d) )

code style:

  if ( !arch_iommu_use_permitted(d) )

