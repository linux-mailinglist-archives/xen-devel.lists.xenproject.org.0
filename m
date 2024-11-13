Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E89C78BA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835895.1251756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBG8r-0006kn-2m; Wed, 13 Nov 2024 16:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835895.1251756; Wed, 13 Nov 2024 16:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBG8r-0006j6-05; Wed, 13 Nov 2024 16:22:53 +0000
Received: by outflank-mailman (input) for mailman id 835895;
 Wed, 13 Nov 2024 16:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEOK=SI=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tBG8p-0006j0-Ji
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:22:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8593f02b-a1db-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 17:22:48 +0100 (CET)
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
X-Inumbo-ID: 8593f02b-a1db-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5My4xNDIuNDMuNTUiLCJoZWxvIjoiZ2Fsb2lzLmxpbnV0cm9uaXguZGUifQ==
X-Custom-Transaction: eyJpZCI6Ijg1OTNmMDJiLWExZGItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTE0OTY4LjczNTQxLCJzZW5kZXIiOiJ0Z2x4QGxpbnV0cm9uaXguZGUiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731514966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3k8+NXf0XqcxSDVGHG1zcPA7gqnuYQaT+ExzotBYqus=;
	b=2p1i5424l/Mw2o1go3eZuRlhLFfLu7r8KKASlGO/YPpkQZDBas2eHSNplLNLapYA8yDFgN
	WCGwOvmnq1Y70YHVSNHcUfBoLXYw7St3krtFkCIvDFofEHsEFJI/tUmpthMj5822ePeIjp
	ifMBL3OrlRi7yqyJVRpmbh0L7A1joJRZ4KnuDr5zlN46fN8Dou/rizXBUid26Zy+obL29T
	Cyh07HAwKRIA8BddfyqNCGPoDLMe7kZNM3/4oUePcYUpjpZZSqveBKZGaoen8IK4gL1hrB
	cLsa/ZQU5GMMglVK24fX2nMABPE7beIyU3V/10IGN6wc7T/52pLz94BPzzuPww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731514966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3k8+NXf0XqcxSDVGHG1zcPA7gqnuYQaT+ExzotBYqus=;
	b=2/sBlyjXN5KrpH5yo+sPPoE1Vj7RMOF2OIGTxhk0XidvUTXq9URTcJn7IcLDz/JowTbjmq
	2LOMU1e9sNdrRBDg==
To: Philipp Stanner <pstanner@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave
 Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Alex Williamson
 <alex.williamson@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Philipp Stanner <pstanner@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni
 <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>, Kevin Tian
 <kevin.tian@intel.com>, Mostafa Saleh <smostafa@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kunwu Chan
 <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>, Christian Brauner
 <brauner@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/11] Remove devres from pci_intx()
In-Reply-To: <20241113124158.22863-13-pstanner@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
 <20241113124158.22863-13-pstanner@redhat.com>
Date: Wed, 13 Nov 2024 17:22:45 +0100
Message-ID: <87msi3ksru.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 13 2024 at 13:41, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. This hybrid nature is undesirable.
>
> Since all users of pci_intx() have by now been ported either to
> always-managed pcim_intx() or never-managed pci_intx_unmanaged(), the
> devres functionality can be removed from pci_intx().
>
> Consequently, pci_intx_unmanaged() is now redundant, because pci_intx()
> itself is now unmanaged.
>
> Remove the devres functionality from pci_intx(). Have all users of
> pci_intx_unmanaged() call pci_intx(). Remove pci_intx_unmanaged().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/misc/cardreader/rtsx_pcr.c            |  2 +-
>  drivers/misc/tifm_7xx1.c                      |  6 +--
>  .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  2 +-
>  drivers/net/ethernet/brocade/bna/bnad.c       |  2 +-
>  drivers/ntb/hw/amd/ntb_hw_amd.c               |  4 +-
>  drivers/ntb/hw/intel/ntb_hw_gen1.c            |  2 +-
>  drivers/pci/devres.c                          |  4 +-
>  drivers/pci/msi/api.c                         |  2 +-
>  drivers/pci/msi/msi.c                         |  2 +-
>  drivers/pci/pci.c                             | 43 +------------------
>  drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>  drivers/vfio/pci/vfio_pci_intrs.c             | 10 ++---
>  drivers/xen/xen-pciback/conf_space_header.c   |  2 +-
>  include/linux/pci.h                           |  1 -
>  14 files changed, 22 insertions(+), 62 deletions(-)

Now I'm utterly confused. This undoes the pci_intx_unmanaged() churn
which you carefully split into several patches first.

So the net change is that:

   1) pci_intx() is now always unmanaged

   2) a couple of drivers use pcim_intx() now instead of pci_intx()

The obvious ordering is:

   1) Convert the drivers which need the managed version to use
      pcim_intx()

   2) Remove the managed warning in pci_intx() and clean up the comment

   3) Remove __pcim_intx() and invoke pci_intx() in the devres code.

No?

Thanks,

        tglx

