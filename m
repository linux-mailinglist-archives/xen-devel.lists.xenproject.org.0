Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E973D754
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 07:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555312.866984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDf91-0003cs-43; Mon, 26 Jun 2023 05:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555312.866984; Mon, 26 Jun 2023 05:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDf91-0003Zh-0p; Mon, 26 Jun 2023 05:52:11 +0000
Received: by outflank-mailman (input) for mailman id 555312;
 Mon, 26 Jun 2023 05:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zc66=CO=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1qDf8z-0003Za-1x
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 05:52:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9521fb95-13e5-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 07:52:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F55960B01;
 Mon, 26 Jun 2023 05:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EA9C433C0;
 Mon, 26 Jun 2023 05:52:05 +0000 (UTC)
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
X-Inumbo-ID: 9521fb95-13e5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687758725;
	bh=Q/Jx4hUMTo4PbW0+37Rx0hnjf5b3/J11HUc9EDQu0M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDnRus/73cUBJt1KENvBFHrmmhm+JYVyU2VV816M7TP16lKsYV+74Dmn3a78QfEBT
	 1NhFxG8a2NJTiP76ziq0ougRA33fMSL3T2zGU8j3OlOzxrkOXMdeoI2mVa5GPj60Bx
	 zcmX2JnnEnKzhswXn0t/0MVsGHKsCDtWZUJGByko=
Date: Mon, 26 Jun 2023 07:52:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Beulich <jbeulich@suse.com>,
	Zhang Shurong <zhang_shurong@foxmail.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, jgross@suse.com
Subject: Re: [PATCH] xen: fix potential shift out-of-bounds in
 xenhcd_hub_control()
Message-ID: <2023062628-shame-ebook-56f2@gregkh>
References: <tencent_15DD79B42AD8A0D64A7CDC24D4FE6C85800A@qq.com>
 <1c8ff405-2bfe-37ff-42ba-aa4f81853475@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c8ff405-2bfe-37ff-42ba-aa4f81853475@suse.com>

On Mon, Jun 26, 2023 at 07:48:05AM +0200, Jan Beulich wrote:
> On 25.06.2023 18:42, Zhang Shurong wrote:
> > --- a/drivers/usb/host/xen-hcd.c
> > +++ b/drivers/usb/host/xen-hcd.c
> > @@ -456,6 +456,8 @@ static int xenhcd_hub_control(struct usb_hcd *hcd, __u16 typeReq, __u16 wValue,
> >  			info->ports[wIndex - 1].c_connection = false;
> >  			fallthrough;
> >  		default:
> > +			if (wValue >= 32)
> > +				goto error;
> >  			info->ports[wIndex - 1].status &= ~(1 << wValue);
> 
> Even 31 is out of bounds (as in: UB) as long as it's 1 here rather
> than 1u.

Why isn't the caller fixed so this type of value could never be passed
to the hub_control callback?

thanks,

greg k-h

