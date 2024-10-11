Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A799A56F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817107.1231217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szG35-0005xF-Kg; Fri, 11 Oct 2024 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817107.1231217; Fri, 11 Oct 2024 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szG35-0005uJ-HZ; Fri, 11 Oct 2024 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 817107;
 Fri, 11 Oct 2024 13:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLyP=RH=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1szG33-0005uD-D8
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:51:17 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e9f4b9-87d7-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:51:15 +0200 (CEST)
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:51:12 -0700
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:50:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1szG2d-00000001uKQ-3BlX; Fri, 11 Oct 2024 16:50:51 +0300
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
X-Inumbo-ID: e0e9f4b9-87d7-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728654675; x=1760190675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JZpTFHIOKgsBhrK+TAyqIMe3uV9e4+zAkXpEvbByrtE=;
  b=HKqutVeZR55nptxrYTLJXL+V0HeOiPrueV6HIcWjxQWqSgkJ2ZZhGyQQ
   GcUO5SYvmWadTUCbBR5TLD6NV0JHZci5PyFKVFVgN9sqTkrivEjVs/gTS
   8ghtjxEh2uFF5ewH2EmtVOeeaXshfQgffO8DtJyxl3jOqddVEBZvuzHXq
   N8lCmrBBuKtbBKwnPSS1gzaGgpW9myetFbZsh6u4mmy9EN5g/8LZ+6yGG
   N//33Imh0t5r8Uxz95HpFaqdSD95MeDT/J445G/l9yPdRwoOkUlIqnBQO
   3ouQ1baiDT3856u8qLuN2kz+ipkzLqRZqlK3RYlsaM11PgC9JvDjP9tnx
   Q==;
X-CSE-ConnectionGUID: mEzR2fJjTyCwMgHJI6KdgA==
X-CSE-MsgGUID: Cls/6NqETleIwYLFmfpC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27862193"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="27862193"
X-CSE-ConnectionGUID: +v41otkISg+36h8OYkcGUw==
X-CSE-MsgGUID: Wq59MZX2TDuGSzOxtLCdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76834109"
Date: Fri, 11 Oct 2024 16:50:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Subject: Re: [RFC PATCH 01/13] PCI: Prepare removing devres from pci_intx()
Message-ID: <ZwktO8AUmFEakhVP@smile.fi.intel.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
 <20241009083519.10088-2-pstanner@redhat.com>
 <ZwfnULv2myACxnVb@smile.fi.intel.com>
 <f65e9fa01a1947782fc930876e5f84174408db67.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f65e9fa01a1947782fc930876e5f84174408db67.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 11, 2024 at 02:16:06PM +0200, Philipp Stanner wrote:
> On Thu, 2024-10-10 at 17:40 +0300, Andy Shevchenko wrote:
> > On Wed, Oct 09, 2024 at 10:35:07AM +0200, Philipp Stanner wrote:
> > > pci_intx() is a hybrid function which sometimes performs devres
> > > operations, depending on whether pcim_enable_device() has been used
> > > to
> > > enable the pci_dev. This sometimes-managed nature of the function
> > > is
> > > problematic. Notably, it causes the function to allocate under some
> > > circumstances which makes it unusable from interrupt context.
> > > 
> > > To, ultimately, remove the hybrid nature from pci_intx(), it is
> > > first
> > > necessary to provide an always-managed and a never-managed version
> > > of that function. Then, all callers of pci_intx() can be ported to
> > > the
> > > version they need, depending whether they use pci_enable_device()
> > > or
> > > pcim_enable_device().

> > > An always-managed function exists, namely pcim_intx(), for which
> > > __pcim_intx(), a never-managed version of pci_intx() had been
> > > implemented.
> > 
> > > Make __pcim_intx() a public function under the name
> > > pci_intx_unmanaged(). Make pcim_intx() a public function.

It seems I got confused by these two paragraphs. Why the double underscored
function is even mentioned here?

> > To avoid an additional churn we can make just completely new APIs,
> > namely:
> > pcim_int_x()
> > pci_int_x()
> > 
> > You won't need all dirty dances with double underscored function
> > naming and
> > renaming.
> 
> Ähm.. I can't follow. The new version doesn't use double underscores
> anymore. __pcim_intx() is being removed, effectively.
> After this series, we'd end up with a clean:
> 
> 	pci_intx() <-> pcim_intx()
> 
> just as in the other PCI APIs.

...

> > > +	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
> > > +
> > > +	if (enable)
> > > +		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
> > > +	else
> > > +		new = pci_command | PCI_COMMAND_INTX_DISABLE;
> > > +
> > > +	if (new != pci_command)
> > 
> > I would use positive conditionals as easy to read (yes, a couple of
> > lines
> > longer, but also a win is the indentation and avoiding an additional
> > churn in
> > the future in case we need to add something in this branch.
> 
> I can't follow. You mean:
> 
> if (new == pci_command)
>     return;
> 
> ?
> 
> That's exactly the same level of indentation.

No, the body gets one level off.

> Plus, I just copied the code.
> 
> > > +		pci_write_config_word(pdev, PCI_COMMAND, new);

	if (new == pci_command)
		return;

	pci_write_config_word(pdev, PCI_COMMAND, new);

See the difference?
Also, imaging adding a new code in your case:

	if (new != pci_command)
		pci_write_config_word(pdev, PCI_COMMAND, new);

==>

	if (new != pci_command) {
		...foo...
		pci_write_config_word(pdev, PCI_COMMAND, new);
		...bar...
	}

And in mine:

	if (new == pci_command)
		return;

	...foo...
	pci_write_config_word(pdev, PCI_COMMAND, new);
	...bar...

I hope it's clear now what I meant.

-- 
With Best Regards,
Andy Shevchenko



