Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE97561B68
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 15:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358503.587751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uGi-0000ag-7G; Thu, 30 Jun 2022 13:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358503.587751; Thu, 30 Jun 2022 13:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uGi-0000Xb-4X; Thu, 30 Jun 2022 13:31:40 +0000
Received: by outflank-mailman (input) for mailman id 358503;
 Thu, 30 Jun 2022 13:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIEj=XF=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1o6uGg-0000XF-Vt
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 13:31:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6787e3e-f878-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 15:31:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 342F761EA2;
 Thu, 30 Jun 2022 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F501C34115;
 Thu, 30 Jun 2022 13:31:34 +0000 (UTC)
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
X-Inumbo-ID: f6787e3e-f878-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656595895;
	bh=HnYgzoY2wpz25syeP/HHn4cFSw8pcDffdk1+i7c9erA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGugVafS/pr4OIuJad3zigQVZAlqgDOEqz69h1dDwdzvHWbVsFaZHMf4EgDPMrTlM
	 ZmdHlaVXws/afeUK2G+MkzHts8RqBEYSwAxM7g5djaVi2tCd9kXjHWrb8C6RhGvgSi
	 90/XUTu7wdBLB6MgsB5/wtv6IHfxZWS8pxBWuVc4=
Date: Thu, 30 Jun 2022 15:31:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5.10] xen/gntdev: Avoid blocking in unmap_grant_pages()
Message-ID: <Yr2ltPwSM7srft78@kroah.com>
References: <20220627181006.1954-1-demi@invisiblethingslab.com>
 <Yr2KKpWSiuzOQr7v@kroah.com>
 <5136812e-e296-4acb-cafd-f189c4013ed3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5136812e-e296-4acb-cafd-f189c4013ed3@suse.com>

On Thu, Jun 30, 2022 at 03:16:41PM +0200, Juergen Gross wrote:
> On 30.06.22 13:34, Greg KH wrote:
> > On Mon, Jun 27, 2022 at 02:10:02PM -0400, Demi Marie Obenour wrote:
> > > commit dbe97cff7dd9f0f75c524afdd55ad46be3d15295 upstream
> > > 
> > > unmap_grant_pages() currently waits for the pages to no longer be used.
> > > In https://github.com/QubesOS/qubes-issues/issues/7481, this lead to a
> > > deadlock against i915: i915 was waiting for gntdev's MMU notifier to
> > > finish, while gntdev was waiting for i915 to free its pages.  I also
> > > believe this is responsible for various deadlocks I have experienced in
> > > the past.
> > > 
> > > Avoid these problems by making unmap_grant_pages async.  This requires
> > > making it return void, as any errors will not be available when the
> > > function returns.  Fortunately, the only use of the return value is a
> > > WARN_ON(), which can be replaced by a WARN_ON when the error is
> > > detected.  Additionally, a failed call will not prevent further calls
> > > from being made, but this is harmless.
> > > 
> > > Because unmap_grant_pages is now async, the grant handle will be sent to
> > > INVALID_GRANT_HANDLE too late to prevent multiple unmaps of the same
> > > handle.  Instead, a separate bool array is allocated for this purpose.
> > > This wastes memory, but stuffing this information in padding bytes is
> > > too fragile.  Furthermore, it is necessary to grab a reference to the
> > > map before making the asynchronous call, and release the reference when
> > > the call returns.
> > > 
> > > It is also necessary to guard against reentrancy in gntdev_map_put(),
> > > and to handle the case where userspace tries to map a mapping whose
> > > contents have not all been freed yet.
> > > 
> > > Fixes: 745282256c75 ("xen/gntdev: safely unmap grants in case they are still in use")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > Reviewed-by: Juergen Gross <jgross@suse.com>
> > > Link: https://lore.kernel.org/r/20220622022726.2538-1-demi@invisiblethingslab.com
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/xen/gntdev-common.h |   7 ++
> > >   drivers/xen/gntdev.c        | 142 +++++++++++++++++++++++++-----------
> > >   2 files changed, 106 insertions(+), 43 deletions(-)
> > 
> > All now queued up, thanks.
> 
> Sorry, but I think at least the version for 5.10 is fishy, as it removes
> the tests for successful allocations of add->map_ops and add->unmap_ops.
> 
> I need to do a thorough review of the patches (the "Reviewed-by:" tag in
> the patches is the one for the upstream patch).
> 
> Greg, can you please wait for my explicit "okay" for the backports?

Ok, I'll go drop them all from the queues now.

thanks,

greg k-h

