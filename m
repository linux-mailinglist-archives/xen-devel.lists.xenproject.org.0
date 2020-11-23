Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1202C18B8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35248.66682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKiT-0003TE-Ft; Mon, 23 Nov 2020 22:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35248.66682; Mon, 23 Nov 2020 22:53:49 +0000
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
	id 1khKiT-0003Sp-Ch; Mon, 23 Nov 2020 22:53:49 +0000
Received: by outflank-mailman (input) for mailman id 35248;
 Mon, 23 Nov 2020 22:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rez2=E5=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1khKiR-0003SJ-Fj
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:53:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b314eb7-5d78-44bf-8276-561e9b09ebf7;
 Mon, 23 Nov 2020 22:53:46 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0DFC206D8;
 Mon, 23 Nov 2020 22:53:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Rez2=E5=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1khKiR-0003SJ-Fj
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:53:47 +0000
X-Inumbo-ID: 6b314eb7-5d78-44bf-8276-561e9b09ebf7
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b314eb7-5d78-44bf-8276-561e9b09ebf7;
	Mon, 23 Nov 2020 22:53:46 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E0DFC206D8;
	Mon, 23 Nov 2020 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606172025;
	bh=Y754Uxsb+oRdteJzxeLGJZ0Nr6qJ2w8yPhIjK1E9ygw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd8DEuKDlU/OBnXmphx1Bjt66POq5VZAkAJuwm05bXMWgCP0KNMsZhuX1pGccgVAQ
	 CuJqNVszqNMvfApMAr7ZRwkEnkR59sOEF5TtNw+vX34N/EMP+A/lHmONMXhkr1ttvy
	 rNUTWmbmeyjT6VfheHX8QTYB5CtlRKh4XbeKEb9c=
Date: Mon, 23 Nov 2020 16:53:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: boris.ostrovsky@oracle.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 058/141] xen-blkfront: Fix fall-through warnings for Clang
Message-ID: <20201123225359.GP21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
 <e8d67ea1-3d0d-509a-a2f1-cf1758bb373f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8d67ea1-3d0d-509a-a2f1-cf1758bb373f@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Nov 20, 2020 at 04:36:26PM -0500, boris.ostrovsky@oracle.com wrote:
> 
> On 11/20/20 1:32 PM, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> >
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/block/xen-blkfront.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > index 48629d3433b4..34b028be78ab 100644
> > --- a/drivers/block/xen-blkfront.c
> > +++ b/drivers/block/xen-blkfront.c
> > @@ -2462,6 +2462,7 @@ static void blkback_changed(struct xenbus_device *dev,
> >  			break;
> >  		if (talk_to_blkback(dev, info))
> >  			break;
> > +		break;
> >  	case XenbusStateInitialising:
> >  	case XenbusStateInitialised:
> >  	case XenbusStateReconfiguring:
> 
> 
> Reviewed-by Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> 
> (for patch 138 as well)

Thank you for both reviews, Boris.

> Although I thought using 'fallthrough' attribute was the more common approach.

I've got it. I will consider that for a future patch.

Thanks
--
Gustavo

