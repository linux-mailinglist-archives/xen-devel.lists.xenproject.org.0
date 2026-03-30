Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGF2G+SAy2kxIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:08:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B31365CA4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268097.1557825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7U8f-0000P4-Uh; Tue, 31 Mar 2026 08:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268097.1557825; Tue, 31 Mar 2026 08:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7U8f-0000Nb-Rl; Tue, 31 Mar 2026 08:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1268097;
 Mon, 30 Mar 2026 20:10:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@shazbot.org>) id 1w7Iws-0008VT-QY
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 20:10:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Iwq-00CWRB-Kk
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 22:10:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@shazbot.org>)
 id 69cad884-2eae-0a2a0a5409dd-0a2a4508e9e4-14
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:10:57 +0200
Received: from [103.168.172.141] (helo=flow-a6-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <alex@shazbot.org>)
 id 69cad8d0-1950-0a2a45080019-67a8ac8d8c99-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:10:57 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 32B1F1380404;
 Mon, 30 Mar 2026 16:10:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 30 Mar 2026 16:10:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Mar 2026 16:10:52 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=shazbot.org header.i="@shazbot.org" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774901456;
	 x=1774908656; bh=l6vFZymkQIpCjGyZZ0waTIjtR5dYu9l/RauB0EHs2cg=; b=
	p3Q7z9HDaMO9l49KzGyd6QCozBDRkYMrNAMT016WX/fHIPodDvJbWxfN7o7Rq7vD
	ssq4dL3KEVXFE49rB8recUd5fVpSerRill0EPB9eG2k4c2akGO+Qp/G8D31RmPbX
	7TlkrNox2UjWyTlfcttMC7E71kdY+trnef5Hm61drgcfUPakTcCNL6kKwNKjRSBV
	U1uiNaG+fKZAZmTv0+H0872Gvi06OSqLLzx0vsDX2qjVrQBFMlsZacR2mbGsDkc/
	gT6xVnpGv8MRHmzJBZo58FBd6w5IU+6ogcmojJLtPY3KydD8fWurT3VIXthGtQVM
	kQSao6bXLTSzYllu1/tldQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774901456; x=
	1774908656; bh=l6vFZymkQIpCjGyZZ0waTIjtR5dYu9l/RauB0EHs2cg=; b=C
	AP30HzcjqUcGAYtq0Vy0npz+WQZ0xoM+V3KrqPMrmRQ5BSmU53GGUiyx5E4wI6yA
	FyTr5/p4paazsu/Iipz8yYZU+1phMDKI7hagtD986FHeu0o1F4zYmBZsEakuW92m
	weI9ASAX8aFEL8Rs0Uec3ctb/HnJ1MgKC92d8MBdvS6OH7G3ewGRc0+tfGddZ4Gk
	WxhrjWBcLoGs93zMy/odTXwHEJHh5W5FS+Et9LrpEfOcBRgJ0bBAStrIpl6DkWE0
	Q7ETKFm9iu5onjWSvKFXn0ELTMMUBd/OPVAOOtwXaNWNshQ6cuB1Amc/2nwRZfpT
	eHg87urYI5Ec6Lkq0sXvA==
X-ME-Sender: <xms:z9jKafG3C1ppH9T_m6ALHXE4Xg8LRK7hBmf8rBxsDTwjV0YmtGN7zQ>
    <xme:z9jKafRfVIq8DMXZsvpeUjwD446zuGALRlY6oTA_zptsdyXkE-2d-NbNcA082cKf0
    ss8FY21mgRpxHw-PTPA5PC2K5vCU9145ou0r7AQwqll0ampOmU>
X-ME-Received: <xmr:z9jKaX5EMTRV_NaboCc_h79atFYxCsQIiTsRvvS3id2SmTFWS4FBTgmuiO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpeetlhgvgicu
    hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheejieetffefueeiteejtdejffdvleelvdeuvdffvdefteeghfevkeeu
    vdefvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhg
    pdhnsggprhgtphhtthhopeehuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepug
    grkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjghhgseiiihgvphgvrdgtrgdp
    rhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoh
    epghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    rhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehiohgrnhgrrdgtihhorh
    hnvghisehngihprdgtohhmpdhrtghpthhtohepnhhiphhunhdrghhuphhtrgesrghmugdr
    tghomhdprhgtphhtthhopehnihhkhhhilhdrrghgrghrfigrlhesrghmugdrtghomhdprh
    gtphhtthhopehkhihssehmihgtrhhoshhofhhtrdgtohhm
