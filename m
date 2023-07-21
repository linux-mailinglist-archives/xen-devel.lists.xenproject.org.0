Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F389B75C722
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567525.886691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpYf-0001Qx-CT; Fri, 21 Jul 2023 12:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567525.886691; Fri, 21 Jul 2023 12:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpYf-0001OO-9O; Fri, 21 Jul 2023 12:48:33 +0000
Received: by outflank-mailman (input) for mailman id 567525;
 Fri, 21 Jul 2023 12:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0odj=DH=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1qMpYe-0001OI-7e
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:48:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e48c2b77-27c4-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 14:48:30 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 48998218A2;
 Fri, 21 Jul 2023 12:48:29 +0000 (UTC)
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9B7942C142;
 Fri, 21 Jul 2023 12:48:28 +0000 (UTC)
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
X-Inumbo-ID: e48c2b77-27c4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689943709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OPAFYCvki0R2yUMG2eLy5Z6FQniLXjJC6TpkA0OHteg=;
	b=DnVoiF3/3b0WjnMWqR8QQZVAebQRIbzRBVKVFHHAPTvAYCtIHxI6ht27OVjpY6pWnxp+rJ
	OBQfNSNg10V81vcAOMZlP8LNogx+sYsBLt6EQQAq/k88/Yqi+bA7NjVbwEDwoh79nP9glr
	gPh4ovB+XigMcs0uQ/x2sBCkwacfO6A=
Date: Fri, 21 Jul 2023 14:48:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, jgross@suse.com,
	xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	live-patching@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH LINUX v5 2/2] xen: add support for initializing xenstore
 later as HVM domain
Message-ID: <ZLp-mAc1aFEgbVgS@alley>
References: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
 <20220513211938.719341-2-sstabellini@kernel.org>
 <ZLgFmS4TQwGWA7o0@alley>
 <alpine.DEB.2.22.394.2307191841290.3118466@ubuntu-linux-20-04-desktop>
 <ZLkKAO09DnM8quG-@alley>
 <alpine.DEB.2.22.394.2307201629190.3118466@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2307201629190.3118466@ubuntu-linux-20-04-desktop>

On Thu 2023-07-20 16:31:16, Stefano Stabellini wrote:
> On Thu, 20 Jul 2023, Petr Mladek wrote:
> > On Wed 2023-07-19 18:46:08, Stefano Stabellini wrote:
> > > On Wed, 19 Jul 2023, Petr Mladek wrote:
> > > > I see the following warning from free_irq() in 6.5-rc2 when running
> > > > livepatching selftests. It does not happen after reverting this patch.
> > > > 
> > > > [  352.168453] livepatch: signaling remaining tasks
> > > > [  352.173228] ------------[ cut here ]------------
> > > > [  352.175563] Trying to free already-free IRQ 0
> > > > [  352.177355] WARNING: CPU: 1 PID: 88 at kernel/irq/manage.c:1893 free_irq+0xbf/0x350
> > > > [  352.179942] Modules linked in: test_klp_livepatch(EK)
> > > > [  352.181621] CPU: 1 PID: 88 Comm: xenbus_probe Kdump: loaded Tainted: G            E K    6.5.0-rc2-default+ #535
> > > > [  352.184754] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.15.0-0-g2dd4b9b-rebuilt.opensuse.org 04/01/2014
> > > > [  352.188214] RIP: 0010:free_irq+0xbf/0x350
[...]
> > > > [  352.213951] Call Trace:
> > > > [  352.214390]  <TASK>
> > > > [  352.214717]  ? __warn+0x81/0x170
> > > > [  352.215436]  ? free_irq+0xbf/0x350
> > > > [  352.215906]  ? report_bug+0x10b/0x200
> > > > [  352.216408]  ? prb_read_valid+0x17/0x20
> > > > [  352.216926]  ? handle_bug+0x44/0x80
> > > > [  352.217409]  ? exc_invalid_op+0x13/0x60
> > > > [  352.217932]  ? asm_exc_invalid_op+0x16/0x20
> > > > [  352.218497]  ? free_irq+0xbf/0x350
> > > > [  352.218979]  ? __pfx_xenbus_probe_thread+0x10/0x10
> > > > [  352.219600]  xenbus_probe+0x7a/0x80
> > > > [  352.221030]  xenbus_probe_thread+0x76/0xc0
> > > > [  352.221416]  ? __pfx_autoremove_wake_function+0x10/0x10
> > > > [  352.221882]  kthread+0xfd/0x130
> > > > [  352.222191]  ? __pfx_kthread+0x10/0x10
> > > > [  352.222544]  ret_from_fork+0x2d/0x50
> > > > [  352.222893]  ? __pfx_kthread+0x10/0x10
> > > > [  352.223260]  ret_from_fork_asm+0x1b/0x30
> > 
> > I do not know where exactly it triggers the XEN code.
> > 
> > > but it would seem
> > > that either:
> > > 1) free_irq is called twice
> > > 2) free_irq is called but xs_init_irq wasn't initialized before
> > > 
> > > For 2) I can see that xenbus_probe() is called in a few cases where
> > > xs_init_irq wasn't set. Something like the below would make the warning
> > > go away but it would be nice to figure out which one is the code path
> > > taken that originally triggered the warning.
> > 
> > I added some debugging messages and:
> > 
> >   + xenbus_probe() was called in xenbus_probe_thread().
> > 
> >   + xenbus_init() returned early after xen_domain() check so that
> >     xs_init_irq was never initialized.
> > 
> > Note that I use KVM and not XEN:
> > 
> > [    0.000000] Hypervisor detected: KVM
> > [...]
> > [    0.072150] Booting paravirtualized kernel on KVM
> 
> Ah! So the issue is that xenbus_init() returns early but
> xenbus_probe_initcall() doesn't. So maybe we just need a xen_domain
> check in xenbus_probe_initcall too.
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 58b732dcbfb8..e9bd3ed70108 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -811,6 +812,9 @@ static int xenbus_probe_thread(void *unused)
>  
>  static int __init xenbus_probe_initcall(void)
>  {
> +	if (!xen_domain())
> +		return -ENODEV;
> +
>  	/*
>  	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
>  	 * need to wait for the platform PCI device to come up or

I confirm that this change cures the problem as well. Feel free
to add:

Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

