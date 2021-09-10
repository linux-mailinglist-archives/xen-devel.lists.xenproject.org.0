Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92340740E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184885.333686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOqGG-0004Q6-4V; Fri, 10 Sep 2021 23:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184885.333686; Fri, 10 Sep 2021 23:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOqGG-0004Mr-0i; Fri, 10 Sep 2021 23:48:48 +0000
Received: by outflank-mailman (input) for mailman id 184885;
 Fri, 10 Sep 2021 23:48:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOqGE-0004Ml-FP
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:48:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfeadf06-7ce7-49ae-a051-d9b0c6445ca8;
 Fri, 10 Sep 2021 23:48:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C6A561209;
 Fri, 10 Sep 2021 23:48:44 +0000 (UTC)
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
X-Inumbo-ID: bfeadf06-7ce7-49ae-a051-d9b0c6445ca8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631317725;
	bh=CT+zN2hvsAGlq3FXd8oqicFmjUPdT7vc0738cJVqDhc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NBh9bj15FRDBR+BDeOLotaclfeKGuxxEoc4JgAJKKHSox00tTCMgZLOGby7uUyLYQ
	 pUtT8PJgxMce1q0BfXQGk+qIw445gAvZ6NLhM4y8jA3YmI46zR+zNzroZXVu/pZbaM
	 pTbn7Eto3WbEs5hwCEQxgUa7pk5OieVIazdXrixmWnVA0ZXVHOPpeLJa2vQT1Ei7aF
	 /ufGH9sxsebTeWF+phKh0lNfjV8oBhSvhX22Iap+CYZELu0dBswL/q/Q1LCFKtPJe6
	 t2CcUFqSt5aknM/ek0YF2QSjZKjYczxCuqCMGiGxDka+iZ6w5jVDpn2rd6xDDUxgLZ
	 AD+jGYwhQZKlw==
Date: Fri, 10 Sep 2021 16:48:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    the arch/x86 maintainers <x86@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
In-Reply-To: <YThiyxG0d2tmCtb+@infradead.org>
Message-ID: <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com> <YThiyxG0d2tmCtb+@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Christoph Hellwig wrote:
> On Tue, Sep 07, 2021 at 02:13:21PM +0200, Jan Beulich wrote:
> > The code is unreachable for HVM or PVH, and it also makes little sense
> > in auto-translated environments. On Arm, with
> > xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
> > time seeing what good the Xen specific variant does - the generic one
> > ought to be fine for all purposes there. Still Arm code explicitly
> > references symbols here, so the code will continue to be included there.
> 
> Can the Xen/arm folks look into that?  Getting ARM out of using
> swiotlb-xen would be a huge step forward cleaning up some DMA APIs.

On ARM swiotlb-xen is used for a different purpose compared to x86.

Many ARM SoCs still don't have an IOMMU covering all DMA-mastering
devices (e.g. Raspberry Pi 4). As a consequence we map Dom0 1:1 (guest
physical == physical address).

Now if it was just for Dom0, thanks to the 1:1 mapping, we wouldn't need
swiotlb-xen. But when we start using PV drivers to share the network or
disk between Dom0 and DomU we are going to get DomU pages mapped in
Dom0, we call them "foreign pages".  They are not mapped 1:1. It can
happen that one of these foreign pages are used for DMA operations
(e.g. related to the NIC). swiotlb-xen is used to detect these
situations and translate the guest physical address to physical address
of foreign pages appropriately.

If an IOMMU is available and the DMA-mastering device is behind it, then
swiotlb-xen is not necessary. FYI there is community interest in
selectively disabling swiotlb-xen for devices that are behind an IOMMU.


> > Instead of making PCI_XEN's "select" conditional, simply drop it -
> > SWIOTLB_XEN will be available unconditionally in the PV case anyway, and
> > is - as explained above - dead code in non-PV environments.
> > 
> > This in turn allows dropping the stubs for
> > xen_{create,destroy}_contiguous_region(), the former of which was broken
> > anyway - it failed to set the DMA handle output.
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

