Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MBZIH/6lWknXwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:44:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157EE158669
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235908.1538743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslb1-0003eU-Hs; Wed, 18 Feb 2026 17:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235908.1538743; Wed, 18 Feb 2026 17:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslb1-0003d2-Em; Wed, 18 Feb 2026 17:44:19 +0000
Received: by outflank-mailman (input) for mailman id 1235908;
 Wed, 18 Feb 2026 17:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I2H6=AW=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1vslb0-0003cw-3w
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 17:44:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ccb601-0cf1-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 18:44:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A7E664363D;
 Wed, 18 Feb 2026 17:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54290C116D0;
 Wed, 18 Feb 2026 17:44:13 +0000 (UTC)
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
X-Inumbo-ID: 70ccb601-0cf1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771436653;
	bh=Fudqi39z3fKIjZN21JHFU9sp7Q8l8iy+U+/yWrTdC3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bwaxpARdI1IwCU7FcAI2SYSxnBe2vufuu+wpk2Yyd/5+yt+PIQZiJ2bIh1nu9+s0S
	 oHgnfB7ek7MZDe+w7w3//NWm0Xwod0AJDeCeoBt7Hs5w0gVYr3P6MWVFRSArsteZpG
	 9g/EvgnwdcOgHRse8jAlN5j0YZrt3x1yiPLbjxq4Zkt2ORakaSLb/CY5Mh74Bekwn8
	 t22kRm8mZo7bBhik52x58TczcFyzmzBLH0XI3WSfwwNo5y+IILXKi37YtiQhUsH4zq
	 SJC5CvNbWSBGfNRf/Vh06PQ9nK9bwV8FLwuw3AVNnVmkl03XbRDFdJ7pWlqtRMJVFa
	 I/UhxLmcFSP1g==
Date: Wed, 18 Feb 2026 11:44:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/2] xenbus: add xenbus_device parameter to
 xenbus_read_driver_state()
Message-ID: <20260218174411.GA3434134@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218095205.453657-2-jgross@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 157EE158669
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:52:04AM +0100, Juergen Gross wrote:
> In order to prepare checking the xenbus device status in
> xenbus_read_driver_state(), add the pointer to struct xenbus_device
> as a parameter.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add dev parameter description (kernel test robot)
> ---
>  drivers/net/xen-netfront.c                 | 34 +++++++++++-----------
>  drivers/pci/xen-pcifront.c                 |  8 ++---

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# drivers/pci/xen-pcifront.c

