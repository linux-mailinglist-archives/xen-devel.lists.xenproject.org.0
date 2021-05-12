Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156137D409
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 21:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126357.237875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lguxN-0001Ib-Li; Wed, 12 May 2021 19:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126357.237875; Wed, 12 May 2021 19:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lguxN-0001FN-Go; Wed, 12 May 2021 19:55:45 +0000
Received: by outflank-mailman (input) for mailman id 126357;
 Wed, 12 May 2021 19:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lguxL-0001Ey-L7
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 19:55:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3e0163c-c2ef-4546-9907-11d01f8e06c9;
 Wed, 12 May 2021 19:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB53C613F7;
 Wed, 12 May 2021 19:55:41 +0000 (UTC)
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
X-Inumbo-ID: a3e0163c-c2ef-4546-9907-11d01f8e06c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620849342;
	bh=262+PIF/9A36VsCFqlkhq//BsN04UF0+U0v6HG31+Wo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WEB3NSzIGZ1hY7qqH6Z9As3Y5wCiVwfxNKRRS/2CC0NbdHbt5Qgc02KzG15EMIxHx
	 GRryYhagx0GqTVe35P4CWN/aFNbhJOcLv5Yxgs2TB4g/MMgelXLUXiw+5EwqeavSN6
	 C1MpfPrTlXnYi4xDQtTxE+kO+JPXyDOjavVr6Sg8yNi5a8lr3RJSaOFMbgZLr1uxD2
	 G3ZV5addJoy64YD+onajVSGgt0Xgg+EFe5W32nhaFq/UBHEuA3pK5v5HIMfnLvPbVR
	 /a6LBUXd2mPFZKaLUDxuzPCWaR4pV3xtWBWh3N7EiyErgBxFKvaliGdztPXF4OazjN
	 eMMkMG3PUlnMw==
Date: Wed, 12 May 2021 12:55:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    boris.ostrovsky@oracle.com, jgross@suse.com, catalin.marinas@arm.com, 
    will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] xen/arm64: do not set SWIOTLB_NO_FORCE when swiotlb
 is required
In-Reply-To: <20210512072645.GA22396@lst.de>
Message-ID: <alpine.DEB.2.21.2105121255290.5018@sstabellini-ThinkPad-T480s>
References: <20210511174142.12742-1-sstabellini@kernel.org> <20210512072645.GA22396@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 May 2021, Christoph Hellwig wrote:
> > -int xen_swiotlb_detect(void)
> > -{
> > -	if (!xen_domain())
> > -		return 0;
> > -	if (xen_feature(XENFEAT_direct_mapped))
> > -		return 1;
> > -	/* legacy case */
> > -	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
> > -		return 1;
> > -	return 0;
> > -}
> 
> I think this move should be a separate prep patch.

Sure, I can do that

