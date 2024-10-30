Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BA9B6FCC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 23:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828423.1243291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6H0d-00081g-5W; Wed, 30 Oct 2024 22:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828423.1243291; Wed, 30 Oct 2024 22:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6H0d-0007zA-2o; Wed, 30 Oct 2024 22:17:47 +0000
Received: by outflank-mailman (input) for mailman id 828423;
 Wed, 30 Oct 2024 22:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sgq=R2=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1t6H0b-0007yl-FD
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 22:17:45 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73ae9c3-970c-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 23:17:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B8A0A4362E;
 Wed, 30 Oct 2024 22:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3913FC4CECE;
 Wed, 30 Oct 2024 22:17:39 +0000 (UTC)
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
X-Inumbo-ID: c73ae9c3-970c-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImM3M2FlOWMzLTk3MGMtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzI2NjYyLjAwNjA4Miwic2VuZGVyIjoiaGVsZ2Fhc0BrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730326659;
	bh=hmCcTNJwyZk0ee56ytBk9i4eOtptK5uTArpnChQPbzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oGnfP7ArKKdfSdgdnkKr7SkEnhwI4nY+JGypMiyscKrSh2koWdUM4bEIYHcoVRtmA
	 HuGtZd7+EhsSZKGsSElcy0Ekf1Ww0XJz+CC/k+Lyv93Pjy1sctZPVHq2ye34KwR2cM
	 BK6k4mDq37WcoKSeIdS6Dykd1seb3K6MaOqwt7pucQeiJF9BIdqo96G1NTsjD7AK/F
	 RSMAKuBU3/553ttm2CAep19cPgSP8wuqNrGnio71malobZI2XoVqqJ3i5mKV/tHQzD
	 b+pchDCDpw/vI+Q3mqbdXkWdGIm9PhoPKYSd9frqB8SQkOwkBxe7BOOJjjYvM4WuEB
	 3GNefMYxm1CyQ==
Date: Wed, 30 Oct 2024 17:17:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/13] Remove implicit devres from pci_intx()
Message-ID: <20241030221737.GA1223682@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>

On Tue, Oct 15, 2024 at 08:51:10PM +0200, Philipp Stanner wrote:
> @Driver-Maintainers: Your driver might be touched by patch "Remove
> devres from pci_intx()". You might want to take a look.
> 
> Changes since the RFC [1]:
>   - Add a patch deprecating pci{m}_intx(). (Heiner, Andy, Me)
>   - Add Acked-by's already given.
>   - Export pcim_intx() as a GPL function. (Alex)
>   - Drop patch for rts5280, since this driver will be removed quite
>     soon. (Philipp Hortmann, Greg)
>   - Use early-return in pci_intx_unmanaged() and pci_intx(). (Andy)
> 
> Hi all,
> 
> this series removes a problematic feature from pci_intx(). That function
> sometimes implicitly uses devres for automatic cleanup. We should get
> rid of this implicit behavior.
> 
> To do so, a pci_intx() version that is always-managed, and one that is
> never-managed are provided. Then, all pci_intx() users are ported to the
> version they need. Afterwards, pci_intx() can be cleaned up and the
> users of the never-managed version be ported back to pci_intx().
> 
> This way we'd get this PCI API consistent again.
> 
> Patch "Remove devres from pci_intx()" obviously reverts the previous
> patches that made drivers use pci_intx_unmanaged(). But this way it's
> easier to review and approve. It also makes sure that each checked out
> commit should provide correct behavior, not just the entire series as a
> whole.
> 
> Merge plan for this is to enter through the PCI tree.
> 
> [1] https://lore.kernel.org/all/20241009083519.10088-1-pstanner@redhat.com/

I *think* this series depends on resolution of Takashi's "Restore the
original INTX_DISABLE bit by pcim_intx()" patch [2], right?

For now I'm postponing this series, but let me know if that's not the
right thing.

[2] https://lore.kernel.org/r/20241024155539.19416-1-tiwai@suse.de

> Philipp Stanner (13):
>   PCI: Prepare removing devres from pci_intx()
>   ALSA: hda_intel: Use always-managed version of pcim_intx()
>   drivers/xen: Use never-managed version of pci_intx()
>   net/ethernet: Use never-managed version of pci_intx()
>   net/ntb: Use never-managed version of pci_intx()
>   misc: Use never-managed version of pci_intx()
>   vfio/pci: Use never-managed version of pci_intx()
>   PCI: MSI: Use never-managed version of pci_intx()
>   ata: Use always-managed version of pci_intx()
>   wifi: qtnfmac: use always-managed version of pcim_intx()
>   HID: amd_sfh: Use always-managed version of pcim_intx()
>   Remove devres from pci_intx()
>   PCI: Deprecate pci_intx(), pcim_intx()
> 
>  drivers/ata/ahci.c                            |  2 +-
>  drivers/ata/ata_piix.c                        |  2 +-
>  drivers/ata/pata_rdc.c                        |  2 +-
>  drivers/ata/sata_sil24.c                      |  2 +-
>  drivers/ata/sata_sis.c                        |  2 +-
>  drivers/ata/sata_uli.c                        |  2 +-
>  drivers/ata/sata_vsc.c                        |  2 +-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +--
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
>  .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
>  drivers/pci/devres.c                          | 29 +++++--------------
>  drivers/pci/pci.c                             | 19 ++++--------
>  include/linux/pci.h                           |  1 +
>  sound/pci/hda/hda_intel.c                     |  2 +-
>  14 files changed, 26 insertions(+), 47 deletions(-)
> 
> -- 
> 2.47.0
> 

