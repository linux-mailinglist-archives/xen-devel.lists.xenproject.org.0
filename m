Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7763FBB8E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 20:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175227.319299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKlnp-0003Nk-Dr; Mon, 30 Aug 2021 18:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175227.319299; Mon, 30 Aug 2021 18:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKlnp-0003LZ-9u; Mon, 30 Aug 2021 18:14:37 +0000
Received: by outflank-mailman (input) for mailman id 175227;
 Mon, 30 Aug 2021 18:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ySg/=NV=gmail.com=lonyelon@srs-us1.protection.inumbo.net>)
 id 1mKlnn-0003LT-BY
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 18:14:35 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c29705a-174a-4cc5-956d-0a7913e4925b;
 Mon, 30 Aug 2021 18:14:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r7so6957875edd.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 11:14:33 -0700 (PDT)
Received: from localhost (host-79-37-188-60.retail.telecomitalia.it.
 [79.37.188.60])
 by smtp.gmail.com with ESMTPSA id i6sm6987518ejr.68.2021.08.30.11.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 11:14:32 -0700 (PDT)
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
X-Inumbo-ID: 1c29705a-174a-4cc5-956d-0a7913e4925b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0j4HbXVAukqCvkqeiElajeZaQqhOfru+oix0tV+lQrI=;
        b=QVUhEAZZ9HU15JpJ9CRyLHMIFOZ1jMD+Io0SA44k9zuJteTpy6xjFzlUQZVkkcSkAV
         8THSnA5pErW9mh5pJyM+NbnYl7Pw651j82Rv9+L74mEpHDw71DdAC/F+7u9mhJOrEAVp
         NajR+KTLYwgtN7wVhlmT8ko8uVqjccOkx8ogYtd9m7TZ809y5yL0WesSsInyR/yAeK28
         eFRizHIseQzk1IK58Vs/HoFFHx2poJxRlKEsEqdJ+jKqtlRr8DK+2Oj+3H+0OX4mePK4
         OB98P/mpsDnjicliInySQwE++/oZtWD2CEUUEBNwurI4C5HEa27VWGOOCPKWnWRtwBK4
         4LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0j4HbXVAukqCvkqeiElajeZaQqhOfru+oix0tV+lQrI=;
        b=OCDmC9q/7Gk63XW+r1KNBAt78CoRyAq13kjK3bFB6RS/TiW2Y3WFbJVM1e1/O82Be8
         pY7T2gcvDbZWZ92IrHrSZzRTKkoyVozrsfGpiCdp/ZrDuqyergQyVAcALmdQhbveYDDN
         Fqvrblvhgqr9CiOyYk0FRVXkoi/DV/9b0/qUmAPqt/xx/m15CXOBylW0oQiCw/aKK4xS
         5utDawfRUKf7hb4Mag74EQATQDDieAK3Ge2GJUOTyLEcbHOvilMF+R2JlnhJHbwqqwdW
         ZT0fHxSkMUvHP0mMLLHzxFvPAy/2S6HJVVw3+qZFRNmA6xI5VMzumLsxIxG0rj+3NRVx
         DmEg==
X-Gm-Message-State: AOAM5311BwpQJXxh5RS2sBMtkKTPvVEwj5MOsyPVyC+juUm+A1DyVzMr
	VN3AN7hFjCiDYOUYnILz1J0=
X-Google-Smtp-Source: ABdhPJw4A9PXJGNP++AeWzylFWjXO6a0PeDAh3ff0+0VYFa/9G5+yu5ZZ7PL5Fqs++aDAAtRkCC1sQ==
X-Received: by 2002:a05:6402:5108:: with SMTP id m8mr25755510edd.367.1630347272917;
        Mon, 30 Aug 2021 11:14:32 -0700 (PDT)
Date: Mon, 30 Aug 2021 22:14:26 +0200
From: Sergio =?utf-8?Q?Migu=C3=A9ns?= Iglesias <lonyelon@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, bhelgaas@google.com,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio =?utf-8?Q?Migu=C3=A9ns?= Iglesias <sergio@lony.xyz>
Subject: Re: [PATCH v2] xen/pcifront: Removed unnecessary __ref annotation
Message-ID: <20210830201426.g2vaxh6chqnprual@archlap>
References: <20210830175305.13370-1-sergio@lony.xyz>
 <20210830162922.GA4188989@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210830162922.GA4188989@bjorn-Precision-5520>

