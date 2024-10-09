Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFD9965A6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814079.1227168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syT9i-0004p0-Q9; Wed, 09 Oct 2024 09:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814079.1227168; Wed, 09 Oct 2024 09:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syT9i-0004mz-My; Wed, 09 Oct 2024 09:38:54 +0000
Received: by outflank-mailman (input) for mailman id 814079;
 Wed, 09 Oct 2024 09:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xjLg=RF=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1syT9g-0004lz-Uc
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:38:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49eb39bf-8622-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:38:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CEFEA43CA0;
 Wed,  9 Oct 2024 09:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B808BC4CEC5;
 Wed,  9 Oct 2024 09:38:47 +0000 (UTC)
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
X-Inumbo-ID: 49eb39bf-8622-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728466728;
	bh=Jw9m9MFXObg+vZ7wq05G3wqyWtyj3AK1eBeQfJJK90U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcLymq+hoDLhN3h3N8nHp58BgFOa4jDynBqk5dzipxHtlbGOU9EoJHZr1xWIGUvqd
	 1/8BzU9GNB5AWykOOa82//nU/OkQpZ2Tl07ETsLRXZZMd4MYEMeaOwuFdvt3dbdEkn
	 E0Fd5uSJFrxi3J4FjD1qWeIfBp1sHnDUf7i3tpjk=
Date: Wed, 9 Oct 2024 11:38:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Alex Dubov <oakad@yahoo.com>,
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
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org
Subject: Re: [RFC PATCH 10/13] staging: rts5280: Use always-managed version
 of pci_intx()
Message-ID: <2024100936-brunette-flannels-0d82@gregkh>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-11-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009083519.10088-11-pstanner@redhat.com>

On Wed, Oct 09, 2024 at 10:35:16AM +0200, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> rts5208 enables its PCI-Device with pcim_enable_device(). Thus, it needs the
> always-managed version.
> 
> Replace pci_intx() with pcim_intx().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/staging/rts5208/rtsx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

