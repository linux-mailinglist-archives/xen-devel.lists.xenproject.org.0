Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A961C998A4D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816270.1230471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuV9-0004KO-9j; Thu, 10 Oct 2024 14:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816270.1230471; Thu, 10 Oct 2024 14:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuV9-0004Io-6m; Thu, 10 Oct 2024 14:50:51 +0000
Received: by outflank-mailman (input) for mailman id 816270;
 Thu, 10 Oct 2024 14:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M84p=RG=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1syuV8-0004Ii-1u
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:50:50 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08be84fc-8717-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:50:48 +0200 (CEST)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 07:50:46 -0700
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 07:50:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1syuUj-00000001ZJ4-117L; Thu, 10 Oct 2024 17:50:25 +0300
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
X-Inumbo-ID: 08be84fc-8717-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728571849; x=1760107849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sibCqydeqQiNQIf/lBDGFiiLV6uF5mNsecPlSRVwL9Y=;
  b=K83MERJtQeV8Dat0yDx4V+yHIec0qBTRpV+2FG/Rbjf41BeK8bn+1OsM
   CK1RKwRwOXrO++tB03plmt1T2NyIH7soNFO8kE1rI2UzXui38TJpfkylX
   u9TRHduggsThNwbYzn76ktP3VCfONIM5CLhjSCV8WWoRO5RcoEh5uHXo7
   bIZ8IxTPaPubnGm1VpHo5wi1Vgzh3aRGdpPb3larfCI2ppPiv0bI3uFpE
   TqG/XRneL/jR90o6EucF3VkLf/3+jH6Cd7VbLUOGX77zIUcy9pF4lj9lu
   1amvhlbtV1FBkF3lTxWG6QDEcnIMrIFvSZYXml0Zd8vWlw62GEBlhwkzK
   g==;
X-CSE-ConnectionGUID: 8hatjFnwRNe72v8TFioFhQ==
X-CSE-MsgGUID: ba9fSRszT7ytH++cppjwfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27880004"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27880004"
X-CSE-ConnectionGUID: 7wY/4jxvQLCPgvYMG4Ai+Q==
X-CSE-MsgGUID: 2AQrvW1rQX2PPbhnm34TWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="114082669"
Date: Thu, 10 Oct 2024 17:50:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>, Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>, Hannes Reinecke <hare@suse.de>,
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
Subject: Re: [RFC PATCH 00/13] Remove implicit devres from pci_intx()
Message-ID: <ZwfpsSxnwm7K4eMF@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <8643a212-884c-48de-a2d0-0f068fc49ca2@gmail.com>
 <6468cf3e4a06c008644c98a7a79f81a1c04752b8.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6468cf3e4a06c008644c98a7a79f81a1c04752b8.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 10, 2024 at 10:09:12AM +0200, Philipp Stanner wrote:
> On Wed, 2024-10-09 at 20:32 +0200, Heiner Kallweit wrote:
> > On 09.10.2024 10:35, Philipp Stanner wrote:

...

> > > To do so, a pci_intx() version that is always-managed, and one that
> > > is
> > > never-managed are provided. Then, all pci_intx() users are ported
> > > to the
> > > version they need. Afterwards, pci_intx() can be cleaned up and the
> > > users of the never-managed version be ported back to pci_intx().
> > > 
> > > This way we'd get this PCI API consistent again.
> > > 
> > AFAICS pci_intx() is used only by drivers which haven't been
> > converted
> > to the pci_alloc_irq_vectors() API yet. Wouldn't it be better to do
> > this
> > instead of trying to improve pci_intx()?

My first impression was the same...

> This would be the créme-de-la-créme-solution, yes.
> 
> But such a portation would require more detailed knowledge of the old
> drivers.
> 
> In this discussion, Alex points out that at least in some drivers, you
> can't replace pci_intx() without further ado:
> https://lore.kernel.org/all/20240904151020.486f599e.alex.williamson@redhat.com/
> 
> What we could do is mark pci_intx() and pcim_intx() as deprecated and
> point everyone to pci_alloc_irq_vectors(). Then someone can look into
> porting the old drivers at some point in the future.

...but here I got the point by Philipp.

-- 
With Best Regards,
Andy Shevchenko



