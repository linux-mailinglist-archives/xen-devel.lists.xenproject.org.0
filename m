Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE89F146C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 18:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857072.1269509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM9rP-0003ie-Or; Fri, 13 Dec 2024 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857072.1269509; Fri, 13 Dec 2024 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM9rP-0003fV-MB; Fri, 13 Dec 2024 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 857072;
 Fri, 13 Dec 2024 17:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59wY=TG=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tM9rN-0003fP-Nd
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 17:53:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367abd8c-b97b-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 18:53:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BFDE8A41425;
 Fri, 13 Dec 2024 17:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6830CC4CED0;
 Fri, 13 Dec 2024 17:53:50 +0000 (UTC)
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
X-Inumbo-ID: 367abd8c-b97b-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734112430;
	bh=giLsrBe+eXIr2Z5RCc4V156ArPFV4LhVw7wYhIzIoXE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dsGwzCpsHyKSEp5dYNZqIU7VIPCf1+1BvfLnsNExHvF+KgHEKWxdDya2OH4Yb1KdO
	 xjyNZsn9LGsL+5ubm9YwLy6PfO1o9HHK4GH9HnfKOzJfFxn/wgTn1u4o1aUgnAXEWn
	 GkW8WT5ub+1C8izqxGJm68p92qbUmH0Zz6j12LSWYDuKvCO0PKAmAIFG8J70k4DM58
	 BkmbpSUnFf6MODuN2bFpAw11s14p/2yDMhpzWn6yJuuKNDwnCnEugjbstu3jKrQ4hZ
	 YZx0beo5hpke+CycdWaTs127pteqlLsHIM7BixvuD11GKP+6nU5Tvb5YUerVZXNZPP
	 DkNTiHRBWPZvw==
Date: Fri, 13 Dec 2024 11:53:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	amien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Sanjay R Mehta <sanju.mehta@amd.com>,
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
	xen-devel@lists.xenproject.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: Re: [PATCH v3 09/11] wifi: qtnfmac: use always-managed version of
 pcim_intx()
Message-ID: <20241213175349.GA3421319@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyhvoox9.fsf@kernel.org>

[+cc personal address for Igor]

On Fri, Dec 13, 2024 at 12:30:42PM +0200, Kalle Valo wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> 
> > [cc->to: Igor]
> >
> > On Mon, Dec 09, 2024 at 02:06:31PM +0100, Philipp Stanner wrote:
> >> pci_intx() is a hybrid function which can sometimes be managed through
> >> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> >> port users to either an always-managed or a never-managed version.
> >> 
> >> qtnfmac enables its PCI-Device with pcim_enable_device(). Thus, it needs
> >> the always-managed version.
> >> 
> >> Replace pci_intx() with pcim_intx().
> >> 
> >> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> >> Acked-by: Kalle Valo <kvalo@kernel.org>
> >
> > Hoping for an ack from Igor, too.
> 
> Igor hasn't been around for a while so I'm not expecting see an ack from
> him, I think the whole qtnfmac driver should be removed in the future.
> Feel free to take the patch as is.

Thanks, Kalle, will do.