Thanks again for you answers!
I am lerning a lot from your replys and I really appreciate it. Should I
make a v3 patch and split that one into 2 different patches or would it
be confusing?

I don't want to take more of your time with poor patches so I don't know
if I should resend this one.

Thanks again,
Sergio M. Iglesias.

On 21/08/30 11:29, Bjorn Helgaas wrote:
> On Mon, Aug 30, 2021 at 07:53:05PM +0200, Sergio Miguéns Iglesias wrote:
> > An unnecessary "__ref" annotation was removed from the
> > "drivers/pci/xen_pcifront.c" file. The function where the annotation
> > was used was "pcifront_backend_changed()", which does not call any
> > functions annotated as "__*init" nor "__*exit". This makes "__ref"
> > unnecessary since this annotation is used to make the compiler ignore
> > section miss-matches when they are not happening here in the first
> > place.
> > 
> > In addition to the aforementioned change, some code style issues were
> > fixed in the same file.
> 
> One of the Xen folks may apply this, and they may not be as nit-picky
> as I am :)
> 
> If I were to apply this, I would suggest:
> 
>   - Write subject line and commit message in imperative mood.  This is
>     a really good guide to this and other commit message this:
>     https://chris.beams.io/posts/git-commit/
> 
>     For example, in the subject, say "Remove" (not "Removed").  Same
>     in the body.  In the body, I would mention the function but not
>     the filename since that's obvious from the diff.
> 
>   - Split the __ref change into a separate patch from the style
>     changes.  The __ref removal should come first and be the absolute
>     minimal patch.  That makes it much easier to review, backport, and
>     revert if necessary.  And, if the maintainer isn't wild about
>     style patches, it's trivial to just ignore that patch.
> 
>     Commit logs that say "Also, ..." or "In addition, ..." are always
>     red flags to me because they usually indicate the patch could be
>     split into two or more simpler patches.
> 
>   - When reviewing changes like this, I assume __ref was added in the
>     first place for some good reason, so I want to know why, and I
>     want to know when that reason changed.  So I would look for the
>     commit that *introduced* __ref and for the commit that removed the
>     need for it.  It would save me time if the log said something
>     like:
> 
>       956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.") added
>       __initrefok because pcifront_backend_changed() called
>       pcifront_try_connect() and pcifront_attach_devices(), which were
>       both __devinit.
> 
>       The __devinit annotations were removed by 15856ad50bf5 ("PCI:
>       Remove __dev* markings"), which made __initrefok unnecessary.
> 
>       Finally, bd721ea73e1f ("treewide: replace obsolete _refok by
>       __ref") replaced __initrefok with __ref.
> 
>     That might be too much for a commit log, but it shows that you've
>     done your homework and makes it easier to review (and helps people
>     make similar fixes elsewhere).  If it *is* too much, it's trivial
>     for a maintainer to cut it out.
> 
> More notes about my idiosyncracies:
> https://lore.kernel.org/r/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com
> 
> > Signed-off-by: Sergio Miguéns Iglesias <sergio@lony.xyz>
> > ---
> >  drivers/pci/xen-pcifront.c | 30 +++++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> > index b7a8f3a1921f..427041c1e408 100644
> > --- a/drivers/pci/xen-pcifront.c
> > +++ b/drivers/pci/xen-pcifront.c
> > @@ -115,7 +115,7 @@ static int do_pci_op(struct pcifront_device *pdev, struct xen_pci_op *op)
> >  	struct xen_pci_op *active_op = &pdev->sh_info->op;
> >  	unsigned long irq_flags;
> >  	evtchn_port_t port = pdev->evtchn;
> > -	unsigned irq = pdev->irq;
> > +	unsigned int irq = pdev->irq;
> >  	s64 ns, ns_timeout;
> >  
> >  	spin_lock_irqsave(&pdev->sh_info_lock, irq_flags);
> > @@ -153,10 +153,10 @@ static int do_pci_op(struct pcifront_device *pdev, struct xen_pci_op *op)
> >  	}
> >  
> >  	/*
> > -	* We might lose backend service request since we
> > -	* reuse same evtchn with pci_conf backend response. So re-schedule
> > -	* aer pcifront service.
> > -	*/
> > +	 * We might lose backend service request since we
> > +	 * reuse same evtchn with pci_conf backend response. So re-schedule
> > +	 * aer pcifront service.
> > +	 */
> >  	if (test_bit(_XEN_PCIB_active,
> >  			(unsigned long *)&pdev->sh_info->flags)) {
> >  		dev_err(&pdev->xdev->dev,
> > @@ -414,7 +414,8 @@ static int pcifront_scan_bus(struct pcifront_device *pdev,
> >  	struct pci_dev *d;
> >  	unsigned int devfn;
> >  
> > -	/* Scan the bus for functions and add.
> > +	/*
> > +	 * Scan the bus for functions and add.
> >  	 * We omit handling of PCI bridge attachment because pciback prevents
> >  	 * bridges from being exported.
> >  	 */
> > @@ -492,8 +493,10 @@ static int pcifront_scan_root(struct pcifront_device *pdev,
> >  
> >  	list_add(&bus_entry->list, &pdev->root_buses);
> >  
> > -	/* pci_scan_root_bus skips devices which do not have a
> > -	* devfn==0. The pcifront_scan_bus enumerates all devfn. */
> > +	/*
> > +	 * pci_scan_root_bus skips devices which do not have a
> > +	 * devfn==0. The pcifront_scan_bus enumerates all devfn.
> > +	 */
> >  	err = pcifront_scan_bus(pdev, domain, bus, b);
> >  
> >  	/* Claim resources before going "live" with our devices */
> > @@ -651,8 +654,10 @@ static void pcifront_do_aer(struct work_struct *data)
> >  	pci_channel_state_t state =
> >  		(pci_channel_state_t)pdev->sh_info->aer_op.err;
> >  
> > -	/*If a pci_conf op is in progress,
> > -		we have to wait until it is done before service aer op*/
> > +	/*
> > +	 * If a pci_conf op is in progress, we have to wait until it is done
> > +	 * before service aer op
> > +	 */
> >  	dev_dbg(&pdev->xdev->dev,
> >  		"pcifront service aer bus %x devfn %x\n",
> >  		pdev->sh_info->aer_op.bus, pdev->sh_info->aer_op.devfn);
> > @@ -676,6 +681,7 @@ static void pcifront_do_aer(struct work_struct *data)
> >  static irqreturn_t pcifront_handler_aer(int irq, void *dev)
> >  {
> >  	struct pcifront_device *pdev = dev;
> > +
> >  	schedule_pcifront_aer_op(pdev);
> >  	return IRQ_HANDLED;
> >  }
> > @@ -1027,6 +1033,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
> >  	/* Find devices being detached and remove them. */
> >  	for (i = 0; i < num_devs; i++) {
> >  		int l, state;
> > +
> >  		l = snprintf(str, sizeof(str), "state-%d", i);
> >  		if (unlikely(l >= (sizeof(str) - 1))) {
> >  			err = -ENOMEM;
> > @@ -1078,7 +1085,7 @@ static int pcifront_detach_devices(struct pcifront_device *pdev)
> >  	return err;
> >  }
> >  
> > -static void __ref pcifront_backend_changed(struct xenbus_device *xdev,
> > +static void pcifront_backend_changed(struct xenbus_device *xdev,
> >  						  enum xenbus_state be_state)
> >  {
> >  	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
> > @@ -1137,6 +1144,7 @@ static int pcifront_xenbus_probe(struct xenbus_device *xdev,
> >  static int pcifront_xenbus_remove(struct xenbus_device *xdev)
> >  {
> >  	struct pcifront_device *pdev = dev_get_drvdata(&xdev->dev);
> > +
> >  	if (pdev)
> >  		free_pdev(pdev);
> >  
> > -- 
> > 2.33.0
> > 

