Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B79EFC50
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 20:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856288.1268955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLokZ-0006Tw-7S; Thu, 12 Dec 2024 19:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856288.1268955; Thu, 12 Dec 2024 19:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLokZ-0006RL-3w; Thu, 12 Dec 2024 19:21:27 +0000
Received: by outflank-mailman (input) for mailman id 856288;
 Thu, 12 Dec 2024 19:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Huoe=TF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tLokX-0006R7-VY
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 19:21:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 456b4b15-b8be-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 20:21:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70AFA5C69F5;
 Thu, 12 Dec 2024 19:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DA5C4CECE;
 Thu, 12 Dec 2024 19:21:20 +0000 (UTC)
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
X-Inumbo-ID: 456b4b15-b8be-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734031280;
	bh=7jTnse7IuWHCGd/Dl0nDYQ1TbdJrSYaJ37r4en1LiKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Jsm8J74CeCOSQX2TAidV+m7FZS6ULNXQzhXeWkuv5iEzrUHcg8znyVLdxbxRPru+9
	 VTNtp1UpRC4YYL3KINlGq6Rm3mDmwWUjLlcvFtcaDdm/sMMc8jL3Lt6IP5xBBVa4uN
	 g6rp1AYKrZau2/lQVHaCgwMigVCU6RnvH5h7xgx9CXno8P90z+4zZDJzkW2VTv9vLB
	 2v8zIQ6uOpGnT4DsGys0y1UkWGeCS95G+7B8sB3FnS30uNrBNXakIEsYRc31wuk1wU
	 pMewcBUam+M54kZf6oMYeSKDOO0eQTk9gVUDIBiga7Z+z4SFYtDLeKSArBCBnotXnd
	 YNml6TBS6OcqA==
Date: Thu, 12 Dec 2024 13:21:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: amien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/11] Remove implicit devres from pci_intx()
Message-ID: <20241212192118.GA3359591@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209130632.132074-2-pstanner@redhat.com>

On Mon, Dec 09, 2024 at 02:06:22PM +0100, Philipp Stanner wrote:
> @Driver-Maintainers: Your driver might be touched by patch "Remove
> devres from pci_intx()". You might want to take a look.
> 
> Changes in v3:
>   - Add Thomas' RB.
> 
> Changes in v2:
>   - Drop pci_intx() deprecation patch.
>   - ata: Add RB from Sergey and Niklas.
>   - wifi: Add AB by Kalle.
>   - Drop INTx deprecation patch
>   - Drop ALSA / hda_intel patch because pci_intx() was removed from
>     there in the meantime.
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

Applied the ones with maintainer acks to pci/devres for v6.14, thanks!

I'll poke the ones that haven't been acked yet.

> Philipp Stanner (11):
>   PCI: Prepare removing devres from pci_intx()
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
> 
>  drivers/ata/ahci.c                            |  2 +-
>  drivers/ata/ata_piix.c                        |  2 +-
>  drivers/ata/pata_rdc.c                        |  2 +-
>  drivers/ata/sata_sil24.c                      |  2 +-
>  drivers/ata/sata_sis.c                        |  2 +-
>  drivers/ata/sata_uli.c                        |  2 +-
>  drivers/ata/sata_vsc.c                        |  2 +-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 ++--
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  2 +-
>  .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  2 +-
>  drivers/pci/devres.c                          | 24 +++----------------
>  drivers/pci/pci.c                             | 16 +++----------
>  include/linux/pci.h                           |  1 +
>  13 files changed, 18 insertions(+), 45 deletions(-)
> 
> -- 
> 2.47.1
> 

