Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2D70CDC1
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 00:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538122.837903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Dta-0006kJ-Qm; Mon, 22 May 2023 22:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538122.837903; Mon, 22 May 2023 22:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Dta-0006hu-Nu; Mon, 22 May 2023 22:20:50 +0000
Received: by outflank-mailman (input) for mailman id 538122;
 Mon, 22 May 2023 22:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAX1=BL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1DtZ-0006ho-U2
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 22:20:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e65d829f-f8ee-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 00:20:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8911E619F4;
 Mon, 22 May 2023 22:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D60C433D2;
 Mon, 22 May 2023 22:20:44 +0000 (UTC)
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
X-Inumbo-ID: e65d829f-f8ee-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684794045;
	bh=J/cPXQUnTb4WpGkFmVanjp+Ar1eIhUDhY6TNtVq40SY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uNQuv5oxrax8aCnpLa/6t05M4ajzoAKiqANgp5oBmGoR4nWQ304zmuqp5I2E8shOq
	 Bi3xpUZNyR7uPepSmauDMF7jkw7XgKdyrg/TFQsbNy5yQ0W9vD8tlPlyNAGekzt0vO
	 1OSCZlnJ0tw0ywjZkwUjYROWX3DajEjOOxLx3Xgg5IwRp6ezQLZw0dEfIhk3sC0bfU
	 IAhj+BKRTYGt6X89zG8+eukxT5rw1ykOswsVlIEm7I4qOcVWG8SRAQFeyfI74aP818
	 afKB1qrzIKAznaBfLQDNrx5S2Op0WhnQj8qKlqvR2E1P/e/Tv+3+LHtqQ+DprWUdA7
	 uPwy+Yd+eOytw==
Date: Mon, 22 May 2023 15:20:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, 
    marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
In-Reply-To: <ZGig68UTddfEwR6P@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305221520350.1553709@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop> <ZGX/Pvgy3+onJOJZ@Air-de-Roger> <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop> <ZGcu7EWW1cuNjwDA@Air-de-Roger> <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1250537822-1684793996=:1553709"
Content-ID: <alpine.DEB.2.22.394.2305221520000.1553709@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1250537822-1684793996=:1553709
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305221520001.1553709@ubuntu-linux-20-04-desktop>

On Sat, 20 May 2023, Roger Pau Monné wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec2e978a4e6b..0ff8e940fa8d 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       */
>      for_each_pdev ( pdev->domain, tmp )
>      {
> +        if ( !tmp->vpci )
> +        {
> +            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
> +                   &tmp->sbdf, pdev->domain);
> +            continue;
> +        }
> +
>          if ( tmp == pdev )
>          {
>              /*
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 652807a4a454..0baef3a8d3a1 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      unsigned int i;
>      int rc = 0;
>  
> -    if ( !has_vpci(pdev->domain) )
> +    if ( !has_vpci(pdev->domain) ||
> +         /*
> +          * Ignore RO and hidden devices, those are in use by Xen and vPCI
> +          * won't work on them.
> +          */
> +         pci_get_pdev(dom_xen, pdev->sbdf) )
>          return 0;
>  
>      /* We should not get here twice for the same device. */


Now this patch works! Thank you!! :-)

You can check the full logs here
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4329259080

Is the patch ready to be upstreamed aside from the commit message?
--8323329-1250537822-1684793996=:1553709--

