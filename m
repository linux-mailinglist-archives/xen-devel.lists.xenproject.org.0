Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB1HNb1+gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:03:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1EFDF85F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219733.1528609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPPU-0007Q7-En; Tue, 03 Feb 2026 23:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219733.1528609; Tue, 03 Feb 2026 23:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPPU-0007Ns-BN; Tue, 03 Feb 2026 23:02:16 +0000
Received: by outflank-mailman (input) for mailman id 1219733;
 Tue, 03 Feb 2026 23:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0aDa=AH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vnPPS-0007NO-IM
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:02:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9781f4-0154-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 00:02:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B6BF432E0;
 Tue,  3 Feb 2026 23:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E255C116D0;
 Tue,  3 Feb 2026 23:02:09 +0000 (UTC)
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
X-Inumbo-ID: 5f9781f4-0154-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770159731;
	bh=rN1vHEBu5BFuRFQMvN9Xkf1rjI4+tIIdv9j+7zG6JTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OXKI8dINgXS4T5/XPa9oQel1PfVxUhGWodHEbSQis2CAQY84xRKbDaTQW0YV+vDeF
	 bJfWpoIZvnlRiJz/+4uapY6idR7PisITjh83C1kWgALYf6FuAzoVZo8omdgEYE7rOo
	 CNdosvrKFdIyBukkfQMM3cIu/K2/SVaIt+jAd3pmmLFH06fAkNsbAvjvdPWUPqZJBK
	 2glrgX1gYgXhf1FYNFi30Hc6T/Sjvk5rKmXNQOj6VBoJENbX4Tb9cacYlkELZ+sJ0U
	 V6dAmGIAZmuCyEa/j+J4KetJ129QLPhXIc1toQrEO6FLHzaauvkm3M+XLBMtQ9kGzr
	 hQ/OJBtwUXFJg==
Date: Tue, 3 Feb 2026 15:02:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 1/2] xen/console: handle multiple domains using
 console_io hypercalls
In-Reply-To: <0fc9a80a-8621-4ce4-b2f9-c102e975b05b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602031502000.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop> <20260129220858.2371938-1-stefano.stabellini@amd.com> <0fc9a80a-8621-4ce4-b2f9-c102e975b05b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7C1EFDF85F
X-Rspamd-Action: no action

On Tue, 3 Feb 2026, Jan Beulich wrote:
> On 29.01.2026 23:08, Stefano Stabellini wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -518,11 +518,16 @@ static unsigned int __read_mostly console_rx = 0;
> >  struct domain *console_get_domain(void)
> >  {
> >      struct domain *d;
> > +    unsigned int rx;
> >  
> > -    if ( console_rx == 0 )
> > +    nrspin_lock(&console_lock);
> > +    rx = console_rx;
> > +    nrspin_unlock(&console_lock);
> 
> Did you test this in a debug build, and it didn't blow up? The console lock
> is an IRQ-safe one, so I'd expect check_lock() to complain that you do not
> disable IRQs here. At the same time I don't think you can rely on IRQs being
> off upon entry into the function.
> 
> Anyway - is locking here really needed? Wouldn't suitable use of ACCESS_ONCE()
> (also elsewhere) do? (Such a switchover likely could be a separate, prereq
> patch.)

I created a prereq patch which introduces ACCESS_ONCE everywhere for
console_rx


> Further, if already you add locking on the read sides, what about ...
> 
> > @@ -540,6 +545,12 @@ void console_put_domain(struct domain *d)
> >          rcu_unlock_domain(d);
> >  }
> >  
> > +static bool is_focus_domain(const struct domain *d)
> > +{
> > +    ASSERT(rspin_is_locked(&console_lock));
> > +    return d != NULL && d->domain_id == console_rx - 1;
> > +}
> > +
> >  static void console_switch_input(void)
> >  {
> >      unsigned int next_rx = console_rx;
> 
> ... this read?
> 
> > @@ -555,7 +566,10 @@ static void console_switch_input(void)
> >  
> >          if ( next_rx++ >= max_console_rx )
> >          {
> > +            nrspin_lock_irq(&console_lock);
> 
> As indicated earlier, you can't know IRQ state in anything down the call
> tree from serial_rx().

I'll switch to the irqsave/restore versions in console_switch_input


> 
> > @@ -742,17 +765,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          if ( copy_from_guest(kbuf, buffer, kcount) )
> >              return -EFAULT;
> >  
> > -        if ( is_hardware_domain(cd) )
> > +        /*
> > +         * Take both cons->lock and console_lock:
> > +         * - cons->lock protects cons->buf and cons->idx
> > +         * - console_lock protects console_send() and is_focus_domain()
> > +         *   checks
> > +         *
> > +         * The order must be respected. guest_printk() takes the
> > +         * console_lock so it is important that cons->lock is taken
> > +         * first.
> > +         */
> > +        spin_lock(&cons->lock);
> > +        nrspin_lock_irq(&console_lock);
> 
> While guest_printk() does matter here, it taking (down the call tree)
> console_lock isn't alone relevant. It being called with cons->lock held
> is, .

I updated the in-code comment

> 
> > @@ -816,22 +857,39 @@ long do_console_io(
> >              break;
> >  
> >          rc = 0;
> > +        nrspin_lock_irq(&console_lock);
> > +        if ( !is_focus_domain(current->domain) )
> > +            count = 0;
> >          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
> >          {
> >              idx = SERIAL_RX_MASK(serial_rx_cons);
> >              len = serial_rx_prod - serial_rx_cons;
> > +            nrspin_unlock_irq(&console_lock);
> 
> Can we please have blank lines on both sides of this?

sure

> >              if ( (idx + len) > SERIAL_RX_SIZE )
> >                  len = SERIAL_RX_SIZE - idx;
> >              if ( (rc + len) > count )
> >                  len = count - rc;
> >              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
> 
> Have I perhaps talked you into moving the unlock too early? serial_rx_ring[]
> accesses look like they need to be with the lock still held. Or, to avoid
> calling copy_to_guest_offset() with the lock held, a local copy would need
> making.

I introduced a local copy