>  drivers/scsi/xen-scsifront.c               |  2 +-
>  drivers/xen/xen-pciback/xenbus.c           | 10 +++----
>  drivers/xen/xenbus/xenbus_client.c         |  4 ++-
>  drivers/xen/xenbus/xenbus_probe.c          |  6 ++--
>  drivers/xen/xenbus/xenbus_probe_frontend.c |  2 +-
>  include/xen/xenbus.h                       |  3 +-
>  8 files changed, 36 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> index 0969d5c9f6b7..2c414b77dd0f 100644
> --- a/drivers/net/xen-netfront.c
> +++ b/drivers/net/xen-netfront.c
> @@ -1646,7 +1646,7 @@ static int xennet_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  
>  	/* avoid the race with XDP headroom adjustment */
>  	wait_event(module_wq,
> -		   xenbus_read_driver_state(np->xbdev->otherend) ==
> +		   xenbus_read_driver_state(np->xbdev, np->xbdev->otherend) ==
>  		   XenbusStateReconfigured);
>  	np->netfront_xdp_enabled = true;
>  
> @@ -1764,9 +1764,9 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
>  	do {
>  		xenbus_switch_state(dev, XenbusStateInitialising);
>  		err = wait_event_timeout(module_wq,
> -				 xenbus_read_driver_state(dev->otherend) !=
> +				 xenbus_read_driver_state(dev, dev->otherend) !=
>  				 XenbusStateClosed &&
> -				 xenbus_read_driver_state(dev->otherend) !=
> +				 xenbus_read_driver_state(dev, dev->otherend) !=
>  				 XenbusStateUnknown, XENNET_TIMEOUT);
>  	} while (!err);
>  
> @@ -2627,31 +2627,31 @@ static void xennet_bus_close(struct xenbus_device *dev)
>  {
>  	int ret;
>  
> -	if (xenbus_read_driver_state(dev->otherend) == XenbusStateClosed)
> +	if (xenbus_read_driver_state(dev, dev->otherend) == XenbusStateClosed)
>  		return;
>  	do {
>  		xenbus_switch_state(dev, XenbusStateClosing);
>  		ret = wait_event_timeout(module_wq,
> -				   xenbus_read_driver_state(dev->otherend) ==
> -				   XenbusStateClosing ||
> -				   xenbus_read_driver_state(dev->otherend) ==
> -				   XenbusStateClosed ||
> -				   xenbus_read_driver_state(dev->otherend) ==
> -				   XenbusStateUnknown,
> -				   XENNET_TIMEOUT);
> +				xenbus_read_driver_state(dev, dev->otherend) ==
> +				XenbusStateClosing ||
> +				xenbus_read_driver_state(dev, dev->otherend) ==
> +				XenbusStateClosed ||
> +				xenbus_read_driver_state(dev, dev->otherend) ==
> +				XenbusStateUnknown,
> +				XENNET_TIMEOUT);
>  	} while (!ret);
>  
> -	if (xenbus_read_driver_state(dev->otherend) == XenbusStateClosed)
> +	if (xenbus_read_driver_state(dev, dev->otherend) == XenbusStateClosed)
>  		return;
>  
>  	do {
>  		xenbus_switch_state(dev, XenbusStateClosed);
>  		ret = wait_event_timeout(module_wq,
> -				   xenbus_read_driver_state(dev->otherend) ==
> -				   XenbusStateClosed ||
> -				   xenbus_read_driver_state(dev->otherend) ==
> -				   XenbusStateUnknown,
> -				   XENNET_TIMEOUT);
> +				xenbus_read_driver_state(dev, dev->otherend) ==
> +				XenbusStateClosed ||
> +				xenbus_read_driver_state(dev, dev->otherend) ==
> +				XenbusStateUnknown,
> +				XENNET_TIMEOUT);
>  	} while (!ret);
>  }
>  
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index 11636634ae51..cd22bf984024 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -856,7 +856,7 @@ static void pcifront_try_connect(struct pcifront_device *pdev)
>  	int err;
>  
>  	/* Only connect once */
> -	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename) !=
>  	    XenbusStateInitialised)
>  		return;
>  
> @@ -876,7 +876,7 @@ static int pcifront_try_disconnect(struct pcifront_device *pdev)
>  	enum xenbus_state prev_state;
>  
>  
> -	prev_state = xenbus_read_driver_state(pdev->xdev->nodename);
> +	prev_state = xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename);
>  
>  	if (prev_state >= XenbusStateClosing)
>  		goto out;
> @@ -895,7 +895,7 @@ static int pcifront_try_disconnect(struct pcifront_device *pdev)
>  
>  static void pcifront_attach_devices(struct pcifront_device *pdev)
>  {
> -	if (xenbus_read_driver_state(pdev->xdev->nodename) ==
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename) ==
>  	    XenbusStateReconfiguring)
>  		pcifront_connect(pdev);
>  }
> @@ -909,7 +909,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
>  	struct pci_dev *pci_dev;
>  	char str[64];
>  
> -	state = xenbus_read_driver_state(pdev->xdev->nodename);
> +	state = xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename);
>  	if (state == XenbusStateInitialised) {
>  		dev_dbg(&pdev->xdev->dev, "Handle skipped connect.\n");
>  		/* We missed Connected and need to initialize. */
> diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
> index 924025305753..ef74d4da5ab0 100644
> --- a/drivers/scsi/xen-scsifront.c
> +++ b/drivers/scsi/xen-scsifront.c
> @@ -1175,7 +1175,7 @@ static void scsifront_backend_changed(struct xenbus_device *dev,
>  			return;
>  		}
>  
> -		if (xenbus_read_driver_state(dev->nodename) ==
> +		if (xenbus_read_driver_state(dev, dev->nodename) ==
>  		    XenbusStateInitialised)
>  			scsifront_do_lun_hotplug(info, VSCSIFRONT_OP_ADD_LUN);
>  
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..4bd1c7a8957e 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -149,12 +149,12 @@ static int xen_pcibk_attach(struct xen_pcibk_device *pdev)
>  
>  	mutex_lock(&pdev->dev_lock);
>  	/* Make sure we only do this setup once */
> -	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename) !=
>  	    XenbusStateInitialised)
>  		goto out;
>  
>  	/* Wait for frontend to state that it has published the configuration */
> -	if (xenbus_read_driver_state(pdev->xdev->otherend) !=
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->otherend) !=
>  	    XenbusStateInitialised)
>  		goto out;
>  
> @@ -374,7 +374,7 @@ static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev,
>  	dev_dbg(&pdev->xdev->dev, "Reconfiguring device ...\n");
>  
>  	mutex_lock(&pdev->dev_lock);
> -	if (xenbus_read_driver_state(pdev->xdev->nodename) != state)
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename) != state)
>  		goto out;
>  
>  	err = xenbus_scanf(XBT_NIL, pdev->xdev->nodename, "num_devs", "%d",
> @@ -572,7 +572,7 @@ static int xen_pcibk_setup_backend(struct xen_pcibk_device *pdev)
>  	/* It's possible we could get the call to setup twice, so make sure
>  	 * we're not already connected.
>  	 */
> -	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
> +	if (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename) !=
>  	    XenbusStateInitWait)
>  		goto out;
>  
> @@ -662,7 +662,7 @@ static void xen_pcibk_be_watch(struct xenbus_watch *watch,
>  	struct xen_pcibk_device *pdev =
>  	    container_of(watch, struct xen_pcibk_device, be_watch);
>  
> -	switch (xenbus_read_driver_state(pdev->xdev->nodename)) {
> +	switch (xenbus_read_driver_state(pdev->xdev, pdev->xdev->nodename)) {
>  	case XenbusStateInitWait:
>  		xen_pcibk_setup_backend(pdev);
>  		break;
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index 2dc874fb5506..e502435145ae 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -931,12 +931,14 @@ static int xenbus_unmap_ring_hvm(struct xenbus_device *dev, void *vaddr)
>  
>  /**
>   * xenbus_read_driver_state - read state from a store path
> + * @dev: xenbus device pointer
>   * @path: path for driver
>   *
>   * Returns: the state of the driver rooted at the given store path, or
>   * XenbusStateUnknown if no state can be read.
>   */
> -enum xenbus_state xenbus_read_driver_state(const char *path)
> +enum xenbus_state xenbus_read_driver_state(const struct xenbus_device *dev,
> +					   const char *path)
>  {
>  	enum xenbus_state result;
>  	int err = xenbus_gather(XBT_NIL, path, "state", "%d", &result, NULL);
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 9f9011cd7447..2eed06ba5d38 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -191,7 +191,7 @@ void xenbus_otherend_changed(struct xenbus_watch *watch,
>  		return;
>  	}
>  
> -	state = xenbus_read_driver_state(dev->otherend);
> +	state = xenbus_read_driver_state(dev, dev->otherend);
>  
>  	dev_dbg(&dev->dev, "state is %d, (%s), %s, %s\n",
>  		state, xenbus_strstate(state), dev->otherend_watch.node, path);
> @@ -364,7 +364,7 @@ void xenbus_dev_remove(struct device *_dev)
>  	 * closed.
>  	 */
>  	if (!drv->allow_rebind ||
> -	    xenbus_read_driver_state(dev->nodename) == XenbusStateClosing)
> +	    xenbus_read_driver_state(dev, dev->nodename) == XenbusStateClosing)
>  		xenbus_switch_state(dev, XenbusStateClosed);
>  }
>  EXPORT_SYMBOL_GPL(xenbus_dev_remove);
> @@ -514,7 +514,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
>  	size_t stringlen;
>  	char *tmpstring;
>  
> -	enum xenbus_state state = xenbus_read_driver_state(nodename);
> +	enum xenbus_state state = xenbus_read_driver_state(NULL, nodename);
>  
>  	if (state != XenbusStateInitialising) {
>  		/* Device is not new, so ignore it.  This can happen if a
> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
> index f04707d1f667..ca04609730df 100644
> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
> @@ -253,7 +253,7 @@ static int print_device_status(struct device *dev, void *data)
>  	} else if (xendev->state < XenbusStateConnected) {
>  		enum xenbus_state rstate = XenbusStateUnknown;
>  		if (xendev->otherend)
> -			rstate = xenbus_read_driver_state(xendev->otherend);
> +			rstate = xenbus_read_driver_state(xendev, xendev->otherend);
>  		pr_warn("Timeout connecting to device: %s (local state %d, remote state %d)\n",
>  			xendev->nodename, xendev->state, rstate);
>  	}
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index c94caf852aea..15319da65b7f 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -228,7 +228,8 @@ int xenbus_unmap_ring_vfree(struct xenbus_device *dev, void *vaddr);
>  int xenbus_alloc_evtchn(struct xenbus_device *dev, evtchn_port_t *port);
>  int xenbus_free_evtchn(struct xenbus_device *dev, evtchn_port_t port);
>  
> -enum xenbus_state xenbus_read_driver_state(const char *path);
> +enum xenbus_state xenbus_read_driver_state(const struct xenbus_device *dev,
> +					   const char *path);
>  
>  __printf(3, 4)
>  void xenbus_dev_error(struct xenbus_device *dev, int err, const char *fmt, ...);
> -- 
> 2.53.0
> 

