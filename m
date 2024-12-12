Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A79EFC73
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 20:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856320.1268985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLopg-0000NF-6S; Thu, 12 Dec 2024 19:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856320.1268985; Thu, 12 Dec 2024 19:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLopg-0000L9-2t; Thu, 12 Dec 2024 19:26:44 +0000
Received: by outflank-mailman (input) for mailman id 856320;
 Thu, 12 Dec 2024 19:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Huoe=TF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tLope-0000Kv-AN
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 19:26:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 031ed518-b8bf-11ef-a0d6-8be0dac302b0;
 Thu, 12 Dec 2024 20:26:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61C5BA42A34;
 Thu, 12 Dec 2024 19:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE3DC4CECE;
 Thu, 12 Dec 2024 19:26:39 +0000 (UTC)
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
X-Inumbo-ID: 031ed518-b8bf-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734031599;
	bh=GY8df68Vpq13zRfn9lQiZuhcp6ZPERGYWUjygEgKyfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nq8DebfnKz6oRj40JuP2b63VJxYs2cK7koMQE4wqMV6qD2csMUAgK5AzSgqwbBYEL
	 u9euMyyzqa7e7GkjVAp6yQfo1AZ2Co8EJsXQ4Tm39YjgSAGT4PgrOZSOipNdus0wWP
	 5jEOuPBPs1+JKN2ABFGyBe3bAHjHJXDBdMubHDqVFWJ7Vy1RPqX8Fa+BwvWlMEiPRP
	 qSJu+l8/ulTi3y9AwZpqtrLG6q55HekV8WDMGP0u1YdCkLSXeeoiRpw137PWbZFSeR
	 0v5Q/aRW85aEzTfeInJqQ6lZPduXCDaQWJCKCHPvbJoZteMnM1UyL4vc31qeB26R6X
	 PJXIBsPc6+D8Q==
Date: Thu, 12 Dec 2024 13:26:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>
Cc: amien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
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
Subject: Re: [PATCH v3 05/11] misc: Use never-managed version of pci_intx()
Message-ID: <20241212192637.GA3359920@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209130632.132074-7-pstanner@redhat.com>

[cc->to: Arnd, Greg, Alex]

On Mon, Dec 09, 2024 at 02:06:27PM +0100, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> cardreader/rtsx_pcr.c and tifm_7xx1.c enable their PCI-Device with
> pci_enable_device(). Thus, they need the never-managed version.
> 
> Replace pci_intx() with pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Looking for ack from Arnd, Greg, Alex.

> ---
>  drivers/misc/cardreader/rtsx_pcr.c | 2 +-
>  drivers/misc/tifm_7xx1.c           | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
> index be3d4e0e50cc..e25e6d560dd7 100644
> --- a/drivers/misc/cardreader/rtsx_pcr.c
> +++ b/drivers/misc/cardreader/rtsx_pcr.c
> @@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
>  	}
>  
>  	pcr->irq = pcr->pci->irq;
> -	pci_intx(pcr->pci, !pcr->msi_en);
> +	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
>  
>  	return 0;
>  }
> diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
> index 1d54680d6ed2..5f9c7ccae8d2 100644
> --- a/drivers/misc/tifm_7xx1.c
> +++ b/drivers/misc/tifm_7xx1.c
> @@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
>  		goto err_out;
>  	}
>  
> -	pci_intx(dev, 1);
> +	pci_intx_unmanaged(dev, 1);
>  
>  	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
>  				? 4 : 2, &dev->dev);
> @@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
>  err_out_free:
>  	tifm_free_adapter(fm);
>  err_out_int:
> -	pci_intx(dev, 0);
> +	pci_intx_unmanaged(dev, 0);
>  	pci_release_regions(dev);
>  err_out:
>  	if (!pci_dev_busy)
> @@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
>  		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
>  
>  	iounmap(fm->addr);
> -	pci_intx(dev, 0);
> +	pci_intx_unmanaged(dev, 0);
>  	pci_release_regions(dev);
>  
>  	pci_disable_device(dev);
> -- 
> 2.47.1
> 

