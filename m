Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF14CE696
	for <lists+xen-devel@lfdr.de>; Sat,  5 Mar 2022 20:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285220.484471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQaJ3-0005gT-3q; Sat, 05 Mar 2022 19:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285220.484471; Sat, 05 Mar 2022 19:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQaJ2-0005e0-WB; Sat, 05 Mar 2022 19:43:08 +0000
Received: by outflank-mailman (input) for mailman id 285220;
 Sat, 05 Mar 2022 19:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXtQ=TQ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nQaJ1-0005du-3P
 for xen-devel@lists.xenproject.org; Sat, 05 Mar 2022 19:43:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a31d1d-9cbc-11ec-8539-5f4723681683;
 Sat, 05 Mar 2022 20:43:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C004B80BEC;
 Sat,  5 Mar 2022 19:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68459C004E1;
 Sat,  5 Mar 2022 19:43:00 +0000 (UTC)
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
X-Inumbo-ID: 78a31d1d-9cbc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646509381;
	bh=aTwFDS8jMOiSeLykSnLcKQ9n+zp/EVyGHLTn7DlzIkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=veIwZV6CHYNDlYHUU0i4h/aqyLz0BpL3r442nxVH4Fhow68c3KJgMw82DjRZtHGg+
	 BvQr/1VWlJBPSGOqnAPmUhylAJ85ZEIlCgQSFSLEZOql/1nvNxTLG/WgRLKxkOsi/r
	 E2m/lWGlkFhIoYSMNYsTWO3+bKA1ptcJyiuFcaGM=
Date: Sat, 5 Mar 2022 20:42:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: zhanglianjie <zhanglianjie@uniontech.com>
Cc: Juergen Gross <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] drivers/xen: use helper macro __ATTR_RW
Message-ID: <YiO9QDpqepZXEZ6L@kroah.com>
References: <20220305133823.158961-1-zhanglianjie@uniontech.com>
 <YiNry3TtIPbEh1Yr@kroah.com>
 <622382f3.1c69fb81.55f81.aff0SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <622382f3.1c69fb81.55f81.aff0SMTPIN_ADDED_BROKEN@mx.google.com>

On Sat, Mar 05, 2022 at 11:33:58PM +0800, zhanglianjie wrote:
> Hi,
> 
> 在 2022/3/5 21:55, Greg Kroah-Hartman 写道:
> > On Sat, Mar 05, 2022 at 09:38:23PM +0800, zhanglianjie wrote:
> > > Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
> > > Minor readability improvement.
> > > 
> > > Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> > 
> > Is this the name you sign legal documents with?  (I have to ask...)
> Yes, this is my signature.
> > 
> > > 
> > > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
> > > index feb1d16252e7..fcb0792f090e 100644
> > > --- a/drivers/xen/sys-hypervisor.c
> > > +++ b/drivers/xen/sys-hypervisor.c
> > > @@ -22,11 +22,10 @@
> > >   #endif
> > > 
> > >   #define HYPERVISOR_ATTR_RO(_name) \
> > > -static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
> > > +static struct hyp_sysfs_attr _name##_attr = __ATTR_RO(_name)
> > 
> > Why change this line?  That's not relevant to this change :(
> > 
> There are two spaces between struct hyp_sysfs_attr and _name, by the way,
> modify it.

Coding style cleanups should be a separate patch, as each change should
only do one logical thing.

But hey, I'm not the maintainer of this file/driver, others might be
more lax.

good luck!

greg k-h

