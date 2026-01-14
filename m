Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA9D1BD37
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 01:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202406.1517980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfopt-0004S0-2x; Wed, 14 Jan 2026 00:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202406.1517980; Wed, 14 Jan 2026 00:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfopt-0004Pe-09; Wed, 14 Jan 2026 00:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1202406;
 Wed, 14 Jan 2026 00:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5XS=7T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfopr-0004PY-LW
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 00:34:07 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bae5f279-f0e0-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 01:34:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E6476000A;
 Wed, 14 Jan 2026 00:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA62C116C6;
 Wed, 14 Jan 2026 00:34:02 +0000 (UTC)
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
X-Inumbo-ID: bae5f279-f0e0-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768350843;
	bh=9e2QbnMmZj2XxBe7h1WdUyrJFkXicHq5AIV9TxdkiXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HBniICX8QRAddh0CA0OyoxHHh/3BsZD+DHOsN3cg9ycJpMVEcWQQFBpqWVygl4TpF
	 xaxrt9JXzaeN7xYFjLsZOzDUUJKvUmWW2lhe0Z3bB/vp2m3ZlBtHeBgF/HjcZeEdlZ
	 bj6BacTAIsq7XX9EFDf5u6J0kIvjVLKoZ0Mdwxtr9H8hm/XvL/vUnWqW+GRN4RNusJ
	 3hLSOp5uFmyPu6/ZVKXJB3RP8WxBIYaCfCQcb27JXAvpeIg4wgd5E2qM+IJ8PUcHmQ
	 814Xa3cOM0qwObfKFPZ52AFtwshr/jAUgZy26W+/17p0pLgoA2hf1LpyAyuHNtPot4
	 l9iNnpJhxvt/w==
Date: Tue, 13 Jan 2026 16:33:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/console: handle multiple domains using console_io
 hypercalls
In-Reply-To: <3376e95d-8da5-4bc8-893f-4f9c84404a32@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601131542520.6279@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601121728380.992863@ubuntu-linux-20-04-desktop> <3376e95d-8da5-4bc8-893f-4f9c84404a32@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jan 2026, Jan Beulich wrote:
> On 13.01.2026 02:30, Stefano Stabellini wrote:
> > Allow multiple dom0less domains to use the console_io hypercalls to
> > print to the console. Handle them in a similar way to vpl011: only the
> > domain which has focus can read from the console. All domains can write
> > to the console but the ones without focus have a prefix. In this case
> > the prefix is applied by using guest_printk instead of printk or
> > console_puts which is what the original code was already doing.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - fix code style
> > - pbuf_idx/idx after ada53067083e
> > - don't add extra \0
> > - clear input on console switch
> > ---
> >  xen/drivers/char/console.c | 25 ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 2bdb4d5fb4..6c7a6592c5 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -576,6 +576,8 @@ static void console_switch_input(void)
> >              rcu_unlock_domain(d);
> >  
> >              console_rx = next_rx;
> > +            /* don't let the next dom read the previous dom's unread data */
> 
> Nit: Comment style.
> 
> > +            serial_rx_cons = serial_rx_prod;
> >              printk("*** Serial input to DOM%u", domid);
> 
> Imo the flushing of input needs to come after the printk(), as it's only
> then that the user gets confirmation of the change.
> 
> As to flushing (rather than storing) leftover input: That's strictly an
> improvement over v1, but imo unhelpful. I may not be willing to ack this
> (still need to think about it some more), but at the very least this
> somewhat odd behavior needs calling out (and perhaps also justifying) in
> the description.

Input is typically read quickly; if there is unread data is because the
domain is slow or stuck. In this situation, the user is both providing
the unread input and also typing Ctrl-AAA to switch domain.  The user
must be aware of the unread input. In my direct experience using this
feature, it is natural that the unread data is lost and wouldn't expect
otherwise.

You are right that the explanation is missing from the commit message.
I'll add it.


> Further, did you think through the interaction with a racing
> CONSOLEIO_read? Right now that's the only place where serial_rx_cons is
> updated, and hence there was no issue with there being multiple reads
> of the variable (perhaps unless a domain issued racing CONSOLEIO_read).
> That changes now. I can't convince myself (yet) that's entirely safe,
> and hence if it is that also wants discussing in the description.

Looking carefully I also cannot convince myself it is OK. I wonder if we
should use nrspin_lock_irq and nrspin_unlock_irq here and in
CONSOLEIO_read.

I'll send a patch update doing that. I tested it and works.


> > @@ -730,6 +732,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >      unsigned int flags = opt_console_to_ring
> >                           ? CONSOLE_ALL : CONSOLE_DEFAULT;
> >      struct domain *cd = current->domain;
> > +    struct domain *input;
> >  
> >      while ( count > 0 )
> >      {
> > @@ -742,18 +745,28 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          if ( copy_from_guest(kbuf, buffer, kcount) )
> >              return -EFAULT;
> >  
> > -        if ( is_hardware_domain(cd) )
> > +        input = console_get_domain();
> > +        if ( input && cd == input )
> >          {
> > +            struct domain_console *cons = cd->console;
> > +
> > +            if ( cons->idx )
> > +            {
> > +                console_send(cons->buf, cons->idx, flags);
> > +                cons->idx = 0;
> > +            }
> 
> I probably should have said so on v1 already: What is this about? There's
> no comment and nothing in the description that I could associate with this
> code.

Something else to add to the commit message.

The domain output is buffered when not in focus. When need to clear it
out as the domain enters focus.


> And then - is this safe without holding cons->lock?

I'll move the console_lock taking earlier


> > @@ -815,6 +829,13 @@ long do_console_io(
> >          if ( count > INT_MAX )
> >              break;
> >  
> > +        d = console_get_domain();
> > +        if ( d != current->domain )
> > +        {
> > +            console_put_domain(d);
> > +            return 0;
> > +        }
> 
> As of here d == current domain. Why are you holding onto ...
> 
> >          rc = 0;
> >          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
> >          {
> > @@ -826,12 +847,14 @@ long do_console_io(
> >                  len = count - rc;
> >              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> >              {
> > +                console_put_domain(d);
> >                  rc = -EFAULT;
> >                  break;
> >              }
> >              rc += len;
> >              serial_rx_cons += len;
> >          }
> > +        console_put_domain(d);
> >          break;
> 
> ... the domain for this long (requiring multiple console_put_domain()
> invocations)? The current domain can't go away under your feet. Hence imo
> a single (early) call will do.

Yes, good point

