Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KPFNTzmd2k9mQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 23:10:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCC8DDB1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 23:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214040.1524466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkUli-0002w1-0x; Mon, 26 Jan 2026 22:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214040.1524466; Mon, 26 Jan 2026 22:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkUlh-0002uZ-UN; Mon, 26 Jan 2026 22:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1214040;
 Mon, 26 Jan 2026 22:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dWRf=77=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vkUlg-0002uT-PF
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 22:09:08 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09832de-fb03-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 23:09:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6CEA60051;
 Mon, 26 Jan 2026 22:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D07C116C6;
 Mon, 26 Jan 2026 22:09:02 +0000 (UTC)
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
X-Inumbo-ID: a09832de-fb03-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465343;
	bh=M8eWJRSt8kxftDMfHh6ZPyDaoVE69N/C4MO0jYVgopM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t4HsPeqDeyxLusfZPoBEb+vG4PzaNoTAJiqnOD37aSTSoGrshePsHrECZ7/x6pXNr
	 i/X2IEXL6snUPT27NlyLbrcQ93twU0cIucZlvkJjE5EroOFsEpsm9qgVNEqhPNOyr1
	 +OBfM0Lz5WFtEZAdyq54uWmCLKyjU7aNb5qFEMcMI3pw4C3YJEAfd56TCFOSta8+SI
	 wUAAPOgvoVgAWiSz/FFCHaG8IO4JoUzhjEHBEH4PxKVkzOkPj4/ZKyuFyHL/P6GZFo
	 ozjb8PwY+K8vei1z0tQcPj6b1CsP7hesjnft/83USwIBfeN8YvH0N2y8Pb561N1FQX
	 k4fgaTQzBsspw==
Date: Mon, 26 Jan 2026 14:09:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dominique Martinet <asmadeus@codewreck.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, v9fs@lists.linux.dev, 
    Eric Van Hensbergen <ericvh@kernel.org>, 
    Latchesar Ionkov <lucho@ionkov.net>, 
    Christian Schoenebeck <linux_oss@crudebyte.com>, sstabellini@kernel.org
Subject: Re: [PATCH] 9p/xen: protect xen_9pfs_front_free against concurrent
 calls
In-Reply-To: <aXRXbFVmilATqvfO@codewreck.org>
Message-ID: <alpine.DEB.2.22.394.2601261354410.7192@ubuntu-linux-20-04-desktop>
References: <20260123184009.1298536-1-stefano.stabellini@amd.com> <aXRXbFVmilATqvfO@codewreck.org>
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
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:asmadeus@codewreck.org,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:v9fs@lists.linux.dev,m:ericvh@kernel.org,m:lucho@ionkov.net,m:linux_oss@crudebyte.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 65FCC8DDB1
X-Rspamd-Action: no action

On Sat, 24 Jan 2026, Dominique Martinet wrote:
> Stefano Stabellini wrote on Fri, Jan 23, 2026 at 10:40:09AM -0800:
> > The xenwatch thread can race with other back-end change notifications
> > and call xen_9pfs_front_free() twice, hitting the observed general
> > protection fault due to a double-free. Guard the teardown path so only
> > one caller can release the front-end state at a time, preventing the
> > crash.
> 
> Thank you, just a couple of nitpicks below
> 
> > diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> > index 280f686f60fbb..8809f3c06ec95 100644
> > --- a/net/9p/trans_xen.c
> > +++ b/net/9p/trans_xen.c
> > @@ -274,11 +274,7 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
> >  {
> >  	int i, j;
> >  
> > -	write_lock(&xen_9pfs_lock);
> > -	list_del(&priv->list);
> > -	write_unlock(&xen_9pfs_lock);
> > -
> > -	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
> > +	for (i = 0; priv->rings != NULL && i < XEN_9PFS_NUM_RINGS; i++) {
> 
> 
> I don't understand this priv->rings != NULL check here;
> if it's guarding for front_free() called before front_init() then it
> doesn't need to be checked at every iteration, and if it can change in
> another thread I don't see why it would be safe.

xen_9pfs_front_free() can be reached from the error paths before any
rings are allocated, so we need to handle a NULL priv->rings but it
doesn't have to be checked at every iteration. I can move it before the
for loop as you suggested.


> 
> >  		struct xen_9pfs_dataring *ring = &priv->rings[i];
> >  
> >  		cancel_work_sync(&ring->work);
> > @@ -310,9 +306,18 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
> >  
> >  static void xen_9pfs_front_remove(struct xenbus_device *dev)
> >  {
> > -	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
> > +	struct xen_9pfs_front_priv *priv;
> >  
> > +	write_lock(&xen_9pfs_lock);
> > +	priv = dev_get_drvdata(&dev->dev);
> > +	if (priv == NULL) {
> > +		write_unlock(&xen_9pfs_lock);
> > +		return;
> > +	}
> >  	dev_set_drvdata(&dev->dev, NULL);
> > +	list_del_init(&priv->list);
> 
> There's nothing wrong with using the del_init() variant here, but it
> would imply someone else could still access it after the unlock here,
> which means to me they could still access it after priv is freed in
> xen_9pfs_front_free().
> >From your commit message I think the priv == NULL check and
> dev_set_drvdata() under lock above is enough, can you confirm?

Yes you are right. I can replace list_del_init with list_del if you
think it is clearer.

 
> > +	write_unlock(&xen_9pfs_lock);
> > +
> >  	xen_9pfs_front_free(priv);
> >  }
> >  
> > @@ -387,7 +392,7 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
> >  {
> >  	int ret, i;
> >  	struct xenbus_transaction xbt;
> > -	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
> > +	struct xen_9pfs_front_priv *priv;
> >  	char *versions, *v;
> >  	unsigned int max_rings, max_ring_order, len = 0;
> >  
> > @@ -415,6 +420,10 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
> >  	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
> >  		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;
> >  
> > +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +	priv->dev = dev;
> >  	priv->rings = kcalloc(XEN_9PFS_NUM_RINGS, sizeof(*priv->rings),
> >  			      GFP_KERNEL);
> >  	if (!priv->rings) {
> > @@ -473,6 +482,11 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
> >  		goto error;
> >  	}
> >  
> > +	write_lock(&xen_9pfs_lock);
> > +	dev_set_drvdata(&dev->dev, priv);
> 
> Honest question: could xen_9pfs_front_init() also be called multiple
> times as well?
> (if so this should check for the previous drvdata and free the priv
> that was just built if it was non-null)
> 
> Please ignore this if you think that can't happen, I really don't
> know.

That should not be possible before freeing priv first:
xen_9pfs_front_init is only called when the frontend is in the
XenbusStateInitialising state (see xen_9pfs_front_changed). Once we
store priv we immediately switch the state to XenbusStateInitialised,
and there will be no more calls to xen_9pfs_front_init. If the backend
forces a re-probe, xenbus invokes xen_9pfs_front_remove first, which
frees priv.

