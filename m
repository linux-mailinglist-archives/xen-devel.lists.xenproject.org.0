Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D2763E6EA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 02:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450171.707400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Y3i-0004Hc-O0; Thu, 01 Dec 2022 01:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450171.707400; Thu, 01 Dec 2022 01:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Y3i-0004EA-L6; Thu, 01 Dec 2022 01:08:14 +0000
Received: by outflank-mailman (input) for mailman id 450171;
 Thu, 01 Dec 2022 01:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0Y3h-0004E4-GW
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 01:08:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a00824bd-7114-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 02:08:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69C87B81DA2;
 Thu,  1 Dec 2022 01:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA6C433C1;
 Thu,  1 Dec 2022 01:08:08 +0000 (UTC)
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
X-Inumbo-ID: a00824bd-7114-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669856890;
	bh=bFlbLQgBVNKI3BdQdH5xSPIz5WZl3iB+qIlQMkn9m+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YRd9P2mpOz6bqrBG5RBaKtt+CMe5Xifx+G363fJd16ZA/KN4N2N0SgfcVpG3DvVyp
	 UsdnsDOFsTUkjVrZTkhFEi1qUVli0mbmSqpQraYCQ25tMd0cOU8Zs6/3MqJNIIveBF
	 zWVL3hLtafI1xQPsFdGj0Y8utIoFdXtVfSURTpzWs6TWv3LWwhNx7oGxpes2nZBef/
	 3AjhYEtK2cvbcj9Y0ZTtjlip96yRDFAmqZPiJCrRcdWX6NnQ3u8OgrNggQYn4cz2H+
	 Y6k0p4CfxNG+JYfOxlvNagquWOtwxsaPump74xCPQMAeZ6upUbZR4ESPIjVLRqsePn
	 kzTSBC+lac8RA==
Date: Wed, 30 Nov 2022 17:08:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Chris Wright <chrisw@sous-sol.org>, Ingo Molnar <mingo@elte.hu>, 
    Jeremy Fitzhardinge <jeremy@xensource.com>, 
    Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
In-Reply-To: <20221130150919.13935-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
References: <20221130150919.13935-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-408063575-1669856560=:4039"
Content-ID: <alpine.DEB.2.22.394.2211301705510.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-408063575-1669856560=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211301705511.4039@ubuntu-linux-20-04-desktop>

On Wed, 30 Nov 2022, Roger Pau Monne wrote:
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

For domU_read_console: I don't mean to block this patch but we need to
be sure about the semantics of hv_ops.get_chars. Either it is expected
to be already locked, then we definitely shouldn't add another lock to
domU_read_console. Or it is not expected to be already locked, then we
should add the lock.

My impression is that it is expected to be already locked, but I think
we need Greg or Jiri to confirm one way or the other.

Aside from that the rest looks fine.



> Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Properly initialize the introduced lock in all paths.
> ---
>  drivers/tty/hvc/hvc_xen.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 7c23112dc923..e63c1761a361 100644
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
> @@ -234,6 +245,7 @@ static int xen_hvm_console_init(void)
>  		info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
>  		if (!info)
>  			return -ENOMEM;
> +		spin_lock_init(&info->ring_lock);
>  	} else if (info->intf != NULL) {
>  		/* already configured */
>  		return 0;
> @@ -270,6 +282,7 @@ static int xen_hvm_console_init(void)
>  
>  static int xencons_info_pv_init(struct xencons_info *info, int vtermno)
>  {
> +	spin_lock_init(&info->ring_lock);
>  	info->evtchn = xen_start_info->console.domU.evtchn;
>  	/* GFN == MFN for PV guest */
>  	info->intf = gfn_to_virt(xen_start_info->console.domU.mfn);
> @@ -318,6 +331,7 @@ static int xen_initial_domain_console_init(void)
>  		info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
>  		if (!info)
>  			return -ENOMEM;
> +		spin_lock_init(&info->ring_lock);
>  	}
>  
>  	info->irq = bind_virq_to_irq(VIRQ_CONSOLE, 0, false);
> @@ -472,6 +486,7 @@ static int xencons_probe(struct xenbus_device *dev,
>  	info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
> +	spin_lock_init(&info->ring_lock);
>  	dev_set_drvdata(&dev->dev, info);
>  	info->xbdev = dev;
>  	info->vtermno = xenbus_devid_to_vtermno(devid);
> -- 
> 2.37.3
> 
--8323329-408063575-1669856560=:4039--

