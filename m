Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CX4MOnJcmkzpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:07:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40F6EE9E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 02:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211964.1523337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5eI-0007jB-Pr; Fri, 23 Jan 2026 01:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211964.1523337; Fri, 23 Jan 2026 01:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj5eI-0007hk-Mh; Fri, 23 Jan 2026 01:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1211964;
 Fri, 23 Jan 2026 01:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CMz=74=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vj5eH-0007hY-6n
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 01:07:41 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8221ec7-f7f7-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 02:07:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D19D43F80;
 Fri, 23 Jan 2026 01:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E1EC116C6;
 Fri, 23 Jan 2026 01:07:34 +0000 (UTC)
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
X-Inumbo-ID: e8221ec7-f7f7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769130456;
	bh=7d+sWZnVd4LXsBCIblWKUQW8c0ZBO6h3TKEuyH+jkb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dPR29/cayRoyXg1Tdak0G5lLHFnCLLVIJOuk9xsgLcXvzYQopA/ZRS2Pc/dPGAWq5
	 +ccn1cWbdmfBPdjbKmV3wWcHaNikrJi/9bUy2w4pzrDoXh5X58zQ8ab4EF0ci8/8uy
	 q3hW7IzCsSCtlCRFdb8zeWJQv/Xz99EQ93qp3CNOw1QNMrFbNS76cLjs1addg+W9oS
	 f5+N/PUEj8rNfwJW0aI8tndw7ELmeWlE58hRxykfw5BbquQlmjPYIYvrFhiPH5c4gi
	 pC0oyVgwREea3vZ4cL+QZX74Mt8dkzz8dmGcqG3Iys5Y65qbWL1UxxOcnNukP+7HPO
	 STBszoQQrc64w==
Date: Thu, 22 Jan 2026 17:07:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/console: handle multiple domains using console_io
 hypercalls
In-Reply-To: <912ff342-f5aa-44fa-8a91-43be4363776e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601221540110.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601211733070.7192@ubuntu-linux-20-04-desktop> <912ff342-f5aa-44fa-8a91-43be4363776e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.952];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5D40F6EE9E
X-Rspamd-Action: no action

On Thu, 22 Jan 2026, Jan Beulich wrote:
> On 22.01.2026 02:34, Stefano Stabellini wrote:
> > Allow multiple dom0less domains to use the console_io hypercalls to
> > print to the console. Handle them in a similar way to vpl011: only the
> > domain which has focus can read from the console. All domains can write
> > to the console but the ones without focus have a prefix. In this case
> > the prefix is applied by using guest_printk instead of printk or
> > console_puts which is what the original code was already doing.
> > 
> > When switching focus using Ctrl-AAA, discard any unread data in the
> > input buffer. Input is read quickly and the user would be aware of it
> > being slow or stuck as they use Ctrl-AAA to switch focus domain.
> > In that situation, it is to be expected that the unread input is lost.
> > 
> > The domain writes are buffered when the domain is not in focus. Push out
> > the buffer after the domain enters focus on the first guest write.
> > 
> > Move the vpl011 check first so that if vpl011 is enabled, it will be
> > used. In the future, the is_hardware_domain path might also be used by
> > other predefined domains so it makes sense to prioritize vpl011 to
> > retain the current behavior on ARM.
> 
> As indicated elsewhere already, I think this wants moving out of here.
> A question is going to be whether the consoled part then also wants
> moving ahead (albeit I fear for now I don't really understand the need
> for this movement, seeing that the is_hardware_domain() check there
> remains as is).

You are right that the is_hardware_domain() check is now wrong. The
reason I didn't notice before is that I was testing on a branch with a
more complete hyperlaunch implementation where the check was different.

Without the vpl011 hunk the patch is not functional but the change can
go into a separate patch. The separate patch also needs to do the
following:
- get rid of the is_hardware_domain() check
- set input_allowed for dom0less guests to make use of console_io

With this, everything works properly upstream now.


