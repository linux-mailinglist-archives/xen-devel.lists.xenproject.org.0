Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6A708D7C
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 03:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536637.835153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzpCu-00071h-5H; Fri, 19 May 2023 01:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536637.835153; Fri, 19 May 2023 01:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzpCu-0006zw-00; Fri, 19 May 2023 01:47:00 +0000
Received: by outflank-mailman (input) for mailman id 536637;
 Fri, 19 May 2023 01:46:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sk0S=BI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzpCs-0006zq-RF
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 01:46:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0966dd9b-f5e7-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 03:46:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA471652CD;
 Fri, 19 May 2023 01:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A58AC433D2;
 Fri, 19 May 2023 01:46:54 +0000 (UTC)
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
X-Inumbo-ID: 0966dd9b-f5e7-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684460815;
	bh=bcUly72PDa+s+h9TKc25Y8B9YjfC6eEFUcRDf3u8aa8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hbUeXdf1ZuLbFOTgRYBBKo9jx9E37qk0bA/OFKFNtifgifstixYPChl9IbTzxOBge
	 lHgMVqO39YdMTiutJ9JxH8oCJ+6FbzhMVB73jC9CH1mlZqNdW+pxZtQbcpvfUE+u7u
	 7Q/svKuhOAGZftdMx10eaNqHimQfqexOOJfbzdDfj8gSmYIysDpVaN1mbXvDITQwf0
	 iD6rGRb4Nb1/qisDL9UKLpaSJkp9hQfLMfaHD3XxblyAvGeaU2N/hhyU95tE8aktoo
	 MHFftyhC4i8tSKZh5NJ9VxbPCZo63ho76bc93uixcsPT3rHM5xoVjlrYu+LnLa97h7
	 3pUDkV6Ctk9+A==
Date: Thu, 18 May 2023 18:46:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, 
    marmarek@invisiblethingslab.com, xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
In-Reply-To: <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop> <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-461541215-1684457310=:128889"
Content-ID: <alpine.DEB.2.22.394.2305181748310.128889@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-461541215-1684457310=:128889
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305181748311.128889@ubuntu-linux-20-04-desktop>

On Thu, 18 May 2023, Roger Pau Monné wrote:
> On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> > Hi all,
> > 
> > I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> > test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> > Zen3 system and we already have a few successful tests with it, see
> > automation/gitlab-ci/test.yaml.
> > 
> > We managed to narrow down the issue to a console problem. We are
> > currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> > options, it works with PV Dom0 and it is using a PCI UART card.
> > 
> > In the case of Dom0 PVH:
> > - it works without console=com1
> > - it works with console=com1 and with the patch appended below
> > - it doesn't work otherwise and crashes with this error:
> > https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> 
> Jan also noticed this, and we have a ticket for it in gitlab:
> 
> https://gitlab.com/xen-project/xen/-/issues/85
> 
> > What is the right way to fix it?
> 
> I think the right fix is to simply avoid hidden devices from being
> handled by vPCI, in any case such devices won't work propewrly with
> vPCI because they are in use by Xen, and so any cached information by
> vPCI is likely to become stable as Xen can modify the device without
> vPCI noticing.
> 
> I think the chunk below should help.  It's not clear to me however how
> hidden devices should be handled, is the intention to completely hide
> such devices from dom0?

I like the idea but the patch below still failed:

(XEN) Xen call trace:
(XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0x2b3/0x44d
(XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2ca/0x372
(XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
(XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one_hwdom_device+0x73/0x97
(XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x63/0x15b
(XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
(XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
(XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xd4/0xdd
(XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
(XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
(XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
(XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
(XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0

I haven't managed to figure out why yet.


> --- 
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

i
--8323329-461541215-1684457310=:128889--

