Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7082CDE24
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 20:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43932.78850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kktpY-0008Ev-9S; Thu, 03 Dec 2020 18:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43932.78850; Thu, 03 Dec 2020 18:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kktpY-0008EW-6O; Thu, 03 Dec 2020 18:59:52 +0000
Received: by outflank-mailman (input) for mailman id 43932;
 Thu, 03 Dec 2020 18:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Inx=FH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kktpW-0008ER-VJ
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 18:59:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5979b25-777b-4a19-a231-3cd1481a8243;
 Thu, 03 Dec 2020 18:59:50 +0000 (UTC)
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
X-Inumbo-ID: f5979b25-777b-4a19-a231-3cd1481a8243
Date: Thu, 3 Dec 2020 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607021989;
	bh=OWWEdGrI+uaFpVJWMP3q8eS+LkmUXzLY+ZS3nn7Eo8s=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=eJSl8jSCNeVMGyYsiKnr78W9S4CCIXabO3N1UkU7fdw9cnfkOD4+lm1HTotoHTlUP
	 1icj5HNZnITFSiWqYQtFATyQf2/wGoDuwk/FOgQsC/AYuJuso4VkbxzAufXFbrOM/4
	 df1JtjmDy14suB5kegF7dzIjKdKifuBCvVe1C2XRo8VD5bFPyVWRSp7aT9heykyHh7
	 WlHzbBMshlFetC4LUBaCilrxuVa0m51djy6n25TgL1hKxa3H7qPq7HPbXNPRkH8EhF
	 UhDCRuXsG6IVdEwUzVRRrtz2cUM21mRCHR8Rr9Wt5G04NwxNCqJQSzXIehG4/yge5D
	 ohsb449Md9Njw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
In-Reply-To: <E9377A57-0AA0-4B5B-87B0-B65FEF655C59@arm.com>
Message-ID: <alpine.DEB.2.21.2012031059150.32240@sstabellini-ThinkPad-T480s>
References: <20201128113642.8265-1-julien@xen.org> <E9377A57-0AA0-4B5B-87B0-B65FEF655C59@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1445478398-1607021972=:32240"
Content-ID: <alpine.DEB.2.21.2012031059450.32240@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1445478398-1607021972=:32240
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2012031059451.32240@sstabellini-ThinkPad-T480s>

On Wed, 2 Dec 2020, Bertrand Marquis wrote:
> > On 28 Nov 2020, at 11:36, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > init_one_desc_irq() can return an error if it is unable to allocate
> > memory. While this is unlikely to happen during boot (called from
> > init_{,local_}irq_data()), it is better to harden the code by
> > propagting the return value.
> > 
> > Spotted by coverity.
> > 
> > CID: 106529
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >    Changes in v2:
> >        - Add Roger's reviewed-by for x86
> >        - Handle
> > ---
> > xen/arch/arm/irq.c | 12 ++++++++++--
> > xen/arch/x86/irq.c |  7 ++++++-
> > 2 files changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 3877657a5277..b71b099e6fa2 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -88,7 +88,11 @@ static int __init init_irq_data(void)
> >     for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> >     {
> >         struct irq_desc *desc = irq_to_desc(irq);
> > -        init_one_irq_desc(desc);
> > +        int rc = init_one_irq_desc(desc);
> > +
> > +        if ( rc )
> > +            return rc;
> > +
> >         desc->irq = irq;
> >         desc->action  = NULL;
> >     }
> > @@ -105,7 +109,11 @@ static int init_local_irq_data(void)
> >     for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
> >     {
> >         struct irq_desc *desc = irq_to_desc(irq);
> > -        init_one_irq_desc(desc);
> > +        int rc = init_one_irq_desc(desc);
> > +
> > +        if ( rc )
> > +            return rc;
> > +
> >         desc->irq = irq;
> >         desc->action  = NULL;
> > 
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 45966947919e..3ebd684415ac 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -428,9 +428,14 @@ int __init init_irq_data(void)
> > 
> >     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
> >     {
> > +        int rc;
> > +
> >         desc = irq_to_desc(irq);
> >         desc->irq = irq;
> > -        init_one_irq_desc(desc);
> > +
> > +        rc = init_one_irq_desc(desc);
> > +        if ( rc )
> > +            return rc;
> >     }
> >     for ( ; irq < nr_irqs; irq++ )
> >         irq_to_desc(irq)->irq = irq;
> > -- 
> > 2.17.1
> > 
> > 
> 
> 
--8323329-1445478398-1607021972=:32240--

