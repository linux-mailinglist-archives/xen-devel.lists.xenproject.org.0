Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D96BA3AE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 00:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509860.786481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcEHn-00081f-CS; Tue, 14 Mar 2023 23:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509860.786481; Tue, 14 Mar 2023 23:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcEHn-0007z7-9i; Tue, 14 Mar 2023 23:42:31 +0000
Received: by outflank-mailman (input) for mailman id 509860;
 Tue, 14 Mar 2023 23:42:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhUS=7G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcEHl-0007z1-Sw
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 23:42:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8155ff-c2c1-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 00:42:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66BA961A78;
 Tue, 14 Mar 2023 23:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293D4C433D2;
 Tue, 14 Mar 2023 23:42:22 +0000 (UTC)
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
X-Inumbo-ID: df8155ff-c2c1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678837343;
	bh=8RokshSlerMaBbb48OF1+nFKF+sW54jjygpYtaH5iMI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QLT8LXxaAIuDeRpJrq9mtgpwgSiE8MpCW5tvEvzJh2AXChznXOW6ATwT/ga8s4LgP
	 h1XkZHPsx7f6lr+Kllgqrfb5dmdlBO4kT+u9cOcfg1wzwnmbPR2SpOTf13s1yrFw72
	 VjuaNQYWwxP02REuz9qYmyOwfrZT0RiP4rgdD0vFolD0Z+Ivl86EHFdUcTseko5CLc
	 k3syLVtxv8fHrbjCsYNA+HMx35e2dQqPhhJCMpiAr/1LpbNGoy9NN7S/putognzPzs
	 +bE/5gI60jkJpAw6F0JjQypQkClvtr/pjz47yJ3U/vnIWKvlaEU/r7bAPQ92KaHFd+
	 ebRMFheIETEnA==
Date: Tue, 14 Mar 2023 16:42:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
cc: Huang Rui <ray.huang@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Alex Deucher <alexander.deucher@amd.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
    Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
In-Reply-To: <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303141639130.863724@ubuntu-linux-20-04-desktop>
References: <20230312075455.450187-1-ray.huang@amd.com> <20230312075455.450187-3-ray.huang@amd.com> <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com> <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-128641958-1678837343=:863724"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-128641958-1678837343=:863724
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Mar 2023, Christian König wrote:
> Am 13.03.23 um 08:23 schrieb Christian König:
> > Am 12.03.23 um 08:54 schrieb Huang Rui:
> > > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > > 
> > > When dom0 is PVH and we want to passthrough gpu to guest,
> > > we should allow BAR writes even through BAR is mapped. If
> > > not, the value of BARs are not initialized when guest firstly
> > > start.
> > > 
> > > Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> > > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > > ---
> > >   xen/drivers/vpci/header.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> > > index ec2e978a4e..918d11fbce 100644
> > > --- a/xen/drivers/vpci/header.c
> > > +++ b/xen/drivers/vpci/header.c
> > > @@ -392,7 +392,7 @@ static void cf_check bar_write(
> > >        * Xen only cares whether the BAR is mapped into the p2m, so allow
> > > BAR
> > >        * writes as long as the BAR is not mapped into the p2m.
> > >        */
> > > -    if ( bar->enabled )
> > > +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> > 
> > Checkpath.pl gives here:
> > 
> > ERROR: space prohibited after that open parenthesis '('
> > #115: FILE: xen/drivers/vpci/header.c:395:
> > +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> 
> But I should probably mention that I'm not 100% sure if this code base uses
> kernel coding style!

Hi Christian,

Thanks for taking a look at these patches! For better or for worse Xen
follows a different coding style from the Linux kernel (see CODING_STYLE
under xen.git).  In Xen we use:

    if ( rc != 0 ) 
    {
        return rc;
    }
--8323329-128641958-1678837343=:863724--