X-ME-Proxy: <xmx:z9jKaXPahdSu6NAxzDLCWHFq0SjTPnbaOV6q1JEVDN1n0TGZgvSOLg>
    <xmx:z9jKaYs_pZi1AKnrgY4kd6IlWW19DwfnZAklgCAjMJf5o-edI-wG2g>
    <xmx:z9jKaebkSHmk2-FfV3M99S1E_Kbm3scLKfLmyO_zzcLIBxoGL3vJxQ>
    <xmx:z9jKacg_NAD9M03CgHB8mak7EEebVzjqapJHxaBa4zGAHu1ISFIb7w>
    <xmx:0NjKafrBqSu7i3ficH69WDNrAzczvh4pW1jhPhZmK7WHcIBXnovlo-fr>
Feedback-ID: i03f14258:Fastmail
Date: Mon, 30 Mar 2026 14:10:50 -0600
From: Alex Williamson <alex@shazbot.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Jason Gunthorpe" <jgg@ziepe.ca>, "Russell King" <linux@armlinux.org.uk>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>,
 "Nipun Gupta" <nipun.gupta@amd.com>,
 "Nikhil Agarwal" <nikhil.agarwal@amd.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, "Long Li" <longli@microsoft.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Vineeth Vijayan" <vneethv@linux.ibm.com>,
 "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Mark Brown" <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason Wang" <jasowang@redhat.com>,
 "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>,
 Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-hyperv@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <virtualization@lists.linux.dev>, <kvm@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>,
 "Gui-Dong Han" <hanguidong02@gmail.com>, alex@shazbot.org
Subject: Re: [PATCH 05/12] PCI: use generic driver_override infrastructure
Message-ID: <20260330141050.2cb47bd9@shazbot.org>
In-Reply-To: <DHGATG6LJOM1.2AI7BYQ2O4DFU@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
	<20260324005919.2408620-6-dakr@kernel.org>
	<DHGATG6LJOM1.2AI7BYQ2O4DFU@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774901457-F2CEA726-643CC462/0/0
X-purgate-type: clean
X-purgate-size: 2764
X-Spamd-Result: default: False [-0.38 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[shazbot.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:jgg@ziepe.ca,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vge
 r.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,m:alex@shazbot.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ziepe.ca,armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com,shazbot.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alex@shazbot.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.801];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: D2B31365CA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 19:38:41 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> (Cc: Jason)
> 
> On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index d43745fe4c84..460852f79f29 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1987,9 +1987,8 @@ static int vfio_pci_bus_notifier(struct notifier_block *nb,
> >  	    pdev->is_virtfn && physfn == vdev->pdev) {
> >  		pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_override\n",
> >  			 pci_name(pdev));
> > -		pdev->driver_override = kasprintf(GFP_KERNEL, "%s",
> > -						  vdev->vdev.ops->name);
> > -		WARN_ON(!pdev->driver_override);
> > +		WARN_ON(device_set_driver_override(&pdev->dev,
> > +						   vdev->vdev.ops->name));  
> 
> Technically, this is a change in behavior. If vdev->vdev.ops->name is NULL, it
> will trigger the WARN_ON(), whereas before it would have just written "(null)"
> into driver_override.

It's worse than that.  Looking at the implementation in [1], we have:

+static inline int device_set_driver_override(struct device *dev, const char *s)
+{
+	return __device_set_driver_override(dev, s, strlen(s));
+}

So if name is NULL, we oops in strlen() before we even hit the -EINVAL
and WARN_ON().

I don't believe we have any vfio-pci variant drivers where the name is
NULL, but kasprintf() handling NULL as "(null)" was a consideration in
this design, that even if there is no name the device is sequestered
with a driver_override that won't match an actual driver.

> I assume that vfio_pci_core drivers are expected to set the name in struct
> vfio_device_ops in the first place and this code (silently) relies on this
> invariant?

We do expect that, but it was previously safe either way to make sure
VFs are only bound to the same ops driver or barring that, at least
don't perform a standard driver match.  The last thing we want to
happen automatically is for a user owned PF to create SR-IOV VFs that
automatically bind to native kernel drivers.
 
> Alex, Jason: Should we keep this hunk above as is and check for a proper name in
> struct vfio_device_ops in vfio_pci_core_register_device() with a subsequent
> patch?

Given the oops, my preference would be to roll it in here.  This change
is what makes it a requirement that name cannot be NULL, where this was
safely handled with kasprintf().  Thanks,

Alex


[1] https://lore.kernel.org/all/20260302002729.19438-2-dakr@kernel.org/

> 
> >  	} else if (action == BUS_NOTIFY_BOUND_DRIVER &&
> >  		   pdev->is_virtfn && physfn == vdev->pdev) {
> >  		struct pci_driver *drv = pci_dev_driver(pdev);  


