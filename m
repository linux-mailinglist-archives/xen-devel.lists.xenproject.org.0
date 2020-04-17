Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D41AE888
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 01:13:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPaA2-0003JN-DG; Fri, 17 Apr 2020 23:12:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JcYo=6B=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jPaA1-0003JI-1V
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 23:12:37 +0000
X-Inumbo-ID: ece74bae-8100-11ea-9e09-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ece74bae-8100-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 23:12:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C526C214D8;
 Fri, 17 Apr 2020 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587165156;
 bh=hJjcLQ+PXT3NI0+b9gpDpkrXj4Fq+8d8vEQZHQE57uA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qtt/Z6E4r+El/eAJJvSQ/lkUiXU/NcNFqKTDpaE61QE5VbYyPfWYmVaSuu25T5mJp
 4ZgildUnB4f63bWElsxuzCOgKZoG2Ts1GIwtkQxew9No4lNHC/o/ulkWT7wxSqpOD7
 Mlom/nkjjWD760X86LbyRpUmFk0h434ofUHb+Xug=
Date: Fri, 17 Apr 2020 16:12:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: [PATCH][RESEND] xen/arm: vgic-v3: fix GICD_ISACTIVER range
In-Reply-To: <CAJ=z9a2yCLfOGChD8YL3K7H50spGyifcpeLq_dz_T7aFV8VGQQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2004171600580.32540@sstabellini-ThinkPad-T480s>
References: <20200417221609.19928-1-sstabellini@kernel.org>
 <CAJ=z9a2yCLfOGChD8YL3K7H50spGyifcpeLq_dz_T7aFV8VGQQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Apr 2020, Julien Grall wrote:
> Hi,
> 
> The title claim this is a resend, but this is actually not the latest
> version of this patch. Can you explain why you decided to use v1
> rather than v2?

Because v2 added a printk for every read, and I thought you only wanted
the range fix. Also, the printk is not a "warn once" so after the
discussion where it became apparent that the register can be read many
times, it sounded undesirable.

Nonetheless I don't have a strong preference between the two. If you
prefer v2 it is here:

https://marc.info/?l=xen-devel&m=157440872522065

Do you need me to resent it? If it is OK for you as-is, you can give
your ack here, and I'll go ahead and commit it.


> On Fri, 17 Apr 2020 at 23:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> >
> > (See https://marc.info/?l=xen-devel&m=158527653730795 for a discussion on
> > what it would take to implement GICD_ISACTIVER/GICD_ICACTIVER properly.)
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I don't think you can be at the same time an author of the patch and a
> reviewer. Otherwise, I could review my own patch ;).

Yeah ... that was not the intention. I changed the commit message so I
had to add my signed-off-by for copyright reasons. At the same time I
reviewed it even before changing the commit message so I added the
reviewed-by. I agree it looks kind of weird. 

