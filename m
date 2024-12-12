Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B59EFC4D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 20:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856289.1268965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLokj-0006pT-EH; Thu, 12 Dec 2024 19:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856289.1268965; Thu, 12 Dec 2024 19:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLokj-0006mq-B1; Thu, 12 Dec 2024 19:21:37 +0000
Received: by outflank-mailman (input) for mailman id 856289;
 Thu, 12 Dec 2024 19:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Huoe=TF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tLokh-0006R7-Jy
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 19:21:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c1b8854-b8be-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 20:21:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 13684A42A1B;
 Thu, 12 Dec 2024 19:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF63AC4CECE;
 Thu, 12 Dec 2024 19:21:31 +0000 (UTC)
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
X-Inumbo-ID: 4c1b8854-b8be-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734031292;
	bh=IbIwv1jGi3ADBtK60JNsHHHrXo2ysodiR7fOfGgUVZU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=X7Ww+fY+bDJtf3JxD/fNdF9zPIqj7pIGW/Dr+8Hy8zeOUa7vem/i36jiSgi47zLR3
	 YpC9QVHuv7/PiiXwbFbJuD7PWiQvUm4tLZL89I7y6drN/IISf9C/h2IC7qJcgPOCYO
	 TnykuuOqWi0PRGE6pVEOPgNxJnBWWG52IOH275lcGsYtS8MPZd1Ks1XKaW1+ryZtpO
	 IXw35zDUnBs6v/FBtZoqMaTrIZOPnPE0vABs8PZYyW8Z8fcrhs9GihaNd+TgvR5kYJ
	 gFO04DIRnzP1eI07UKaDS8MVDbssUZ/lDF97BIT7ZiYJkn87B953qsx+t4Wp9qf70X
	 d8haM3Qwmd07Q==
Date: Thu, 12 Dec 2024 13:21:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
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
Subject: Re: [PATCH v3 06/11] vfio/pci: Use never-managed version of
 pci_intx()
Message-ID: <20241212192130.GA3359535@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209130632.132074-8-pstanner@redhat.com>

[cc->to: Alex W]

On Mon, Dec 09, 2024 at 02:06:28PM +0100, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> vfio enables its PCI-Device with pci_enable_device(). Thus, it
> needs the never-managed version.
> 
> Replace pci_intx() with pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Not applied yet, pending ack from Alex.

> ---
>  drivers/vfio/pci/vfio_pci_core.c  |  2 +-
>  drivers/vfio/pci/vfio_pci_intrs.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 1ab58da9f38a..90240c8d51aa 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -498,7 +498,7 @@ int vfio_pci_core_enable(struct vfio_pci_core_device *vdev)
>  		if (vfio_pci_nointx(pdev)) {
>  			pci_info(pdev, "Masking broken INTx support\n");
>  			vdev->nointx = true;
> -			pci_intx(pdev, 0);
> +			pci_intx_unmanaged(pdev, 0);
>  		} else
>  			vdev->pci_2_3 = pci_intx_mask_supported(pdev);
>  	}
> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> index 8382c5834335..40abb0b937a2 100644
> --- a/drivers/vfio/pci/vfio_pci_intrs.c
> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> @@ -118,7 +118,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
>  	 */
>  	if (unlikely(!is_intx(vdev))) {
>  		if (vdev->pci_2_3)
> -			pci_intx(pdev, 0);
> +			pci_intx_unmanaged(pdev, 0);
>  		goto out_unlock;
>  	}
>  
> @@ -132,7 +132,7 @@ static bool __vfio_pci_intx_mask(struct vfio_pci_core_device *vdev)
>  		 * mask, not just when something is pending.
>  		 */
>  		if (vdev->pci_2_3)
> -			pci_intx(pdev, 0);
> +			pci_intx_unmanaged(pdev, 0);
>  		else
>  			disable_irq_nosync(pdev->irq);
>  
> @@ -178,7 +178,7 @@ static int vfio_pci_intx_unmask_handler(void *opaque, void *data)
>  	 */
>  	if (unlikely(!is_intx(vdev))) {
>  		if (vdev->pci_2_3)
> -			pci_intx(pdev, 1);
> +			pci_intx_unmanaged(pdev, 1);
>  		goto out_unlock;
>  	}
>  
> @@ -296,7 +296,7 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
>  	 */
>  	ctx->masked = vdev->virq_disabled;
>  	if (vdev->pci_2_3) {
> -		pci_intx(pdev, !ctx->masked);
> +		pci_intx_unmanaged(pdev, !ctx->masked);
>  		irqflags = IRQF_SHARED;
>  	} else {
>  		irqflags = ctx->masked ? IRQF_NO_AUTOEN : 0;
> @@ -569,7 +569,7 @@ static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
>  	 * via their shutdown paths.  Restore for NoINTx devices.
>  	 */
>  	if (vdev->nointx)
> -		pci_intx(pdev, 0);
> +		pci_intx_unmanaged(pdev, 0);
>  
>  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
>  }
> -- 
> 2.47.1
> 

