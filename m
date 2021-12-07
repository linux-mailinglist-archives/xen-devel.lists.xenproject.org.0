Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A55446C534
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 21:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241830.418357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhWO-0006E9-Hw; Tue, 07 Dec 2021 20:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241830.418357; Tue, 07 Dec 2021 20:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhWO-0006CD-Eg; Tue, 07 Dec 2021 20:57:08 +0000
Received: by outflank-mailman (input) for mailman id 241830;
 Tue, 07 Dec 2021 20:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhWM-0004h1-Ig
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:57:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9919a8-57a0-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 21:57:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDE53B81E82;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DACC341C1;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
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
X-Inumbo-ID: 3b9919a8-57a0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910624;
	bh=XrslgRHtCWkizJFdxh4LYx0Ea6YIT+zkeRKUg8jgH50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oNWOya01lPJvnE3tH25W+i5fvBukvCWqbSt8o6DALtpqSoHuRmTol41FHNBbcEmwf
	 ndqs+TUJ09ke7BxWb8HjaLc/fY3tO470dZ4Qyno4Wpq5/bEnoEjzOjsbXmUV1qPZIo
	 hVQXatTYM8u7grl3xYsaQbLBxtsdENIZvu9pTIxNja33qod3Ecev9Ir5ev8d5C96pY
	 0IK/7dJ9j/4mbDBL0nO4T+nU7isZp4iut/H/gQt557Of3NPt7vq7/9Jpi+jESYyg4O
	 IkM/M8qlqvOoGLJfagsdSI/guqcNiYtMrzlfaFPpkvCs0s96NJKjtT7Cv9aAODCAWZ
	 Q3dkMDUriYcZA==
Date: Tue, 7 Dec 2021 14:57:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 13/23] PCI/MSI: Cleanup include zoo
Message-ID: <20211207205703.GA76805@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.539281124@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:44PM +0100, Thomas Gleixner wrote:
> Get rid of the pile of unneeded includes which accumulated over time.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nice, thanks!

> ---
> V2: Address build fail on powerpc - Cedric
> ---
>  drivers/pci/msi.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -7,22 +7,14 @@
>   * Copyright (C) 2016 Christoph Hellwig.
>   */
>  
> +#include <linux/acpi_iort.h>
>  #include <linux/err.h>
> -#include <linux/mm.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
>  #include <linux/export.h>
> -#include <linux/ioport.h>
> -#include <linux/pci.h>
> -#include <linux/proc_fs.h>
> -#include <linux/msi.h>
> -#include <linux/smp.h>
> -#include <linux/errno.h>
> -#include <linux/io.h>
> -#include <linux/acpi_iort.h>
> -#include <linux/slab.h>
> +#include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/msi.h>
>  #include <linux/of_irq.h>
> +#include <linux/pci.h>
>  
>  #include "pci.h"
>  
> 

