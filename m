Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B07101C4
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 01:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539251.839939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1y69-0000C3-VX; Wed, 24 May 2023 23:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539251.839939; Wed, 24 May 2023 23:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1y69-00009W-Qb; Wed, 24 May 2023 23:40:53 +0000
Received: by outflank-mailman (input) for mailman id 539251;
 Wed, 24 May 2023 23:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEuA=BN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1y68-00009Q-2Y
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 23:40:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f3e674-fa8c-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 01:40:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7999561BAC;
 Wed, 24 May 2023 23:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433F3C433EF;
 Wed, 24 May 2023 23:40:48 +0000 (UTC)
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
X-Inumbo-ID: 69f3e674-fa8c-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684971648;
	bh=mustg59kTrFir/r1vrmDKAg/EoZXV6B6Ri2bio/sLdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uTAn9aQ+GK5oDtzW3Xv4QcbIPbxkAePP6lxgDEZVhqYLo+Pb7LlbpJIYRiYobUbtB
	 xACnHRQrzGnrn7iNcI6FvvOl3uWZkshB4iJsOvyiTFeTyu71ytuDxl7U5p4iouW24l
	 Zp17OKbziVmtd13nwE3lkscTrlpiUVHBUrwrjfOZhu/Pot2XkAHeiPVM5vS2I/B5Rz
	 77uY45xvXwPySDQ7fdTuodCZCGrcYVCVBBLk/FO+wwQMrykYkZjlH7djcWQG3fRu39
	 G7oZPESoBNSPjAQ+A8k8buhzwlXIAdkpbD78jaesyg7J3006ZUtiP4c/re9Wt/3Oqv
	 MQbPpYgNvFBXQ==
Date: Wed, 24 May 2023 16:40:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
In-Reply-To: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
Message-ID: <alpine.DEB.2.22.394.2305241639150.44000@ubuntu-linux-20-04-desktop>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 May 2023, Jan Beulich wrote:
> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> console) are associated with DomXEN, not Dom0. This means that while
> looking for overlapping BARs such devices cannot be found on Dom0's list
> of devices; DomXEN's list also needs to be scanned.
> 
> Suppress vPCI init altogether for r/o devices (which constitute a subset
> of hidden ones).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This works! Ship it! :-)
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4346896950

I understand this is an RFC and there are still open questions, but
thank you for addressing the issue quickly.



> ---
> RFC: The modify_bars() change is intentionally mis-formatted, as the
>      necessary re-indentation would make the diff difficult to read. At
>      this point I'd merely like to gather input towards possible better
>      approaches to solve the issue (not the least because quite possibly
>      there are further places needing changing).
> 
> RFC: Whether to actually suppress vPCI init is up for debate; adding the
>      extra logic is following Roger's suggestion (I'm not convinced it is
>      useful to have). If we want to keep that, a 2nd question would be
>      whether to keep it in vpci_add_handlers(): Both of its callers (can)
>      have a struct pci_seg readily available, so checking ->ro_map at the
>      call sites would be easier.
> 
> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>      modify_bars() to consistently respect BARs of hidden devices while
>      setting up "normal" ones (i.e. to avoid as much as possible the
>      "continue" path introduced here), setting up of the former may want
>      doing first.
> 
> RFC: vpci_write()'s check of the r/o map may want moving out of mainline
>      code, into the case dealing with !pdev->vpci.
> ---
> v2: Extend existing comment. Relax assertion. Don't initialize vPCI for
>     r/o devices.
> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>  
>      /*
>       * Check for overlaps with other BARs. Note that only BARs that are
> -     * currently mapped (enabled) are checked for overlaps.
> +     * currently mapped (enabled) are checked for overlaps. Note also that
> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>       */
> -    for_each_pdev ( pdev->domain, tmp )
> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> +    for_each_pdev ( d, tmp )
>      {
>          if ( tmp == pdev )
>          {
> @@ -304,6 +307,7 @@ static int modify_bars(const struct pci_
>                   */
>                  continue;
>          }
> +if ( !tmp->vpci ) { ASSERT(d == dom_xen); continue; }//todo
>  
>          for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>          {
> @@ -330,6 +334,7 @@ static int modify_bars(const struct pci_
>              }
>          }
>      }
> +if ( !is_hardware_domain(d) ) break; }//todo
>  
>      ASSERT(dev);
>  
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -70,6 +70,7 @@ void vpci_remove_device(struct pci_dev *
>  int vpci_add_handlers(struct pci_dev *pdev)
>  {
>      unsigned int i;
> +    const unsigned long *ro_map;
>      int rc = 0;
>  
>      if ( !has_vpci(pdev->domain) )
> @@ -78,6 +79,11 @@ int vpci_add_handlers(struct pci_dev *pd
>      /* We should not get here twice for the same device. */
>      ASSERT(!pdev->vpci);
>  
> +    /* No vPCI for r/o devices. */
> +    ro_map = pci_get_ro_map(pdev->sbdf.seg);
> +    if ( ro_map && test_bit(pdev->sbdf.bdf, ro_map) )
> +        return 0;
> +
>      pdev->vpci = xzalloc(struct vpci);
>      if ( !pdev->vpci )
>          return -ENOMEM;
> 

