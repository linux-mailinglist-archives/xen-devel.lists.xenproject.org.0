Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE86409E28
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 22:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185915.334669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPsbe-0006lD-ST; Mon, 13 Sep 2021 20:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185915.334669; Mon, 13 Sep 2021 20:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPsbe-0006iT-PA; Mon, 13 Sep 2021 20:31:10 +0000
Received: by outflank-mailman (input) for mailman id 185915;
 Mon, 13 Sep 2021 20:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPsbd-0006iN-5E
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 20:31:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 869cc9da-14d1-11ec-b3cb-12813bfff9fa;
 Mon, 13 Sep 2021 20:31:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9048C6108B;
 Mon, 13 Sep 2021 20:31:07 +0000 (UTC)
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
X-Inumbo-ID: 869cc9da-14d1-11ec-b3cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631565067;
	bh=I1luLBrQT2QS6nSSKLDDdX9lKRGVXUWe967myVRKHq8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NkMwMKqzji1BQ9efEE20R8HGJLZmk2XracuUWD04u26bu5/zQYoT51EuIpnj8a98Y
	 XBMpos47u9CxnpLg4uCQ1HZ1GdVhmR/KIqMQQhR6m/MhF5B6JxbD5eKcm9DRBW7Iht
	 jxPJOcjcvS4UU3Saa6uy6ggSVWWJxZxuUplqTAyMol9C0a1Zkx5dlBJwdYYs09wp/x
	 Ax6gcedHW/T+qr+IViyy00YeVYY1+za2CK6cRf6KI+9CHS+FoPkhMM58+fDGeNGNPm
	 Pui7DgrkZnxXiaK6qWwnHK4FtowGTMImhm8nMMhb2AfgMe5+6ZtgegMOrY2Rvx8xuZ
	 9n+jW82xbiLwA==
Date: Mon, 13 Sep 2021 13:31:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
In-Reply-To: <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com>
Message-ID: <alpine.DEB.2.21.2109131328130.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <397bf325-f81e-e104-6142-e8c9c4955475@suse.com> <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s> <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Sep 2021, Jan Beulich wrote:
> On 11.09.2021 01:14, Stefano Stabellini wrote:
> > On Tue, 7 Sep 2021, Jan Beulich wrote:
> >> While the hypervisor hasn't been enforcing this, we would still better
> >> avoid issuing requests with GFNs not aligned to the requested order.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I wonder how useful it is to include the alignment in the panic()
> >> message.
> > 
> > Not very useful given that it is static. I don't mind either way but you
> > can go ahead and remove it if you prefer (and it would make the line
> > shorter.)
> > 
> > 
> >> I further wonder how useful it is to wrap "bytes" in
> >> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
> >> least was supposed to be, prior to "swiotlb-xen: maintain slab count
> >> properly").
> > 
> > This one I would keep, to make sure to print out the same amount passed
> > to memblock_alloc.
> 
> Oh - if I was to drop it from the printk(), I would have been meaning to
> also drop it there. If it's useless, then it's useless everywhere.

That's fine too

