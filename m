Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE2801A35
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 04:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645934.1008525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GaV-0003lM-VH; Sat, 02 Dec 2023 03:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645934.1008525; Sat, 02 Dec 2023 03:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GaV-0003iP-Rl; Sat, 02 Dec 2023 03:22:39 +0000
Received: by outflank-mailman (input) for mailman id 645934;
 Sat, 02 Dec 2023 03:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhqb=HN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9GaU-0003iJ-Sg
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 03:22:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa3c858-90c2-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 04:22:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9D0FDB84A15;
 Sat,  2 Dec 2023 03:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30B5C433C8;
 Sat,  2 Dec 2023 03:22:33 +0000 (UTC)
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
X-Inumbo-ID: 0aa3c858-90c2-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701487355;
	bh=DcfszijdC8CW9BSCzBfT3IRaHc2OaKew4trmsy0ctQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uwX1ypHBSA3I4O+9JTGjHMM6WSd5AfJWccTP0wrTaE/19iyPvxMyXFHT0Ac7xKBBI
	 /wfRB2VbLzKsDcBH9AxQ2qg9fXO/z+eXylpCCH10XTgkCGziQ5gPvN3iYJ3nnuQeHV
	 qbvTKlYU/yz50nWYCgjoXivL4m7kqo/gZOob257Fn3H1kBSUcBOat6A7WIFvbvpKM6
	 z8LeLb2RA5s92vRUdXnszIPLyaqCj0+ka8wqckRKeBNM1KEPoD7Rdxb1TMCQ7l6C40
	 UqXFsXIwPa5SD9ssso2u3FOIuRan/icjaeSMkTY+fXjRwZ+rRuuhCXvIXP0Av1HUQN
	 nWH/z93QobV/g==
Date: Fri, 1 Dec 2023 19:22:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/3] xen: address violations of MISRA C:2012 Rule
 13.1
In-Reply-To: <2d4d3dab-f5a2-4b57-904e-e48642f7937f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312011921250.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700844359.git.simone.ballarin@bugseng.com> <771a6f804f4e7dda3897359b57d1d14c2878ea16.1700844359.git.simone.ballarin@bugseng.com> <2d4d3dab-f5a2-4b57-904e-e48642f7937f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Nov 2023, Jan Beulich wrote:
> On 24.11.2023 18:29, Simone Ballarin wrote:
> > Rule 13.1: Initializer lists shall not contain persistent side effects
> > 
> > The assignment operation in:
> > 
> > .irq = rc = uart->irq,
> > 
> > is a persistent side effect in a struct initializer list.
> > 
> > This patch avoids rc assignment and directly uses uart->irq
> > in the following if statement.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Who's the author of this patch? (Either the order of the SoB is wrong, or
> there's a From: tag missing.)
> 
> > ---
> > Changes in v2:
> > - avoid assignment of rc;
> > - drop changes in vcpu_yield(void).
> > ---
> >  xen/drivers/char/ns16550.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> This warrants a more specific subject prefix. Also there's only a single
> violation being dealt with here.
> 
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -445,11 +445,13 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
> >              struct msi_info msi = {
> >                  .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >                                   uart->ps_bdf[2]),
> > -                .irq = rc = uart->irq,
> > +                .irq = uart->irq,
> >                  .entry_nr = 1
> >              };
> >  
> > -            if ( rc > 0 )
> > +            rc = 0;
> > +
> > +            if ( uart->irq > 0 )
> >              {
> >                  struct msi_desc *msi_desc = NULL;
> 
> The fact that there's no functional change here isn't really obvious.
> Imo you want to prove that to a reasonable degree in the description.
 
Agreed. Only reading this chunk, wouldn't it be better to do:

    };

    rc = uart->irq;

    if ( rc > 0 )

at least it would be obvious?

