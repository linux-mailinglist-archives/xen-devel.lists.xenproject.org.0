Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDNRCxt/cWmnIAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 02:36:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD66064F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 02:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210336.1522060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vijcR-0000jL-6j; Thu, 22 Jan 2026 01:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210336.1522060; Thu, 22 Jan 2026 01:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vijcR-0000i6-3t; Thu, 22 Jan 2026 01:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1210336;
 Thu, 22 Jan 2026 01:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZz6=73=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vijcQ-0000ht-8P
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 01:36:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd72d40c-f732-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 02:36:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79BEE43672;
 Thu, 22 Jan 2026 01:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA9C4CEF1;
 Thu, 22 Jan 2026 01:36:12 +0000 (UTC)
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
X-Inumbo-ID: bd72d40c-f732-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769045774;
	bh=UeCrploEJESDU7p7RW9wlv0RsbYrboGocgLNdFLhbfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UpylZrayYuuVZGibjJdymgA7l5STHTz8UlBDrdMNvfVtUEl9fTNBpoEAWJfoUA2RP
	 +lKMEaaP4lq+6LijUle7BpRAQxIV7YJtKS1Q8f6cShqoHdhEuKPKtDeAQR55KqXSi4
	 vLVdWlkt3sCvyt+xCYuHiof6tEFSavRAdWYordlTFcjWka62gVp8cuN81Z+tjBvVu8
	 XXMj99uwxlrZniShINfMl5y+ImkY6dVekutGj16puKRIPm2d0Qj52DqFSQ8TrzSBS7
	 5M9Srg6wevKXmNNBkCIws5ZwVmCNXlUjr4unhg2MpHry3txdAY7HwHkmApbpN8Rd5+
	 DkQwnb+m2EyZQ==
Date: Wed, 21 Jan 2026 17:36:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
In-Reply-To: <873867dc-79d8-4ed3-94f7-1c7823db7957@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601211509560.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop> <63c35c5e-577b-4346-b600-03808306177f@suse.com> <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop> <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
 <alpine.DEB.2.22.394.2601201601070.7192@ubuntu-linux-20-04-desktop> <873867dc-79d8-4ed3-94f7-1c7823db7957@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marc.info:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A5AD66064F
X-Rspamd-Action: no action

On Wed, 21 Jan 2026, Jan Beulich wrote:
> On 21.01.2026 01:07, Stefano Stabellini wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -521,6 +521,8 @@ struct domain *console_get_domain(void)
> >  {
> >      struct domain *d;
> >  
> > +    nrspin_lock_irq(&console_lock);
> > +
> >      if ( console_rx == 0 )
> >              return NULL;
> >  
> > @@ -540,6 +542,8 @@ void console_put_domain(struct domain *d)
> >  {
> >      if ( d )
> >          rcu_unlock_domain(d);
> > +
> > +    nrspin_unlock_irq(&console_lock);
> >  }
> 
> Hmm, I'd much prefer if we could avoid this. The functions aren't even
> static, and new uses could easily appear. Such a locking model, even
> disabling IRQs, feels pretty dangerous. (If it was to be kept, prominent
> comments would need adding imo. However, for now I'm not going to make
> any effort to verify this is actually safe, on the assumption that this
> will go away again.)

It is totally fine to get rid of it and revert back to explicit locks
outside of the console_get_domain and console_put_domain functions as it
was done in v4: https://marc.info/?l=xen-devel&m=176886821718712

However, the locked regions would still need to extended, more on this
below.


> > @@ -596,8 +604,19 @@ static void __serial_rx(char c)
> >  
> >      d = console_get_domain();
> >      if ( !d )
> > +    {
> > +        console_put_domain(d);
> >          return;
> > +    }
> >  
> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    } else
> 
> Nit: Style.
> 
> > +#endif
> >      if ( is_hardware_domain(d) || IS_ENABLED(CONFIG_DOM0LESS_BOOT) )
> >      {
> >          /*
> > @@ -613,11 +632,6 @@ static void __serial_rx(char c)
> >           */
> >          send_guest_domain_virq(d, VIRQ_CONSOLE);
> >      }
> > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > -    else
> > -        /* Deliver input to the emulated UART. */
> > -        rc = vpl011_rx_char_xen(d, c);
> > -#endif
> 
> I don't understand this movement, and iirc it also wasn't there in v3.
> There's no explanation in the description, unless I'm overlooking the
> crucial few words.

