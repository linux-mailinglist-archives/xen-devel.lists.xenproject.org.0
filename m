Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a4K5I2LJemlc+gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:43:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF32AB3AF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216038.1526037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzp-0000Pq-Te; Thu, 29 Jan 2026 02:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216038.1526037; Thu, 29 Jan 2026 02:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzp-0000NG-Qe; Thu, 29 Jan 2026 02:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1216038;
 Thu, 29 Jan 2026 02:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlHzo-0000MZ-JG
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 02:43:00 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e59ce8-fcbc-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 03:42:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44C9740EBB;
 Thu, 29 Jan 2026 02:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7EDC4CEF1;
 Thu, 29 Jan 2026 02:42:54 +0000 (UTC)
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
X-Inumbo-ID: 37e59ce8-fcbc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654576;
	bh=28fwAAp2CHTkhFezCiscILlUGMMq7vQ+iKzESuFOE/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=noq9VVgmwjstN4rHhZv8DRQUIxCqxvSEwjEOkqklMG9ihfDuz72kEa9N8v1O3bV9a
	 ASDrx6aSmaOz3IiPLAmSBhwocWdAKUiPqK+2NWAVS577orTBeM95M2wSvr8rvMicr2
	 LE4Sj49NgZvQpM/BOr5k3ZZvMI0Iy8gKPywIJ40tXqAL6prF9iOM5sO1K+CqEBTBdi
	 QrWnPte/uZS9wEnFUO8O+RC7vqa5bgyB8WU75Jp1mTY9jYBM8he65ItTdv6MVxlbmO
	 5xuMqmcji8kGsXCtUj3x9Us+ctMfuJlFtckdKLkhEqkRZZL7KFW+IZbviY9m/twp7E
	 EQEwURKAJ3fOw==
Date: Wed, 28 Jan 2026 18:42:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 1/2] xen/console: handle multiple domains using
 console_io hypercalls
In-Reply-To: <ebc50459-b6f8-4827-b326-edda5f0f67d7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601281807290.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop> <20260123010640.1194863-1-stefano.stabellini@amd.com> <ebc50459-b6f8-4827-b326-edda5f0f67d7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5FF32AB3AF
X-Rspamd-Action: no action

On Wed, 28 Jan 2026, Jan Beulich wrote:
> On 23.01.2026 02:06, Stefano Stabellini wrote:
> > @@ -555,8 +561,11 @@ static void console_switch_input(void)
> >  
> >          if ( next_rx++ >= max_console_rx )
> >          {
> > -            console_rx = 0;
> >              printk("*** Serial input to Xen");
> > +            nrspin_lock_irq(&console_lock);
> > +            console_rx = 0;
> > +            serial_rx_cons = serial_rx_prod;
> > +            nrspin_unlock_irq(&console_lock);
> >              break;
> >          }
> >  
> > @@ -575,8 +584,12 @@ static void console_switch_input(void)
> >  
> >              rcu_unlock_domain(d);
> >  
> > -            console_rx = next_rx;
> >              printk("*** Serial input to DOM%u", domid);
> > +            nrspin_lock_irq(&console_lock);
> > +            console_rx = next_rx;
> > +            /* Don't let the next dom read the previous dom's unread data. */
> > +            serial_rx_cons = serial_rx_prod;
> > +            nrspin_unlock_irq(&console_lock);
> >              break;
> >          }
> 
> As in both cases you're also moving console_rx updates into the locked
> region, what about readers of the variable, first and foremost
> console_get_domain()? Else why the movement?

You're right. I've added locking in console_get_domain() to read
console_rx under console_lock into a local variable, ensuring
consistency with the now-locked writes.


> Also I think that the printk()s would better be last, indicating the
> completion of the switching.

OK


> > @@ -605,8 +618,10 @@ static void __serial_rx(char c)
> >           * Deliver input to the hardware domain buffer, unless it is
> >           * already full.
> >           */
> 
> This comment goes stale with the buffer being used for whichever is the
> focus domain in do_console_io().
> 
> > +        nrspin_lock_irq(&console_lock);
> >          if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
> >              serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> > +        nrspin_unlock_irq(&console_lock);
> 
> I don't think you can unconditionally enable interrupts here, as this may
> be running in the context of an IRQ handler.

