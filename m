Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850D63CAF9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 23:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449668.706552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p08pv-0000o6-2Y; Tue, 29 Nov 2022 22:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449668.706552; Tue, 29 Nov 2022 22:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p08pu-0000lu-VK; Tue, 29 Nov 2022 22:12:18 +0000
Received: by outflank-mailman (input) for mailman id 449668;
 Tue, 29 Nov 2022 22:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p08pt-0000lV-KK
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 22:12:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1728be7-7032-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 23:12:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B7F8B8196F;
 Tue, 29 Nov 2022 22:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E382C433C1;
 Tue, 29 Nov 2022 22:12:12 +0000 (UTC)
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
X-Inumbo-ID: e1728be7-7032-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669759934;
	bh=4RuzJ7BL/FNTfCIqwW3Nd0sZ43y1DcZWKvFgBlC79Bk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e+713zTdnBG5bqmBw1GuwUkAD9XOWKXqxw7XYNHaRrqoT3BkU+ZEivAGBOEtpdtJr
	 uJYLYoMCoGj18nBRzGXNQv7KnWVdcW6xxrqttiseiOt9JoG6m9tOGsRDWUC7rIXN/L
	 3G0vCXtbgPs7zaQ9E1J7nNu7Gm2etSc7PUpWrDc0aeYo4/9AgGTZd+/bkPkKUj4soQ
	 J2HhcACKyzKeAWP5jn+Q2MiBLP5kEJXgwEVxif1RJRHnshOZ8mEAQ0UcPIXtukdkB5
	 hr2elIJAs/xUjmkN991e7/bLC2EFVaUeZBsayv5rbJAJluKTwmWVcimvi+hL+LvbM2
	 RROj9X2TqT19g==
Date: Tue, 29 Nov 2022 14:12:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Olof Johansson <olof@lixom.net>, Ingo Molnar <mingo@elte.hu>, 
    Jeremy Fitzhardinge <jeremy@xensource.com>, 
    Chris Wright <chrisw@sous-sol.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] hvc/xen: prevent concurrent accesses to the shared
 ring
In-Reply-To: <20221129120107.2942-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211291351160.4039@ubuntu-linux-20-04-desktop>
References: <20221129120107.2942-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1290527983-1669759303=:4039"
Content-ID: <alpine.DEB.2.22.394.2211291402170.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1290527983-1669759303=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211291402171.4039@ubuntu-linux-20-04-desktop>

On Tue, 29 Nov 2022, Roger Pau Monne wrote:
> The hvc machinery registers both a console and a tty device based on
> the hv ops provided by the specific implementation.  Those two
> interfaces however have different locks, and there's no single locks
> that's shared between the tty and the console implementations, hence
> the driver needs to protect itself against concurrent accesses.
> Otherwise concurrent calls using the split interfaces are likely to
> corrupt the ring indexes, leaving the console unusable.
>
> Introduce a lock to xencons_info to serialize accesses to the shared
> ring.  This is only required when using the shared memory console,
> concurrent accesses to the hypercall based console implementation are
> not an issue.
> 
> Note the conditional logic in domU_read_console() is slightly modified
> so the notify_daemon() call can be done outside of the locked region:
> it's an hypercall and there's no need for it to be done with the lock
> held.
> 
> Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> While the write handler (domU_write_console()) is used by both the
> console and the tty ops, that's not the case for the read side
> (domU_read_console()).  It's not obvious to me whether we could get
> concurrent poll calls from the poll_get_char tty hook, hence stay on
> the safe side also serialize read accesses in domU_read_console().

I think domU_read_console doesn't need it. struct hv_ops and struct
console are both already locked although independently locked.

I think we shouldn't add an unrequired lock there.


> ---
>  drivers/tty/hvc/hvc_xen.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 7c23112dc923..d65741983837 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -43,6 +43,7 @@ struct xencons_info {
>  	int irq;
>  	int vtermno;
>  	grant_ref_t gntref;
> +	spinlock_t ring_lock;
>  };
>  
>  static LIST_HEAD(xenconsoles);
> @@ -84,12 +85,15 @@ static int __write_console(struct xencons_info *xencons,
>  	XENCONS_RING_IDX cons, prod;
>  	struct xencons_interface *intf = xencons->intf;
>  	int sent = 0;
> +	unsigned long flags;
>  
> +	spin_lock_irqsave(&xencons->ring_lock, flags);
>  	cons = intf->out_cons;
>  	prod = intf->out_prod;
>  	mb();			/* update queue values before going on */
>  
>  	if ((prod - cons) > sizeof(intf->out)) {
> +		spin_unlock_irqrestore(&xencons->ring_lock, flags);
>  		pr_err_once("xencons: Illegal ring page indices");
>  		return -EINVAL;
>  	}
> @@ -99,6 +103,7 @@ static int __write_console(struct xencons_info *xencons,
>  
>  	wmb();			/* write ring before updating pointer */
>  	intf->out_prod = prod;
> +	spin_unlock_irqrestore(&xencons->ring_lock, flags);
>  
>  	if (sent)
>  		notify_daemon(xencons);
> @@ -141,16 +146,19 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>  	int recv = 0;
>  	struct xencons_info *xencons = vtermno_to_xencons(vtermno);
>  	unsigned int eoiflag = 0;
> +	unsigned long flags;
>  
>  	if (xencons == NULL)
>  		return -EINVAL;
>  	intf = xencons->intf;
>  
> +	spin_lock_irqsave(&xencons->ring_lock, flags);
>  	cons = intf->in_cons;
>  	prod = intf->in_prod;
>  	mb();			/* get pointers before reading ring */
>  
>  	if ((prod - cons) > sizeof(intf->in)) {
> +		spin_unlock_irqrestore(&xencons->ring_lock, flags);
>  		pr_err_once("xencons: Illegal ring page indices");
>  		return -EINVAL;
>  	}
> @@ -174,10 +182,13 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>  		xencons->out_cons = intf->out_cons;
>  		xencons->out_cons_same = 0;
>  	}
> +	if (!recv && xencons->out_cons_same++ > 1) {
> +		eoiflag = XEN_EOI_FLAG_SPURIOUS;
> +	}
> +	spin_unlock_irqrestore(&xencons->ring_lock, flags);
> +
>  	if (recv) {
>  		notify_daemon(xencons);
> -	} else if (xencons->out_cons_same++ > 1) {
> -		eoiflag = XEN_EOI_FLAG_SPURIOUS;
>  	}
>  
>  	xen_irq_lateeoi(xencons->irq, eoiflag);
> @@ -576,6 +587,7 @@ static int __init xen_hvc_init(void)
>  
>  		info = vtermno_to_xencons(HVC_COOKIE);
>  		info->irq = bind_evtchn_to_irq_lateeoi(info->evtchn);
> +		spin_lock_init(&info->ring_lock);

Don't we also need a call to spin_lock_init in xencons_connect_backend
and xen_cons_init and xenboot_console_setup ?


>  	}
>  	if (info->irq < 0)
>  		info->irq = 0; /* NO_IRQ */
> -- 
> 2.37.3
> 
--8323329-1290527983-1669759303=:4039--

