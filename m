Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7A41499E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192714.343299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1gd-0002kP-OX; Wed, 22 Sep 2021 12:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192714.343299; Wed, 22 Sep 2021 12:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1gd-0002i6-Ja; Wed, 22 Sep 2021 12:49:19 +0000
Received: by outflank-mailman (input) for mailman id 192714;
 Wed, 22 Sep 2021 12:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/3m=OM=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mT1gb-0002hu-6I
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:49:18 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7e882af-83ec-4788-a36f-6668de1b2a01;
 Wed, 22 Sep 2021 12:49:14 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT1do-004mud-Fa; Wed, 22 Sep 2021 12:46:36 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0C64A9816EA; Wed, 22 Sep 2021 14:46:24 +0200 (CEST)
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
X-Inumbo-ID: f7e882af-83ec-4788-a36f-6668de1b2a01
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oAPrbliIVMtJ6nyhmSrbiDdRqfA8JQhJf2UshZDVT88=; b=tEhxQE1Rmf1aTw5P1Xwbfp0kSE
	YhEyVwt1OomoAedgQy7bd0MGsyzpJuDb6xfOPGIy5Aam6rrlnutVUT6hpOPH+vxUDYZKFZIMGrEKh
	3gQSU0/TwUk/ouYEPzD5cUnwbDumaIhLYrnr3h/7NXqphYNEu8c7OmvWIaaA1SrqbRyZW2o1nMIiw
	DpHkDrSzUBUtp8+fMzfqTHvg1AMcupoiR7sQUybbpk52IWxGnkXmOTbMpPhMF+/HhKfq773SzI5mN
	Vn/f9OxoFZzS4dAcBzm+5xJ8UuNUR2znLUvU2M4Emmgi5x28KyDkgbQlbACPLVWxFjqR07SKJXdSc
	3aNbmczA==;
Date: Wed, 22 Sep 2021 14:46:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: Re: [PATCH v2 0/2] x86/xen: simplify irq pvops
Message-ID: <20210922124623.GR4323@worktop.programming.kicks-ass.net>
References: <20210922103102.3589-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922103102.3589-1-jgross@suse.com>

On Wed, Sep 22, 2021 at 12:31:00PM +0200, Juergen Gross wrote:
> The pvops function for Xen PV guests handling the interrupt flag are
> much more complex than needed.
> 
> With the supported Xen hypervisor versions they can be simplified a
> lot, especially by removing the need for disabling preemption.
> 
> Juergen Gross (2):
>   x86/xen: remove xen_have_vcpu_info_placement flag
>   x86/xen: switch initial pvops IRQ functions to dummy ones
> 
>  arch/x86/include/asm/paravirt_types.h |   2 +
>  arch/x86/kernel/paravirt.c            |  13 ++-
>  arch/x86/xen/enlighten.c              | 116 ++++++--------------------
>  arch/x86/xen/enlighten_hvm.c          |   6 +-
>  arch/x86/xen/enlighten_pv.c           |  28 ++-----
>  arch/x86/xen/irq.c                    |  61 +-------------
>  arch/x86/xen/smp.c                    |  24 ------
>  arch/x86/xen/xen-ops.h                |   4 +-
>  8 files changed, 53 insertions(+), 201 deletions(-)

That looks awesome, I'm totally in favour of deleting code :-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

