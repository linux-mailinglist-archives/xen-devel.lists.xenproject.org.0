Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D84763BD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 21:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247573.426905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxbEt-0000b6-Fi; Wed, 15 Dec 2021 20:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247573.426905; Wed, 15 Dec 2021 20:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxbEt-0000YG-Bw; Wed, 15 Dec 2021 20:51:03 +0000
Received: by outflank-mailman (input) for mailman id 247573;
 Wed, 15 Dec 2021 20:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjzN=RA=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxbEs-0000Y6-0Z
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 20:51:02 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b10ffa-5de8-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 21:51:00 +0100 (CET)
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
X-Inumbo-ID: b5b10ffa-5de8-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639601459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=77DCNiXl9B9x9ao8a3ckFicR+A7/8jsezE822YCoYkI=;
	b=0MC08SjOyHUSb632XivZnR6xp+J+lhdSt8dO4cVV21Usd+LFkCWMDMI5c2zqdprtPX8VcT
	Z63tf+3EiGKcUHte1/483d4Z/hf6cKDNCZfSHwK0n7HeyH7/U5ccqzZJxTdJSRVkjhfdtR
	IiH4xihB3g4E9MBjV2NktVFtgbdOo75IOpoHPIb3/7VdumCnWORcJgrzfHtGplNM5fxLCo
	lWD8Oek/DpAbTtzS5eZ0f2xj6cql1OA57lGXY/RPOvZpVY8gxierMi9GKVnemFayVy076Y
	M6+9Lfqa20tO87mNob/FrOG2y8clrn6urg7hwKRz/nQ9j3qTabd4wVqNL/bu2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639601459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=77DCNiXl9B9x9ao8a3ckFicR+A7/8jsezE822YCoYkI=;
	b=SDPAxqej8tM3beNMTA3MRfQgMQzvFbRgGCzPLoilB6fEB/QgGtIDQRto0CY8QP/ghtYPeu
	cjbHVwPoa9R9VUCQ==
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens
 <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Logan
 Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Nishanth Menon <nm@ti.com>
Subject: Re: [patch V2 21/31] soc: ti: ti_sci_inta_msi: Rework MSI
 descriptor allocation
In-Reply-To: <20211206210748.737904583@linutronix.de>
References: <20211206210600.123171746@linutronix.de>
 <20211206210748.737904583@linutronix.de>
Date: Wed, 15 Dec 2021 21:50:58 +0100
Message-ID: <87a6h1r3rh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Dec 06 2021 at 23:51, Thomas Gleixner wrote:
>
> No functional change intended.

Famous last words.

>  static int ti_sci_inta_msi_alloc_descs(struct device *dev,
>  				       struct ti_sci_resource *res)
>  {
> -	struct msi_desc *msi_desc;
> +	struct msi_desc msi_desc;
>  	int set, i, count = 0;
>  
> +	memset(&msi_desc, 0, sizeof(msi_desc));

This fails to initialize msi_desc.nvec_used which makes the subsequent
interrupt allocation fail. Delta fix below.

Thanks,

        tglx
---
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -68,6 +68,7 @@ static int ti_sci_inta_msi_alloc_descs(s
 	int set, i, count = 0;
 
 	memset(&msi_desc, 0, sizeof(msi_desc));
+	msi_desc.nvec_used = 1;
 
 	for (set = 0; set < res->sets; set++) {
 		for (i = 0; i < res->desc[set].num; i++, count++) {