> > Locking updates:
> > 
> > - Guard every mutation of serial_rx_cons/prod with console_lock and
> > discard unread input under the lock when switching focus (including when
> > returning to Xen) so that cross-domain reads can't see stale data
> > 
> > - Require is_focus_domain() callers to hold console_lock, and take that
> > lock around the entire CONSOLEIO_read loop, re-checking focus after each
> > chunk so a focus change simply stops further copies without duplicating
> > or leaking input
> 
> Shouldn't this then ...
> 
> > - Hold cd->pbuf_lock while flushing buffered writes in the focus path
> > so the direct-write fast path does not race buffered guests or HVM
> > debug output
> 
> (What's ->pbuf_lock again?)

I updated the commit message. It is cons->lock.


> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -540,6 +540,11 @@ void console_put_domain(struct domain *d)
> >          rcu_unlock_domain(d);
> >  }
> >  
> > +static bool is_focus_domain(struct domain *d)
> > +{
> > +    return d != NULL && d->domain_id == console_rx - 1;
> > +}
> 
> ... be expressed in a comment here as well (or even an assertion)?
> 
> Also please make the function parameter pointer-to-const.

Yes and yes


> > @@ -599,14 +611,25 @@ static void __serial_rx(char c)
> >      if ( !d )
> >          return;
> >  
> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    }
> > +    else
> > +#endif
> >      if ( is_hardware_domain(d) )
> >      {
> >          /*
> >           * Deliver input to the hardware domain buffer, unless it is
> >           * already full.
> >           */
> > +        nrspin_lock_irq(&console_lock);
> >          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
> >              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> > +        nrspin_unlock_irq(&console_lock);
> 
> Hmm, now that there's more context here: The comment looks to still be
> correct as per the enclosing if(), but how does that fit with the purpose
> of this patch? Isn't it part of the goal to allow input to non-hwdom as
> well?

I updated the comment (in the second patch). It should say focus domain
now, instead of hardware domain.


> > @@ -742,18 +761,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          if ( copy_from_guest(kbuf, buffer, kcount) )
> >              return -EFAULT;
> >  
> > -        if ( is_hardware_domain(cd) )
> > +        spin_lock(&cons->lock);
> > +        nrspin_lock_irq(&console_lock);
> 
> This double lock (and the need for this specific order) might better be
> commented upon, too.

+1


> > +        if ( is_focus_domain(cd) )
> >          {
> > +            if ( cons->idx )
> > +            {
> > +                console_send(cons->buf, cons->idx, flags);
> > +                cons->idx = 0;
> > +            }
> >              /* Use direct console output as it could be interactive */
> > -            nrspin_lock_irq(&console_lock);
> >              console_send(kbuf, kcount, flags);
> >              nrspin_unlock_irq(&console_lock);
> > +            spin_unlock(&cons->lock);
> 
> Why is it that this lock can be dropped only here? It's not needed anymore
> past the if()'s body?

Yes, you are technically correct, but it is easier to understand lock if
they are always taken in order and released in the opposite order:

A-B [...] B-A

That said, I couldn't find anything wrong in this case with moving the
cons->unlock just after the if, so I did as you suggested.


> >          }
> >          else
> >          {
> >              char *kin = kbuf, *kout = kbuf, c;
> > -            struct domain_console *cons = cd->console;
> >  
> > +            nrspin_unlock_irq(&console_lock);
> >              /* Strip non-printable characters */
> 
> Blank line between these?

Yes

> > @@ -824,14 +856,16 @@ long do_console_io(
> >                  len = SERIAL_RX_SIZE - idx;
> >              if ( (rc + len) > count )
> >                  len = count - rc;
> > +            nrspin_unlock_irq(&console_lock);
> >              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> > -            {
> > -                rc = -EFAULT;
> > -                break;
> > -            }
> > +                return -EFAULT;
> >              rc += len;
> > +            nrspin_lock_irq(&console_lock);
> > +            if ( !is_focus_domain(current->domain) )
> > +                break;
> >              serial_rx_cons += len;
> 
> The placement of the check between both updates wants commenting upon, imo.
> Another blank line or two would also help, I think.

OK


> >          }
> > +        nrspin_unlock_irq(&console_lock);
> >          break;
> >      default:
> >          rc = -ENOSYS;
> 
> Much better locking-wise here than in the earlier version.

Thanks! Next version is here:

https://marc.info/?l=xen-devel&m=176913312213329

