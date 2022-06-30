Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFC56194A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 13:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358431.587639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sR1-000745-Nz; Thu, 30 Jun 2022 11:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358431.587639; Thu, 30 Jun 2022 11:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sR1-00071g-KF; Thu, 30 Jun 2022 11:34:11 +0000
Received: by outflank-mailman (input) for mailman id 358431;
 Thu, 30 Jun 2022 11:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIEj=XF=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1o6sQz-00071X-HP
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 11:34:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cff0b32-f868-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 13:34:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A954B82A38;
 Thu, 30 Jun 2022 11:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8395C34115;
 Thu, 30 Jun 2022 11:34:04 +0000 (UTC)
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
X-Inumbo-ID: 8cff0b32-f868-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656588845;
	bh=y/AkczZu+t5L5QS5HmrGxEEOZZGTi1cFRhvgGwdbbLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qmg64MZn4FHh18uQWV6rRCe66knAFc1oY1fGEQzGn712mLfl0ROVycbbNXMHzHvRE
	 MFxzjNM4zEBjQ1LYcJ27YupCdzXULyW26LOoR+89hp0WyuqCpZtxlSb8ZEvpERkHOS
	 p5wIiaR8x/xOeSlz1dkr3si+QRXTeavd7RI3LzlE=
Date: Thu, 30 Jun 2022 13:34:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5.10] xen/gntdev: Avoid blocking in unmap_grant_pages()
Message-ID: <Yr2KKpWSiuzOQr7v@kroah.com>
References: <20220627181006.1954-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627181006.1954-1-demi@invisiblethingslab.com>

On Mon, Jun 27, 2022 at 02:10:02PM -0400, Demi Marie Obenour wrote:
> commit dbe97cff7dd9f0f75c524afdd55ad46be3d15295 upstream
> 
> unmap_grant_pages() currently waits for the pages to no longer be used.
> In https://github.com/QubesOS/qubes-issues/issues/7481, this lead to a
> deadlock against i915: i915 was waiting for gntdev's MMU notifier to
> finish, while gntdev was waiting for i915 to free its pages.  I also
> believe this is responsible for various deadlocks I have experienced in
> the past.
> 
> Avoid these problems by making unmap_grant_pages async.  This requires
> making it return void, as any errors will not be available when the
> function returns.  Fortunately, the only use of the return value is a
> WARN_ON(), which can be replaced by a WARN_ON when the error is
> detected.  Additionally, a failed call will not prevent further calls
> from being made, but this is harmless.
> 
> Because unmap_grant_pages is now async, the grant handle will be sent to
> INVALID_GRANT_HANDLE too late to prevent multiple unmaps of the same
> handle.  Instead, a separate bool array is allocated for this purpose.
> This wastes memory, but stuffing this information in padding bytes is
> too fragile.  Furthermore, it is necessary to grab a reference to the
> map before making the asynchronous call, and release the reference when
> the call returns.
> 
> It is also necessary to guard against reentrancy in gntdev_map_put(),
> and to handle the case where userspace tries to map a mapping whose
> contents have not all been freed yet.
> 
> Fixes: 745282256c75 ("xen/gntdev: safely unmap grants in case they are still in use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Link: https://lore.kernel.org/r/20220622022726.2538-1-demi@invisiblethingslab.com
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/gntdev-common.h |   7 ++
>  drivers/xen/gntdev.c        | 142 +++++++++++++++++++++++++-----------
>  2 files changed, 106 insertions(+), 43 deletions(-)

All now queued up, thanks.

greg k-h

