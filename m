Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1C99816A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815846.1230077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syp5C-0004gj-Dy; Thu, 10 Oct 2024 09:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815846.1230077; Thu, 10 Oct 2024 09:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syp5C-0004fD-BF; Thu, 10 Oct 2024 09:03:42 +0000
Received: by outflank-mailman (input) for mailman id 815846;
 Thu, 10 Oct 2024 09:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp/E=RG=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1syp5A-0004f7-VR
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:03:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d47b11-86e6-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 11:03:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 308DA5C5FC5;
 Thu, 10 Oct 2024 09:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CC3C4CEC5;
 Thu, 10 Oct 2024 09:03:35 +0000 (UTC)
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
X-Inumbo-ID: 89d47b11-86e6-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728551016;
	bh=qIga4ENKvNDSpomy+u9cYcJeIt2znVA3OvUMUn8Vt00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ma16Iqar46lFxN+U2JAe5vdwsOfrFSCv51iNGmJlzaeAsMcNWERh9kaZfcgmAlIsn
	 7oz09EjJd/j2moVcv8Qezht0w8lMm2GuIu9huksqREaTjb8+PZCZvolwVMZIoA3XXU
	 MiZzJ+yW2KdX7Yc9d7XcuMS6Gb4qyxLjxlOU9iVM=
Date: Thu, 10 Oct 2024 11:03:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
Message-ID: <2024101006-chump-image-e65c@gregkh>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-11-pstanner@redhat.com>
 <2024100936-brunette-flannels-0d82@gregkh>
 <411f3c94-58b5-471e-bc58-e23d89d2078f@gmail.com>
 <b57dbf0c83125d58e4e2b488b5b5f71410fd8d6a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b57dbf0c83125d58e4e2b488b5b5f71410fd8d6a.camel@redhat.com>

On Thu, Oct 10, 2024 at 10:03:30AM +0200, Philipp Stanner wrote:
> On Wed, 2024-10-09 at 21:41 +0200, Philipp Hortmann wrote:
> > On 10/9/24 11:38, Greg Kroah-Hartman wrote:
> > > On Wed, Oct 09, 2024 at 10:35:16AM +0200, Philipp Stanner wrote:
> > > > pci_intx() is a hybrid function which can sometimes be managed
> > > > through
> > > > devres. To remove this hybrid nature from pci_intx(), it is
> > > > necessary to
> > > > port users to either an always-managed or a never-managed
> > > > version.
> > > > 
> > > > rts5208 enables its PCI-Device with pcim_enable_device(). Thus,
> > > > it needs the
> > > > always-managed version.
> > > > 
> > > > Replace pci_intx() with pcim_intx().
> > > > 
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > >   drivers/staging/rts5208/rtsx.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > 
> > 
> > Hi Philipp,
> > 
> > this driver (rts5208) will be removed soon - patch is send in.
> > 
> > Discussion about removal:
> > https://lore.kernel.org/linux-staging/2024100943-shank-washed-a765@gregkh/T/#t
> 
> 
> Alright, thx for the heads up.
> 
> I'm not entirely how best to deal with that, though. I could drop this
> patch, but then the driver would end up with an unmanaged pci_intx().
> 
> Might this be a problem for users if my series lands sooner than the
> removal, say in v6.13 and your removal in v6.14?

The removal will happen in 6.13, I'm going to be queueing it up right
now.

thanks,

greg k-h