This chunk fixes an unrelated bug on ARM. We need to move the
CONFIG_SBSA_VUART_CONSOLE check earlier otherwise this patch will never
be taken when IS_ENABLED(CONFIG_DOM0LESS_BOOT).

I wrote a note in the changelog here:
https://marc.info/?l=xen-devel&m=176886821718712

- if vpl011 is enabled, send characters to it (retains current behavior
  on ARM)

I'll be clearer in the next commit message.


> > @@ -741,17 +756,23 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          if ( copy_from_guest(kbuf, buffer, kcount) )
> >              return -EFAULT;
> >  
> > -        if ( is_hardware_domain(cd) )
> > +        input = console_get_domain();
> > +        if ( input && cd == input )
> >          {
> > +            if ( cd->pbuf_idx )
> > +            {
> > +                console_send(cd->pbuf, cd->pbuf_idx, flags);
> > +                cd->pbuf_idx = 0;
> > +            }
> >              /* Use direct console output as it could be interactive */
> > -            nrspin_lock_irq(&console_lock);
> >              console_send(kbuf, kcount, flags);
> > -            nrspin_unlock_irq(&console_lock);
> > +            console_put_domain(input);
> >          }
> >          else
> >          {
> >              char *kin = kbuf, *kout = kbuf, c;
> >  
> > +            console_put_domain(input);
> >              /* Strip non-printable characters */
> >              do
> >              {
> 
> The folding of locking into console_{get,put}_domain() again results in overly
> long windows where the "put" is still outstanding. As said before, the current
> domain can't go away behind your back.

I wrote in the commit message: "Add the console_lock around
serial_rx_prod and serial_rx_cons modifications to protect it against
concurrent writes to it. Also protect against changes of domain with
focus while reading from the serial."

Following your past review comments, I switched to using the
console_lock (folded into console_get/put_domain, but it can be
separate) to protect both serial_rx_prod/serial_rx_cons accesses and
also console_rx accesses.



> > @@ -813,6 +835,13 @@ long do_console_io(
> >          if ( count > INT_MAX )
> >              break;
> >  
> > +        d = console_get_domain();
> > +        if ( d != current->domain )
> > +        {
> > +            console_put_domain(d);
> > +            return 0;
> > +        }
> > +
> >          rc = 0;
> >          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
> >          {
> > @@ -822,14 +851,23 @@ long do_console_io(
> >                  len = SERIAL_RX_SIZE - idx;
> >              if ( (rc + len) > count )
> >                  len = count - rc;
> > +
> > +            console_put_domain(d);
> >              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> >              {
> >                  rc = -EFAULT;
> >                  break;
> >              }
> > +            d = console_get_domain();
> > +            if ( d != current->domain )
> > +            {
> > +                console_put_domain(d);
> > +                break;
> > +            }
> >              rc += len;
> >              serial_rx_cons += len;
> >          }
> > +        console_put_domain(d);
> >          break;
> 
> This is pretty horrible, don't you agree? Demonstrated by the fact that you
> look to have encoded a double put: The 2nd to last one conflicts with the
> one right after the loop. Whereas the earlier "break" has no reference at
> all, but still takes the path with the "put" right after the loop. At the
> same time it also looks wrong to simply drop that last "put".

Yes I agree it is horrible. I did a deep review of all locking scenarios
and moved console_lock out of console_get/put_domain.

I sent out an update, expanding the commit message to explain the
locking, and re-testing all scenarios on both ARM and x86.

https://marc.info/?l=xen-devel&m=176904847332141

There were at 2-3 locking issues in this version of the patch and they
have all being resolved now.



