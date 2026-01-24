Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bQRoN8xXdGkb4wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 06:25:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A667C8C9
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 06:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212745.1523736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjW8J-0005ox-2x; Sat, 24 Jan 2026 05:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212745.1523736; Sat, 24 Jan 2026 05:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjW8I-0005lt-R4; Sat, 24 Jan 2026 05:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1212745;
 Sat, 24 Jan 2026 05:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=As6Q=75=codewreck.org=asmadeus@srs-se1.protection.inumbo.net>)
 id 1vjW8G-0005lW-L1
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 05:24:25 +0000
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed6efb0f-f8e4-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 06:24:17 +0100 (CET)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 5D39B14C2D6;
 Sat, 24 Jan 2026 06:24:13 +0100 (CET)
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id cd0f7966;
 Sat, 24 Jan 2026 05:24:11 +0000 (UTC)
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
X-Inumbo-ID: ed6efb0f-f8e4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1769232255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1+vFOzs5lBmQ1GdxNYRJvUl5CszH3FRGvya+3o6tDY=;
	b=TSpDBR1hdYlbtwiEo8NvHQDpPR05y1xZ4dalVTYW/AGpyMsLvCCCErKyqpyAdMHiYXYXXa
	cEmVYEnZ0rRc++YgMB/ZZjpfLlFwfGJKzk9dCpKAPjNYyNfy889mX9ekoTN3DPbxk3l4jL
	HHPU1k1OB7XEgQ66EAoRww2duiCaOFklmAXzLZpeb1fP1vOH4xL1Kvvkbc2wZzdvrrqJD0
	Mxui0OKMfYsO1zplb2b+5ekkhacBlQnviCTmO6fbOrUf+gcOJtlvIJM5l9c8nxhGngo3E7
	0uoNwobo1HZldBx0l0uB6gGH3ymmsW85wQGqblzcx2ofrSmU4vlxGP2M42lfuA==
Date: Sat, 24 Jan 2026 14:23:56 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, v9fs@lists.linux.dev,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	sstabellini@kernel.org
Subject: Re: [PATCH] 9p/xen: protect xen_9pfs_front_free against concurrent
 calls
Message-ID: <aXRXbFVmilATqvfO@codewreck.org>
References: <20260123184009.1298536-1-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123184009.1298536-1-stefano.stabellini@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[codewreck.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[codewreck.org:s=2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:v9fs@lists.linux.dev,m:ericvh@kernel.org,m:lucho@ionkov.net,m:linux_oss@crudebyte.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[asmadeus@codewreck.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[codewreck.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmadeus@codewreck.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 79A667C8C9
X-Rspamd-Action: no action

Stefano Stabellini wrote on Fri, Jan 23, 2026 at 10:40:09AM -0800:
> The xenwatch thread can race with other back-end change notifications
> and call xen_9pfs_front_free() twice, hitting the observed general
> protection fault due to a double-free. Guard the teardown path so only
> one caller can release the front-end state at a time, preventing the
> crash.

Thank you, just a couple of nitpicks below

> diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
> index 280f686f60fbb..8809f3c06ec95 100644
> --- a/net/9p/trans_xen.c
> +++ b/net/9p/trans_xen.c
> @@ -274,11 +274,7 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
>  {
>  	int i, j;
>  
> -	write_lock(&xen_9pfs_lock);
> -	list_del(&priv->list);
> -	write_unlock(&xen_9pfs_lock);
> -
> -	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
> +	for (i = 0; priv->rings != NULL && i < XEN_9PFS_NUM_RINGS; i++) {


I don't understand this priv->rings != NULL check here;
if it's guarding for front_free() called before front_init() then it
doesn't need to be checked at every iteration, and if it can change in
another thread I don't see why it would be safe.

>  		struct xen_9pfs_dataring *ring = &priv->rings[i];
>  
>  		cancel_work_sync(&ring->work);
> @@ -310,9 +306,18 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
>  
>  static void xen_9pfs_front_remove(struct xenbus_device *dev)
>  {
> -	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
> +	struct xen_9pfs_front_priv *priv;
>  
> +	write_lock(&xen_9pfs_lock);
> +	priv = dev_get_drvdata(&dev->dev);
> +	if (priv == NULL) {
> +		write_unlock(&xen_9pfs_lock);
> +		return;
> +	}
>  	dev_set_drvdata(&dev->dev, NULL);
> +	list_del_init(&priv->list);

There's nothing wrong with using the del_init() variant here, but it
would imply someone else could still access it after the unlock here,
which means to me they could still access it after priv is freed in
xen_9pfs_front_free().
From your commit message I think the priv == NULL check and
dev_set_drvdata() under lock above is enough, can you confirm?

> +	write_unlock(&xen_9pfs_lock);
> +
>  	xen_9pfs_front_free(priv);
>  }
>  
> @@ -387,7 +392,7 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
>  {
>  	int ret, i;
>  	struct xenbus_transaction xbt;
> -	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
> +	struct xen_9pfs_front_priv *priv;
>  	char *versions, *v;
>  	unsigned int max_rings, max_ring_order, len = 0;
>  
> @@ -415,6 +420,10 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
>  	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
>  		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;
>  
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;
>  	priv->rings = kcalloc(XEN_9PFS_NUM_RINGS, sizeof(*priv->rings),
>  			      GFP_KERNEL);
>  	if (!priv->rings) {
> @@ -473,6 +482,11 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
>  		goto error;
>  	}
>  
> +	write_lock(&xen_9pfs_lock);
> +	dev_set_drvdata(&dev->dev, priv);

Honest question: could xen_9pfs_front_init() also be called multiple
times as well?
(if so this should check for the previous drvdata and free the priv
that was just built if it was non-null)

Please ignore this if you think that can't happen, I really don't
know.


Thanks,
-- 
Dominique Martinet | Asmadeus