Good catch! I've changed __serial_rx() to use nrspin_lock_irqsave()/
nrspin_unlock_irqrestore() instead of
nrspin_lock_irq()/nrspin_unlock_irq(). 


> > @@ -742,17 +758,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          if ( copy_from_guest(kbuf, buffer, kcount) )
> >              return -EFAULT;
> >  
> > -        if ( is_hardware_domain(cd) )
> > +        /*
> > +         * Take both cons->lock and console_lock:
> > +         * - cons->lock protects cons->buf and cons->idx
> > +         * - console_lock protects console_send and is_focus_domain
> > +         *   checks
> > +         *
> > +         * The order must be respected. guest_printk takes the
> > +         * console_lock so it is important that cons->lock is taken
> > +         * first.
> > +         */
> > +        spin_lock(&cons->lock);
> > +        nrspin_lock_irq(&console_lock);
> > +        if ( is_focus_domain(cd) )
> 
> Why would any of the domains possibly being permitted to be "focus" suddenly
> gain direct access here? Full access in do_console_io() is still prevented by
> the XSM check there, afaict. Cc-ing Daniel, as it's not quite clear to me
> whether to introduce another XSM check here, whether to check ->is_console
> directly, or yet something else.

The XSM check still happens first in do_console_io() via
xsm_console_io(XSM_OTHER, current->domain, cmd), which validates that
the domain has permission to use console_io hypercalls. The focus check
is an additional restriction that only allows reading when the domain
has focus: it doesn't grant new permissions. Dom0less domains with
input_allowed = true are already permitted by XSM policy to use
console_io; the focus mechanism just ensures only one domain can read
input at a time (similar to vpl011 behavior). Additionally, this is also
allowed for dom0less domains which are quite special and manually
configured at boot by the user. There are no arbitrary unknown dom0less
domains that can be started later.


> >          {
> > +            if ( cons->idx )
> > +            {
> > +                console_send(cons->buf, cons->idx, flags);
> > +                cons->idx = 0;
> > +            }
> > +            spin_unlock(&cons->lock);
> > +
> >              /* Use direct console output as it could be interactive */
> > -            nrspin_lock_irq(&console_lock);
> >              console_send(kbuf, kcount, flags);
> >              nrspin_unlock_irq(&console_lock);
> >          }
> >          else
> >          {
> >              char *kin = kbuf, *kout = kbuf, c;
> > -            struct domain_console *cons = cd->console;
> > +
> > +            nrspin_unlock_irq(&console_lock);
> >  
> >              /* Strip non-printable characters */
> >              do
> > @@ -765,7 +800,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >              } while ( --kcount > 0 );
> >  
> >              *kout = '\0';
> > -            spin_lock(&cons->lock);
> >              kcount = kin - kbuf;
> >              if ( c != '\n' &&
> >                   (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
> > @@ -815,6 +849,13 @@ long do_console_io(
> >          if ( count > INT_MAX )
> >              break;
> >  
> > +        nrspin_lock_irq(&console_lock);
> > +        if ( !is_focus_domain(current->domain) )
> > +        {
> > +            nrspin_unlock_irq(&console_lock);
> > +            return 0;
> > +        }
> 
> To avoid the extra unlock-and-return, how about simply setting "count" to 0,
> leveraging ...

Good idea.


> >          rc = 0;
> >          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
> 
> ... the rhs check here?
> 
> > @@ -824,14 +865,28 @@ long do_console_io(
> >                  len = SERIAL_RX_SIZE - idx;
> >              if ( (rc + len) > count )
> >                  len = count - rc;
> > +            nrspin_unlock_irq(&console_lock);
> 
> This can be moved up a few lines, as none of the local variable manipulations
> needs guarding.

OK


> >              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> > -            {
> > -                rc = -EFAULT;
> > -                break;
> > -            }
> > +                return -EFAULT;
> >              rc += len;
> > +
> > +            /*
> > +             * First get console_lock again, then check is_focus_domain.
> > +             * It is possible that we switched focus domain during
> > +             * copy_to_guest_offset. In that case, serial_rx_cons and
> 
> Please can you append () to the function name, to identify it as a function,
> as opposed to ...
> 
> > +             * serial_rx_prod have been reset so it would be wrong to
> > +             * update serial_rx_cons here. Get out of the loop instead.
> 
> ... the two variables referenced here?

Done

